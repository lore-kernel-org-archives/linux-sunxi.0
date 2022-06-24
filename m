Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1BC033E9
	for <linux-sunxi@lists.linux.dev>; Fri, 24 Jun 2022 16:12:44 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 556171042;
	Fri, 24 Jun 2022 09:12:44 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B3933F534;
	Fri, 24 Jun 2022 09:12:43 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Simon Glass <sjg@chromium.org>,
	Tom Rini <trini@konsulko.com>,
	Samuel Holland <samuel@sholland.org>,
	Chris Morgan <macroalpha82@gmail.com>,
	u-boot@lists.denx.de,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2] sunxi: fix initial environment loading without MMC
Date: Fri, 24 Jun 2022 17:12:09 +0100
Message-Id: <20220624161209.1644097-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Samuel Holland <samuel@sholland.org>

Commit e42dad4168fe ("sunxi: use boot source for determining environment
location") changed our implementation of env_get_location() and enabled
it for every board, even those without MMC support (like the C.H.I.P.
boards). However the default fallback location of ENVL_FAT requires MMC
support compiled in, so the board hangs when trying to initially load
the environment.

Change the algorithm to only return configured environment locations,
and improve the fallback algorithm on the way.

The env_init() routine calling this function here does not behave well
if the return value is ENVL_UNKNOWN on the very first call: it will make
U-Boot proper silently hang very early.
Work around this issue by making sure we return some configured (dummy)
environment location when prio is 0. This for instance happens when
booting via FEL.

This fixes U-Boot loading on the C.H.I.P. boards.

Fixes: e42dad4168fe ("sunxi: use boot source for determining environment location")
Reported-by: Chris Morgan <macroalpha82@gmail.com>
Signed-off-by: Samuel Holland <samuel@sholland.org>
[Andre: fix FEL boot case by not returning ENVL_UNKNOWN when prio==0]
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
Hi Samuel,

I cheekily added your Signed-off-by:, as I made this your patch (since
you came up with it in that email reply some weeks ago). I hope that's
fine.
I tested this briefly on a Pine64-LTS, booting from FEL, SD card, eMMC
and SPI. I also simulated a CHIP board, by just defining ENV_IS_NOWHERE,
then booting, as this was the case that broke.
If no one complains, I would like to push this ASAP, to make it into
the 2022.07 release still.

Cheers,
Andre

 board/sunxi/board.c | 49 +++++++++++++++++++++++++++------------------
 1 file changed, 29 insertions(+), 20 deletions(-)

diff --git a/board/sunxi/board.c b/board/sunxi/board.c
index 806e3bcb69..21a2407e06 100644
--- a/board/sunxi/board.c
+++ b/board/sunxi/board.c
@@ -128,26 +128,37 @@ void i2c_init_board(void)
  * Try to use the environment from the boot source first.
  * For MMC, this means a FAT partition on the boot device (SD or eMMC).
  * If the raw MMC environment is also enabled, this is tried next.
+ * When booting from NAND we try UBI first, then NAND directly.
  * SPI flash falls back to FAT (on SD card).
  */
 enum env_location env_get_location(enum env_operation op, int prio)
 {
-	enum env_location boot_loc = ENVL_FAT;
+	if (prio > 1)
+		return ENVL_UNKNOWN;
 
-	gd->env_load_prio = prio;
+	/* NOWHERE is exclusive, no other option can be defined. */
+	if (IS_ENABLED(CONFIG_ENV_IS_NOWHERE))
+		return ENVL_NOWHERE;
 
 	switch (sunxi_get_boot_device()) {
 	case BOOT_DEVICE_MMC1:
 	case BOOT_DEVICE_MMC2:
-		boot_loc = ENVL_FAT;
+		if (prio == 0 && IS_ENABLED(CONFIG_ENV_IS_IN_FAT))
+			return ENVL_FAT;
+		if (IS_ENABLED(CONFIG_ENV_IS_IN_MMC))
+			return ENVL_MMC;
 		break;
 	case BOOT_DEVICE_NAND:
+		if (prio == 0 && IS_ENABLED(CONFIG_ENV_IS_IN_UBI))
+			return ENVL_UBI;
 		if (IS_ENABLED(CONFIG_ENV_IS_IN_NAND))
-			boot_loc = ENVL_NAND;
+			return ENVL_NAND;
 		break;
 	case BOOT_DEVICE_SPI:
-		if (IS_ENABLED(CONFIG_ENV_IS_IN_SPI_FLASH))
-			boot_loc = ENVL_SPI_FLASH;
+		if (prio == 0 && IS_ENABLED(CONFIG_ENV_IS_IN_SPI_FLASH))
+			return ENVL_SPI_FLASH;
+		if (IS_ENABLED(CONFIG_ENV_IS_IN_FAT))
+			return ENVL_FAT;
 		break;
 	case BOOT_DEVICE_BOARD:
 		break;
@@ -155,21 +166,19 @@ enum env_location env_get_location(enum env_operation op, int prio)
 		break;
 	}
 
-	/* Always try to access the environment on the boot device first. */
-	if (prio == 0)
-		return boot_loc;
-
-	if (prio == 1) {
-		switch (boot_loc) {
-		case ENVL_SPI_FLASH:
+	/*
+	 * If we come here for the first time, we *must* return a valid
+	 * environment location other than ENVL_UNKNOWN, or the setup sequence
+	 * in board_f() will silently hang. This is arguably a bug in
+	 * env_init(), but for now pick one environment for which we know for
+	 * sure to have a driver for. For all defconfigs this is either FAT
+	 * or UBI, or NOWHERE, which is already handled above.
+	 */
+	if (prio == 0) {
+		if (IS_ENABLED(CONFIG_ENV_IS_IN_FAT))
 			return ENVL_FAT;
-		case ENVL_FAT:
-			if (IS_ENABLED(CONFIG_ENV_IS_IN_MMC))
-				return ENVL_MMC;
-			break;
-		default:
-			break;
-		}
+		if (IS_ENABLED(CONFIG_ENV_IS_IN_UBI))
+			return ENVL_UBI;
 	}
 
 	return ENVL_UNKNOWN;
-- 
2.25.1

