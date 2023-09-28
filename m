Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CF17182D8
	for <linux-sunxi@lists.linux.dev>; Thu, 28 Sep 2023 21:56:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78B941FB;
	Thu, 28 Sep 2023 14:56:58 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 912C73F59C;
	Thu, 28 Sep 2023 14:56:18 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
	u-boot@lists.denx.de
Cc: Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Maxim Kiselev <bigunclemax@gmail.com>,
	Sam Edwards <cfsworks@gmail.com>,
	Okhunjon Sobirjonov <okhunjon72@gmail.com>,
	linux-sunxi@lists.linux.dev,
	andre.przywara@arm.com,
	andre.przywara@foss.arm.com
Subject: [PATCH v2 09/22] pinctrl: sunxi: add new D1 pinctrl support
Date: Thu, 28 Sep 2023 22:54:42 +0100
Message-Id: <20230928215455.28094-10-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.8
In-Reply-To: <20230928215455.28094-1-andre.przywara@arm.com>
References: <20230928215455.28094-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For the first time since at least the Allwinner A10 SoCs, the D1 (and
related cores) use a new pincontroller MMIO register layout, so we
cannot use our hardcoded, fixed offsets anymore.
Ideally this would all be handled by devicetree and DM drivers, but for
the DT-less SPL we still need the legacy interfaces.

Add a new Kconfig symbol to differenciate between the two generations of
pincontrollers, and just use that to just switch some basic symbols.
The rest is already abstracted enough, so works out of the box.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Sam Edwards <CFSworks@gmail.com>
Tested-by: Sam Edwards <CFSworks@gmail.com>
---
 arch/arm/mach-sunxi/Kconfig |  6 ++++++
 drivers/gpio/sunxi_gpio.c   | 17 +++++++++++++++--
 include/sunxi_gpio.h        | 10 ++++++++--
 3 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
index d3ed62add99..d73c5e67050 100644
--- a/arch/arm/mach-sunxi/Kconfig
+++ b/arch/arm/mach-sunxi/Kconfig
@@ -158,6 +158,12 @@ config SUNXI_RVBAR_ALTERNATIVE
 config SUNXI_A64_TIMER_ERRATUM
 	bool
 
+config SUNXI_NEW_PINCTRL
+	bool
+	---help---
+	The Allwinner D1 and other new SoCs use a different register map
+	for the GPIO block, which we need to know about in the SPL.
+
 # Note only one of these may be selected at a time! But hidden choices are
 # not supported by Kconfig
 config SUNXI_GEN_SUN4I
diff --git a/drivers/gpio/sunxi_gpio.c b/drivers/gpio/sunxi_gpio.c
index b52569104b7..c50996d0e12 100644
--- a/drivers/gpio/sunxi_gpio.c
+++ b/drivers/gpio/sunxi_gpio.c
@@ -40,10 +40,23 @@
 #define GPIO_DAT_REG_OFFSET	0x10
 
 #define GPIO_DRV_REG_OFFSET	0x14
-#define GPIO_DRV_INDEX(pin)	(((pin) & 0x1f) >> 4)
-#define GPIO_DRV_OFFSET(pin)	((((pin) & 0x1f) & 0xf) << 1)
+
+/*		Newer SoCs use a slightly different register layout */
+#ifdef CONFIG_SUNXI_NEW_PINCTRL
+/* pin drive strength: 4 bits per pin */
+#define GPIO_DRV_INDEX(pin)	((pin) / 8)
+#define GPIO_DRV_OFFSET(pin)	(((pin) % 8) * 4)
+
+#define GPIO_PULL_REG_OFFSET	0x24
+
+#else /* older generation pin controllers */
+/* pin drive strength: 2 bits per pin */
+#define GPIO_DRV_INDEX(pin)	((pin) / 16)
+#define GPIO_DRV_OFFSET(pin)	(((pin) % 16) * 2)
 
 #define GPIO_PULL_REG_OFFSET	0x1c
+#endif
+
 #define GPIO_PULL_INDEX(pin)	(((pin) & 0x1f) >> 4)
 #define GPIO_PULL_OFFSET(pin)	((((pin) & 0x1f) & 0xf) << 1)
 
diff --git a/include/sunxi_gpio.h b/include/sunxi_gpio.h
index c1fdf7ea1d7..30d8879dbd3 100644
--- a/include/sunxi_gpio.h
+++ b/include/sunxi_gpio.h
@@ -62,7 +62,6 @@
 #define SUN50I_H6_GPIO_POW_MOD_VAL	0x348
 
 #define SUNXI_GPIOS_PER_BANK	32
-#define SUNXI_PINCTRL_BANK_SIZE 0x24
 
 #define SUNXI_GPIO_NEXT(__gpio) \
 	((__gpio##_START) + SUNXI_GPIOS_PER_BANK)
@@ -102,7 +101,6 @@ enum sunxi_gpio_number {
 /* GPIO pin function config */
 #define SUNXI_GPIO_INPUT	0
 #define SUNXI_GPIO_OUTPUT	1
-#define SUNXI_GPIO_DISABLE	7
 
 #define SUN8I_H3_GPA_UART0	2
 #define SUN8I_H3_GPA_UART2	2
@@ -171,6 +169,14 @@ enum sunxi_gpio_number {
 
 #define SUN9I_GPN_R_RSB		3
 
+#ifdef CONFIG_SUNXI_NEW_PINCTRL
+	#define SUNXI_PINCTRL_BANK_SIZE	0x30
+	#define SUNXI_GPIO_DISABLE	0xf
+#else
+	#define SUNXI_PINCTRL_BANK_SIZE	0x24
+	#define SUNXI_GPIO_DISABLE	0x7
+#endif
+
 /* GPIO pin pull-up/down config */
 #define SUNXI_GPIO_PULL_DISABLE	0
 #define SUNXI_GPIO_PULL_UP	1
-- 
2.35.8

