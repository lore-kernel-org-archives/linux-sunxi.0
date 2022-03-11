Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0F033E9
	for <linux-sunxi@lists.linux.dev>; Fri, 11 Mar 2022 14:36:43 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 833BB240004;
	Fri, 11 Mar 2022 14:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1647009401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZBGbdEWIKa8ylcY99ku5Po7hP1W07zt3jqCnObrq3TM=;
	b=eXLXFiBe3lmGuUHJ3aLBzd1ScB+kIZECxr6iG0kJRldFdqh0Zjh5wErgBNcdO0Ah6hcR5H
	cXS7t9m8pZFLA8r5+FyQJvFFvcD/1jyLBUaLxXURzysb8KW24CYfEddmA7hjeS3lTjJuBA
	QQyUa1h2GdOFTM9SFqQYwfdbAbK5fsksZM7u51htAy47fBjUj38AGHhHaOs9UKiLqJ6fUC
	OEJ14nsIglhpPNUL7STRlJnEudm1ju5gH8hAY8mybWRUVmRDOz50K3qQlP+ecUb2lvXM4Y
	fTodw6m3zGv/+5mt9q5ovhnX/6Pvy1oRX6qNvDN3w4B+Q3Kvn0Eb+7aruEE4ZQ==
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
Subject: [PATCH v3 35/46] media: sun6i-csi: Get bridge subdev directly in capture stream ops
Date: Fri, 11 Mar 2022 15:35:21 +0100
Message-Id: <20220311143532.265091-36-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220311143532.265091-1-paul.kocialkowski@bootlin.com>
References: <20220311143532.265091-1-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The remote subdev connected to the capture video device is always
our bridge, so get the bridge subdev directly instead of using a
dedicated helper (which is removed by this commit).

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 30 ++-----------------
 1 file changed, 3 insertions(+), 27 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
index be1a4fe8fe5f..2f9bf75e4e39 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
@@ -42,22 +42,6 @@ void sun6i_csi_capture_format(struct sun6i_csi_device *csi_dev,
 		*field = csi_dev->capture.format.fmt.pix.field;
 }
 
-static struct v4l2_subdev *
-sun6i_csi_capture_remote_subdev(struct sun6i_csi_capture *capture, u32 *pad)
-{
-	struct media_pad *remote;
-
-	remote = media_entity_remote_pad(&capture->pad);
-
-	if (!remote || !is_media_entity_v4l2_subdev(remote->entity))
-		return NULL;
-
-	if (pad)
-		*pad = remote->index;
-
-	return media_entity_to_v4l2_subdev(remote->entity);
-}
-
 /* Format */
 
 static const struct sun6i_csi_capture_format sun6i_csi_capture_formats[] = {
@@ -822,8 +806,8 @@ static int sun6i_csi_capture_start_streaming(struct vb2_queue *queue,
 	struct sun6i_csi_capture *capture = &csi_dev->capture;
 	struct sun6i_csi_capture_state *state = &capture->state;
 	struct video_device *video_dev = &capture->video_dev;
+	struct v4l2_subdev *subdev = &csi_dev->bridge.subdev;
 	struct device *dev = csi_dev->dev;
-	struct v4l2_subdev *subdev;
 	int ret;
 
 	state->sequence = 0;
@@ -832,12 +816,6 @@ static int sun6i_csi_capture_start_streaming(struct vb2_queue *queue,
 	if (ret < 0)
 		goto error_state;
 
-	subdev = sun6i_csi_capture_remote_subdev(capture, NULL);
-	if (!subdev) {
-		ret = -EINVAL;
-		goto error_media_pipeline;
-	}
-
 	/* PM */
 
 	ret = pm_runtime_resume_and_get(dev);
@@ -886,12 +864,10 @@ static void sun6i_csi_capture_stop_streaming(struct vb2_queue *queue)
 {
 	struct sun6i_csi_device *csi_dev = vb2_get_drv_priv(queue);
 	struct sun6i_csi_capture *capture = &csi_dev->capture;
+	struct v4l2_subdev *subdev = &csi_dev->bridge.subdev;
 	struct device *dev = csi_dev->dev;
-	struct v4l2_subdev *subdev;
 
-	subdev = sun6i_csi_capture_remote_subdev(capture, NULL);
-	if (subdev)
-		v4l2_subdev_call(subdev, video, s_stream, 0);
+	v4l2_subdev_call(subdev, video, s_stream, 0);
 
 	sun6i_csi_capture_disable(csi_dev);
 	sun6i_csi_capture_irq_disable(csi_dev);
-- 
2.35.1

