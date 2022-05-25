Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F257C
	for <linux-sunxi@lists.linux.dev>; Wed, 25 May 2022 19:09:58 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::229])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id D217BC95C3
	for <linux-sunxi@lists.linux.dev>; Wed, 25 May 2022 18:59:16 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 47504FF808;
	Wed, 25 May 2022 18:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1653505149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jnLXgeypjcLq3AOE4VuwscdmaqXfOdF/aYkjU1pKK8s=;
	b=f068iCrtUo8zoBl7SaKXGdB8kp/sTnbmkDUXR2QCN52JB9Yun5ow4YoDPVKPT1oWYPN4Gt
	NZXB2HivnUdlq3aYtNyKWdr02vurK3SWTuuwnkUbxpw1QqdPI34jPcq7YMvZb0sNl1qiH0
	ae79r/WE/y2mYtgksGcaTaLETGvjNvraiKn6n8VO8g+eDcFhux9OsUMnU8QYdk3YDxlcb9
	RM6X+/We7kToyvYP74awPHstVl2BpTzpJGbxyDXBRbufD59iOuxGIUOAN0BnRSN7ASr6wC
	iNkgZLXS3zLJIY0ctmkk9jmkUZZCzlLnq1nlfZmNCuybTDWLLI2z+fxW12LtZg==
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH v4 0/7] Allwinner A31/A83T MIPI CSI-2 and A31 ISP / Platform Support
Date: Wed, 25 May 2022 20:58:46 +0200
Message-Id: <20220525185853.695931-1-paul.kocialkowski@bootlin.com>
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

This part only concerns Allwinner platform support changes.
Note that the device-tree bindings for the MIPI CSI-2 controller
and ISP are still under review in their dedicated series, so these
patches should probably not be merged yet, although feedback about
them is welcome.

Changes since v3:
- Reordered v3s mbus compatible in binding;
- Added collected tag;
- Removed rejected interconnects fix.

Changes since all-in-one v2:
- Corrected mbus index used for the interconnects;
- Used extended mbus binding and exported the DRAM clock for that;
- Reworked the description of the core openfirmware change to give
  more insight about the situation.

Kévin L'hôpital (1):
  ARM: dts: sun8i: a83t: bananapi-m3: Enable MIPI CSI-2 with OV8865

Paul Kocialkowski (6):
  dt-bindings: interconnect: sunxi: Add V3s mbus compatible
  clk: sunxi-ng: v3s: Export MBUS and DRAM clocks to the public header
  ARM: dts: sun8i: v3s: Add mbus node to represent the interconnect
  ARM: dts: sun8i: v3s: Add nodes for MIPI CSI-2 support
  ARM: dts: sun8i: v3s: Add support for the ISP
  ARM: dts: sun8i: a83t: Add MIPI CSI-2 controller node

 .../arm/sunxi/allwinner,sun4i-a10-mbus.yaml   |   2 +
 arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts  | 102 +++++++++++++++
 arch/arm/boot/dts/sun8i-a83t.dtsi             |  26 ++++
 arch/arm/boot/dts/sun8i-v3s.dtsi              | 121 ++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun8i-v3s.h          |   4 -
 include/dt-bindings/clock/sun8i-v3s-ccu.h     |   4 +-
 6 files changed, 253 insertions(+), 6 deletions(-)

-- 
2.36.1

