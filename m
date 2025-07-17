Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E14F624110F
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Jul 2025 23:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752796625; cv=none; b=hWrk80CPkda4K88qCEtI7R0wqDAhIlIXo6FAn0D9Ez4GzdCdmrxTVTeffEx9RSSmawIkDvhOaAgEdIC1DKkIdnfY83Idllc19IMxXgakYmGafNj8jNRnTNxkT4OzfLzzvwFYkxlpPWcnCJRL0zWeMLLhb+PFw2WFWdV7k+A41Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752796625; c=relaxed/simple;
	bh=e+fzUfOLNaspTfeOMXji/0vP39FJQIS2YP1IvstdOWE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eN5Nn6RPHQhCRyrRcHwwkafrzr7LsDEvXAo8S7E+PHD0INuw3fAdS4/tMebTGKcsIc4E4D8F7iTEgL/pFJzfc1x792Fje+fPehqAEU6Zgq5dAyxf0WgbvP5XqjOr2oGI8mVjvGl6YqwO3ySi3vYyuUalvIOyKu8CGRxW2MyW7os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 21B8E168F;
	Thu, 17 Jul 2025 16:56:56 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D52A3F694;
	Thu, 17 Jul 2025 16:57:02 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: u-boot@lists.denx.de
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Mikhail Kalashnikov <iuncuim@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	linux-sunxi@lists.linux.dev,
	Tom Rini <trini@konsulko.com>
Subject: [PATCH v2 09/20] sunxi: mmc: add support for Allwinner A523 MMC mod clock
Date: Fri, 18 Jul 2025 00:54:44 +0100
Message-ID: <20250717235455.32528-10-andre.przywara@arm.com>
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

The Allwinner A523 SoC has a slightly changed mod clock, where the P
factor, formerly a shift value, is now a second divider value.
Also the input clock is not PLL_PERIPH0_2X (1200MHz) anymore, but
PLL_PERIPH0_400M, so adjust the input rate calculation accordingly.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/mmc/sunxi_mmc.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/sunxi_mmc.c b/drivers/mmc/sunxi_mmc.c
index 06c1e09bf26..7c85030be16 100644
--- a/drivers/mmc/sunxi_mmc.c
+++ b/drivers/mmc/sunxi_mmc.c
@@ -99,6 +99,15 @@ static int mmc_set_mod_clk(struct sunxi_mmc_priv *priv, unsigned int hz)
 		 */
 		if (IS_ENABLED(CONFIG_MACH_SUN8I_R528))
 			pll_hz /= 2;
+
+		/*
+		 * The A523/T527 uses PERIPH0_400M as the MMC input clock,
+		 * which is the PERIPH0 nominal rate (1200MHz) / 3.
+		 * Together with the fixed post-divider of 2 of the MMC mod
+		 * clock, that gives a divider of 6.
+		 */
+		if (IS_ENABLED(CONFIG_MACH_SUN55I_A523))
+			pll_hz /= 6;
 	}
 
 	div = pll_hz / hz;
@@ -153,6 +162,10 @@ static int mmc_set_mod_clk(struct sunxi_mmc_priv *priv, unsigned int hz)
 			CCM_MMC_CTRL_SCLK_DLY(sclk_dly);
 	}
 
+	/* The A523 has a second divider, not a shift. */
+	if (IS_ENABLED(CONFIG_MACH_SUN55I_A523))
+		n = (1U << n) - 1;
+
 	writel(CCM_MMC_CTRL_ENABLE| pll | CCM_MMC_CTRL_N(n) |
 	       CCM_MMC_CTRL_M(div) | val, priv->mclkreg);
 
@@ -559,7 +572,8 @@ struct mmc *sunxi_mmc_init(int sdc_no)
 	cfg->host_caps = MMC_MODE_4BIT;
 
 	if ((IS_ENABLED(CONFIG_MACH_SUN50I) || IS_ENABLED(CONFIG_MACH_SUN8I) ||
-	    IS_ENABLED(CONFIG_SUN50I_GEN_H6)) && (sdc_no == 2))
+	    IS_ENABLED(CONFIG_SUN50I_GEN_H6) || IS_ENABLED(CONFIG_MACH_SUN55I_A523)) &&
+	    (sdc_no == 2))
 		cfg->host_caps = MMC_MODE_8BIT;
 
 	cfg->host_caps |= MMC_MODE_HS_52MHz | MMC_MODE_HS;
-- 
2.46.3

