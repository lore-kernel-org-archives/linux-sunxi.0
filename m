Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C013F72
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Apr 2021 12:15:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C5ECB31B;
	Mon, 26 Apr 2021 05:15:18 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 87C6B3F70D;
	Mon, 26 Apr 2021 05:15:17 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
	Samuel Holland <samuel@sholland.org>,
	Icenowy Zheng <icenowy@aosc.io>,
	u-boot@lists.denx.de,
	linux-sunxi@googlegroups.com,
	linux-sunxi@lists.linux.dev
Subject: [PATCH] sunxi: board: Add H616 MMC2 pins
Date: Mon, 26 Apr 2021 13:14:46 +0100
Message-Id: <20210426121446.8013-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

We hardcode the pinctrl setting for the MMC controllers in boards.c,
since we need them also in the SPL, where there is no DT yet.

Add the respective setting for the H616 SoC, to enable eMMC on boards
with this SoC as well.
Also to make diagnosing this problem easier, print a warning if a board
tries to setup MMC2 pins without a respective SoC setting being defined.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 board/sunxi/board.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/board/sunxi/board.c b/board/sunxi/board.c
index b97ca578f7f..f825dfd7ce8 100644
--- a/board/sunxi/board.c
+++ b/board/sunxi/board.c
@@ -555,6 +555,17 @@ static void mmc_pinmux_setup(int sdc)
 			sunxi_gpio_set_pull(pin, SUNXI_GPIO_PULL_UP);
 			sunxi_gpio_set_drv(pin, 2);
 		}
+#elif defined(CONFIG_MACH_SUN50I_H616)
+		/* SDC2: PC0-PC1, PC5-PC6, PC8-PC11, PC13-PC16 */
+		for (pin = SUNXI_GPC(0); pin <= SUNXI_GPC(16); pin++) {
+			if (pin > SUNXI_GPC(1) && pin < SUNXI_GPC(5))
+				continue;
+			if (pin == SUNXI_GPC(7) || pin == SUNXI_GPC(12))
+				continue;
+			sunxi_gpio_set_cfgpin(pin, SUNXI_GPC_SDC2);
+			sunxi_gpio_set_pull(pin, SUNXI_GPIO_PULL_UP);
+			sunxi_gpio_set_drv(pin, 2);
+		}
 #elif defined(CONFIG_MACH_SUN9I)
 		/* SDC2: PC6-PC16 */
 		for (pin = SUNXI_GPC(6); pin <= SUNXI_GPC(16); pin++) {
@@ -562,6 +573,8 @@ static void mmc_pinmux_setup(int sdc)
 			sunxi_gpio_set_pull(pin, SUNXI_GPIO_PULL_UP);
 			sunxi_gpio_set_drv(pin, 2);
 		}
+#else
+		puts("ERROR: No pinmux setup defined for MMC2!\n");
 #endif
 		break;
 
-- 
2.17.5

