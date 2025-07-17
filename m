Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3F4122258E
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Jul 2025 23:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752796618; cv=none; b=WDs34RDRhuEvVIyVxU5m8mOxQLPFrMtMWiWffGz5owjp5ZJJ918zNtFxuiH47cZ6HwPB+obKUGIxHHkiQjIDk/YRHBuOssyelA4/OAoAyRkzv4rYK9cxgyvYbJEHRW1cJ7BS9Zn40NKkZtX5zMVL8oeYHcoJtzIgI9FB4c7fB7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752796618; c=relaxed/simple;
	bh=NlyGJFS5K2FzdfT99M1CPZtoVv/AqwAgWmumUemg5Uw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M5pi+GL1GEkfQ5KiZSQRyQZ/Mc5S1IyFz1dYOTtAvAR7lA6XSIBSwxXNR04OhreY67LJqCGmm/ybL/LDmejGQvgsvXEV7R53SCrIZUlEjdE3hW+tkZAQvFhPQGDantYJIS5DxgoN/NzY56rl8thYnjJP762QaWwURZOlR2MyXRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6690176C;
	Thu, 17 Jul 2025 16:56:47 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5B7133F694;
	Thu, 17 Jul 2025 16:56:54 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: u-boot@lists.denx.de
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Mikhail Kalashnikov <iuncuim@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	linux-sunxi@lists.linux.dev,
	Tom Rini <trini@konsulko.com>
Subject: [PATCH v2 03/20] sunxi: clock: H6: factor out H6/H616 CPU clock setup
Date: Fri, 18 Jul 2025 00:54:38 +0100
Message-ID: <20250717235455.32528-4-andre.przywara@arm.com>
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

When we program the CPU PLL, we need to switch the CPU clock source away
from the PLL temporarily, then switch it back, once the PLL has
stabilised.

The CPU CLK register will be different on the A523, so move the current
code into a separate function, to allow using a different version of
that later for the A523.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/mach-sunxi/clock_sun50i_h6.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/arch/arm/mach-sunxi/clock_sun50i_h6.c b/arch/arm/mach-sunxi/clock_sun50i_h6.c
index 90436b45b40..84064c4ed86 100644
--- a/arch/arm/mach-sunxi/clock_sun50i_h6.c
+++ b/arch/arm/mach-sunxi/clock_sun50i_h6.c
@@ -120,29 +120,37 @@ static void clock_set_pll(u32 *reg, unsigned int n)
 	}
 }
 
-void clock_set_pll1(unsigned int clk)
+static void clock_h6_set_cpu_pll(unsigned int n_factor)
 {
 	void *const ccm = (void *)SUNXI_CCM_BASE;
 	u32 val;
 
-	/* Do not support clocks < 288MHz as they need factor P */
-	if (clk < 288000000) clk = 288000000;
-
-	/* Switch to 24MHz clock while changing PLL1 */
+	/* Switch CPU clock source to 24MHz HOSC while changing the PLL */
 	val = readl(ccm + CCU_H6_CPU_AXI_CFG);
 	val &= ~CCM_CPU_AXI_MUX_MASK;
 	val |= CCM_CPU_AXI_MUX_OSC24M;
 	writel(val, ccm + CCU_H6_CPU_AXI_CFG);
 
-	clock_set_pll(ccm + CCU_H6_PLL1_CFG, clk / 24000000);
+	clock_set_pll(ccm + CCU_H6_PLL1_CFG, n_factor);
 
-	/* Switch CPU to PLL1 */
+	/* Switch CPU clock source to the CPU PLL */
 	val = readl(ccm + CCU_H6_CPU_AXI_CFG);
 	val &= ~CCM_CPU_AXI_MUX_MASK;
 	val |= CCM_CPU_AXI_MUX_PLL_CPUX;
 	writel(val, ccm + CCU_H6_CPU_AXI_CFG);
 }
 
+void clock_set_pll1(unsigned int clk)
+{
+	/* Do not support clocks < 288MHz as they need factor P */
+	if (clk < 288000000)
+		clk = 288000000;
+
+	clk /= 24000000;
+
+	clock_h6_set_cpu_pll(clk);
+}
+
 int clock_twi_onoff(int port, int state)
 {
 	void *const ccm = (void *)SUNXI_CCM_BASE;
-- 
2.46.3

