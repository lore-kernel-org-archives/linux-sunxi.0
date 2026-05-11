Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F74237F739
	for <linux-sunxi@lists.linux.dev>; Mon, 11 May 2026 21:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778535490; cv=none; b=NpvE5itm86mm34gjNo5VBfnttONuyVom6CGjJgobr2t7Yu1Reya+qy/LEheayhPp/jDIiZroHOT6NXY1aKMJk64G0aR8PBLZBIkzrO+jv2x/yEhnZl6Qv/jxI2b9ojeIsHCfLhBkQwCpwJEqP8X/QcP8BaGKOe+A2BED6deh8RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778535490; c=relaxed/simple;
	bh=At/1nIifhhzvbnxRMbf6B3uI+EgQ52jNjzfb7fwRWrE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MURSVR/Dlgq2q3czDSz7jLgtm1nURyzeQ+zyST1tImRnWITxwgxqgeQq57J58V16ON3gafxTHHbxWIZ62DFQbLLV9Mo5CZ0vE6jeARCP+YBR8KcV4K1HuXJ2kRYgWKA5waLckJWP02Tpdi0gPxgT7hqJyoqyvAKRIi/09plcB5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=LvWo6Ep2; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="LvWo6Ep2"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 33AE22C3E;
	Mon, 11 May 2026 14:38:03 -0700 (PDT)
Received: from ryzen.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EEE153F85F;
	Mon, 11 May 2026 14:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778535488; bh=At/1nIifhhzvbnxRMbf6B3uI+EgQ52jNjzfb7fwRWrE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LvWo6Ep28QfP0sQLzL5K4eArgpGqU5zfaL56X5GnKWTWEf/SWpDYAkyuyOrQf8Mlc
	 8aUYVNOPbxRgq8UVU+hbbPC8yZROcIudKkwCO1eNGz2Ak8mCBvOlE3hOxZZlDPl0jM
	 VtbcYbeLjFCROW7JJwLtTT5gPS3AmIhB/ZtfvfoY=
From: Andre Przywara <andre.przywara@arm.com>
To: u-boot@lists.denx.de
Cc: Tom Rini <trini@konsulko.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Paul Kocialkowski <contact@paulk.fr>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 5/5] sunxi: configs: OrangePi 4A: enable SPI
Date: Mon, 11 May 2026 23:37:13 +0200
Message-ID: <20260511213713.15943-6-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.4
In-Reply-To: <20260511213713.15943-1-andre.przywara@arm.com>
References: <20260511213713.15943-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The OrangePi 4A board ships with SPI NOR flash, so enable the SPI and
flash drivers, also the SPL version, for SPI booting.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 configs/orangepi_4a_defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/configs/orangepi_4a_defconfig b/configs/orangepi_4a_defconfig
index 6a44dd97959..2d36757ba11 100644
--- a/configs/orangepi_4a_defconfig
+++ b/configs/orangepi_4a_defconfig
@@ -16,6 +16,7 @@ CONFIG_DRAM_SUNXI_TPR12=0x3a373233
 CONFIG_MACH_SUN55I_A523=y
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 CONFIG_R_I2C_ENABLE=y
+CONFIG_SPL_SPI_SUNXI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_SPL_I2C=y
 CONFIG_SPL_SYS_I2C_LEGACY=y
@@ -23,10 +24,13 @@ CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
 CONFIG_SYS_I2C_SPEED=400000
 CONFIG_SUPPORT_EMMC_BOOT=y
+CONFIG_MTD=y
+CONFIG_SPI_FLASH_XMC=y
 CONFIG_REGULATOR_AXP=y
 CONFIG_AXP717_POWER=y
 CONFIG_AXP_I2C_ADDRESS=0x35
 CONFIG_AXP_DCDC2_VOLT=920
 CONFIG_AXP_DCDC3_VOLT=1160
+CONFIG_SPI=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
-- 
2.46.4

