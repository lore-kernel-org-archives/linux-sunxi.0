Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE4E313AE8
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Oct 2023 13:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 142E2FEC;
	Mon, 23 Oct 2023 06:25:51 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.manchester.arm.com [10.32.101.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AC8BB3F762;
	Mon, 23 Oct 2023 06:25:08 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Maxim Kiselev <bigunclemax@gmail.com>,
	Sam Edwards <cfsworks@gmail.com>,
	Okhunjon Sobirjonov <okhunjon72@gmail.com>
Subject: [PATCH v3 05/24] pinctrl: sunxi: add GPIO in/out wrappers
Date: Mon, 23 Oct 2023 14:24:30 +0100
Message-Id: <20231023132449.813863-6-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231023132449.813863-1-andre.przywara@arm.com>
References: <20231023132449.813863-1-andre.przywara@arm.com>
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
Reviewed-by: Samuel Holland <samuel@sholland.org>
---
 drivers/gpio/sunxi_gpio.c | 55 ++++++++++++++++++---------------------
 1 file changed, 25 insertions(+), 30 deletions(-)

diff --git a/drivers/gpio/sunxi_gpio.c b/drivers/gpio/sunxi_gpio.c
index 71c3168b755..3ca833316b5 100644
--- a/drivers/gpio/sunxi_gpio.c
+++ b/drivers/gpio/sunxi_gpio.c
@@ -81,6 +81,19 @@ int sunxi_gpio_get_cfgpin(u32 pin)
 	return sunxi_gpio_get_cfgbank(pio, pin);
 }
 
+static void sunxi_gpio_set_value_bank(struct sunxi_gpio *pio,
+				       int pin, bool set)
+{
+	u32 mask = 1U << pin;
+
+	clrsetbits_le32(&pio->dat, set ? 0 : mask, set ? mask : 0);
+}
+
+static int sunxi_gpio_get_value_bank(struct sunxi_gpio *pio, int pin)
+{
+	return !!(readl(&pio->dat) & (1U << pin));
+}
+
 void sunxi_gpio_set_drv(u32 pin, u32 val)
 {
 	u32 bank = GPIO_BANK(pin);
@@ -117,35 +130,20 @@ void sunxi_gpio_set_pull_bank(struct sunxi_gpio *pio, int bank_offset, u32 val)
 /* =========== Non-DM code, used by the SPL. ============ */
 
 #if !CONFIG_IS_ENABLED(DM_GPIO)
-static int sunxi_gpio_output(u32 pin, u32 val)
+static void sunxi_gpio_set_value(u32 pin, bool set)
 {
-	u32 dat;
 	u32 bank = GPIO_BANK(pin);
-	u32 num = GPIO_NUM(pin);
 	struct sunxi_gpio *pio = BANK_TO_GPIO(bank);
 
-	dat = readl(&pio->dat);
-	if (val)
-		dat |= 0x1 << num;
-	else
-		dat &= ~(0x1 << num);
-
-	writel(dat, &pio->dat);
-
-	return 0;
+	sunxi_gpio_set_value_bank(pio, GPIO_NUM(pin), set);
 }
 
-static int sunxi_gpio_input(u32 pin)
+static int sunxi_gpio_get_value(u32 pin)
 {
-	u32 dat;
 	u32 bank = GPIO_BANK(pin);
-	u32 num = GPIO_NUM(pin);
 	struct sunxi_gpio *pio = BANK_TO_GPIO(bank);
 
-	dat = readl(&pio->dat);
-	dat >>= num;
-
-	return dat & 0x1;
+	return sunxi_gpio_get_value_bank(pio, GPIO_NUM(pin));
 }
 
 int gpio_request(unsigned gpio, const char *label)
@@ -168,18 +166,21 @@ int gpio_direction_input(unsigned gpio)
 int gpio_direction_output(unsigned gpio, int value)
 {
 	sunxi_gpio_set_cfgpin(gpio, SUNXI_GPIO_OUTPUT);
+	sunxi_gpio_set_value(gpio, value);
 
-	return sunxi_gpio_output(gpio, value);
+	return 0;
 }
 
 int gpio_get_value(unsigned gpio)
 {
-	return sunxi_gpio_input(gpio);
+	return sunxi_gpio_get_value(gpio);
 }
 
 int gpio_set_value(unsigned gpio, int value)
 {
-	return sunxi_gpio_output(gpio, value);
+	sunxi_gpio_set_value(gpio, value);
+
+	return 0;
 }
 
 int sunxi_name_to_gpio(const char *name)
@@ -231,13 +232,8 @@ int sunxi_name_to_gpio(const char *name)
 static int sunxi_gpio_get_value(struct udevice *dev, unsigned offset)
 {
 	struct sunxi_gpio_plat *plat = dev_get_plat(dev);
-	u32 num = GPIO_NUM(offset);
-	unsigned dat;
-
-	dat = readl(&plat->regs->dat);
-	dat >>= num;
 
-	return dat & 0x1;
+	return sunxi_gpio_get_value_bank(plat->regs, offset);
 }
 
 static int sunxi_gpio_get_function(struct udevice *dev, unsigned offset)
@@ -275,9 +271,8 @@ static int sunxi_gpio_set_flags(struct udevice *dev, unsigned int offset,
 
 	if (flags & GPIOD_IS_OUT) {
 		u32 value = !!(flags & GPIOD_IS_OUT_ACTIVE);
-		u32 num = GPIO_NUM(offset);
 
-		clrsetbits_le32(&plat->regs->dat, 1 << num, value << num);
+		sunxi_gpio_set_value_bank(plat->regs, offset, value);
 		sunxi_gpio_set_cfgbank(plat->regs, offset, SUNXI_GPIO_OUTPUT);
 	} else if (flags & GPIOD_IS_IN) {
 		u32 pull = 0;
-- 
2.25.1

