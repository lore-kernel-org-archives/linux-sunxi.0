Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F93E3074B4
	for <linux-sunxi@lists.linux.dev>; Fri,  4 Jul 2025 15:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751644454; cv=none; b=jTRC6VCG/7/8ijA1Th2VqPrK2TvCUThtZwmEq6NvhC35vVJD1ue0nfbQ5i+lLNxLjR23HMhPsoPFvVERrpXEN+8rCrKSXYRJSkCt/92iGCIr5aHTFiPod4lbpop88OUS+pa55KhhjYjtpQUsVW5yZMj7nfDgAh0tmiAQvmqqnKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751644454; c=relaxed/simple;
	bh=E8Qrxe2tkVcRjYKO7kQLn2qa3sPHJLcrn2gLaWrinnE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nTHyxyC+h2/5woRB6h4XnrJEH9/JUYET9bnGMwcFJx3GRcQl3fyeQfHTVHe0pmbIuhCXj0vLkEGGSpiBBwv+AsPQ5r/k6OvRbtYzOxCZWermhhifwpSNRwKsXt7qpdoBn73VAup8cOXIxjv/RJkinqyl1z78wORd1Fw3Edx4UQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 345931F00062
	for <linux-sunxi@lists.linux.dev>; Fri,  4 Jul 2025 15:53:57 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 4AD42ACA665; Fri,  4 Jul 2025 15:47:07 +0000 (UTC)
X-Spam-Level: *
Received: from localhost.localdomain (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id 630A6ACA64C;
	Fri,  4 Jul 2025 15:46:33 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: Yong Deng <yong.deng@magewell.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v8 0/9] Allwinner A31/A83T MIPI CSI-2 and A31 ISP / Platform Support
Date: Fri,  4 Jul 2025 17:46:17 +0200
Message-ID: <20250704154628.3468793-1-paulk@sys-base.io>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds platform support for the V3s/V3/S3 MIPI CSI-2 and ISP units
as well the as A83T MIPI CSI-2 unit in the respective device-trees.
Overlays for the BananaPi M3 cameras are also provided as actual users of the
camera pipeline on A83T.

The corresponding drivers and dt bindings were merged a long time ago but this
series was never actually picked up. It seems more than ready to be merged!

Changes since v7:
- Added collected review tags;
- Added interconnect properties to bindings;
- Added compatible for device-tree overlays;
- Moved mclk pin to sensor node in bpi-m3 overlays;
- Removed duplicated assigned-clocks in bpi-m3 overlays.

Changes since v6:
- Rebased on top of the latest media tree, renamed dts to dtso for overlays.

Changes since v5:
- Added BananaPi M3 camera sensor support as device-tree overlays;
- Cleaned-up OV8865 regulator definitions;
- Always declared the internal links between CSI and MIPI CSI-2 on A83T
  in device-tree.

Changes since v4:
- Removed mbus bindings patch: an equivalent change was merged;
- Added collected tags;
- Rebased on latest media tree.

Changes since v3:
- Reordered v3s mbus compatible in binding;
- Added collected tag;
- Removed rejected interconnects fix.

Changes since all-in-one v2:
- Corrected mbus index used for the interconnects;
- Used extended mbus binding and exported the DRAM clock for that;
- Reworked the description of the core openfirmware change to give
  more insight about the situation.

Paul Kocialkowski (9):
  dt-bindings: media: sun6i-a31-csi: Add optional interconnect
    properties
  dt-bindings: media: sun6i-a31-isp: Add optional interconnect
    properties
  clk: sunxi-ng: v3s: Export MBUS and DRAM clocks to the public header
  ARM: dts: sun8i: v3s: Add mbus node to represent the interconnect
  ARM: dts: sun8i: v3s: Add nodes for MIPI CSI-2 support
  ARM: dts: sun8i: v3s: Add support for the ISP
  ARM: dts: sun8i: a83t: Add MIPI CSI-2 controller node
  ARM: dts: sun8i-a83t: Add BananaPi M3 OV5640 camera overlay
  ARM: dts: sun8i-a83t: Add BananaPi M3 OV8865 camera overlay

 .../media/allwinner,sun6i-a31-csi.yaml        |   6 +
 .../media/allwinner,sun6i-a31-isp.yaml        |   6 +
 arch/arm/boot/dts/allwinner/Makefile          |   2 +
 .../sun8i-a83t-bananapi-m3-camera-ov5640.dtso | 117 +++++++++++++++++
 .../sun8i-a83t-bananapi-m3-camera-ov8865.dtso | 103 +++++++++++++++
 arch/arm/boot/dts/allwinner/sun8i-a83t.dtsi   |  43 +++++++
 arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi    | 121 ++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun8i-v3s.h          |   4 -
 include/dt-bindings/clock/sun8i-v3s-ccu.h     |   4 +-
 9 files changed, 400 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-a83t-bananapi-m3-camera-ov5640.dtso
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-a83t-bananapi-m3-camera-ov8865.dtso

-- 
2.49.0

