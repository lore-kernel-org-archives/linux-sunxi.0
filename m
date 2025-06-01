Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17052DCC09
	for <linux-sunxi@lists.linux.dev>; Sun,  1 Jun 2025 15:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748792462; cv=none; b=Fdu2Vif2e3x/TPs/z0hz4q/IjDMiekAEOeETXJxAyBfp6rMoXBFBMC81Omq+17UeHbmxpWoZZX1zgUM0KdYF8wkst1QfSVMiTcw4ZQ1pKTNzf7aTWkTN6xCoDYo0IPhjERpfWM8jbbkU0oQkZ6CSgiHig6PFi0iDJpIDRZ+EcJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748792462; c=relaxed/simple;
	bh=oD68e8YlVeLUBoQZ5Ie3hdL/0aasgXRSJOqj8rfT800=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MAwPA7heENrPbHa1G4qvH/6hjH3n2bS5mHZM7JYJaobjkGGIgr+nlOPQ8vNwEj5AABeihAUTiqGmYlmtXY5x5bPS7SKaiOmq9js000R3ZEnMa1jROqzJoPbawmihgNGdwUjGMUVITyiuQCJk1Rtdu7BOIbjAFqFDR4pHq7H8hCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=paulk.fr; spf=pass smtp.mailfrom=paulk.fr; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=paulk.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paulk.fr
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 4882F1F0004B
	for <linux-sunxi@lists.linux.dev>; Sun,  1 Jun 2025 15:40:55 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id AE510AC32AD; Sun,  1 Jun 2025 15:40:54 +0000 (UTC)
X-Spam-Level: *
Received: from localhost.localdomain (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id 607A6AC32AD;
	Sun,  1 Jun 2025 15:39:59 +0000 (UTC)
From: Paul Kocialkowski <contact@paulk.fr>
To: u-boot@lists.denx.de
Cc: Tom Rini <trini@konsulko.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Icenowy Zheng <icenowy@aosc.xyz>,
	linux-sunxi@lists.linux.dev,
	Paul Kocialkowski <contact@paulk.fr>
Subject: [PATCH 1/6] sunxi: Kconfig: Fix default order for V3s DRAM clock
Date: Sun,  1 Jun 2025 17:39:38 +0200
Message-ID: <20250601153943.2690123-2-contact@paulk.fr>
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

The V3s (using co-packaged DRAM) runs at 360 MHz, which is specified in
the common platform Kconfig file. However the value for MACH_SUN8I will
be picked up instead due to ordering.

Re-order the defaults to have MACH_SUN8I_V3S before MACH_SUN8I and let
it select the correct default. Also update the LicheePi Zero Dock
defconfig to remove the value, which is now correctly selected.

Signed-off-by: Paul Kocialkowski <contact@paulk.fr>
---
 arch/arm/mach-sunxi/Kconfig     | 2 +-
 configs/LicheePi_Zero_defconfig | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
index 17179593913e..8b43fd176dc0 100644
--- a/arch/arm/mach-sunxi/Kconfig
+++ b/arch/arm/mach-sunxi/Kconfig
@@ -591,9 +591,9 @@ config DRAM_CLK
 	int "sunxi dram clock speed"
 	default 792 if MACH_SUN9I
 	default 648 if MACH_SUN8I_R40
-	default 312 if MACH_SUN6I || MACH_SUN8I
 	default 360 if MACH_SUN4I || MACH_SUN5I || MACH_SUN7I || \
 		       MACH_SUN8I_V3S
+	default 312 if MACH_SUN6I || MACH_SUN8I
 	default 672 if MACH_SUN50I
 	default 744 if MACH_SUN50I_H6
 	default 720 if MACH_SUN50I_H616
diff --git a/configs/LicheePi_Zero_defconfig b/configs/LicheePi_Zero_defconfig
index c37c49ccbb16..b2cf0a018c7f 100644
--- a/configs/LicheePi_Zero_defconfig
+++ b/configs/LicheePi_Zero_defconfig
@@ -3,6 +3,5 @@ CONFIG_ARCH_SUNXI=y
 CONFIG_DEFAULT_DEVICE_TREE="sun8i-v3s-licheepi-zero"
 CONFIG_SPL=y
 CONFIG_MACH_SUN8I_V3S=y
-CONFIG_DRAM_CLK=360
 # CONFIG_HAS_ARMV7_SECURE_BASE is not set
 CONFIG_NO_NET=y
-- 
2.49.0

