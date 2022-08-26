Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4444C74
	for <linux-sunxi@lists.linux.dev>; Fri, 26 Aug 2022 18:33:49 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D16ADFF802;
	Fri, 26 Aug 2022 18:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1661538827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yi9HluDydRpZBduJNhqEJr8iXNBu5Q+LEee6PfKNXdU=;
	b=Pu690hdkQ93LfZZE1L0aF7xbmA5xCQ3chiNBketXmU6T1gphoZMG/e4E3m5WcRB7HkG7D4
	dNIg8Ef32HMk5Ofqt+/9E82cVfDYMLmSQqGA2eYKxp/T7oRJX5hzAiH4NftfCDf79FHv5f
	UDmCMZpdJbCDh5NDl5nYdUQPcEYx6aNiQla49t/LHBdTgd96jQ+UlutNVl1XnB63qTN1oS
	8TmWYBIR9gAYEcGQkVrj7eZEn8QxLY/5bAziyvGPSjdpIXpTn0zLOfOAZZhNDN63cs+RS+
	mmlXKoV4gKJquhRhtuqALPRpNyV6g4C57KX16k1SKbrazBEbQcYbyRg0Paf+Hw==
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
Subject: [PATCH v6 37/43] media: sun6i-csi: Rename the capture video device to sun6i-csi-capture
Date: Fri, 26 Aug 2022 20:32:34 +0200
Message-Id: <20220826183240.604834-38-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220826183240.604834-1-paul.kocialkowski@bootlin.com>
References: <20220826183240.604834-1-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that the driver is properly split between bridge and capture,
rename the video device to highlight its role and be in line with
the bridge entity naming.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c | 3 ++-
 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.h | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
index a0131023a8b9..e5ebe7a50c6f 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
@@ -1023,7 +1023,8 @@ int sun6i_csi_capture_setup(struct sun6i_csi_device *csi_dev)
 
 	/* Video Device */
 
-	strscpy(video_dev->name, SUN6I_CSI_NAME, sizeof(video_dev->name));
+	strscpy(video_dev->name, SUN6I_CSI_CAPTURE_NAME,
+		sizeof(video_dev->name));
 	video_dev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
 	video_dev->vfl_dir = VFL_DIR_RX;
 	video_dev->release = video_device_release_empty;
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.h b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.h
index a61db3bc72e5..59c57bcefeec 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.h
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.h
@@ -11,6 +11,8 @@
 #include <media/v4l2-dev.h>
 #include <media/videobuf2-core.h>
 
+#define SUN6I_CSI_CAPTURE_NAME	"sun6i-csi-capture"
+
 #define SUN6I_CSI_CAPTURE_WIDTH_MIN	32
 #define SUN6I_CSI_CAPTURE_WIDTH_MAX	4800
 #define SUN6I_CSI_CAPTURE_HEIGHT_MIN	32
-- 
2.37.1

