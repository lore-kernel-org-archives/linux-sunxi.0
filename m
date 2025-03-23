Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 215512045BA
	for <linux-sunxi@lists.linux.dev>; Sun, 23 Mar 2025 11:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742729800; cv=none; b=NC2ZSTm7lrzG5ctqEhd440oqQY+F3VAKYNMEYCVS16S7h/71aE0FepDg93Q6aUQ/1O9Zo2/pcCWfRfttHk9rp3EiN9+e1kT4muXnhF+nh3G+2W2GwLSeaFb3yKmIaT7naYrryvSZqMBzFDn2ahigb+pobJVfC1RrbOanSKH4i+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742729800; c=relaxed/simple;
	bh=Q4eMR90R3uqFG9S7T18WeFY4g2kdgqiDCF7VhbVxFkM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jlj/3GLqWuwJa/vxsdFh0RXbCglvMmUk8V/IijCkPyHHrQmFWeSIPrhRKRN0MuyLjwkrRB5OL0wxuk3xACAVZOJUL6GI8B+jYiZWtmfGz1TMg5+A1FPmuBTFXtiQ7Lel7j90YQYvHx30fRIQrU8oa7P8m6UTFBncRT4h2K32ick=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A3FFF106F;
	Sun, 23 Mar 2025 04:36:45 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EAD263F694;
	Sun, 23 Mar 2025 04:36:37 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>
Cc: Simon Glass <sjg@chromium.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Mikhail Kalashnikov <iuncuim@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 22/34] sunxi: Kconfig: consolidate SYS_CLK_FREQ selection
Date: Sun, 23 Mar 2025 11:35:32 +0000
Message-ID: <20250323113544.7933-23-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250323113544.7933-1-andre.przywara@arm.com>
References: <20250323113544.7933-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Most Allwinner SoCs (used on 107 out of 172 boards) use a default CPU
frequency of 1008 MHz during the initial setup in the SPL.

Make this the fallback default, in case nothing else is selected, to
simplify the Kconfig stanza and make future additions easier.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/mach-sunxi/Kconfig | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
index 950b9047470..ab432390d3c 100644
--- a/arch/arm/mach-sunxi/Kconfig
+++ b/arch/arm/mach-sunxi/Kconfig
@@ -716,16 +716,10 @@ endif
 
 config SYS_CLK_FREQ
 	default 408000000 if MACH_SUNIV
-	default 1008000000 if MACH_SUN4I
-	default 1008000000 if MACH_SUN5I
-	default 1008000000 if MACH_SUN6I
-	default 912000000 if MACH_SUN7I
 	default 816000000 if MACH_SUN50I || MACH_SUN50I_H5
-	default 1008000000 if MACH_SUN8I
-	default 1008000000 if MACH_SUN9I
 	default 888000000 if MACH_SUN50I_H6
-	default 1008000000 if MACH_SUN50I_H616
-	default 1008000000 if MACH_SUN8I_R528
+	default 912000000 if MACH_SUN7I
+	default 1008000000
 
 config SYS_CONFIG_NAME
 	default "suniv" if MACH_SUNIV
-- 
2.46.3

