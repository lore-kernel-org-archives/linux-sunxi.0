Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280094B0486
	for <linux-sunxi@lists.linux.dev>; Sat,  8 Aug 2026 11:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786188638; cv=none; b=sacCvBVYq2ku5xE/ggGC8wF/uk5t0fKhvD4jTg3LWX4H6XHtmHgysp54MUcbMqfGrFwjU9IdZPuE/LXtR2LgS+Qgdab+vecF4r2McDZajnrwKbdPg2Ay2H7vJEaSTD6Uz+Xe3/NgPLEce4DRe1sRuCdvJZVjy5NYI9Z8vWvc+zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786188638; c=relaxed/simple;
	bh=ZshMVdd3LcDq3bzkVOpSVL0A0qPL2BHfLeZWtCPg7Z8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=S0oMhzMAL4uqgCUv06i7MmEtlxI4jqbAnz9iKzQ+p/1E3+lq/agjU+AH9x5gmXXmOa/mhRX3TUJ6eVl3hYHbOCtPfmmKjLx2nIWUEPiu4w2eNFD7WZSTtx9wgXR+Jhvp7c3I+y4UJRVa+K1ReIX7OYwWSe/A/dXwOr/Yl7a5Tvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F3WBRWE+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F3WBRWE+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CE0C1F000E9;
	Sat,  8 Aug 2026 11:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786188636;
	bh=8SI8H7G/naghe8F+zdj36GmDg6Afkm3/TgPi9alGVLE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F3WBRWE+kqc2KGBFxcBCT7EnsYdBQRkc6V58mv26yG5Ur2MTFTz4oYyoq++NnSZTh
	 X6MuNEm3wLUMyf6KsvCaHb6p+T93zJYHI/amkIx9fp6DgTNXXTaHfIla2TOHJVbX9k
	 Jx+53NbZUc1XQdNMns63++6nFoW8v10UHU/BAsdCi1DO5ikvqVTCBZ/UgwZfSTU0/5
	 7s4RaSsK0OF6B7A0GGzfYd42QrxbuYE7wsOGqAJW/9JvASaQCP9+xVIGIrdVq9D56p
	 IxSHI8F0GB+zoq79OExpWYnypRGLw1Tf++uieGWjUoGqzSDgRQJ+vcXmotHmGxZ5Ba
	 8RX2ivKXu2Org==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/3] media: sun4i-csi: disable interrupts when
 stopping streaming
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cong Nguyen" <congnt264@gmail.com>
Cc: linux-sunxi@lists.linux.dev, media-ci@linuxtv.org
In-Reply-To: <f0f044148ec5c160d76e6e38d1f53393ec56578a.1786184456.git.congnt264@gmail.com>
References: <cover.1786184456.git.congnt264@gmail.com>
 <f0f044148ec5c160d76e6e38d1f53393ec56578a.1786184456.git.congnt264@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 11:30:36 +0000
Message-Id: <20260808113036.8CE0C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Missing read-back to flush the posted write before `synchronize_ir=
q()`.

Pre-existing issues:
- [High] The error path in `sun4i_csi_start_streaming()` fails to disable t=
he frame-done interrupt and synchronize the IRQ, causing DMA use-after-free=
 and system crashes.
- [High] The `sun4i_csi` structure is subjected to a Use-After-Free because=
 its embedded `video_device` uses an empty release callback.
- [High] The driver frees DMA buffers while the hardware may still be activ=
ely writing to them.
--

--- Patch [2]: [PATCH v1 2/3] media: sun4i-csi: disable interrupts when sto=
pping streaming ---
commit dbface35706640e625b0b1ec0a6ec2b6918d0fc4
Author: Cong Nguyen <congnt264@gmail.com>

media: sun4i-csi: disable interrupts when stopping streaming

sun4i_csi_start_streaming() enables the frame-done interrupt in
CSI_INT_EN_REG, but sun4i_csi_stop_streaming() only stops the capture
engine (CSI_CPT_CTRL_REG) via sun4i_csi_capture_stop().

Clear CSI_INT_EN_REG and call synchronize_irq() in stop_streaming(), before
returning the active buffers and freeing the scratch buffer, so no handler
can run past this point.

Fixes: 577bbf23b758 ("media: sunxi: Add A10 CSI driver")
Cc: stable@vger.kernel.org

> diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h b/drivers=
/media/platform/sunxi/sun4i-csi/sun4i_csi.h
> index 4e0c2df45d4d2..51173faea8719 100644
> --- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h
> +++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h
> @@ -112,6 +112,7 @@ struct sun4i_csi {
>  	const struct sun4i_csi_traits	*traits;
> =20
>  	void __iomem			*regs;
> +	int				irq;
>  	struct clk			*bus_clk;
>  	struct clk			*isp_clk;
>  	struct clk			*ram_clk;

[Severity: High]
This isn't a regression introduced by this patch, but since the struct is
modified here, is it possible this structure suffers from a use-after-free?

The sun4i_csi structure is allocated using devm_kzalloc() in sun4i_csi_prob=
e():

    csi =3D devm_kzalloc(&pdev->dev, sizeof(*csi), GFP_KERNEL);

However, the embedded video_device struct sets its release callback to
video_device_release_empty in sun4i_csi_v4l2_register():

    vdev->release =3D video_device_release_empty;

This breaks the V4L2 reference counting model. If the device is unbound whi=
le
a userspace application holds the video device file descriptor open,
devm_kzalloc frees the csi structure. A subsequent close of the file
descriptor or ioctl will access the freed csi structure, leading to a
use-after-free.

[ ... ]

> diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c b/drivers=
/media/platform/sunxi/sun4i-csi/sun4i_dma.c
> index 4781db21c2055..8804189a6e38c 100644
> --- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
> +++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
> @@ -356,6 +356,16 @@ static void sun4i_csi_stop_streaming(struct vb2_queu=
e *vq)
>  	v4l2_subdev_call(csi->src_subdev, video, s_stream, 0);
>  	sun4i_csi_capture_stop(csi);
> =20
> +	/*
> +	 * Disable the frame done interrupt and wait for the handler to
> +	 * finish. A frame may complete right as capture is stopped, so an
> +	 * interrupt can still be pending here; without this the handler could
> +	 * run after the device is powered down (pm_runtime_put() on release)
> +	 * and access registers on a gated block.
> +	 */
> +	writel(0, csi->regs + CSI_INT_EN_REG);
> +	synchronize_irq(csi->irq);

[Severity: High]
Does this regression need a read back to flush the posted write before call=
ing
synchronize_irq()?

writel() performs a posted write on the memory bus, meaning it is buffered
and may not reach the interrupt controller immediately. Without a dummy
readl() to the same register to flush the write buffer, synchronize_irq()
may execute and return before the hardware actually disables the interrupt.

This could leave a race window where the device could raise a new interrupt
just after synchronize_irq() finishes, leading to a handler running after
the device is powered down or buffers are freed.

> +
>  	/* Release all active buffers */
>  	spin_lock_irqsave(&csi->qlock, flags);
>  	return_all_buffers(csi, VB2_BUF_STATE_ERROR);

[Severity: High]
This isn't a regression introduced by this patch, but could this code free =
DMA
buffers while the hardware may still be actively writing to them?

As noted in the commit message, stopping the capture engine via
sun4i_csi_capture_stop() only stops it at the end of the current frame.
However, sun4i_csi_stop_streaming() immediately frees the DMA scratch buffer
and returns all active buffers to the core without waiting for the hardware
to become idle.

Although the interrupt is disabled, the hardware DMA engine remains active
and will continue writing the remainder of the frame into the freed scratch
memory or into buffers that userspace might have already reclaimed.

Additionally, would the error path in sun4i_csi_start_streaming() also suff=
er
from the same problem?

drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c:sun4i_csi_start_streamin=
g() {
    ...
    ret =3D v4l2_subdev_call(csi->src_subdev, video, s_stream, 1);
    if (ret < 0 && ret !=3D -ENOIOCTLCMD)
        goto err_disable_device;

    return 0;

err_disable_device:
    sun4i_csi_capture_stop(csi);
    ...
err_free_scratch_buffer:
    dma_free_coherent(csi->dev, csi->scratch.size, csi->scratch.vaddr,
                      csi->scratch.paddr);

err_clear_dma_queue:
    spin_lock_irqsave(&csi->qlock, flags);
    return_all_buffers(csi, VB2_BUF_STATE_QUEUED);
    spin_unlock_irqrestore(&csi->qlock, flags);
    ...
}

The err_disable_device path stops capture but does not disable the interrupt
or wait for the hardware to finish before freeing the scratch buffer and
returning all queued buffers.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786184456.gi=
t.congnt264@gmail.com?part=3D2
