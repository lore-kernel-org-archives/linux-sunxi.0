Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4250398911
	for <linux-sunxi@lists.linux.dev>; Mon, 10 Aug 2026 06:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786343870; cv=none; b=E5veYRLNMiQ6eIAvrAy4qo8uxPeaTrIQBkFIbzNN+WYXMdeNRlBZ/6aSa3Jmi5wKubn5sWuQghjxrN/87C7iEqS6zpARdYeMljvIo0bXXrQrCT3vApvYmLkCJ5PF+/vljTVcU0NZN4vmEewgzUib+vuN03eZnV1s662IeyaSfeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786343870; c=relaxed/simple;
	bh=59VVznsh50eZLS9ynHuXLPhFvmjkZHXIma7ebQt72WA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aq7SkuUYeUqF49+NAZ3JJ4z4dZ+rx9eZl+yjQ4K69m/CtBdTHG1wSIu46FdvzGoVE6WCErhqISqHDLbcRt+2CXKdqjRQDbdEm+V5N25UhIcAqO0bUkkCZ70ZmPYFikjylt3gdN1j9Vq6PTokHATlDsKOLFu/OtrRArWPIaSnv60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ohqFzOKZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ohqFzOKZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F6D71F000E9;
	Mon, 10 Aug 2026 06:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786343868;
	bh=7wAZ0UNKc0QQfXfj4Lq38Q6exy0NkMk3vaYBsM5j4ic=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ohqFzOKZ6ZNKw2zv7Y1GqZZC2eZlQDsJqe3gQKTG92YkDL+xz8k8nMeAX3EfRB9U1
	 r8LsxC0kBCj4cYAJAmPII6iw05FYPMFIZCGWB/1BKN8RwoCVJgkerk5sdw4oomaPx0
	 gduBZkFj6aon4QyhyJGIw6lLigTI3EO49eYGT6bYsZ0Cfh+riigTsabgrHgaZ1vbEn
	 Er1GlhQy7Bd/F2n72C7p7WGA/M0mFUPgjVgs1ZKy5Jw1EnyeTp8NJqJmCGNaE6d/jW
	 LVogE0D4CpXqQNV6p1iR9qsX7Tv3jQ60wB3iitfsWD68WtjkfXlQBs5KllB04Dgfkq
	 eRIDniYYwE5UA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] media: sun4i-csi: disable interrupts when
 stopping streaming
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cong Nguyen" <congnt264@gmail.com>
Cc: linux-sunxi@lists.linux.dev, media-ci@linuxtv.org
In-Reply-To: <20260810062521.1709379-3-congnt264@gmail.com>
References: <cover.1786184456.git.congnt264@gmail.com>
 <20260810062521.1709379-1-congnt264@gmail.com>
 <20260810062521.1709379-3-congnt264@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 06:37:47 +0000
Message-Id: <20260810063748.4F6D71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] DMA use-after-free and memory corruption due to freeing buffer=
s while capture engine is still running
--

--- Patch [2]: [PATCH v2 2/3] media: sun4i-csi: disable interrupts when sto=
pping streaming ---
commit f908e51d92a92db663d06b38deb5bee451c659e7
Author: Cong Nguyen <congnt264@gmail.com>

media: sun4i-csi: disable interrupts when stopping streaming

This commit addresses a crash where a delayed frame-done interrupt could
access the device after it is powered down. It fixes this by explicitly
disabling the interrupt and waiting for the handler to complete before
proceeding with device shutdown.

Cc: stable@vger.kernel.org

> diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c b/drivers=
/media/platform/sunxi/sun4i-csi/sun4i_dma.c
> index 4781db21c2055..3401a91cb310f 100644
> --- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
> +++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
[ ... ]
> @@ -330,6 +347,7 @@ static int sun4i_csi_start_streaming(struct vb2_queue=
 *vq, unsigned int count)
> =20
>  err_disable_device:
>  	sun4i_csi_capture_stop(csi);
> +	sun4i_csi_disable_irq(csi);
> =20
>  err_disable_pipeline:
>  	video_device_pipeline_stop(&csi->vdev);

[Severity: Critical]
This isn't a bug introduced by this patch, but does the hardware DMA engine
continue writing to memory after sun4i_csi_capture_stop() returns?

As noted in the commit message, capture stops at the end of the current
frame. If the DMA engine is still running, it looks like we might free the
scratch buffer immediately afterwards in the error path:

err_free_scratch_buffer:
	dma_free_coherent(csi->dev, csi->scratch.size, csi->scratch.vaddr,
			  csi->scratch.paddr);

Could this cause memory corruption if the hardware writes to the freed
scratch buffer before it finishes the current frame?

> @@ -355,6 +373,7 @@ static void sun4i_csi_stop_streaming(struct vb2_queue=
 *vq)
> =20
>  	v4l2_subdev_call(csi->src_subdev, video, s_stream, 0);
>  	sun4i_csi_capture_stop(csi);
> +	sun4i_csi_disable_irq(csi);
> =20
>  	/* Release all active buffers */
>  	spin_lock_irqsave(&csi->qlock, flags);

[Severity: Critical]
This is a pre-existing issue, but similar to the error path above, are we
returning active buffers to userspace while the DMA engine might still be
actively writing to them?

	sun4i_csi_capture_stop(csi);
	sun4i_csi_disable_irq(csi);

	/* Release all active buffers */
	spin_lock_irqsave(&csi->qlock, flags);
	return_all_buffers(csi, VB2_BUF_STATE_ERROR);
	spin_unlock_irqrestore(&csi->qlock, flags);

	video_device_pipeline_stop(&csi->vdev);

	dma_free_coherent(csi->dev, csi->scratch.size, csi->scratch.vaddr,
			  csi->scratch.paddr);

If capture stops asynchronously at the end of the frame, returning these
buffers and freeing the scratch buffer immediately afterwards could allow
the DMA engine to overwrite memory that has already been reclaimed or
reused. Is there a need to poll or wait for the DMA engine to completely
halt before cleaning up?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810062521.1709=
379-1-congnt264@gmail.com?part=3D2
