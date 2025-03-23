Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A36B478F4C
	for <linux-sunxi@lists.linux.dev>; Sun, 23 Mar 2025 11:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742729798; cv=none; b=mEQdnatrU62DeH19K47NYaKh5CF5aZxaHUs+LoHbTrmZNZhWGw8R0Ft2JNpN9FXhh2uYa0iPm09NQCuzPIPYG+bT8hAZrSyItOmo93oQVDge4fAMx9PBHwo+cqqWFgP1H6GCi8eleEgp0S5P0bKLmLYUKjLGHn9mch5YGmW2PLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742729798; c=relaxed/simple;
	bh=6YMotUP4MwbfDsHHvnuGIKc7LwM7p9wNxzOgjvuCtiE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H54EYte2uZ5ZEqU637lFj2+yWC+LvoSsUtDwMn3Uqm0VnaO7XftVJqwsWdmkfoVopwu090rpIHLs5MfNQJUpViLLuksjMyUh0fn/AVRWz5t1AyFTG0uDrWxEYJ1nsEd79qNEHUWanBRTsAYeqR+UN9dmat42omsTEfGs+S6l+Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3145D339;
	Sun, 23 Mar 2025 04:36:43 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 77DA73F694;
	Sun, 23 Mar 2025 04:36:35 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>
Cc: Simon Glass <sjg@chromium.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Mikhail Kalashnikov <iuncuim@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 20/34] power: regulator: add AXP323 support
Date: Sun, 23 Mar 2025 11:35:30 +0000
Message-ID: <20250323113544.7933-21-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250323113544.7933-1-andre.przywara@arm.com>
References: <20250323113544.7933-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The X-Powers AXP323 is very close sibling to the AXP313A, only that it
adds support for dual-phasing the first two DC/DC converters.

We do not really care about this particular feature, so just add the new
compatible string and tie it to the existing AXP313A support code.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/power/pmic/axp.c                | 1 +
 drivers/power/regulator/axp_regulator.c | 1 +
 include/axp_pmic.h                      | 1 +
 3 files changed, 3 insertions(+)

diff --git a/drivers/power/pmic/axp.c b/drivers/power/pmic/axp.c
index 521a39dd566..fbe9bf239a3 100644
--- a/drivers/power/pmic/axp.c
+++ b/drivers/power/pmic/axp.c
@@ -88,6 +88,7 @@ static const struct udevice_id axp_pmic_ids[] = {
 	{ .compatible = "x-powers,axp221", .data = AXP221_ID },
 	{ .compatible = "x-powers,axp223", .data = AXP223_ID },
 	{ .compatible = "x-powers,axp313a", .data = AXP313_ID },
+	{ .compatible = "x-powers,axp323", .data = AXP323_ID },
 	{ .compatible = "x-powers,axp717", .data = AXP717_ID },
 	{ .compatible = "x-powers,axp803", .data = AXP803_ID },
 	{ .compatible = "x-powers,axp806", .data = AXP806_ID },
diff --git a/drivers/power/regulator/axp_regulator.c b/drivers/power/regulator/axp_regulator.c
index 75cdbca30f6..7794a4f5d92 100644
--- a/drivers/power/regulator/axp_regulator.c
+++ b/drivers/power/regulator/axp_regulator.c
@@ -318,6 +318,7 @@ static const struct axp_regulator_plat *const axp_regulators[] = {
 	[AXP221_ID]	= axp22x_regulators,
 	[AXP223_ID]	= axp22x_regulators,
 	[AXP313_ID]	= axp313_regulators,
+	[AXP323_ID]	= axp313_regulators,
 	[AXP717_ID]	= axp717_regulators,
 	[AXP803_ID]	= axp803_regulators,
 	[AXP806_ID]	= axp806_regulators,
diff --git a/include/axp_pmic.h b/include/axp_pmic.h
index ae62ef0d76d..1806a7270a0 100644
--- a/include/axp_pmic.h
+++ b/include/axp_pmic.h
@@ -33,6 +33,7 @@ enum {
 	AXP221_ID,
 	AXP223_ID,
 	AXP313_ID,
+	AXP323_ID,
 	AXP717_ID,
 	AXP803_ID,
 	AXP806_ID,
-- 
2.46.3

