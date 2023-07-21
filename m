Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20FC21DDF9
	for <linux-sunxi@lists.linux.dev>; Fri, 21 Jul 2023 13:47:09 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D61AE1516;
	Fri, 21 Jul 2023 06:47:50 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 245A93F6C4;
	Fri, 21 Jul 2023 06:47:06 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
	u-boot@lists.denx.de
Cc: Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Maxim Kiselev <bigunclemax@gmail.com>,
	Sam Edwards <cfsworks@gmail.com>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 05/20] pinctrl: sunxi: move pinctrl code and remove GPIO_EXTRA_HEADER
Date: Fri, 21 Jul 2023 14:45:51 +0100
Message-Id: <20230721134606.4505-6-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.8
In-Reply-To: <20230721134606.4505-1-andre.przywara@arm.com>
References: <20230721134606.4505-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

U-Boot's generic GPIO_EXTRA_HEADER is a convenience symbol to allow code
to more easily include platform specific GPIO headers. This should not
be needed in a DM world anymore, since the generic GPIO framework
handles that nicely.
For Allwinner boards we still need to deal with non-DM GPIO in the SPL,
but this should become the exception, not the rule.

Make this more obvious by removing the definition of GPIO_EXTRA_HEADER,
and just force every legacy user of platform specific GPIO to include
the new sunxi_gpio.h header explicitly. Everyone doing so should feel
ashamed and should find a way to avoid it from now on.
This also moves and renames the existing sunxi-specific low level
pinctrl routines from arch/arm/mach-sunxi into board/sunxi, and the
gpio.h header to the generic include/ directory, so the common code can
be shared outside of arch/arm.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/Kconfig                                             | 1 -
 arch/arm/mach-sunxi/Makefile                                 | 1 -
 arch/arm/mach-sunxi/board.c                                  | 1 +
 arch/arm/mach-sunxi/dram_suniv.c                             | 2 +-
 arch/arm/mach-sunxi/spl_spi_sunxi.c                          | 1 +
 board/sunxi/Makefile                                         | 1 +
 board/sunxi/board.c                                          | 1 +
 board/sunxi/chip.c                                           | 2 +-
 arch/arm/mach-sunxi/pinmux.c => board/sunxi/pinctrl.c        | 5 ++++-
 drivers/gpio/axp_gpio.c                                      | 1 +
 drivers/gpio/sunxi_gpio.c                                    | 1 +
 drivers/i2c/sun6i_p2wi.c                                     | 2 +-
 drivers/i2c/sun8i_rsb.c                                      | 2 +-
 drivers/mmc/sunxi_mmc.c                                      | 1 +
 drivers/pinctrl/sunxi/pinctrl-sunxi.c                        | 1 +
 drivers/video/hitachi_tx18d42vm_lcd.c                        | 1 +
 drivers/video/ssd2828.c                                      | 1 -
 drivers/video/sunxi/sunxi_display.c                          | 1 +
 drivers/video/sunxi/sunxi_lcd.c                              | 1 +
 .../include/asm/arch-sunxi/gpio.h => include/sunxi_gpio.h    | 0
 20 files changed, 19 insertions(+), 8 deletions(-)
 rename arch/arm/mach-sunxi/pinmux.c => board/sunxi/pinctrl.c (94%)
 rename arch/arm/include/asm/arch-sunxi/gpio.h => include/sunxi_gpio.h (100%)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 422cc01e529..ae8d165dca4 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1134,7 +1134,6 @@ config ARCH_SUNXI
 	select DM_MMC if MMC
 	select DM_SCSI if SCSI
 	select DM_SERIAL
-	select GPIO_EXTRA_HEADER
 	select OF_BOARD_SETUP
 	select OF_CONTROL
 	select OF_SEPARATE
diff --git a/arch/arm/mach-sunxi/Makefile b/arch/arm/mach-sunxi/Makefile
index 58f807cb82d..671211e9322 100644
--- a/arch/arm/mach-sunxi/Makefile
+++ b/arch/arm/mach-sunxi/Makefile
@@ -10,7 +10,6 @@ obj-y	+= board.o
 obj-y	+= clock.o
 obj-y	+= cpu_info.o
 obj-y	+= dram_helpers.o
-obj-y	+= pinmux.o
 obj-$(CONFIG_SUN6I_PRCM)	+= prcm.o
 obj-$(CONFIG_AXP_PMIC_BUS)	+= pmic_bus.o
 obj-$(CONFIG_MACH_SUNIV)	+= clock_sun6i.o
diff --git a/arch/arm/mach-sunxi/board.c b/arch/arm/mach-sunxi/board.c
index 391a65a5495..ec46ab92795 100644
--- a/arch/arm/mach-sunxi/board.c
+++ b/arch/arm/mach-sunxi/board.c
@@ -17,6 +17,7 @@
 #include <i2c.h>
 #include <serial.h>
 #include <spl.h>
+#include <sunxi_gpio.h>
 #include <asm/cache.h>
 #include <asm/gpio.h>
 #include <asm/io.h>
diff --git a/arch/arm/mach-sunxi/dram_suniv.c b/arch/arm/mach-sunxi/dram_suniv.c
index 3aa3ce76272..9e583e18553 100644
--- a/arch/arm/mach-sunxi/dram_suniv.c
+++ b/arch/arm/mach-sunxi/dram_suniv.c
@@ -13,10 +13,10 @@
 #include <asm/io.h>
 #include <asm/arch/clock.h>
 #include <asm/arch/dram.h>
-#include <asm/arch/gpio.h>
 #include <linux/bitops.h>
 #include <linux/delay.h>
 #include <hang.h>
+#include <sunxi_gpio.h>
 
 #define SDR_T_CAS			(0x2)
 #define SDR_T_RAS			(0x8)
diff --git a/arch/arm/mach-sunxi/spl_spi_sunxi.c b/arch/arm/mach-sunxi/spl_spi_sunxi.c
index 81159cfee61..c2410dd7bb1 100644
--- a/arch/arm/mach-sunxi/spl_spi_sunxi.c
+++ b/arch/arm/mach-sunxi/spl_spi_sunxi.c
@@ -13,6 +13,7 @@
 #include <linux/bitops.h>
 #include <linux/delay.h>
 #include <linux/libfdt.h>
+#include <sunxi_gpio.h>
 
 #ifdef CONFIG_SPL_OS_BOOT
 #error CONFIG_SPL_OS_BOOT is not supported yet
diff --git a/board/sunxi/Makefile b/board/sunxi/Makefile
index d96b7897b6c..7763b032c80 100644
--- a/board/sunxi/Makefile
+++ b/board/sunxi/Makefile
@@ -7,6 +7,7 @@
 # (C) Copyright 2000-2003
 # Wolfgang Denk, DENX Software Engineering, wd@denx.de.
 obj-y	+= board.o
+obj-y	+= pinctrl.o
 obj-$(CONFIG_SUN7I_GMAC)	+= gmac.o
 obj-$(CONFIG_MACH_SUN4I)	+= dram_sun4i_auto.o
 obj-$(CONFIG_MACH_SUN5I)	+= dram_sun5i_auto.o
diff --git a/board/sunxi/board.c b/board/sunxi/board.c
index 2db4a2d73ca..94a8d57d165 100644
--- a/board/sunxi/board.c
+++ b/board/sunxi/board.c
@@ -38,6 +38,7 @@
 #include <asm/armv7.h>
 #endif
 #include <asm/gpio.h>
+#include <sunxi_gpio.h>
 #include <asm/io.h>
 #include <u-boot/crc.h>
 #include <env_internal.h>
diff --git a/board/sunxi/chip.c b/board/sunxi/chip.c
index cde04bebe96..eeee6319e79 100644
--- a/board/sunxi/chip.c
+++ b/board/sunxi/chip.c
@@ -12,7 +12,7 @@
 #include <w1-eeprom.h>
 #include <dm/device-internal.h>
 
-#include <asm/arch/gpio.h>
+#include <sunxi_gpio.h>
 
 #include <extension_board.h>
 
diff --git a/arch/arm/mach-sunxi/pinmux.c b/board/sunxi/pinctrl.c
similarity index 94%
rename from arch/arm/mach-sunxi/pinmux.c
rename to board/sunxi/pinctrl.c
index 17d1a7bdb97..494d92c73bb 100644
--- a/arch/arm/mach-sunxi/pinmux.c
+++ b/board/sunxi/pinctrl.c
@@ -3,11 +3,14 @@
  * (C) Copyright 2007-2011
  * Allwinner Technology Co., Ltd. <www.allwinnertech.com>
  * Tom Cubie <tangliang@allwinnertech.com>
+ *
+ * Low level GPIO/pin controller access functions, to be shared by non-DM
+ * SPL code and the DM pinctrl/GPIO drivers.
  */
 
 #include <common.h>
 #include <asm/io.h>
-#include <asm/arch/gpio.h>
+#include <sunxi_gpio.h>
 
 void sunxi_gpio_set_cfgbank(void *bank_base, int pin_offset, u32 val)
 {
diff --git a/drivers/gpio/axp_gpio.c b/drivers/gpio/axp_gpio.c
index 49672193ffc..af6631697f5 100644
--- a/drivers/gpio/axp_gpio.c
+++ b/drivers/gpio/axp_gpio.c
@@ -14,6 +14,7 @@
 #include <dm/lists.h>
 #include <dm/root.h>
 #include <errno.h>
+#include <sunxi_gpio.h>
 
 static int axp_gpio_set_value(struct udevice *dev, unsigned pin, int val);
 
diff --git a/drivers/gpio/sunxi_gpio.c b/drivers/gpio/sunxi_gpio.c
index 6dbf0e368f9..cf9766813e3 100644
--- a/drivers/gpio/sunxi_gpio.c
+++ b/drivers/gpio/sunxi_gpio.c
@@ -17,6 +17,7 @@
 #include <asm/io.h>
 #include <asm/gpio.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <sunxi_gpio.h>
 
 #if !CONFIG_IS_ENABLED(DM_GPIO)
 int gpio_request(unsigned gpio, const char *label)
diff --git a/drivers/i2c/sun6i_p2wi.c b/drivers/i2c/sun6i_p2wi.c
index d221323295d..b8e07a533ca 100644
--- a/drivers/i2c/sun6i_p2wi.c
+++ b/drivers/i2c/sun6i_p2wi.c
@@ -20,10 +20,10 @@
 #include <errno.h>
 #include <i2c.h>
 #include <reset.h>
+#include <sunxi_gpio.h>
 #include <time.h>
 #include <asm/io.h>
 #include <asm/arch/cpu.h>
-#include <asm/arch/gpio.h>
 #include <asm/arch/p2wi.h>
 #include <asm/arch/prcm.h>
 #include <asm/arch/sys_proto.h>
diff --git a/drivers/i2c/sun8i_rsb.c b/drivers/i2c/sun8i_rsb.c
index 47fa05b6d1c..f36f2c7afac 100644
--- a/drivers/i2c/sun8i_rsb.c
+++ b/drivers/i2c/sun8i_rsb.c
@@ -14,10 +14,10 @@
 #include <dm.h>
 #include <errno.h>
 #include <i2c.h>
+#include <sunxi_gpio.h>
 #include <reset.h>
 #include <time.h>
 #include <asm/arch/cpu.h>
-#include <asm/arch/gpio.h>
 #include <asm/arch/prcm.h>
 #include <asm/arch/rsb.h>
 
diff --git a/drivers/mmc/sunxi_mmc.c b/drivers/mmc/sunxi_mmc.c
index 23bc7da917a..03e33753fcf 100644
--- a/drivers/mmc/sunxi_mmc.c
+++ b/drivers/mmc/sunxi_mmc.c
@@ -27,6 +27,7 @@
 #include <asm/arch/cpu.h>
 #include <asm/arch/mmc.h>
 #include <linux/delay.h>
+#include <sunxi_gpio.h>
 
 #ifndef CCM_MMC_CTRL_MODE_SEL_NEW
 #define CCM_MMC_CTRL_MODE_SEL_NEW	0
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 946447e9136..fc80fe50b14 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -7,6 +7,7 @@
 #include <dm/pinctrl.h>
 #include <errno.h>
 #include <malloc.h>
+#include <sunxi_gpio.h>
 
 #include <asm/gpio.h>
 
diff --git a/drivers/video/hitachi_tx18d42vm_lcd.c b/drivers/video/hitachi_tx18d42vm_lcd.c
index 87c4d27438a..95984fe3d3d 100644
--- a/drivers/video/hitachi_tx18d42vm_lcd.c
+++ b/drivers/video/hitachi_tx18d42vm_lcd.c
@@ -10,6 +10,7 @@
 #include <linux/delay.h>
 
 #include <asm/gpio.h>
+#include <sunxi_gpio.h>
 #include <errno.h>
 
 /*
diff --git a/drivers/video/ssd2828.c b/drivers/video/ssd2828.c
index 4cdcbe7755a..948f5e74d0f 100644
--- a/drivers/video/ssd2828.c
+++ b/drivers/video/ssd2828.c
@@ -12,7 +12,6 @@
 #include <common.h>
 #include <malloc.h>
 #include <mipi_display.h>
-#include <asm/arch/gpio.h>
 #include <asm/gpio.h>
 #include <linux/delay.h>
 
diff --git a/drivers/video/sunxi/sunxi_display.c b/drivers/video/sunxi/sunxi_display.c
index 9110a484821..8da44a1bb6d 100644
--- a/drivers/video/sunxi/sunxi_display.c
+++ b/drivers/video/sunxi/sunxi_display.c
@@ -31,6 +31,7 @@
 #include <malloc.h>
 #include <video.h>
 #include <dm/uclass-internal.h>
+#include <sunxi_gpio.h>
 #include "../videomodes.h"
 #include "../anx9804.h"
 #include "../hitachi_tx18d42vm_lcd.h"
diff --git a/drivers/video/sunxi/sunxi_lcd.c b/drivers/video/sunxi/sunxi_lcd.c
index 8b9c3b2bfa9..7a01cc343ca 100644
--- a/drivers/video/sunxi/sunxi_lcd.c
+++ b/drivers/video/sunxi/sunxi_lcd.c
@@ -17,6 +17,7 @@
 #include <asm/arch/lcdc.h>
 #include <asm/global_data.h>
 #include <asm/gpio.h>
+#include <sunxi_gpio.h>
 
 struct sunxi_lcd_priv {
 	struct display_timing timing;
diff --git a/arch/arm/include/asm/arch-sunxi/gpio.h b/include/sunxi_gpio.h
similarity index 100%
rename from arch/arm/include/asm/arch-sunxi/gpio.h
rename to include/sunxi_gpio.h
-- 
2.35.8

