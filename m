Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF4524D5A5
	for <linux-sunxi@lists.linux.dev>; Wed, 15 May 2024 23:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715816974; cv=none; b=SpgHJHj5HNN5/21NqfrRC+mlld/0EsDZV/4t0lEPVLontCGPp1OsxeGTGfoVMuWQA9s2+gcagnK7lXkD1WLfAw9VbhDn2T35dlQ3qwNfec7Qd189lGg55QXOTfqh7LnHqF6iSn0ZqXyrqmrUNUUmYAnr0oOIvi62mgyvxkHCtNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715816974; c=relaxed/simple;
	bh=dMV0jY9qaJFZ9PE9eS3ynqG8CT0xqZCkEDGE4AmNV6A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=s9onjUcuoM0f43VXe1D94WJ0sgvdcedcDbWzOelQl4j7urFG2U0nxXMeSiHpg8wI95dXyRieHFMy2aAPL+/AbVefgRRUlfNl/LeSEIBKVtvsSanFALk2gXMOX9lC1gZiLoNu9VT77O52+KUslGHM3IS/j4crZ6jJ0r9cqUl0kzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E04E1007;
	Wed, 15 May 2024 16:49:55 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4AEDB3F641;
	Wed, 15 May 2024 16:49:29 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>,
	Jaehoon Chung <jh80.chung@samsung.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Chris Morgan <macromorgan@hotmail.com>,
	Ryan Walklin <ryan@testtoast.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 1/6] power: pmic: sunxi: only build AXP drivers for SPL
Date: Thu, 16 May 2024 00:48:34 +0100
Message-Id: <20240515234839.26898-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.8
In-Reply-To: <20240515234839.26898-1-andre.przywara@arm.com>
References: <20240515234839.26898-1-andre.przywara@arm.com>
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
index 41ebb494fff..9d1f4c65262 100644
--- a/drivers/power/Makefile
+++ b/drivers/power/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_$(SPL_TPL_)POWER_DOMAIN) += domain/
 obj-y += pmic/
 obj-y += regulator/
 
+ifdef CONFIG_SPL_BUILD
 obj-$(CONFIG_AXP152_POWER)	+= axp152.o
 obj-$(CONFIG_AXP209_POWER)	+= axp209.o
 obj-$(CONFIG_AXP221_POWER)	+= axp221.o
@@ -16,6 +17,7 @@ obj-$(CONFIG_AXP313_POWER)	+= axp313.o
 obj-$(CONFIG_AXP717_POWER)	+= axp717.o
 obj-$(CONFIG_AXP809_POWER)	+= axp809.o
 obj-$(CONFIG_AXP818_POWER)	+= axp818.o
+endif
 obj-$(CONFIG_EXYNOS_TMU)	+= exynos-tmu.o
 obj-$(CONFIG_SY8106A_POWER)	+= sy8106a.o
 obj-$(CONFIG_TPS6586X_POWER)	+= tps6586x.o
-- 
2.35.8

