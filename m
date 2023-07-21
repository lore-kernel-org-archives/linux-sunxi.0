Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C84FD1E50E
	for <linux-sunxi@lists.linux.dev>; Fri, 21 Jul 2023 13:47:06 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52DAA1515;
	Fri, 21 Jul 2023 06:47:49 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 957E53F6C4;
	Fri, 21 Jul 2023 06:47:04 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
	u-boot@lists.denx.de
Cc: Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Maxim Kiselev <bigunclemax@gmail.com>,
	Sam Edwards <cfsworks@gmail.com>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 04/20] pinctrl: sunxi: remove struct sunxi_gpio
Date: Fri, 21 Jul 2023 14:45:50 +0100
Message-Id: <20230721134606.4505-5-andre.przywara@arm.com>
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

So far every Allwinner SoC used the same basic pincontroller/GPIO
register frame, and just differed by the number of implemented banks and
pins, plus some special functionality from time to time. However the D1
and successors use a slightly different pinctrl register layout.
Use that opportunity to drop "struct sunxi_gpio", that described that
MMIO frame in a C struct. That approach is somewhat frowned upon in the
Linux world and rarely used there, though still popular with U-Boot.

Switching from a C struct to a "base address plus offset" approach allows
to switch between the two models more dynamically, without reverting to
preprocessor macros and #ifdef's.

Model the pinctrl MMIO register frame in the usual "base address +
offset" way, and replace a hard-to-parse CPP macro with a more readable
static function.
All the users get converted over. There are no functional changes at
this point, it just prepares the stages for the D1 and friends.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/include/asm/arch-sunxi/gpio.h | 67 +++++++++++---------------
 arch/arm/mach-sunxi/pinmux.c           | 66 +++++++++++++------------
 drivers/pinctrl/sunxi/pinctrl-sunxi.c  | 14 +++---
 3 files changed, 71 insertions(+), 76 deletions(-)

diff --git a/arch/arm/include/asm/arch-sunxi/gpio.h b/arch/arm/include/asm/arch-sunxi/gpio.h
index 26b7294f9c7..b12bdbd2739 100644
--- a/arch/arm/include/asm/arch-sunxi/gpio.h
+++ b/arch/arm/include/asm/arch-sunxi/gpio.h
@@ -28,13 +28,6 @@
 #define SUNXI_GPIO_H	7
 #define SUNXI_GPIO_I	8
 
-/*
- * This defines the number of GPIO banks for the _main_ GPIO controller.
- * You should fix up the padding in struct sunxi_gpio_reg below if you
- * change this.
- */
-#define SUNXI_GPIO_BANKS 9
-
 /*
  * sun6i/sun8i and later SoCs have an additional GPIO controller (R_PIO)
  * at a different register offset.
@@ -52,46 +45,42 @@
 #define SUNXI_GPIO_M	12
 #define SUNXI_GPIO_N	13
 
-struct sunxi_gpio {
-	u32 cfg[4];
-	u32 dat;
-	u32 drv[2];
-	u32 pull[2];
-};
-
-/* gpio interrupt control */
-struct sunxi_gpio_int {
-	u32 cfg[3];
-	u32 ctl;
-	u32 sta;
-	u32 deb;		/* interrupt debounce */
-};
-
-struct sunxi_gpio_reg {
-	struct sunxi_gpio gpio_bank[SUNXI_GPIO_BANKS];
-	u8 res[0xbc];
-	struct sunxi_gpio_int gpio_int;
-};
-
 #define SUN50I_H6_GPIO_POW_MOD_SEL	0x340
 #define SUN50I_H6_GPIO_POW_MOD_VAL	0x348
 
-#define BANK_TO_GPIO(bank)	(((bank) < SUNXI_GPIO_L) ? \
-	&((struct sunxi_gpio_reg *)SUNXI_PIO_BASE)->gpio_bank[bank] : \
-	&((struct sunxi_gpio_reg *)SUNXI_R_PIO_BASE)->gpio_bank[(bank) - SUNXI_GPIO_L])
-
 #define GPIO_BANK(pin)		((pin) >> 5)
 #define GPIO_NUM(pin)		((pin) & 0x1f)
 
+#define GPIO_CFG_REG_OFFSET	0x00
 #define GPIO_CFG_INDEX(pin)	(((pin) & 0x1f) >> 3)
 #define GPIO_CFG_OFFSET(pin)	((((pin) & 0x1f) & 0x7) << 2)
 
+#define GPIO_DAT_REG_OFFSET	0x10
+
+#define GPIO_DRV_REG_OFFSET	0x14
 #define GPIO_DRV_INDEX(pin)	(((pin) & 0x1f) >> 4)
 #define GPIO_DRV_OFFSET(pin)	((((pin) & 0x1f) & 0xf) << 1)
 
+#define GPIO_PULL_REG_OFFSET	0x1c
 #define GPIO_PULL_INDEX(pin)	(((pin) & 0x1f) >> 4)
 #define GPIO_PULL_OFFSET(pin)	((((pin) & 0x1f) & 0xf) << 1)
 
+#define SUNXI_PINCTRL_BANK_SIZE 0x24
+
+static inline void* BANK_TO_GPIO(int bank)
+{
+	void *pio_base;
+
+	if (bank < SUNXI_GPIO_L) {
+		pio_base = (void *)(uintptr_t)SUNXI_PIO_BASE;
+	} else {
+		pio_base = (void *)(uintptr_t)SUNXI_R_PIO_BASE;
+		bank -= SUNXI_GPIO_L;
+	}
+
+	return pio_base + bank * SUNXI_PINCTRL_BANK_SIZE;
+}
+
 /* GPIO bank sizes */
 #define SUNXI_GPIOS_PER_BANK	32
 
@@ -213,22 +202,22 @@ enum sunxi_gpio_number {
 #define SUNXI_GPIO_AXP0_GPIO_COUNT	6
 
 struct sunxi_gpio_plat {
-	struct sunxi_gpio	*regs;
+	void			*regs;
 	char			bank_name[3];
 };
 
-void sunxi_gpio_set_cfgbank(struct sunxi_gpio *pio, int bank_offset, u32 val);
+void sunxi_gpio_set_cfgbank(void *bank_base, int pin_offset, u32 val);
 void sunxi_gpio_set_cfgpin(u32 pin, u32 val);
-int sunxi_gpio_get_cfgbank(struct sunxi_gpio *pio, int bank_offset);
+int sunxi_gpio_get_cfgbank(void *bank_base, int pin_offset);
 int sunxi_gpio_get_cfgpin(u32 pin);
-void sunxi_gpio_set_output_bank(struct sunxi_gpio *pio, int pin, bool set);
+void sunxi_gpio_set_output_bank(void *bank_base, int pin, bool set);
 void sunxi_gpio_set_output(u32 pin, bool set);
-int sunxi_gpio_get_output_bank(struct sunxi_gpio *pio, int pin);
+int sunxi_gpio_get_output_bank(void *bank_base, int pin);
 int sunxi_gpio_get_output(u32 pin);
 void sunxi_gpio_set_drv(u32 pin, u32 val);
-void sunxi_gpio_set_drv_bank(struct sunxi_gpio *pio, u32 bank_offset, u32 val);
+void sunxi_gpio_set_drv_bank(void *bank_base, u32 pin_offset, u32 val);
 void sunxi_gpio_set_pull(u32 pin, u32 val);
-void sunxi_gpio_set_pull_bank(struct sunxi_gpio *pio, int bank_offset, u32 val);
+void sunxi_gpio_set_pull_bank(void *bank_base, int pin_offset, u32 val);
 int sunxi_name_to_gpio(const char *name);
 
 #if !defined CONFIG_SPL_BUILD && defined CONFIG_AXP_GPIO
diff --git a/arch/arm/mach-sunxi/pinmux.c b/arch/arm/mach-sunxi/pinmux.c
index 751cac8e099..17d1a7bdb97 100644
--- a/arch/arm/mach-sunxi/pinmux.c
+++ b/arch/arm/mach-sunxi/pinmux.c
@@ -9,29 +9,30 @@
 #include <asm/io.h>
 #include <asm/arch/gpio.h>
 
-void sunxi_gpio_set_cfgbank(struct sunxi_gpio *pio, int bank_offset, u32 val)
+void sunxi_gpio_set_cfgbank(void *bank_base, int pin_offset, u32 val)
 {
-	u32 index = GPIO_CFG_INDEX(bank_offset);
-	u32 offset = GPIO_CFG_OFFSET(bank_offset);
+	u32 index = GPIO_CFG_INDEX(pin_offset);
+	u32 offset = GPIO_CFG_OFFSET(pin_offset);
 
-	clrsetbits_le32(&pio->cfg[index], 0xf << offset, val << offset);
+	clrsetbits_le32(bank_base + GPIO_CFG_REG_OFFSET + index * 4,
+			0xfU << offset, val << offset);
 }
 
 void sunxi_gpio_set_cfgpin(u32 pin, u32 val)
 {
 	u32 bank = GPIO_BANK(pin);
-	struct sunxi_gpio *pio = BANK_TO_GPIO(bank);
+	void *pio = BANK_TO_GPIO(bank);
 
-	sunxi_gpio_set_cfgbank(pio, pin, val);
+	sunxi_gpio_set_cfgbank(pio, pin % 32, val);
 }
 
-int sunxi_gpio_get_cfgbank(struct sunxi_gpio *pio, int bank_offset)
+int sunxi_gpio_get_cfgbank(void *bank_base, int pin_offset)
 {
-	u32 index = GPIO_CFG_INDEX(bank_offset);
-	u32 offset = GPIO_CFG_OFFSET(bank_offset);
+	u32 index = GPIO_CFG_INDEX(pin_offset);
+	u32 offset = GPIO_CFG_OFFSET(pin_offset);
 	u32 cfg;
 
-	cfg = readl(&pio->cfg[index]);
+	cfg = readl(bank_base + GPIO_CFG_REG_OFFSET + index * 4);
 	cfg >>= offset;
 
 	return cfg & 0xf;
@@ -40,35 +41,38 @@ int sunxi_gpio_get_cfgbank(struct sunxi_gpio *pio, int bank_offset)
 int sunxi_gpio_get_cfgpin(u32 pin)
 {
 	u32 bank = GPIO_BANK(pin);
-	struct sunxi_gpio *pio = BANK_TO_GPIO(bank);
+	void *bank_base = BANK_TO_GPIO(bank);
 
-	return sunxi_gpio_get_cfgbank(pio, pin);
+	return sunxi_gpio_get_cfgbank(bank_base, pin % 32);
 }
 
-void sunxi_gpio_set_output_bank(struct sunxi_gpio *pio, int pin, bool set)
+void sunxi_gpio_set_output_bank(void *bank_base, int pin, bool set)
 {
 	u32 mask = 1U << GPIO_NUM(pin);
 
-	clrsetbits_le32(&pio->dat, set ? 0 : mask, set ? mask : 0);
+	clrsetbits_le32(bank_base + GPIO_DAT_REG_OFFSET,
+			set ? 0 : mask, set ? mask : 0);
 }
 
 void sunxi_gpio_set_output(u32 pin, bool set)
 {
 	u32 bank = GPIO_BANK(pin);
-	struct sunxi_gpio *pio = BANK_TO_GPIO(bank);
+	void *pio = BANK_TO_GPIO(bank);
 
 	sunxi_gpio_set_output_bank(pio, pin, set);
 }
 
-int sunxi_gpio_get_output_bank(struct sunxi_gpio *pio, int pin)
+int sunxi_gpio_get_output_bank(void *bank_base, int pin)
 {
-	return !!(readl(&pio->dat) & (1U << GPIO_NUM(pin)));
+	u32 mask = 1U << GPIO_NUM(pin);
+
+	return !!(readl(bank_base + GPIO_DAT_REG_OFFSET) & mask);
 }
 
 int sunxi_gpio_get_output(u32 pin)
 {
 	u32 bank = GPIO_BANK(pin);
-	struct sunxi_gpio *pio = BANK_TO_GPIO(bank);
+	void *pio = BANK_TO_GPIO(bank);
 
 	return sunxi_gpio_get_output_bank(pio, pin);
 }
@@ -76,31 +80,33 @@ int sunxi_gpio_get_output(u32 pin)
 void sunxi_gpio_set_drv(u32 pin, u32 val)
 {
 	u32 bank = GPIO_BANK(pin);
-	struct sunxi_gpio *pio = BANK_TO_GPIO(bank);
+	void *bank_base = BANK_TO_GPIO(bank);
 
-	sunxi_gpio_set_drv_bank(pio, pin, val);
+	sunxi_gpio_set_drv_bank(bank_base, pin % 32, val);
 }
 
-void sunxi_gpio_set_drv_bank(struct sunxi_gpio *pio, u32 bank_offset, u32 val)
+void sunxi_gpio_set_drv_bank(void *bank_base, u32 pin_offset, u32 val)
 {
-	u32 index = GPIO_DRV_INDEX(bank_offset);
-	u32 offset = GPIO_DRV_OFFSET(bank_offset);
+	u32 index = GPIO_DRV_INDEX(pin_offset);
+	u32 offset = GPIO_DRV_OFFSET(pin_offset);
 
-	clrsetbits_le32(&pio->drv[index], 0x3 << offset, val << offset);
+	clrsetbits_le32(bank_base + GPIO_DRV_REG_OFFSET + index * 4,
+			0x3U << offset, val << offset);
 }
 
 void sunxi_gpio_set_pull(u32 pin, u32 val)
 {
 	u32 bank = GPIO_BANK(pin);
-	struct sunxi_gpio *pio = BANK_TO_GPIO(bank);
+	void *bank_base = BANK_TO_GPIO(bank);
 
-	sunxi_gpio_set_pull_bank(pio, pin, val);
+	sunxi_gpio_set_pull_bank(bank_base, pin % 32, val);
 }
 
-void sunxi_gpio_set_pull_bank(struct sunxi_gpio *pio, int bank_offset, u32 val)
+void sunxi_gpio_set_pull_bank(void *bank_base, int pin_offset, u32 val)
 {
-	u32 index = GPIO_PULL_INDEX(bank_offset);
-	u32 offset = GPIO_PULL_OFFSET(bank_offset);
+	u32 index = GPIO_PULL_INDEX(pin_offset);
+	u32 offset = GPIO_PULL_OFFSET(pin_offset);
 
-	clrsetbits_le32(&pio->pull[index], 0x3 << offset, val << offset);
+	clrsetbits_le32(bank_base + GPIO_PULL_REG_OFFSET + index * 4,
+			0x3U << offset, val << offset);
 }
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index e5102180902..946447e9136 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -35,7 +35,7 @@ struct sunxi_pinctrl_desc {
 };
 
 struct sunxi_pinctrl_plat {
-	struct sunxi_gpio __iomem *base;
+	void __iomem *base;
 };
 
 static int sunxi_pinctrl_get_pins_count(struct udevice *dev)
@@ -86,8 +86,8 @@ static int sunxi_pinctrl_pinmux_set(struct udevice *dev, uint pin_selector,
 	      sunxi_pinctrl_get_function_name(dev, func_selector),
 	      desc->functions[func_selector].mux);
 
-	sunxi_gpio_set_cfgbank(plat->base + bank, pin,
-			       desc->functions[func_selector].mux);
+	sunxi_gpio_set_cfgbank(plat->base + bank * SUNXI_PINCTRL_BANK_SIZE,
+			       pin, desc->functions[func_selector].mux);
 
 	return 0;
 }
@@ -102,7 +102,7 @@ static const struct pinconf_param sunxi_pinctrl_pinconf_params[] = {
 static int sunxi_pinctrl_pinconf_set_pull(struct sunxi_pinctrl_plat *plat,
 					  uint bank, uint pin, uint bias)
 {
-	struct sunxi_gpio *regs = &plat->base[bank];
+	void *regs = plat->base + bank * SUNXI_PINCTRL_BANK_SIZE;
 
 	sunxi_gpio_set_pull_bank(regs, pin, bias);
 
@@ -112,7 +112,7 @@ static int sunxi_pinctrl_pinconf_set_pull(struct sunxi_pinctrl_plat *plat,
 static int sunxi_pinctrl_pinconf_set_drive(struct sunxi_pinctrl_plat *plat,
 					   uint bank, uint pin, uint drive)
 {
-	struct sunxi_gpio *regs = &plat->base[bank];
+	void *regs = plat->base + bank * SUNXI_PINCTRL_BANK_SIZE;
 
 	if (drive < 10 || drive > 40)
 		return -EINVAL;
@@ -148,7 +148,7 @@ static int sunxi_pinctrl_get_pin_muxing(struct udevice *dev, uint pin_selector,
 	struct sunxi_pinctrl_plat *plat = dev_get_plat(dev);
 	int bank = pin_selector / SUNXI_GPIOS_PER_BANK;
 	int pin	 = pin_selector % SUNXI_GPIOS_PER_BANK;
-	int mux  = sunxi_gpio_get_cfgbank(plat->base + bank, pin);
+	int mux  = sunxi_gpio_get_cfgbank(plat->base + bank * SUNXI_PINCTRL_BANK_SIZE, pin);
 
 	switch (mux) {
 	case SUNXI_GPIO_INPUT:
@@ -206,7 +206,7 @@ static int sunxi_pinctrl_bind(struct udevice *dev)
 		if (!gpio_plat)
 			return -ENOMEM;
 
-		gpio_plat->regs = plat->base + i;
+		gpio_plat->regs = plat->base + i * SUNXI_PINCTRL_BANK_SIZE;
 		gpio_plat->bank_name[0] = 'P';
 		gpio_plat->bank_name[1] = 'A' + desc->first_bank + i;
 		gpio_plat->bank_name[2] = '\0';
-- 
2.35.8

