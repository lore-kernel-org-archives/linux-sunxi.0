Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E177772
	for <linux-sunxi@lists.linux.dev>; Wed,  5 May 2021 13:04:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6ADD0ED1;
	Wed,  5 May 2021 06:04:52 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4C1213F718;
	Wed,  5 May 2021 06:04:50 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
	Icenowy Zheng <icenowy@aosc.io>,
	Samuel Holland <samuel@sholland.org>,
	Simon Glass <sjg@chromium.org>,
	Bin Meng <bmeng.cn@gmail.com>,
	Mark Kettenis <mark.kettenis@xs4all.nl>,
	Tom Rini <trini@konsulko.com>,
	u-boot@lists.denx.de,
	linux-sunxi@googlegroups.com,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2] sunxi: H616: Enable full 4GB of DRAM
Date: Wed,  5 May 2021 14:04:06 +0100
Message-Id: <20210505130406.21094-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

The H616 is our first supported Allwinner SoC which goes beyond the 4GB
address space "barrier", by having more than 32 address bits.

Lift the preliminary 3GB DRAM limit for the H616, and update the page
table setup on the way, to actually map that last GB as well.

As not all devices are actually capable of dealing with more than 32
bits (the DMA in the EMAC for instance), we also limit U-Boot's own
DRAM usage to 4GB on the way.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
Changelog v1 .. v2:
- limit ram_top to 4GB to fix Ethernet DMA

 arch/arm/mach-sunxi/Kconfig |  4 ++--
 arch/arm/mach-sunxi/board.c | 11 ++++++++++-
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
index 8e9012dbbfe..f052557da4c 100644
--- a/arch/arm/mach-sunxi/Kconfig
+++ b/arch/arm/mach-sunxi/Kconfig
@@ -190,10 +190,10 @@ config MACH_SUNXI_H3_H5
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
index 503538e26d3..2de3ab2b4ef 100644
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
@@ -65,6 +65,15 @@ static struct mm_region sunxi_mem_map[] = {
 	}
 };
 struct mm_region *mem_map = sunxi_mem_map;
+
+ulong board_get_usable_ram_top(ulong total_size)
+{
+	/* Some devices (like the EMAC) have a 32-bit DMA limit. */
+	if (gd->ram_top > (1ULL << 32))
+		return 1ULL << 32;
+
+	return gd->ram_top;
+}
 #endif
 
 static int gpio_init(void)
-- 
2.17.5

