Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA50423A9A6
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Mar 2025 09:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741771267; cv=none; b=LRw8b+Fz3kijz0pICvXOK6eZZ/yKzzysqBIzYOZFbtqT1b6dbmwxke5KWgm5l38nO+rCR5rIWGzJwaEc5R23EmhPNZVjupoTj04TWUNuGXW3Fo5YWaI9dz30fqsbw9Kv4ots78tpGE4QJ8eTo7dm7CPupS4V5PbATuaE+GKHe5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741771267; c=relaxed/simple;
	bh=dOZssBvmyupLhzaL5/4B+4uI6v7cl02DJv/MRpZ8BAw=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=mg3QWbMyb6Z6NQuN6bi06PtcK2lwQNoux2FtpWLgFD83PavsksXPrTVZjt1Vmi51+bHTG9tswU4b/onUrRyX3BvENC6tbKANf9vp17dlrvp8YD9+m/ujDeKE7p8X/7XtawmAbubn56Th4v4i96T7p95psi93RF6Exs5Qe2FnYnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=jBcSywxC; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="jBcSywxC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KNEx5jzwPvwr7ykDlaOKF6gqglD3Hpy85JFTNBLEoE0=; b=jBcSywxCqB/W8XhBRI64/ZCifq
	/E7pDVm/9rG1Cpvnsgantc1dpBTFBrWYn3ANxeT+QhpW3qyMw+ctpcXtIF1aDkpX8gXwYFuKeebog
	aK1XXzHiGeKOmoRb4BE5E7U+lvdjSGi9A/c0liJgX5EuUdjTE6Vd6f5udnpRI/wtW9YYYe8S24816
	L9WeRPGM/qhUADHV1ZypzvrjURk3Mc6bJjWvHtWQZ+aZbd+redGf6rTAKIn11JmZPUVjSXB1q1hbe
	uZXWmn4FX/0xOmB09NukpAYNIKBaY1W4RZBLubRe7xcjRRqUyk1zsn7V7CK6dVYZ7RnIYTp4qo9QW
	y+/SYyGQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:39526 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tsIGi-0005BT-2O;
	Wed, 12 Mar 2025 09:20:52 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tsIGN-005uzZ-NG; Wed, 12 Mar 2025 09:20:31 +0000
In-Reply-To: <Z9FQjQZb0IMaQJ9H@shell.armlinux.org.uk>
References: <Z9FQjQZb0IMaQJ9H@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wens@csie.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Samuel Holland <samuel@sholland.org>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next v2 2/9] net: stmmac: mediatek: remove
 of_get_phy_mode()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tsIGN-005uzZ-NG@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Wed, 12 Mar 2025 09:20:31 +0000

devm_stmmac_probe_config_dt() already gets the PHY mode from firmware,
which is stored in plat_dat->phy_interface. Therefore, we don't need to
get it in platform code.

Initialise priv_plat->phy_mode from plat->phy_interface
inmediatek_dwmac_common_data().

Reviewed-by: Michal Kubiak <michal.kubiak@intel.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
index c9636832a570..d178d5ddc7c7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
@@ -456,7 +456,6 @@ static int mediatek_dwmac_config_dt(struct mediatek_dwmac_plat_data *plat)
 {
 	struct mac_delay_struct *mac_delay = &plat->mac_delay;
 	u32 tx_delay_ps, rx_delay_ps;
-	int err;
 
 	plat->peri_regmap = syscon_regmap_lookup_by_phandle(plat->np, "mediatek,pericfg");
 	if (IS_ERR(plat->peri_regmap)) {
@@ -464,12 +463,6 @@ static int mediatek_dwmac_config_dt(struct mediatek_dwmac_plat_data *plat)
 		return PTR_ERR(plat->peri_regmap);
 	}
 
-	err = of_get_phy_mode(plat->np, &plat->phy_mode);
-	if (err) {
-		dev_err(plat->dev, "not find phy-mode\n");
-		return err;
-	}
-
 	if (!of_property_read_u32(plat->np, "mediatek,tx-delay-ps", &tx_delay_ps)) {
 		if (tx_delay_ps < plat->variant->tx_delay_max) {
 			mac_delay->tx_delay = tx_delay_ps;
@@ -587,6 +580,7 @@ static int mediatek_dwmac_common_data(struct platform_device *pdev,
 {
 	int i;
 
+	priv_plat->phy_mode = plat->phy_interface;
 	plat->mac_interface = priv_plat->phy_mode;
 	if (priv_plat->mac_wol)
 		plat->flags &= ~STMMAC_FLAG_USE_PHY_WOL;
-- 
2.30.2

