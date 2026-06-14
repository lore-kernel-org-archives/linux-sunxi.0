Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282CB2F7F1F
	for <linux-sunxi@lists.linux.dev>; Sun, 14 Jun 2026 17:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781457068; cv=none; b=CU3BcMWmvMvxyo7DsI6ZiRQ84SRLZrKzTLsLnGJq+JqICVPFVF/O5BjGbp61dkxJ3ckOhGBAZZKGpLyc6ch/2l61j63E+UmmmbgAOtP/kibjNSuHJYMN1RZYvK1tXBXLU+mGqGZbTuTvRgOQRHimBtS9jnl920PGWmZx2T2YSAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781457068; c=relaxed/simple;
	bh=ZeMtaqkwLGS+v63rqffTYGcDul49lVbaGIVJTsah69U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SkAKtyHMRiqMfPgaCdCqqzkJW8m9wJ2r+8jlUnVmpZWH0W7Lc0wRbKGZqiq1mRtFkSxg5IvUcJRQn0Eaa0xGhT3YnF/3tNj/Od43dHasOhxo35WiEdC+ph93094KR9CUXBNwlB1Xg4q9WouvgcFSTFt9Ui/CuGwVEqado11vn20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BHAkSPxF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BHAkSPxF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FB851F000E9;
	Sun, 14 Jun 2026 17:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781457066;
	bh=z2RkMWNR2w0O3k1eNCraNClJ2KnkRnQK0roWdN+Gl0c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BHAkSPxFxPBE/3kQoJM01vEF2RycGWpUBJKZ9jVB0lFV4+tm9tTpbkMwaDfcYFwdc
	 Sg3wzf+lChW3TGPC0WKl7sOBe/a/vDB5JCkGEkEwFd8JaB3eTISbbIg+fz1S/+vepE
	 jQnRCHLE3bKBu1PD9YrH3ztvvrNwBNy1MHm90GnWtIcGmAdczuFY63AV09a9owSTFK
	 puYeESejb/2TFo8hJzILx4SJ2v3L2taUKFzALiaTuQ+HOBJmmFhzC6MYg0hRw+YTHH
	 dbVspdmAg4uHbqjJbQ/Xzq1v3QD8JkLX2GVp/j6A6Y0zpQ220AmUofd1PhNX3xWseq
	 07ZIVgWN4B7IA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 07/22] media: platform: sun4i_csi: Add missing
 media_entity_cleanup()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Biren Pandya" <birenpandya@gmail.com>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260614165630.3896-8-birenpandya@gmail.com>
References: <20260614165630.3896-8-birenpandya@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 14 Jun 2026 17:11:06 +0000
Message-Id: <20260614171106.9FB851F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The error path in `sun4i_csi_probe` fails to clean up the V4L2 asy=
nc notifier, leaking the async connection memory and fwnode reference.
- [High] If `sun4i_csi_notify_complete` fails after registering the video d=
evice, the node is exposed to userspace but not cleaned up on probe abort, =
leading to a Use-After-Free.
- [Medium] Early error paths in `sun4i_csi_probe` fail to call `media_devic=
e_cleanup()`, leaking IDA internal structures and mutexes initialized by `m=
edia_device_init()`.
--

commit 0bea5104c6b556049740c1a93c1ab60799f7c769
Author: Biren Pandya <birenpandya@gmail.com>

media: platform: sun4i_csi: Add missing media_entity_cleanup()
   =20
This commit adds calls to media_entity_cleanup() in the sun4i_csi probe
error paths and the remove function to properly release media entities.

> diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers=
/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> index e53a07b770b7e..f50d97ca795f8 100644
> --- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> +++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> @@ -242,11 +242,11 @@ static int sun4i_csi_probe(struct platform_device *=
pdev)
>  	vdev->entity.ops =3D &sun4i_csi_video_entity_ops;
>  	ret =3D media_entity_pads_init(&vdev->entity, 1, &csi->vdev_pad);
>  	if (ret < 0)
> -		return ret;
> +		goto err_clean_subdev_entity;
> =20
>  	ret =3D sun4i_csi_dma_register(csi, irq);
>  	if (ret)
> -		goto err_clean_pad;
> +		goto err_clean_vdev_entity;
> =20
>  	ret =3D sun4i_csi_notifier_init(csi);
>  	if (ret)

[ ... ]

> @@ -266,6 +266,10 @@ static int sun4i_csi_probe(struct platform_device *p=
dev)
>  	media_device_unregister(&csi->mdev);
>  	sun4i_csi_dma_unregister(csi);

[Severity: High]
This isn't a bug introduced by this patch, but does the error path in
sun4i_csi_probe() fail to clean up the V4L2 async notifier, leaking the
async connection memory and fwnode reference?

sun4i_csi_notifier_init() allocates memory for a v4l2_async_connection via
v4l2_async_nf_add_fwnode_remote() and takes a reference to the fwnode. If
v4l2_async_nf_register() subsequently fails, the error path jumps to
err_unregister_media. However, neither this label nor the cascading error
paths below it call v4l2_async_nf_cleanup(&csi->notifier).

[Severity: High]
This is a pre-existing issue, but could this error path lead to a
use-after-free if sun4i_csi_notify_complete() fails after registering
the video device?

In sun4i_csi_notify_complete(), sun4i_csi_v4l2_register() successfully
registers the /dev/videoX node. If a subsequent step (such as
media_device_register() or media_create_pad_link()) fails, the function
returns an error without rolling back and unregistering the video device.

This failure bubbles up, causing v4l2_async_nf_register() in probe to fail.
The probe error path here entirely omits vb2_video_unregister_device().
Consequently, devres frees the csi memory (which embeds csi->vdev), but
the /dev/videoX node remains active. If userspace opens the stranded video
node, the kernel will dereference the freed csi struct via
video_drvdata(file).

> +err_clean_vdev_entity:
> +	media_entity_cleanup(&vdev->entity);
> +err_clean_subdev_entity:
> +	media_entity_cleanup(&subdev->entity);
>  err_clean_pad:
>  	media_device_cleanup(&csi->mdev);

[Severity: Medium]
This is a pre-existing issue, but do early error paths in sun4i_csi_probe()
leak IDA internal structures and mutexes initialized by media_device_init()?

For example, if devm_platform_ioremap_resource() fails:

drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c:sun4i_csi_probe() {
    ...
    media_device_init(&csi->mdev);
    csi->v4l.mdev =3D &csi->mdev;

    csi->regs =3D devm_platform_ioremap_resource(pdev, 0);
    if (IS_ERR(csi->regs))
        return PTR_ERR(csi->regs);
    ...
}

It returns directly instead of jumping to the err_clean_pad cleanup label
seen above, bypassing the necessary media_device_cleanup(&csi->mdev) call.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260614165630.3896=
-1-birenpandya@gmail.com?part=3D7
