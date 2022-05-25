Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC1A1386
	for <linux-sunxi@lists.linux.dev>; Wed, 25 May 2022 19:07:02 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1F0EB1C0011;
	Wed, 25 May 2022 19:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1653505621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Oe8488NgBxKizP4l1h8przQvzqrrZXH4by07IBMrknM=;
	b=haIGTHFbYCYDSudHwr2dx0m5kk2z3hsIWwYKft1T2NWXe+y7SgNWoyPsFhnBPZYGWUV2Wb
	jX7ynljDNFNX2IUtTf7Ziw7ZnBFySLhx1C+QKCb+b387PO1G1EFaX2BGiHiYeJCv0ZKwsC
	TxNoAE5FtZnGQzmIZ4LRWK7WnVHkHH8salY/0oW4Gs2BSItQGTwsW6X1rMx74luS5YyYCM
	SFZYZcq6OHcQxHuYNQ+0akgaXgC6DhpCMkieTG7Kdnpk9uc9Ga/MIYXJnJCmDWYm1+g5VS
	FMb1Lz39RvGcy6baURClw0jEDFmvWofNY6rHAxz7UPESUY5ntVHxY5bASiaE7g==
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
Subject: [PATCH v5 29/44] media: sun6i-csi: Get mbus code from bridge instead of storing it
Date: Wed, 25 May 2022 21:06:02 +0200
Message-Id: <20220525190617.696344-30-paul.kocialkowski@bootlin.com>
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

Another instance of removing a duplicated variable and using common
helpers instead.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../sunxi/sun6i-csi/sun6i_csi_capture.c        | 18 +++++-------------
 .../sunxi/sun6i-csi/sun6i_csi_capture.h        |  1 -
 2 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
index c8d350c1dea8..bad132d6472e 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
@@ -17,6 +17,7 @@
 #include <media/videobuf2-v4l2.h>
 
 #include "sun6i_csi.h"
+#include "sun6i_csi_bridge.h"
 #include "sun6i_csi_capture.h"
 #include "sun6i_csi_reg.h"
 
@@ -455,20 +456,20 @@ sun6i_csi_capture_configure_interface(struct sun6i_csi_device *csi_dev)
 
 static void sun6i_csi_capture_configure_format(struct sun6i_csi_device *csi_dev)
 {
-	struct sun6i_csi_capture *capture = &csi_dev->capture;
-	u32 pixelformat, field;
+	u32 mbus_code, pixelformat, field;
 	u32 cfg = 0;
 	u32 val;
 
 	sun6i_csi_capture_format(csi_dev, &pixelformat, &field);
+	sun6i_csi_bridge_format(csi_dev, &mbus_code, NULL);
 
-	val = get_csi_input_format(csi_dev, capture->mbus_code, pixelformat);
+	val = get_csi_input_format(csi_dev, mbus_code, pixelformat);
 	cfg |= SUN6I_CSI_CH_CFG_INPUT_FMT(val);
 
 	val = get_csi_output_format(csi_dev, pixelformat, field);
 	cfg |= SUN6I_CSI_CH_CFG_OUTPUT_FMT(val);
 
-	val = get_csi_input_seq(csi_dev, capture->mbus_code, pixelformat);
+	val = get_csi_input_seq(csi_dev, mbus_code, pixelformat);
 	cfg |= SUN6I_CSI_CH_CFG_INPUT_YUV_SEQ(val);
 
 	if (field == V4L2_FIELD_TOP)
@@ -739,11 +740,6 @@ static int sun6i_csi_capture_start_streaming(struct vb2_queue *queue,
 	if (ret < 0)
 		goto error_state;
 
-	if (capture->mbus_code == 0) {
-		ret = -EINVAL;
-		goto error_media_pipeline;
-	}
-
 	subdev = sun6i_csi_capture_remote_subdev(capture, NULL);
 	if (!subdev) {
 		ret = -EINVAL;
@@ -1072,8 +1068,6 @@ static int sun6i_csi_capture_link_validate(struct media_link *link)
 	struct v4l2_subdev_format source_fmt;
 	int ret;
 
-	capture->mbus_code = 0;
-
 	if (!media_entity_remote_pad(link->sink->entity->pads)) {
 		dev_info(csi_dev->dev, "capture node %s pad not connected\n",
 			 vdev->name);
@@ -1105,8 +1099,6 @@ static int sun6i_csi_capture_link_validate(struct media_link *link)
 		return -EPIPE;
 	}
 
-	capture->mbus_code = source_fmt.format.code;
-
 	return 0;
 }
 
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.h b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.h
index 02bdf45f7ca5..3b9759e1563d 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.h
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.h
@@ -39,7 +39,6 @@ struct sun6i_csi_capture {
 	struct media_pad		pad;
 
 	struct v4l2_format		format;
-	u32				mbus_code;
 };
 
 void sun6i_csi_capture_dimensions(struct sun6i_csi_device *csi_dev,
-- 
2.36.1

