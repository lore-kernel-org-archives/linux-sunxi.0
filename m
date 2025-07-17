Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C1AC22258E
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Jul 2025 23:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752796626; cv=none; b=sYR9jSswcCwzUm/Zijl60pzL1ZBimADt1pnVJVgKAzLdp5nnoYxQsEzCehPa3bfu/YPoBvn+ofItBu3nAAzbPgBFnD1qKRhK+uQx26Nal4ZVUsXu2Wsqd4u/sg065Ul/TV+pKyViLyofrnhwi5S/uuJhwGS0A6UcaCDeLw5V5jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752796626; c=relaxed/simple;
	bh=wNT4ad4nuipyupNjlCtk6rfA1fQn/WRHCL702eyjRS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S6EwOy7gdq1B6i0GXkIUhVonWjTgQx9YeRI4r9t21gIy2jCeObsG8zEmr7TV+VN6RWiqvxmLtPIyHDq0kxtGl50SsXKl7Rl6JujVR2Vuk7Tuo7GTi2yz1IkeGzV8hdQUzjmbSOiupN7ev7Y+AMr7kUvVM0eiCsF+DymdG8Kv+2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 786921762;
	Thu, 17 Jul 2025 16:56:57 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E59683F694;
	Thu, 17 Jul 2025 16:57:03 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: u-boot@lists.denx.de
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Mikhail Kalashnikov <iuncuim@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	linux-sunxi@lists.linux.dev,
	Tom Rini <trini@konsulko.com>
Subject: [PATCH v2 10/20] power: regulator: add AXP323 support
Date: Fri, 18 Jul 2025 00:54:45 +0100
Message-ID: <20250717235455.32528-11-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250717235455.32528-1-andre.przywara@arm.com>
References: <20250717235455.32528-1-andre.przywara@arm.com>
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
index c300fd2bbc2..1204ec00f8d 100644
--- a/drivers/power/pmic/axp.c
+++ b/drivers/power/pmic/axp.c
@@ -89,6 +89,7 @@ static const struct udevice_id axp_pmic_ids[] = {
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

