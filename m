Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 413AD72
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Jul 2021 23:05:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4182511D4;
	Mon,  5 Jul 2021 16:05:22 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5F8983F73B;
	Mon,  5 Jul 2021 16:05:21 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 2/3] sunxi: SPL SPI: Add SPI boot support for the Allwinner H616 SoC
Date: Tue,  6 Jul 2021 00:04:44 +0100
Message-Id: <20210705230445.14834-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20210705230445.14834-1-andre.przywara@arm.com>
References: <20210705230445.14834-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

The H616 SoC uses the same SPI IP as the H6, also shares the same clocks
and reset bits.
The only real difference is a slight change in the pin assignment: the
H6 uses PC5, the H616 PC4 instead. This makes for a small change in
our spi0_pinmux_setup() routine.

Apart from that, just extend the H6 #ifdef guards to also cover the H616,
using the shared CONFIG_SUN50I_GEN_H6 symbol.
Also use this symbol for the Kconfig dependency.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/mach-sunxi/Kconfig         |  2 +-
 arch/arm/mach-sunxi/spl_spi_sunxi.c | 27 +++++++++++++++------------
 2 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
index 49f94f095c1..6b9bbed9a7a 100644
--- a/arch/arm/mach-sunxi/Kconfig
+++ b/arch/arm/mach-sunxi/Kconfig
@@ -1057,7 +1057,7 @@ config SPL_STACK_R_ADDR
 
 config SPL_SPI_SUNXI
 	bool "Support for SPI Flash on Allwinner SoCs in SPL"
-	depends on MACH_SUN4I || MACH_SUN5I || MACH_SUN7I || MACH_SUNXI_H3_H5 || MACH_SUN50I || MACH_SUN8I_R40 || MACH_SUN50I_H6
+	depends on MACH_SUN4I || MACH_SUN5I || MACH_SUN7I || MACH_SUNXI_H3_H5 || MACH_SUN50I || MACH_SUN8I_R40 || SUN50I_GEN_H6
 	help
 	  Enable support for SPI Flash. This option allows SPL to read from
 	  sunxi SPI Flash. It uses the same method as the boot ROM, so does
diff --git a/arch/arm/mach-sunxi/spl_spi_sunxi.c b/arch/arm/mach-sunxi/spl_spi_sunxi.c
index 3499c4cc5f8..d00c34708be 100644
--- a/arch/arm/mach-sunxi/spl_spi_sunxi.c
+++ b/arch/arm/mach-sunxi/spl_spi_sunxi.c
@@ -78,7 +78,7 @@
 
 #define CCM_AHB_GATING0             (0x01C20000 + 0x60)
 #define CCM_H6_SPI_BGR_REG          (0x03001000 + 0x96c)
-#ifdef CONFIG_MACH_SUN50I_H6
+#ifdef CONFIG_SUN50I_GEN_H6
 #define CCM_SPI0_CLK                (0x03001000 + 0x940)
 #else
 #define CCM_SPI0_CLK                (0x01C20000 + 0xA0)
@@ -96,7 +96,7 @@
 /*
  * Allwinner A10/A20 SoCs were using pins PC0,PC1,PC2,PC23 for booting
  * from SPI Flash, everything else is using pins PC0,PC1,PC2,PC3.
- * The H6 uses PC0, PC2, PC3, PC5.
+ * The H6 uses PC0, PC2, PC3, PC5, the H616 PC0, PC2, PC3, PC4.
  */
 static void spi0_pinmux_setup(unsigned int pin_function)
 {
@@ -104,11 +104,14 @@ static void spi0_pinmux_setup(unsigned int pin_function)
 	sunxi_gpio_set_cfgpin(SUNXI_GPC(0), pin_function);
 	sunxi_gpio_set_cfgpin(SUNXI_GPC(2), pin_function);
 
-	/* All chips except H6 use PC1, and only H6 uses PC5. */
-	if (!IS_ENABLED(CONFIG_MACH_SUN50I_H6))
+	/* All chips except H6 and H616 use PC1. */
+	if (!IS_ENABLED(CONFIG_SUN50I_GEN_H6))
 		sunxi_gpio_set_cfgpin(SUNXI_GPC(1), pin_function);
-	else
+
+	if (IS_ENABLED(CONFIG_MACH_SUN50I_H6))
 		sunxi_gpio_set_cfgpin(SUNXI_GPC(5), pin_function);
+	if (IS_ENABLED(CONFIG_MACH_SUN50I_H616))
+		sunxi_gpio_set_cfgpin(SUNXI_GPC(4), pin_function);
 
 	/* Older generations use PC23 for CS, newer ones use PC3. */
 	if (IS_ENABLED(CONFIG_MACH_SUN4I) || IS_ENABLED(CONFIG_MACH_SUN7I) ||
@@ -121,7 +124,7 @@ static void spi0_pinmux_setup(unsigned int pin_function)
 static bool is_sun6i_gen_spi(void)
 {
 	return IS_ENABLED(CONFIG_SUNXI_GEN_SUN6I) ||
-	       IS_ENABLED(CONFIG_MACH_SUN50I_H6);
+	       IS_ENABLED(CONFIG_SUN50I_GEN_H6);
 }
 
 static uintptr_t spi0_base_address(void)
@@ -129,7 +132,7 @@ static uintptr_t spi0_base_address(void)
 	if (IS_ENABLED(CONFIG_MACH_SUN8I_R40))
 		return 0x01C05000;
 
-	if (IS_ENABLED(CONFIG_MACH_SUN50I_H6))
+	if (IS_ENABLED(CONFIG_SUN50I_GEN_H6))
 		return 0x05010000;
 
 	if (!is_sun6i_gen_spi())
@@ -146,14 +149,14 @@ static void spi0_enable_clock(void)
 	uintptr_t base = spi0_base_address();
 
 	/* Deassert SPI0 reset on SUN6I */
-	if (IS_ENABLED(CONFIG_MACH_SUN50I_H6))
+	if (IS_ENABLED(CONFIG_SUN50I_GEN_H6))
 		setbits_le32(CCM_H6_SPI_BGR_REG, (1U << 16) | 0x1);
 	else if (is_sun6i_gen_spi())
 		setbits_le32(SUN6I_BUS_SOFT_RST_REG0,
 			     (1 << AHB_RESET_SPI0_SHIFT));
 
 	/* Open the SPI0 gate */
-	if (!IS_ENABLED(CONFIG_MACH_SUN50I_H6))
+	if (!IS_ENABLED(CONFIG_SUN50I_GEN_H6))
 		setbits_le32(CCM_AHB_GATING0, (1 << AHB_GATE_OFFSET_SPI0));
 
 	/* Divide by 4 */
@@ -194,11 +197,11 @@ static void spi0_disable_clock(void)
 	writel(0, CCM_SPI0_CLK);
 
 	/* Close the SPI0 gate */
-	if (!IS_ENABLED(CONFIG_MACH_SUN50I_H6))
+	if (!IS_ENABLED(CONFIG_SUN50I_GEN_H6))
 		clrbits_le32(CCM_AHB_GATING0, (1 << AHB_GATE_OFFSET_SPI0));
 
 	/* Assert SPI0 reset on SUN6I */
-	if (IS_ENABLED(CONFIG_MACH_SUN50I_H6))
+	if (IS_ENABLED(CONFIG_SUN50I_GEN_H6))
 		clrbits_le32(CCM_H6_SPI_BGR_REG, (1U << 16) | 0x1);
 	else if (is_sun6i_gen_spi())
 		clrbits_le32(SUN6I_BUS_SOFT_RST_REG0,
@@ -210,7 +213,7 @@ static void spi0_init(void)
 	unsigned int pin_function = SUNXI_GPC_SPI0;
 
 	if (IS_ENABLED(CONFIG_MACH_SUN50I) ||
-	    IS_ENABLED(CONFIG_MACH_SUN50I_H6))
+	    IS_ENABLED(CONFIG_SUN50I_GEN_H6))
 		pin_function = SUN50I_GPC_SPI0;
 
 	spi0_pinmux_setup(pin_function);
-- 
2.17.5

