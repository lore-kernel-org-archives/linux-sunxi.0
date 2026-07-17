Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8453BD225
	for <linux-sunxi@lists.linux.dev>; Fri, 17 Jul 2026 08:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784276038; cv=none; b=TDO4yWcgMm73G5MLuxf61T6sNdFxcf0EWlfxKKICN06N4Y5nohn+ZyKFVOey8iSD0aSl27mS3T+dvVsCGuY8CtMb/lahWGT7lbxO3iHCB+bWcHL2JDWVv14Bp8hHAMifbS2sXXLLJa42yXvGDivTJuZqd2Tp7cm/lfKpaV7x/0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784276038; c=relaxed/simple;
	bh=iT4wG1YB4blXGPex3Ukinm21Nz6x/DOnzgdDV8MPank=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TzO9aFCT1vB492BFz6c+3bQAEeGjxAxKh05uTWZJY3cLiynRkZ8mggY6+IkznozMrn7xMV8aeDFfxGvpQqUo0ImBuvwjn0cheE/2R6iROxkRanhQhkOPH5EnZhhWzenHBRjUPdUkwoGYsxqJaxQbBO8Zon2nRxEqgTkRdJ1Fcgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jpfWpebi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jpfWpebi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30D281F000E9;
	Fri, 17 Jul 2026 08:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784276036;
	bh=dQl6icEd3g9uZf+UF63+RohjrLLE9pZJX5KvA1F2StU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jpfWpebiH6efenczdf2cIaJYWgiM2o1OfYAYVsOvy819HaiZ9BA4WtO2459tQWshH
	 RcRPO274NXM2N4REUHBDCstw6Z7GPiQrhJa2FB+NdD0VoeAILO0ONukDF6lzv6NeAE
	 7d3GBnGbX1NCw/YG8qyoZT0UrSDfYdRCQrd5tJhhxlD9IYkfLekl+GmYUXXyt56cqQ
	 mKTJTUayrODKifhFKJd1NfLH5GVdedjOgLoGjnpCoKHiOkpaOOuTzgvvaUuHxfzpoU
	 W+NYKLPjDkVrjrLWMubmvukY/Ti3mL/PpjZgkgYqk30p7k9tL6MN9V2zGyoa8kzNK9
	 vM/y4iY2WR7KA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 01/12] crypto: allwinner - Remove redundant dev_err()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pan Chuang" <panchuang@vivo.com>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260717080045.191538-2-panchuang@vivo.com>
References: <20260717080045.191538-1-panchuang@vivo.com>
 <20260717080045.191538-2-panchuang@vivo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 08:13:55 +0000
Message-Id: <20260717081356.30D281F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Uninitialized list dereference (kernel panic) due to ignored TRNG =
registration failure.
- [High] List corruption and kernel panic due to dangling pointers in globa=
l algorithm arrays during failed re-binds.
--

--- Patch [1]: [PATCH 01/12] crypto: allwinner - Remove redundant dev_err()=
 ---
commit 19d9808368b2fa17e987058da2afc72772963840
Author: Pan Chuang <panchuang@vivo.com>
Subject: crypto: allwinner - Remove redundant dev_err()

This patch removes redundant driver-specific dev_err() messages after
devm_request_irq() calls. Since commit 55b48e23f5c4, devm_request_irq()
automatically logs detailed error messages on failure, making these
additional prints unnecessary.

> diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c b/drivers/=
crypto/allwinner/sun8i-ce/sun8i-ce-core.c
> index f3b58ed6aed0d..a1cc59a2ce3f7 100644
> --- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
> +++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
> @@ -1039,10 +1039,8 @@ static int sun8i_ce_probe(struct platform_device *=
pdev)
> =20
>  	err =3D devm_request_irq(&pdev->dev, irq, ce_irq_handler, 0,
>  			       "sun8i-ce-ns", ce);
> -	if (err) {
> -		dev_err(ce->dev, "Cannot request CryptoEngine Non-secure IRQ (err=3D%d=
)\n", err);
> +	if (err)
>  		goto error_pm;
> -	}
> =20
>  	err =3D sun8i_ce_register_algs(ce);
>  	if (err)

[Severity: High]
This is a pre-existing issue, but does probe proceed successfully even if
hardware RNG registration fails?

A bit further down in sun8i_ce_probe() in
drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c, the return value of
sun8i_ce_hwrng_register() is ignored:

#ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_TRNG
	sun8i_ce_hwrng_register(ce);
#endif

If registration fails (e.g., due to a duplicate name via -EEXIST from a
mock device, or sysfs unbind/bind races), probe proceeds. Later, upon
unbinding or module removal, sun8i_ce_remove() unconditionally calls
sun8i_ce_hwrng_unregister() which triggers:

drivers/crypto/allwinner/sun8i-ce/sun8i-ce-trng.c:sun8i_ce_hwrng_unregister=
() {
    ...
	if (ce->variant->trng =3D=3D CE_ID_NOTSUPP)
		return;
	hwrng_unregister(&ce->trng);
    ...
}

Because the device was never successfully added to the core list, its
list_head remains zero-initialized (from devm_kzalloc). Calling
hwrng_unregister() executes list_del(), which attempts to dereference the
NULL prev and next pointers, causing an immediate kernel oops.

Could the return value of sun8i_ce_hwrng_register() be checked and handled
appropriately?

[Severity: High]
This is another pre-existing issue, but does sun8i_ce_unregister_algs()
leave dangling pointers in the global ce_algs array?

When algorithms are unregistered, the device instance pointers are not
cleared:

drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c:sun8i_ce_unregister_algs(=
) {
    ...
		case CRYPTO_ALG_TYPE_SKCIPHER:
			dev_info(ce->dev, "Unregister %d %s\n", i,
				 ce_algs[i].alg.skcipher.base.base.cra_name);
			crypto_engine_unregister_skcipher(&ce_algs[i].alg.skcipher);
			break;
    ...
}

If a device is successfully bound and then unbound, these global arrays are
left with dangling pointers to the freed device structure. On a subsequent
probe of the device, if algorithm registration fails partway through (such
as if sun8i_ce_register_algs() fails as seen in the diff context above),
the error path calls the unregister function.

The loop sees the dangling pointers from the previous successful bind and
attempts to call crypto_engine_unregister_skcipher() on them again. This
causes a double-unregister of the same algorithm template, resulting in
list corruption.

Could ce_algs[i].ce be set to NULL after unregistering each algorithm?

> diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c b/drivers/=
crypto/allwinner/sun8i-ss/sun8i-ss-core.c
> index 59c9bc45ec0f2..c994e023afbc4 100644
> --- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c
> +++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c
> @@ -869,10 +869,8 @@ static int sun8i_ss_probe(struct platform_device *pd=
ev)
>  		goto error_pm;
> =20
>  	err =3D devm_request_irq(&pdev->dev, irq, ss_irq_handler, 0, "sun8i-ss"=
, ss);
> -	if (err) {
> -		dev_err(ss->dev, "Cannot request SecuritySystem IRQ (err=3D%d)\n", err=
);
> +	if (err)
>  		goto error_irq;
> -	}
> =20
>  	err =3D sun8i_ss_register_algs(ss);
>  	if (err)

[Severity: High]
This is a pre-existing issue, but similar to the sun8i-ce driver above,
can sun8i_ss_unregister_algs() cause a double-free?

drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c:sun8i_ss_unregister_algs(=
) {
    ...
		case CRYPTO_ALG_TYPE_SKCIPHER:
			dev_info(ss->dev, "Unregister %d %s\n", i,
				 ss_algs[i].alg.skcipher.base.base.cra_name);
			crypto_engine_unregister_skcipher(&ss_algs[i].alg.skcipher);
			break;
    ...
}

Failing to clear ss_algs[i].ss to NULL after unregistering the algorithm
leaves a dangling pointer for future probes, which can lead to list
corruption and a double-free in the crypto core during failed re-binds.

Could ss_algs[i].ss be set to NULL after unregistering each algorithm here
as well?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717080045.1915=
38-1-panchuang@vivo.com?part=3D1
