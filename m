Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D171722D7A1
	for <linux-sunxi@lists.linux.dev>; Thu, 28 May 2026 15:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982179; cv=none; b=f1Gz31dA1fhuGvrq5xs9g4ThDaYLtuo35hyIbL3mew9r8GckeP9Bny777NpNqe+2ob1VCyTRdSSNVO0Ms/r87WcYlXDNR2YZ5Yhr0pX5BU7ibMwnnawi4PYY9fnwQ73/EgjeKvA4xt3LkUjdQOskEW4gbJSzg7qhDijhwI1vVXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982179; c=relaxed/simple;
	bh=AdzgBHADM9ADzU/+kg8M8W69VDL3Qp1zAbAqAvk67Ao=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gJem64a8mAe04l/7hj+SBw060H+pQ2ALeVv69XhwvoAg//obSkyzO7HiGp4/Ck66gciXhGe+Y7JkCLGivbT43p7VL7Tc28mbHLuGQ4Sc5dyH4nGVVL8ygYaH1ZiYvuCGUj0oCuXZJVPIUvoL+NeMacZsU9OCkD+jtTqZ5o3nBmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VUL04Sfg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VUL04Sfg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C45B1F000E9;
	Thu, 28 May 2026 15:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779982179;
	bh=Axq9iiq2KDZOPbCj7879USRVdcsc2IVHIVsNM7WrR6U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VUL04SfgVxGCHkfA02i1a4bPMFqF8kRraHzjLdgX44Y/O6vpP7sXFCKfBYL9U0459
	 kqpndUA2GCiU00ctNkQIH/Pt58MCML6qpZP5a1YGc3fmY+no0Xx7u+IuU60/qiA99R
	 sPa2mrd3m7aFkBkpRscGDFKDxlrP9dlaNt3oAVu2CIAt+ySFbLAQCntx1+szlvvUQx
	 2dp6jf080y6ktkh24O/4QXsUwqHt6WE8uG0MU4HQw+kv2r3lcxgC/PmYzoReS9yLKy
	 DKsYj0Rh/uxDaATrXuQU2pHeQ/6sdJdkL5DE2r0OWiYSOXNsUS16c9TlE507Fe86TB
	 WPuQdufh9y/5A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] crypto: sun4i-ss: restrict PRNG seed length to prevent
 heap overflow
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tianchu Chen" <tianchu.chen@linux.dev>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <af749a8447bd7f0e9dd26ca6c87e9c6afecb09d9@linux.dev>
References: <af749a8447bd7f0e9dd26ca6c87e9c6afecb09d9@linux.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 15:29:38 +0000
Message-Id: <20260528152939.0C45B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [Critical] The newly added bounds check unconditionally rejects valid see=
ds and completely breaks PRNG initialization on 64-bit architectures.

Pre-existing issues:
- [Critical] This problem wasn't introduced by this patch, but the PRNG gen=
eration function silently truncates unaligned requested lengths, failing to=
 generate random bytes for the remainder of the buffer while still returnin=
g success.
- [High] This problem wasn't introduced by this patch, but the patch silent=
ly permits undersized seeds, leading to partial seed updates.
- [High] This problem wasn't introduced by this patch, but the PRNG seed is=
 copied into the shared device state without any locking, creating a data r=
ace with concurrent PRNG generations.
- [High] This problem wasn't introduced by this patch, but there is a blind=
 read from TXFIFO in PRNG generation without checking if data is available.
--

commit ce68b95827dcfbd778d1a5a3d2de5fd10e821954
Author: Tianchu Chen <flynnnchen@tencent.com>
crypto: sun4i-ss: restrict PRNG seed length to prevent heap overflow

This commit restricts the PRNG seed length in sun4i_ss_prng_seed() to preve=
nt
a heap overflow. Without bounds checking, user-supplied seeds via AF_ALG co=
uld
exceed the fixed-size buffer and corrupt adjacent memory.

Fixes: 6298e948215f ("crypto: sunxi-ss - Add Allwinner Security System cryp=
to accelerator")
Cc: stable@vger.kernel.org

> diff --git a/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-prng.c b/drivers/=
crypto/allwinner/sun4i-ss/sun4i-ss-prng.c
> index 491fcb7b81b40..010fa891c1056 100644
> --- a/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-prng.c
> +++ b/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-prng.c
> @@ -8,6 +8,8 @@ int sun4i_ss_prng_seed(struct crypto_rng *tfm, const u8 *=
seed,
>  	struct rng_alg *alg =3D crypto_rng_alg(tfm);
> =20
>  	algt =3D container_of(alg, struct sun4i_ss_alg_template, alg.rng);
> +	if (slen > sizeof(algt->ss->seed))
> +		return -EINVAL;

[Severity: Critical]
Does sizeof(algt->ss->seed) unconditionally reject valid seeds?

On 64-bit architectures, BITS_PER_LONG is 64, which makes the evaluation of
SS_SEED_LEN / BITS_PER_LONG result in 3. The seed array becomes u32 seed[3],
yielding a total size of 12 bytes. This would trigger the EINVAL branch for
standard 24-byte seeds and completely break PRNG initialization.

[Severity: High]
This is a pre-existing issue, but does this check silently permit undersized
seeds?

Allowing slen < seedsize enables partial memcpy operations that mix stale
memory with new entropy.

>  	memcpy(algt->ss->seed, seed, slen);

[Severity: High]
This isn't a bug introduced by this patch, but could this copy operation
create a data race?

The PRNG seed is copied into the shared device state without any locking,
which could lead to torn reads or writes with concurrent PRNG generations.

> =20
>  	return 0;
>  }

[Severity: Critical]
This problem wasn't introduced by this patch, but are unaligned requested
lengths silently truncated by the generation function?

Looking at sun4i_ss_prng_generate() in the same file:

	unsigned int todo =3D (dlen / 4) * 4;
	...
	while (todo > 0) {
		...
	}

The unaligned modulo truncation skips remainder bytes while still returning
success. This fails to generate random bytes for the remainder of the buffer
and could potentially leak uninitialized memory to userspace.

[Severity: High]
This is a pre-existing issue, but does the generator perform a blind read
from the TXFIFO?

Looking at sun4i_ss_prng_generate() in the same file:

		/* Read the random data */
		len =3D min_t(size_t, SS_DATA_LEN / BITS_PER_BYTE, todo);
		readsl(ss->base + SS_TXFIFO, data, len / 4);

This reads from the TXFIFO without checking if data is actually available,
which could fetch unready values before hardware generation completes and
result in predictable or garbage PRNG output.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/af749a8447bd7f0e9dd=
26ca6c87e9c6afecb09d9@linux.dev?part=3D1
