Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B2B319A1F
	for <linux-sunxi@lists.linux.dev>; Fri, 21 Jul 2023 13:47:10 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C3578150C;
	Fri, 21 Jul 2023 06:47:47 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 120E23F6C4;
	Fri, 21 Jul 2023 06:47:02 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
	u-boot@lists.denx.de
Cc: Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Maxim Kiselev <bigunclemax@gmail.com>,
	Sam Edwards <cfsworks@gmail.com>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 03/20] pinctrl: sunxi: add GPIO in/out wrappers
Date: Fri, 21 Jul 2023 14:45:49 +0100
Message-Id: <20230721134606.4505-4-andre.przywara@arm.com>
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

So far we were open-coding the pincontroller's GPIO output/input access
in each function using that.

Provide functions that wrap that nicely, and follow the existing pattern
(set/get_{bank,}), so users don't need to know about the internals, and
we can abstract the new D1 pinctrl more easily.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/include/asm/arch-sunxi/gpio.h |  4 +++
 arch/arm/mach-sunxi/pinmux.c           | 28 +++++++++++++++
 drivers/gpio/sunxi_gpio.c              | 49 +++++---------------------
 3 files changed, 40 insertions(+), 41 deletions(-)

diff --git a/arch/arm/include/asm/arch-sunxi/gpio.h b/arch/arm/include/asm/arch-sunxi/gpio.h
index 6eaeece4e24..26b7294f9c7 100644
--- a/arch/arm/include/asm/arch-sunxi/gpio.h
+++ b/arch/arm/include/asm/arch-sunxi/gpio.h
@@ -221,6 +221,10 @@ void sunxi_gpio_set_cfgbank(struct sunxi_gpio *pio, int bank_offset, u32 val);
 void sunxi_gpio_set_cfgpin(u32 pin, u32 val);
 int sunxi_gpio_get_cfgbank(struct sunxi_gpio *pio, int bank_offset);
 int sunxi_gpio_get_cfgpin(u32 pin);
+void sunxi_gpio_set_output_bank(struct sunxi_gpio *pio, int pin, bool set);
+void sunxi_gpio_set_output(u32 pin, bool set);
+int sunxi_gpio_get_output_bank(struct sunxi_gpio *pio, int pin);
+int sunxi_gpio_get_output(u32 pin);
 void sunxi_gpio_set_drv(u32 pin, u32 val);
 void sunxi_gpio_set_drv_bank(struct sunxi_gpio *pio, u32 bank_offset, u32 val);
 void sunxi_gpio_set_pull(u32 pin, u32 val);
diff --git a/arch/arm/mach-sunxi/pinmux.c b/arch/arm/mach-sunxi/pinmux.c
index c95fcee9f6c..751cac8e099 100644
--- a/arch/arm/mach-sunxi/pinmux.c
+++ b/arch/arm/mach-sunxi/pinmux.c
@@ -45,6 +45,34 @@ int sunxi_gpio_get_cfgpin(u32 pin)
 	return sunxi_gpio_get_cfgbank(pio, pin);
 }
 
+void sunxi_gpio_set_output_bank(struct sunxi_gpio *pio, int pin, bool set)
+{
+	u32 mask = 1U << GPIO_NUM(pin);
+
+	clrsetbits_le32(&pio->dat, set ? 0 : mask, set ? mask : 0);
+}
+
+void sunxi_gpio_set_output(u32 pin, bool set)
+{
+	u32 bank = GPIO_BANK(pin);
+	struct sunxi_gpio *pio = BANK_TO_GPIO(bank);
+
+	sunxi_gpio_set_output_bank(pio, pin, set);
+}
+
+int sunxi_gpio_get_output_bank(struct sunxi_gpio *pio, int pin)
+{
+	return !!(readl(&pio->dat) & (1U << GPIO_NUM(pin)));
+}
+
+int sunxi_gpio_get_output(u32 pin)
+{
+	u32 bank = GPIO_BANK(pin);
+	struct sunxi_gpio *pio = BANK_TO_GPIO(bank);
+
+	return sunxi_gpio_get_output_bank(pio, pin);
+}
+
 void sunxi_gpio_set_drv(u32 pin, u32 val)
 {
 	u32 bank = GPIO_BANK(pin);
diff --git a/drivers/gpio/sunxi_gpio.c b/drivers/gpio/sunxi_gpio.c
index f0b42e4fdb7..6dbf0e368f9 100644
--- a/drivers/gpio/sunxi_gpio.c
+++ b/drivers/gpio/sunxi_gpio.c
@@ -19,37 +19,6 @@
 #include <dt-bindings/gpio/gpio.h>
 
 #if !CONFIG_IS_ENABLED(DM_GPIO)
-static int sunxi_gpio_output(u32 pin, u32 val)
-{
-	u32 dat;
-	u32 bank = GPIO_BANK(pin);
-	u32 num = GPIO_NUM(pin);
-	struct sunxi_gpio *pio = BANK_TO_GPIO(bank);
-
-	dat = readl(&pio->dat);
-	if (val)
-		dat |= 0x1 << num;
-	else
-		dat &= ~(0x1 << num);
-
-	writel(dat, &pio->dat);
-
-	return 0;
-}
-
-static int sunxi_gpio_input(u32 pin)
-{
-	u32 dat;
-	u32 bank = GPIO_BANK(pin);
-	u32 num = GPIO_NUM(pin);
-	struct sunxi_gpio *pio = BANK_TO_GPIO(bank);
-
-	dat = readl(&pio->dat);
-	dat >>= num;
-
-	return dat & 0x1;
-}
-
 int gpio_request(unsigned gpio, const char *label)
 {
 	return 0;
@@ -70,18 +39,21 @@ int gpio_direction_input(unsigned gpio)
 int gpio_direction_output(unsigned gpio, int value)
 {
 	sunxi_gpio_set_cfgpin(gpio, SUNXI_GPIO_OUTPUT);
+	sunxi_gpio_set_output(gpio, value);
 
-	return sunxi_gpio_output(gpio, value);
+	return 0;
 }
 
 int gpio_get_value(unsigned gpio)
 {
-	return sunxi_gpio_input(gpio);
+	return sunxi_gpio_get_output(gpio);
 }
 
 int gpio_set_value(unsigned gpio, int value)
 {
-	return sunxi_gpio_output(gpio, value);
+	sunxi_gpio_set_output(gpio, value);
+
+	return 0;
 }
 
 int sunxi_name_to_gpio(const char *name)
@@ -131,13 +103,8 @@ int sunxi_name_to_gpio(const char *name)
 static int sunxi_gpio_get_value(struct udevice *dev, unsigned offset)
 {
 	struct sunxi_gpio_plat *plat = dev_get_plat(dev);
-	u32 num = GPIO_NUM(offset);
-	unsigned dat;
-
-	dat = readl(&plat->regs->dat);
-	dat >>= num;
 
-	return dat & 0x1;
+	return sunxi_gpio_get_output_bank(plat->regs, offset) & 0x1;
 }
 
 static int sunxi_gpio_get_function(struct udevice *dev, unsigned offset)
@@ -177,7 +144,7 @@ static int sunxi_gpio_set_flags(struct udevice *dev, unsigned int offset,
 		u32 value = !!(flags & GPIOD_IS_OUT_ACTIVE);
 		u32 num = GPIO_NUM(offset);
 
-		clrsetbits_le32(&plat->regs->dat, 1 << num, value << num);
+		sunxi_gpio_set_output_bank(plat->regs, num, value);
 		sunxi_gpio_set_cfgbank(plat->regs, offset, SUNXI_GPIO_OUTPUT);
 	} else if (flags & GPIOD_IS_IN) {
 		u32 pull = 0;
-- 
2.35.8

