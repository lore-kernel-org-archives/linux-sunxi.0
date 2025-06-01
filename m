Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C69D748F
	for <linux-sunxi@lists.linux.dev>; Sun,  1 Jun 2025 15:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748792590; cv=none; b=N+f44B8pHFNG1/+SGOApNEDO0K04vdlg0092wuEOhh3r3C8eeuzkuPP6RqV/8dbsJ2Q178b9drhZriIyT8wM4AJfZm+NP6ncm0ADbMMHFwBkGVlNE0ywqUdU0pRBGOVr8K+azFNQmSv2Bw4sABWW2I7fArWodiDxyc3uBKhmq8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748792590; c=relaxed/simple;
	bh=oa1YvIPvW4cdHZum0m45M7KIQTkPhZmn0qPCCmAXdFI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kfNQ4KvCb+10swc5hZUV8bP0wJfTBpExMuhvMGh6MEhbMuPw2kEO6gIKTV14AlIAYfHO0QwnVBeSa9SlQU/FzvSGU8eTbwYuArWN/Ei4XdeF9HFSSZS3qXAJZKzBKLsJ22Y3+OJJ3uXQ5duzbRqUP5EszlzxycthWFWLwZVNY54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=paulk.fr; spf=pass smtp.mailfrom=paulk.fr; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=paulk.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paulk.fr
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 6F9E31F00047
	for <linux-sunxi@lists.linux.dev>; Sun,  1 Jun 2025 15:43:06 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id EA057AC32F6; Sun,  1 Jun 2025 15:43:05 +0000 (UTC)
X-Spam-Level: *
Received: from localhost.localdomain (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id 6703BAC32E3;
	Sun,  1 Jun 2025 15:40:00 +0000 (UTC)
From: Paul Kocialkowski <contact@paulk.fr>
To: u-boot@lists.denx.de
Cc: Tom Rini <trini@konsulko.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Icenowy Zheng <icenowy@aosc.xyz>,
	linux-sunxi@lists.linux.dev,
	Paul Kocialkowski <contact@paulk.fr>
Subject: [PATCH 6/6] net: sun8i-emac: Add support for active-low leds with internal PHY
Date: Sun,  1 Jun 2025 17:39:43 +0200
Message-ID: <20250601153943.2690123-7-contact@paulk.fr>
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

A device-tree property is already defined to indicate that the internal
PHY should be used with active-low leds, which corresponds to a
specific bit in the dedicated syscon register.

Add support for setting this bit when the property is present.

Signed-off-by: Paul Kocialkowski <contact@paulk.fr>
---
 drivers/net/sun8i_emac.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/net/sun8i_emac.c b/drivers/net/sun8i_emac.c
index 8433e7db2654..990a184e4b1f 100644
--- a/drivers/net/sun8i_emac.c
+++ b/drivers/net/sun8i_emac.c
@@ -176,6 +176,7 @@ struct sun8i_eth_pdata {
 	u32 reset_delays[3];
 	int tx_delay_ps;
 	int rx_delay_ps;
+	bool leds_active_low;
 };
 
 static int sun8i_mdio_read(struct mii_dev *bus, int addr, int devad, int reg)
@@ -287,7 +288,8 @@ static void sun8i_adjust_link(struct emac_eth_dev *priv,
 	writel(v, priv->mac_reg + EMAC_CTL0);
 }
 
-static u32 sun8i_emac_set_syscon_ephy(struct emac_eth_dev *priv, u32 reg)
+static u32 sun8i_emac_set_syscon_ephy(struct sun8i_eth_pdata *pdata,
+				      struct emac_eth_dev *priv, u32 reg)
 {
 	if (priv->use_internal_phy) {
 		/* H3 based SoC's that has an Internal 100MBit PHY
@@ -295,6 +297,10 @@ static u32 sun8i_emac_set_syscon_ephy(struct emac_eth_dev *priv, u32 reg)
 		*/
 		reg &= ~H3_EPHY_DEFAULT_MASK;
 		reg |=  H3_EPHY_DEFAULT_VALUE;
+
+		if (pdata->leds_active_low)
+			reg |= H3_EPHY_LED_POL;
+
 		reg |= priv->phyaddr << H3_EPHY_ADDR_SHIFT;
 		reg &= ~H3_EPHY_SHUTDOWN;
 		return reg | H3_EPHY_SELECT;
@@ -314,7 +320,7 @@ static int sun8i_emac_set_syscon(struct sun8i_eth_pdata *pdata,
 
 	reg = readl(priv->sysctl_reg);
 
-	reg = sun8i_emac_set_syscon_ephy(priv, reg);
+	reg = sun8i_emac_set_syscon_ephy(pdata, priv, reg);
 
 	reg &= ~(SC_ETCS_MASK | SC_EPIT);
 	if (priv->variant->support_rmii)
@@ -859,6 +865,10 @@ static int sun8i_emac_eth_of_to_plat(struct udevice *dev)
 		printf("%s: Invalid RX delay value %d\n", __func__,
 		       sun8i_pdata->rx_delay_ps);
 
+	sun8i_pdata->leds_active_low =
+		fdtdec_get_bool(gd->fdt_blob, dev_of_offset(dev),
+				"allwinner,leds-active-low");
+
 	if (fdtdec_get_bool(gd->fdt_blob, dev_of_offset(dev),
 			    "snps,reset-active-low"))
 		reset_flags |= GPIOD_ACTIVE_LOW;
-- 
2.49.0

