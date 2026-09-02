Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3EA93ACA42
	for <linux-sunxi@lists.linux.dev>; Wed,  2 Sep 2026 20:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788380383; cv=none; b=I2u+7klE2IMxOxe2Veieh2x+ycnqgFVXXECx4O9zobzQS5CleJv7s2nLoMSZXbrNL7cQZLqDU4B7i3TtzcH+SoJH9HV5K+2Y+4pKWdwtcLN1Etra/UoJ4De79dDTS/DPG/RPPI1JcjjSju/mg+J7Bi9lDR3kVOsiRvqa1Lk0rc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788380383; c=relaxed/simple;
	bh=sBnQLHNywHYA0QPIB0yBAp08w8S0TihyDxEdlwMnTvk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JoKIjoRjVBUhSrjvfF108xMTZRhoEe/jiF6GcSy1FjwDQ8RInQfBiSUszTSpUUDx67MlgIiYvrGoQZWv/Ixq//LZi4vVYv/sbxA5KE6SuVwdNJcAFfJ3n2at6UxjhQvHyRGqzlQSMMUCEPNM4nklj2DUxe4ztDSegggYMNA/ys0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R9k6/dgG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R9k6/dgG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 354F61F000E9;
	Wed,  2 Sep 2026 20:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788380381;
	bh=g5zoaJXcrHEwN4Zs3E7SSFifqKbVPEbCKb70t4Psfd0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R9k6/dgGHnoMEHJdJMYCJ8vWPyxrX9p8x0aGnvo6xxEpLRuJgZNS+EDsTP3cxTY4a
	 Pr0AQZQoclz7ptoSKO/wNDpSi9QiaZm1/BcQ9ExYRJJIRF1YexTE8NqGVvRSj0C3vd
	 vXCNYX9stMXpPURaufBeX6FZN5xGsMp0rXETF+flDho2wvMGxwSShf1KowgqQMhmi3
	 khlGCFt+/8zuYo22gaDJIjWMp5ceiu52sYTS5KIlZW4LVwJuflP2rp0w1UItxPbjgy
	 9i3KIFV8dmA+I3pXDZ5izJF2jYK8ZBjOLoV2PD85Xwy8FFd44d6XeRc8u1SuQzQ0JH
	 keChHS4gwBcUQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/6] media: aspeed: Use
 devm_of_reserved_mem_device_init()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mukesh Ojha" <mukesh.ojha@oss.qualcomm.com>
Cc: linux-sunxi@lists.linux.dev, media-ci@linuxtv.org
In-Reply-To: <20260902200703.2016410-3-mukesh.ojha@oss.qualcomm.com>
References: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
 <20260902200703.2016410-3-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 20:19:40 +0000
Message-Id: <20260902201941.354F61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Preexisting use-after-free of `struct aspeed_video` on driver unbi=
nd due to devm_kzalloc and embedded video_device.
- [High] Preexisting use-after-free/corruption of CMA reserved memory on dr=
iver unbind.
- [High] IRQ registered and unmasked before device clocks are enabled.
- [High] Uncanceled delayed work accesses freed memory on device removal.
--

commit 788dfc64dfdd64116ee0bc0902a2de61fae97d51
Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

media: aspeed: Use devm_of_reserved_mem_device_init()

Switch to devm_of_reserved_mem_device_init() so the reserved memory
region is released automatically on probe failure or device removal.
Remove the three explicit of_reserved_mem_device_release() calls and
rename the error label from err_release_reserved_mem to
err_unprepare_vclk to reflect that it now only unwinds clock state.

> diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media=
/platform/aspeed/aspeed-video.c
> index a292275f6b7b9..7ba9314fdbd2a 100644
> --- a/drivers/media/platform/aspeed/aspeed-video.c
> +++ b/drivers/media/platform/aspeed/aspeed-video.c
> @@ -2267,19 +2267,19 @@ static int aspeed_video_init(struct aspeed_video =
*video)
>  	if (rc)
>  		goto err_unprepare_eclk;
> =20
> -	of_reserved_mem_device_init(dev);
> +	devm_of_reserved_mem_device_init(dev);

[Severity: High]
This isn't a bug introduced by this patch, but does tying the CMA reserved
memory release to devres cleanup here risk a use-after-free or corruption
of CMA reserved memory on driver unbind?

If a user holds an open file descriptor when the device is unbound, active
VB2 DMA buffers may still exist. When the user later closes the file
descriptor, VB2 calls dma_free_coherent() on the buffers:

drivers/media/platform/aspeed/aspeed-video.c:aspeed_video_remove() {
    ...
    vb2_video_unregister_device(&video->vdev);
    ...
}

Since devres releases the CMA region immediately after remove() returns,
could the DMA framework incorrectly handle the free operation on the detach=
ed
region and corrupt allocator pools?

As another pre-existing issue in this initialization path, the interrupt
handler is registered earlier in this function:

drivers/media/platform/aspeed/aspeed-video.c:aspeed_video_init() {
    ...
    rc =3D devm_request_threaded_irq(dev, irq, NULL, aspeed_video_irq,
                                   IRQF_ONESHOT, DEVICE_NAME, video);
    ...
}

This registers and unmasks the IRQ before the device clocks are actually
enabled. If the IRQ line is shared or the bootloader left the device in an
active state, could the interrupt handler fire immediately and access device
registers via aspeed_video_read(), causing a bus fault because the clocks
are disabled?

[ ... ]
> @@ -2343,7 +2342,6 @@ static int aspeed_video_probe(struct platform_devic=
e *pdev)
>  	rc =3D aspeed_video_setup_video(video);
>  	if (rc) {
>  		aspeed_video_free_buf(video, &video->jpeg);
> -		of_reserved_mem_device_release(&pdev->dev);
>  		clk_unprepare(video->vclk);

[Severity: High]
This is a pre-existing issue, but could the use of devres for the driver
context allocation in probe lead to a use-after-free on unbind?

drivers/media/platform/aspeed/aspeed-video.c:aspeed_video_probe() {
    ...
    video =3D devm_kzalloc(&pdev->dev, sizeof(*video), GFP_KERNEL);
    ...
}

Because vdev->release is set to video_device_release_empty in
aspeed_video_setup_video(), the V4L2 core does not defer freeing the memory:

drivers/media/platform/aspeed/aspeed-video.c:aspeed_video_setup_video() {
    ...
    vdev->release =3D video_device_release_empty;
    ...
}

When a user closes the file descriptor after an unbind, devres will have
already freed the struct aspeed_video, but aspeed_video_release() will
still try to access it:

drivers/media/platform/aspeed/aspeed-video.c:aspeed_video_release() {
    ...
    aspeed_video_stop(video);
    ...
}

Could this result in memory corruption when the last user closes the file
descriptor?

[ ... ]
> @@ -2374,8 +2372,6 @@ static void aspeed_video_remove(struct platform_dev=
ice *pdev)
>  	v4l2_device_unregister(v4l2_dev);
> =20
>  	aspeed_video_free_buf(video, &video->jpeg);
> -
> -	of_reserved_mem_device_release(dev);
>  }

[Severity: High]
This is a pre-existing issue, but does this remove function lack a
cancellation of the delayed resolution work, potentially causing a
use-after-free?

A resolution change interrupt can schedule video->res_work:

drivers/media/platform/aspeed/aspeed-video.c:aspeed_video_irq_res_change() {
    ...
    schedule_delayed_work(&video->res_work, delay);
    ...
}

If a driver unbind occurs before the delay expires, aspeed_video_remove()
turns off the hardware but does not call
cancel_delayed_work_sync(&video->res_work).

Could the workqueue execute aspeed_video_resolution_work() after devres
has freed the struct aspeed_video, resulting in a use-after-free?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902200703.2016=
410-1-mukesh.ojha@oss.qualcomm.com?part=3D2
