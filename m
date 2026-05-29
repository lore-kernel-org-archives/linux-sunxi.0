Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91052FE074
	for <linux-sunxi@lists.linux.dev>; Fri, 29 May 2026 08:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780044172; cv=none; b=IgwLThvQYWABJNxg9Df7cXrI7OsOvQXFkv44V5fjjhkHFudadBl0ip3Ly7WsiCWJTCWMyaZWOVhx63ImoPtEC5Hf8mPUYsVjaBymtrcu2ph4DiPsBuwadB61hPE2csyMe+08Gq0xtBmxoemamjfal7F30k+Bq4zyqChYZeOVeyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780044172; c=relaxed/simple;
	bh=HFTJR2Xacst2SVq8TQ2oPfjpn4ZXMvTkY45PdTQhIzY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZBm89V65gobRWvL8nT0wFFNph2MVTH9vH7Sh+8lnjx11BKhh8xbZrR1GUAgUwKLnvVCZTLbylOeDxVOEHS7ZL9bkS9Q82hcQCgMB+OMNYr/oPqoz2sKxY/ZQrLCgsJWYBgt4UYwoy2fj2B0D/hdKI3vSYQLKOyQc9TkE8xwoQEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MXuSvvQY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MXuSvvQY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 329531F00893;
	Fri, 29 May 2026 08:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780044171;
	bh=dDWj4xyywXTQ4EbBY1G/U3IBaI1nCSzvbGbtZLxYI2Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MXuSvvQYtM50S9nrDZRQiRaT5blGrhDJsL+GQJ6U8oCdoAJHr+p9Kh4AFaBLyPXQo
	 IX7CXzKZ4w0qA8I1ZGsUvV24E9CSWsB5TyOMe6gsEXsM3Mp2+xdEoSvkadjtfUV/CJ
	 6VfVlT+9sVoiE8PVN+4HCI/9vhuCmWpJ3yxzUCetUIckRReeNQmPqE76JS2neFm7ZW
	 YqXkg07YM3VGdRgZC8PIRsFfsM7QVcz9TDFRABJtIHKcfbTPwbr+h9GwXS36G8XY2Q
	 pPU4pfNiNEelpqNG3y7zFYv+W/N6ewl4ok6u0B+rno//i+3Us7Ufx3AvwVPLAoY07v
	 29vdIJjOwFNog==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] crypto: sun4i-ss - clamp PRNG seed length to prevent
 heap overflow
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tianchu Chen" <tianchu.chen@linux.dev>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <4d4407c05835a50413fa1e974e3aa3f4abfe2d5b@linux.dev>
References: <4d4407c05835a50413fa1e974e3aa3f4abfe2d5b@linux.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 08:42:50 +0000
Message-Id: <20260529084251.329531F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] The PRNG hardware state is shared globally across all crypto A=
PI instances, allowing unprivileged users to predictably control the RNG st=
ate for others.
- [High] The PRNG seed buffer size incorrectly depends on BITS_PER_LONG, ca=
using seed truncation and halving entropy on 64-bit systems.
- [High] sun4i_ss_prng_seed modifies the shared PRNG seed buffer without ta=
king the required device spinlock.
- [High] The driver fails to validate that the provided seed length is suff=
icient before updating the PRNG seed state.
- [High] sun4i_ss_prng_generate silently ignores trailing bytes when the re=
quested length is not a multiple of 4, leaving parts of the caller's buffer=
 uninitialized.
--

commit c4469644d7be8a19b75d7ee7a736e9f34531be57
Author: Tianchu Chen <flynnnchen@tencent.com>
crypto: sun4i-ss - clamp PRNG seed length to prevent heap overflow

This commit clamps the copy length in sun4i_ss_prng_seed() to prevent a
heap overflow when a user supplies an oversized seed via AF_ALG. It uses
min_t to restrict the length to the size of the destination seed buffer.

> diff --git a/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-prng.c b/drivers/=
crypto/allwinner/sun4i-ss/sun4i-ss-prng.c
> index 491fcb7b81b40..7f6a51dd8f923 100644
> --- a/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-prng.c
> +++ b/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-prng.c
> @@ -8,7 +8,7 @@ int sun4i_ss_prng_seed(struct crypto_rng *tfm, const u8 *=
seed,
>  	struct rng_alg *alg =3D crypto_rng_alg(tfm);
> =20
>  	algt =3D container_of(alg, struct sun4i_ss_alg_template, alg.rng);

[Severity: Critical]
This is a pre-existing issue, but the PRNG hardware state is shared globally
across all crypto API instances. Since there is no per-tfm context and the
driver registers as stdrng with priority 300, can an unprivileged user open
an AF_ALG socket and use setsockopt to inject a chosen seed here? This would
allow them to predict the sequence of random numbers generated for other
processes or kernel subsystems relying on the same RNG.

> -	memcpy(algt->ss->seed, seed, slen);

[Severity: High]
This is a pre-existing issue, but does this function modify the shared PRNG
seed buffer without taking the required device spinlock? In
sun4i_ss_prng_generate(), the code acquires spin_lock_bh(&ss->slock) before
accessing the buffer. Concurrent calls to sun4i_ss_prng_seed() and generate
could cause a data race resulting in torn state.

> +	memcpy(algt->ss->seed, seed, min_t(unsigned int, slen, sizeof(algt->ss-=
>seed)));

[Severity: High]
This is a pre-existing issue, but does the seed buffer size incorrectly
depend on BITS_PER_LONG? If the driver defines the seed array using
SS_SEED_LEN / BITS_PER_LONG, on 64-bit systems this becomes an array of 3
elements (12 bytes) instead of the expected 24 bytes. This would mean the
sizeof() calculation silently truncates valid 24-byte seeds to 12 bytes and
fails to initialize half of the PRNG hardware seed registers.

> =20
>  	return 0;

[Severity: High]
This is a pre-existing issue, but does this function fail to validate that
the provided seed length is sufficient? If a caller provides an undersized
seed, the memcpy will partially update the array, but the function will
still unconditionally return 0. Should the code return an error when the
seed is too small instead of signaling a successful reseeding?

>  }

[Severity: High]
This is a pre-existing issue, but looking at sun4i_ss_prng_generate(), if
the requested length is not a multiple of 4, the remaining bytes are
silently ignored while still returning 0 (success). Does this leave portions
of the caller's buffer completely uninitialized, potentially causing
information disclosure or cryptographic vulnerabilities if predictable memo=
ry
is used as key material?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/4d4407c05835a50413f=
a1e974e3aa3f4abfe2d5b@linux.dev?part=3D1
