Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EEE046A7
	for <linux-sunxi@lists.linux.dev>; Wed, 13 Jul 2022 15:28:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B31D115A1;
	Wed, 13 Jul 2022 08:28:08 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 66DB63F73D;
	Wed, 13 Jul 2022 08:28:07 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev,
	u-boot@lists.denx.de
Subject: [PATCH 3/3] sunxi: fel: drop redundant "control register" save/restore
Date: Wed, 13 Jul 2022 16:27:58 +0100
Message-Id: <20220713152758.56929-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220713152758.56929-1-andre.przywara@arm.com>
References: <20220713152758.56929-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For some reasons shrouded in mystery, the code saving the FEL state was
saving the SCTLR register twice, with the second copy trying to justify
itself by using its ancient "control register" alias name.

Drop the redundant second copy, both from the fel_stash data structure,
and also the code saving and restoring it.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/cpu/armv7/sunxi/fel_utils.S | 4 ----
 arch/arm/mach-sunxi/board.c          | 1 -
 2 files changed, 5 deletions(-)

diff --git a/arch/arm/cpu/armv7/sunxi/fel_utils.S b/arch/arm/cpu/armv7/sunxi/fel_utils.S
index b2310751d9..78bb1657fc 100644
--- a/arch/arm/cpu/armv7/sunxi/fel_utils.S
+++ b/arch/arm/cpu/armv7/sunxi/fel_utils.S
@@ -20,8 +20,6 @@ ENTRY(save_boot_params)
 	str	lr, [r0, #12]
 	mrc	p15, 0, lr, c12, c0, 0	@ Read VBAR
 	str	lr, [r0, #16]
-	mrc	p15, 0, lr, c1, c0, 0	@ Read CP15 Control Register
-	str	lr, [r0, #20]
 	b	save_boot_params_ret
 ENDPROC(save_boot_params)
 
@@ -29,8 +27,6 @@ ENTRY(return_to_fel)
 	mov	sp, r0
 	mov	lr, r1
 	ldr	r0, =fel_stash
-	ldr	r1, [r0, #20]
-	mcr	p15, 0, r1, c1, c0, 0	@ Write CP15 Control Register
 	ldr	r1, [r0, #16]
 	mcr	p15, 0, r1, c12, c0, 0	@ Write VBAR
 	ldr	r1, [r0, #12]
diff --git a/arch/arm/mach-sunxi/board.c b/arch/arm/mach-sunxi/board.c
index 8f7c894286..385eac7a61 100644
--- a/arch/arm/mach-sunxi/board.c
+++ b/arch/arm/mach-sunxi/board.c
@@ -35,7 +35,6 @@ struct fel_stash {
 	uint32_t cpsr;
 	uint32_t sctlr;
 	uint32_t vbar;
-	uint32_t cr;
 };
 
 struct fel_stash fel_stash __section(".data");
-- 
2.25.1

