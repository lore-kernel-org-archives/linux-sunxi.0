Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E23AE28E0
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Mar 2022 14:34:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F2151042;
	Mon,  7 Mar 2022 06:34:58 -0800 (PST)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.196.172])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6E5A53F66F;
	Mon,  7 Mar 2022 06:34:56 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Mesih Kilinc <mesihkilinc@gmail.com>,
	Icenowy Zheng <icenowy@aosc.io>,
	Jesse Taube <mr.bossman075@gmail.com>,
	Giulio Benetti <giulio.benetti@benettiengineering.com>,
	George Hilliard <thirtythreeforty@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Russell King <linux@armlinux.org.uk>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org
Subject: [PATCH 14/14] ARM: configs: multi_v5: Enable Allwinner F1C100
Date: Mon,  7 Mar 2022 14:34:21 +0000
Message-Id: <20220307143421.1106209-15-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220307143421.1106209-1-andre.przywara@arm.com>
References: <20220307143421.1106209-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Kconfig symbols required for the Allwinner F1C100 (MACH_SUNIV) are
currently not selected by any defconfig. sunxi_defconfig only covers the
v7 SoCs, but the F1C100s is ARMv5, so we cannot share a single image.

Add the required symbols to multi_v5_defconfig, to give people some sane
default config when playing around with this chip. This is probably more
important as there are surely not many distros out there supporting
ARMv5 out of the box.

This allows my LicheePi Nano board to boot to a busybox prompt.

The zImage size grows by about 50 KB, in detail:

    text    data     bss     dec     hex   filename
10269442  4284276  678316 15232034 e86c22 vmlinux-old
10348026  4351912  681516 15381454 eab3ce vmlinux-new

14560300			arch/arm/boot/Image-old
14712940			arch/arm/boot/Image-new
6231192				arch/arm/boot/zImage-old
6282928				arch/arm/boot/zImage-new

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/configs/multi_v5_defconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/configs/multi_v5_defconfig b/arch/arm/configs/multi_v5_defconfig
index 8b7fe7ff5366..3130f5f132f5 100644
--- a/arch/arm/configs/multi_v5_defconfig
+++ b/arch/arm/configs/multi_v5_defconfig
@@ -52,6 +52,7 @@ CONFIG_MACH_WNR854T=y
 CONFIG_MACH_RD88F5181L_GE=y
 CONFIG_MACH_RD88F5181L_FXO=y
 CONFIG_MACH_RD88F6183AP_GE=y
+CONFIG_ARCH_SUNXI=y
 CONFIG_AEABI=y
 CONFIG_HIGHMEM=y
 CONFIG_ARM_APPENDED_DTB=y
@@ -135,6 +136,7 @@ CONFIG_SERIAL_8250_RUNTIME_UARTS=6
 CONFIG_SERIAL_8250_EXTENDED=y
 CONFIG_SERIAL_8250_MANY_PORTS=y
 CONFIG_SERIAL_8250_ASPEED_VUART=m
+CONFIG_SERIAL_8250_DW=y
 CONFIG_SERIAL_OF_PLATFORM=y
 CONFIG_SERIAL_ATMEL=y
 CONFIG_SERIAL_ATMEL_CONSOLE=y
@@ -155,6 +157,7 @@ CONFIG_SPI=y
 CONFIG_SPI_ATMEL=y
 CONFIG_SPI_IMX=y
 CONFIG_SPI_ORION=y
+CONFIG_SPI_SUN6I=y
 CONFIG_GPIO_ASPEED=m
 CONFIG_GPIO_ASPEED_SGPIO=y
 CONFIG_GPIO_MXC=y
@@ -171,6 +174,7 @@ CONFIG_THERMAL=y
 CONFIG_KIRKWOOD_THERMAL=y
 CONFIG_AT91SAM9X_WATCHDOG=y
 CONFIG_ORION_WATCHDOG=y
+CONFIG_SUNXI_WATCHDOG=y
 CONFIG_NPCM7XX_WATCHDOG=y
 CONFIG_IMX2_WDT=y
 CONFIG_MFD_ATMEL_HLCDC=y
@@ -231,6 +235,7 @@ CONFIG_MMC_SDHCI_PLTFM=m
 CONFIG_MMC_SDHCI_OF_ASPEED=m
 CONFIG_MMC_ATMELMCI=y
 CONFIG_MMC_MVSDIO=y
+CONFIG_MMC_SUNXI=y
 CONFIG_NEW_LEDS=y
 CONFIG_LEDS_CLASS=y
 CONFIG_LEDS_GPIO=y
-- 
2.25.1

