Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 291083FE5
	for <linux-sunxi@lists.linux.dev>; Tue,  1 Feb 2022 01:41:46 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA5C5113E;
	Mon, 31 Jan 2022 17:41:45 -0800 (PST)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 28EE53F73B;
	Mon, 31 Jan 2022 17:41:44 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
	Tom Rini <trini@konsulko.com>,
	Simon Glass <sjg@chromium.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Icenowy Zheng <icenowy@aosc.io>,
	Jesse Taube <mr.bossman075@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 5/5] sunxi-common.h: remove pointless #ifdefs
Date: Tue,  1 Feb 2022 01:41:16 +0000
Message-Id: <20220201014116.25864-6-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20220201014116.25864-1-andre.przywara@arm.com>
References: <20220201014116.25864-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Remove some pointless #ifdefs from this file, as there are quite too
many of them already.

Some definitions don't really hurt to have in any case, so remove the
pointless CONFIG_MMC guard around CONFIG_MMC_SUNXI_SLOT.

The BOARD_SIZE_LIMIT applies regardless of ARM64 or not (now), so remove
that guard as well. The maximum number of MMC devices does not depend on
CONFIG_ENV_IS_IN_MMC, so move that out to simplify the file.

Last but not least CONFIG_SPL_BOARD_LOAD_IMAGE serves no real purpose
anymore: it's unconditionally defined for all sunxi boards, and protects
nothing applicable outside of sunxi code anymore. Just remove it.

Reviewed-by: Samuel Holland <samuel@sholland.org>
Reviewed-by: Simon Glass <sjg@chromium.org>
Tested-by: Simon Glass <sjg@chromium.org>
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 include/configs/sunxi-common.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/include/configs/sunxi-common.h b/include/configs/sunxi-common.h
index 7260eb72a40..01c3cfced20 100644
--- a/include/configs/sunxi-common.h
+++ b/include/configs/sunxi-common.h
@@ -93,13 +93,9 @@
 #endif
 
 /* mmc config */
-#ifdef CONFIG_MMC
 #define CONFIG_MMC_SUNXI_SLOT		0
-#endif
 
 #if defined(CONFIG_ENV_IS_IN_MMC)
-
-#ifdef CONFIG_ARM64
 /*
  * This is actually (CONFIG_ENV_OFFSET -
  * (CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_SECTOR * 512)), but the value will be used
@@ -109,7 +105,6 @@
 #endif
 
 #define CONFIG_SYS_MMC_MAX_DEVICE	4
-#endif
 
 /*
  * Miscellaneous configurable options
@@ -124,8 +119,6 @@
 
 #define CONFIG_SYS_MONITOR_LEN		(768 << 10)	/* 768 KiB */
 
-#define CONFIG_SPL_BOARD_LOAD_IMAGE
-
 /*
  * We cannot use expressions here, because expressions won't be evaluated in
  * autoconf.mk.
-- 
2.17.6

