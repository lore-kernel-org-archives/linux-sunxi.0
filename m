Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B3BC200130
	for <linux-sunxi@lists.linux.dev>; Sun, 23 Mar 2025 11:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742729805; cv=none; b=EjhaUO9FGyOfV01XTZij91v95AjSha7QeVnYtTASAoWcZvxGIUPKW85Cnv0KEfVP00RoCmePCiE3Nly2KIRuvbKmpa4arxGRzA650RDPri3vKoggaQODbP8ryw6R5pSg6ydjYSWsVjQHfIax42k+e1okgBjENIqlFrLuXjcgFZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742729805; c=relaxed/simple;
	bh=jpCrbdQcRtvDraao7TAb8FNiwn2SIIAb8EIBl6gUXfY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bmWKZhLy6zgtBx8erjUm463j7+0aKGcKKZDSwaGUXW/hWqBH8cbC3dzlCGhdlemToQ1L30E3TqmMa5vjhCdkBmVmBSr3yVi4BEePgR0km4mh76u2lCXY4QLGw3WrNetg4RkV/A6lEguZB+95hwSTi5d9mfFIDqjrcPLTyBiaqZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 95DC2106F;
	Sun, 23 Mar 2025 04:36:50 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DCF103F694;
	Sun, 23 Mar 2025 04:36:42 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>
Cc: Simon Glass <sjg@chromium.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Mikhail Kalashnikov <iuncuim@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 26/34] sunxi: update rmr_switch.S source code
Date: Sun, 23 Mar 2025 11:35:36 +0000
Message-ID: <20250323113544.7933-27-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250323113544.7933-1-andre.przywara@arm.com>
References: <20250323113544.7933-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Because the Allwinner BootROM always runs in AArch32, even on ARMv8 SoCs,
we need to switch to AArch64 first, but also need to save the CPU state,
when we later may need to return to the BootROM, for continuing with the
FEL USB protocol. This is done in 32-bit code, which we include into the
AArch64 boot assembly file as a series of .word directives, containing
the encoded AArch32 instructions. To be able to change and verify that
code, we also kept an assembly file with the respective 32-bit code, but
just for reference.

As this code is never compiled or assembled - it's just for
documentation - it became stale over time: we didn't really update this
along with the changes we made to the boot code. In particular the FEL
save code was completely missing.

Update that 32-bit assembly file, to match the current version used in
boot0.h, including the FEL save routine. Also update the build
instructions in the comments, to give people an actual chance to
assemble this code.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/mach-sunxi/rmr_switch.S | 40 +++++++++++++++++++++++++++-----
 1 file changed, 34 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-sunxi/rmr_switch.S b/arch/arm/mach-sunxi/rmr_switch.S
index 33e55d49686..422007c985b 100644
--- a/arch/arm/mach-sunxi/rmr_switch.S
+++ b/arch/arm/mach-sunxi/rmr_switch.S
@@ -16,7 +16,9 @@
 @ the machine code must be inserted as verbatim .word statements into the
 @ beginning of the AArch64 U-Boot code.
 @ To get the encoded bytes, use:
-@ ${CROSS_COMPILE}gcc -c -o rmr_switch.o rmr_switch.S
+@ ${CROSS_COMPILE}gcc -c -Iinclude -Iarch/arm/include	\
+@   -D__ASSEMBLY__ -DCONFIG_ARM64			\
+@   -o rmr_switch.o arch/arm/mach-sunxi/rmr_switch.S
 @ ${CROSS_COMPILE}objdump -d rmr_switch.o
 @
 @ The resulting words should be inserted into the U-Boot file at
@@ -29,14 +31,40 @@
 #include <config.h>
 
 .text
+	b	start32			// this is "tst x0, x0" in AArch64
+	.word	0x14000047		// this is "b   reset"  in AArch64
 
-#ifndef CONFIG_SUN50I_GEN_H6
-	ldr	r1, =0x017000a0		@ MMIO mapped RVBAR[0] register
+	.space  0x78			// gap distance set by the common
+					// encoding of the first instruction
+fel_stash_addr:
+	.word	fel_stash - .		// distance to fel_stash buffer
+
+start32:
+	adr	r0, fel_stash_addr	// absolute location of fel_stash_addr
+	ldr	r1, fel_stash_addr	// distance to actual fel_stash
+	add	r0, r0, r1		// real address of fel_stash
+
+	/* save the current state as needed by the BROM for a later return */
+	str	sp, [r0]
+	str	lr, [r0, #4]
+	mrs	lr, CPSR
+	str	lr, [r0, #8]
+	mrc	p15, 0, lr, cr1, cr0, 0		// SCTLR
+	str	lr, [r0, #12]
+	mrc	p15, 0, lr, cr12, cr0, 0	// VBAR
+	str	lr, [r0, #16]
+
+	ldr	r1, =CONFIG_SUNXI_RVBAR_ADDRESS
+	ldr	r0, =SUNXI_SRAMC_BASE
+	ldr	r0, [r0, #36]			// SRAM_VER_REG
+	ands	r0, r0, #0xff
+	ldrne	r1, =CONFIG_SUNXI_RVBAR_ALTERNATIVE
+#ifdef CONFIG_XPL_BUILD
+	ldr	r0, =CONFIG_SPL_TEXT_BASE
 #else
-	ldr	r1, =0x09010040		@ MMIO mapped RVBAR[0] register
+	ldr	r0, =CONFIG_TEXT_BASE
 #endif
-	ldr	r0, =0x57aA7add		@ start address, to be replaced
-	str	r0, [r1]
+	str	r0, [r1]			// store start address in RVBAR
 	dsb	sy
 	isb	sy
 	mrc	15, 0, r0, cr12, cr0, 2	@ read RMR register
-- 
2.46.3

