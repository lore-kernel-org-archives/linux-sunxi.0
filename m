Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2A63168CE
	for <linux-sunxi@lists.linux.dev>; Thu, 28 Sep 2023 21:56:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8161F1007;
	Thu, 28 Sep 2023 14:57:14 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A0D03F59C;
	Thu, 28 Sep 2023 14:56:34 -0700 (PDT)
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
Subject: [PATCH v2 18/22] sunxi: R528: add SMHC2 pin pull ups support
Date: Thu, 28 Sep 2023 22:54:51 +0100
Message-Id: <20230928215455.28094-19-andre.przywara@arm.com>
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

From: Okhunjon Sobirjonov <okhunjon72@gmail.com>

Add support for eMMC (SMHC2) pin pull ups for R528 boards.

The D1 and T113s (and even R329) SoCs do not support 8-bit eMMC anymore,
so it's just four data pins to cover here.

Signed-off-by: Okhunjon Sobirjonov <Okhunjon.Sobirjonov@Mec-electronics.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
[Andre: adjust commit message]
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 board/sunxi/board.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/board/sunxi/board.c b/board/sunxi/board.c
index 7a1c708b9f2..39ecbe988f7 100644
--- a/board/sunxi/board.c
+++ b/board/sunxi/board.c
@@ -459,6 +459,13 @@ static void mmc_pinmux_setup(int sdc)
 			sunxi_gpio_set_pull(pin, SUNXI_GPIO_PULL_UP);
 			sunxi_gpio_set_drv(pin, 2);
 		}
+#elif defined(CONFIG_MACH_SUN8I_R528)
+                /* SDC2: PC2-PC7 */
+                for (pin = SUNXI_GPC(2); pin <= SUNXI_GPC(7); pin++) {
+                        sunxi_gpio_set_cfgpin(pin, SUNXI_GPC_SDC2);
+                        sunxi_gpio_set_pull(pin, SUNXI_GPIO_PULL_UP);
+                        sunxi_gpio_set_drv(pin, 2);
+                }
 #else
 		puts("ERROR: No pinmux setup defined for MMC2!\n");
 #endif
-- 
2.35.8

