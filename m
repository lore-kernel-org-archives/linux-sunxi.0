Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B2D262A
	for <linux-sunxi@lists.linux.dev>; Fri,  6 May 2022 00:37:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A9E41063;
	Thu,  5 May 2022 17:37:18 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6489A3FA31;
	Thu,  5 May 2022 17:37:17 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH] sunxi: board: Fix UART PortF pinmux setup
Date: Fri,  6 May 2022 01:37:03 +0100
Message-Id: <20220506003703.13287-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.3
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When CONFIG_UART0_PORT_F is defined, we try to configure two PortF pins
(usually used for the SD card) as UART0. Some SoCs use the mux value of
3 for this, while others use 4.

The combination of Kconfig symbols we currently use was not quite right:
we mis-configure the A31, A64, H6 and H616.

Going through the list in the pinctrl driver, there are only a few older
SoCs that use a value of 4, so revert the #ifdef clause, and name those
explicitly, instead of the other way around.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/mach-sunxi/board.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-sunxi/board.c b/arch/arm/mach-sunxi/board.c
index 173e946465d..8f7c894286d 100644
--- a/arch/arm/mach-sunxi/board.c
+++ b/arch/arm/mach-sunxi/board.c
@@ -87,15 +87,16 @@ static int gpio_init(void)
 	sunxi_gpio_set_cfgpin(SUNXI_GPB(22), SUNXI_GPIO_INPUT);
 	sunxi_gpio_set_cfgpin(SUNXI_GPB(23), SUNXI_GPIO_INPUT);
 #endif
-#if (defined(CONFIG_MACH_SUN8I) && !defined(CONFIG_MACH_SUN8I_R40)) || \
-    defined(CONFIG_MACH_SUNIV)
-	sunxi_gpio_set_cfgpin(SUNXI_GPF(2), SUN8I_GPF_UART0);
-	sunxi_gpio_set_cfgpin(SUNXI_GPF(4), SUN8I_GPF_UART0);
-#else
+#if defined(CONFIG_MACH_SUN4I) || defined(CONFIG_MACH_SUN5I) || \
+    defined(CONFIG_MACH_SUN7I) || defined(CONFIG_MACH_SUN8I_R40) || \
+    defined(CONFIG_MACH_SUN9I)
 	sunxi_gpio_set_cfgpin(SUNXI_GPF(2), SUNXI_GPF_UART0);
 	sunxi_gpio_set_cfgpin(SUNXI_GPF(4), SUNXI_GPF_UART0);
+#else
+	sunxi_gpio_set_cfgpin(SUNXI_GPF(2), SUN8I_GPF_UART0);
+	sunxi_gpio_set_cfgpin(SUNXI_GPF(4), SUN8I_GPF_UART0);
 #endif
-	sunxi_gpio_set_pull(SUNXI_GPF(4), 1);
+	sunxi_gpio_set_pull(SUNXI_GPF(4), SUNXI_GPIO_PULL_UP);
 #elif CONFIG_CONS_INDEX == 1 && defined(CONFIG_MACH_SUNIV)
 	sunxi_gpio_set_cfgpin(SUNXI_GPE(0), SUNIV_GPE_UART0);
 	sunxi_gpio_set_cfgpin(SUNXI_GPE(1), SUNIV_GPE_UART0);
-- 
2.35.3

