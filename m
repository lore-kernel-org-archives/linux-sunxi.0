Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191E623CE
	for <linux-sunxi@lists.linux.dev>; Sun,  1 Jun 2025 15:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748792536; cv=none; b=bywi8guX8lPxk0HaZ0hNRdZoQfNH2gNLjpCv7lI/h70bjLlt95zoys3R6N4EeRhDhHCfP+Z5RyCJ2x1e5No/Smk2tV13Y50AHLbPVeOrhjP9wjINcIeDA/SKWatQBkfxz/U7G/xseEmhbWZ2Xt99g2gn+fKOCBMt2wSJSjlhh+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748792536; c=relaxed/simple;
	bh=friCtozI9WaJ6bcx1pkfLMJT7Q5c123ko5In3p5CxDc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lg/TPL3/vqYPiOZ90GqafepI22Ql+Oo4t1z+Wwd9eFLCpePPIaewwSmVk9IL2PmAKKNyUK9sSf65L82l1zcAPF9WXXyfdcGQ+TNvSErZpuLIsWgikYUi+QC0VpIXGBR/LYQXkhKuTpX94wvsOaNsYYBtBcfi7sPXWJUC3a/4hL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=paulk.fr; spf=pass smtp.mailfrom=paulk.fr; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=paulk.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paulk.fr
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id E9A481F0004B
	for <linux-sunxi@lists.linux.dev>; Sun,  1 Jun 2025 15:42:11 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 73B36AC32ED; Sun,  1 Jun 2025 15:42:11 +0000 (UTC)
X-Spam-Level: *
Received: from localhost.localdomain (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id 04BB0AC32DF;
	Sun,  1 Jun 2025 15:39:59 +0000 (UTC)
From: Paul Kocialkowski <contact@paulk.fr>
To: u-boot@lists.denx.de
Cc: Tom Rini <trini@konsulko.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Icenowy Zheng <icenowy@aosc.xyz>,
	linux-sunxi@lists.linux.dev,
	Paul Kocialkowski <contact@paulk.fr>
Subject: [PATCH 4/6] sunxi: pinecube: Enable EMAC and network support
Date: Sun,  1 Jun 2025 17:39:41 +0200
Message-ID: <20250601153943.2690123-5-contact@paulk.fr>
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

The pinecube has an ethernet connector which uses the EMAC and internal
PHY of the chip. Enable it in the config.

Signed-off-by: Paul Kocialkowski <contact@paulk.fr>
---
 configs/pinecube_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/pinecube_defconfig b/configs/pinecube_defconfig
index ea40d227bd53..2741e7ed9079 100644
--- a/configs/pinecube_defconfig
+++ b/configs/pinecube_defconfig
@@ -7,13 +7,13 @@ CONFIG_DRAM_CLK=504
 CONFIG_DRAM_ODT_EN=y
 # CONFIG_HAS_ARMV7_SECURE_BASE is not set
 CONFIG_SPL_I2C=y
-CONFIG_NO_NET=y
 CONFIG_SPL_SYS_I2C_LEGACY=y
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
 CONFIG_SYS_I2C_SPEED=400000
 CONFIG_MTD=y
 CONFIG_SPI_FLASH_WINBOND=y
+CONFIG_SUN8I_EMAC=y
 CONFIG_AXP209_POWER=y
 CONFIG_AXP_DCDC2_VOLT=1250
 CONFIG_AXP_DCDC3_VOLT=3300
-- 
2.49.0

