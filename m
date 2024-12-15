Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0772E149C69
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Dec 2024 22:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734300861; cv=none; b=rEyx8pubuXo1IJ6hxi+JR2Ju23ZpB/Cu4f98ugW4sxWqq7l2CC9mtV2yhgAYVzRxSQElCXCH7R/zyFahjc8jzVlrg4ksKSixdWr0oreLDvjrY6CgbMFKRykWmXm9uM1EDdmTnYs0Jy8N+ZXvw0G6m8uZ6OFsC6z1Xof+mFhGtcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734300861; c=relaxed/simple;
	bh=NphsdjWqC0+C2rvDhSr+aadV5LXSNPxgbnEdEp40V+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UVZ5Hfivp+QsAr5T9/oYQ1ippqPAWZlcJgmj7ZR4rXrJyvA7iPJNg8kmBHcQEyPFsv5aRhiVCslkoCQsGxIl1OD94JH/2osOnv3njQfwqiTvx/KwLAFXz5iT0PFJhJd8VsMiz3vbV/6SAa0dKuyCmfWJoo2TiE0678TxLX9Fojs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3074B11FB;
	Sun, 15 Dec 2024 14:14:47 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 214833F720;
	Sun, 15 Dec 2024 14:14:18 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Chen-Yu Tsai <wens@csie.org>,
	Leon Anavi <leon.anavi@konsulko.com>,
	lhristov@gmail.com
Subject: [PATCH] power: pmic: sunxi: guard DCDC5 separately
Date: Sun, 15 Dec 2024 22:13:31 +0000
Message-ID: <20241215221331.28461-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

So far all sunxi boards programming the DCDC1 power rail on the AXP PMIC
also set the DCDC5 rail, so we could handle both with the same DCDC1
guard.
Some boards using the AXP313 will need to set DCDC1 now as well, and
since the AXP313 only has three buck converters, there will be no DCDC5,
so this trick is not going to work anymore.

Don't try to be too clever, and just protect programming the two DCDC
rails with two separate guards.

This has the interesting side effect of fixing operation on A80 boards,
using the AXP809 PMIC. Apparently programming DCDC5 right after DCDC1,
but before the other three rails caused some glitch, which made the board
hang during Linux boot, during the PSCI handler in U-Boot. Just keeping
the old setup order (DCDC1,2,3,4,5) will make those boards boot to the
Linux prompt again.

Fixes: ffb02942fab024d4a9b6a ("sunxi: board: simplify early PMIC setup conditions")
Reported-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 board/sunxi/board.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/board/sunxi/board.c b/board/sunxi/board.c
index 824c322a0dc..9c340908a96 100644
--- a/board/sunxi/board.c
+++ b/board/sunxi/board.c
@@ -577,7 +577,6 @@ void sunxi_board_init(void)
 
 #ifdef CONFIG_AXP_DCDC1_VOLT
 	power_failed |= axp_set_dcdc1(CONFIG_AXP_DCDC1_VOLT);
-	power_failed |= axp_set_dcdc5(CONFIG_AXP_DCDC5_VOLT);
 #endif
 #ifdef CONFIG_AXP_DCDC2_VOLT
 	power_failed |= axp_set_dcdc2(CONFIG_AXP_DCDC2_VOLT);
@@ -586,6 +585,9 @@ void sunxi_board_init(void)
 #ifdef CONFIG_AXP_DCDC4_VOLT
 	power_failed |= axp_set_dcdc4(CONFIG_AXP_DCDC4_VOLT);
 #endif
+#ifdef CONFIG_AXP_DCDC5_VOLT
+	power_failed |= axp_set_dcdc5(CONFIG_AXP_DCDC5_VOLT);
+#endif
 
 #ifdef CONFIG_AXP_ALDO1_VOLT
 	power_failed |= axp_set_aldo1(CONFIG_AXP_ALDO1_VOLT);
-- 
2.46.2

