Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE0A0191
	for <linux-sunxi@lists.linux.dev>; Wed, 14 Dec 2022 00:24:47 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 42C171515;
	Tue, 13 Dec 2022 16:25:22 -0800 (PST)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AB1F33F71E;
	Tue, 13 Dec 2022 16:24:40 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Samuel Holland <samuel@sholland.org>,
	Tom Rini <trini@konsulko.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 1/4] sunxi: remove unused CONFIG_MMC_SUNXI_SLOT
Date: Wed, 14 Dec 2022 00:22:41 +0000
Message-Id: <20221214002244.31479-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.5
In-Reply-To: <20221214002244.31479-1-andre.przywara@arm.com>
References: <20221214002244.31479-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a CONFIG_MMC_SUNXI_SLOT definition in our sunxi_common.h config
header, which was used to note the first MMC controller to initialise.
The definition in that header was always set to 0, with no easy way of
overriding this, and certainly none of the existing boards made any use
of that (non-)feature.
Remove that definition and replace it with a constant 0 in the only
user, in board.c. It turns out that this is safe, as this is only used
in the SPL, and the BROM also unconditionally initialises MMC0.
This also removes the last legacy config symbol with SUN*I in it from
the whitelist.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 board/sunxi/board.c            | 9 +++++++--
 include/configs/sunxi-common.h | 3 ---
 scripts/config_whitelist.txt   | 1 -
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/board/sunxi/board.c b/board/sunxi/board.c
index 21a2407e062..4d2491b5a86 100644
--- a/board/sunxi/board.c
+++ b/board/sunxi/board.c
@@ -525,9 +525,14 @@ static void mmc_pinmux_setup(int sdc)
 
 int board_mmc_init(struct bd_info *bis)
 {
+	/*
+	 * The BROM always accesses MMC port 0 (typically an SD card), and
+	 * most boards seem to have such a slot. The others haven't reported
+	 * any problem with unconditionally enabling this in the SPL.
+	 */
 	if (!IS_ENABLED(CONFIG_UART0_PORT_F)) {
-		mmc_pinmux_setup(CONFIG_MMC_SUNXI_SLOT);
-		if (!sunxi_mmc_init(CONFIG_MMC_SUNXI_SLOT))
+		mmc_pinmux_setup(0);
+		if (!sunxi_mmc_init(0))
 			return -1;
 	}
 
diff --git a/include/configs/sunxi-common.h b/include/configs/sunxi-common.h
index 720768629d6..e89ad42ce8d 100644
--- a/include/configs/sunxi-common.h
+++ b/include/configs/sunxi-common.h
@@ -75,9 +75,6 @@
 #define CONFIG_SYS_NAND_MAX_ECCPOS 1664
 #endif
 
-/* mmc config */
-#define CONFIG_MMC_SUNXI_SLOT		0
-
 /*
  * Miscellaneous configurable options
  */
diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
index c0f55e41a50..ea71f9d2344 100644
--- a/scripts/config_whitelist.txt
+++ b/scripts/config_whitelist.txt
@@ -153,7 +153,6 @@ CONFIG_MISC_COMMON
 CONFIG_MIU_2BIT_21_7_INTERLEAVED
 CONFIG_MIU_2BIT_INTERLEAVED
 CONFIG_MMC_DEFAULT_DEV
-CONFIG_MMC_SUNXI_SLOT
 CONFIG_MONITOR_IS_IN_RAM
 CONFIG_MPC85XX_FEC
 CONFIG_MPC85XX_FEC_NAME
-- 
2.35.5

