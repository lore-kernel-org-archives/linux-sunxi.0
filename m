Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91862200130
	for <linux-sunxi@lists.linux.dev>; Sun, 23 Mar 2025 11:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742729803; cv=none; b=HoY7jG9wAfbOVkE0fDpU5lug6i7sklYqtTgEUOBRHSTlf6SiDblBcYXfBzFiLHYyodhZmEIYC3CgJelAlWfIG2h0u/kpYDbVP+k1spqRhC/yh6o45SqDLWAMSA5XuvPlI660/jTCoHlhC/5ilgsjs8qOJjcr2igmhvFffqMLtNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742729803; c=relaxed/simple;
	bh=SNKKhZsudI2Vo5rhQDLXqIi1Expg2z9yCaeOmvY29Lk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WpPdzW9sQHkCnPAlUnPSIFV24gA2wRIb8qYCel24eFynmV33DB16R2qH6cRpMYcn54xo186z1Ve0DtKRv11wOPNPe5zmJHWMxf1EZw10zZmbLRuyr4nSrMEkdlQ+Q9aRRRIXiogFhEZY5tCp0ZCqWA/UyjTGW78v5+r38X3rmf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 236AD1595;
	Sun, 23 Mar 2025 04:36:48 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 69F783F694;
	Sun, 23 Mar 2025 04:36:40 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>
Cc: Simon Glass <sjg@chromium.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Mikhail Kalashnikov <iuncuim@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 24/34] sunxi: armv8: fel: move fel_stash variable to the front
Date: Sun, 23 Mar 2025 11:35:34 +0000
Message-ID: <20250323113544.7933-25-andre.przywara@arm.com>
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

To return a 64-bit Allwinner chip back to the 32-bit BootROM code, we
have some embedded AArch32 code that restores the CPU state, before
branching back to the BootROM. At the moment the pointer to the buffer
with that state is located *after* the code, which makes the PC relative
code fragile: adding or removing instructions will change the distance
to that pointer variable.
The "new" Allwinner A523 SoC requires more state to be restored (GICv3
system registers), but we must do that *only* on that SoC. Conditional
compilation sounds like the easiest solution, but would mean that the
distance to that pointer would change.

Solve this rather easily by moving the pointer to the *front* of the
code: we load that pointer in the first instruction, so the distance
would always stay the same. Later in the code we won't need PC relative
addressing anymore, so this code can grow or shrink easily, for instance
due to conditional compilation.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/cpu/armv8/fel_utils.S | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm/cpu/armv8/fel_utils.S b/arch/arm/cpu/armv8/fel_utils.S
index 939869b9ffa..f7707acdf1a 100644
--- a/arch/arm/cpu/armv8/fel_utils.S
+++ b/arch/arm/cpu/armv8/fel_utils.S
@@ -63,9 +63,12 @@ ENTRY(return_to_fel)
 1:	wfi
 	b	1b
 
+fel_stash_addr:			// must immediately precede back_in_32:
+	.word   0x00000000	// receives fel_stash addr, by AA64 code above
+
 /* AArch32 code to restore the state from fel_stash and return back to FEL. */
 back_in_32:
-	.word	0xe59f0028	// ldr	r0, [pc, #40]	; load fel_stash address
+	.word	0xe51f000c	// ldr	r0, [pc, #-12]  ; load fel_stash address
 	.word	0xe5901008	// ldr	r1, [r0, #8]
 	.word	0xe129f001	// msr	CPSR_fc, r1
 	.word	0xf57ff06f	// isb
@@ -77,6 +80,4 @@ back_in_32:
 	.word	0xee011f10	// mcr	15, 0, r1, cr1, cr0, {0}  ; SCTLR
 	.word	0xf57ff06f	// isb
 	.word	0xe12fff1e	// bx	lr		; return to FEL
-fel_stash_addr:
-	.word   0x00000000	// receives fel_stash addr, by AA64 code above
 ENDPROC(return_to_fel)
-- 
2.46.3

