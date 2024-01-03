Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA2B37E
	for <linux-sunxi@lists.linux.dev>; Wed,  3 Jan 2024 00:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 96A00152B;
	Tue,  2 Jan 2024 16:14:27 -0800 (PST)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AC5A13F5A1;
	Tue,  2 Jan 2024 16:13:40 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Samuel Holland <samuel@sholland.org>,
	linux-sunxi@lists.linux.dev,
	u-boot@lists.denx.de
Subject: [PATCH 11/19] sunxi: sun6i: make more clock functions SPL only
Date: Wed,  3 Jan 2024 00:12:31 +0000
Message-Id: <20240103001239.17482-12-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.8
In-Reply-To: <20240103001239.17482-1-andre.przywara@arm.com>
References: <20240103001239.17482-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In clock_sun6i.c, responsible for (mostly early) clock setup on older
generation Allwinner SoCs, many functions are only needed by the SPL,
and are thus already guarded by CONFIG_SPL_BUILD.

Over the years drivers like for the UART or I2C were converted to DM,
so they care about clock setup themselves now, by using a proper DM clock
driver.

This means those devices need the clock setup functions here for the SPL
only. Include those functions into the existing CONFIG_SPL_BUILD guards,
so they are compiled for the SPL only.

This avoids unnecessary code in U-Boot proper and helps further
refactoring. Add some comments on the way to help understanding of the
file.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/mach-sunxi/clock_sun6i.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/mach-sunxi/clock_sun6i.c b/arch/arm/mach-sunxi/clock_sun6i.c
index aad9df282ec..59f7e15ffe8 100644
--- a/arch/arm/mach-sunxi/clock_sun6i.c
+++ b/arch/arm/mach-sunxi/clock_sun6i.c
@@ -62,7 +62,6 @@ void clock_init_safe(void)
 	setbits_le32(&ccm->sata_clk_cfg, CCM_SATA_CTRL_ENABLE);
 #endif
 }
-#endif /* CONFIG_SPL_BUILD */
 
 void clock_init_sec(void)
 {
@@ -124,7 +123,6 @@ void clock_init_uart(void)
 #endif
 }
 
-#ifdef CONFIG_SPL_BUILD
 void clock_set_pll1(unsigned int clk)
 {
 	struct sunxi_ccm_reg * const ccm =
@@ -173,6 +171,7 @@ void clock_set_pll1(unsigned int clk)
 }
 #endif /* CONFIG_SPL_BUILD */
 
+/* video, DRAM, PLL_PERIPH clocks */
 void clock_set_pll3(unsigned int clk)
 {
 	struct sunxi_ccm_reg * const ccm =
-- 
2.35.8

