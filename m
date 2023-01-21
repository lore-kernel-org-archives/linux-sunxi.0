Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B95E0361
	for <linux-sunxi@lists.linux.dev>; Sat, 21 Jan 2023 01:53:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B0D2C1042;
	Fri, 20 Jan 2023 17:53:55 -0800 (PST)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2020E3F71A;
	Fri, 20 Jan 2023 17:53:12 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH v2] sunxi: eMMC: support TOC0 on boot partitions
Date: Sat, 21 Jan 2023 01:51:21 +0000
Message-Id: <20230121015121.20150-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.5
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To determine whether we have been booted from an eMMC boot partition, we
replay some of the checks that the BROM must have done to successfully
load the SPL. This involves a checksum check, which currently relies on
the SPL being wrapped in an "eGON" header.

If a board has secure boot enabled, the BROM will only accept the "TOC0"
format, which is internally very different, but uses the same
checksumming algorithm. Actually the only difference for calculating the
checksum is that the size of the SPL is stored at a different offset.

Do a header check to determine whether we deal with an eGON or TOC0
format, then set the SPL size accordingly. The rest of the code is
unchanged.

This fixes booting from an eMMC boot partition on devices with secure
boot enabled, like the Remix Mini PC.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
Changelog v2 .. v1:
- use struct members instead of indexing buffer array

 arch/arm/mach-sunxi/board.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-sunxi/board.c b/arch/arm/mach-sunxi/board.c
index 03f51557fcb..391a65a5495 100644
--- a/arch/arm/mach-sunxi/board.c
+++ b/arch/arm/mach-sunxi/board.c
@@ -364,6 +364,7 @@ static bool sunxi_valid_emmc_boot(struct mmc *mmc)
 	struct blk_desc *bd = mmc_get_blk_desc(mmc);
 	u32 *buffer = (void *)(uintptr_t)CONFIG_TEXT_BASE;
 	struct boot_file_head *egon_head = (void *)buffer;
+	struct toc0_main_info *toc0_info = (void *)buffer;
 	int bootpart = EXT_CSD_EXTRACT_BOOT_PART(mmc->part_config);
 	uint32_t spl_size, emmc_checksum, chksum = 0;
 	ulong count;
@@ -390,11 +391,17 @@ static bool sunxi_valid_emmc_boot(struct mmc *mmc)
 
 	/* Read the first block to do some sanity checks on the eGON header. */
 	count = blk_dread(bd, 0, 1, buffer);
-	if (count != 1 || !sunxi_egon_valid(egon_head))
+	if (count != 1)
+		return false;
+
+	if (sunxi_egon_valid(egon_head))
+		spl_size = egon_head->length;
+	else if (sunxi_toc0_valid(toc0_info))
+		spl_size = toc0_info->length;
+	else
 		return false;
 
 	/* Read the rest of the SPL now we know it's halfway sane. */
-	spl_size = buffer[4];
 	count = blk_dread(bd, 1, DIV_ROUND_UP(spl_size, bd->blksz) - 1,
 			  buffer + bd->blksz / 4);
 
-- 
2.35.5

