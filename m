Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFCFA1A9F8D
	for <linux-sunxi@lists.linux.dev>; Fri, 20 Mar 2026 04:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.181.215.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773982621; cv=none; b=YNv9Hr0w5F64unixxC1V9r4jfg5qRDk9JMmrSU/QgCkguuY0u8ZLAts3BvhzFTSf2bD5FUlfedEKjo2p/j0vcKhJjccW2GrbtlycLTqMTciYYR7XGnZYmPTk7KE/JQN/Ij1Cxp8i7AlM5DtusV6DwwowOFdjGW5JeszACnjDNpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773982621; c=relaxed/simple;
	bh=KHh3CtkKK5zTD136B7hz+Zo/41KC5mY6VMrHuC0yZ+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pz8kyAUgHmgSIPUfHWO8Dw73fWvcKqaR4kye6LPmfoE1OKsZ/afOEbimnh4Ux3vtSdwYX6ccKd544DBxQCa4GcLe3zJ0RIs4QdGOxrRYD5Jk9CTeD5oxk9QrTcdbBTbJOrgQXJRjkfyM0m7Tg+A6UY/u5Yr5M9dbUThLXG3wfrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xff.cz; spf=pass smtp.mailfrom=xff.cz; dkim=pass (1024-bit key) header.d=xff.cz header.i=@xff.cz header.b=E+e+kFiR; arc=none smtp.client-ip=195.181.215.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xff.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xff.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xff.cz header.i=@xff.cz header.b="E+e+kFiR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
	t=1773578975; bh=KHh3CtkKK5zTD136B7hz+Zo/41KC5mY6VMrHuC0yZ+Y=;
	h=From:To:Cc:Subject:Date:From;
	b=E+e+kFiR1YmDVSNoJfVqp/AyZhzsAFyTlSkYk9sao8yQD96WLjp0PRitRZLIMNylH
	 P9+yDfX/BwW4qSSGo+KuRef0E7lCdV4+2Tgg+qB679o2e/SGpjKd2ZD9IQ0mwOq6O3
	 fvyYHA5QcV24KMMittyEHBXDpGsl0tR+vCYsG2yY=
From: =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megi@xff.cz>
To: linux-sunxi@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Ondrej Jirman <megi@xff.cz>,
	Lee Jones <lee@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>
Subject: [PATCH] mfd: axp20x: Change volatile ranges on axp803
Date: Sun, 15 Mar 2026 13:49:31 +0100
Message-ID: <20260315124932.3669260-1-megi@xff.cz>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ondrej Jirman <megi@xff.cz>

Regulator control registers can be cached. They don't update by
themselves. Enable cache on them, to speed up voltage changes,
particularly DCDC2 which needs to be handled quickly due to being used
for CPUX cores and is changed very frequently by some cpufreq schedulers.

This shrinks register access over RSB bus to one write per voltage
change (down from 4 or so).

Signed-off-by: Ondrej Jirman <megi@xff.cz>
---
 drivers/mfd/axp20x.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
index 0d0d40972eb8..2ea409029d2f 100644
--- a/drivers/mfd/axp20x.c
+++ b/drivers/mfd/axp20x.c
@@ -172,6 +172,18 @@ static const struct regmap_range axp288_volatile_ranges[] = {
 	regmap_reg_range(AXP20X_FG_RES, AXP288_FG_CC_CAP_REG),
 };
 
+static const struct regmap_range axp803_volatile_ranges[] = {
+	regmap_reg_range(AXP20X_PWR_INPUT_STATUS, AXP288_POWER_REASON),
+	regmap_reg_range(AXP288_BC_GLOBAL, AXP288_BC_GLOBAL),
+	regmap_reg_range(AXP288_BC_DET_STAT, AXP20X_VBUS_IPSOUT_MGMT),
+	regmap_reg_range(AXP20X_CHRG_BAK_CTRL, AXP20X_CHRG_BAK_CTRL),
+	regmap_reg_range(AXP20X_IRQ1_EN, AXP20X_IPSOUT_V_HIGH_L),
+	regmap_reg_range(AXP20X_TIMER_CTRL, AXP20X_TIMER_CTRL),
+	regmap_reg_range(AXP20X_GPIO1_CTRL, AXP22X_GPIO_STATE),
+	regmap_reg_range(AXP288_RT_BATT_V_H, AXP288_RT_BATT_V_L),
+	regmap_reg_range(AXP20X_FG_RES, AXP288_FG_CC_CAP_REG),
+};
+
 static const struct regmap_access_table axp288_writeable_table = {
 	.yes_ranges	= axp288_writeable_ranges,
 	.n_yes_ranges	= ARRAY_SIZE(axp288_writeable_ranges),
@@ -182,6 +194,11 @@ static const struct regmap_access_table axp288_volatile_table = {
 	.n_yes_ranges	= ARRAY_SIZE(axp288_volatile_ranges),
 };
 
+static const struct regmap_access_table axp803_volatile_table = {
+	.yes_ranges	= axp803_volatile_ranges,
+	.n_yes_ranges	= ARRAY_SIZE(axp803_volatile_ranges),
+};
+
 static const struct regmap_range axp806_writeable_ranges[] = {
 	regmap_reg_range(AXP20X_DATACACHE(0), AXP20X_DATACACHE(3)),
 	regmap_reg_range(AXP806_PWR_OUT_CTRL1, AXP806_CLDO3_V_CTRL),
@@ -456,6 +473,15 @@ static const struct regmap_config axp22x_regmap_config = {
 	.cache_type	= REGCACHE_MAPLE,
 };
 
+static const struct regmap_config axp803_regmap_config = {
+	.reg_bits	= 8,
+	.val_bits	= 8,
+	.wr_table	= &axp288_writeable_table,
+	.volatile_table	= &axp803_volatile_table,
+	.max_register	= AXP288_FG_TUNE5,
+	.cache_type	= REGCACHE_MAPLE,
+};
+
 static const struct regmap_config axp288_regmap_config = {
 	.reg_bits	= 8,
 	.val_bits	= 8,
@@ -1368,7 +1394,7 @@ int axp20x_match_device(struct axp20x_dev *axp20x)
 	case AXP803_ID:
 		axp20x->nr_cells = ARRAY_SIZE(axp803_cells);
 		axp20x->cells = axp803_cells;
-		axp20x->regmap_cfg = &axp288_regmap_config;
+		axp20x->regmap_cfg = &axp803_regmap_config;
 		axp20x->regmap_irq_chip = &axp803_regmap_irq_chip;
 		break;
 	case AXP806_ID:
-- 
2.53.0

