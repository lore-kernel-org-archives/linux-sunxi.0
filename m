Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D0318AE2
	for <linux-sunxi@lists.linux.dev>; Sat, 13 Jun 2026 15:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781364429; cv=none; b=A0aarP1qMWybUpc8SNNGiXf9QrHfcy8JZwbNIRH35OfE3WKWQY5KA4USXldEYPdK+3MAsIndRbusafBYKgISskQF06oUAtdx1MFECU7/kQtfXzSe6JAUwg6uyUHU8Nlc445xYf0Wtjsx+ftrvSXHJ84+oEssyF3KwnfcR1ThnvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781364429; c=relaxed/simple;
	bh=9fIu29Ae0tDrJLbWD52SVdcRHKskyq46J5nNjD46DHY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aqgXjdjw081KKGtT76PEpHyQ7oOszyOBACi0jU5O+RFz4WT5us3xsRlvrL8Rw7pjs7QNmqkXR0GykaP896ohq4z6/CTGR1Grby5cQORiav8WRwsjfm7xSKGFrqO7UKZ8jnGR6JncUqivZCO83o6wQDbkbQ3t61AJ1FPhPDc9zcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 49C1137002F3
	for <linux-sunxi@lists.linux.dev>; Sat, 13 Jun 2026 15:27:04 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 53FEEB45526; Sat, 13 Jun 2026 15:26:59 +0000 (UTC)
X-Spam-Level: **
Received: from collins (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id 8DDFAB4551A;
	Sat, 13 Jun 2026 15:26:56 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Yong Deng <yong.deng@magewell.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v10 0/6] Allwinner A31/A83T MIPI CSI-2 and A31 ISP / Platform Support
Date: Sat, 13 Jun 2026 17:26:49 +0200
Message-ID: <20260613152655.212490-1-paulk@sys-base.io>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds platform support for the V3s/V3/S3 MIPI CSI-2 and ISP units
as well the as A83T MIPI CSI-2 unit in the respective device-trees.

The corresponding drivers and dt bindings were merged a long time ago but this
series was never actually picked up. It seems more than ready to be merged!

Changes since v9:
- Split clock definitions export;
- Added dedicated v3s d-phy compatible;
- Added interrupt to v3s d-phy definition;
- Removed a83t board overlays that need more work.

Changes since v8:
- Added collected review tags;
- Added the overlays to be built as full dtbs.
- Removed trailing whitespace.

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

Paul Kocialkowski (6):
  dt-bindings: sun8i-v3s-ccu: Export MBUS and DRAM clocks to the public
    header
  clk: sunxi-ng: v3s: Remove exported clock definitions
  ARM: dts: sun8i: v3s: Add mbus node to represent the interconnect
  dt-bindings: sun6i-a31-mipi-dphy: Add V3s SoC compatible entry
  ARM: dts: sun8i: v3s: Add nodes for MIPI CSI-2 support
  ARM: dts: sun8i: v3s: Add support for the ISP

 .../phy/allwinner,sun6i-a31-mipi-dphy.yaml    |   3 +
 arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi    | 123 ++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun8i-v3s.h          |   4 -
 include/dt-bindings/clock/sun8i-v3s-ccu.h     |   4 +-
 4 files changed, 128 insertions(+), 6 deletions(-)

-- 
2.54.0

