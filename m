Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3F271E00B0
	for <linux-sunxi@lists.linux.dev>; Fri, 17 Jan 2025 01:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737078431; cv=none; b=MVJtll9DaLi0awY0XN8QkC9lpESjFHuo1tyOsn1gaEUYmI+E8N/QElg7Mw+0OIdVW57FSFIj8iRxk9QF/Q+D4zZIZHB+Pv17kD/ubFgMEo0iQ/X3kx1Hp84Ab7t/kAvrBT6bATVPJHl0rpdqUMG1wkhznezpIe6rBwfsdGUw1vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737078431; c=relaxed/simple;
	bh=jrMGcaMs0tdrZ61ssHiHlrZXEU+Q8hwo6AdIOgcNFD0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LrmtBYmJc2k20/vhWZK+rSCRJ5bPvXRFTycYNfNu9FDhYcn08Sn3LR8sp5vJThJCUl0pHFGDysgBQZ6I2E8C/jGMFD3I+bzJG63YJDYAk+tt6jCu5oQ+Tm9E4bWeFWR2YEEDRdj7FBV1g11opZPgquJ5QSXE74PaMeVD1eCLBKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB57216F8;
	Thu, 16 Jan 2025 17:47:36 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 149CB3F673;
	Thu, 16 Jan 2025 17:47:06 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: u-boot@lists.denx.de,
	Lukasz Majewski <lukma@denx.de>,
	Sean Anderson <seanga2@gmail.com>,
	Jaehoon Chung <jh80.chung@samsung.com>
Cc: Tom Rini <trini@konsulko.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Cody Eksal <masterr3c0rd@epochal.quest>,
	Simon Glass <sjg@chromium.org>,
	linux-sunxi@lists.linux.dev,
	Parthiban <parthiban@linumiz.com>
Subject: [PATCH 2/8] sunxi: pmic_bus: support alternative I2C address
Date: Fri, 17 Jan 2025 01:45:31 +0000
Message-ID: <20250117014537.22513-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20250117014537.22513-1-andre.przywara@arm.com>
References: <20250117014537.22513-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some of the X-Power AXP PMICs can be ordered with an alternative I2C
address, for instance an AXP717 could be shipped with address 0x34 or
with address 0x35.
The datasheets for the AXP717 and AXP803 list two possible addresses,
and they are always consecutive. For DM (DT) based drivers this is no
problem, but the Allwinner SPL code relies on a hardcoded address.

Add a Kconfig variable that will add "1" to the existing address if it
is set.
This enables to use the AXP717 as used on boards with the new Allwinner
A523 chip.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/mach-sunxi/pmic_bus.c | 7 ++++++-
 drivers/power/Kconfig          | 8 ++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-sunxi/pmic_bus.c b/arch/arm/mach-sunxi/pmic_bus.c
index 8e19324c8ac..f0201f76f42 100644
--- a/arch/arm/mach-sunxi/pmic_bus.c
+++ b/arch/arm/mach-sunxi/pmic_bus.c
@@ -31,6 +31,11 @@ static struct udevice *pmic;
 #else
 static int pmic_i2c_address(void)
 {
+	int i2c_offset = 0;
+
+	if (IS_ENABLED(CONFIG_AXP_ALT_I2C_ADDR))
+		i2c_offset = 1;
+
 	if (IS_ENABLED(CONFIG_AXP152_POWER))
 		return AXP152_I2C_ADDR;
 	if (IS_ENABLED(CONFIG_AXP305_POWER))
@@ -38,7 +43,7 @@ static int pmic_i2c_address(void)
 	if (IS_ENABLED(CONFIG_AXP313_POWER))
 		return AXP313_I2C_ADDR;
 	if (IS_ENABLED(CONFIG_AXP717_POWER))
-		return AXP717_I2C_ADDR;
+		return AXP717_I2C_ADDR + i2c_offset;
 
 	/* Other AXP2xx and AXP8xx variants */
 	return AXP209_I2C_ADDR;
diff --git a/drivers/power/Kconfig b/drivers/power/Kconfig
index 4b81aeb7497..4c2211097fd 100644
--- a/drivers/power/Kconfig
+++ b/drivers/power/Kconfig
@@ -142,6 +142,14 @@ config SY8106A_POWER
 
 endchoice
 
+config AXP_ALT_I2C_ADDR
+	bool "use alternative I2C address"
+	depends on AXP717_POWER
+	---help---
+	Some PMICs can be ordered with a different I2C address (+1), to avoid
+	address clashes or accommodate two PMICs on the same bus.
+	Select this to use the secondary I2C address for the AXP PMICs.
+
 config AXP_DCDC1_VOLT
 	int "axp pmic dcdc1 voltage"
 	depends on AXP221_POWER || AXP809_POWER || AXP818_POWER
-- 
2.46.2

