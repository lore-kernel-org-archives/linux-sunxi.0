Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D4D7176FAB
	for <linux-sunxi@lists.linux.dev>; Fri, 12 Jul 2024 16:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720803244; cv=none; b=VV5++YVbYGfcLqgoA/qOMFrRXpMPOJrtBMpiX4C9P3YZYHRD0qhWWlh/ourx8yVQkzEh+VJ+P6O9LC3tSBI6QTZEHCnzHmes1/sMHYbXGmsJS2FnlJ2ToluKfDkLpnmr3BoRFFAgxZI2NEW6JPgA6vmrTKPC2KvdJ8gryimgOCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720803244; c=relaxed/simple;
	bh=1POpTf9meOwGPyD52oN3/0YdARxmYD7wW7clMvtXhS0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZBwwMgvMnFufwnp5pPI4mxKG0d2mkd1OSrvu3mNZ6IwbufOas9VsAA3OR+2UVw5kfX7yBRkxjaGxKI6XKGIGR3HsmW69c0xi1BTYad0kzcNyYc2gmxsD+6Mtabbcax6mVhWTbI30KZ1NFFIvK+N6wJ8w802zkYb7065w8Vzv410=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C63261477;
	Fri, 12 Jul 2024 09:54:26 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.manchester.arm.com [10.32.101.20])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 21E983F766;
	Fri, 12 Jul 2024 09:54:00 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>,
	Jaehoon Chung <jh80.chung@samsung.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Chris Morgan <macromorgan@hotmail.com>,
	Ryan Walklin <ryan@testtoast.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 2/6] power: pmic: sunxi: only build AXP drivers for SPL
Date: Fri, 12 Jul 2024 17:53:48 +0100
Message-Id: <20240712165352.3767166-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240712165352.3767166-1-andre.przywara@arm.com>
References: <20240712165352.3767166-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The axp<xxx>.c drivers are only used for the SPL, for U-Boot proper we
have a separate, DM compliant driver.
Mask the build instructions with CONFIG_SPL_BUILD, to avoid them being
build for U-Boot proper as well.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/power/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/power/Makefile b/drivers/power/Makefile
index c7ee4595fc8..0f39459dec4 100644
--- a/drivers/power/Makefile
+++ b/drivers/power/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_$(SPL_TPL_)POWER_DOMAIN) += domain/
 obj-y += pmic/
 obj-y += regulator/
 
+ifdef CONFIG_SPL_BUILD
 obj-$(CONFIG_AXP152_POWER)	+= axp152.o
 obj-$(CONFIG_AXP209_POWER)	+= axp209.o
 obj-$(CONFIG_AXP221_POWER)	+= axp221.o
@@ -15,6 +16,7 @@ obj-$(CONFIG_AXP305_POWER)	+= axp305.o
 obj-$(CONFIG_AXP313_POWER)	+= axp313.o
 obj-$(CONFIG_AXP809_POWER)	+= axp809.o
 obj-$(CONFIG_AXP818_POWER)	+= axp818.o
+endif
 obj-$(CONFIG_EXYNOS_TMU)	+= exynos-tmu.o
 obj-$(CONFIG_SY8106A_POWER)	+= sy8106a.o
 obj-$(CONFIG_TPS6586X_POWER)	+= tps6586x.o
-- 
2.25.1

