Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9667713AE8
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Oct 2023 13:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 75C332F4;
	Mon, 23 Oct 2023 06:26:00 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.manchester.arm.com [10.32.101.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 198D83F762;
	Mon, 23 Oct 2023 06:25:17 -0700 (PDT)
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
Subject: [PATCH v3 11/24] pinctrl: sunxi: add Allwinner D1 pinctrl description
Date: Mon, 23 Oct 2023 14:24:36 +0100
Message-Id: <20231023132449.813863-12-andre.przywara@arm.com>
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

Apart from using the new pinctrl MMIO register layout, the Allwinner D1
and related SoCs still need to usual set of mux values hardcoded in
U-Boot's pinctrl driver.
Add the values we need so far to this list, so that DM based drivers
will just work without further ado.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/pinctrl/sunxi/Kconfig         |  4 ++++
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 32 +++++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/drivers/pinctrl/sunxi/Kconfig b/drivers/pinctrl/sunxi/Kconfig
index 77da90836b6..c8f937d91e9 100644
--- a/drivers/pinctrl/sunxi/Kconfig
+++ b/drivers/pinctrl/sunxi/Kconfig
@@ -124,4 +124,8 @@ config PINCTRL_SUN50I_H616_R
 	default MACH_SUN50I_H616
 	select PINCTRL_SUNXI
 
+config PINCTRL_SUN20I_D1
+	bool "Support for the Allwinner D1/R528 PIO"
+	select PINCTRL_SUNXI
+
 endif
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index fc80fe50b14..bdf6360f176 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -598,6 +598,32 @@ static const struct sunxi_pinctrl_desc __maybe_unused sun9i_a80_r_pinctrl_desc =
 	.num_banks	= 3,
 };
 
+static const struct sunxi_pinctrl_function sun20i_d1_pinctrl_functions[] = {
+	{ "emac",	8 },	/* PE0-PE15 */
+	{ "gpio_in",	0 },
+	{ "gpio_out",	1 },
+	{ "i2c0",	4 },	/* PB10-PB11 */
+	{ "mmc0",	2 },	/* PF0-PF5 */
+	{ "mmc1",	2 },	/* PG0-PG5 */
+	{ "mmc2",	3 },	/* PC2-PC7 */
+	{ "spi0",	2 },	/* PC2-PC7 */
+#if IS_ENABLED(CONFIG_UART0_PORT_F)
+	{ "uart0",	3 },	/* PF2,PF4 */
+#else
+	{ "uart0",	6 },	/* PB0-PB1, PB8-PB9, PE2-PE3 */
+#endif
+	{ "uart1",	2 },	/* PG6-PG7 */
+	{ "uart2",	7 },	/* PB0-PB1 */
+	{ "uart3",	7 },	/* PB6-PB7 */
+};
+
+static const struct sunxi_pinctrl_desc __maybe_unused sun20i_d1_pinctrl_desc = {
+	.functions	= sun20i_d1_pinctrl_functions,
+	.num_functions	= ARRAY_SIZE(sun20i_d1_pinctrl_functions),
+	.first_bank	= SUNXI_GPIO_A,
+	.num_banks	= 7,
+};
+
 static const struct sunxi_pinctrl_function sun50i_a64_pinctrl_functions[] = {
 	{ "emac",	4 },	/* PD8-PD23 */
 	{ "gpio_in",	0 },
@@ -863,6 +889,12 @@ static const struct udevice_id sunxi_pinctrl_ids[] = {
 		.data = (ulong)&sun9i_a80_r_pinctrl_desc,
 	},
 #endif
+#ifdef CONFIG_PINCTRL_SUN20I_D1
+	{
+		.compatible = "allwinner,sun20i-d1-pinctrl",
+		.data = (ulong)&sun20i_d1_pinctrl_desc,
+	},
+#endif
 #ifdef CONFIG_PINCTRL_SUN50I_A64
 	{
 		.compatible = "allwinner,sun50i-a64-pinctrl",
-- 
2.25.1

