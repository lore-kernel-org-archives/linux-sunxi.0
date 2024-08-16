Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 332CA61FC4
	for <linux-sunxi@lists.linux.dev>; Fri, 16 Aug 2024 00:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723767528; cv=none; b=FhMrDA6NmignZYby5xoRMXBsDW7yOTe+XD+NMa1W51JRaBEA3lprnAK9hweMPZALTpgHhc1xZqwStK/eXJFLvQBThIKOhuDGceG1MmvfKszPs0gf5IGNGun1A//CpNvLKDDs4ljZlB1c8chfG5izuQ62D53EqXm06sDqFJhbGfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723767528; c=relaxed/simple;
	bh=ovPVZ2QPwdoK7axLGodGEydS+uuPS2fQoqWFPxlv8dE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=V/Z/DGFCSREAmgVjPPaadvpq9kr/WdF5EYcx8hbu7UejCUQUmHb2SKHPThetaRPZ4DcdNLAmo2oFn31id42ci/kazMQli4oHJpAFLP6u1e8p0/GwvezolbSSypD533XBGIon9efgIQo9JlgnR4zK5ebs4Uz+rIiszd3VzhTjaSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A990C14BF;
	Thu, 15 Aug 2024 17:19:12 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D24623F6A8;
	Thu, 15 Aug 2024 17:18:44 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Chris Morgan <macroalpha82@gmail.com>,
	John Watts <contact@jookia.org>,
	Ryan Walklin <ryan@testtoast.com>,
	Philippe Simons <simons.philippe@gmail.com>
Subject: [PATCH v3 3/3] regulator: axp20x: AXP717: Add boost regulator
Date: Fri, 16 Aug 2024 01:18:24 +0100
Message-Id: <20240816001824.6028-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.39.4
In-Reply-To: <20240816001824.6028-1-andre.przywara@arm.com>
References: <20240816001824.6028-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AXP717 also contains an adjustable boost regulator, to provide the
5V USB VBUS rail when running on battery.

Add the regulator description that states the voltage range this
regulator can cover.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: John Watts <contact@jookia.org>
---
 drivers/regulator/axp20x-regulator.c | 4 ++++
 include/linux/mfd/axp20x.h           | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/regulator/axp20x-regulator.c b/drivers/regulator/axp20x-regulator.c
index f3c447ecdc3bf..a8e91d9d028b8 100644
--- a/drivers/regulator/axp20x-regulator.c
+++ b/drivers/regulator/axp20x-regulator.c
@@ -143,6 +143,7 @@
 #define AXP717_DCDC3_NUM_VOLTAGES	103
 #define AXP717_DCDC_V_OUT_MASK		GENMASK(6, 0)
 #define AXP717_LDO_V_OUT_MASK		GENMASK(4, 0)
+#define AXP717_BOOST_V_OUT_MASK		GENMASK(7, 4)
 
 #define AXP803_PWR_OUT_DCDC1_MASK	BIT_MASK(0)
 #define AXP803_PWR_OUT_DCDC2_MASK	BIT_MASK(1)
@@ -834,6 +835,9 @@ static const struct regulator_desc axp717_regulators[] = {
 	AXP_DESC(AXP717, CPUSLDO, "cpusldo", "vin1", 500, 1400, 50,
 		 AXP717_CPUSLDO_CONTROL, AXP717_LDO_V_OUT_MASK,
 		 AXP717_LDO1_OUTPUT_CONTROL, BIT(4)),
+	AXP_DESC(AXP717, BOOST, "boost", "vin1", 4550, 5510, 64,
+		 AXP717_BOOST_CONTROL, AXP717_BOOST_V_OUT_MASK,
+		 AXP717_MODULE_EN_CONTROL_2, BIT(4)),
 };
 
 /* DCDC ranges shared with AXP813 */
diff --git a/include/linux/mfd/axp20x.h b/include/linux/mfd/axp20x.h
index 3758f986491c8..e0cd66bd3b6d9 100644
--- a/include/linux/mfd/axp20x.h
+++ b/include/linux/mfd/axp20x.h
@@ -486,6 +486,7 @@ enum {
 	AXP717_CLDO3,
 	AXP717_CLDO4,
 	AXP717_CPUSLDO,
+	AXP717_BOOST,
 	AXP717_REG_ID_MAX,
 };
 
-- 
2.39.4

