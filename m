Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5DE77C
	for <linux-sunxi@lists.linux.dev>; Wed, 14 Dec 2022 00:24:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7827E168F;
	Tue, 13 Dec 2022 16:25:23 -0800 (PST)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E16223F71E;
	Tue, 13 Dec 2022 16:24:41 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Samuel Holland <samuel@sholland.org>,
	Tom Rini <trini@konsulko.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 2/4] sunxi: remove bogus mmc_pinmux_setup() prototype
Date: Wed, 14 Dec 2022 00:22:42 +0000
Message-Id: <20221214002244.31479-3-andre.przywara@arm.com>
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

Since all callers of mmc_pinmux_setup() are located after the definition
of that function, there is no need for a forward declaration (anymore?).

Remove the prototype along with its #ifdef guards.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 board/sunxi/board.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/board/sunxi/board.c b/board/sunxi/board.c
index 4d2491b5a86..4fe749feb39 100644
--- a/board/sunxi/board.c
+++ b/board/sunxi/board.c
@@ -184,10 +184,6 @@ enum env_location env_get_location(enum env_operation op, int prio)
 	return ENVL_UNKNOWN;
 }
 
-#ifdef CONFIG_DM_MMC
-static void mmc_pinmux_setup(int sdc);
-#endif
-
 /* add board specific code here */
 int board_init(void)
 {
-- 
2.35.5

