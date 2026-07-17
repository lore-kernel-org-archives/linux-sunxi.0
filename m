Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBF92749CF
	for <linux-sunxi@lists.linux.dev>; Fri, 17 Jul 2026 04:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784261075; cv=none; b=iqZ0tHed4z/o6cptXUbioYngtsYu0VIGZEzG5QHmkj1gQluIaUydCrAgPK40AFkDLBntOYM6eSjspseAnL0HpzX6rcZS5p8ON7Bdbsrl4h4cBDuOIdzhibmblzSIjCjMk++RIHP5ANZrbFXjelFhJ9lpzUl22rYOPO3A1Gn+0mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784261075; c=relaxed/simple;
	bh=k4hwud125hwkKDx1Q+827xi+OuUdywLkftP358A1GH4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=O8uTy4jebtVJMqBS1pTRm0lOVuHEWmQgaOMBBrZfhTIWITlhBymrHmO4B8nybc5a6bxlxSL5iG1/vrjMDffKWLJ8L4D4Xdc9WC86vuNhMyGxx/0EXWdDmuYTJXB2Omm43pDp/vNrlmhmWmAX1k9FQWOJ8DPjwuFbTimGC19WE4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W3rMK3g2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W3rMK3g2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECF6F1F000E9;
	Fri, 17 Jul 2026 04:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784261074;
	bh=1PtPyHJWy1nnp3UAlJNwnsbOwEXmAk7HMYr4mTsKJ34=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W3rMK3g2AfXvkwatEpzLMBgNxwqWsiAuRrPlraALWZhsxwbLpq9O85Proleu3xjlO
	 rVvGnuFq6B39uigEJsLNi11EF2q08yNTNx8j3sdQmtJAuP2nMl5EMOpmE5K4VuJMCs
	 4WbJMambnCBZ0bcjU7lNBFIlS7N4knrWoVJ1hI67DPjzNlfvf7Im3V8iKpD4Fa9gqE
	 V64eB51Cx45TugK+8p8pmGq6bEchdY5yA+W2tyl5oULNniOu9Z424FIV+zfjTPW4pn
	 JspiA2g8oJuD1qaYDu1EKbfxhdJ6dpdQdRXQQrOQOsTAQ6s9QtWXvStV/rTxTqf1E/
	 w3LP44Af/b52Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5.15] crypto: sun4i-ss - Remove insecure and unused
 rng_alg
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eric Biggers" <ebiggers@kernel.org>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260717035228.353051-1-ebiggers@kernel.org>
References: <20260717035228.353051-1-ebiggers@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 04:04:33 +0000
Message-Id: <20260717040433.ECF6F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver fails to remove its debugfs directory on device removal=
 or module unload, leading to a dangling debugfs entry that can cause a use=
-after-free and kernel panic.
--

--- Patch [1]: [PATCH 5.15] crypto: sun4i-ss - Remove insecure and unused r=
ng_alg ---
commit 170a30200701519fc546c370a0ab6113fdc3a608
Author: Eric Biggers <ebiggers@kernel.org>

crypto: sun4i-ss - Remove insecure and unused rng_alg

This commit removes the sun4i_ss_rng implementation because it is insecure,
has multiple vulnerabilities including a buffer overflow, and is unused.
There is no point in fixing these issues individually when the code is
unneeded.

Closes: https://lore.kernel.org/r/af749a8447bd7f0e9dd26ca6c87e9c6afecb09d9@=
linux.dev/

> diff --git a/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c b/drivers/=
crypto/allwinner/sun4i-ss/sun4i-ss-core.c
> --- a/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c
> +++ b/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c

[ ... ]

> @@ -535,9 +502,6 @@ static int sun4i_ss_remove(struct platform_device *pd=
ev)
>  		case CRYPTO_ALG_TYPE_AHASH:
>  			crypto_unregister_ahash(&ss_algs[i].alg.hash);
>  			break;
> -		case CRYPTO_ALG_TYPE_RNG:
> -			crypto_unregister_rng(&ss_algs[i].alg.rng);
> -			break;
>  		}
>  	}
> =20

[Severity: High]
This is a pre-existing issue, but does this function leak the debugfs
directory when the module is removed?

In sun4i_ss_probe(), the driver sets up the debugfs entries:

    ss->dbgfs_dir =3D debugfs_create_dir("sun4i-ss", NULL);
    ss->dbgfs_stats =3D debugfs_create_file("stats", 0444, ss->dbgfs_dir, s=
s,
                                          &sun4i_ss_debugfs_fops);

Since sun4i_ss_remove() lacks a corresponding debugfs_remove_recursive()
call, could unloading the module leave the debugfs entries registered in the
VFS, leading to a use-after-free and kernel panic if someone opens
/sys/kernel/debug/sun4i-ss/stats after the module memory is freed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717035228.3530=
51-1-ebiggers@kernel.org?part=3D1
