Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FE1F191
	for <linux-sunxi@lists.linux.dev>; Wed, 14 Dec 2022 00:24:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE5E81691;
	Tue, 13 Dec 2022 16:25:24 -0800 (PST)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 228053F71E;
	Tue, 13 Dec 2022 16:24:43 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Samuel Holland <samuel@sholland.org>,
	Tom Rini <trini@konsulko.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 3/4] sunxi: board: annotate #endif lines
Date: Wed, 14 Dec 2022 00:22:43 +0000
Message-Id: <20221214002244.31479-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.5
In-Reply-To: <20221214002244.31479-1-andre.przywara@arm.com>
References: <20221214002244.31479-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The legacy Allwinner code is cluttered with #ifdef's, some of them even
nested, which makes the code hard to read and error prone.
Eventually we will get rid of most of them, but for now let's at least
annotate the #endif lines with the corresponding symbol the bracket
started with.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/mach-sunxi/board.c       |  8 ++++----
 arch/arm/mach-sunxi/clock_sun6i.c |  4 ++--
 board/sunxi/board.c               | 11 +++++------
 3 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/arch/arm/mach-sunxi/board.c b/arch/arm/mach-sunxi/board.c
index 86233637bfc..0c4b6dd1ca3 100644
--- a/arch/arm/mach-sunxi/board.c
+++ b/arch/arm/mach-sunxi/board.c
@@ -73,7 +73,7 @@ phys_size_t board_get_usable_ram_top(phys_size_t total_size)
 
 	return gd->ram_top;
 }
-#endif
+#endif /* CONFIG_ARM64 */
 
 #ifdef CONFIG_SPL_BUILD
 static int gpio_init(void)
@@ -196,7 +196,7 @@ static int spl_board_load_image(struct spl_image_info *spl_image,
 	return 0;
 }
 SPL_LOAD_IMAGE_METHOD("FEL", 0, BOOT_DEVICE_BOARD, spl_board_load_image);
-#endif
+#endif /* CONFIG_SPL_BUILD */
 
 #define SUNXI_INVALID_BOOT_SOURCE	-1
 
@@ -457,7 +457,7 @@ void board_init_f(ulong dummy)
 #endif
 	sunxi_board_init();
 }
-#endif
+#endif /* CONFIG_SPL_BUILD */
 
 #if !CONFIG_IS_ENABLED(SYSRESET)
 void reset_cpu(void)
@@ -490,7 +490,7 @@ void reset_cpu(void)
 	while (1) { }
 #endif
 }
-#endif
+#endif /* CONFIG_SYSRESET */
 
 #if !CONFIG_IS_ENABLED(SYS_DCACHE_OFF) && defined(CONFIG_CPU_V7A)
 void enable_caches(void)
diff --git a/arch/arm/mach-sunxi/clock_sun6i.c b/arch/arm/mach-sunxi/clock_sun6i.c
index cda6949dff0..6bd75a15f6d 100644
--- a/arch/arm/mach-sunxi/clock_sun6i.c
+++ b/arch/arm/mach-sunxi/clock_sun6i.c
@@ -63,7 +63,7 @@ void clock_init_safe(void)
 	setbits_le32(&ccm->sata_clk_cfg, CCM_SATA_CTRL_ENABLE);
 #endif
 }
-#endif
+#endif /* CONFIG_SPL_BUILD */
 
 void clock_init_sec(void)
 {
@@ -172,7 +172,7 @@ void clock_set_pll1(unsigned int clk)
 		       &ccm->cpu_axi_cfg);
 	}
 }
-#endif
+#endif /* CONFIG_SPL_BUILD */
 
 void clock_set_pll3(unsigned int clk)
 {
diff --git a/board/sunxi/board.c b/board/sunxi/board.c
index 4fe749feb39..827e545032e 100644
--- a/board/sunxi/board.c
+++ b/board/sunxi/board.c
@@ -351,7 +351,7 @@ void board_nand_init(void)
 	sunxi_nand_init();
 #endif
 }
-#endif
+#endif /* CONFIG_NAND_SUNXI */
 
 #ifdef CONFIG_MMC
 static void mmc_pinmux_setup(int sdc)
@@ -554,7 +554,7 @@ int mmc_get_env_dev(void)
 	}
 }
 #endif
-#endif
+#endif /* CONFIG_MMC */
 
 #ifdef CONFIG_SPL_BUILD
 
@@ -670,7 +670,7 @@ void sunxi_board_init(void)
 	else
 		printf("Failed to set core voltage! Can't set CPU frequency\n");
 }
-#endif
+#endif /* CONFIG_SPL_BUILD */
 
 #ifdef CONFIG_USB_GADGET
 int g_dnl_board_usb_cable_connected(void)
@@ -699,7 +699,7 @@ int g_dnl_board_usb_cable_connected(void)
 
 	return sun4i_usb_phy_vbus_detect(&phy);
 }
-#endif
+#endif /* CONFIG_USB_GADGET */
 
 #ifdef CONFIG_SERIAL_TAG
 void get_board_serial(struct tag_serialnr *serialnr)
@@ -928,7 +928,6 @@ int ft_board_setup(void *blob, struct bd_info *bd)
 }
 
 #ifdef CONFIG_SPL_LOAD_FIT
-
 static void set_spl_dt_name(const char *name)
 {
 	struct boot_file_head *spl = get_spl_header(SPL_ENV_HEADER_VERSION);
@@ -996,4 +995,4 @@ int board_fit_config_name_match(const char *name)
 
 	return ret;
 }
-#endif
+#endif /* CONFIG_SPL_LOAD_FIT */
-- 
2.35.5

