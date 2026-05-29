Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A331C2E7635
	for <linux-sunxi@lists.linux.dev>; Fri, 29 May 2026 19:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780084646; cv=none; b=LjftuAgnGyXmiwSrT+gAEWiJQH6ZZWXnCRvLns24R1P0UlGuLv75KCkkPTzjAs1KGVUpF5oAODgcF2jAAXhuE4mpkvq/WppOVr47ASndC6AzmUDCjKlUhZN1yOCDMRZaHLHI1MQI6D3O2qzgsv8vwBzqkLONUWs5rUGvvwC7+5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780084646; c=relaxed/simple;
	bh=JrGXbNg2nENCaTqyxOB2UhJwUp88GBTKeaRbdQlR+3Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WjJhpX+ZbZdKc3jkpomAIaOYRW+qZkPcLAWLAGk3iLukbiLMFXAsc4OiwCpNsrF1yhuIsz7s2+I9pmfLqnXtBQveZaO542avAmfjsj3rRg+LgaFVO7nHBKsfRHBUgMVLAX4gMysn8+Cm5epSMnDLH9TGnvkXAXhDXqtvA2jlDxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YT43zc3Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YT43zc3Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C7B91F00898;
	Fri, 29 May 2026 19:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780084645;
	bh=FaCTLt6oPQf8E2Gpw2xd49aH5ScgTuZtxjwW/m8vaA8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YT43zc3YL+sf93hhOFnPJdNCoqSn1iHux2sbnfPQ0zDyYZxl8EaqFmS1oCkiYs8sh
	 jx1yUSfUex7RgR8FQvh7EHy53JwselkgiAapKQ48XeNJFOhm6grLV54mcpm4snvvM2
	 ER+L6EYLXl3gSn/Pjro0f1SROv/h3szwkAdbMhO+Q0/OcxTGdXz2GXazOc5u40cX7V
	 TN7C8qOMc0THvHQLFGBspGWSArYc18jjWMbS2P4fvPDKT5bjWPqUyESIjvUGlQFWSn
	 MZWXMD84DcYPg6cC8PBRTkT6N8YQoCieet5/hzsQbfzwKYSJsM0u3OILnNIYLpI6Sr
	 1UVWnJIn5j1QA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] crypto: sun4i-ss - Remove insecure and unused rng_alg
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eric Biggers" <ebiggers@kernel.org>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260529193648.18172-1-ebiggers@kernel.org>
References: <20260529193648.18172-1-ebiggers@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 19:57:24 +0000
Message-Id: <20260529195725.5C7B91F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The debugfs directory and files created during probe are never rem=
oved on driver unbind, module unload, or probe failure, leading to a resour=
ce leak and potential Use-After-Free or page fault.
- [High] The driver modifies a static global array (`ss_algs`) to store per=
-device context (`ss`), which breaks if multiple instances of the device ar=
e probed.
- [High] Missing check on `sg_miter_next` return value leads to an infinite=
 loop (DoS) inside a `spin_lock_bh` critical section.
--

commit 0aa56ed964b0d48c219e572488ad7609430a622a
Author: Eric Biggers <ebiggers@kernel.org>

crypto: sun4i-ss - Remove insecure and unused rng_alg

This commit removes the insecure and unused sun4i_ss_rng algorithm to
eliminate its multiple vulnerabilities, such as missing locking and buffer
overflows. The rng algorithm type of AF_ALG was never genuinely used by
userspace here anyway.

> diff --git a/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c b/drivers/=
crypto/allwinner/sun4i-ss/sun4i-ss-core.c
> --- a/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c
> +++ b/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c
> @@ -473,15 +448,6 @@ static int sun4i_ss_probe(struct platform_device *pd=
ev)
>  				goto error_alg;
>  			}
>  			break;
> -#ifdef CONFIG_CRYPTO_DEV_SUN4I_SS_PRNG
> -		case CRYPTO_ALG_TYPE_RNG:
> -			err =3D crypto_register_rng(&ss_algs[i].alg.rng);
> -			if (err) {
> -				dev_err(ss->dev, "Fail to register %s\n",
> -					ss_algs[i].alg.rng.base.cra_name);
> -			}
> -			break;
> -#endif
>  		}
>  	}

[Severity: High]
This isn't a bug introduced by this patch, but does the algorithm
registration loop here overwrite the global device context?

The algorithm templates are defined in a static global array ss_algs. In
sun4i_ss_probe(), the driver loops over this array and assigns the
per-device context:

sun4i_ss_probe() {
    ...
    for (i =3D 0; i < ARRAY_SIZE(ss_algs); i++) {
        ss_algs[i].ss =3D ss;
    ...
}

If a system has multiple instances of this IP block, could the second probe
overwrite the ss pointers in the global struct, causing cryptographic
requests for the first device to incorrectly use the hardware context of
the second?

> @@ -526,11 +487,6 @@ static void sun4i_ss_remove(struct platform_device *=
pdev)
>  		case CRYPTO_ALG_TYPE_AHASH:
>  			crypto_unregister_ahash(&ss_algs[i].alg.hash);
>  			break;
> -#ifdef CONFIG_CRYPTO_DEV_SUN4I_SS_PRNG
> -		case CRYPTO_ALG_TYPE_RNG:
> -			crypto_unregister_rng(&ss_algs[i].alg.rng);
> -			break;
> -#endif
>  		}
>  	}
> =20

[Severity: High]
This is a pre-existing issue, but does sun4i_ss_remove() fail to clean up
the debugfs entries?

In sun4i_ss_probe(), the driver creates a debugfs directory and a stats file
using debugfs_create_dir() and debugfs_create_file(), storing the ss context
as private data.

Neither sun4i_ss_remove() nor the error cleanup paths in sun4i_ss_probe()
appear to call debugfs_remove_recursive() to clean it up. If the module is
unloaded, could the debugfs file remain and cause a page fault if read
subsequently?

[Severity: High]
This is another pre-existing issue, but I noticed a potential infinite loop
in sun4i_hash() in drivers/crypto/allwinner/sun4i-ss/sun4i-ss-hash.c.

Does sun4i_hash() ignore the return value of sg_miter_next()?

sun4i_hash() {
    ...
    while (op->len < 64 && i < end) {
        ...
        if (in_i =3D=3D mi.length) {
            sg_miter_next(&mi);
            in_i =3D 0;
        }
    ...
}

If sg_miter_next() fails and returns false (e.g., when the scatterlist is
exhausted or malformed), mi.length is 0. Inside the loop, because no data is
processed, the loop counters never advance. The in_i =3D=3D mi.length check
would repeatedly evaluate to 0 =3D=3D 0, recursively issuing failing
sg_miter_next() calls.

Since this happens with bottom halves disabled via spin_lock_bh(&ss->slock),
could this spin forever and lead to a hard CPU lockup?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529193648.1817=
2-1-ebiggers@kernel.org?part=3D1
