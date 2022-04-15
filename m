Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174C13219
	for <linux-sunxi@lists.linux.dev>; Fri, 15 Apr 2022 15:28:28 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 788DAE0012;
	Fri, 15 Apr 2022 15:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1650036507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=23yNi58FWraXJ7AbCazkNdV9n1QRLk2mhxc/j0XpgT0=;
	b=b+bHS5YnvX846+C5HZFR+5dkwKHtaL4+XeOGKZo6iNM1tInaNKJ2OOlF2C3IivM+oUCTln
	88JY/NyycUDo6yN02D/aCUMBt9l9se7P0+4qsEESPYrCGvpFispDDRxvTSIwxdHB4pOev2
	jTXZ6Jap6xUv3HgrOwB5Xe6t2CvMcV20KKdbXbrdBw/VfzffemjZLjqXvg4gEDGo7Ns0hH
	SdKd+SOERlkYnbMo2/IcGBuwQxRclQnLLFu8hrYWyRwYapCWGN3stO+gU6jWaWnnv4RBij
	7UYj9ItjcUEOF6NAoqcueHW3Dp/iATeGCYHBW8Onn4JmLbP+e3gezEMjowvI/g==
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
Subject: [PATCH v4 07/45] media: sun6i-csi: Tidy up Kconfig
Date: Fri, 15 Apr 2022 17:27:33 +0200
Message-Id: <20220415152811.636419-8-paul.kocialkowski@bootlin.com>
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

Update the option title and help, group related options together,
add dependency on VIDEO_DEV since the driver uses it and update the
description.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 drivers/media/platform/sunxi/sun6i-csi/Kconfig | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/Kconfig b/drivers/media/platform/sunxi/sun6i-csi/Kconfig
index 965fbd937841..fe50f9bb8fd1 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/Kconfig
+++ b/drivers/media/platform/sunxi/sun6i-csi/Kconfig
@@ -1,13 +1,15 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config VIDEO_SUN6I_CSI
-	tristate "Allwinner V3s Camera Sensor Interface driver"
-	depends on V4L_PLATFORM_DRIVERS
-	depends on VIDEO_DEV && COMMON_CLK  && HAS_DMA && PM
+	tristate "Allwinner A31 Camera Sensor Interface (CSI) Driver"
+	depends on V4L_PLATFORM_DRIVERS && VIDEO_DEV
 	depends on ARCH_SUNXI || COMPILE_TEST
+	depends on PM && COMMON_CLK && HAS_DMA
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
2.35.2

