Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 582033AC34
	for <linux-sunxi@lists.linux.dev>; Wed, 18 Oct 2023 15:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD77F2F4;
	Wed, 18 Oct 2023 08:51:05 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.manchester.arm.com [10.32.101.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C7193F64C;
	Wed, 18 Oct 2023 08:50:23 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
	Jaehoon Chung <jh80.chung@samsung.com>
Cc: Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	SASANO Takayoshi <uaa@mx5.nisiq.net>,
	Mikhail Kalashnikov <iuncuim@gmail.com>,
	Piotr Oniszczuk <piotr.oniszczuk@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 3/3] power: regulator: add AXP313 support
Date: Wed, 18 Oct 2023 16:50:14 +0100
Message-Id: <20231018155014.383566-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231018155014.383566-1-andre.przywara@arm.com>
References: <20231018155014.383566-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The X-Powers AXP313a is a small PMIC with just three buck converters and
three LDOs, one of which is actually fixed (so not modelled here).

Add the compatible string and the respective regulator ranges to allow
drivers to adjust voltages.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/power/pmic/axp.c                |  1 +
 drivers/power/regulator/axp_regulator.c | 17 +++++++++++++++++
 include/axp_pmic.h                      |  1 +
 3 files changed, 19 insertions(+)

diff --git a/drivers/power/pmic/axp.c b/drivers/power/pmic/axp.c
index 025dac24f28..0e1e45fba74 100644
--- a/drivers/power/pmic/axp.c
+++ b/drivers/power/pmic/axp.c
@@ -87,6 +87,7 @@ static const struct udevice_id axp_pmic_ids[] = {
 	{ .compatible = "x-powers,axp209", .data = AXP209_ID },
 	{ .compatible = "x-powers,axp221", .data = AXP221_ID },
 	{ .compatible = "x-powers,axp223", .data = AXP223_ID },
+	{ .compatible = "x-powers,axp313a", .data = AXP313_ID },
 	{ .compatible = "x-powers,axp803", .data = AXP803_ID },
 	{ .compatible = "x-powers,axp806", .data = AXP806_ID },
 	{ .compatible = "x-powers,axp809", .data = AXP809_ID },
diff --git a/drivers/power/regulator/axp_regulator.c b/drivers/power/regulator/axp_regulator.c
index 02f320eac1e..d27e09538e0 100644
--- a/drivers/power/regulator/axp_regulator.c
+++ b/drivers/power/regulator/axp_regulator.c
@@ -173,6 +173,22 @@ static const struct axp_regulator_plat axp22x_regulators[] = {
 	{ }
 };
 
+/*
+ * The "dcdc1" regulator has another range, beyond 1.54V up to 3.4V, in
+ * steps of 100mV. We cannot model this easily, but also don't need that,
+ * since it's typically only used for ~1.1V anyway, so just ignore it.
+ * Also the DCDC3 regulator is described wrongly in the (available) manual,
+ * experiments show that the split point is at 1200mV, as for DCDC1/2.
+ */
+static const struct axp_regulator_plat axp313_regulators[] = {
+	{ "dcdc1", 0x10, BIT(0), 0x13, 0x7f,  500, 1540,  10, 70 },
+	{ "dcdc2", 0x10, BIT(1), 0x14, 0x7f,  500, 1540,  10, 70 },
+	{ "dcdc3", 0x10, BIT(2), 0x15, 0x7f,  500, 1840,  10, 70 },
+	{ "aldo1", 0x10, BIT(3), 0x16, 0x1f,  500, 3500, 100, NA },
+	{ "dldo1", 0x10, BIT(4), 0x17, 0x1f,  500, 3500, 100, NA },
+	{ }
+};
+
 static const struct axp_regulator_plat axp803_regulators[] = {
 	{ "dcdc1", 0x10, BIT(0), 0x20, 0x1f, 1600, 3400, 100, NA },
 	{ "dcdc2", 0x10, BIT(1), 0x21, 0x7f,  500, 1300,  10, 70 },
@@ -274,6 +290,7 @@ static const struct axp_regulator_plat *const axp_regulators[] = {
 	[AXP209_ID]	= axp20x_regulators,
 	[AXP221_ID]	= axp22x_regulators,
 	[AXP223_ID]	= axp22x_regulators,
+	[AXP313_ID]	= axp313_regulators,
 	[AXP803_ID]	= axp803_regulators,
 	[AXP806_ID]	= axp806_regulators,
 	[AXP809_ID]	= axp809_regulators,
diff --git a/include/axp_pmic.h b/include/axp_pmic.h
index 4ac64865831..aabafc8501b 100644
--- a/include/axp_pmic.h
+++ b/include/axp_pmic.h
@@ -32,6 +32,7 @@ enum {
 	AXP209_ID,
 	AXP221_ID,
 	AXP223_ID,
+	AXP313_ID,
 	AXP803_ID,
 	AXP806_ID,
 	AXP809_ID,
-- 
2.25.1

