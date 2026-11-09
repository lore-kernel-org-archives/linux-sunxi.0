Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246670;
	b=H43Grkt466bJ62VnL2o49bu78zXntZmZFaBXVbAL4Pjae8DcZJSmpKLrhP9zv15IW2cC
	 grfckn8Yp4rZyuhH5kQTuPEb4AbzaRoh5IvMQwAfeKYRZWLB/DfxGKV4hRneX7HvKyjeH
	 IpPaXV/QejmXhHvlY5wuVYUTkUHAvkyfSw0PhNURLj5TMMeLVltGSSxtQAA3FnYJXhF/L
	 9xtMjFyukOLMsTzm1eomg78f24xX+qiCg6QcnCcBVfreP37n3ODyj5sOPEDxnkJUZ5pCr
	 SFkpiOudW4G4hoRn9hzZV8ZSXdu7VL9NTMTr7A/ybwSRhY/lnht8A56lavjnONnJUJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246670;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EHFCx52QXB+dxM1oRGEYW8olq3Iv2zM5Gz/ZhK7pFLA=;
	b=XTEgleKbLAkHnSiBmcEHw+DmMjbdx1GzAP8994bwNCrWZedbbGArPr4hn05rYotvaxG4
	 u5R30UFNQ2UFrVBYzabomg+JGfUnm6OzrMBRr4JkUSY1O/S4XiwVPWq7VjrCnz02V7un+
	 r8E9eZQCjvLwY4ajUcGc0MQp13axpyvFdO/6p569AHq2Ra6zNt5Dve5GEYDknzl/HI2xG
	 d499m0SprW5kElnQLevczDLNceoGLZ2WGdkQZ+ue6KgOU+ajyJKcKSaXze5tXEgnD938b
	 LFD3MVFoYux0gbfZ7wDIELLydlgNz+wwd2hGlJLykDtUUN52tKkFnBeezcHRplM/M7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v2sSRnxt;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1AE606A33F
	for <linux-sunxi@lists.linux.dev>; Mon,  9 Nov 2026 17:51:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF1AE606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v2sSRnxt
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48b001cd92bso581438f8f.2
        for <linux-sunxi@lists.linux.dev>; Mon, 09 Nov 2026 09:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246667; x=1794851467; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EHFCx52QXB+dxM1oRGEYW8olq3Iv2zM5Gz/ZhK7pFLA=;
        b=v2sSRnxtVLVXn62j8lI/G3D+FSs9liIWpWCm1QsysqOdTklzT3e54Aj29fJri0ZLHw
         9NXUps5sHjywXSajSNxV7+72eqnST7GZW6D5U0YrSk8YrF5+W62ztZh1Mno4+lXK3Qkj
         +yYDBZWlIYOW0rDKh6yPPj33dJZAWRBuwhhyoEvwfN5K7tw4kjZ5nxJV4HV8oJH3cgrN
         OJ7HEGOdc+WOZMwzBH9ww+1NvQT++fhlVhE3HZ1eiOsJHLP5oD9gDH0tGUtAaMSuJeVt
         2HZW8mPQMuoUTPtfbfUfWw2s/SRCFieCexpJAMtqMIuOouC1tubSGfsrCIoUQdUyLQZ/
         ZeaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246667; x=1794851467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EHFCx52QXB+dxM1oRGEYW8olq3Iv2zM5Gz/ZhK7pFLA=;
        b=s/wUdBq07ocKWJrRrwCWp9aXE4Wee4XL7KgdeMXx39vEvODCFxMp/b/NCKaT3pVQRi
         aqEZ3Q13SIPWS7GxyDcLe87wGwZHc1547vYcXUIRP5PlUt4vzIBdyVkD21rpx+HUDa2c
         UTVbN5xDKJTWSUAZGGdpUWO/R85qU7rkKKJUdthX7o8EG0Vuql4eEg1m7vpvRuyek62A
         cSbrrd3Fy+LOQT8HCsXzgVYrcypxDifxuBakYSUCgqoMdBpnydK8p6o7ojFZMT0FmvTp
         aLcnGegVAei2I/m8hFxQjtrM3Snby/U+0qhjQztIti0clRBp4UaGU6xh8lQNCLCwo7rc
         OBKg==
X-Forwarded-Encrypted: i=1; AL+hErGQ2GoCJoVQpV+y/nkC/JRPprZFwUt1cdQ49BC+trDhqBbxyHf2cT9P8k26p1Yn3vjm983SMp+5KN0GTg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+gM6DUVCU0KnsncuK8bCxgZPkveBbmF4Np01c2+TiEWUT/YF/o
	filUXKJrUBB8/yIZcBV5Ws4TUZ+evp2iDDevIvB/MXwKXqhwu3Mj8UKc
X-Gm-Gg: AYBFou3oZxM3Rj6T/2hRZsPyqg6yJkjaZHszTAusKRgeZA/+e8wmDq3DTbdzUi+SabO
	N83U4ZcPoBV1r25PXx4JwTUBaxI4aos89QyODyYnH1/NF197bEtebNEWrd5qD1K5dc7r0qjyZYS
	rMoE2SRW+bd/kIsKcBt/6WnQnBXItHc8U83HyCWPDOC3hJ/2ShfJ1uo6ADjLE/nRKf6mEfjo8KP
	aKBNS1iu0VISJlf6XWoisWOXcsj4ad5hacdn3ZoCgSTHutVBe+1hHe8/30xDXL1O+vdpzq/DS4H
	BPKZS30z5hSxqSgfezlznRUWebWuBdpYFfqadnPD/P2NfxS2JrTkDH6gsZ14kDOSKE3ApwOfRNP
	9VWeMmK2hChpvdl1L6ngde7G/ZGsUoTn/xDWyQw3XsYbbCgK6rO7AbH96PwSd7qnSDs6r5o7x3s
	ZT6hu47QDYUuItQJw3m+40QIi+RuDqaqUwVq39I5HjezLFwPtqwS8x9bw5Sy0EToYx41oETjv4N
	2trzWI/Uhg0l5xe+XEfIGyH9EK7cOFqJy4A5aDknJ8gSQU3kH+N589DUEFleKVqfyIzl8dFfOkt
	R1W39dn/jOInBH/dUjmaMODzrtFXvHZoAS/zBIlL6c+6p2VL2YWUkPyhikLzdMgFIGn+GIBbeOu
	Ew38pjqh2aLYhHYY11GJVZOCrtvehQ0q2Z0YBfO6MshVfE9uV4pAcu1p+TUqV2nR91XpRQgMP0+
	JqfU5rHWFlZb8BYgCTkznpTAbihz/IhVEDKODmPB/0MQcf2qI6dauNJjsyIB8ajQhZ4qvv5rDnR
	WZcJy00B9IAlAy727keUVFSv4UEoxr4lfF3w/M53SR7SdCleGnE+6sznw==
X-Received: by 2002:a05:6000:26cb:b0:491:da8f:7276 with SMTP id ffacd0b85a97d-4982eb0b774mr396069f8f.26.1794246667071;
        Mon, 09 Nov 2026 09:51:07 -0800 (PST)
Received: from jernej-laptop (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a4238sm200717f8f.54.2026.11.09.09.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:51:05 -0800 (PST)
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
Subject: [PATCH v2 01/11] staging: media: cedrus: free MV-col buffers in buf_cleanup
Date: Mon,  9 Nov 2026 18:50:06 +0100
Message-ID: <20261109175016.42061-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109175016.42061-1-jernej.skrabec@gmail.com>
References: <20261109175016.42061-1-jernej.skrabec@gmail.com>
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

v4l2_m2m_ctx_release() releases the CAPTURE queue before the OUTPUT
queue. When userspace closes the file handle without STREAMOFF, the
CAPTURE buffers are already gone by the time the OUTPUT stop_streaming
calls the codec stop() callback, so the per-buffer H.264/HEVC MV-col
buffers are never freed. This is easily reproduced by killing a player
during H.264 or HEVC decoding. Each killed 1080p session leaks about
2.3 MiB.

Add a buf_cleanup codec op, called from the vb2 buf_cleanup of the
CAPTURE queue, and free the MV-col buffer there. stop() keeps using the
same helper.

Fixes: fec94f8c9954 ("media: cedrus: h264: Optimize mv col buffer allocation")
Fixes: 0ee952c2f484 ("media: cedrus: h265: Associate mv col buffers with buffer")
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.h   |  1 +
 .../staging/media/sunxi/cedrus/cedrus_h264.c  | 28 +++++++++++--------
 .../staging/media/sunxi/cedrus/cedrus_h265.c  | 28 +++++++++++--------
 .../staging/media/sunxi/cedrus/cedrus_video.c | 10 +++++++
 4 files changed, 43 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index c4b1217c14b6..54f867949fba 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -167,6 +167,7 @@ struct cedrus_dec_ops {
 	int (*setup)(struct cedrus_ctx *ctx, struct cedrus_run *run);
 	int (*start)(struct cedrus_ctx *ctx);
 	void (*stop)(struct cedrus_ctx *ctx);
+	void (*buf_cleanup)(struct cedrus_ctx *ctx, struct cedrus_buffer *buf);
 	void (*trigger)(struct cedrus_ctx *ctx);
 	unsigned int (*extra_cap_size)(struct cedrus_ctx *ctx,
 				       struct v4l2_pix_format *pix_fmt);
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
index fc54d993b11f..892193c12b2f 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
@@ -647,10 +647,23 @@ static int cedrus_h264_start(struct cedrus_ctx *ctx)
 	return ret;
 }
 
+static void cedrus_h264_buf_cleanup(struct cedrus_ctx *ctx,
+				    struct cedrus_buffer *buf)
+{
+	if (buf->codec.h264.mv_col_buf_size > 0) {
+		dma_free_attrs(ctx->dev->dev,
+			       buf->codec.h264.mv_col_buf_size,
+			       buf->codec.h264.mv_col_buf,
+			       buf->codec.h264.mv_col_buf_dma,
+			       DMA_ATTR_NO_KERNEL_MAPPING);
+
+		buf->codec.h264.mv_col_buf_size = 0;
+	}
+}
+
 static void cedrus_h264_stop(struct cedrus_ctx *ctx)
 {
 	struct cedrus_dev *dev = ctx->dev;
-	struct cedrus_buffer *buf;
 	struct vb2_queue *vq;
 	unsigned int i;
 
@@ -662,17 +675,7 @@ static void cedrus_h264_stop(struct cedrus_ctx *ctx)
 		if (!vb)
 			continue;
 
-		buf = vb2_to_cedrus_buffer(vb);
-
-		if (buf->codec.h264.mv_col_buf_size > 0) {
-			dma_free_attrs(dev->dev,
-				       buf->codec.h264.mv_col_buf_size,
-				       buf->codec.h264.mv_col_buf,
-				       buf->codec.h264.mv_col_buf_dma,
-				       DMA_ATTR_NO_KERNEL_MAPPING);
-
-			buf->codec.h264.mv_col_buf_size = 0;
-		}
+		cedrus_h264_buf_cleanup(ctx, vb2_to_cedrus_buffer(vb));
 	}
 
 	dma_free_attrs(dev->dev, CEDRUS_NEIGHBOR_INFO_BUF_SIZE,
@@ -710,5 +713,6 @@ struct cedrus_dec_ops cedrus_dec_ops_h264 = {
 	.setup		= cedrus_h264_setup,
 	.start		= cedrus_h264_start,
 	.stop		= cedrus_h264_stop,
+	.buf_cleanup	= cedrus_h264_buf_cleanup,
 	.trigger	= cedrus_h264_trigger,
 };
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
index 780da4a8b5af..6c643862ab73 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
@@ -858,10 +858,23 @@ static int cedrus_h265_start(struct cedrus_ctx *ctx)
 	return 0;
 }
 
+static void cedrus_h265_buf_cleanup(struct cedrus_ctx *ctx,
+				    struct cedrus_buffer *buf)
+{
+	if (buf->codec.h265.mv_col_buf_size > 0) {
+		dma_free_attrs(ctx->dev->dev,
+			       buf->codec.h265.mv_col_buf_size,
+			       buf->codec.h265.mv_col_buf,
+			       buf->codec.h265.mv_col_buf_dma,
+			       DMA_ATTR_NO_KERNEL_MAPPING);
+
+		buf->codec.h265.mv_col_buf_size = 0;
+	}
+}
+
 static void cedrus_h265_stop(struct cedrus_ctx *ctx)
 {
 	struct cedrus_dev *dev = ctx->dev;
-	struct cedrus_buffer *buf;
 	struct vb2_queue *vq;
 	unsigned int i;
 
@@ -873,17 +886,7 @@ static void cedrus_h265_stop(struct cedrus_ctx *ctx)
 		if (!vb)
 			continue;
 
-		buf = vb2_to_cedrus_buffer(vb);
-
-		if (buf->codec.h265.mv_col_buf_size > 0) {
-			dma_free_attrs(dev->dev,
-				       buf->codec.h265.mv_col_buf_size,
-				       buf->codec.h265.mv_col_buf,
-				       buf->codec.h265.mv_col_buf_dma,
-				       DMA_ATTR_NO_KERNEL_MAPPING);
-
-			buf->codec.h265.mv_col_buf_size = 0;
-		}
+		cedrus_h265_buf_cleanup(ctx, vb2_to_cedrus_buffer(vb));
 	}
 
 	dma_free_attrs(dev->dev, CEDRUS_H265_NEIGHBOR_INFO_BUF_SIZE,
@@ -918,6 +921,7 @@ struct cedrus_dec_ops cedrus_dec_ops_h265 = {
 	.setup		= cedrus_h265_setup,
 	.start		= cedrus_h265_start,
 	.stop		= cedrus_h265_stop,
+	.buf_cleanup	= cedrus_h265_buf_cleanup,
 	.trigger	= cedrus_h265_trigger,
 	.extra_cap_size	= cedrus_h265_extra_cap_size,
 };
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
index ad4ec3490775..adc7f255d7cf 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -560,6 +560,15 @@ static void cedrus_stop_streaming(struct vb2_queue *vq)
 	cedrus_queue_cleanup(vq, VB2_BUF_STATE_ERROR);
 }
 
+static void cedrus_buf_cleanup(struct vb2_buffer *vb)
+{
+	struct cedrus_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
+
+	if (V4L2_TYPE_IS_CAPTURE(vb->vb2_queue->type) &&
+	    ctx->current_codec && ctx->current_codec->buf_cleanup)
+		ctx->current_codec->buf_cleanup(ctx, vb2_to_cedrus_buffer(vb));
+}
+
 static void cedrus_buf_queue(struct vb2_buffer *vb)
 {
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
@@ -579,6 +588,7 @@ static const struct vb2_ops cedrus_qops = {
 	.queue_setup		= cedrus_queue_setup,
 	.buf_prepare		= cedrus_buf_prepare,
 	.buf_queue		= cedrus_buf_queue,
+	.buf_cleanup		= cedrus_buf_cleanup,
 	.buf_out_validate	= cedrus_buf_out_validate,
 	.buf_request_complete	= cedrus_buf_request_complete,
 	.start_streaming	= cedrus_start_streaming,
-- 
2.43.0

