Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639015;
	b=fSs9/uC3l2LZ4z87POjiIKalkJNXCihknSrGHg0Ss3lsi4oBfQOiKlwz3GoZJG4KdPrS
	 1Dum9y/osJCRQ9csjeuLabF9IyyTU8OjltPJiW6AP6ouuGZSY5SHo3Gr+REZM7shBStg8
	 wx4PCK33xZAJpKhuQnZ++idDob+qQ0snmvM7NtAejZzzjV60BYy639l1VnIEZjeywQBVN
	 7z8XaG+aVvE2Ae5972d1BCJtKJ+XTl/6O1gGlIx2ylSXbUiohn5EHjytUXMpId1Y3AuiM
	 WFrr1yhs3LG0yp9t+MeJVxWytWiIs1wgsZ/W2vrzXKM31Jy4P/UukyE7ibmXHPANLMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639015;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1JZu6J7aylRQ5JJVlZ6UGCYBdNV4VlQcY/+pJe4FsfQ=;
	b=3G96jdo/GD1ZCwHEpPQ848/95NP324IZjg8yTFTSFUpO303i5mqf1xUWzbylFPlGPMg8
	 V+PkQ5qvLwSBtldEjZz7GsODvFq8r6o+DDm+3uLuq6aNTSHyeyAk4q+ANp2Dxerkpyzaz
	 DeiNu5ageLeUuyyl7A2r7tFU9H/eiOUMi4Qw9x4tWy1kYiwHXxRQPfIn5gb8BICvCwhk3
	 flR41v7+uV8MCKT19H6uavdrR9Tl2BESxYmwF+2Y88J0P3G0H2naU/NIaQsLpd4IR3cXI
	 JihR+Cc0HxbP6i8kt/iNfvwe6E8RqxEaspqU0LgTLbDhi8nekUTOaKoU0qcf5BaFilg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c97hZHWD;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D2460AED1C
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Nov 2026 17:03:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97D2460AED1C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c97hZHWD
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso20785005e9.0
        for <linux-sunxi@lists.linux.dev>; Mon, 02 Nov 2026 09:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639013; x=1794243813; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1JZu6J7aylRQ5JJVlZ6UGCYBdNV4VlQcY/+pJe4FsfQ=;
        b=c97hZHWDzibT7SBKPcheelIKPryry4iyrFiIeh1pRTxzwmd9PFPB2m/03PRwr03GaX
         2536nwFGGP8pkPClYz/eqwn32F+XzvYtfWgrFwAbX4T180W4nKug2kwttLreHEZX0MqG
         EGleQFvBY1jRFH7lEaqrmciz1j5vZwcfHqDnP7dpaqT5rIr6LDyyyvKVg8NGp9sZLpPA
         CHPeMLTIRMaUEOICk/F/Q8FWS/oQLV3V1/Ek3nyGTCcEJkmooARLK0044A2Pt2ILQhnW
         AO9QjzeVf6Hlf2qU6xqBlIZ3UBe3TKFXT9iqi1SxNzBVPczUcHUJ0gEh5GB0iR7WjqMj
         4S1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639013; x=1794243813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1JZu6J7aylRQ5JJVlZ6UGCYBdNV4VlQcY/+pJe4FsfQ=;
        b=t1/G0oyBEcoxoV+87czo2/Q6BbQM6XR7sawWujvkg9l6ZrDyp9M21jAL/yXlFWdTia
         nhtviGP0gybYJGAasryPypf74kboBwROF5X7g+Augh3sxxPLXWQjKKTP5cj1z/bw+zrX
         LEiFwzSxzJ0qbW6KzTXD7VfXDzm0TFlL/Rjq1qT9FtT0dX3ttQXiUrrgWlTIsGw4DB4o
         N2DCROEIC/105KMUbTS1W7F6fVgtvhxaw+4pOpj5DTei9Hm3qZte7aey8eSeXBjUekVl
         ZxjvwxO2I8D2ju603fApMxub/aeh5n1tazIznACjs0n21CfxmB+xDQk4EA09fqgDM+dp
         z+3g==
X-Forwarded-Encrypted: i=1; AKwUvBxVza9/xDZoxqOKCgPkwS2tze/zTpm/vcAJPJJZQcUohL9m9KndKrcBuUODEkh5w5BFmgENRSeS/dm9CQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYLc88EievYNaFdXg1BK5Ns9l/Nbaa1TOElscyRQhx22nym3bV5A
	+wx41E8RzLUNFhfD4yJKeYLc/uIKkHBTmshJEgckDIRaNxijlLvwvj/0
X-Gm-Gg: AYBFou3irRinYTUZ5oeFRfK7/4Y/H8MpjWpkSoYosbjb82GP4nb1G/dG9rtnj7I3i4m
	ULoF7wW7qFJTc9FZGdd6NtdiMikXaPEUQhlNj21CqeoEYR6TizfS4+2Z1nIKxoVvLM0Ntpz/GOP
	Bw34dSoaU97EWtwynai5xsQZvBuDWJy6mNRxM1WlaetBUpa346IP5sECU0L+MHdxMD+fCI3QJh4
	nwPdzngtp2uq5sVb/EqMVZF8u9wUGSy14jjObYRgWyZuMMN6yL9tNIXaSyV0/jm+g1dG6vOEqdO
	fMOprxsiX/lV3LFteA8WgwSq5lO88A1LppzOnL8r6iO6DxxT565z4b39MXyhWauJuaiVY63zM5t
	8mLMCCtws2F8XUKWE88Ls4TeB6ikNi8f1JQ1iQpmD8dBv7RBnv6/SkB2Le11ucS0S2QkfmJUsOh
	FPGxEhaeFNqPJCzvNvytC4smTbmgmppaGVdNLMPzJNcR0T0NLe5zGs1snWvEOQoKoctDR1V1TFO
	8CDVkaW7KwHBPcMsm9fSkPi3n8NlJmh+1WnHPMmZSyaDmJ43kwShaYn4jhGaPnPmkajl2ere2+Z
	yfiOhJYADTZ3dnUzBCSOf/eJQONhXVbXT0UVSzrrXPIHGs3VJwpY/W8aGoaKODoKD2dKHY0frOk
	SPB5XSXMT5Kyg/tzyHXa1qZYabhMY5Vmu6gYmVrc7JO34IDmU3TiY8JfjthFyG+dPO3CEKZ1gOO
	3FCbx53co1wvljYDzZNl/J02epBcBiqm9ujIXC5NYXaWL/zSj2nXQ7m45bz26zgq9WoCm5PzvmF
	Dn4v7EfjdZvYwDr0MvKijzsmT7+WpweD5fP2ES0P2DSohrnLA==
X-Received: by 2002:a05:600c:a012:b0:4a3:59c9:a747 with SMTP id 5b1f17b1804b1-4ac1793fb0fmr244438125e9.17.1793639012878;
        Mon, 02 Nov 2026 09:03:32 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm23362309f8f.7.2026.11.02.09.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:03:32 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 10/10] staging: media: cedrus: vp8: support frames wider than 2048 pixels
Date: Mon,  2 Nov 2026 18:03:03 +0100
Message-ID: <20261102170303.1973892-11-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
References: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Above 2048 pixels, the deblocking and intra prediction row buffers don't
fit into the internal SRAM anymore. Put them into DRAM like H.264 does.
The vendor library sizes the deblocking buffer as 24 bytes per column.

Tested on H616 with 2560x1440 and 3840x2160 libvpx streams, which are
bit-exact with the FFmpeg software decoder.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.h   |  7 ++
 .../staging/media/sunxi/cedrus/cedrus_vp8.c   | 64 +++++++++++++++++++
 2 files changed, 71 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index d28fe91562d1..ca4efa9302fc 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -156,6 +156,13 @@ struct cedrus_ctx {
 
 			u8		*entropy_probs_buf;
 			dma_addr_t	entropy_probs_buf_dma;
+
+			void		*deblk_buf;
+			dma_addr_t	deblk_buf_dma;
+			ssize_t		deblk_buf_size;
+			void		*intra_pred_buf;
+			dma_addr_t	intra_pred_buf_dma;
+			ssize_t		intra_pred_buf_size;
 		} vp8;
 	} codec;
 };
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
index 6b00efa77c22..954c0ceb98ed 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
@@ -666,6 +666,20 @@ static int cedrus_vp8_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 
 	cedrus_write(dev, VE_H264_CTRL, VE_H264_CTRL_VP8);
 
+	if (ctx->codec.vp8.deblk_buf_size) {
+		cedrus_write(dev, VE_BUF_CTRL,
+			     VE_BUF_CTRL_INTRAPRED_MIXED_RAM |
+			     VE_BUF_CTRL_DBLK_MIXED_RAM);
+		cedrus_write(dev, VE_DBLK_DRAM_BUF_ADDR,
+			     ctx->codec.vp8.deblk_buf_dma);
+		cedrus_write(dev, VE_INTRAPRED_DRAM_BUF_ADDR,
+			     ctx->codec.vp8.intra_pred_buf_dma);
+	} else {
+		cedrus_write(dev, VE_BUF_CTRL,
+			     VE_BUF_CTRL_INTRAPRED_INT_SRAM |
+			     VE_BUF_CTRL_DBLK_INT_SRAM);
+	}
+
 	cedrus_vp8_update_probs(slice, ctx->codec.vp8.entropy_probs_buf);
 
 	reg = slice->first_part_size * 8;
@@ -849,7 +863,44 @@ static int cedrus_vp8_start(struct cedrus_ctx *ctx)
 	memcpy(&ctx->codec.vp8.entropy_probs_buf[2048],
 	       prob_table_init, sizeof(prob_table_init));
 
+	/*
+	 * Above 2048 pixels the deblocking and intra prediction row buffers
+	 * no longer fit into the internal SRAM. The vendor library sizes the
+	 * deblocking buffer as 24 bytes per (32 aligned) column.
+	 */
+	if (ctx->src_fmt.width > 2048) {
+		ctx->codec.vp8.deblk_buf_size =
+			ALIGN(ctx->src_fmt.width, 32) * 24;
+		ctx->codec.vp8.deblk_buf =
+			dma_alloc_attrs(dev->dev, ctx->codec.vp8.deblk_buf_size,
+					&ctx->codec.vp8.deblk_buf_dma,
+					GFP_KERNEL, DMA_ATTR_NO_KERNEL_MAPPING);
+		if (!ctx->codec.vp8.deblk_buf)
+			goto err_probs;
+
+		ctx->codec.vp8.intra_pred_buf_size =
+			ALIGN(ctx->src_fmt.width, 64) * 5 * 2;
+		ctx->codec.vp8.intra_pred_buf =
+			dma_alloc_attrs(dev->dev,
+					ctx->codec.vp8.intra_pred_buf_size,
+					&ctx->codec.vp8.intra_pred_buf_dma,
+					GFP_KERNEL, DMA_ATTR_NO_KERNEL_MAPPING);
+		if (!ctx->codec.vp8.intra_pred_buf)
+			goto err_deblk;
+	}
+
 	return 0;
+
+err_deblk:
+	dma_free_attrs(dev->dev, ctx->codec.vp8.deblk_buf_size,
+		       ctx->codec.vp8.deblk_buf, ctx->codec.vp8.deblk_buf_dma,
+		       DMA_ATTR_NO_KERNEL_MAPPING);
+	ctx->codec.vp8.deblk_buf_size = 0;
+err_probs:
+	dma_free_coherent(dev->dev, CEDRUS_ENTROPY_PROBS_SIZE,
+			  ctx->codec.vp8.entropy_probs_buf,
+			  ctx->codec.vp8.entropy_probs_buf_dma);
+	return -ENOMEM;
 }
 
 static void cedrus_vp8_stop(struct cedrus_ctx *ctx)
@@ -861,6 +912,19 @@ static void cedrus_vp8_stop(struct cedrus_ctx *ctx)
 	dma_free_coherent(dev->dev, CEDRUS_ENTROPY_PROBS_SIZE,
 			  ctx->codec.vp8.entropy_probs_buf,
 			  ctx->codec.vp8.entropy_probs_buf_dma);
+
+	if (ctx->codec.vp8.deblk_buf_size) {
+		dma_free_attrs(dev->dev, ctx->codec.vp8.deblk_buf_size,
+			       ctx->codec.vp8.deblk_buf,
+			       ctx->codec.vp8.deblk_buf_dma,
+			       DMA_ATTR_NO_KERNEL_MAPPING);
+		dma_free_attrs(dev->dev, ctx->codec.vp8.intra_pred_buf_size,
+			       ctx->codec.vp8.intra_pred_buf,
+			       ctx->codec.vp8.intra_pred_buf_dma,
+			       DMA_ATTR_NO_KERNEL_MAPPING);
+		ctx->codec.vp8.deblk_buf_size = 0;
+		ctx->codec.vp8.intra_pred_buf_size = 0;
+	}
 }
 
 static void cedrus_vp8_trigger(struct cedrus_ctx *ctx)
-- 
2.43.0

