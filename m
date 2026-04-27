Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 646DD3CD8AF
	for <linux-sunxi@lists.linux.dev>; Mon, 27 Apr 2026 13:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777298312; cv=none; b=Xw/lEzGKrZfYNTzpqcUn+N3coYuXsP7i07aBuTh5YKP//oWEiaH9QkIgJvQdjA/Dl7hXLhhbvHOYJoczzenHn9Mvsp9Sw12Aay6FO6aZGDQ+kj9qTccHjzYsKoMSQTyUpZiyT0DddYm5pEedjsXex1wC2C+1rgBhQCajkYau6Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777298312; c=relaxed/simple;
	bh=izqgRss1FDccKNPYOe4pexC7zVk2uteNj2SVJLfMjbI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hEdeructp07oH3BSo1q0sgDVfJHuUnic92pbSCvsNpGrEXG477iBuQMIZUfAGGe7nMPet0A77XMbmfcQZrgDhAt5yIIFFESubP6yDufT0Um9GEl2aMTuhPk0yTfGo8FhMXyjuazREUlrpY+0SrigDDdr1xRrXFDnQRlxIazM2as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=fKqIC9rJ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="fKqIC9rJ"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1527E1684;
	Mon, 27 Apr 2026 06:58:25 -0700 (PDT)
Received: from e142021.munich.arm.com (e142021.arm.com [10.41.150.145])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9CFF23F763;
	Mon, 27 Apr 2026 06:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777298310; bh=izqgRss1FDccKNPYOe4pexC7zVk2uteNj2SVJLfMjbI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fKqIC9rJdd+27TAolwc7CdNewEvszCpikk1siUhnq1igNT0hjZKGIA0B5bDajlI3Z
	 1BlPFbroWq6FEoFxUXcCgjfLKg8PsfC4n0cg15Ccfs5OPlayqcKjdAHtCAhI033bG/
	 6tzYeysp473mN2GO9ORO7j09TSULsnsh7IW/bL2U=
From: Andre Przywara <andre.przywara@arm.com>
To: u-boot@lists.denx.de
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	linux-sunxi@lists.linux.dev,
	Mikhail Kalashnikov <iuncuim@gmail.com>,
	Cody Eksal <masterr3c0rd@epochal.quest>
Subject: [PATCH v3 2/2] sunxi: H616: dram: drop default TPR6 Kconfig value
Date: Mon, 27 Apr 2026 15:58:19 +0200
Message-ID: <20260427135819.2577234-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427135819.2577234-1-andre.przywara@arm.com>
References: <20260427135819.2577234-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CONFIG_DRAM_SUNXI_TPR6 is the only DRAM config parameter that has a
non-zero default value. Since we need to provide a value for all the
other parameters anyway, avoiding TPR6 makes no real difference.
To make matters worse, TPR6 is a compound value covering multiple DRAM
types, but also spans over three SoCs, which makes it hard to find one
good default value.

Drop the default from Kconfig, and put some explicit values in the
defconfigs for the few boards that were relying on the default so far.
The value is taken from one BSP, only the lower byte matters anyway for
those boards, all using DDR3 DRAM.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/mach-sunxi/Kconfig         | 1 -
 configs/orangepi_zero2_defconfig    | 1 +
 configs/transpeed-8k618-t_defconfig | 1 +
 configs/x96_mate_defconfig          | 1 +
 configs/x96q_defconfig              | 1 +
 5 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
index 284458ad9a5..18123e685dc 100644
--- a/arch/arm/mach-sunxi/Kconfig
+++ b/arch/arm/mach-sunxi/Kconfig
@@ -151,7 +151,6 @@ config DRAM_SUNXI_TPR3
 
 config DRAM_SUNXI_TPR6
 	hex "DRAM TPR6 parameter"
-	default 0x3300c080
 	help
 	  TPR6 value from vendor DRAM settings.
 
diff --git a/configs/orangepi_zero2_defconfig b/configs/orangepi_zero2_defconfig
index b387b4795ad..afd1535052d 100644
--- a/configs/orangepi_zero2_defconfig
+++ b/configs/orangepi_zero2_defconfig
@@ -5,6 +5,7 @@ CONFIG_SPL=y
 CONFIG_DRAM_SUNXI_DX_ODT=0x08080808
 CONFIG_DRAM_SUNXI_DX_DRI=0x0e0e0e0e
 CONFIG_DRAM_SUNXI_CA_DRI=0x0e0e
+CONFIG_DRAM_SUNXI_TPR6=0x33808080
 CONFIG_DRAM_SUNXI_TPR10=0xf83438
 CONFIG_MACH_SUN50I_H616=y
 CONFIG_SUNXI_DRAM_H616_DDR3_1333=y
diff --git a/configs/transpeed-8k618-t_defconfig b/configs/transpeed-8k618-t_defconfig
index e4bf5e8efd3..e672d8f8df9 100644
--- a/configs/transpeed-8k618-t_defconfig
+++ b/configs/transpeed-8k618-t_defconfig
@@ -7,6 +7,7 @@ CONFIG_DRAM_SUNXI_DX_ODT=0x03030303
 CONFIG_DRAM_SUNXI_DX_DRI=0x0e0e0e0e
 CONFIG_DRAM_SUNXI_CA_DRI=0x1f12
 CONFIG_DRAM_SUNXI_TPR0=0xc0001002
+CONFIG_DRAM_SUNXI_TPR6=0x33808080
 CONFIG_DRAM_SUNXI_TPR10=0x2f1107
 CONFIG_DRAM_SUNXI_TPR11=0xddddcccc
 CONFIG_DRAM_SUNXI_TPR12=0xeddc7665
diff --git a/configs/x96_mate_defconfig b/configs/x96_mate_defconfig
index c0628370df9..1b7d9338c02 100644
--- a/configs/x96_mate_defconfig
+++ b/configs/x96_mate_defconfig
@@ -6,6 +6,7 @@ CONFIG_DRAM_SUNXI_DX_ODT=0x03030303
 CONFIG_DRAM_SUNXI_DX_DRI=0x0e0e0e0e
 CONFIG_DRAM_SUNXI_CA_DRI=0x1c12
 CONFIG_DRAM_SUNXI_TPR0=0xc0000c05
+CONFIG_DRAM_SUNXI_TPR6=0x33808080
 CONFIG_DRAM_SUNXI_TPR10=0x2f0007
 CONFIG_DRAM_SUNXI_TPR11=0xffffdddd
 CONFIG_DRAM_SUNXI_TPR12=0xfedf7557
diff --git a/configs/x96q_defconfig b/configs/x96q_defconfig
index 59f01aae4eb..068aee3fd1e 100644
--- a/configs/x96q_defconfig
+++ b/configs/x96q_defconfig
@@ -8,6 +8,7 @@ CONFIG_DRAM_SUNXI_DX_DRI=0x0e0e0e0e
 CONFIG_DRAM_SUNXI_CA_DRI=0x1f12
 CONFIG_DRAM_SUNXI_TPR0=0xc0001002
 CONFIG_DRAM_SUNXI_TPR2=0x00000100
+CONFIG_DRAM_SUNXI_TPR6=0x33808080
 CONFIG_DRAM_SUNXI_TPR10=0x002f0107
 CONFIG_DRAM_SUNXI_TPR11=0xddddcccc
 CONFIG_DRAM_SUNXI_TPR12=0xeddc7665
-- 
2.43.0

