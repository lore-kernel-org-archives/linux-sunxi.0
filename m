Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A60C98F6F
	for <linux-sunxi@lists.linux.dev>; Fri,  1 Aug 2025 00:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754008197; cv=none; b=mF0qkbEbJ7hk2/tdCNCkEXJGjmufukwAeiiEPIxAS05KsbnziRxIqmVvCzifi8RNt5fe/bBkpzb0rrnYSHPMEX2ziSKzI3MxjO5glpPRELhN8NTsgVkf64067IslE22qfkBfMVADDZH/PUDcwgCDByuakE//xEAsYCnRlv88HGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754008197; c=relaxed/simple;
	bh=7aN80wz9twAObUfVMOKWIGXacG+9zaXm+OH4av+LuoA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WqUovVP0SJILSzz/PEq8LQ6B27aGtpBZDi+lofUYcm4Jtayb901EOTw9+yKCPmWb+U9fbhWuldGL8R5Qb4t572XqL+6V3uQ+0nPuUjTkSZL9z4UGhPFaRzGG3jTG7YFrwMv9jaPrbReDxNwPjv9kQ5+AMPkO6RZbmAf0cy/TYRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1ED2D1C2B;
	Thu, 31 Jul 2025 17:29:47 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1F4053F5A1;
	Thu, 31 Jul 2025 17:29:54 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: u-boot@lists.denx.de
Cc: Tom Rini <trini@konsulko.com>,
	linux-sunxi@lists.linux.dev,
	Mikhail Kalashnikov <iuncuim@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 2/2] sunxi: a527: radxa/avaota: enable Ethernet
Date: Fri,  1 Aug 2025 01:27:26 +0100
Message-ID: <20250801002726.8924-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250801002726.8924-1-andre.przywara@arm.com>
References: <20250801002726.8924-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The first of the two Ethernet controllers in the Allwinner A527/T527 is
compatible to the MAC from the previous SoCs. Consequently the recent DT
update brought use the MAC node, using the A64 compatible string as the
fallback, which works out of the box.

Enable the sun8i-emac Ethernet driver in the defconfig for the Radxa and
the Avaota boards, so that kernels and other data can be loaded via
TFTP. Please note that only one of the Ethernet sockets will work, the
second MAC is not compatible, and needs a new U-Boot driver. The
X96QPro+ TV box unfortunately uses only this second EMAC, so Ethernet
cannot be used there at the moment.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 configs/avaota-a1_defconfig       | 2 ++
 configs/radxa-cubie-a5e_defconfig | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/configs/avaota-a1_defconfig b/configs/avaota-a1_defconfig
index 55457edd3b3..a4582c00d5b 100644
--- a/configs/avaota-a1_defconfig
+++ b/configs/avaota-a1_defconfig
@@ -22,6 +22,8 @@ CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
 CONFIG_SYS_I2C_SPEED=400000
 CONFIG_SUPPORT_EMMC_BOOT=y
+CONFIG_PHY_REALTEK=y
+CONFIG_SUN8I_EMAC=y
 CONFIG_REGULATOR_AXP=y
 CONFIG_AXP717_POWER=y
 CONFIG_AXP_I2C_ADDRESS=0x35
diff --git a/configs/radxa-cubie-a5e_defconfig b/configs/radxa-cubie-a5e_defconfig
index 88019acf576..9d204ef5548 100644
--- a/configs/radxa-cubie-a5e_defconfig
+++ b/configs/radxa-cubie-a5e_defconfig
@@ -22,6 +22,8 @@ CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
 CONFIG_SYS_I2C_SPEED=400000
 CONFIG_SUPPORT_EMMC_BOOT=y
+CONFIG_PHY_REALTEK=y
+CONFIG_SUN8I_EMAC=y
 CONFIG_REGULATOR_AXP=y
 CONFIG_AXP717_POWER=y
 CONFIG_AXP_DCDC2_VOLT=920
-- 
2.46.3

