Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD0A81547C0
	for <linux-sunxi@lists.linux.dev>; Thu,  3 Oct 2024 11:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727954109; cv=none; b=s+pw4eu/plC+BT08cQTr2ce6NC+AmRPbQ6sOCNeaW2BMPuj0KZpLCv+NFNxrWSzG5I1FuctFtpcEhi4Jjkc41Sx5sdb5yXUuaxhYttbKV+ySFxbbDLGOT1moo9DS6eLb6CzoR3jLVsVtynstFDJUBW7FQn65lwi7cjT+QNJa8zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727954109; c=relaxed/simple;
	bh=iuJIo5xHSieU5ZzP0xX3qWpAQCVTSyqz/s/+XbJTuNg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jf956Ac7AnHCoHGi1kb/hm3aVmDFWbz9OcWH/F2rjbPXb5lU75iJnfO08IYKeKq8b1Oe5Jsp9TDKZ6k0rT5ud1iuBqxchBi6JgWo9rH8W+FtdfgK7YIy8Sg3fb2+e3hcGPAULf1wlzH2+gX0ZzTuRpg082SCRdaGc5WrmQCR6vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B53A3339;
	Thu,  3 Oct 2024 04:15:36 -0700 (PDT)
Received: from e110479.arm.com (unknown [10.57.55.26])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4F8043F640;
	Thu,  3 Oct 2024 04:15:04 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Botka <martin.botka@somainline.org>,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 2/5] mfd: axp20x: ensure relationship between IDs and model names
Date: Thu,  3 Oct 2024 12:14:41 +0100
Message-Id: <20241003111444.543964-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241003111444.543964-1-andre.przywara@arm.com>
References: <20241003111444.543964-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

At the moment there is an implicit relationship between the AXP model
IDs and the order of the strings in the axp20x_model_names[] array.
This is fragile, and makes adding IDs in the middle error prone.

Make this relationship official by changing the ID type to the actual
enum used, and using indexed initialisers for the string list.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/mfd/axp20x.c                 | 30 ++++++++++++++--------------
 drivers/regulator/axp20x-regulator.c |  2 +-
 include/linux/mfd/axp20x.h           |  2 +-
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
index 4051551757f2..5ceea359289f 100644
--- a/drivers/mfd/axp20x.c
+++ b/drivers/mfd/axp20x.c
@@ -34,20 +34,20 @@
 #define AXP806_REG_ADDR_EXT_ADDR_SLAVE_MODE	BIT(4)
 
 static const char * const axp20x_model_names[] = {
-	"AXP152",
-	"AXP192",
-	"AXP202",
-	"AXP209",
-	"AXP221",
-	"AXP223",
-	"AXP288",
-	"AXP313a",
-	"AXP717",
-	"AXP803",
-	"AXP806",
-	"AXP809",
-	"AXP813",
-	"AXP15060",
+	[AXP152_ID] = "AXP152",
+	[AXP192_ID] = "AXP192",
+	[AXP202_ID] = "AXP202",
+	[AXP209_ID] = "AXP209",
+	[AXP221_ID] = "AXP221",
+	[AXP223_ID] = "AXP223",
+	[AXP288_ID] = "AXP288",
+	[AXP313A_ID] = "AXP313a",
+	[AXP717_ID] = "AXP717",
+	[AXP803_ID] = "AXP803",
+	[AXP806_ID] = "AXP806",
+	[AXP809_ID] = "AXP809",
+	[AXP813_ID] = "AXP813",
+	[AXP15060_ID] = "AXP15060",
 };
 
 static const struct regmap_range axp152_writeable_ranges[] = {
@@ -1345,7 +1345,7 @@ int axp20x_match_device(struct axp20x_dev *axp20x)
 		axp20x->regmap_irq_chip = &axp15060_regmap_irq_chip;
 		break;
 	default:
-		dev_err(dev, "unsupported AXP20X ID %lu\n", axp20x->variant);
+		dev_err(dev, "unsupported AXP20X ID %u\n", axp20x->variant);
 		return -EINVAL;
 	}
 
diff --git a/drivers/regulator/axp20x-regulator.c b/drivers/regulator/axp20x-regulator.c
index a8e91d9d028b..3ba76dbd0fb9 100644
--- a/drivers/regulator/axp20x-regulator.c
+++ b/drivers/regulator/axp20x-regulator.c
@@ -1597,7 +1597,7 @@ static int axp20x_regulator_probe(struct platform_device *pdev)
 		nregulators = AXP15060_REG_ID_MAX;
 		break;
 	default:
-		dev_err(&pdev->dev, "Unsupported AXP variant: %ld\n",
+		dev_err(&pdev->dev, "Unsupported AXP variant: %d\n",
 			axp20x->variant);
 		return -EINVAL;
 	}
diff --git a/include/linux/mfd/axp20x.h b/include/linux/mfd/axp20x.h
index f4dfc1871a95..79ecaaaa2070 100644
--- a/include/linux/mfd/axp20x.h
+++ b/include/linux/mfd/axp20x.h
@@ -959,7 +959,7 @@ struct axp20x_dev {
 	unsigned long			irq_flags;
 	struct regmap			*regmap;
 	struct regmap_irq_chip_data	*regmap_irqc;
-	long				variant;
+	enum axp20x_variants		variant;
 	int                             nr_cells;
 	const struct mfd_cell           *cells;
 	const struct regmap_config	*regmap_cfg;
-- 
2.25.1

