Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3AA018CBE6
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Oct 2024 22:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728340033; cv=none; b=lY1Ewmd6dGKuZwk55FLhEsZxH8URrELbdHSdga9fOGdM8LOTbSgQUV1/OMJDULi+RGQER3OkhJaYemQYNQqmgKWz3cYyYhW1YJVqneJGmkpTCIleDqfnhzOpEb1Fhw1dQdqa905KsYnCHh2JQP+bPV50ZzLEip4I+dDPpUVJfsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728340033; c=relaxed/simple;
	bh=NfxuE8ogIb0xbVT8N14wkNtxUZB3smDElLPFT4+igbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fK4nj01/730t1yaWLJgxnk9udmvzz8paQaW+hMyQR8in4tPGMiSapkAHTsXDlbOJC8HVLqulq5ECMVo/pofxAgmRxkimn/cfc9ZZXpBC83YHoNulwVWO3P/9Enoy/ODgKTXjhG+P7r6TyF3/C2ki1wRB6prmd1CsgSnpS682DAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F342DA7;
	Mon,  7 Oct 2024 15:27:38 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A821E3F73F;
	Mon,  7 Oct 2024 15:27:07 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jaehoon Chung <jh80.chung@samsung.com>,
	Jagan Teki <jagan@amarulasolutions.com>
Cc: Tom Rini <trini@konsulko.com>,
	Chen-Yu Tsai <wens@csie.org>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH] sunxi: power: axp809: Fix DCDC4 programming
Date: Mon,  7 Oct 2024 23:26:25 +0100
Message-ID: <20241007222625.18883-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When trying to set the DCDC4 regulator, the code was accidentally
setting the voltage register for DCDC5 (VCC-DRAM). The higher voltage
doesn't harm the DRAM chips, but upsets the Linux regulator driver: when
it tried to correct that, it tripped over a separate DT bug.
The DCDC5 DT limits are 1.425 and 1.575V, which cannot bet set with the
rail's resolution of 50mV. The kernel driver gave up, and made in turn
the system hang, as the PMIC powers essential devices.

Fix the copy&paste bug by using the correct PMIC voltage register.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/power/axp809.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/power/axp809.c b/drivers/power/axp809.c
index 9e38e1a7450..ec3eca1ac4b 100644
--- a/drivers/power/axp809.c
+++ b/drivers/power/axp809.c
@@ -93,7 +93,7 @@ int axp_set_dcdc4(unsigned int mvolt)
 		return pmic_bus_clrbits(AXP809_OUTPUT_CTRL1,
 					AXP809_OUTPUT_CTRL1_DCDC4_EN);
 
-	ret = pmic_bus_write(AXP809_DCDC5_CTRL, cfg);
+	ret = pmic_bus_write(AXP809_DCDC4_CTRL, cfg);
 	if (ret)
 		return ret;
 
-- 
2.46.2

