Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A39C39C
	for <linux-sunxi@lists.linux.dev>; Mon, 31 Jul 2023 01:25:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ECB4B1650;
	Sun, 30 Jul 2023 18:19:04 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D92FC3F5A1;
	Sun, 30 Jul 2023 18:18:19 -0700 (PDT)
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
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] sunxi: Orange Pi Zero 3 DT support
Date: Mon, 31 Jul 2023 02:17:22 +0100
Message-Id: <20230731011725.7228-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.8
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Orange Pi recently released the Orange Pi Zero 3 board, which is some
updated version of their former Zero 2 development board. Some component
changes (Motorcomm PHY instead of Realtek, different PMIC), some board
layout changes, and it ships with up to 4GB of DRAM now. The SoC is now
labelled H618 instead of H616, which apparently is the same, just with
more L2 cache.

Split the existing OPi Zero2 DT, to allow sharing most DT nodes, then
add the binding documentation and DT for the new board.

Linux v6.5-rc boots out of the box (the PMIC driver just made it in),
and most things work: UART, PSCI, GPIO, SPI flash, SD card, USB.
Ethernet is almost working, I get an IP address via DHCP, but no further
packets come through. Might be either a problem with the new Motorcomm
PHY driver, or some missing delay settings, I have to investigate, any
help or advice welcome.
Also let me know if the DT split is a good idea or not, happy to roll
that back if requested.

Cheers,
Andre

Andre Przywara (3):
  arm64: dts: allwinner: h616: Split Orange Pi Zero 2 DT
  dt-bindings: arm: sunxi: document Orange Pi Zero 3 board name
  arm64: dts: allwinner: h616: Add OrangePi Zero 3 board support

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../allwinner/sun50i-h616-orangepi-zero2.dts  | 119 +---------------
 .../allwinner/sun50i-h616-orangepi-zerox.dtsi | 131 ++++++++++++++++++
 .../allwinner/sun50i-h618-orangepi-zero3.dts  |  86 ++++++++++++
 5 files changed, 224 insertions(+), 118 deletions(-)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zerox.dtsi
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts

-- 
2.35.8

