Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6D62D2483
	for <linux-sunxi@lists.linux.dev>; Mon,  1 Jun 2026 16:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780330871; cv=none; b=LZ5tvK5qDxllqBOKyRhyad+b1aGcXwzMCLzoiXGWOUsQFB371pVnrwFLr9U1vlW33e3cgO+4NXz2g64wZQ1u/fFIA7o3rz53vk2LPumXgBiiVW3TSTcyZNkhPLZuDgbsb1x5LjT/hckaaKeBJgB+v7JKeKUA5fRYRbEaHlrAvmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780330871; c=relaxed/simple;
	bh=pePclGrQLFeBDm3z32+SHdzFpkbWw9kLTmbXXMPPSSQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nXbDF3ya6KOJfipfAVTASsWP3qlRnSwEIBOu2/qhTZ7BOxLdPo9jfymY6JrRfDzoKBnmeZeh9Z3dtW91x64YUQJRprzq+CmrnAJt/vnhg4ArNhoCkASTkRKu04cbcJAlmUxfHUpxUJkPuKbS0mJUTxlGIjqO7VX+az+R8Iomp0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V2K3YFe3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V2K3YFe3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B2601F00893;
	Mon,  1 Jun 2026 16:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780330870;
	bh=Xpd5gjNxIFy3nwB8sM2ylBQ3eL5zrXLmul+wBUqRZtk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V2K3YFe3/sAhWiUyiHoSxAY2AYhSI6IpkHYOj0LB7vujZpM4BTYfK2416QNWI8POF
	 052mGbm1HnOwVAJUOSlEWE6mURj8BnuSkhaNSsd+M2Sy52frXrtiz8wVfay0wrCXwH
	 EkrWo6oGFuVLRTiRSevHXAivDVb/Ged13ytV/tGICBhXu7OVkWV0xesQVw7lAD9Ta4
	 69MwiOgSSEK3tLbqKHfsRx7jjyazr9TArj6qceRlwAb6CWNUWIyB2GDQ704+qJMNCn
	 5FLStD36bF3Rp1Ap/GwezaPdZiajw5n3QkmuZ2vRK6L73sLp6cudYtbPOUYbo5MLk0
	 8/325aD4biUAg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] crypto: sun4i-ss - Remove insecure and unused
 rng_alg
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eric Biggers" <ebiggers@kernel.org>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260601160757.79645-1-ebiggers@kernel.org>
References: <20260601160757.79645-1-ebiggers@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 16:21:09 +0000
Message-Id: <20260601162110.0B2601F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing debugfs cleanup in sun4i_ss_remove() causes a use-after-fr=
ee when debugfs files are accessed after module unload.
- [High] Device unbind causes a use-after-free of the devm-allocated device=
 context via active crypto transforms.
- [High] Incorrect error handling in sun4i_ss_pm_resume() causes clock refe=
rence count underflows.
--

commit 678d50ec6e8d7e2858de6d7ee66a1f1a63b0e288
Author: Eric Biggers <ebiggers@kernel.org>

crypto: sun4i-ss - Remove insecure and unused rng_alg

This commit removes the unused and insecure `sun4i_ss_rng` algorithm from t=
he
sun4i-ss crypto driver. It had multiple vulnerabilities including missing
locking, a buffer overflow in `sun4i_ss_prng_seed()`, and insufficient
random byte generation.

Closes: https://lore.kernel.org/r/af749a8447bd7f0e9dd26ca6c87e9c6afecb09d9@=
linux.dev/

> diff --git a/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c b/drivers/=
crypto/allwinner/sun4i-ss/sun4i-ss-core.c
> index 58a76e2ba64e2..35ef0930e77f1 100644
> --- a/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c
> +++ b/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c

[ ... ]

> @@ -520,9 +487,6 @@ static void sun4i_ss_remove(struct platform_device *p=
dev)
>  		case CRYPTO_ALG_TYPE_AHASH:
>  			crypto_unregister_ahash(&ss_algs[i].alg.hash);
>  			break;

[Severity: High]
This isn't a bug introduced by this patch, but does the device unbind cause=
 a
use-after-free of the devm-allocated device context here?

The device context `ss` is allocated via `devm_kzalloc()`. If the device is
unbound via sysfs, `sun4i_ss_remove()` runs and returns, triggering `devm`
to free `ss` and unmap the hardware MMIO region.

However, `crypto_unregister_alg()` does not wait for existing active crypto
transforms (`tfm`) to be closed. Any subsequent encryption requests or
calls to `sun4i_ss_cipher_exit()` on these surviving `tfm`s will dereference
the freed `ss` pointer (`op->ss->dev`) and attempt to access unmapped memor=
y.

> -		case CRYPTO_ALG_TYPE_RNG:
> -			crypto_unregister_rng(&ss_algs[i].alg.rng);
> -			break;
>  		}
>  	}
> =20

[Severity: High]
This is a pre-existing issue, but are we missing a debugfs cleanup before
this function returns?

The driver creates a debugfs directory and a `stats` file in
`sun4i_ss_probe()` but never removes them here in `sun4i_ss_remove()`.

Because the debugfs entries are not cleaned up, unloading the module leaves
stale dentry/inodes. If a user subsequently accesses the
`/sys/kernel/debug/sun4i-ss/stats` file, the VFS will attempt to execute
unmapped memory (dangling `sun4i_ss_debugfs_fops`), leading to a kernel
Oops or possible privilege escalation.


[Severity: High]
This is also a pre-existing issue, but does incorrect error handling in
`sun4i_ss_pm_resume()` cause clock reference count underflows?

Looking at `sun4i_ss_pm_resume()`:

drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c:sun4i_ss_pm_resume() {
    ...
err_enable:
	sun4i_ss_pm_suspend(dev);
	return err;
}

If `clk_prepare_enable()` fails for either `busclk` or `ssclk`, the error
path jumps to `err_enable` and unconditionally calls `sun4i_ss_pm_suspend()=
`.

The suspend function calls `clk_disable_unprepare()` on both clocks, meaning
it will disable a clock that failed to enable. This causes a reference count
underflow in the Common Clock Framework, potentially disabling shared clocks
(`busclk` is the AHB bus clock) while other devices are actively using them.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601160757.7964=
5-1-ebiggers@kernel.org?part=3D1
