Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF35B13DBA0
	for <linux-sunxi@lists.linux.dev>; Thu, 27 Mar 2025 21:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743110495; cv=none; b=FBtBh1H/LR50WAM1j1Ftng68oTNd0E+9e7D6OPwNw5diRlVEvuQBAfM8RgH9/nJTMt+EEYPSEczUG5AucpHAh419t+EhuNLjt1vTchtpV2ihivKrYKvtjAdagpgpSHZOfa7z+YvHK1fHBjp1vbVqS1EiXz2ndAp8S6Osuf8f/4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743110495; c=relaxed/simple;
	bh=G6PAobJaAiXf/os873M3u7m2AZtLQafz/avJlwfHo6k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=babdAwVuv/p51XCFoAbIFnPaqgDHsYeIkwJSZXwxPaEgZWeRp5EUoLDi6R+NRj0yweUjGJwSjrxx+eNeRvhUirCVBS0tG8+ZJRztrSNSjpacP7P0XE6GfhTRxfVUMSKdtLqCtIchVhY9+jqr/OZsyRmPOM+42/AD4Vdm+dT9k1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 111571762;
	Thu, 27 Mar 2025 14:21:38 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1FF123F63F;
	Thu, 27 Mar 2025 14:21:32 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: u-boot@lists.denx.de
Cc: Tom Rini <trini@konsulko.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH] sunxi: h616: defconfigs: enable eMMC
Date: Thu, 27 Mar 2025 21:21:02 +0000
Message-ID: <20250327212102.26893-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that eMMC is working properly on H616 devices, it became apparent
that some boards were missing the right defconfig bits to enable eMMC
access.

Add the eMMC device number to the Tanix TX1 and the X96 Mate defconfig,
also the eMMC boot option to the TX1. Oddly enough the X96 Mate had
just this bit already.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 configs/tanix_tx1_defconfig | 2 ++
 configs/x96_mate_defconfig  | 1 +
 2 files changed, 3 insertions(+)

diff --git a/configs/tanix_tx1_defconfig b/configs/tanix_tx1_defconfig
index 28cf9513c30..00e34dc5ad9 100644
--- a/configs/tanix_tx1_defconfig
+++ b/configs/tanix_tx1_defconfig
@@ -14,11 +14,13 @@ CONFIG_MACH_SUN50I_H616=y
 CONFIG_SUNXI_DRAM_H616_LPDDR3=y
 CONFIG_R_I2C_ENABLE=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
+CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 CONFIG_SPL_I2C=y
 CONFIG_SPL_SYS_I2C_LEGACY=y
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
 CONFIG_SYS_I2C_SPEED=400000
+CONFIG_SUPPORT_EMMC_BOOT=y
 CONFIG_AXP313_POWER=y
 CONFIG_AXP_DCDC3_VOLT=1200
 CONFIG_USB_EHCI_HCD=y
diff --git a/configs/x96_mate_defconfig b/configs/x96_mate_defconfig
index bd9b611d6f5..c0628370df9 100644
--- a/configs/x96_mate_defconfig
+++ b/configs/x96_mate_defconfig
@@ -11,6 +11,7 @@ CONFIG_DRAM_SUNXI_TPR11=0xffffdddd
 CONFIG_DRAM_SUNXI_TPR12=0xfedf7557
 CONFIG_MACH_SUN50I_H616=y
 CONFIG_SUNXI_DRAM_H616_DDR3_1333=y
+CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 CONFIG_R_I2C_ENABLE=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_SPL_I2C=y
-- 
2.46.3

