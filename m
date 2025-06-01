Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832AE2DCC09
	for <linux-sunxi@lists.linux.dev>; Sun,  1 Jun 2025 15:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748792485; cv=none; b=b7+11k2FwhvPrgs3s+PtkpK74UCsJwXXU+isdU67OQgQyjEvtFI1u4vZvFc2fshuroZBJRnGaOwulY+wzC2cL2rRar7lgigiqnw0Y75kJngL8BvrJg7sE3xR9Ipyk2L/D6cgufcQF/Mp85kjiRebkLILs9Pfo2Od2vDaCV7od5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748792485; c=relaxed/simple;
	bh=/1gPO18auefQVr2VnPI1NwQf85pxvy82Or2c6hR96p0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r1U6/0wzJK2HXarlAH5ZmZ+nm89/YIbCejcsN167PIUdgwBaQ77/PrlX3ZOluhE2ZgC3duMn4wcQNbFHX7+tWD5r6GMaKHYWpBZgI49upDKZdFW7F6+VgqkpbB/TUz+ili58Zzn/tt3ejzAwv8CeaX30aADP227kGah7zk9RAqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=paulk.fr; spf=pass smtp.mailfrom=paulk.fr; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=paulk.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paulk.fr
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 50E1F1F0004D
	for <linux-sunxi@lists.linux.dev>; Sun,  1 Jun 2025 15:41:17 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id C881DAC32E9; Sun,  1 Jun 2025 15:41:16 +0000 (UTC)
X-Spam-Level: *
Received: from localhost.localdomain (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id 919A9AC32C9;
	Sun,  1 Jun 2025 15:39:59 +0000 (UTC)
From: Paul Kocialkowski <contact@paulk.fr>
To: u-boot@lists.denx.de
Cc: Tom Rini <trini@konsulko.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Icenowy Zheng <icenowy@aosc.xyz>,
	linux-sunxi@lists.linux.dev,
	Paul Kocialkowski <contact@paulk.fr>
Subject: [PATCH 2/6] sunxi: Add support for the Lichee Pi Zero with Dock
Date: Sun,  1 Jun 2025 17:39:39 +0200
Message-ID: <20250601153943.2690123-3-contact@paulk.fr>
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

This adds a U-Boot config and device-tree build for the Lichee Pi Zero
with Dock. Compared to the Lichee Pi Zero, it has an ethernet port
(with internal PHY) so the EMAC driver and network support are enabled.

Signed-off-by: Paul Kocialkowski <contact@paulk.fr>
---
 arch/arm/dts/Makefile                | 3 ++-
 configs/LicheePi_Zero_Dock_defconfig | 7 +++++++
 2 files changed, 9 insertions(+), 1 deletion(-)
 create mode 100644 configs/LicheePi_Zero_Dock_defconfig

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index 32b698a7f411..be6867ceae0e 100644
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -650,7 +650,8 @@ dtb-$(CONFIG_MACH_SUN8I_V3S) += \
 	sun8i-s3-elimo-initium.dtb \
 	sun8i-s3-pinecube.dtb \
 	sun8i-v3-sl631-imx179.dtb \
-	sun8i-v3s-licheepi-zero.dtb
+	sun8i-v3s-licheepi-zero.dtb \
+	sun8i-v3s-licheepi-zero-dock.dtb
 dtb-$(CONFIG_MACH_SUN8I_R528) += \
 	sun8i-t113s-mangopi-mq-r-t113.dtb
 dtb-$(CONFIG_MACH_SUN50I_H5) += \
diff --git a/configs/LicheePi_Zero_Dock_defconfig b/configs/LicheePi_Zero_Dock_defconfig
new file mode 100644
index 000000000000..ec172d98b65e
--- /dev/null
+++ b/configs/LicheePi_Zero_Dock_defconfig
@@ -0,0 +1,7 @@
+CONFIG_ARM=y
+CONFIG_ARCH_SUNXI=y
+CONFIG_DEFAULT_DEVICE_TREE="sun8i-v3s-licheepi-zero-dock"
+CONFIG_SPL=y
+CONFIG_MACH_SUN8I_V3S=y
+# CONFIG_HAS_ARMV7_SECURE_BASE is not set
+CONFIG_SUN8I_EMAC=y
-- 
2.49.0

