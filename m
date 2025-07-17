Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5B8549641
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Jul 2025 23:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752796627; cv=none; b=G0ILUn5hxGV4JQaQBaCdj/0bHaGVrpFYGtkN30BSPxtdSJe9FV3pVvASiwcSq/7p2jitHci6zU4hDa+hKZ/8jtQgp9M8jBNvz8PTBPNjUQxStgevCAYi9Eia6JQ0DBBgzbrZ+Ze9jFuFBR2EAzSzthdSVe+vSt6P0WTAfG6wZoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752796627; c=relaxed/simple;
	bh=naCF9nhj7Ao0ka8Rj2IE+Pv0gl0my/N3H8S18o2S1nE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d68sTxKJMCQG+74QdX3Mw9n8KPLhxGlPxR72RS+gcYsN54Y/Wts7wuhAcqXfRWr9cq0V4ggPn/IXfgG5VDUzFkbBor8pFCxi+K7ZwzMAk/I/j9Wnt1HJ7tfM4HhmTT3Hnlg3Bmet+5/e5hsGrttIFx30LgW+M5v51bsf0ErTnO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D3C27168F;
	Thu, 17 Jul 2025 16:56:58 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4A0643F694;
	Thu, 17 Jul 2025 16:57:05 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: u-boot@lists.denx.de
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Mikhail Kalashnikov <iuncuim@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	linux-sunxi@lists.linux.dev,
	Tom Rini <trini@konsulko.com>
Subject: [PATCH v2 11/20] sunxi: update cpu_sunxi_ncat2.h
Date: Fri, 18 Jul 2025 00:54:46 +0100
Message-ID: <20250717235455.32528-12-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250717235455.32528-1-andre.przywara@arm.com>
References: <20250717235455.32528-1-andre.przywara@arm.com>
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

