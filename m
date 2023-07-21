Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8CDD1DDF9
	for <linux-sunxi@lists.linux.dev>; Fri, 21 Jul 2023 13:47:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0BFD3D75;
	Fri, 21 Jul 2023 06:47:57 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4A8193F6C4;
	Fri, 21 Jul 2023 06:47:12 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
	u-boot@lists.denx.de
Cc: Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Maxim Kiselev <bigunclemax@gmail.com>,
	Sam Edwards <cfsworks@gmail.com>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 09/20] pinctrl: sunxi: add Allwinner D1 pinctrl description
Date: Fri, 21 Jul 2023 14:45:55 +0100
Message-Id: <20230721134606.4505-10-andre.przywara@arm.com>
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

Apart from using the new pinctrl MMIO register layout, the Allwinner D1
and related SoCs still need to usual set of mux values hardcoded in
U-Boot's pinctrl driver.
Add the values we need so far to this list, so that DM based drivers
will just work without further ado.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/pinctrl/sunxi/Kconfig         |  4 ++++
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 28 +++++++++++++++++++++++++++
 2 files changed, 32 insertions(+)

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
index fc80fe50b14..c6115112688 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -748,6 +748,28 @@ static const struct sunxi_pinctrl_desc __maybe_unused sun50i_h616_r_pinctrl_desc
 	.num_banks	= 1,
 };
 
+static const struct sunxi_pinctrl_function sun20i_d1_pinctrl_functions[] = {
+	{ "emac",	8 },	/* PE0-PE15 */
+	{ "gpio_in",	0 },
+	{ "gpio_out",	1 },
+	{ "mmc0",	2 },	/* PF0-PF5 */
+	{ "mmc2",	3 },	/* PC1-PC7 */
+	{ "spi0",	2 },	/* PC2-PC7 */
+#if IS_ENABLED(CONFIG_UART0_PORT_F)
+	{ "uart0",	3 },	/* PF2-PF4 */
+#else
+	{ "uart0",	6 },	/* PB2-PB3 */
+#endif
+	{ "uart3",	7 },	/* PB6-PB9 */
+};
+
+static const struct sunxi_pinctrl_desc __maybe_unused sun20i_d1_pinctrl_desc = {
+	.functions	= sun20i_d1_pinctrl_functions,
+	.num_functions	= ARRAY_SIZE(sun20i_d1_pinctrl_functions),
+	.first_bank	= SUNXI_GPIO_A,
+	.num_banks	= 7,
+};
+
 static const struct udevice_id sunxi_pinctrl_ids[] = {
 #ifdef CONFIG_PINCTRL_SUNIV_F1C100S
 	{
@@ -904,6 +926,12 @@ static const struct udevice_id sunxi_pinctrl_ids[] = {
 		.compatible = "allwinner,sun50i-h616-r-pinctrl",
 		.data = (ulong)&sun50i_h616_r_pinctrl_desc,
 	},
+#endif
+#ifdef CONFIG_PINCTRL_SUN20I_D1
+	{
+		.compatible = "allwinner,sun20i-d1-pinctrl",
+		.data = (ulong)&sun20i_d1_pinctrl_desc,
+	},
 #endif
 	{}
 };
-- 
2.35.8

