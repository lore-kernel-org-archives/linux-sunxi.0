Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 559A078F4C
	for <linux-sunxi@lists.linux.dev>; Sun, 23 Mar 2025 11:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742729799; cv=none; b=AzL7uc9u4qgCkJBRgrdxUN7Ae8pzBqF2sssWeLmEsjDpSlyiQL7W8pumieCRa3x9k5B+fgQmO6XjAfoCTfmhHmKajjAJAKyp56P0X/PeNKtnExYiBnJr0hiEBk5G29J/G3JzWv6ZRzlHLPPOsFton9Ap0lc/d0K4ttNrroWttvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742729799; c=relaxed/simple;
	bh=naCF9nhj7Ao0ka8Rj2IE+Pv0gl0my/N3H8S18o2S1nE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GLGitzhR7R81j1f7LNYIGBekHM76JG4HxLeTkQxYXPi7mCEf5aC9/gLaHxdFB8VRNVzTitxWJiq1q9ndiouQNcJoqjqB1csrBwR7WTaZqrkx2EVmJdSuTWlh3UntLbMFXH/SaTWNTDyI3eAvO0a5ghaLQpCNeWy6S0DfERMCoiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A8C3169C;
	Sun, 23 Mar 2025 04:36:44 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B182D3F694;
	Sun, 23 Mar 2025 04:36:36 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>
Cc: Simon Glass <sjg@chromium.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Mikhail Kalashnikov <iuncuim@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 21/34] sunxi: update cpu_sunxi_ncat2.h
Date: Sun, 23 Mar 2025 11:35:31 +0000
Message-ID: <20250323113544.7933-22-andre.przywara@arm.com>
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

The cpu_sunxi_ncat2.h header file contains addresses of some peripherals
that are needed for the SPL, for chips that belong to the "NCAT2"
generation.
The Allwinner A523 is a member of this group, but a few addresses
differ, and we need a few more addresses, for playing with the core
reset, for instance.

Add the new addresses needed for the A523 and guard existing definitions
that conflict with that new chip.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 .../include/asm/arch-sunxi/cpu_sunxi_ncat2.h   | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/include/asm/arch-sunxi/cpu_sunxi_ncat2.h b/arch/arm/include/asm/arch-sunxi/cpu_sunxi_ncat2.h
index c04ddb3f1d4..bcfdc0a41c5 100644
--- a/arch/arm/include/asm/arch-sunxi/cpu_sunxi_ncat2.h
+++ b/arch/arm/include/asm/arch-sunxi/cpu_sunxi_ncat2.h
@@ -21,14 +21,32 @@
 #define SUNXI_SID_BASE			0x03006200
 #define SUNXI_GIC400_BASE		0x03020000
 
+#ifdef CONFIG_MACH_SUN55I_A523
+#define SUNXI_DRAM_COM_BASE		0x03120000
+#define SUNXI_DRAM_CTL0_BASE		0x03130000
+#define SUNXI_DRAM_PHY0_BASE		0x03140000
+#endif
+
 #define SUNXI_MMC0_BASE			0x04020000
 #define SUNXI_MMC1_BASE			0x04021000
 #define SUNXI_MMC2_BASE			0x04022000
 
+#ifndef CONFIG_MACH_SUN55I_A523
 #define SUNXI_R_CPUCFG_BASE		0x07000400
+#endif
 #define SUNXI_PRCM_BASE			0x07010000
+#define SUNXI_R_WDOG_BASE		0x07020400
+#ifdef CONFIG_MACH_SUN55I_A523
+#define SUNXI_R_CPUCFG_BASE		0x07050000
+#endif
+#define SUNXI_R_TWI_BASE		0x07081400
+#define SUNXI_RTC_BASE			0x07090000
 
+#ifdef CONFIG_MACH_SUN55I_A523
+#define SUNXI_CPUCFG_BASE		0x08815000
+#else
 #define SUNXI_CPUCFG_BASE		0x09010000
+#endif
 
 #define SUNXI_CPU_PLL_CFG_BASE		0x08817000
 
-- 
2.46.3

