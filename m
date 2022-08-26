Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE8C4421
	for <linux-sunxi@lists.linux.dev>; Fri, 26 Aug 2022 18:33:16 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C61C0FF80B;
	Fri, 26 Aug 2022 18:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1661538795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zFzxCx+qnXCiS91fxrIWsbQ+I4MWcYrGJzjVS9Iv+IU=;
	b=HocYbVbW4X1cUPNwGs/yZ0vR5S6JwCP407xaSzQvcKWk137L16ADMdbDRTlo5G14xotZqo
	igR5ap4ueNefLlLf1l9PqZ61rsUWtBmJhklR5/tfjwO3Hx6vMmwmTo26ggpoZ8fn+XW8Kn
	gzpyivSDDYwmRsuOvI+IIz++bt3M6m1J/Ds2XiscxxaK6BnKlPXru4i5aw1nGzq3llDBuw
	kC9NF1elYx6RYf+g2cM+C82qRaGeUDC31vUPZtH0zkh2JhlsIJPMobl4O2CK1N0gzELMC6
	MIv0MhxrUHff0O2xGUoTJjEgsx+GROGcmzQ36RNzsT/pz0R752GY2L0xiAYZRA==
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
Subject: [PATCH v6 07/43] media: sun6i-csi: Tidy up Kconfig
Date: Fri, 26 Aug 2022 20:32:04 +0200
Message-Id: <20220826183240.604834-8-paul.kocialkowski@bootlin.com>
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

Update the option title and help, group related options together,
add dependency on VIDEO_DEV since the driver uses it and update the
description.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/media/platform/sunxi/sun6i-csi/Kconfig | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/Kconfig b/drivers/media/platform/sunxi/sun6i-csi/Kconfig
index a472f46648af..886006f6a48a 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/Kconfig
+++ b/drivers/media/platform/sunxi/sun6i-csi/Kconfig
@@ -1,13 +1,15 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config VIDEO_SUN6I_CSI
-	tristate "Allwinner V3s Camera Sensor Interface driver"
-	depends on V4L_PLATFORM_DRIVERS
-	depends on VIDEO_DEV && COMMON_CLK && RESET_CONTROLLER && HAS_DMA && PM
+	tristate "Allwinner A31 Camera Sensor Interface (CSI) Driver"
+	depends on V4L_PLATFORM_DRIVERS && VIDEO_DEV
 	depends on ARCH_SUNXI || COMPILE_TEST
+	depends on PM && COMMON_CLK && RESET_CONTROLLER && HAS_DMA
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select VIDEOBUF2_DMA_CONTIG
-	select REGMAP_MMIO
 	select V4L2_FWNODE
+	select REGMAP_MMIO
 	help
-	   Support for the Allwinner Camera Sensor Interface Controller on V3s.
+	   Support for the Allwinner A31 Camera Sensor Interface (CSI)
+	   controller, also found on other platforms such as the A83T, H3,
+	   V3/V3s or A64.
-- 
2.37.1

