Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0981386
	for <linux-sunxi@lists.linux.dev>; Wed, 25 May 2022 19:06:45 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C128C1C000D;
	Wed, 25 May 2022 19:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1653505603;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C3ZVwvoyQI4tlfcmNOCO5hnkDZctio5+epSjRCPaXGg=;
	b=DJl/4KG3aSOVu65nSMMZL1pcLE5+gVvrbwm6mTPOFMVg/7Xm4XCG/NwUYsHyu0iKj6Gw7h
	eYCM3DHNhEFxtTTo6dDUmT0zJ1F0mcgps5N3YMJmio3LjVcNeV5lFnRco/Qqa0pwKNuOtv
	RP88jx8p62BHFeRAptvWUHW+/e4jMcFEupubWQdOyjFfKg91ha+hTzUpZgGKcE38Q/i/4h
	NbfYi8elG4BvKoJbiD840tCfDKYqWgQMjoPVkztraVclD2KEj+BjpAd3B+TeFUYQUC5Rg1
	nijRAM42kxTgqbqYd+lKabWZUyu+Y+mWaqsABDxaRh6T9ogyP9XHVvfc2rnx8Q==
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
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 15/44] media: sun6i-csi: Move csi buffer definition to main header file
Date: Wed, 25 May 2022 21:05:48 +0200
Message-Id: <20220525190617.696344-16-paul.kocialkowski@bootlin.com>
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

The buffer structure is a top-level definition, put it in the main header
to keep things tidy. No functional change intended.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Reviewed-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h   | 9 +++++++++
 drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c | 8 --------
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
index 1edc3e91ba6f..3c72d865a01a 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
@@ -10,12 +10,21 @@
 
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
+#include <media/videobuf2-v4l2.h>
 
 #include "sun6i_video.h"
 
 #define SUN6I_CSI_NAME		"sun6i-csi"
 #define SUN6I_CSI_DESCRIPTION	"Allwinner A31 CSI Device"
 
+struct sun6i_csi_buffer {
+	struct vb2_v4l2_buffer		v4l2_buffer;
+	struct list_head		list;
+
+	dma_addr_t			dma_addr;
+	bool				queued_to_csi;
+};
+
 /**
  * struct sun6i_csi_config - configs for sun6i csi
  * @pixelformat: v4l2 pixel format (V4L2_PIX_FMT_*)
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
index 9e0f8a478bef..f8f3134d37e4 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
@@ -23,14 +23,6 @@
 #define MAX_WIDTH	(4800)
 #define MAX_HEIGHT	(4800)
 
-struct sun6i_csi_buffer {
-	struct vb2_v4l2_buffer		v4l2_buffer;
-	struct list_head		list;
-
-	dma_addr_t			dma_addr;
-	bool				queued_to_csi;
-};
-
 /* Helpers */
 
 static struct v4l2_subdev *
-- 
2.36.1

