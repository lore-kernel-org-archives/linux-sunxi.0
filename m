Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC29F1386
	for <linux-sunxi@lists.linux.dev>; Wed, 25 May 2022 19:03:18 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 274301C0003;
	Wed, 25 May 2022 19:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1653505391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aWM4jU+KpwKbe/LtiT6xQQFiiBtsv9ibwWOS4XTHIBQ=;
	b=aCv2zN21S1EhX4HwiMuylnkJC/WpyeUQHx7cR5l3kFeeuKRIwci8QwKMd6FxLDwkMftK8n
	bsQpE4QwjRMCPnQiF/44CoY5zemPFgdPUs13GIrmsY/mlTuJHiIYpMWY29X0EfAgRrgIUl
	oElC7XFw2tmxxD69qmRiQb+cwkDEPSzLHX+XDOP2ZekWxg/Id6jRdzaDwPUoJ2/HJ6mEk/
	O3pW/O4sSByXr/469uK4djoF01q8EISfKODxz4KUS/pqcOrS2qt95Cjz16NfFPExDuUXVt
	VHzbFYRNZSCGam/t6JCibIqOEppg0V0yGdZ/x3jlX+tQ5FnnA7ek3MnYKGnSEA==
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Cc: Yong Deng <yong.deng@magewell.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hans.verkuil@cisco.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	Vinod Koul <vkoul@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v5 0/6] Allwinner A31/A83T MIPI CSI-2 and A31 ISP / MIPI CSI-2 Support
Date: Wed, 25 May 2022 21:02:54 +0200
Message-Id: <20220525190300.696269-1-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.36.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This new version is an offspring from the big "Allwinner A31/A83T
MIPI CSI-2 Support and A31 ISP Support" series, which was split into
individual series for better clarity and handling.

This part only concerns the MIPI CSI-2 controllers support changes.

Changes since v4:
- Used '/schemas/graph.yaml#/properties/port' whenever possible;
- Removed applied patches;
- Added collected tag;

Paul Kocialkowski (6):
  dt-bindings: media: sun6i-a31-csi: Add MIPI CSI-2 input port
  dt-bindings: media: Add Allwinner A31 MIPI CSI-2 bindings
    documentation
  media: sunxi: Add support for the A31 MIPI CSI-2 controller
  MAINTAINERS: Add entry for the Allwinner A31 MIPI CSI-2 bridge driver
  dt-bindings: media: Add Allwinner A83T MIPI CSI-2 bindings
    documentation
  media: sunxi: Add support for the A83T MIPI CSI-2 controller

 .../media/allwinner,sun6i-a31-csi.yaml        |  58 +-
 .../media/allwinner,sun6i-a31-mipi-csi2.yaml  | 137 +++
 .../media/allwinner,sun8i-a83t-mipi-csi2.yaml | 125 +++
 MAINTAINERS                                   |   8 +
 drivers/media/platform/sunxi/Kconfig          |   2 +
 drivers/media/platform/sunxi/Makefile         |   2 +
 .../platform/sunxi/sun6i-mipi-csi2/Kconfig    |  14 +
 .../platform/sunxi/sun6i-mipi-csi2/Makefile   |   4 +
 .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   | 749 ++++++++++++++++
 .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h   |  52 ++
 .../sun6i-mipi-csi2/sun6i_mipi_csi2_reg.h     |  76 ++
 .../sunxi/sun8i-a83t-mipi-csi2/Kconfig        |  12 +
 .../sunxi/sun8i-a83t-mipi-csi2/Makefile       |   4 +
 .../sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.c    |  72 ++
 .../sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.h    |  39 +
 .../sun8i_a83t_mipi_csi2.c                    | 815 ++++++++++++++++++
 .../sun8i_a83t_mipi_csi2.h                    |  55 ++
 .../sun8i_a83t_mipi_csi2_reg.h                | 151 ++++
 18 files changed, 2361 insertions(+), 14 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun6i-a31-mipi-csi2.yaml
 create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun8i-a83t-mipi-csi2.yaml
 create mode 100644 drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig
 create mode 100644 drivers/media/platform/sunxi/sun6i-mipi-csi2/Makefile
 create mode 100644 drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
 create mode 100644 drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h
 create mode 100644 drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2_reg.h
 create mode 100644 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/Kconfig
 create mode 100644 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/Makefile
 create mode 100644 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.c
 create mode 100644 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.h
 create mode 100644 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
 create mode 100644 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.h
 create mode 100644 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2_reg.h

-- 
2.36.1

