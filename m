Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F0693FE0
	for <linux-sunxi@lists.linux.dev>; Tue,  1 Feb 2022 01:41:44 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E03631476;
	Mon, 31 Jan 2022 17:41:43 -0800 (PST)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F0823F73B;
	Mon, 31 Jan 2022 17:41:42 -0800 (PST)
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
Subject: [PATCH v2 4/5] armv8: remove no longer needed lowlevel_init.S
Date: Tue,  1 Feb 2022 01:41:15 +0000
Message-Id: <20220201014116.25864-5-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20220201014116.25864-1-andre.przywara@arm.com>
References: <20220201014116.25864-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

When we added Allwinner SoC support to ARMv8, we needed to pull in an
implementation of lowlevel_init() calling the C function s_init(), as
sunxi required it as this time.

The last few patches got rid of this bogus requirement, and as sunxi was
still the only user, we can now remove this lowlevel_init.S from ARMv8
altogether.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Samuel Holland <samuel@sholland.org>
Reviewed-by: Simon Glass <sjg@chromium.org>
Tested-by: Simon Glass <sjg@chromium.org>
---
 arch/arm/cpu/armv8/Makefile        |  1 -
 arch/arm/cpu/armv8/lowlevel_init.S | 43 ------------------------------
 arch/arm/mach-sunxi/board.c        |  4 ---
 3 files changed, 48 deletions(-)
 delete mode 100644 arch/arm/cpu/armv8/lowlevel_init.S

diff --git a/arch/arm/cpu/armv8/Makefile b/arch/arm/cpu/armv8/Makefile
index d85ddde430a..85fe0475c86 100644
--- a/arch/arm/cpu/armv8/Makefile
+++ b/arch/arm/cpu/armv8/Makefile
@@ -42,6 +42,5 @@ obj-$(CONFIG_FSL_LAYERSCAPE) += fsl-layerscape/
 obj-$(CONFIG_S32V234) += s32v234/
 obj-$(CONFIG_TARGET_HIKEY) += hisilicon/
 obj-$(CONFIG_ARMV8_PSCI) += psci.o
-obj-$(CONFIG_ARCH_SUNXI) += lowlevel_init.o
 obj-$(CONFIG_TARGET_BCMNS3) += bcmns3/
 obj-$(CONFIG_XEN) += xen/
diff --git a/arch/arm/cpu/armv8/lowlevel_init.S b/arch/arm/cpu/armv8/lowlevel_init.S
deleted file mode 100644
index f4f0cdce9b3..00000000000
--- a/arch/arm/cpu/armv8/lowlevel_init.S
+++ /dev/null
@@ -1,43 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0+ */
-/*
- * A lowlevel_init function that sets up the stack to call a C function to
- * perform further init.
- */
-
-#include <asm-offsets.h>
-#include <config.h>
-#include <linux/linkage.h>
-
-ENTRY(lowlevel_init)
-	/*
-	 * Setup a temporary stack. Global data is not available yet.
-	 */
-#if defined(CONFIG_SPL_BUILD) && defined(CONFIG_SPL_STACK)
-	ldr	w0, =CONFIG_SPL_STACK
-#else
-	ldr	w0, =CONFIG_SYS_INIT_SP_ADDR
-#endif
-	bic	sp, x0, #0xf	/* 16-byte alignment for ABI compliance */
-
-	/*
-	 * Save the old LR(passed in x29) and the current LR to stack
-	 */
-	stp	x29, x30, [sp, #-16]!
-
-	/*
-	 * Call the very early init function. This should do only the
-	 * absolute bare minimum to get started. It should not:
-	 *
-	 * - set up DRAM
-	 * - use global_data
-	 * - clear BSS
-	 * - try to start a console
-	 *
-	 * For boards with SPL this should be empty since SPL can do all of
-	 * this init in the SPL board_init_f() function which is called
-	 * immediately after this.
-	 */
-	bl	s_init
-	ldp	x29, x30, [sp]
-	ret
-ENDPROC(lowlevel_init)
diff --git a/arch/arm/mach-sunxi/board.c b/arch/arm/mach-sunxi/board.c
index fab38f50898..3165dffc223 100644
--- a/arch/arm/mach-sunxi/board.c
+++ b/arch/arm/mach-sunxi/board.c
@@ -184,10 +184,6 @@ static int spl_board_load_image(struct spl_image_info *spl_image,
 SPL_LOAD_IMAGE_METHOD("FEL", 0, BOOT_DEVICE_BOARD, spl_board_load_image);
 #endif
 
-void s_init(void)
-{
-}
-
 #define SUNXI_INVALID_BOOT_SOURCE	-1
 
 static int sunxi_get_boot_source(void)
-- 
2.17.6

