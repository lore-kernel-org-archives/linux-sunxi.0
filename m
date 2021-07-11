Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2120272
	for <linux-sunxi@lists.linux.dev>; Sun, 11 Jul 2021 22:38:55 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 70AB731B;
	Sun, 11 Jul 2021 15:38:49 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AA2233F766;
	Sun, 11 Jul 2021 15:38:46 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Icenowy Zheng <icenowy@aosc.io>,
	Aleksandr Aleksandrov <aleksandr.aleksandrov@emlid.com>,
	Sunil Mohan Adapa <sunil@medhas.org>,
	linux-sunxi@lists.linux.dev,
	Stefano Babic <sbabic@denx.de>,
	Fabio Estevam <festevam@gmail.com>,
	"NXP i . MX U-Boot Team" <uboot-imx@nxp.com>,
	Lokesh Vutla <lokeshvutla@ti.com>,
	Simon Glass <sjg@chromium.org>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	Kever Yang <kever.yang@rock-chips.com>,
	Marek Vasut <marex@denx.de>,
	Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
	Ley Foon Tan <lftan.linux@gmail.com>,
	Patrick Delaunay <patrick.delaunay@foss.st.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>
Subject: [PATCH v2 1/3] spl: mmc: extend spl_mmc_boot_mode() to take mmc argument
Date: Sun, 11 Jul 2021 23:38:10 +0100
Message-Id: <20210711223812.29886-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20210711223812.29886-1-andre.przywara@arm.com>
References: <20210711223812.29886-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Platforms can overwrite the weak definition of spl_mmc_boot_mode() to
determine where to load U-Boot proper from.
For most of them this is a trivial decision based on Kconfig variables,
but it might be desirable the probe the actual device to answer this
question.

Pass the pointer to the mmc struct to that function, so implementations
can make use of that.

Compile-tested for all users changed.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Stefano Babic <sbabic@denx.de>
Reviewed-by: Ley Foon Tan <ley.foon.tan@inte.com> (for SoCFPGA)
Acked-by: Lokesh Vutla <lokeshvutla@ti.com> (for OMAP and K3)
---
 arch/arm/mach-imx/spl.c                | 2 +-
 arch/arm/mach-k3/am6_init.c            | 2 +-
 arch/arm/mach-k3/j721e_init.c          | 2 +-
 arch/arm/mach-omap2/boot-common.c      | 2 +-
 arch/arm/mach-rockchip/spl.c           | 2 +-
 arch/arm/mach-socfpga/spl_a10.c        | 2 +-
 arch/arm/mach-socfpga/spl_gen5.c       | 2 +-
 arch/arm/mach-stm32mp/spl.c            | 2 +-
 arch/arm/mach-uniphier/mmc-boot-mode.c | 5 +----
 common/spl/spl_mmc.c                   | 4 ++--
 include/spl.h                          | 3 ++-
 11 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/arch/arm/mach-imx/spl.c b/arch/arm/mach-imx/spl.c
index 36033d611c9..797097b9c79 100644
--- a/arch/arm/mach-imx/spl.c
+++ b/arch/arm/mach-imx/spl.c
@@ -201,7 +201,7 @@ int g_dnl_get_board_bcd_device_number(int gcnum)
 
 #if defined(CONFIG_SPL_MMC_SUPPORT)
 /* called from spl_mmc to see type of boot mode for storage (RAW or FAT) */
-u32 spl_mmc_boot_mode(const u32 boot_device)
+u32 spl_mmc_boot_mode(struct mmc *mmc, const u32 boot_device)
 {
 #if defined(CONFIG_MX7) || defined(CONFIG_IMX8M) || defined(CONFIG_IMX8)
 	switch (get_boot_device()) {
diff --git a/arch/arm/mach-k3/am6_init.c b/arch/arm/mach-k3/am6_init.c
index 425b3f93c86..f4b039e8a6a 100644
--- a/arch/arm/mach-k3/am6_init.c
+++ b/arch/arm/mach-k3/am6_init.c
@@ -253,7 +253,7 @@ void board_init_f(ulong dummy)
 	spl_enable_dcache();
 }
 
-u32 spl_mmc_boot_mode(const u32 boot_device)
+u32 spl_mmc_boot_mode(struct mmc *mmc, const u32 boot_device)
 {
 #if defined(CONFIG_SUPPORT_EMMC_BOOT)
 	u32 devstat = readl(CTRLMMR_MAIN_DEVSTAT);
diff --git a/arch/arm/mach-k3/j721e_init.c b/arch/arm/mach-k3/j721e_init.c
index e9e076c9e72..fc0db2a4001 100644
--- a/arch/arm/mach-k3/j721e_init.c
+++ b/arch/arm/mach-k3/j721e_init.c
@@ -232,7 +232,7 @@ void board_init_f(ulong dummy)
 	spl_enable_dcache();
 }
 
-u32 spl_mmc_boot_mode(const u32 boot_device)
+u32 spl_mmc_boot_mode(struct mmc *mmc, const u32 boot_device)
 {
 	switch (boot_device) {
 	case BOOT_DEVICE_MMC1:
diff --git a/arch/arm/mach-omap2/boot-common.c b/arch/arm/mach-omap2/boot-common.c
index 1268a325038..f71fe65a0b1 100644
--- a/arch/arm/mach-omap2/boot-common.c
+++ b/arch/arm/mach-omap2/boot-common.c
@@ -189,7 +189,7 @@ u32 spl_boot_device(void)
 	return gd->arch.omap_boot_device;
 }
 
-u32 spl_mmc_boot_mode(const u32 boot_device)
+u32 spl_mmc_boot_mode(struct mmc *mmc, const u32 boot_device)
 {
 	return gd->arch.omap_boot_mode;
 }
diff --git a/arch/arm/mach-rockchip/spl.c b/arch/arm/mach-rockchip/spl.c
index 02c40fb37ed..082a5bfb20a 100644
--- a/arch/arm/mach-rockchip/spl.c
+++ b/arch/arm/mach-rockchip/spl.c
@@ -65,7 +65,7 @@ u32 spl_boot_device(void)
 	return boot_device;
 }
 
-u32 spl_mmc_boot_mode(const u32 boot_device)
+u32 spl_mmc_boot_mode(struct mmc *mmc, const u32 boot_device)
 {
 	return MMCSD_MODE_RAW;
 }
diff --git a/arch/arm/mach-socfpga/spl_a10.c b/arch/arm/mach-socfpga/spl_a10.c
index b5f43f09d19..c6dcd309bfc 100644
--- a/arch/arm/mach-socfpga/spl_a10.c
+++ b/arch/arm/mach-socfpga/spl_a10.c
@@ -94,7 +94,7 @@ u32 spl_boot_device(void)
 }
 
 #ifdef CONFIG_SPL_MMC_SUPPORT
-u32 spl_mmc_boot_mode(const u32 boot_device)
+u32 spl_mmc_boot_mode(struct mmc *mmc, const u32 boot_device)
 {
 #if defined(CONFIG_SPL_FS_FAT) || defined(CONFIG_SPL_FS_EXT4)
 	return MMCSD_MODE_FS;
diff --git a/arch/arm/mach-socfpga/spl_gen5.c b/arch/arm/mach-socfpga/spl_gen5.c
index 7c716117685..e5d1e64c449 100644
--- a/arch/arm/mach-socfpga/spl_gen5.c
+++ b/arch/arm/mach-socfpga/spl_gen5.c
@@ -53,7 +53,7 @@ u32 spl_boot_device(void)
 }
 
 #ifdef CONFIG_SPL_MMC_SUPPORT
-u32 spl_mmc_boot_mode(const u32 boot_device)
+u32 spl_mmc_boot_mode(struct mmc *mmc, const u32 boot_device)
 {
 #if defined(CONFIG_SPL_FS_FAT) || defined(CONFIG_SPL_FS_EXT4)
 	return MMCSD_MODE_FS;
diff --git a/arch/arm/mach-stm32mp/spl.c b/arch/arm/mach-stm32mp/spl.c
index b53659a698a..4c8085b8305 100644
--- a/arch/arm/mach-stm32mp/spl.c
+++ b/arch/arm/mach-stm32mp/spl.c
@@ -53,7 +53,7 @@ u32 spl_boot_device(void)
 	return BOOT_DEVICE_MMC1;
 }
 
-u32 spl_mmc_boot_mode(const u32 boot_device)
+u32 spl_mmc_boot_mode(struct mmc *mmc, const u32 boot_device)
 {
 	return MMCSD_MODE_RAW;
 }
diff --git a/arch/arm/mach-uniphier/mmc-boot-mode.c b/arch/arm/mach-uniphier/mmc-boot-mode.c
index e47e5df6480..09cad743c55 100644
--- a/arch/arm/mach-uniphier/mmc-boot-mode.c
+++ b/arch/arm/mach-uniphier/mmc-boot-mode.c
@@ -7,10 +7,8 @@
 #include <mmc.h>
 #include <spl.h>
 
-u32 spl_mmc_boot_mode(const u32 boot_device)
+u32 spl_mmc_boot_mode(struct mmc *mmc, const u32 boot_device)
 {
-	struct mmc *mmc;
-
 	/*
 	 * work around a bug in the Boot ROM of LD4, Pro4, and sLD8:
 	 *
@@ -24,7 +22,6 @@ u32 spl_mmc_boot_mode(const u32 boot_device)
 	 * Fixup mmc->part_config here because it is used to determine the
 	 * partition which the U-Boot image is read from.
 	 */
-	mmc = find_mmc_device(0);
 	mmc->part_config &= ~EXT_CSD_BOOT_PART_NUM(PART_ACCESS_MASK);
 	mmc->part_config |= EXT_CSD_BOOT_PARTITION_ENABLE;
 
diff --git a/common/spl/spl_mmc.c b/common/spl/spl_mmc.c
index add2785b4e3..309abaf961a 100644
--- a/common/spl/spl_mmc.c
+++ b/common/spl/spl_mmc.c
@@ -300,7 +300,7 @@ static int spl_mmc_do_fs_boot(struct spl_image_info *spl_image, struct mmc *mmc,
 }
 #endif
 
-u32 __weak spl_mmc_boot_mode(const u32 boot_device)
+u32 __weak spl_mmc_boot_mode(struct mmc *mmc, const u32 boot_device)
 {
 #if defined(CONFIG_SPL_FS_FAT) || defined(CONFIG_SPL_FS_EXT4)
 	return MMCSD_MODE_FS;
@@ -351,7 +351,7 @@ int spl_mmc_load(struct spl_image_info *spl_image,
 		}
 	}
 
-	boot_mode = spl_mmc_boot_mode(bootdev->boot_device);
+	boot_mode = spl_mmc_boot_mode(mmc, bootdev->boot_device);
 	err = -EINVAL;
 	switch (boot_mode) {
 	case MMCSD_MODE_EMMCBOOT:
diff --git a/include/spl.h b/include/spl.h
index cee9a42ddb5..c8f470dd5f2 100644
--- a/include/spl.h
+++ b/include/spl.h
@@ -14,6 +14,7 @@
 #include <asm/global_data.h>
 #include <asm/spl.h>
 #include <handoff.h>
+#include <mmc.h>
 
 struct blk_desc;
 struct image_header;
@@ -343,7 +344,7 @@ u32 spl_boot_device(void);
  * Note:  It is important to use the boot_device parameter instead of e.g.
  * spl_boot_device() as U-Boot is not always loaded from the same device as SPL.
  */
-u32 spl_mmc_boot_mode(const u32 boot_device);
+u32 spl_mmc_boot_mode(struct mmc *mmc, const u32 boot_device);
 
 /**
  * spl_mmc_boot_partition() - MMC partition to load U-Boot from.
-- 
2.17.5

