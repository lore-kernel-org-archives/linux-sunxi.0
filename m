Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638998;
	b=1A0CIaMrz73+xb6L8zWMZj2SKJZbvNYdt181hbP9Es1Y69v15d6UnvkAyfCtjIKe35oO
	 +kUA9F5lhyVqwGDx3QqxAs2LsI7QS6KPPrXJsYiBR5Jy6IhzoRSP9iGqjcAgT30Rb1A91
	 cSd28eg/vRnxOt8Hf2tvQdJzO+FTICUI78zgPQeMIsv4wQCY9lvRtC2bLTm8Fw1gq+LSJ
	 qqQFnDtFiYHOerVmPUDzTdfGAGoXAH7p1NN+uhmP0JyS68JFpXrDKIoYtjnJM/nWfA+TW
	 QmzF7fEqIPzWO7I13nzdiSyTSVUe/IS+wKbFTeocjHJeuMXo8kvRq7jyL7l6AM4+G0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638998;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BuM2x27esv9HJJ72txAMjkLX+sEnXEmUVgCjirEtUA8=;
	b=U+G/M9T4XGCqhiJPkafE8REoIf3bLFy1HpVyf3oielp1mwfVhLaoYlotu8NwqShTv/u5
	 L5GnyDgPns+f7mS+OCEeUcO8skb36orWIqli0K2+fdfJAVodfSQzAYqhqNuBj2VCStvH6
	 qtF3/eiQ9LJ35hUt0HVdwquLx4m9YSaLyTfo3MPAPVJTclpnhBu5IlKc0leFZfd/WDVs8
	 umSnM0BVaTE9d4Zi80RmDd5iEedylEgGNxmah2alHYKs0LH4ZM1GiXSbuNekrMwiOXgqg
	 nsjj1+KfJJJrtbKYHLIpZTSF37RChomTx9/NVZCw6sv4vIvc4FSn+EISnkmhDKWclsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iUI2mtfe;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990B8606C541
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Nov 2026 17:03:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 990B8606C541
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iUI2mtfe
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so34238565e9.0
        for <linux-sunxi@lists.linux.dev>; Mon, 02 Nov 2026 09:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793638996; x=1794243796; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BuM2x27esv9HJJ72txAMjkLX+sEnXEmUVgCjirEtUA8=;
        b=iUI2mtfe5maCWhewBplCFR++kOxcjTwyrrua80x7Fq41c/9VEmZd2FcXj4M7vEzZKd
         EWD36SF1GwWj1Kfuf09rmPc7drYosTd699FEEevNjDYwo85Kft70zVZ9cvrAmbBT5To2
         Zc2zwfVTlB89EdIwzeFsHrweIcY/AZaceXve1Q9RoEkjmm/M3dRAFlGyY7Q7BY56ybEG
         WxDRLqR0uPF/jNIZukps/B/zZ1f/7YxtC475q/OzHfG/7IdtfJzUwgLzs2MrXWtbp73D
         7ec8c8rzweE+RMUV4E+mS6pead9I2gXy3qpF0NhprE58Ak+MzzCJ5DeKC3ZFr1TPuqkO
         gVZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793638996; x=1794243796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BuM2x27esv9HJJ72txAMjkLX+sEnXEmUVgCjirEtUA8=;
        b=h9QKAyGH1duzmgZ787STBWNEZbMpUCjOgLKqmhfjACSoF2mItaRkbgFSElHVJAERme
         n63sn+tmfx7TiPwIUF6irhJlIPWmRHzmZYE6V7j8ZLEtPIJ3J5l3OXReH2WN/1xRctjo
         R42cVaUr+1DRQinl2rYrttaeV/d2cp2FHRMPXGjohbR2RyTVUfLvHTHjwIiJfKhG7Szw
         wVGXnnDvoHU1YfmvSK24Ao02dg/KnCzd34qBTC7oMDFFvXnWn2t4AyRSoZmcYpU4fN+a
         Radz4AUZJHtcO7lDmaFoK/WXLBhm4tix3904fy3aGpuauA7Cx7x0WO6sguLo1LFNk3w5
         ZrEw==
X-Forwarded-Encrypted: i=1; AKwUvBxaDSCvw56CQzfkN+Fgg2hiLwD0nGGHS0A+m7yhpYTsnU6pLjV8/dly38yN3eFrQdonhvMgQHi9BORdcg==@lists.linux.dev
X-Gm-Message-State: AFq9FYI1Ugv3VjQ/CJElu4fqNfyCG6K/Q1GU7Scz34sptqfOZcwoeu1V
	hryaItACStUbvmiKYod+u0mXlIprzu2tsSJqSdpiyBUC8jxp50wURK+Y
X-Gm-Gg: AYBFou0IPcyFx+/pVAYdbKFkqOwPmAFeI0+nKfs5O0p5muP5DMKUxwdtb8/a13PQb0O
	vqZD6fCYtNUtvM7I3X+z8dzzxj82/YXk/U8mlNMghBV0I0VCLhqtW9H4gIV2lsrXGNw4YoBLBIk
	qzUNjd7EmLFI/VAs3fr9mYO7DGCuqBDT3+9Nmx98Wl3dB2Cd4NNpiTWF/qwNo4Yr8n2pGd+pC4+
	PVHyOyLs4x0xJMWLVCYBtOJqdcILKHbLmlHjnAP5gym7SSaNTUzZ8dLPUufUqzmgA5uAMQGN4O7
	BRW4pKeYEjdtXO+ROeaKZ9kYoEFTR2T/8b/gr+z1hSGyPZxFVWaji5kZFemHB6eq1uceRZc2Fjq
	YxbCHSxx0mNk2vnHOmoSW+r6bmNfb8OmFx0/OCeQkyX2/SD0etvqWyDDUgX4tC/h4gFdSIxXOsZ
	J6nD5jHOGR15LvEH1oKdCMzPusFy43zvAUwtQgaIis9+SgW/4elH8+8N1czvOelWLv5v2Twog3T
	HT1YYDLR5GoZshT7r17cgHTDXa6UQmOJfHUWk6D5crR1LiNU55Pnu2fbscM+XV3B2jvzH/Pt4QI
	DQNLwIV2nJBMaV1tnElDpXZ60S32POSssNDnp9xtfoHgzxYW4W0xJ3VYksvrhkemnS05tvQXFw3
	2siKHV3AFwoPyrKjmIvRszobhxeQZXsQWJp1UW6UXvE9qyJEtbmofiMuLzeYNstcAmF2TbPLFF1
	O2Pjn0Lm3s+OWRqwhv7epFYORiPFEdmeK5Y7eSLZao/Is6dQLp1a3iqMbpUgFN0/iFvV7XOyVhg
	VcV6624m+Gz45TrIn+10A6HE7076ucANRMpBGOJ3vNI7M6gUg==
X-Received: by 2002:a05:600c:848c:b0:4a6:42cc:bf65 with SMTP id 5b1f17b1804b1-4ac1709b206mr260803075e9.17.1793638995840;
        Mon, 02 Nov 2026 09:03:15 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm23362309f8f.7.2026.11.02.09.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:03:14 -0800 (PST)
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
Subject: [PATCH 01/10] staging: media: cedrus: free MV-col buffers in buf_cleanup
Date: Mon,  2 Nov 2026 18:02:54 +0100
Message-ID: <20261102170303.1973892-2-jernej.skrabec@gmail.com>
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

