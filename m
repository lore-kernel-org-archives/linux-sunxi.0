Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697533C1D79
	for <linux-sunxi@lists.linux.dev>; Sat,  8 Aug 2026 09:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786181018; cv=none; b=ZijW6vwMpZzWkjwYC0yGTbxR6gSN5NtDcT9DfACAF/ELvh2fX4w61P2yD3N7I/6vY0Sdqp92UiGll7RMLXmOMtH1H4rN99m2fcIcGTA4m6Gpf8zW/JPNFoehjE6D7F/ThR/3qoVq9Ez4Xwt2Sm4jPwpiOINekZG32UPHRKxecs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786181018; c=relaxed/simple;
	bh=LV8O1RYGSBRO3KD6RghvkmzmdiJCAamC378EdCNGpb0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EtEQBqUFpbfQwgKIzK08cUw2Ha7YSUsUwIdj0MrspKjcPjg7R8UMocaZkI7oikwA+hICEUrO7d+vO8vLpg5CskbkNrMUFPypWOlrElVM9EtYWC3FYORhJxdFhm3rPhCVDvQFjeYzvZBWoNZGR/yoBUu1XlJj0WSnYjLTuASwzKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YmOGkO0n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YmOGkO0n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B72451F000E9;
	Sat,  8 Aug 2026 09:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786181017;
	bh=atRV8+U7SzrPgXG2bwjVKTuwjCZ8ejuVvirzWE2yhJk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YmOGkO0nnOp08ALOcPwvbtTinLskaHEfDwiTEDvywPQREqhIxGXymSNWNiEicIBI+
	 CeWuCfOqSfB/2GhIKZQc+zmzp/1yfpRMrTFp8mDF3OdPwvbgKwSlAaMLbvi8D38d9t
	 ak6/M4AMKYTeTHzKHcEfHIilBH9y+a6PGsXnPHpGDnGT77E1917amg7sfZyR/9XF9y
	 4YIjE3eanASnYybe/BL9tPo7mG7YOlfCnr220RZZMteVSuRbBrJfpZIsLqFfB+cAVg
	 KIQOTpmRcAkm0XpsQRDtHKdxVpfnNQb5d+DTTq92gKwDVqyCykezkM0R1/0CWD+c1J
	 NsyYHeE2yO7XQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] media: sun4i-csi: fix async connection leak when
 notifier registration fails
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cong Nguyen" <congnt264@gmail.com>
Cc: media-ci@linuxtv.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20260808091151.2691482-1-congnt264@gmail.com>
References: <20260808091151.2691482-1-congnt264@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 09:23:36 +0000
Message-Id: <20260808092336.B72451F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing cleanup of registered video and subdev devices in `sun4i_c=
si_notify_complete()` error paths leads to device leaks and potential Use-A=
fter-Free.
- [High] The driver does not disable hardware interrupts or synchronize the=
 IRQ handler when stopping capture, allowing an interrupt to crash the syst=
em after device suspension.
- [High] Missing `.unbind` callback allows the video device to retain and a=
ccess a freed subdevice pointer (`csi->src_subdev`).
--

--- Patch [1]: [PATCH] media: sun4i-csi: fix async connection leak when not=
ifier registration fails ---
commit d13febea573e64b9e585c2c1f9b472e41737683c
Author: Cong Nguyen <congnt264@gmail.com>

media: sun4i-csi: fix async connection leak when notifier registration fails
   =20
sun4i_csi_notifier_init() adds a v4l2_async_connection to the notifier's
waiting list with v4l2_async_nf_add_fwnode_remote(). If the subsequent
v4l2_async_nf_register() then fails, probe jumps to err_unregister_media,
which never calls v4l2_async_nf_cleanup(). The core does not free the
waiting list on a failed registration, so the async connection is leaked.
   =20
Add an err_clean_notifier label that cleans up the notifier on the
registration-failure path, matching the teardown done in
sun4i_csi_remove(). The notifier-init failure path adds nothing to the
notifier and continues to skip the cleanup.

> diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers=
/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> index e53a07b770b7e..a8db851ab5a59 100644
> --- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> +++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> @@ -255,13 +255,15 @@ static int sun4i_csi_probe(struct platform_device *=
pdev)
>  	ret =3D v4l2_async_nf_register(&csi->notifier);
>  	if (ret) {
>  		dev_err(csi->dev, "Couldn't register our notifier.\n");
> -		goto err_unregister_media;
> +		goto err_clean_notifier;
>  	}
> =20
>  	pm_runtime_enable(&pdev->dev);
> =20
>  	return 0;
> =20
> +err_clean_notifier:
> +	v4l2_async_nf_cleanup(&csi->notifier);
>  err_unregister_media:
>  	media_device_unregister(&csi->mdev);
>  	sun4i_csi_dma_unregister(csi);

[Severity: High]
This is a pre-existing issue, but does sun4i_csi_notify_complete() leak
registered video and subdev devices in its error paths?

If media_create_pad_link() or other subsequent operations fail, the error
path err_clean_media only unregisters the media device:

drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c:sun4i_csi_notify_complet=
e() {
    ...
err_clean_media:
	media_device_unregister(&csi->mdev);

	return ret;
}

It doesn't seem to unregister the video device or the subdev. Because this
failure propagates back to v4l2_async_nf_register(), the probe will fail
and the driver's devm-managed memory is freed.

Since the /dev/videoX node remains active but points to freed memory,
could userspace access trigger a use-after-free?

[Severity: High]
This isn't a bug introduced by this patch, but is the driver leaving
hardware interrupts enabled when stopping capture?

In sun4i_csi_stop_streaming(), the hardware capture is stopped, but the
interrupt enable register doesn't appear to be cleared and there is no
call to synchronize_irq():

drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c:sun4i_csi_stop_streaming=
() {
    ...
	v4l2_subdev_call(csi->src_subdev, video, s_stream, 0);
	sun4i_csi_capture_stop(csi);

	/* Release all active buffers */
    ...
}

Because capture stops at the end of the current frame, a frame-done
interrupt could fire shortly after this function returns. If userspace
closes the device, sun4i_csi_release() invokes pm_runtime_put(), powering
down the hardware block.

When the delayed interrupt fires, could the interrupt handler attempt to re=
ad
registers on powered-down hardware and cause a system crash?

drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c:sun4i_csi_irq() {
    ...
	reg =3D readl(csi->regs + CSI_INT_STA_REG);

	/* Acknowledge the interrupts */
	writel(reg, csi->regs + CSI_INT_STA_REG);
    ...
}

[Severity: High]
This is a pre-existing issue, but is sun4i_csi_notify_ops missing an
.unbind callback?

drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c:
    ...
static const struct v4l2_async_notifier_operations sun4i_csi_notify_ops =3D=
 {
	.bound		=3D sun4i_csi_notify_bound,
	.complete	=3D sun4i_csi_notify_complete,
};
    ...

If the remote sensor module is unloaded, the V4L2 async core unbinds
and frees the subdevice, but it appears csi->src_subdev is never cleared
and the video node is never unregistered.

If userspace calls VIDIOC_STREAMON afterward, does sun4i_csi_start_streamin=
g()
dereference the freed csi->src_subdev pointer here?

drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c:sun4i_csi_start_streamin=
g() {
    ...
	ret =3D v4l2_subdev_call(csi->src_subdev, video, s_stream, 1);
	if (ret < 0 && ret !=3D -ENOIOCTLCMD)
		goto err_disable_device;
    ...
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260808091151.2691=
482-1-congnt264@gmail.com?part=3D1
