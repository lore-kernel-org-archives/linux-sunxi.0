Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5332378F4C
	for <linux-sunxi@lists.linux.dev>; Sun, 23 Mar 2025 11:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742729806; cv=none; b=b5EO8LeIAyBCRlXz55TwqaILDvTb4WUFlaySXOA+j6HUFIz9AEPLOMptUqvhELFpptlOxbxiODiKpdCGbJoA9kSVq0KXH/cQkKjZze+Hxv1MtMG0ky2jf7RNfS13cqnY9+4vvekRRuDmKzUxIWhjbWtO1rzkBByoVbiwaNcAzs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742729806; c=relaxed/simple;
	bh=rpt6+v+SGY41Q7IsgdCf3KnG1pGil7RbHGx72uBr/a8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=br84TZHKj7/0zqmv2enyY3r51TJ+r7IjhduH+AievX9tFJjO7LV9qQOk4/i6UQrrC4VK6tYUP1wz31nolJSmqYDEy57KCkcKKqcfzqVJXQdD34mtHbpf9ilIQgRr2sNaSmZbtjSB+W2aWR5VEDyqF9u4wR10ppO+OYvzQuAkxK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF369339;
	Sun, 23 Mar 2025 04:36:51 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 21EC93F694;
	Sun, 23 Mar 2025 04:36:44 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>
Cc: Simon Glass <sjg@chromium.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Mikhail Kalashnikov <iuncuim@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 27/34] sunxi: armv8: FEL: save and restore GICv3 registers
Date: Sun, 23 Mar 2025 11:35:37 +0000
Message-ID: <20250323113544.7933-28-andre.przywara@arm.com>
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

To be able to return to the BootROM FEL USB debug code, we must restore
the core's state as accurately as possible after the SPL has been run.
Since the BootROM runs in AArch32, but the SPL uses AArch64, this requires
a core reset, which clears the core's state.
So far we were saving and restoring the required registers like SCTLR
and VBAR, but could ignore the interrupt controller's state (GICC), since
that lives in MMIO registers, unaffected by a core reset.
Newer Allwinner SoCs now feature a GICv3 interrupt controller, which keeps
some GIC state in architected system registers, and those are cleared
when we switch back to AArch32.

To enable FEL operation on the Allwinner A523 SoC,
Add AArch32 assembly code to save and restore the ICC_PMR and ICC_IGRPEN1
system registers. The other GICv3 sysregs are either not relevant for the
BROM operation, or haven't been changed from their reset defaults by the
BROM anyway.

This enables FEL operation on the Allwinner A523 family of SoCs.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/cpu/armv8/fel_utils.S          |  7 +++++++
 arch/arm/include/asm/arch-sunxi/boot0.h | 10 +++++++++-
 arch/arm/mach-sunxi/board.c             |  2 ++
 arch/arm/mach-sunxi/rmr_switch.S        | 10 ++++++++++
 4 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/arch/arm/cpu/armv8/fel_utils.S b/arch/arm/cpu/armv8/fel_utils.S
index f7707acdf1a..f9d0c9e1d0a 100644
--- a/arch/arm/cpu/armv8/fel_utils.S
+++ b/arch/arm/cpu/armv8/fel_utils.S
@@ -79,5 +79,12 @@ back_in_32:
 	.word	0xe590100c	// ldr	r1, [r0, #12]
 	.word	0xee011f10	// mcr	15, 0, r1, cr1, cr0, {0}  ; SCTLR
 	.word	0xf57ff06f	// isb
+#ifdef CONFIG_MACH_SUN55I_A523
+	.word	0xe5901014	// ldr  r1, [r0, #20]
+	.word	0xee041f16	// mcr  15, 0, r1, cr4, cr6, {0}; ICC_PMR
+	.word	0xe5901018	// ldr  r1, [r0, #24]
+	.word	0xee0c1ffc	// mcr  15, 0, r1, cr12, cr12, {7}; ICC_IGRPEN1
+#endif
+
 	.word	0xe12fff1e	// bx	lr		; return to FEL
 ENDPROC(return_to_fel)
diff --git a/arch/arm/include/asm/arch-sunxi/boot0.h b/arch/arm/include/asm/arch-sunxi/boot0.h
index 24c81391d58..9baedc2e9af 100644
--- a/arch/arm/include/asm/arch-sunxi/boot0.h
+++ b/arch/arm/include/asm/arch-sunxi/boot0.h
@@ -30,7 +30,15 @@
 	.word	0xe580e00c	// str     lr, [r0, #12]
 	.word	0xee1cef10	// mrc     15, 0, lr, cr12, cr0, {0}
 	.word	0xe580e010	// str     lr, [r0, #16]
-
+#ifdef CONFIG_MACH_SUN55I_A523
+	.word	0xee1cefbc	// mrc     15, 0, lr, cr12, cr12, {5}
+	.word	0xe31e0001	// tst     lr, #1
+	.word	0x0a000003	// beq     cc <start32+0x48>
+	.word	0xee14ef16	// mrc     15, 0, lr, cr4, cr6, {0}
+	.word	0xe580e014	// str     lr, [r0, #20]
+	.word	0xee1ceffc	// mrc     15, 0, lr, cr12, cr12, {7}
+	.word	0xe580e018	// str     lr, [r0, #24]
+#endif
 	.word	0xe59f1034	// ldr     r1, [pc, #52] ; RVBAR_ADDRESS
 	.word	0xe59f0034	// ldr     r0, [pc, #52] ; SUNXI_SRAMC_BASE
 	.word	0xe5900024	// ldr     r0, [r0, #36] ; SRAM_VER_REG
diff --git a/arch/arm/mach-sunxi/board.c b/arch/arm/mach-sunxi/board.c
index 89aea61e8e8..195c40d00c6 100644
--- a/arch/arm/mach-sunxi/board.c
+++ b/arch/arm/mach-sunxi/board.c
@@ -35,6 +35,8 @@ struct fel_stash {
 	uint32_t cpsr;
 	uint32_t sctlr;
 	uint32_t vbar;
+	uint32_t icc_pmr;
+	uint32_t icc_igrpen1;
 };
 
 struct fel_stash fel_stash __section(".data");
diff --git a/arch/arm/mach-sunxi/rmr_switch.S b/arch/arm/mach-sunxi/rmr_switch.S
index 422007c985b..de284c16b0b 100644
--- a/arch/arm/mach-sunxi/rmr_switch.S
+++ b/arch/arm/mach-sunxi/rmr_switch.S
@@ -53,6 +53,16 @@ start32:
 	str	lr, [r0, #12]
 	mrc	p15, 0, lr, cr12, cr0, 0	// VBAR
 	str	lr, [r0, #16]
+//#ifdef CONFIG_MACH_SUN55I_A523
+	mrc	p15, 0, lr, cr12, cr12, 5	// ICC_SRE
+	tst	lr, #1
+	beq	1f
+	mrc	p15, 0, lr, c4, c6, 0		// ICC_PMR
+	str	lr, [r0, #20]
+	mrc	p15, 0, lr, c12, c12, 7		// ICC_IGRPEN1
+	str	lr, [r0, #24]
+1:
+//#endif
 
 	ldr	r1, =CONFIG_SUNXI_RVBAR_ADDRESS
 	ldr	r0, =SUNXI_SRAMC_BASE
-- 
2.46.3

