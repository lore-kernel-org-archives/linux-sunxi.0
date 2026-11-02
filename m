Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639002;
	b=4eyS6NiCb65fF99hlT6ayhGnOxy5xm4FO8mAIEePFpg0PGXKKGfnngURPI0Ha/DalDUx
	 lFDXvBR1pVr+pXmYLWGc0MFqr/67596c1WdLgSIIwytwYitRUR4teODfjJa+2BPMaVnoY
	 DJCQYbJxYp8W2fKBAncOhnkrBxxiCPPiKlhQfTAb5qAek3Niv5AXsjPZqEGO8rnqABkiV
	 FODSqHzmOZCmMWUaYbJYkOZ61EjJtaKvNV0g/zW6Y1Euy9b6mfIFoiclZDmm5TOWRK5m2
	 K9Wl6ykHoV0qRNilyQfCy+FGibiKGtyiSfz6jxLRL8MPPITp7qHb1zKTZk3S4F4DpVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639002;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=f5lmPxUQrehbk3MnxRPQzuHAZsqfVJpRH/eTUnAIWdE=;
	b=2L+J1b3Vboj9idLnVMH3AyCMTYiTbKDXIIBa6KC67hBUFvUdAEdQ2cSZt/AD2ftozovf
	 p9IYOZIsDI5zA72y3pCbEPn4SkvKZOzTuwXKSLdVZ6AL1WNawXpCLjz79LTw0X4TXXcb+
	 6VE71NUVGQPbOX4LhO0LcDTMT/FZSDmnwuQAaEUnLU6ZrYmhDqT4+bq15JjQa6rvh7Dy1
	 +oC24UxR+0YMW/qQL6vi4MkD4jnr39nsUGHSwcxi08gB4z3S13APUY9RpfvN4U/yGi6pA
	 eb5Q6CCZox1AQ35T59y86zyZjqZZyet2sMbUbtHZsUTpdjIBkyIUHbo9XRbwJGCfU0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OeA3gHXj;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9829606A5A6
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Nov 2026 17:03:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9829606A5A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OeA3gHXj
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e00eee27dso1628634f8f.0
        for <linux-sunxi@lists.linux.dev>; Mon, 02 Nov 2026 09:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639000; x=1794243800; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f5lmPxUQrehbk3MnxRPQzuHAZsqfVJpRH/eTUnAIWdE=;
        b=OeA3gHXjBzIAxrTK3e7vvcPsLlRisRfQYSUezr6Tfzdv0V6K/y9T8HarmZacWYkIl2
         LK6V99mfhISMgKc8KmdZeWCZJ/SZmAYmj5nj7tUuBQQZzaoaRtAqAy+2R6YdweQX0vBw
         jHIu1awyrmnbqkDeXbz9SizdyxYAOJTC4gcq7Am+ImwnZ4wU1j6gxAofHMYGZJ4Y3d9h
         hoQWw3/Oz1NG+VJ2tfdR20ibDLETPSDz1i1IefS59jJBXTMfs4JSNM5W9yl1nnQdxDoH
         vvpj+TSaEAaZrnOp57SB7qs7rA7RDethV79QiOohOYcDn6VhdMxTg5qQMgIydlLLY3Ya
         lFwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639000; x=1794243800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f5lmPxUQrehbk3MnxRPQzuHAZsqfVJpRH/eTUnAIWdE=;
        b=jmaFHBueZYYId8VFdtYZ7P9IIDcSRZX4SioCbUQSZjh4PXtoaxSSgdSPebSsvdDD9S
         N7PRzLUFU05ntniSlHbk81HinXxY8i8xAqdFzelI74FoeMD0xbMlRq7dwznK0k2qVJvu
         8v14O3AUE5/XXaUUlCOsrYB5Z/Hi8hZu/BOwM5ZNbKAR8vfagJr1UCfTnYVGR8UKwnWj
         akFYt7v24fmZ4Ka9HMAh3XA5Vb4d+cL787LqdywHc7ozrdF8q4mHsRRm2DvcxQSM/dBg
         aNXtsa0OVLPfAKWd8sRLr9ZjdQtL+8NpLa0rqrfa+RPMT2wM2fgbPaUx7CbbU7Ng1ZCl
         FQoA==
X-Forwarded-Encrypted: i=1; AKwUvBy4U+O8wf0fQiWplS2NqciWBPh46khu+rTPPx2YmOv1l/6hLpaXtWtyV2C/9MfmSpnFmO9Xvv38O37QiA==@lists.linux.dev
X-Gm-Message-State: AFq9FYIgyTLWHdMHd9QQHRkyZZgFF0Q0NFnDUOBLrc0ClUWsSxiast+A
	5dx2FcNWEEwVBS+TGUt1KMOU27cG3K34Zo6+Sjh4cY1opBctz3xWcXpz
X-Gm-Gg: AYBFou3In1ovZqak85FifDjtjpyU95ZTRtkq44UG2H/+hGZSrJJvAyFlWQuBjkJbtM5
	G3HSg2T6hgg7HvBv190criFYiIc88InL+rVT7JcMK46qNNtog+x1w3NPig8lftTOX7BC4wyOLSh
	ddR+wlavHMtMxaxLmqk2JggV8B+jMT020o0QbP7tb06rLDrzbPW+3xSDMB2YhYsbo+47RWP0S3v
	MyOURvR1KaP78N2X8rIWy6871QcblhiGlhY/jq8mqLDyRGxz0ywaZxaXWS6rK5ArthUCbcmVc09
	3KxNOfbkgRNDVWanLqhkSsDYDCgZHrK2a1qNAAV1m6wYw5e2LZGzBVTtJh6RjXBhOh67j7gtWAy
	9A+A1gR2+o++yfFMBRvyVKirazrpxdq/tAGZ/Cgc314rck9Z1IGb/C/48q5jtvIuuhOvPa8smgP
	1nX1jE/dCsPuJQdhgRCvGBgs5BVINI+KQTJz5R6z6L+Z1V5Oi1GU58STvzbxhPWMvof/H1iaqc4
	5VvcPityqJSAGoN4d7mPuRP2yP6WIB/2tYVIixeE9MOmD3P3POdI5jFdEhRKxbmPALuFG2a1kdo
	ysBgsvyZSx0255sGneB2xvM53DXZZxMC+oSoqiFJvy5JRG5NI6bKpTffMO/1COdKBviM3nPhcn/
	WEh6sdLo3WJIRQ/T38hn7/aXbcKdYRf8UOg5gi1ZywN+sqxFDxjdmOXwLrZ8IUc0AKVCObPgPlK
	X3AGHRoqAQQCtRFPFpe+pfjKViHVMIUpllZ/3hnDWL1mRiEZBNLTZFZYx+xbZRpq5xH0H167H4D
	28Roimq+XvdsNinO3Zp00zkeH3TQ9e38ZHn1ubOGUA9/iugKg==
X-Received: by 2002:a05:600c:3b1a:b0:4a7:9044:a87 with SMTP id 5b1f17b1804b1-4ac18c73df6mr248056415e9.27.1793639000058;
        Mon, 02 Nov 2026 09:03:20 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm23362309f8f.7.2026.11.02.09.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:03:18 -0800 (PST)
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
Subject: [PATCH 02/10] staging: media: cedrus: reject too large H.264/HEVC SPS
Date: Mon,  2 Nov 2026 18:02:55 +0100
Message-ID: <20261102170303.1973892-3-jernej.skrabec@gmail.com>
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

The hardware decodes whatever picture size the SPS describes. An SPS
beyond CEDRUS_MAX_WIDTH/HEIGHT, or beyond the capture buffers once they
are allocated, makes the hardware overrun memory and hang. On H616, the
JCT-VC PICSIZE_A..D streams (1056x8440, 8440x1056, 528x4216 and
4216x528) leave the hardware wedged, so that every following job times
out until reboot.

Validate the SPS picture size in try_ctrl. Move the size limits to
cedrus_video.h for that.

Fixes: 6eb9b758e307 ("media: cedrus: Add H264 decoding support")
Fixes: 86caab29da78 ("media: cedrus: Add HEVC/H.265 decoding support")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c   | 40 ++++++++++++++++++-
 .../staging/media/sunxi/cedrus/cedrus_video.c |  5 ---
 .../staging/media/sunxi/cedrus/cedrus_video.h |  5 +++
 3 files changed, 44 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index c3331b4f3f02..45deebddb630 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -28,10 +28,38 @@
 #include "cedrus_dec.h"
 #include "cedrus_hw.h"
 
+/*
+ * The hardware decodes whatever picture size the bitstream headers describe.
+ * Reject sizes beyond the hardware limits, or beyond the capture buffers once
+ * they are allocated, instead of letting the hardware overrun memory and hang.
+ */
+static int cedrus_check_pic_size(struct cedrus_ctx *ctx, u32 width, u32 height)
+{
+	struct vb2_queue *vq;
+
+	if (width > CEDRUS_MAX_WIDTH || height > CEDRUS_MAX_HEIGHT)
+		return -EINVAL;
+
+	/*
+	 * The hardware decodes whole 16x16 macroblocks, and all capture
+	 * formats pad the buffers to at least 16 pixels in both directions.
+	 */
+	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
+	if (vb2_is_busy(vq) &&
+	    (width > ALIGN(ctx->src_fmt.width, 16) ||
+	     height > ALIGN(ctx->src_fmt.height, 16)))
+		return -EINVAL;
+
+	return 0;
+}
+
 static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
 {
+	struct cedrus_ctx *ctx = container_of(ctrl->handler, struct cedrus_ctx, hdl);
+
 	if (ctrl->id == V4L2_CID_STATELESS_H264_SPS) {
 		const struct v4l2_ctrl_h264_sps *sps = ctrl->p_new.p_h264_sps;
+		u32 height;
 
 		if (sps->chroma_format_idc != 1)
 			/* Only 4:2:0 is supported */
@@ -42,9 +70,15 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
 		if (sps->bit_depth_luma_minus8 != 0)
 			/* Only 8-bit is supported */
 			return -EINVAL;
+		height = (sps->pic_height_in_map_units_minus1 + 1) * 16;
+		if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY))
+			height *= 2;
+		if (cedrus_check_pic_size(ctx,
+					  (sps->pic_width_in_mbs_minus1 + 1) * 16,
+					  height))
+			return -EINVAL;
 	} else if (ctrl->id == V4L2_CID_STATELESS_HEVC_SPS) {
 		const struct v4l2_ctrl_hevc_sps *sps = ctrl->p_new.p_hevc_sps;
-		struct cedrus_ctx *ctx = container_of(ctrl->handler, struct cedrus_ctx, hdl);
 		unsigned int bit_depth, max_depth;
 		struct vb2_queue *vq;
 
@@ -52,6 +86,10 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
 			/* Only 4:2:0 is supported */
 			return -EINVAL;
 
+		if (cedrus_check_pic_size(ctx, sps->pic_width_in_luma_samples,
+					  sps->pic_height_in_luma_samples))
+			return -EINVAL;
+
 		bit_depth = max(sps->bit_depth_luma_minus8,
 				sps->bit_depth_chroma_minus8) + 8;
 
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
index adc7f255d7cf..2521315abdb7 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -29,11 +29,6 @@
 #define CEDRUS_DECODE_SRC	BIT(0)
 #define CEDRUS_DECODE_DST	BIT(1)
 
-#define CEDRUS_MIN_WIDTH	16U
-#define CEDRUS_MIN_HEIGHT	16U
-#define CEDRUS_MAX_WIDTH	4096U
-#define CEDRUS_MAX_HEIGHT	2304U
-
 static struct cedrus_format cedrus_formats[] = {
 	{
 		.pixelformat	= V4L2_PIX_FMT_MPEG2_SLICE,
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.h b/drivers/staging/media/sunxi/cedrus/cedrus_video.h
index 8e1afc16a6a1..367e52158f01 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.h
@@ -22,6 +22,11 @@ struct cedrus_format {
 	unsigned int	capabilities;
 };
 
+#define CEDRUS_MIN_WIDTH	16U
+#define CEDRUS_MIN_HEIGHT	16U
+#define CEDRUS_MAX_WIDTH	4096U
+#define CEDRUS_MAX_HEIGHT	2304U
+
 extern const struct v4l2_ioctl_ops cedrus_ioctl_ops;
 
 int cedrus_queue_init(void *priv, struct vb2_queue *src_vq,
-- 
2.43.0

