Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4D595C1
	for <linux-sunxi@lists.linux.dev>; Fri,  6 Jan 2023 19:40:46 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id az7so2224837wrb.5
        for <linux-sunxi@lists.linux.dev>; Fri, 06 Jan 2023 11:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TlIQMwTCvjZ8+X4/qPPH7+cIVsXNFRlJGbKFunxAzLw=;
        b=o/g4z2lntL7zEG9PJVE3gYds3qoD6yHVCpTzgJSJH9K938KB3yl6hrj0+SxYuTzBP0
         FuNGjEvOBsa3MglxR8nA6pxUM9BUWiSnfmvU9v1lakObsr+nXBVM/8ScOVA+jmkTvU+L
         BdSgjqeqZYSZDxSZ/5tjXK5jKzj5rAOphrBGQ71UZWFb10+vhMlCKtY60oX6QRbSjgER
         zxvNGTltPbPVskMrXBipP0itVYCICHerrZz+4kIl1DFOm5gBfg2hznJ0aSp6OMA8OSYn
         9lR6h5Q5GD1ViWOVOB0UUYwOIz4qmla4lhR0OwlD9GaubLWjnju5L+x5u5/FCqTwz9gx
         cKKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TlIQMwTCvjZ8+X4/qPPH7+cIVsXNFRlJGbKFunxAzLw=;
        b=hnLW5h5RfFbegdXsbhdJGpOFt4CofvSMQA0XFfTsCp8IMNz+ORF9VrhrnlKojvE3Ok
         Bo3jSj6fFw9HuNxhfu1qEejQDiRrxMFMX/VVwxqJh4s7W4Lm9XM8taX69dLDegrsde9v
         bvQuowoS4EmzuWMsXdqHCeIPJJCHmajcVHnRR95fuHysHcZ20KeOrAhzXWf8zWnHNUVc
         UAlvyW+JuL2KxUELzUeXUFfMZYMGy9hsbpUPD0yhMhj6iVaqaknXdSlSNSidhbFpbdc2
         PD34H9CpjlGqIUvXNQB8vAqEIZdZQjfMvWBdXS4r5aV1bSEigJZ0y89oA38SxsGZvkgm
         hxiw==
X-Gm-Message-State: AFqh2kp/d5BrEnnHH6grKOVQfoGS5+3rU9grmAhMHIWZoymZgIajSBRd
	BWCsMLysG+FTBx5+qEFM5WQ=
X-Google-Smtp-Source: AMrXdXt189ewVc2u/45hJm1MqIAPuynGmhZoe0fum4ytnWzbBFYsNcU1+ly4SPZltOihz0jVO+LQTQ==
X-Received: by 2002:adf:f606:0:b0:28c:1ae0:e67f with SMTP id t6-20020adff606000000b0028c1ae0e67fmr18051554wrp.55.1673034045282;
        Fri, 06 Jan 2023 11:40:45 -0800 (PST)
Received: from localhost.localdomain ([90.242.19.250])
        by smtp.gmail.com with ESMTPSA id bx9-20020a5d5b09000000b0023662245d3csm1968650wrb.95.2023.01.06.11.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 11:40:44 -0800 (PST)
Sender: Adam Pigg <piggz1@gmail.com>
From: adam@piggz.co.uk
To: linux-media@vger.kernel.org
Cc: yong.deng@magewell.com,
	mchehab@kernel.org,
	linux-sunxi@lists.linux.dev,
	paul.kocialkowski@bootlin.com,
	laurent.pinchart@ideasonboard.com,
	Adam Pigg <adam@piggz.co.uk>
Subject: [PATCH 1/3] media: sun6i-csi: merge sun6i_csi_formats and sun6i_csi_formats_match
Date: Fri,  6 Jan 2023 19:40:36 +0000
Message-Id: <20230106194038.16018-2-adam@piggz.co.uk>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230106194038.16018-1-adam@piggz.co.uk>
References: <20230106194038.16018-1-adam@piggz.co.uk>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Adam Pigg <adam@piggz.co.uk>

Merged the two format arrays into sun6i_csi_capture_formats as a
pre-requisite to implementing V4L2_CAP_IO_MC

Signed-off-by: Adam Pigg <adam@piggz.co.uk>
---
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 155 +++++-------------
 .../sunxi/sun6i-csi/sun6i_csi_capture.h       |   6 +-
 2 files changed, 46 insertions(+), 115 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
index 03d4adec054c..69578075421c 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
@@ -22,6 +22,8 @@
 
 /* Helpers */
 
+#define SUN6I_BUS_FMTS(fmt...) (const u32[]) {fmt, 0}
+
 void sun6i_csi_capture_dimensions(struct sun6i_csi_device *csi_dev,
 				  unsigned int *width, unsigned int *height)
 {
@@ -49,72 +51,86 @@ static const struct sun6i_csi_capture_format sun6i_csi_capture_formats[] = {
 		.pixelformat		= V4L2_PIX_FMT_SBGGR8,
 		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_8,
 		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_8,
+		.mbus_codes		= SUN6I_BUS_FMTS(MEDIA_BUS_FMT_SBGGR8_1X8),
 	},
 	{
 		.pixelformat		= V4L2_PIX_FMT_SGBRG8,
 		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_8,
 		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_8,
+		.mbus_codes		= SUN6I_BUS_FMTS(MEDIA_BUS_FMT_SGBRG8_1X8),
 	},
 	{
 		.pixelformat		= V4L2_PIX_FMT_SGRBG8,
 		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_8,
 		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_8,
+		.mbus_codes		= SUN6I_BUS_FMTS(MEDIA_BUS_FMT_SGRBG8_1X8),
 	},
 	{
 		.pixelformat		= V4L2_PIX_FMT_SRGGB8,
 		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_8,
 		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_8,
+		.mbus_codes		= SUN6I_BUS_FMTS(MEDIA_BUS_FMT_SRGGB8_1X8),
 	},
 	{
 		.pixelformat		= V4L2_PIX_FMT_SBGGR10,
 		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_10,
 		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_10,
+		.mbus_codes		= SUN6I_BUS_FMTS(MEDIA_BUS_FMT_SBGGR10_1X10),
 	},
 	{
 		.pixelformat		= V4L2_PIX_FMT_SGBRG10,
 		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_10,
 		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_10,
+		.mbus_codes		= SUN6I_BUS_FMTS(MEDIA_BUS_FMT_SGBRG10_1X10),
 	},
 	{
 		.pixelformat		= V4L2_PIX_FMT_SGRBG10,
 		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_10,
 		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_10,
+		.mbus_codes		= SUN6I_BUS_FMTS(MEDIA_BUS_FMT_SGRBG10_1X10),
 	},
 	{
 		.pixelformat		= V4L2_PIX_FMT_SRGGB10,
 		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_10,
 		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_10,
+		.mbus_codes		= SUN6I_BUS_FMTS(MEDIA_BUS_FMT_SRGGB10_1X10),
 	},
 	{
 		.pixelformat		= V4L2_PIX_FMT_SBGGR12,
 		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_12,
 		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_12,
+		.mbus_codes		= SUN6I_BUS_FMTS(MEDIA_BUS_FMT_SBGGR12_1X12),
 	},
 	{
 		.pixelformat		= V4L2_PIX_FMT_SGBRG12,
 		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_12,
 		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_12,
+		.mbus_codes		= SUN6I_BUS_FMTS(MEDIA_BUS_FMT_SGBRG12_1X12),
 	},
 	{
 		.pixelformat		= V4L2_PIX_FMT_SGRBG12,
 		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_12,
 		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_12,
+		.mbus_codes		= SUN6I_BUS_FMTS(MEDIA_BUS_FMT_SGRBG12_1X12),
 	},
 	{
 		.pixelformat		= V4L2_PIX_FMT_SRGGB12,
 		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_12,
 		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_12,
+		.mbus_codes		= SUN6I_BUS_FMTS(MEDIA_BUS_FMT_SRGGB12_1X12),
 	},
 	/* RGB */
 	{
 		.pixelformat		= V4L2_PIX_FMT_RGB565,
 		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_RGB565,
 		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_RGB565,
+		.mbus_codes		= SUN6I_BUS_FMTS(MEDIA_BUS_FMT_RGB565_2X8_LE),
 	},
 	{
 		.pixelformat		= V4L2_PIX_FMT_RGB565X,
 		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_RGB565,
 		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_RGB565,
+		.mbus_codes		= SUN6I_BUS_FMTS(MEDIA_BUS_FMT_RGB565_2X8_BE),
 	},
 	/* YUV422 */
 	{
@@ -123,6 +139,8 @@ static const struct sun6i_csi_capture_format sun6i_csi_capture_formats[] = {
 		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_8,
 		.input_format_raw	= true,
 		.hsize_len_factor	= 2,
+		.mbus_codes		= SUN6I_BUS_FMTS(MEDIA_BUS_FMT_YUYV8_2X8,
+							 MEDIA_BUS_FMT_YUYV8_1X16),
 	},
 	{
 		.pixelformat		= V4L2_PIX_FMT_YVYU,
@@ -130,6 +148,8 @@ static const struct sun6i_csi_capture_format sun6i_csi_capture_formats[] = {
 		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_8,
 		.input_format_raw	= true,
 		.hsize_len_factor	= 2,
+		.mbus_codes		= SUN6I_BUS_FMTS(MEDIA_BUS_FMT_YVYU8_2X8,
+							 MEDIA_BUS_FMT_YVYU8_1X16),
 	},
 	{
 		.pixelformat		= V4L2_PIX_FMT_UYVY,
@@ -137,6 +157,8 @@ static const struct sun6i_csi_capture_format sun6i_csi_capture_formats[] = {
 		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_8,
 		.input_format_raw	= true,
 		.hsize_len_factor	= 2,
+		.mbus_codes		= SUN6I_BUS_FMTS(MEDIA_BUS_FMT_UYVY8_2X8,
+							 MEDIA_BUS_FMT_UYVY8_1X16),
 	},
 	{
 		.pixelformat		= V4L2_PIX_FMT_VYUY,
@@ -144,57 +166,68 @@ static const struct sun6i_csi_capture_format sun6i_csi_capture_formats[] = {
 		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_8,
 		.input_format_raw	= true,
 		.hsize_len_factor	= 2,
+		.mbus_codes		= SUN6I_BUS_FMTS(MEDIA_BUS_FMT_VYUY8_2X8,
+							 MEDIA_BUS_FMT_VYUY8_1X16),
 	},
 	{
 		.pixelformat		= V4L2_PIX_FMT_NV16,
 		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_YUV422SP,
 		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_YUV422SP,
+		.mbus_codes		= 0,
 	},
 	{
 		.pixelformat		= V4L2_PIX_FMT_NV61,
 		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_YUV422SP,
 		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_YUV422SP,
 		.input_yuv_seq_invert	= true,
+		.mbus_codes		= 0,
 	},
 	{
 		.pixelformat		= V4L2_PIX_FMT_YUV422P,
 		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_YUV422P,
 		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_YUV422P,
+		.mbus_codes		= 0,
 	},
 	/* YUV420 */
 	{
 		.pixelformat		= V4L2_PIX_FMT_NV12_16L16,
 		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_YUV420MB,
 		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_YUV420MB,
+		.mbus_codes		= 0,
 	},
 	{
 		.pixelformat		= V4L2_PIX_FMT_NV12,
 		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_YUV420SP,
 		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_YUV420SP,
+		.mbus_codes		= 0,
 	},
 	{
 		.pixelformat		= V4L2_PIX_FMT_NV21,
 		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_YUV420SP,
 		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_YUV420SP,
 		.input_yuv_seq_invert	= true,
+		.mbus_codes		= 0,
 	},
 
 	{
 		.pixelformat		= V4L2_PIX_FMT_YUV420,
 		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_YUV420P,
 		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_YUV420P,
+		.mbus_codes		= 0,
 	},
 	{
 		.pixelformat		= V4L2_PIX_FMT_YVU420,
 		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_YUV420P,
 		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_YUV420P,
 		.input_yuv_seq_invert	= true,
+		.mbus_codes		= 0,
 	},
 	/* Compressed */
 	{
 		.pixelformat		= V4L2_PIX_FMT_JPEG,
 		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_8,
 		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_8,
+		.mbus_codes		= SUN6I_BUS_FMTS(MEDIA_BUS_FMT_JPEG_1X8),
 	},
 };
 
@@ -210,118 +243,20 @@ struct sun6i_csi_capture_format *sun6i_csi_capture_format_find(u32 pixelformat)
 	return NULL;
 }
 
-/* RAW formats need an exact match between pixel and mbus formats. */
-static const
-struct sun6i_csi_capture_format_match sun6i_csi_capture_format_matches[] = {
-	/* YUV420 */
-	{
-		.pixelformat	= V4L2_PIX_FMT_YUYV,
-		.mbus_code	= MEDIA_BUS_FMT_YUYV8_2X8,
-	},
-	{
-		.pixelformat	= V4L2_PIX_FMT_YUYV,
-		.mbus_code	= MEDIA_BUS_FMT_YUYV8_1X16,
-	},
-	{
-		.pixelformat	= V4L2_PIX_FMT_YVYU,
-		.mbus_code	= MEDIA_BUS_FMT_YVYU8_2X8,
-	},
-	{
-		.pixelformat	= V4L2_PIX_FMT_YVYU,
-		.mbus_code	= MEDIA_BUS_FMT_YVYU8_1X16,
-	},
-	{
-		.pixelformat	= V4L2_PIX_FMT_UYVY,
-		.mbus_code	= MEDIA_BUS_FMT_UYVY8_2X8,
-	},
-	{
-		.pixelformat	= V4L2_PIX_FMT_UYVY,
-		.mbus_code	= MEDIA_BUS_FMT_UYVY8_1X16,
-	},
-	{
-		.pixelformat	= V4L2_PIX_FMT_VYUY,
-		.mbus_code	= MEDIA_BUS_FMT_VYUY8_2X8,
-	},
-	{
-		.pixelformat	= V4L2_PIX_FMT_VYUY,
-		.mbus_code	= MEDIA_BUS_FMT_VYUY8_1X16,
-	},
-	/* RGB */
-	{
-		.pixelformat	= V4L2_PIX_FMT_RGB565,
-		.mbus_code	= MEDIA_BUS_FMT_RGB565_2X8_LE,
-	},
-	{
-		.pixelformat	= V4L2_PIX_FMT_RGB565X,
-		.mbus_code	= MEDIA_BUS_FMT_RGB565_2X8_BE,
-	},
-	/* Bayer */
-	{
-		.pixelformat	= V4L2_PIX_FMT_SBGGR8,
-		.mbus_code	= MEDIA_BUS_FMT_SBGGR8_1X8,
-	},
-	{
-		.pixelformat	= V4L2_PIX_FMT_SGBRG8,
-		.mbus_code	= MEDIA_BUS_FMT_SGBRG8_1X8,
-	},
-	{
-		.pixelformat	= V4L2_PIX_FMT_SGRBG8,
-		.mbus_code	= MEDIA_BUS_FMT_SGRBG8_1X8,
-	},
-	{
-		.pixelformat	= V4L2_PIX_FMT_SRGGB8,
-		.mbus_code	= MEDIA_BUS_FMT_SRGGB8_1X8,
-	},
-	{
-		.pixelformat	= V4L2_PIX_FMT_SBGGR10,
-		.mbus_code	= MEDIA_BUS_FMT_SBGGR10_1X10,
-	},
-	{
-		.pixelformat	= V4L2_PIX_FMT_SGBRG10,
-		.mbus_code	= MEDIA_BUS_FMT_SGBRG10_1X10,
-	},
-	{
-		.pixelformat	= V4L2_PIX_FMT_SGRBG10,
-		.mbus_code	= MEDIA_BUS_FMT_SGRBG10_1X10,
-	},
-	{
-		.pixelformat	= V4L2_PIX_FMT_SRGGB10,
-		.mbus_code	= MEDIA_BUS_FMT_SRGGB10_1X10,
-	},
-	{
-		.pixelformat	= V4L2_PIX_FMT_SBGGR12,
-		.mbus_code	= MEDIA_BUS_FMT_SBGGR12_1X12,
-	},
-	{
-		.pixelformat	= V4L2_PIX_FMT_SGBRG12,
-		.mbus_code	= MEDIA_BUS_FMT_SGBRG12_1X12,
-	},
-	{
-		.pixelformat	= V4L2_PIX_FMT_SGRBG12,
-		.mbus_code	= MEDIA_BUS_FMT_SGRBG12_1X12,
-	},
-	{
-		.pixelformat	= V4L2_PIX_FMT_SRGGB12,
-		.mbus_code	= MEDIA_BUS_FMT_SRGGB12_1X12,
-	},
-	/* Compressed */
-	{
-		.pixelformat	= V4L2_PIX_FMT_JPEG,
-		.mbus_code	= MEDIA_BUS_FMT_JPEG_1X8,
-	},
-};
-
 static bool sun6i_csi_capture_format_match(u32 pixelformat, u32 mbus_code)
 {
-	unsigned int i;
-
-	for (i = 0; i < ARRAY_SIZE(sun6i_csi_capture_format_matches); i++) {
-		const struct sun6i_csi_capture_format_match *match =
-			&sun6i_csi_capture_format_matches[i];
-
-		if (match->pixelformat == pixelformat &&
-		    match->mbus_code == mbus_code)
-			return true;
+	unsigned int i, j;
+
+	for (i = 0; i < ARRAY_SIZE(sun6i_csi_capture_formats); i++) {
+		const struct sun6i_csi_capture_format *format =
+			&sun6i_csi_capture_formats[i];
+
+		if (format->pixelformat == pixelformat) {
+			for (j = 0; format->mbus_codes[j]; j++) {
+				if (mbus_code == format->mbus_codes[j])
+					return true;
+			}
+		}
 	}
 
 	return false;
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.h b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.h
index 3ee5ccefbd10..0484942834e3 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.h
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.h
@@ -27,11 +27,7 @@ struct sun6i_csi_capture_format {
 	bool	input_yuv_seq_invert;
 	bool	input_format_raw;
 	u32	hsize_len_factor;
-};
-
-struct sun6i_csi_capture_format_match {
-	u32	pixelformat;
-	u32	mbus_code;
+	const u32 *mbus_codes;
 };
 
 #undef current
-- 
2.39.0

