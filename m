Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B66918E3F
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Oct 2023 13:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 608132F4;
	Mon, 23 Oct 2023 06:26:19 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.manchester.arm.com [10.32.101.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 04F1D3F762;
	Mon, 23 Oct 2023 06:25:36 -0700 (PDT)
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
Subject: [PATCH v3 23/24] sunxi: psci: implement PSCI on R528
Date: Mon, 23 Oct 2023 14:24:48 +0100
Message-Id: <20231023132449.813863-24-andre.przywara@arm.com>
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

From: Sam Edwards <cfsworks@gmail.com>

This patch adds the necessary code to make nonsec booting and PSCI
secondary core management functional on the R528/T113.

Signed-off-by: Sam Edwards <CFSworks@gmail.com>
Tested-by: Maksim Kiselev <bigunclemax@gmail.com>
Tested-by: Kevin Amadiva <kevin.amadiva@mec.at>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/cpu/armv7/Kconfig      |  3 +-
 arch/arm/cpu/armv7/sunxi/psci.c | 52 ++++++++++++++++++++++++++++++++-
 arch/arm/mach-sunxi/Kconfig     |  4 +++
 3 files changed, 57 insertions(+), 2 deletions(-)

diff --git a/arch/arm/cpu/armv7/Kconfig b/arch/arm/cpu/armv7/Kconfig
index f015d133cb0..4eb34b7b449 100644
--- a/arch/arm/cpu/armv7/Kconfig
+++ b/arch/arm/cpu/armv7/Kconfig
@@ -61,8 +61,9 @@ config ARMV7_SECURE_MAX_SIZE
 config ARM_GIC_BASE_ADDRESS
 	hex
 	depends on ARMV7_NONSEC
-	depends on ARCH_EXYNOS5
+	depends on ARCH_EXYNOS5 || MACH_SUN8I_R528
 	default 0x10480000 if ARCH_EXYNOS5
+	default 0x03020000 if MACH_SUN8I_R528
 	help
 	  Override the GIC base address if the Arm Cortex defined
 	  CBAR/PERIPHBASE system register holds the wrong value.
diff --git a/arch/arm/cpu/armv7/sunxi/psci.c b/arch/arm/cpu/armv7/sunxi/psci.c
index 207aa6bc4bf..5cb8cfa6cf3 100644
--- a/arch/arm/cpu/armv7/sunxi/psci.c
+++ b/arch/arm/cpu/armv7/sunxi/psci.c
@@ -47,6 +47,24 @@
 #define SUN8I_R40_PWR_CLAMP(cpu)		(0x120 + (cpu) * 0x4)
 #define SUN8I_R40_SRAMC_SOFT_ENTRY_REG0		(0xbc)
 
+/*
+ * R528 is also different, as it has both cores powered up (but held in reset
+ * state) after the SoC is reset. Like the R40, it uses a "soft" entry point
+ * address register, but unlike the R40, it uses a newer "CPUX" block to manage
+ * CPU state, rather than the older CPUCFG system.
+ */
+#define SUN8I_R528_SOFT_ENTRY			(0x1c8)
+#define SUN8I_R528_C0_RST_CTRL			(0x0000)
+#define SUN8I_R528_C0_CTRL_REG0			(0x0010)
+#define SUN8I_R528_C0_CPU_STATUS		(0x0080)
+
+#define SUN8I_R528_C0_STATUS_STANDBYWFI		(16)
+
+/* Only newer cores have this additional IP block. */
+#ifndef SUNXI_R_CPUCFG_BASE
+#define SUNXI_R_CPUCFG_BASE			0
+#endif
+
 static void __secure cp15_write_cntp_tval(u32 tval)
 {
 	asm volatile ("mcr p15, 0, %0, c14, c2, 0" : : "r" (tval));
@@ -103,10 +121,12 @@ static void __secure clamp_set(u32 *clamp)
 
 static void __secure sunxi_cpu_set_entry(int __always_unused cpu, void *entry)
 {
-	/* secondary core entry address is programmed differently on R40 */
 	if (IS_ENABLED(CONFIG_MACH_SUN8I_R40)) {
 		writel((u32)entry,
 		       SUNXI_SRAMC_BASE + SUN8I_R40_SRAMC_SOFT_ENTRY_REG0);
+	} else if (IS_ENABLED(CONFIG_MACH_SUN8I_R528)) {
+		writel((u32)entry,
+		       SUNXI_R_CPUCFG_BASE + SUN8I_R528_SOFT_ENTRY);
 	} else {
 		writel((u32)entry, SUNXI_CPUCFG_BASE + SUNXI_PRIV0);
 	}
@@ -125,6 +145,9 @@ static void __secure sunxi_cpu_set_power(int cpu, bool on)
 	} else if (IS_ENABLED(CONFIG_MACH_SUN8I_R40)) {
 		clamp = (void *)SUNXI_CPUCFG_BASE + SUN8I_R40_PWR_CLAMP(cpu);
 		pwroff = (void *)SUNXI_CPUCFG_BASE + SUN8I_R40_PWROFF;
+	} else if (IS_ENABLED(CONFIG_MACH_SUN8I_R528)) {
+		/* R528 leaves both cores powered up, manages them via reset */
+		return;
 	} else {
 		if (IS_ENABLED(CONFIG_MACH_SUN6I) ||
 		    IS_ENABLED(CONFIG_MACH_SUN8I_H3))
@@ -152,11 +175,27 @@ static void __secure sunxi_cpu_set_power(int cpu, bool on)
 
 static void __secure sunxi_cpu_set_reset(int cpu, bool reset)
 {
+	if (IS_ENABLED(CONFIG_MACH_SUN8I_R528)) {
+		if (reset)
+			clrbits_le32(SUNXI_CPUCFG_BASE + SUN8I_R528_C0_RST_CTRL,
+				     BIT(cpu));
+		else
+			setbits_le32(SUNXI_CPUCFG_BASE + SUN8I_R528_C0_RST_CTRL,
+				     BIT(cpu));
+
+		return;
+	}
+
 	writel(reset ? 0b00 : 0b11, SUNXI_CPUCFG_BASE + SUNXI_CPU_RST(cpu));
 }
 
 static void __secure sunxi_cpu_set_locking(int cpu, bool lock)
 {
+	if (IS_ENABLED(CONFIG_MACH_SUN8I_R528)) {
+		/* Not required on R528 */
+		return;
+	}
+
 	if (lock)
 		clrbits_le32(SUNXI_CPUCFG_BASE + SUNXI_DBG_CTRL1, BIT(cpu));
 	else
@@ -165,11 +204,22 @@ static void __secure sunxi_cpu_set_locking(int cpu, bool lock)
 
 static bool __secure sunxi_cpu_poll_wfi(int cpu)
 {
+	if (IS_ENABLED(CONFIG_MACH_SUN8I_R528)) {
+		return !!(readl(SUNXI_CPUCFG_BASE + SUN8I_R528_C0_CPU_STATUS) &
+			  BIT(SUN8I_R528_C0_STATUS_STANDBYWFI + cpu));
+	}
+
 	return !!(readl(SUNXI_CPUCFG_BASE + SUNXI_CPU_STATUS(cpu)) & BIT(2));
 }
 
 static void __secure sunxi_cpu_invalidate_cache(int cpu)
 {
+	if (IS_ENABLED(CONFIG_MACH_SUN8I_R528)) {
+		clrbits_le32(SUNXI_CPUCFG_BASE + SUN8I_R528_C0_CTRL_REG0,
+			     BIT(cpu));
+		return;
+	}
+
 	clrbits_le32(SUNXI_CPUCFG_BASE + SUNXI_GEN_CTRL, BIT(cpu));
 }
 
diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
index d976203ee7b..40ca7d7b3a9 100644
--- a/arch/arm/mach-sunxi/Kconfig
+++ b/arch/arm/mach-sunxi/Kconfig
@@ -349,6 +349,10 @@ config MACH_SUN8I_R40
 config MACH_SUN8I_R528
 	bool "sun8i (Allwinner R528)"
 	select CPU_V7A
+	select CPU_V7_HAS_NONSEC
+	select CPU_V7_HAS_VIRT
+	select ARCH_SUPPORT_PSCI
+	select SPL_ARMV7_SET_CORTEX_SMPEN
 	select SUNXI_GEN_NCAT2
 	select SUNXI_NEW_PINCTRL
 	select MMC_SUNXI_HAS_NEW_MODE
-- 
2.25.1

