Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE29B4AF93
	for <linux-sunxi@lists.linux.dev>; Sun, 17 Dec 2023 23:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A3DEF1FB;
	Sun, 17 Dec 2023 15:25:08 -0800 (PST)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 70D473F64C;
	Sun, 17 Dec 2023 15:24:22 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Icenowy Zheng <uwu@icenowy.me>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 0/2] arm64: dts: allwinner: Add BananaPi M4 Berry
Date: Sun, 17 Dec 2023 23:24:03 +0000
Message-Id: <20231217232405.302-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.8
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The BananaPi M4 Berry is a development board with the Allwinner H618
SoC. It comes with 2GB DRAM and 8GB eMMC flash, with the usual suspects
like HDMI, SD card, GPIO headers. There are four USB ports connected
via an on-board hub chip, and a Gigabit Ethernet socket. Also there is
a USB WiFi chip soldered on the board.
More details: https://linux-sunxi.org/Sinovoip_Banana_Pi_M4_Berry

I don't have this board, so this is a "call for testing".
One thing to consider:
- The USB WiFi chip has a CHIP_EN pin, which can turn the chip off.
  It is pulled up by a resistor, so works out of the box, but is also
  connected to a GPIO (PC2), so the chip can be disabled or reset via
  this pin. Since this is a USB device, we don't have a DT node to
  announce this pin. Any ideas how this should be handled? At the moment
  I ignore it, but it could also be modelled as a USB VBUS regulator for
  USB port 1, to which it is connected.

When testing this, please have a look at:
- Does the eMMC work in HS200 mode? The vendor DT described that as a
  3.3V controlled eMMC only, but clearly the schematic uses 1.8V, which
  allows faster transfer modes. "hdparm -t" should suffice for a quick
  test.
- Do USB full-speed (aka USB v1.1) peripherals like keyboard or mouse
  work on the USB ports? I disabled the OHCI node, since the hub should
  not need this, but it would be good to double check.
- Similarly the USB WiFi chip probably doesn't need USB 1.1 modes, so
  please check this still works.

Apart from the missing audio and video support (which are due to missing
bindings for the H616/H618 SoC), most of the peripherals are supported.

Patch 1/2 adds the board compatible string to the bindings, patch 2/2
adds the actual .dts file.

Please have a look!

Thanks,
Andre

Andre Przywara (2):
  dt-bindings: arm: sunxi: document BananaPi M4 Berry board name
  arm64: dts: allwinner: h618: add BananaPi M4 Berry board

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../sun50i-h618-bananapi-m4-berry.dts         | 229 ++++++++++++++++++
 3 files changed, 235 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h618-bananapi-m4-berry.dts

-- 
2.35.8

