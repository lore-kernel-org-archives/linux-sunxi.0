Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A34863A1
	for <linux-sunxi@lists.linux.dev>; Wed,  5 Apr 2023 14:27:47 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4B791684;
	Wed,  5 Apr 2023 07:28:24 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A7643F762;
	Wed,  5 Apr 2023 07:27:38 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Piotr Oniszczuk <piotr.oniszczuk@gmail.com>,
	Mikhail Kalashnikov <iuncuim@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 1/2] sunxi: boot0.h: allow RVBAR MMIO address customisation
Date: Wed,  5 Apr 2023 15:27:30 +0100
Message-Id: <20230405142731.1246503-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To switch the ARMv8 Allwinner SoCs into the 64-bit AArch64 ISA, we need
to program the 64-bit start code address into an MMIO mapped register
that shadows the architectural RVBAR register.
This address is SoC specific, with just two versions out there so far.
Now a third address emerged, on a *variant* of an existing SoC (H616).

Change the boot0.h start code to make this address a Kconfig
selectable option, to allow easier maintenance.
We make this address user-visible (even though it shouldn't be), to
allow putting this in defconfig. This is needed because there are
apparently revisions of the H616 SoC out there using different
addresses, so this becomes a per-board decision.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/include/asm/arch-sunxi/boot0.h |  7 ++-----
 arch/arm/mach-sunxi/Kconfig             | 12 ++++++++++++
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/arch/arm/include/asm/arch-sunxi/boot0.h b/arch/arm/include/asm/arch-sunxi/boot0.h
index 46b7e073b59..59ea75a96b5 100644
--- a/arch/arm/include/asm/arch-sunxi/boot0.h
+++ b/arch/arm/include/asm/arch-sunxi/boot0.h
@@ -39,11 +39,8 @@
 	.word	0xf57ff06f	// isb     sy
 	.word	0xe320f003	// wfi
 	.word	0xeafffffd	// b       @wfi
-#ifndef CONFIG_SUN50I_GEN_H6
-	.word	0x017000a0	// writeable RVBAR mapping address
-#else
-	.word	0x09010040	// writeable RVBAR mapping address
-#endif
+
+	.word	CONFIG_SUNXI_RVBAR_ADDRESS	// writable RVBAR mapping addr
 #ifdef CONFIG_SPL_BUILD
 	.word	CONFIG_SPL_TEXT_BASE
 #else
diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
index 6417aee944b..b46667ce01e 100644
--- a/arch/arm/mach-sunxi/Kconfig
+++ b/arch/arm/mach-sunxi/Kconfig
@@ -110,6 +110,18 @@ config SUNXI_SRAM_ADDRESS
 	Some newer SoCs map the boot ROM at address 0 instead and move the
 	SRAM to a different address.
 
+config SUNXI_RVBAR_ADDRESS
+	hex "RVBAR address"
+	depends on ARM64
+	default 0x09010040 if SUN50I_GEN_H6
+	default 0x017000a0
+	---help---
+	The read-only RVBAR system register holds the address of the first
+	instruction to execute after a reset. Allwinner cores provide a
+	writable MMIO backing store for this register, to allow to set the
+	entry point when switching to AArch64. This store is on different
+	addresses, depending on the SoC.
+
 config SUNXI_A64_TIMER_ERRATUM
 	bool
 
-- 
2.25.1

