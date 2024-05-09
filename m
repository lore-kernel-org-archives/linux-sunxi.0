Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2295376E1
	for <linux-sunxi@lists.linux.dev>; Thu,  9 May 2024 23:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715296438; cv=none; b=ddhrC/L98BZWBTWDn94aEimJ8E/FD7DlnMLteRgY1cce68fhnW2g+mvStIeyo3/XVYuTxcSQzJawTmctICy9IBjZujWCylbSkmVDvKvGvrmoSwR8oQAXQdIV3YQanbU8mmbqrw8+Z0mRhjDDFitpTtjwOue1ewRlDGOzefEoFSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715296438; c=relaxed/simple;
	bh=A0wfqwn8cWADq7sPG9Ba2xipOfBpcPycF7lMZdqCQ+8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RDKQN05IrVmwqQmhMq/HrrFV7xbacEjaqgDUJ6ZoLD7C//9zqLIyvfXC5Ibfck7dWbSxQh4K0FP/Z+lnRlet0rI+7yGo9BUCL4wLFB1MF+CRm3CYtrw8GpGlZNoPYtJ6Olowx/mJ94UfRYGre6oGvxnEewd99GKkJiCBn/lw+7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EEBC9106F;
	Thu,  9 May 2024 16:14:19 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AEFB03F6A8;
	Thu,  9 May 2024 16:13:53 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Chris Morgan <macromorgan@hotmail.com>,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH] sunxi: spl: h616: fix booting from high MMC offset
Date: Fri, 10 May 2024 00:13:16 +0100
Message-Id: <20240509231316.11391-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.8
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The BootROM in the Allwinner H616 tries to load the initial boot code
from sector 16 (8KB) of an SD card or eMMC device, but also looks at
sector 512 (256KB). This helps with GPT formatted cards.
A "high" boot offset is also used on previous SoCs, but it's sector 256
(128KB) there instead.

Extend the existing offset calculation code to consider the different
sector offset when running on an H616 SoC. This allows to load U-Boot
on any H616 device when the SPL is not located at 8KB.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/mach-sunxi/board.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-sunxi/board.c b/arch/arm/mach-sunxi/board.c
index 0140b07d32a..046e9fbfc67 100644
--- a/arch/arm/mach-sunxi/board.c
+++ b/arch/arm/mach-sunxi/board.c
@@ -333,7 +333,8 @@ uint32_t sunxi_get_spl_size(void)
  * The eGON SPL image can be located at 8KB or at 128KB into an SD card or
  * an eMMC device. The boot source has bit 4 set in the latter case.
  * By adding 120KB to the normal offset when booting from a "high" location
- * we can support both cases.
+ * we can support both cases. The H616 has the alternative location
+ * moved up to 256 KB instead of 128KB, so cater for that, too.
  * Also U-Boot proper is located at least 32KB after the SPL, but will
  * immediately follow the SPL if that is bigger than that.
  */
@@ -349,6 +350,8 @@ unsigned long board_spl_mmc_get_uboot_raw_sector(struct mmc *mmc,
 	case SUNXI_BOOTED_FROM_MMC0_HIGH:
 	case SUNXI_BOOTED_FROM_MMC2_HIGH:
 		sector += (128 - 8) * 2;
+		if (IS_ENABLED(CONFIG_MACH_SUN50I_H616))
+			sector += 128 * 2;
 		break;
 	}
 
-- 
2.35.8

