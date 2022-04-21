Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E5554686
	for <linux-sunxi@lists.linux.dev>; Thu, 21 Apr 2022 00:45:44 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 252F81477;
	Wed, 20 Apr 2022 17:35:42 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EF4743F766;
	Wed, 20 Apr 2022 17:35:40 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chris Morgan <macroalpha82@gmail.com>
Subject: [PATCH] sunxi: fix initial environment loading without MMC
Date: Thu, 21 Apr 2022 01:34:48 +0100
Message-Id: <20220421003448.4517-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.3
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit e42dad4168fe ("sunxi: use boot source for determining environment
location") changed our implementation of env_get_location() and enabled
it for every board, even those without MMC support (like the C.H.I.P.
boards). However the default fallback location of ENVL_FAT does not cope
very well without MMC support compiled in, so the board hangs when trying
to initially load the environment.

Change the default fallback location to be ENVL_FAT only when the FAT
environment support is enabled, and use ENVL_NOWHERE and ENVL_UBI as
alternative fallbacks, when those sources are enabled.

This fixes U-Boot loading on the C.H.I.P. boards.

Fixes: e42dad4168fe ("sunxi: use boot source for determining environment location")
Reported-by: Chris Morgan <macroalpha82@gmail.com>
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 board/sunxi/board.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/board/sunxi/board.c b/board/sunxi/board.c
index 89324159d55..befb6076ca6 100644
--- a/board/sunxi/board.c
+++ b/board/sunxi/board.c
@@ -132,7 +132,14 @@ void i2c_init_board(void)
  */
 enum env_location env_get_location(enum env_operation op, int prio)
 {
-	enum env_location boot_loc = ENVL_FAT;
+	enum env_location boot_loc;
+
+	if (IS_ENABLED(CONFIG_ENV_IS_NOWHERE))
+		boot_loc = ENVL_NOWHERE;
+	else if (IS_ENABLED(CONFIG_ENV_IS_IN_FAT))
+		boot_loc = ENVL_FAT;
+	else if (IS_ENABLED(CONFIG_ENV_IS_IN_UBI))
+		boot_loc = ENVL_UBI;
 
 	gd->env_load_prio = prio;
 
-- 
2.35.3

