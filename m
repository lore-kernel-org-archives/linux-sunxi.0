Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358B723CE
	for <linux-sunxi@lists.linux.dev>; Sun,  1 Jun 2025 15:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748792557; cv=none; b=ZT0BgCC8NGUOsymQCzSddMif5VBEMLQSnFxo1ZG16SdG8eMlgTXeVB/05LUsHSZFPnExxangcJN5F3wpCg/u1IwaxbzAV4Ic003LcYEA1l8noGdzgFdNDVMw63iw8Mpo7+Kn1XsCYNDhLlmGUxUKxV967si+2ILeDvgvMQ4yDe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748792557; c=relaxed/simple;
	bh=2otS0b/RwtQt1DfxCSkwJQdfafehJPGTuKtTlGbWBTE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Azg2dnuBbczHG9igAEyXsV/8zM497qvCVzvwwc6hunZe7atBbvHdnzngdOXkuXcb9z198Q27mSwkoVurFAe+v17phhKHCrEPG+xLn9nF7NzKGcp3KnDq6TzUZQ793MCA8GMpHXQnx23doyw7GDss2a2FtW6oUVLzkZc/D4t53/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=paulk.fr; spf=pass smtp.mailfrom=paulk.fr; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=paulk.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paulk.fr
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id DE5631F0004D
	for <linux-sunxi@lists.linux.dev>; Sun,  1 Jun 2025 15:42:33 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 4C687AC32F2; Sun,  1 Jun 2025 15:42:33 +0000 (UTC)
X-Spam-Level: *
Received: from localhost.localdomain (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id 3B18DAC32E1;
	Sun,  1 Jun 2025 15:40:00 +0000 (UTC)
From: Paul Kocialkowski <contact@paulk.fr>
To: u-boot@lists.denx.de
Cc: Tom Rini <trini@konsulko.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Icenowy Zheng <icenowy@aosc.xyz>,
	linux-sunxi@lists.linux.dev,
	Paul Kocialkowski <contact@paulk.fr>
Subject: [PATCH 5/6] power: axp: Fixup default voltages for V3/S3
Date: Sun,  1 Jun 2025 17:39:42 +0200
Message-ID: <20250601153943.2690123-6-contact@paulk.fr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250601153943.2690123-1-contact@paulk.fr>
References: <20250601153943.2690123-1-contact@paulk.fr>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The default voltages used by V3/S3 boards differs from the usual AXP209
default that are used on older chips.

Correct the default voltages based on the Allwinner reference design
schematics, which match boards found in the wild such as the Pinecube.

Signed-off-by: Paul Kocialkowski <contact@paulk.fr>
---
 configs/pinecube_defconfig | 3 ---
 drivers/power/Kconfig      | 8 ++++++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/configs/pinecube_defconfig b/configs/pinecube_defconfig
index 2741e7ed9079..8bd14ad90f6d 100644
--- a/configs/pinecube_defconfig
+++ b/configs/pinecube_defconfig
@@ -14,8 +14,5 @@ CONFIG_SYS_I2C_SPEED=400000
 CONFIG_MTD=y
 CONFIG_SPI_FLASH_WINBOND=y
 CONFIG_SUN8I_EMAC=y
-CONFIG_AXP209_POWER=y
-CONFIG_AXP_DCDC2_VOLT=1250
-CONFIG_AXP_DCDC3_VOLT=3300
 CONFIG_CONS_INDEX=3
 CONFIG_SPI=y
diff --git a/drivers/power/Kconfig b/drivers/power/Kconfig
index 08369bf833e4..24b36be4c6cf 100644
--- a/drivers/power/Kconfig
+++ b/drivers/power/Kconfig
@@ -176,10 +176,11 @@ config AXP_DCDC2_VOLT
 	int "axp pmic dcdc2 voltage"
 	depends on AXP152_POWER || AXP209_POWER || AXP221_POWER || AXP809_POWER || AXP818_POWER || AXP313_POWER || AXP717_POWER || AXP803_POWER
 	default 900 if AXP818_POWER
-	default 1400 if AXP152_POWER || AXP209_POWER
+	default 1400 if AXP152_POWER || (AXP209_POWER && !MACH_SUN8I_V3)
 	default 1000 if AXP313_POWER
 	default 1000 if AXP717_POWER
 	default 1000 if AXP803_POWER
+	default 1250 if MACH_SUN8I_V3
 	default 1200 if MACH_SUN6I
 	default 1100 if MACH_SUN8I
 	default 0 if MACH_SUN9I
@@ -192,6 +193,7 @@ config AXP_DCDC2_VOLT
 	On A80 boards dcdc2 powers the GPU and can be left off.
 	On A83T boards dcdc2 is used for VDD-CPUA(cluster 0) and should be 0.9V.
 	On R40 boards dcdc2 is VDD-CPU and should be 1.1V
+	On V3/S3 boards dcdc2 is VDD-CPU/VDD-SYS and should be 1.25V.
 	On boards using the AXP313 or AXP717 it's often VDD-CPU.
 
 config AXP_DCDC3_VOLT
@@ -199,9 +201,10 @@ config AXP_DCDC3_VOLT
 	depends on AXP152_POWER || AXP209_POWER || AXP221_POWER || AXP809_POWER || AXP818_POWER || AXP313_POWER || AXP717_POWER
 	default 900 if AXP809_POWER || AXP818_POWER
 	default 1500 if AXP152_POWER
-	default 1250 if AXP209_POWER
+	default 1250 if (AXP209_POWER && !MACH_SUN8I_V3)
 	default 1100 if AXP313_POWER
 	default 1100 if MACH_SUN8I_R40
+	default 3300 if MACH_SUN8I_V3
 	default 1200 if MACH_SUN6I || MACH_SUN8I
 	---help---
 	Set the voltage (mV) to program the axp pmic dcdc3 at, set to 0 to
@@ -213,6 +216,7 @@ config AXP_DCDC3_VOLT
 	On A80 boards dcdc3 is used for VDD-CPUA(cluster 0) and should be 0.9V.
 	On A83T boards dcdc3 is used for VDD-CPUB(cluster 1) and should be 0.9V.
 	On R40 boards dcdc3 is VDD-SYS and VDD-GPU and should be 1.1V.
+	On V3/S3 boards dcdc3 is VCC-IO and should be 3.3V.
 	On boards using the AXP313 or AXP717 it's often VDD-DRAM and should
 	be 1.1V for LPDDR4.
 
-- 
2.49.0

