Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D79A178F4C
	for <linux-sunxi@lists.linux.dev>; Sun, 23 Mar 2025 11:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742729804; cv=none; b=hS0lpkMCiOce53ZB1gNLkeMJx45i6KBFO85hK17u8yDri9rMgMHhqig2/eqalXiuhSjnkYs/vts4FRebOWL9ZcT8Z1G4O3U0e/yeDx0gfD6LbS1gMlFeeocsR+IQGUlS1L1jfxh7KOAlaYlkLsSpyuMtuW+uKXTRANJ5c/HvhFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742729804; c=relaxed/simple;
	bh=7hxGNVgN7s6N2eRI5bMRkDC6G4z9X9gdA55sbyjsU4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fJJk7/PMvWRhfmgByIW3MqETO/z3h/JBdHkaw43gjOsoiq3fElgMNOwy1xlunWbF7JTKAtmwupFIV4nSnLWhfB9kzwC/vn2zYCH+hlrzKY+VsjW1GKSh0Lj3FFBfET0qY/2UVAZWUCbUhTOJpKWncDC08HIP/6YJm7VS02qsg50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5CBCA339;
	Sun, 23 Mar 2025 04:36:49 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A3B3C3F7D8;
	Sun, 23 Mar 2025 04:36:41 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>
Cc: Simon Glass <sjg@chromium.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Mikhail Kalashnikov <iuncuim@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 25/34] sunxi: arm64: boot0.h: move fel_stash_addr variable to the front
Date: Sun, 23 Mar 2025 11:35:35 +0000
Message-ID: <20250323113544.7933-26-andre.przywara@arm.com>
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

To be able to return to the BootROM when booting via the FEL USB
protocol, we need to save the CPU state very early, which we need to do
in the embedded AArch32 code. At the moment the pointer to the buffer for
that state is located *after* the code, which makes the PC relative
code fragile: adding or removing instructions will change the distance
to that pointer variable.
The "new" Allwinner A523 SoC requires more state to be saved (GICv3
system registers), but we must do that *only* on that SoC. Conditional
compilation sounds like the easiest solution, but would mean that the
distance to that pointer would change.

Solve this rather easily by moving the pointer to the *front* of the
code: we load that pointer in the first instructions, so the distance
would always stay the same. Later in the code we won't need PC relative
addressing anymore, so this code can grow or shrink easily, for instance
due to conditional compilation.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/include/asm/arch-sunxi/boot0.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/include/asm/arch-sunxi/boot0.h b/arch/arm/include/asm/arch-sunxi/boot0.h
index 6b2bb5a4586..24c81391d58 100644
--- a/arch/arm/include/asm/arch-sunxi/boot0.h
+++ b/arch/arm/include/asm/arch-sunxi/boot0.h
@@ -16,10 +16,11 @@
  */
 	tst     x0, x0                  // this is "b #0x84" in ARM
 	b       reset
-	.space  0x7c
+	.space  0x78
+	.word	fel_stash - .
 
-	.word	0xe28f0070	// add     r0, pc, #112	 // @(fel_stash - .)
-	.word	0xe59f106c	// ldr     r1, [pc, #108] // fel_stash - .
+	.word	0xe24f000c	// sub     r0, pc, #12  // @(fel_stash - .)
+	.word	0xe51f1010	// ldr     r1, [pc, #-16] // fel_stash - .
 	.word	0xe0800001	// add     r0, r0, r1
 	.word	0xe580d000	// str     sp, [r0]
 	.word	0xe580e004	// str     lr, [r0, #4]
@@ -54,7 +55,6 @@
 #else
 	.word   CONFIG_TEXT_BASE
 #endif
-	.word	fel_stash - .
 #else
 /* normal execution */
 	b	reset
-- 
2.46.3

