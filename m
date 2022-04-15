Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E8B33C0
	for <linux-sunxi@lists.linux.dev>; Fri, 15 Apr 2022 15:28:33 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 513F0E0016;
	Fri, 15 Apr 2022 15:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1650036512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p/G3Lv5aXmpaUoYeX8MRq+c6XCpBmVOvXeLJxUHHzd0=;
	b=Z3YIxE+Elv/LhefhNAdaJTccscQKVVtnBYvmQ4D5CKJUqFRnmuZqBn+A1wCUW22mlHJk/L
	SLq4FtjJdGO7oWtTlxjd7Fiw18nUo2VM6t9jrA3yQoUCBoZrsn1UU5gacCpBJsyk49IJFp
	fjLC+b/F9m8dyCHK7vCP5X315ZuXV1WM0zmIPtg8GZgR82LxVvIl7cDv2CynEg53UaK+Ns
	d+7r86QO76QV+PjqIgPBSqqjBb50dd+ZD+uINYJM8dLggHNOfEZsjRXc3o4cz3zlj6Flom
	+TKFDQ1mB5EBT407CVS4mrMzQ0PYjWrjicfqNGsylKvR+Y1aKkC1WaGyI8oQ1g==
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
Subject: [PATCH v4 11/45] media: sun6i-csi: Register the media device after creation
Date: Fri, 15 Apr 2022 17:27:37 +0200
Message-Id: <20220415152811.636419-12-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <20220415152811.636419-1-paul.kocialkowski@bootlin.com>
References: <20220415152811.636419-1-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no particular need to register the media device in the
subdev notify complete callback.

Register it in the v4l2 code instead where it's more in-context.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
index 198275e09865..e59ee3e3f372 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
@@ -638,7 +638,7 @@ static int sun6i_subdev_notify_complete(struct v4l2_async_notifier *notifier)
 	if (ret < 0)
 		return ret;
 
-	return media_device_register(&v4l2->media_dev);
+	return 0;
 }
 
 static const struct v4l2_async_notifier_operations sun6i_csi_async_ops = {
@@ -687,6 +687,12 @@ static int sun6i_csi_v4l2_setup(struct sun6i_csi_device *csi_dev)
 
 	media_device_init(media_dev);
 
+	ret = media_device_register(media_dev);
+	if (ret) {
+		dev_err(dev, "failed to register media device: %d\n", ret);
+		goto error_media;
+	}
+
 	/* V4L2 Control Handler */
 
 	ret = v4l2_ctrl_handler_init(&v4l2->ctrl_handler, 0);
@@ -746,6 +752,7 @@ static int sun6i_csi_v4l2_setup(struct sun6i_csi_device *csi_dev)
 	v4l2_ctrl_handler_free(&v4l2->ctrl_handler);
 
 error_media:
+	media_device_unregister(media_dev);
 	media_device_cleanup(media_dev);
 
 	return ret;
-- 
2.35.2

