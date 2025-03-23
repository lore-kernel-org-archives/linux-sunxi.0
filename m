Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CD66200130
	for <linux-sunxi@lists.linux.dev>; Sun, 23 Mar 2025 11:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742729808; cv=none; b=moZrPoypIXqh0lj2eNH+p/+OubHJYU6EfkUFy1OT2hrH72bv6Qs0+28gxY3ULcR2Z18+uLbEhKnYtihBFJwGPGO19RF2wivVvu+amE8+au+Nt0Cp7tjS/FhhpyhB96tt0bUJIR5g7klX25uBRsbf1CX2/Nkn17XLYcNdzgOwEPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742729808; c=relaxed/simple;
	bh=oJSTf9uKbC03Q1iZNxMg8Ug5U1K3jIUER+8AEmhZ4sY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I01rrXGMknlSUdTsPhH2cW9pbcX0iLYOoBAKcZkcvIovEQ8LtcbSh/ErMNUa4U3Za1RJFd+4axe+FyCV2omvHIHrkZQ2rIMUuejokHMbZ5Zs19/iqEveDEWAQUhLoo9SGLxqSl5gegP4jVT458JX/62xiR/JUqzWhj/M7qF03H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 14CE4106F;
	Sun, 23 Mar 2025 04:36:53 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5B8283F694;
	Sun, 23 Mar 2025 04:36:45 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>
Cc: Simon Glass <sjg@chromium.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Mikhail Kalashnikov <iuncuim@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 28/34] sunxi: armv8: FEL: save and restore SP_IRQ
Date: Sun, 23 Mar 2025 11:35:38 +0000
Message-ID: <20250323113544.7933-29-andre.przywara@arm.com>
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

Thanks for Jernej's JTAG debugging effort, it turns out that the BROM
expects SP_IRQ to be saved and restored, when we want to enter back into
FEL after the SPL's AArch64 stint.
Save and restore SP_IRQ as part of the FEL state handling. The banked
MRS/MSR access to SP_IRQ, without actually being in IRQ mode, was
introduced with the ARMv7 virtualisation extensions. The Arm Cortex-A8
cores used in the A10/A13s or older F1C100s SoCs would not support that,
but this code here is purely in the ARMv8/AArch64 code path, so it's
safe to use unconditionally.

Reported-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/cpu/armv8/fel_utils.S          | 6 ++++--
 arch/arm/include/asm/arch-sunxi/boot0.h | 6 ++++--
 arch/arm/mach-sunxi/board.c             | 1 +
 arch/arm/mach-sunxi/rmr_switch.S        | 6 ++++--
 4 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/arch/arm/cpu/armv8/fel_utils.S b/arch/arm/cpu/armv8/fel_utils.S
index f9d0c9e1d0a..044a7c16cc5 100644
--- a/arch/arm/cpu/armv8/fel_utils.S
+++ b/arch/arm/cpu/armv8/fel_utils.S
@@ -74,15 +74,17 @@ back_in_32:
 	.word	0xf57ff06f	// isb
 	.word	0xe590d000	// ldr	sp, [r0]
 	.word	0xe590e004	// ldr	lr, [r0, #4]
+	.word	0xe5901014	// ldr  r1, [r0, #20]
+	.word	0xe121f301	// msr  SP_irq, r1
 	.word	0xe5901010	// ldr	r1, [r0, #16]
 	.word	0xee0c1f10	// mcr	15, 0, r1, cr12, cr0, {0} ; VBAR
 	.word	0xe590100c	// ldr	r1, [r0, #12]
 	.word	0xee011f10	// mcr	15, 0, r1, cr1, cr0, {0}  ; SCTLR
 	.word	0xf57ff06f	// isb
 #ifdef CONFIG_MACH_SUN55I_A523
-	.word	0xe5901014	// ldr  r1, [r0, #20]
-	.word	0xee041f16	// mcr  15, 0, r1, cr4, cr6, {0}; ICC_PMR
 	.word	0xe5901018	// ldr  r1, [r0, #24]
+	.word	0xee041f16	// mcr  15, 0, r1, cr4, cr6, {0}; ICC_PMR
+	.word	0xe590101c	// ldr  r1, [r0, #28]
 	.word	0xee0c1ffc	// mcr  15, 0, r1, cr12, cr12, {7}; ICC_IGRPEN1
 #endif
 
diff --git a/arch/arm/include/asm/arch-sunxi/boot0.h b/arch/arm/include/asm/arch-sunxi/boot0.h
index 9baedc2e9af..d79aea97a40 100644
--- a/arch/arm/include/asm/arch-sunxi/boot0.h
+++ b/arch/arm/include/asm/arch-sunxi/boot0.h
@@ -26,6 +26,8 @@
 	.word	0xe580e004	// str     lr, [r0, #4]
 	.word	0xe10fe000	// mrs     lr, CPSR
 	.word	0xe580e008	// str     lr, [r0, #8]
+	.word	0xe101e300	// mrs     lr, SP_irq
+	.word	0xe580e014	// str     lr, [r0, #20]
 	.word	0xee11ef10	// mrc     15, 0, lr, cr1, cr0, {0}
 	.word	0xe580e00c	// str     lr, [r0, #12]
 	.word	0xee1cef10	// mrc     15, 0, lr, cr12, cr0, {0}
@@ -35,9 +37,9 @@
 	.word	0xe31e0001	// tst     lr, #1
 	.word	0x0a000003	// beq     cc <start32+0x48>
 	.word	0xee14ef16	// mrc     15, 0, lr, cr4, cr6, {0}
-	.word	0xe580e014	// str     lr, [r0, #20]
-	.word	0xee1ceffc	// mrc     15, 0, lr, cr12, cr12, {7}
 	.word	0xe580e018	// str     lr, [r0, #24]
+	.word	0xee1ceffc	// mrc     15, 0, lr, cr12, cr12, {7}
+	.word	0xe580e01c	// str     lr, [r0, #28]
 #endif
 	.word	0xe59f1034	// ldr     r1, [pc, #52] ; RVBAR_ADDRESS
 	.word	0xe59f0034	// ldr     r0, [pc, #52] ; SUNXI_SRAMC_BASE
diff --git a/arch/arm/mach-sunxi/board.c b/arch/arm/mach-sunxi/board.c
index 195c40d00c6..06a4a79146f 100644
--- a/arch/arm/mach-sunxi/board.c
+++ b/arch/arm/mach-sunxi/board.c
@@ -35,6 +35,7 @@ struct fel_stash {
 	uint32_t cpsr;
 	uint32_t sctlr;
 	uint32_t vbar;
+	uint32_t sp_irq;
 	uint32_t icc_pmr;
 	uint32_t icc_igrpen1;
 };
diff --git a/arch/arm/mach-sunxi/rmr_switch.S b/arch/arm/mach-sunxi/rmr_switch.S
index de284c16b0b..a6d75c32ed9 100644
--- a/arch/arm/mach-sunxi/rmr_switch.S
+++ b/arch/arm/mach-sunxi/rmr_switch.S
@@ -49,6 +49,8 @@ start32:
 	str	lr, [r0, #4]
 	mrs	lr, CPSR
 	str	lr, [r0, #8]
+	mrs	lr, SP_irq
+	str	lr, [r0, #20]
 	mrc	p15, 0, lr, cr1, cr0, 0		// SCTLR
 	str	lr, [r0, #12]
 	mrc	p15, 0, lr, cr12, cr0, 0	// VBAR
@@ -58,9 +60,9 @@ start32:
 	tst	lr, #1
 	beq	1f
 	mrc	p15, 0, lr, c4, c6, 0		// ICC_PMR
-	str	lr, [r0, #20]
-	mrc	p15, 0, lr, c12, c12, 7		// ICC_IGRPEN1
 	str	lr, [r0, #24]
+	mrc	p15, 0, lr, c12, c12, 7		// ICC_IGRPEN1
+	str	lr, [r0, #28]
 1:
 //#endif
 
-- 
2.46.3

