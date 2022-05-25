Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8591386
	for <linux-sunxi@lists.linux.dev>; Wed, 25 May 2022 19:07:16 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2FAC01C0005;
	Wed, 25 May 2022 19:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1653505635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IwHDK7KRuo6NnSyhQJ3Js124K9MUdgPsqbRN4iUvCVw=;
	b=Afz1MdMgP0QaUd8t5OiSIVukDMnbo8HIwPYF460ZOwk1cHjf+8kUehbT6mngyLSkSTqZE6
	+tm9RwEmemTPgNUuqVlnqJBVTrWm2MeHt1tFQBGn/T9qL0cGnMsM8GpcWfGK/MIirC/csB
	9YGQaKoASc4/VeQ5ROKNG7CkpOC+DbfyB0FtwPIsk1N2zCotExAm9ZaDSgiTSSBDiWhCFd
	f9myXVdcNnla0vlKrHbBQULr+whKvgsTyXMzSmS8MU+ux2t0syHan6hjKlPorBcgGcdYXg
	PQfKzztMDvYxvlp4Upukoe3yUZkqswUTUx/Z+woHogQXIPSgORiyoXI+4Pb+vw==
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: Yong Deng <yong.deng@magewell.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v5 41/44] media: sun6i-csi: Only configure capture when streaming
Date: Wed, 25 May 2022 21:06:14 +0200
Message-Id: <20220525190617.696344-42-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220525190617.696344-1-paul.kocialkowski@bootlin.com>
References: <20220525190617.696344-1-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a streaming element to the capture state structure to know if the
capture device is used or not. Only configure things related to output
when streaming, including the output format, irq, state (dma buffer)
and window configuration registers.

After this change, it becomes possible to use the bridge without the
capture device, which will be the case in the isp media flow.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 50 ++++++++++++-------
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 11 +++-
 .../sunxi/sun6i-csi/sun6i_csi_capture.h       |  1 +
 3 files changed, 41 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
index 27289d904d5c..8e9eded0df28 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
@@ -338,6 +338,7 @@ sun6i_csi_bridge_configure_mipi_csi2(struct sun6i_csi_device *csi_dev)
 static void sun6i_csi_bridge_configure_format(struct sun6i_csi_device *csi_dev)
 {
 	struct regmap *regmap = csi_dev->regmap;
+	bool capture_streaming = csi_dev->capture.state.streaming;
 	const struct sun6i_csi_bridge_format *bridge_format;
 	const struct sun6i_csi_capture_format *capture_format;
 	u32 mbus_code, field, pixelformat;
@@ -353,26 +354,29 @@ static void sun6i_csi_bridge_configure_format(struct sun6i_csi_device *csi_dev)
 	input_format = bridge_format->input_format;
 	input_yuv_seq = bridge_format->input_yuv_seq;
 
-	sun6i_csi_capture_format(csi_dev, &pixelformat, NULL);
+	if (capture_streaming) {
+		sun6i_csi_capture_format(csi_dev, &pixelformat, NULL);
 
-	capture_format = sun6i_csi_capture_format_find(pixelformat);
-	if (WARN_ON(!capture_format))
-		return;
+		capture_format = sun6i_csi_capture_format_find(pixelformat);
+		if (WARN_ON(!capture_format))
+			return;
 
-	if (capture_format->input_format_raw)
-		input_format = SUN6I_CSI_INPUT_FMT_RAW;
+		if (capture_format->input_format_raw)
+			input_format = SUN6I_CSI_INPUT_FMT_RAW;
 
-	if (capture_format->input_yuv_seq_invert)
-		input_yuv_seq = bridge_format->input_yuv_seq_invert;
+		if (capture_format->input_yuv_seq_invert)
+			input_yuv_seq = bridge_format->input_yuv_seq_invert;
 
-	if (field == V4L2_FIELD_INTERLACED ||
-	    field == V4L2_FIELD_INTERLACED_TB ||
-	    field == V4L2_FIELD_INTERLACED_BT)
-		output_format = capture_format->output_format_field;
-	else
-		output_format = capture_format->output_format_frame;
+		if (field == V4L2_FIELD_INTERLACED ||
+		    field == V4L2_FIELD_INTERLACED_TB ||
+		    field == V4L2_FIELD_INTERLACED_BT)
+			output_format = capture_format->output_format_field;
+		else
+			output_format = capture_format->output_format_frame;
+
+		value |= SUN6I_CSI_CH_CFG_OUTPUT_FMT(output_format);
+	}
 
-	value |= SUN6I_CSI_CH_CFG_OUTPUT_FMT(output_format);
 	value |= SUN6I_CSI_CH_CFG_INPUT_FMT(input_format);
 	value |= SUN6I_CSI_CH_CFG_INPUT_YUV_SEQ(input_yuv_seq);
 
@@ -406,6 +410,7 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_subdev *subdev, int on)
 	struct sun6i_csi_device *csi_dev = v4l2_get_subdevdata(subdev);
 	struct sun6i_csi_bridge *bridge = &csi_dev->bridge;
 	struct media_entity *bridge_entity = &bridge->subdev.entity;
+	bool capture_streaming = csi_dev->capture.state.streaming;
 	struct device *dev = csi_dev->dev;
 	struct sun6i_csi_bridge_source *source;
 	struct v4l2_subdev *source_subdev;
@@ -448,15 +453,20 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_subdev *subdev, int on)
 	/* Configure */
 
 	sun6i_csi_bridge_configure(csi_dev, source);
-	sun6i_csi_capture_configure(csi_dev);
+
+	if (capture_streaming)
+		sun6i_csi_capture_configure(csi_dev);
 
 	/* State Update */
 
-	sun6i_csi_capture_state_update(csi_dev);
+	if (capture_streaming)
+		sun6i_csi_capture_state_update(csi_dev);
 
 	/* Enable */
 
-	sun6i_csi_bridge_irq_enable(csi_dev);
+	if (capture_streaming)
+		sun6i_csi_bridge_irq_enable(csi_dev);
+
 	sun6i_csi_bridge_enable(csi_dev);
 
 	ret = v4l2_subdev_call(source_subdev, video, s_stream, 1);
@@ -466,7 +476,9 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_subdev *subdev, int on)
 	return 0;
 
 disable:
-	sun6i_csi_bridge_irq_disable(csi_dev);
+	if (capture_streaming)
+		sun6i_csi_bridge_irq_disable(csi_dev);
+
 	sun6i_csi_bridge_disable(csi_dev);
 
 	pm_runtime_put(dev);
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
index 36ddc190a919..c9e7526b84c4 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
@@ -616,13 +616,17 @@ static int sun6i_csi_capture_start_streaming(struct vb2_queue *queue,
 	if (ret < 0)
 		goto error_state;
 
+	state->streaming = true;
+
 	ret = v4l2_subdev_call(subdev, video, s_stream, 1);
 	if (ret && ret != -ENOIOCTLCMD)
-		goto error_media_pipeline;
+		goto error_streaming;
 
 	return 0;
 
-error_media_pipeline:
+error_streaming:
+	state->streaming = false;
+
 	media_pipeline_stop(&video_dev->entity);
 
 error_state:
@@ -634,11 +638,14 @@ static int sun6i_csi_capture_start_streaming(struct vb2_queue *queue,
 static void sun6i_csi_capture_stop_streaming(struct vb2_queue *queue)
 {
 	struct sun6i_csi_device *csi_dev = vb2_get_drv_priv(queue);
+	struct sun6i_csi_capture_state *state = &csi_dev->capture.state;
 	struct video_device *video_dev = &csi_dev->capture.video_dev;
 	struct v4l2_subdev *subdev = &csi_dev->bridge.subdev;
 
 	v4l2_subdev_call(subdev, video, s_stream, 0);
 
+	state->streaming = false;
+
 	media_pipeline_stop(&video_dev->entity);
 
 	sun6i_csi_capture_state_cleanup(csi_dev, true);
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.h b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.h
index ceceb030aef6..29893cf96f6b 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.h
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.h
@@ -44,6 +44,7 @@ struct sun6i_csi_capture_state {
 	struct sun6i_csi_buffer		*complete;
 
 	unsigned int			sequence;
+	bool				streaming;
 };
 
 struct sun6i_csi_capture {
-- 
2.36.1

