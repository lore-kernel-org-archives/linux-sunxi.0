Received: from smtpbg604.qq.com (smtpbg604.qq.com [59.36.128.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C537173
	for <linux-sunxi@lists.linux.dev>; Thu, 22 Jul 2021 06:31:56 +0000 (UTC)
X-QQ-mid: bizesmtp46t1626935439txkev71m
Received: from localhost.localdomain (unknown [14.154.30.9])
	by esmtp6.qq.com (ESMTP) with 
	id ; Thu, 22 Jul 2021 14:30:37 +0800 (CST)
X-QQ-SSF: 01100000002000104000B00A0000000
X-QQ-FEAT: g9nl15ZGxlgX1pMUlq7iTlvaV/rxVsnruemfKmbPF0GDbtW/F647MgVaw5TcR
	5ski0F7IoiuCqa3MUTr2G8YHncCm0qrmK/4mBfO5yRR4TC6vFUAD0V3aKpVH+OoSr9XPcxN
	l9Aed408CHTl+b5deWE99sur1NP/yQMjZ2pxQay9QyfBL3X7GG7BqvTAchfCdIj9cqcq/DO
	TTqkGZXxOEd/3UbVrOPGlpUZO6FelPQSuBWdK20DxiWP+QceBZ9LS+ScooBWGVQUvqrxuVz
	uriFJBWxlxJGhC/olS4f4tgiVmKWRIP2OXbNUfWgVRI0NEPIJupAlixLT36QKhLoVwOFVi7
	9IlvrKGsqDCU98wVW8j2W5BqXnCCw==
X-QQ-GoodBg: 0
From: Icenowy Zheng <icenowy@sipeed.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Jernej Skrabec <jernej.skrabec@siol.net>,
	Samuel Holland <samuel@sholland.org>
Cc: u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Icenowy Zheng <icenowy@sipeed.com>
Subject: [RFC PATCH 06/13] sunxi: add support for basical pinmux setup on R329
Date: Thu, 22 Jul 2021 14:30:08 +0800
Message-Id: <20210722063015.421923-7-icenowy@sipeed.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210722063015.421923-1-icenowy@sipeed.com>
References: <20210722063015.421923-1-icenowy@sipeed.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:sipeed.com:qybgspam:qybgspam4

Allwinner R329 SoC is the first known Allwinner SoC that has two
possible pinmux setups for MMC0 controller.

Support configuration of both setups of MMC0 and UART0 at PB4/5.

Signed-off-by: Icenowy Zheng <icenowy@sipeed.com>
---
 arch/arm/include/asm/arch-sunxi/gpio.h |  3 +++
 arch/arm/mach-sunxi/Kconfig            |  7 +++++++
 arch/arm/mach-sunxi/board.c            |  4 ++++
 board/sunxi/board.c                    | 20 ++++++++++++++++++++
 4 files changed, 34 insertions(+)

diff --git a/arch/arm/include/asm/arch-sunxi/gpio.h b/arch/arm/include/asm/arch-sunxi/gpio.h
index 2969a530ae..da9acfab78 100644
--- a/arch/arm/include/asm/arch-sunxi/gpio.h
+++ b/arch/arm/include/asm/arch-sunxi/gpio.h
@@ -166,12 +166,14 @@ enum sunxi_gpio_number {
 #define SUN8I_A83T_GPB_UART0	2
 #define SUN8I_V3S_GPB_UART0	3
 #define SUN50I_GPB_UART0	4
+#define SUN50I_R329_GPB_UART0	2
 
 #define SUNXI_GPC_NAND		2
 #define SUNXI_GPC_SPI0		3
 #define SUNXI_GPC_SDC2		3
 #define SUN6I_GPC_SDC3		4
 #define SUN50I_GPC_SPI0		4
+#define SUN50I_R329_GPC_SDC0	3
 
 #define SUN8I_GPD_SDC1		3
 #define SUNXI_GPD_LCD0		2
@@ -185,6 +187,7 @@ enum sunxi_gpio_number {
 #define SUNXI_GPF_SDC0		2
 #define SUNXI_GPF_UART0		4
 #define SUN8I_GPF_UART0		3
+#define SUN50I_R329_GPF_SDC0	5
 
 #define SUN4I_GPG_SDC1		4
 #define SUN5I_GPG_SDC1		2
diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
index 49f94f095c..391a3dd9e5 100644
--- a/arch/arm/mach-sunxi/Kconfig
+++ b/arch/arm/mach-sunxi/Kconfig
@@ -672,6 +672,13 @@ config MMC3_CD_PIN
 	---help---
 	See MMC0_CD_PIN help text.
 
+config MMC0_PINS
+	string "Pins for mmc0"
+	default "PF"
+	depends on MACH_SUN50I_R329
+	---help---
+	See MMC1_PINS help text.
+
 config MMC1_PINS
 	string "Pins for mmc1"
 	default ""
diff --git a/arch/arm/mach-sunxi/board.c b/arch/arm/mach-sunxi/board.c
index e979e426dd..1aa31c7e05 100644
--- a/arch/arm/mach-sunxi/board.c
+++ b/arch/arm/mach-sunxi/board.c
@@ -129,6 +129,10 @@ static int gpio_init(void)
 	sunxi_gpio_set_cfgpin(SUNXI_GPH(0), SUN50I_H616_GPH_UART0);
 	sunxi_gpio_set_cfgpin(SUNXI_GPH(1), SUN50I_H616_GPH_UART0);
 	sunxi_gpio_set_pull(SUNXI_GPH(1), SUNXI_GPIO_PULL_UP);
+#elif CONFIG_CONS_INDEX == 1 && defined(CONFIG_MACH_SUN50I_R329)
+	sunxi_gpio_set_cfgpin(SUNXI_GPB(4), SUN50I_R329_GPB_UART0);
+	sunxi_gpio_set_cfgpin(SUNXI_GPB(5), SUN50I_R329_GPB_UART0);
+	sunxi_gpio_set_pull(SUNXI_GPB(5), SUNXI_GPIO_PULL_UP);
 #elif CONFIG_CONS_INDEX == 1 && defined(CONFIG_MACH_SUN8I_A83T)
 	sunxi_gpio_set_cfgpin(SUNXI_GPB(9), SUN8I_A83T_GPB_UART0);
 	sunxi_gpio_set_cfgpin(SUNXI_GPB(10), SUN8I_A83T_GPB_UART0);
diff --git a/board/sunxi/board.c b/board/sunxi/board.c
index 67acc01d83..bfc90345d9 100644
--- a/board/sunxi/board.c
+++ b/board/sunxi/board.c
@@ -417,12 +417,32 @@ static void mmc_pinmux_setup(int sdc)
 
 	switch (sdc) {
 	case 0:
+#if defined(CONFIG_MACH_SUN50I_R329)
+		pins = sunxi_name_to_gpio_bank(CONFIG_MMC0_PINS);
+
+		if (pins == SUNXI_GPIO_C) {
+			/* SDC0: PC0-PC6 */
+			for (pin = SUNXI_GPC(0); pin <= SUNXI_GPC(6); pin++) {
+				sunxi_gpio_set_cfgpin(pin, SUN50I_R329_GPC_SDC0);
+				sunxi_gpio_set_pull(pin, SUNXI_GPIO_PULL_UP);
+				sunxi_gpio_set_drv(pin, 2);
+			}
+		} else {
+			/* SDC0: PF0-PF5 */
+			for (pin = SUNXI_GPF(0); pin <= SUNXI_GPF(5); pin++) {
+				sunxi_gpio_set_cfgpin(pin, SUN50I_R329_GPF_SDC0);
+				sunxi_gpio_set_pull(pin, SUNXI_GPIO_PULL_UP);
+				sunxi_gpio_set_drv(pin, 2);
+			}
+		}
+#else
 		/* SDC0: PF0-PF5 */
 		for (pin = SUNXI_GPF(0); pin <= SUNXI_GPF(5); pin++) {
 			sunxi_gpio_set_cfgpin(pin, SUNXI_GPF_SDC0);
 			sunxi_gpio_set_pull(pin, SUNXI_GPIO_PULL_UP);
 			sunxi_gpio_set_drv(pin, 2);
 		}
+#endif
 		break;
 
 	case 1:
-- 
2.30.2

