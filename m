Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9B922F80
	for <linux-sunxi@lists.linux.dev>; Wed, 28 Apr 2021 22:53:44 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07EFA1FB;
	Wed, 28 Apr 2021 15:53:38 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6DA353F73B;
	Wed, 28 Apr 2021 15:53:36 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
	Icenowy Zheng <icenowy@aosc.io>,
	Samuel Holland <samuel@sholland.org>,
	Simon Glass <sjg@chromium.org>,
	Tom Rini <trini@konsulko.com>,
	u-boot@lists.denx.de,
	linux-sunxi@googlegroups.com,
	linux-sunxi@lists.linux.dev
Subject: [PATCH] sunxi: H616: Enable full 4GB of DRAM
Date: Wed, 28 Apr 2021 23:53:04 +0100
Message-Id: <20210428225304.23788-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

The H616 is our first supported Allwinner SoC which goes beyond the 4GB
address space "barrier", by having more than 32 address bits.

Lift the preliminary 3GB DRAM limit for the H616, and update the page
table setup on the way, to actually map that last GB as well.

This will presumably break the EMAC, as the DMA descriptors only hold
32 bits worth of addresses, but this is no problem for now, as all
boards with 4GB of DRAM cannot use the EMAC at the moment (missing
PHY support).

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/mach-sunxi/Kconfig | 4 ++--
 arch/arm/mach-sunxi/board.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
index b6463bca71d..4d71030e655 100644
--- a/arch/arm/mach-sunxi/Kconfig
+++ b/arch/arm/mach-sunxi/Kconfig
@@ -192,10 +192,10 @@ config MACH_SUNXI_H3_H5
 	select SUPPORT_SPL
 
 # TODO: try out A80's 8GiB DRAM space
-# TODO: H616 supports 4 GiB DRAM space
 config SUNXI_DRAM_MAX_SIZE
 	hex
-	default 0xC0000000 if MACH_SUN50I || MACH_SUN50I_H5 || MACH_SUN50I_H6 || MACH_SUN50I_H616
+	default 0x100000000 if MACH_SUN50I_H616
+	default 0xC0000000 if MACH_SUN50I || MACH_SUN50I_H5 || MACH_SUN50I_H6
 	default 0x80000000
 
 choice
diff --git a/arch/arm/mach-sunxi/board.c b/arch/arm/mach-sunxi/board.c
index 8cbd926f51d..edcfaee187e 100644
--- a/arch/arm/mach-sunxi/board.c
+++ b/arch/arm/mach-sunxi/board.c
@@ -56,7 +56,7 @@ static struct mm_region sunxi_mem_map[] = {
 		/* RAM */
 		.virt = 0x40000000UL,
 		.phys = 0x40000000UL,
-		.size = 0xC0000000UL,
+		.size = CONFIG_SUNXI_DRAM_MAX_SIZE,
 		.attrs = PTE_BLOCK_MEMTYPE(MT_NORMAL) |
 			 PTE_BLOCK_INNER_SHARE
 	}, {
-- 
2.17.5

