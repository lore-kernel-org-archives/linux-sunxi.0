Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1FB5322A
	for <linux-sunxi@lists.linux.dev>; Wed, 26 Feb 2025 11:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740569845; cv=none; b=DKlPGdkyNxHf44A8Fh3FEIQlbStwk/l0LLfivVgke4PbTCvFVYA0q3h9DLTKHs19d3tJ61pRqrlOnT6cM0z37Wke93kSw7h2AheHCMVuTwYUlZFar1CaQv+cwKIPWQAczlY8YmX4dwtKskOrDLL5h4BGuHYfanNMx2NAnJDi8+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740569845; c=relaxed/simple;
	bh=f7y02WWaBWU+1ZiADLMvg4cEouuOr18QK7tg7o5qYxY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mcJil3fGxmycDcqMbs28lZU7aRdpaECbWTWd33/n/0PluirtgQ6NkC5njkILVKyjTE5N9QBngTCyl8tBJce1dXCCvvLmvRweoI4gmlxitgzxlqumHyRtVNl+EvKGWFwlKnmsZzhOAPMiRGF6U7e5wnIXh4TH0tD3tWsV4IOnlns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 141521BA8;
	Wed, 26 Feb 2025 03:37:39 -0800 (PST)
Received: from donnerap.arm.com (donnerap.manchester.arm.com [10.32.100.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 803593F673;
	Wed, 26 Feb 2025 03:37:21 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Peng Fan <peng.fan@nxp.com>,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Tom Rini <trini@konsulko.com>
Cc: Simon Glass <sjg@chromium.org>,
	=?UTF-8?q?Kuba=20Szczodrzy=C5=84ski?= <kuba@szczodrzynski.pl>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Icenowy Zheng <icenowy@aosc.io>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 1/2] sunxi: mmc: Fix T113-s3 MMC clock divider
Date: Wed, 26 Feb 2025 11:37:11 +0000
Message-Id: <20250226113712.1257061-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250226113712.1257061-1-andre.przywara@arm.com>
References: <20250226113712.1257061-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On the Allwinner D1/R528/T113-s3 SoCs the MMC clock source selected by
mux value 1 is PLL_PERIPH0(1x), not (2x), as in the other SoCs.
But we have still the hidden divisor of 2 in the MMC mod clock, so
need to explicitly compensate for that on those SoCs.

This leads to the actually programmed clock rate to be double compared
to before, which increases the MMC performance on those SoCs.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Reported-by: Kuba Szczodrzyński <kuba@szczodrzynski.pl>
---
 drivers/mmc/sunxi_mmc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mmc/sunxi_mmc.c b/drivers/mmc/sunxi_mmc.c
index 0b56d1405be..8f72d758e46 100644
--- a/drivers/mmc/sunxi_mmc.c
+++ b/drivers/mmc/sunxi_mmc.c
@@ -92,6 +92,13 @@ static int mmc_set_mod_clk(struct sunxi_mmc_priv *priv, unsigned int hz)
 		pll = CCM_MMC_CTRL_PLL6;
 		pll_hz = clock_get_pll6();
 #endif
+		/*
+		 * On the D1/R528/T113 mux source 1 refers to PLL_PERIPH0(1x),
+		 * like for the older SoCs. However we still have the hidden
+		 * divider of 2x, so compensate for that here.
+		 */
+		if (IS_ENABLED(CONFIG_MACH_SUN8I_R528))
+			pll_hz /= 2;
 	}
 
 	div = pll_hz / hz;
-- 
2.25.1

