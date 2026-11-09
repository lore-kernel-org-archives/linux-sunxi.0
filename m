Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246670;
	b=VnUQrUMYLYBbAGYqoXLYSnGEVLW3YszMUhCHQycnCLvkBx3loZbx1JmAGcDhE3FGeiOw
	 GsNTZw/OYXpgKJnVKv3Q5+PelIt613uhzhSsAYJRA81ZBojrtWgXUnhthnAQKQL5ftZQ5
	 32W2DrNZD170H5fX9+wlri96NrPCE9zAOF8xKPILaX1iA14Vn34zyQoPJRXQHuCZ0h4Ih
	 nNdD8ofjwdvsW1wM752gu9piaZkgbXs38LIIHjrMpPFaeZDgA6dHpnedAjijEyvjFvgcT
	 W3fywbaMkgs+8MJcLWLhr78G1jU26QblLA2XWK9x/yeoM4Clhfr7iQmKAdIYDdyx0GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246670;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PRBCcyxG7vdWjrF56CJga6rW7J1Hfqypo5bq8n0AjVE=;
	b=LqGnnu9zwgULtG1iefT8mRs4JszCSl4b5t8OJMg4p0n+Qx5iVTvTp8pUoTKdqc76s0wA
	 R8b2OTJj6/kf8e0KC5Y+VqJ9N5XYSTkc6AP3aYZSWravJBw7Mm+FCgR+qg2yHqpn3Q9UX
	 8QIm04U2Kbiqs/7PkFdEfJ8thiHFUhbNfgnn8r2e4Re79jsloitRYeFacM4XK/8FA0yX6
	 qJS7qQN8M0xzKPFNYpLSbKiZ3aGhdVsPRBSD8k+N3pjfiJcY5USDTUziHIo2ddX2r66x2
	 MK1OVvN04HW5hGGiUrwSzPbN4NdTw4mpY6u3kSPexbaQUBmAsGlg/KsS5mJGDXHs6gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xkQXVfM3;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77FA60A261A
	for <linux-sunxi@lists.linux.dev>; Mon,  9 Nov 2026 17:51:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E77FA60A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xkQXVfM3
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso8165325e9.1
        for <linux-sunxi@lists.linux.dev>; Mon, 09 Nov 2026 09:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246668; x=1794851468; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PRBCcyxG7vdWjrF56CJga6rW7J1Hfqypo5bq8n0AjVE=;
        b=xkQXVfM3q/4ki7nP5BJvlXKb2BsBMVjW2CEzbEgk0bmciU0YbPJqTS592xX2kYqnSX
         yXZRswtipyVWFKHUYHGcPKuYnLGS6OPaY4uyqQGQZJjpA4k1ppHH4aD162F3nxC9xxJK
         F/RsBAEl0YobD7MCvCTaDn5R0Bkjp+8HTbhjBTzEcqv2sN5PJ4Xf+YKaSFgON0lz6cmI
         XaZF67hiOdkkSD6E9qLGmyU6ZjUOi4Ltk2DmjlsQ2j3u7Z7cuf2wguUOVGHOKteCUCTt
         PnuUUxe1wKvKRrde3EfHzd/divtik53lKNhavlbfsAV2GZcNfxD1hg0g1wjWBpgLRi8k
         46YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246668; x=1794851468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PRBCcyxG7vdWjrF56CJga6rW7J1Hfqypo5bq8n0AjVE=;
        b=xDNOuGo7dbFDNTLd3Ev28tDVz0XmfdSd0WskcA7kskR5nUv9OAVbIhiDYMgCL0gZNx
         M8/siNKTH5Nyt9pLHuSxOcD6T37M+D79tLx+ySbcq1BRsFTtouOJX0A/Y0euFvohHclI
         Nt/MkbILry0Z5zEUsq36VC5D2YLgHCtMYWcEFpGUXulNxpIKR+0uYPsUS/oANIU/AHor
         N3pOCGSawsMUoSNVutg7zGkOtpe1dPDQfVSPgUvGoHqAygeBabgKEAqW3YKX3bLbQ47v
         WMTfs0Zau9xpvK+1Yq1nx11njuKXHd0smYNBnpsroXm0bZDesuWdbrhKkECksLGUBaRy
         +oPQ==
X-Forwarded-Encrypted: i=1; AL+hErHDvVQWLUPuKMxO7riUYE/QY+qOlHUq4UO1HfFYCcYdo85ahJkLVEaIGvK9qfKIdKm8/PfcRoF5ceiiww==@lists.linux.dev
X-Gm-Message-State: APuU4Z88gEh/WZhFXPFBYIM+F6He4hW/vkM37ADqIIzafkMWHi2GdNTr
	pRVCIFxl6pzNtp8hQwA82UQh7qqPS9wpm0qYJtsqtoJJ80F1nLNPj1NV
X-Gm-Gg: AYBFou2FUFHJaEaPciO3LEQenpxM11PMIli/RaJMmzJsd4OAItDQe3iQeC6Ods/pfpA
	WTkWMOCatJICsXQSCPf0GR87gJcGG339GW7lRK8lv2xBGXoEHiaAmeReo9p4damGW2s6bg1BLlc
	Ojx1tFsU276IOXKLe1JAxSTnCPBFLb1o7ULKhC+xIE04QBrrz1XFOfGiPlrbcQFDXpRxZu3iLc1
	xcmVGadsnqlrOqRidmoDp7e4po9sHCxucBq9g/LKYvy5Oc7cM1vH+sR+loEHstqK2pTunus2bGn
	YR61RVaFlrCEyOmD0zSybxf1wMw3OgvDktW5Yyn5Ms7q3zXNMfR/iVvSNKcPa1MJgtV+GDF2hwI
	sCkPqSKBRkllOwQ94qZecLdePRX2/LGEKGYCCYrFrnNx+cjjw9faSEU2NVtu7yUpz+yc954qKs4
	1Tx6fHzQvOoXZivTBX/PPyGCjj3MxYyRzz+wf0jqF0OIH9XUUYIJoerxsPcarDINNMPvePARm1k
	pzdto1HNqBLDeDsxDFE/d9yiKkPjEDUpESkALwJqOrjJzXkxahukotDvsOacXj4XvGsOstBo2XC
	g0gkEINn9b2TauZNJMa4ruxoSw6vPaBhQMAiYfy//Rh6vTmPyNDwfZJAf55L5cucYtv3ybl6nXZ
	d0ld0YN21AtSIpGqgKCF4MCyaoCOqQp6W8Su5vMc1mgGc8HMhjp4cMA9g8ieMzvO29/NrWD+W2F
	YIxXLYEzzGq+GPd10PZ5zJZE4VAh3EC3vuA5mX/IcEdzjVCgMgmPUoda7ECv8k1DxmVsDkYM6wB
	1n2MHekPEO518jz0E1RgTcgQ358nAmsi1MDc0su6CMn75oKCm4=
X-Received: by 2002:a05:600c:1906:b0:4af:79ee:f660 with SMTP id 5b1f17b1804b1-4b963c8153cmr86011895e9.31.1794246668365;
        Mon, 09 Nov 2026 09:51:08 -0800 (PST)
Received: from jernej-laptop (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a4238sm200717f8f.54.2026.11.09.09.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:51:07 -0800 (PST)
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
Subject: [PATCH v2 02/11] staging: media: cedrus: reject too large H.264/HEVC SPS
Date: Mon,  9 Nov 2026 18:50:07 +0100
Message-ID: <20261109175016.42061-3-jernej.skrabec@gmail.com>
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

The H.264 decoder takes the picture size from the SPS, and the HEVC
decoder the position of the slices. An SPS beyond CEDRUS_MAX_WIDTH/HEIGHT,
or beyond the capture buffers, makes the hardware overrun memory and
hang. On H616, the JCT-VC PICSIZE_A..D streams (1056x8440, 8440x1056,
528x4216 and 4216x528) leave the hardware wedged, so that every
following job times out until reboot.

Reject an SPS beyond the hardware limits in try_ctrl, and move the
limits to cedrus_video.h for that.

Whether the picture fits the buffers can only be checked when a job
runs: the SPS can be set before the buffers are allocated, while the
OUTPUT format they are sized from can still change, and a request
doesn't have to carry an SPS at all. Check it in the setup callbacks,
so that such a job fails with an error buffer instead.

Fixes: 6eb9b758e307 ("media: cedrus: Add H264 decoding support")
Fixes: 86caab29da78 ("media: cedrus: Add HEVC/H.265 decoding support")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c   | 16 +++++++++
 drivers/staging/media/sunxi/cedrus/cedrus.h   | 34 +++++++++++++++++++
 .../staging/media/sunxi/cedrus/cedrus_h264.c  |  6 ++++
 .../staging/media/sunxi/cedrus/cedrus_h265.c  |  4 +++
 .../staging/media/sunxi/cedrus/cedrus_video.c |  5 ---
 .../staging/media/sunxi/cedrus/cedrus_video.h |  5 +++
 6 files changed, 65 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index c3331b4f3f02..197213911bf7 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -28,6 +28,15 @@
 #include "cedrus_dec.h"
 #include "cedrus_hw.h"
 
+/*
+ * Reject picture sizes beyond the hardware limits. Whether the picture fits
+ * the buffers is checked when a job is set up, see cedrus_check_pic_size().
+ */
+static bool cedrus_pic_size_supported(u32 width, u32 height)
+{
+	return width <= CEDRUS_MAX_WIDTH && height <= CEDRUS_MAX_HEIGHT;
+}
+
 static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
 {
 	if (ctrl->id == V4L2_CID_STATELESS_H264_SPS) {
@@ -42,6 +51,9 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
 		if (sps->bit_depth_luma_minus8 != 0)
 			/* Only 8-bit is supported */
 			return -EINVAL;
+		if (!cedrus_pic_size_supported(cedrus_h264_sps_width(sps),
+					       cedrus_h264_sps_height(sps)))
+			return -EINVAL;
 	} else if (ctrl->id == V4L2_CID_STATELESS_HEVC_SPS) {
 		const struct v4l2_ctrl_hevc_sps *sps = ctrl->p_new.p_hevc_sps;
 		struct cedrus_ctx *ctx = container_of(ctrl->handler, struct cedrus_ctx, hdl);
@@ -52,6 +64,10 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
 			/* Only 4:2:0 is supported */
 			return -EINVAL;
 
+		if (!cedrus_pic_size_supported(sps->pic_width_in_luma_samples,
+					       sps->pic_height_in_luma_samples))
+			return -EINVAL;
+
 		bit_depth = max(sps->bit_depth_luma_minus8,
 				sps->bit_depth_chroma_minus8) + 8;
 
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index 54f867949fba..c2318521d7e5 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -274,6 +274,40 @@ cedrus_is_capable(struct cedrus_ctx *ctx, unsigned int capabilities)
 	return (ctx->dev->capabilities & capabilities) == capabilities;
 }
 
+/*
+ * The decoders take the picture size, or the position of the slices, from
+ * the bitstream headers. Check that the picture fits the buffers, which are
+ * sized from the OUTPUT format and padded to at least 16 pixels in both
+ * directions, so that the hardware doesn't overrun them and hang.
+ */
+static inline int cedrus_check_pic_size(struct cedrus_ctx *ctx,
+					unsigned int width, unsigned int height)
+{
+	if (width > ALIGN(ctx->src_fmt.width, 16) ||
+	    height > ALIGN(ctx->src_fmt.height, 16))
+		return -EINVAL;
+
+	return 0;
+}
+
+static inline unsigned int
+cedrus_h264_sps_width(const struct v4l2_ctrl_h264_sps *sps)
+{
+	return (sps->pic_width_in_mbs_minus1 + 1) * 16;
+}
+
+static inline unsigned int
+cedrus_h264_sps_height(const struct v4l2_ctrl_h264_sps *sps)
+{
+	unsigned int height = (sps->pic_height_in_map_units_minus1 + 1) * 16;
+
+	/* Map units are macroblock pairs, unless only frames are coded. */
+	if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY))
+		height *= 2;
+
+	return height;
+}
+
 void *cedrus_find_control_data(struct cedrus_ctx *ctx, u32 id);
 u32 cedrus_get_num_of_controls(struct cedrus_ctx *ctx, u32 id);
 
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
index 892193c12b2f..e8229c60d3f5 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
@@ -518,9 +518,15 @@ static void cedrus_h264_irq_disable(struct cedrus_ctx *ctx)
 
 static int cedrus_h264_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 {
+	const struct v4l2_ctrl_h264_sps *sps = run->h264.sps;
 	struct cedrus_dev *dev = ctx->dev;
 	int ret;
 
+	ret = cedrus_check_pic_size(ctx, cedrus_h264_sps_width(sps),
+				    cedrus_h264_sps_height(sps));
+	if (ret)
+		return ret;
+
 	cedrus_engine_enable(ctx);
 
 	cedrus_write(dev, VE_H264_SDROT_CTRL, 0);
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
index 6c643862ab73..aa772a8d71c8 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
@@ -445,6 +445,10 @@ static int cedrus_h265_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	cedrus_buf = vb2_to_cedrus_buffer(&run->dst->vb2_buf);
 	slice_bytes = vb2_get_plane_payload(&run->src->vb2_buf, 0);
 
+	if (cedrus_check_pic_size(ctx, sps->pic_width_in_luma_samples,
+				  sps->pic_height_in_luma_samples))
+		return -EINVAL;
+
 	/*
 	 * If entry points offsets are present, we should get them
 	 * exactly the right amount.
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

