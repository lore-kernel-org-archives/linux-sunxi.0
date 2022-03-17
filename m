Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAC9F2F30
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Mar 2022 18:31:00 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8CFE8169E;
	Thu, 17 Mar 2022 11:31:00 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.196.172])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0C8B53F7F5;
	Thu, 17 Mar 2022 11:30:58 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Russell King <linux@armlinux.org.uk>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: soc@kernel.org,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 5/5] ARM: configs: multi_v5: Enable Allwinner F1C100
Date: Thu, 17 Mar 2022 18:30:43 +0000
Message-Id: <20220317183043.948432-6-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317183043.948432-1-andre.przywara@arm.com>
References: <20220317183043.948432-1-andre.przywara@arm.com>
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
10510000  4400700  687740 15598440 ee0368 vmlinux-old
10588592  4469096  686812 15744500 f03df4 vmlinux-new

14922908			arch/arm/boot/Image-old
15067388			arch/arm/boot/Image-new
6388016				arch/arm/boot/zImage-old
6440064				arch/arm/boot/zImage-new

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/configs/multi_v5_defconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/configs/multi_v5_defconfig b/arch/arm/configs/multi_v5_defconfig
index f89baa88facb..19ffce42223f 100644
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
@@ -241,6 +245,7 @@ CONFIG_MMC_SDHCI_PLTFM=m
 CONFIG_MMC_SDHCI_OF_ASPEED=m
 CONFIG_MMC_ATMELMCI=y
 CONFIG_MMC_MVSDIO=y
+CONFIG_MMC_SUNXI=y
 CONFIG_NEW_LEDS=y
 CONFIG_LEDS_CLASS=y
 CONFIG_LEDS_GPIO=y
-- 
2.25.1

