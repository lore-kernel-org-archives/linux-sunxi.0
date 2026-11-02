Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793643780;
	b=BimTmL9MXfngLCJEFl42/GDWGOH4iihKdMIBqVPhN8NzIzeWqR8w5O7kO2wBlRpEibw0
	 gdn0jc2CGh70EKdXgMGE5HXuaLOKUW6JsyBzKVfKRnMWff5B2cjoe/76IzlH7ICBPNfng
	 dkidU0XOpR108TL+0Najrim43FKmLiIPclz2UxKUSrMhQ2xTl9XRXh1oX70pOOavcgcqL
	 d61N5OZsnwhwegVgclNiDhfSP1AtzvkVf5YTKmcODart0prt7NR2N8osXAWqsob/OuXYW
	 OPQjY75GshXds8VgrNgzZ+S07F9lhO1O0w2a8meDhXBN2G/+b+Rx3pk9tzNa08HdllA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793643780;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=fTpJVn4yiC0ZkzTyvmuTiKAlsl/ry6XNXbvT7wcw+oY=;
	b=xsvceM75cjgszKyIiLspTXwq5lYfk/RtjlwjNh7mLIu7jYliXvWHETpezJ3YQhDl6pXK
	 X3E/IK5D8/xc6pd3ULuX1UiTC74F/vmzyXQHkOT5lCEacqvrWg7WwjLivXrhMUxUO9ATo
	 B4COIVKyAH3ky451ieOHbqdpH61J2xEjkBo3g9OtDTHHyD0MhAnLtsGNMcNhqs00qT3e+
	 iLPpgyk/dFPDMTz8p5cMNR1WHrL+xoJ8cE+4wsziT84yZR24Fk6dB6QFEa3MIQqNFubhD
	 bL1SkQrAAyYrrRLMrTX5d4JMqgx3EzWHiKQEx4NcCuNZrcbl9baIS3JeF05Vica2bCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=o1TGGIBE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1AAA606A324
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Nov 2026 18:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=o1TGGIBE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FC851F00A16;
	Mon,  2 Nov 2026 18:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793643779;
	bh=fTpJVn4yiC0ZkzTyvmuTiKAlsl/ry6XNXbvT7wcw+oY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=o1TGGIBEyqnJ8q9JRLMeHZhdA+RDgfnFDKpvEy/zwCFffiCq+Bzdhw0oFLcfDcsu6
	 UYqBBPnRST+MYt1Y1wYTFqHekGkAAvHt32XTv2ZEmWRhq8lb9MCx5GCwCV5qCICDtv
	 3sGjuTbwXWCVXxTfUwJiiLoCVcI8TdtUB4oxvog6+Z9yML9029YcaqHhvX3N0LCTfK
	 vABbqb3iAVBQYqpdnI08xg72KtaMlic79O2wbMjd65vDGnedYfRka7QnVfiRr0z/OV
	 mD+7aXtk5vbLYntVIYQpJpV9kldUUMjI4DYJF+rAwzI2tkowiT6UCgZrrYBPoct1b5
	 bYJyEZL1kEL3g==
Message-ID: <sashiko-outbox-193931@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 10/10] staging: media: cedrus: vp8: support frames wider
 than 2048 pixels
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jernej Skrabec" <jernej.skrabec@gmail.com>
Cc: linux-sunxi@lists.linux.dev, media-ci@linuxtv.org
In-Reply-To: <20261102170303.1973892-11-jernej.skrabec@gmail.com>
References: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
 <20261102170303.1973892-11-jernej.skrabec@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 18:22:58 +0000
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] media: cedrus: vp8: stale deblk_buf_size in cedrus_vp8_start()
--

commit 2e3e9674b0e42d966116e3aba1d357709db8157f
Author: Jernej Skrabec <jernej.skrabec@gmail.com>

staging: media: cedrus: vp8: support frames wider than 2048 pixels

This commit adds support for decoding VP8 frames wider than 2048 pixels by
allocating the deblocking and intra prediction row buffers in DRAM when
they no longer fit in internal SRAM.

> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c b/drivers/st=
aging/media/sunxi/cedrus/cedrus_vp8.c
> index 6b00efa77c223..954c0ceb98ed2 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c

[ ... ]

> @@ -849,7 +863,44 @@ static int cedrus_vp8_start(struct cedrus_ctx *ctx)
>  	memcpy(&ctx->codec.vp8.entropy_probs_buf[2048],
>  	       prob_table_init, sizeof(prob_table_init));
> =20
> +	/*
> +	 * Above 2048 pixels the deblocking and intra prediction row buffers
> +	 * no longer fit into the internal SRAM. The vendor library sizes the
> +	 * deblocking buffer as 24 bytes per (32 aligned) column.
> +	 */
> +	if (ctx->src_fmt.width > 2048) {
> +		ctx->codec.vp8.deblk_buf_size =3D
> +			ALIGN(ctx->src_fmt.width, 32) * 24;
> +		ctx->codec.vp8.deblk_buf =3D
> +			dma_alloc_attrs(dev->dev, ctx->codec.vp8.deblk_buf_size,
> +					&ctx->codec.vp8.deblk_buf_dma,
> +					GFP_KERNEL, DMA_ATTR_NO_KERNEL_MAPPING);
> +		if (!ctx->codec.vp8.deblk_buf)
> +			goto err_probs;
> +
> +		ctx->codec.vp8.intra_pred_buf_size =3D
> +			ALIGN(ctx->src_fmt.width, 64) * 5 * 2;
> +		ctx->codec.vp8.intra_pred_buf =3D
> +			dma_alloc_attrs(dev->dev,
> +					ctx->codec.vp8.intra_pred_buf_size,
> +					&ctx->codec.vp8.intra_pred_buf_dma,
> +					GFP_KERNEL, DMA_ATTR_NO_KERNEL_MAPPING);
> +		if (!ctx->codec.vp8.intra_pred_buf)
> +			goto err_deblk;
> +	}
> +
>  	return 0;
> +
> +err_deblk:
> +	dma_free_attrs(dev->dev, ctx->codec.vp8.deblk_buf_size,
> +		       ctx->codec.vp8.deblk_buf, ctx->codec.vp8.deblk_buf_dma,
> +		       DMA_ATTR_NO_KERNEL_MAPPING);
> +	ctx->codec.vp8.deblk_buf_size =3D 0;
> +err_probs:
> +	dma_free_coherent(dev->dev, CEDRUS_ENTROPY_PROBS_SIZE,
> +			  ctx->codec.vp8.entropy_probs_buf,
> +			  ctx->codec.vp8.entropy_probs_buf_dma);
> +	return -ENOMEM;
>  }

[Severity: High]
Can ctx->codec.vp8.deblk_buf_size remain non-zero in cedrus_vp8_start()
when the DRAM buffers have not been allocated?

In cedrus_vp8_start(), ctx->codec.vp8.deblk_buf_size is set before calling
dma_alloc_attrs() for ctx->codec.vp8.deblk_buf. If that allocation fails,
execution jumps to err_probs, which skips resetting deblk_buf_size to 0
(and similarly, err_deblk does not reset intra_pred_buf_size to 0 when the
second allocation fails). If userspace then changes the OUTPUT format width
to 2048 or less and starts streaming again on the same context,
cedrus_vp8_start() skips the width > 2048 block and succeeds with
ctx->codec.vp8.deblk_buf_size still non-zero.

Similarly, because ctx->codec is a union in struct cedrus_ctx and
cedrus_vp8_start() does not clear deblk_buf_size when width <=3D 2048,
switching a context from another codec (such as H.264) to VP8 with
width <=3D 2048 can leave stale non-zero values in ctx->codec.vp8.

In both cases, cedrus_vp8_setup() and cedrus_vp8_stop() check
if (ctx->codec.vp8.deblk_buf_size), which will program VE_DBLK_DRAM_BUF_ADDR
and VE_INTRAPRED_DRAM_BUF_ADDR with unallocated or stale DMA addresses and
call dma_free_attrs() on unallocated or stale pointers when stopping.

Should cedrus_vp8_start() explicitly initialize deblk_buf_size and
intra_pred_buf_size to 0 (or reset deblk_buf_size under err_probs and
intra_pred_buf_size under err_deblk)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102170303.1973=
892-1-jernej.skrabec@gmail.com?part=3D10
