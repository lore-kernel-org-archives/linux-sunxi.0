Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A4C93FDD
	for <linux-sunxi@lists.linux.dev>; Tue,  1 Feb 2022 01:41:44 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F1D0D11FB;
	Mon, 31 Jan 2022 17:41:37 -0800 (PST)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3FD153F73B;
	Mon, 31 Jan 2022 17:41:36 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
	Tom Rini <trini@konsulko.com>,
	Simon Glass <sjg@chromium.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Icenowy Zheng <icenowy@aosc.io>,
	Jesse Taube <mr.bossman075@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 1/5] sunxi: move non-essential code out of s_init()
Date: Tue,  1 Feb 2022 01:41:12 +0000
Message-Id: <20220201014116.25864-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20220201014116.25864-1-andre.przywara@arm.com>
References: <20220201014116.25864-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

So far all Allwinner based boards were doing some not-so-lowlevel-setup
in lowlevel's s_init() routine.
This includes the initial clock, timer and pinmux setup, among other
things. This is clearly out of the "absolute bare minimum to get started"
scope that lowlevel_init.S suggests for this function.

Since we have an SPL, which is called right after s_init(), move those
calls to our board_init_f() function. As we overwrite this only for
the SPL, this has the added benefit of not doing this setup *again*
shortly afterwards, when running U-Boot proper.

This makes gpio_init() to be called from the SPL only, so pull this code
into a CONFIG_SPL_BUILD protected part to avoid build warnings.

Reviewed-by: Samuel Holland <samuel@sholland.org>
Reviewed-by: Simon Glass <sjg@chromium.org>
Tested-by: Simon Glass <sjg@chromium.org>
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/mach-sunxi/board.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/arch/arm/mach-sunxi/board.c b/arch/arm/mach-sunxi/board.c
index 3ef179742c5..c932a293317 100644
--- a/arch/arm/mach-sunxi/board.c
+++ b/arch/arm/mach-sunxi/board.c
@@ -75,6 +75,7 @@ ulong board_get_usable_ram_top(ulong total_size)
 }
 #endif
 
+#ifdef CONFIG_SPL_BUILD
 static int gpio_init(void)
 {
 	__maybe_unused uint val;
@@ -172,7 +173,6 @@ static int gpio_init(void)
 	return 0;
 }
 
-#if defined(CONFIG_SPL_BOARD_LOAD_IMAGE) && defined(CONFIG_SPL_BUILD)
 static int spl_board_load_image(struct spl_image_info *spl_image,
 				struct spl_boot_device *bootdev)
 {
@@ -227,18 +227,6 @@ void s_init(void)
 		"mcr p15, 0, r0, c1, c0, 1\n"
 		::: "r0");
 #endif
-#if defined CONFIG_MACH_SUN6I || defined CONFIG_MACH_SUN8I_H3
-	/* Enable non-secure access to some peripherals */
-	tzpc_init();
-#endif
-
-	clock_init();
-	timer_init();
-	gpio_init();
-#if !CONFIG_IS_ENABLED(DM_I2C)
-	i2c_init_board();
-#endif
-	eth_init_board();
 }
 
 #define SUNXI_INVALID_BOOT_SOURCE	-1
@@ -335,11 +323,22 @@ u32 spl_boot_device(void)
 
 void board_init_f(ulong dummy)
 {
+#if defined CONFIG_MACH_SUN6I || defined CONFIG_MACH_SUN8I_H3
+	/* Enable non-secure access to some peripherals */
+	tzpc_init();
+#endif
+
+	clock_init();
+	timer_init();
+	gpio_init();
+	eth_init_board();
+
 	spl_init();
 	preloader_console_init();
 
 #if CONFIG_IS_ENABLED(I2C) && CONFIG_IS_ENABLED(SYS_I2C_LEGACY)
 	/* Needed early by sunxi_board_init if PMU is enabled */
+	i2c_init_board();
 	i2c_init(CONFIG_SYS_I2C_SPEED, CONFIG_SYS_I2C_SLAVE);
 #endif
 	sunxi_board_init();
-- 
2.17.6

