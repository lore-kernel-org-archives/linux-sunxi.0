Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838E833F5B0
	for <linux-sunxi@lists.linux.dev>; Wed,  2 Sep 2026 20:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788380388; cv=none; b=LdDy7zM36yJvGAcEzR0FiJxnkO1tr90KRTORS2QvZi2EW00+0m2nLTv+YWFEcHBPMpSzdmPEhhk+yqv6KJHh1p9CILGEZCHmuyaMoMLVyCv/tDet0dZcnAT3OiYqDlzIhAJlnABgTcVojRe2lPOHPhdcmQ3fvNT1aE+D4/4bNIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788380388; c=relaxed/simple;
	bh=zIaPagMbMKO2SHl6HZRzbWY0olDGzZjz2DctBF/9AjU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bJqHbKLhfTEW5cFokgu4rhQUQD0VxFUsDEUETIDDSGIiygHcyMSsSsvLeuAwNIlzf6aKKhTxDafwVUwCo1RMiZ4mSJAALtSl8eZzlYi/xQmjHAfbog4/WKOQUZZKx9nqGnztpP0IUfTSObss0lCU7AnPqqKXsNQy30t4WVvr6bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iPV1hsJR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iPV1hsJR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAED81F000E9;
	Wed,  2 Sep 2026 20:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788380387;
	bh=Lrf16nFYOM7mqSKmJRq8YvQbQIoQFRTuemvliqemLQ0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iPV1hsJR2anyy2d2riZGMWynWaJzbyD9rK8DZmJFc4frZLWSu+hw0dKxzyN3s8KAe
	 H745DKCdbUbTKx6YPM7ZP3AmpYUGfzD9bxPagtvurkZm2AedVgI8ipGk7wdSuxvciV
	 QcU+0oZW54zrLOGKf90cnNqD9MNT5pCVvClPurBB3JS8VMCFnrz0kNomTRsApfduvU
	 fcikSHRc3OXKzvMsQGThkSWtCYl9xDz9/Jqu8gtyeffw+/pDFrvO7EtAn4EyyXrk9W
	 UnfjU5b3MVuKJujWtCqlOuawt2E1wj4l2pVkeG0WrGZ34oifaM38bozZfcF3hVvU9S
	 aKYq/W+SU5+Zg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/6] media: arm: mali-c55: Use
 devm_of_reserved_mem_device_init()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mukesh Ojha" <mukesh.ojha@oss.qualcomm.com>
Cc: linux-sunxi@lists.linux.dev, media-ci@linuxtv.org
In-Reply-To: <20260902200703.2016410-5-mukesh.ojha@oss.qualcomm.com>
References: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
 <20260902200703.2016410-5-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 20:19:46 +0000
Message-Id: <20260902201946.EAED81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Race condition between runtime PM autosuspend and manual power-off=
 during device removal and probe error paths.
- [High] The IRQ handler is never freed if the device is removed while in t=
he active runtime PM state.
- [High] Media nodes are registered and exposed to userspace before the dev=
ice's IRQ is requested, breaking initial video capture.
--

commit c75be1887c52469e855778c08a0a6679f1af97b0
Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

media: arm: mali-c55: Use devm_of_reserved_mem_device_init()

This commit refactors the driver to use the devres-managed
devm_of_reserved_mem_device_init() instead of manual initialization and
cleanup.

> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/driver=
s/media/platform/arm/mali-c55/mali-c55-core.c
> index f28e9f4354aca..3d37cd4465838 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> @@ -803,14 +803,12 @@ static int mali_c55_probe(struct platform_device *p=
dev)
>  	if (ret)
>  		return dev_err_probe(dev, ret, "failed to acquire resets\n");
> =20
> -	of_reserved_mem_device_init(dev);
> +	devm_of_reserved_mem_device_init(dev);
>  	vb2_dma_contig_set_max_seg_size(dev, UINT_MAX);
> =20
>  	ret =3D __mali_c55_power_on(mali_c55);

[Severity: High]
This is a pre-existing issue, but are the media nodes registered and exposed
to userspace before the device's IRQ is requested?

Later in mali_c55_probe():

	ret =3D mali_c55_media_frameworks_init(mali_c55);
	if (ret)
		goto err_pm_runtime_disable;

	pm_runtime_idle(&pdev->dev);

	mali_c55->irqnum =3D platform_get_irq(pdev, 0);

The device is explicitly set to RPM_ACTIVE during probe, but the IRQ handler
is only requested inside mali_c55_runtime_resume().

If userspace opens the device and begins streaming before the autosuspend
delay forces a suspend cycle, the device will process frames without an IRQ
handler. Will this cause video streaming to hang indefinitely because the
capture buffers are never completed?

> -	if (ret) {
> -		dev_err_probe(dev, ret, "failed to power on\n");
> -		goto err_release_mem;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to power on\n");
> =20
>  	ret =3D mali_c55_check_hwcfg(mali_c55);
>  	if (ret)

[ ... ]

> @@ -849,9 +847,6 @@ static int mali_c55_probe(struct platform_device *pde=
v)
>  	kfree(mali_c55->context.registers);
>  err_power_off:
>  	__mali_c55_power_off(mali_c55);

[Severity: High]
This is a pre-existing issue, but is there a risk of a double power-off
here if the device successfully auto-suspended before pm_runtime_disable()
is called?

If the autosuspend timer triggered, calling __mali_c55_power_off() again
could lead to imbalanced clock disables (calling clk_bulk_disable_unprepare=
()
without a matching enable) and reset assertions, potentially causing kernel
warnings in the clock and reset cores.

> -err_release_mem:
> -	of_reserved_mem_device_release(dev);
> -
>  	return ret;
>  }
> =20
> @@ -866,7 +861,6 @@ static void mali_c55_remove(struct platform_device *p=
dev)
>  	}

[Severity: High]
This is a pre-existing issue, but does this manual power-off in
mali_c55_remove() create a race window with concurrent autosuspend?

In mali_c55_remove(), if the device is not suspended:

	if (!pm_runtime_suspended(&pdev->dev)) {
		__mali_c55_power_off(mali_c55);
		pm_runtime_set_suspended(&pdev->dev);
	}

Because pm_runtime_disable() is called after this check, an asynchronous
autosuspend could execute concurrently. Could this result in both threads
calling __mali_c55_power_off() at the same time?

[Severity: High]
This is a pre-existing issue, but is it possible that bypassing the runtime
suspend callback here causes an IRQ resource leak?

The driver dynamically registers its IRQ handler in mali_c55_runtime_resume=
()
and frees it in mali_c55_runtime_suspend(). If the device is active during
removal, open-coding the power-off with __mali_c55_power_off() bypasses the
free_irq() call.

Could a subsequent interrupt on this line (or shared IRQ) trigger the handl=
er
and cause a use-after-free when accessing the freed device context?

>  	pm_runtime_disable(&pdev->dev);
>  	kfree(mali_c55->context.registers);
> -	of_reserved_mem_device_release(&pdev->dev);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902200703.2016=
410-1-mukesh.ojha@oss.qualcomm.com?part=3D4
