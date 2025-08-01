Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E5CD23A9A3
	for <linux-sunxi@lists.linux.dev>; Fri,  1 Aug 2025 23:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754092308; cv=none; b=I1FubWg/nW1abVHNX6HA0Z18ZlMMsbJ2+hTdsTsU76G5sx+aZrjVD83GUEeoTakPv6T7g1U+WUmzW+JcYJBYk6WDS8n+wxCHipUAvsqksDjol3bVfb06Q6NSF7wUPt2nS8L0shJD5GEUVLTbMkazNB476cT52ZFsyXNXgUTg/vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754092308; c=relaxed/simple;
	bh=U0ocPAT73F2+6pE4rYZsDzKyo40kQGtLDL9npKOHpCc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d81nq8rL6yNRJ9UFXvGFZ6t3vG6rh6M5EmIlXSheIxfbAaW3hfFI7MS88/Mu0L0Zwv1p55AcGS7xHBuJRQCHHl/4yTawbIE42zMXtvdLiI/8IWYHXwsMb1mwZEJaHuHa7gbRhM5xpwRrVWiDJwsJjsMGIc3NM53KvqzmVZihswk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C934B25E1;
	Fri,  1 Aug 2025 16:51:37 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E8BA93F673;
	Fri,  1 Aug 2025 16:51:44 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: u-boot@lists.denx.de
Cc: Tom Rini <trini@konsulko.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Cody Eksal <masterr3c0rd@epochal.quest>,
	Chris Morgan <macromorgan@hotmail.com>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 3/3] sunxi: H616: dram: fix LPDDR3 mode register settings
Date: Sat,  2 Aug 2025 00:49:18 +0100
Message-ID: <20250801234918.19176-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250801234918.19176-1-andre.przywara@arm.com>
References: <20250801234918.19176-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The JEDEC LPDDR3 spec defines mode register 0 (MR0) as being read-only,
so there is no point in trying to set its value.
Also the H616 memory controller encodes the mode register index to be
written starting from bit 8 in MRCTRL1 (for LPDDR3 and LPDDR4 chips), so
we need to OR in that number to tell the controller which MR to program.

On top of that, the mode registers between DDR3 and LPDDR3 are
completely different, so writing values crafted for DDR3 into a LPDDR3
chip is just wrong. Due to the above mentioned bugs the writes for
MR0-MR2 did not have any effect (as they were all trying to set the
read-only MR0), so the mode registers just stayed unchanged.

Looking at the LPDDR3 spec and the BSP code, let's write the proper MR
values into LPDDR3 chips, using the proper addressing mode.
Use the opportunity to document the LPDDR3 mode register bits written.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/mach-sunxi/dram_sun50i_h616.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-sunxi/dram_sun50i_h616.c b/arch/arm/mach-sunxi/dram_sun50i_h616.c
index 877181016f3..3345c9b8e82 100644
--- a/arch/arm/mach-sunxi/dram_sun50i_h616.c
+++ b/arch/arm/mach-sunxi/dram_sun50i_h616.c
@@ -1078,18 +1078,18 @@ static bool mctl_phy_init(const struct dram_para *para,
 		mctl_await_completion(&mctl_ctl->mrctrl0, BIT(31), 0);
 		break;
 	case SUNXI_DRAM_TYPE_LPDDR3:
-		writel(mr0, &mctl_ctl->mrctrl1);
-		writel(0x800000f0, &mctl_ctl->mrctrl0);
-		mctl_await_completion(&mctl_ctl->mrctrl0, BIT(31), 0);
-
-		writel(4, &mctl_ctl->mrctrl1);
+		/* MR0 is read-only */
+		/* MR1: nWR=14, BL8 */
+		writel(0x183, &mctl_ctl->mrctrl1);
 		writel(0x800000f0, &mctl_ctl->mrctrl0);
 		mctl_await_completion(&mctl_ctl->mrctrl0, BIT(31), 0);
 
-		writel(mr2, &mctl_ctl->mrctrl1);
+		/* MR2: no WR leveling, WL set A, use nWR>9, nRL=14/nWL=8 */
+		writel(0x21c, &mctl_ctl->mrctrl1);
 		writel(0x800000f0, &mctl_ctl->mrctrl0);
 		mctl_await_completion(&mctl_ctl->mrctrl0, BIT(31), 0);
 
+		/* MR3: 34.3 Ohm pull-up/pull-down resistor */
 		writel(0x301, &mctl_ctl->mrctrl1);
 		writel(0x800000f0, &mctl_ctl->mrctrl0);
 		mctl_await_completion(&mctl_ctl->mrctrl0, BIT(31), 0);
-- 
2.46.3

