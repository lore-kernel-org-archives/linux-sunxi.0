Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC36710FE
	for <linux-sunxi@lists.linux.dev>; Wed,  3 Jan 2024 00:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 75D371516;
	Tue,  2 Jan 2024 16:14:24 -0800 (PST)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 89BF53F5A1;
	Tue,  2 Jan 2024 16:13:37 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Samuel Holland <samuel@sholland.org>,
	linux-sunxi@lists.linux.dev,
	u-boot@lists.denx.de
Subject: [PATCH 08/19] sunxi: remove unneeded i2c_init_board() call for U-Boot proper
Date: Wed,  3 Jan 2024 00:12:28 +0000
Message-Id: <20240103001239.17482-9-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.8
In-Reply-To: <20240103001239.17482-1-andre.przywara@arm.com>
References: <20240103001239.17482-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver used for the Allwinner I2C IP is using proper DT and DM
enablement for a while: we enable the clock gate and de-assert the reset
line in the driver's probe() routine, and the pinmux setup is taken care
of by the DM framework.

This means the explicit call to the i2c_init_board() routine is not
needed for U-Boot proper. As the board_init() function in board.c is
only called for U-Boot proper, we can remove the call, something that
the comment there hinted at already.

Fix the comment for the board_init() function on the way: we were not
really doing board specific setup there. The fact that this function
is called from U-Boot proper only is probably more helpful for reasoning
about this code.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 board/sunxi/board.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/board/sunxi/board.c b/board/sunxi/board.c
index 8c12c8deade..1313b01dcea 100644
--- a/board/sunxi/board.c
+++ b/board/sunxi/board.c
@@ -186,7 +186,7 @@ enum env_location env_get_location(enum env_operation op, int prio)
 	return ENVL_UNKNOWN;
 }
 
-/* add board specific code here */
+/* called only from U-Boot proper */
 int board_init(void)
 {
 	__maybe_unused int id_pfr1, ret;
@@ -226,13 +226,6 @@ int board_init(void)
 	if (ret)
 		return ret;
 
-#if CONFIG_IS_ENABLED(DM_I2C)
-	/*
-	 * Temporary workaround for enabling I2C clocks until proper sunxi DM
-	 * clk, reset and pinctrl drivers land.
-	 */
-	i2c_init_board();
-#endif
 	eth_init_board();
 
 	return 0;
-- 
2.35.8

