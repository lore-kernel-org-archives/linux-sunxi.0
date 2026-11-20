Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795171545;
	b=PUasISjHeHyZy6D3Z4L0vyaAE9SO4yX3sdCdKjOK+symtidDbPZAZh8vwn7m5xm3UQs1
	 z2qa2UKBwOkNCunk6hfZzQnGbcNgKilEoC7oYTDxaUqlkVZ+AGoQc5hPmalyMH/p12n+j
	 rVRrOer1jDFgUpp5uImlhwcFW+IF8Hr9gtQIY1vYP26UYGoqdy4Bd5nDKRVIqK3BHmpWO
	 J/rF0NmRbF+3jwY4EzsWxJ2AkoyEiIWn4G12bSpn04hTGByQEPg7XBsy+jCocCup6lIh7
	 qKA1AXxHkePyzawrzYSJQJSQkvcPecbU+NeH8nJiwSFBvFsEDUr6wOPIFGiVT+gVicQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171545;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ahkjr2QjTf459AzIyoEmXwHYbuW/drAV6xi8PB3pHC8=;
	b=l+rLMquoP6tExVV0v2s5IUMO+4oNPoMyYFjGnfd2Fm3Rra/cUefU7PRuyWP375Zrursu
	 NJOutv2JpK0KKR5yrzaDBT3DbRxl0VLOEWZhKBjMX1TPnHhcFsDq08EmN3pLaJVdhG7S/
	 dKEBSoU/kQhass+lZu3zKP4jipGTy/L+uWNaC/OtTvenvQdXmcXPRCzhSz0J8caA+8xLv
	 iCow+DgY5RU/0B/fpVO2XpFXNJTJYlS4zzQoo/cM5F0OWVSecwdnUvmEopnUQwimbze+M
	 OvIbibLy/VggDgYpz3OhWV5H4llC7rLrahSBtyS68pcu9SE5SIi/Hf9BLbVr9Q1fwiA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oIajaDUh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8433060A261F;
	Fri, 20 Nov 2026 10:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oIajaDUh
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795171545;
	b=D64irciVEMczg/LqP/BXbl32fgKpwt9tolgaPtJd/8PKnAZ2iVvdF44gR5tQJF9/MpSl
	 33r5ehWUecr1nI6jJ0PD73Nui/hrmvLMvI8KNsqbR0tS4hcCvHGKkAxBYKFkUbMvDNiIX
	 84tI0qLfzHd4jkoUMy1ocMgvNCJdbO9KlHb5GKR4I6wIU4i1B/hLwFYelJ9hj+Hed2xjv
	 KcHvCG+6DDN6DAGsmfEYUo1omWnX4x8jnqEIoFhzSpWoeWCqnZAM3cd8/xcpYD3Np6djm
	 mbtEoboSEn2PII275WcZBN4l7kPzohTm5xaC5e0Qm94GR0JIHBFoabZM2sxUvUECLeQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795171545;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ahkjr2QjTf459AzIyoEmXwHYbuW/drAV6xi8PB3pHC8=;
	b=oQwcEIoziUwVhOvHuXqDkr/IaxQ9YRcAzFaBKQQ88HJjHJAT94q1cSJdWdsRZDC7jMw7
	 YIcfQpuiSkZZ7DMjGHSCj9kRhYalCfO0QCLOfgoL9sVknVehMQE6xJzLE7fWzm/TS5uEk
	 xe6HaONyKXVwmBVN9hlDo8tUKXkbO6TPlXf3yZx520wOKTkCOXaDU+NVya3BSTqIHd+ir
	 UnsFufdFhK2JMselvrLFMETzG8NdwWVKdzdaOts/BB+0Wp8G9vy2v6su7c3R5MyHZmQ81
	 ZO54+kXvlK1Ij41VObFFh6VtIJ+2pvDobKQOuNXrIrMZS7Iep17Nm+Se/kPzs3Vh1bA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3A86B1F000EC;
	Fri, 20 Nov 2026 10:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795171545;
	bh=ahkjr2QjTf459AzIyoEmXwHYbuW/drAV6xi8PB3pHC8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=oIajaDUh7QxVuPYxJaDINddiwMjFOXVuEIEKW7iYSHOhDhQD+xeQqAs9QOJCRUIxP
	 Y+IxYjc9tpLDyfiXAzd4/4B/Bunsfol0oAsnASdp0yG6WlJOA6nzW9007/S4WiA0y+
	 APppqiABU/ABb1E7a4Va0PHDM8Qa/VOsfiuIni/CI1y3Zy5UhS9QA3AvLJmgje17Yh
	 sibminyxbAtKvN2elzl+3mGh6Ntj4uE2R0sYZMa3Q9b7uBTK4jIz/wqk7MjjH1Gakt
	 62FZMEog4pTbdqTaOaBzNOj3n2CWy7joPFyM8ze3O6J/B0baZqgbGn3DIH3632vyq6
	 uRhelbv1sAmzA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B97B94980C;
	Fri, 20 Nov 2026 10:45:32 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Fri, 20 Nov 2026 10:45:33 +0000
Subject: [PATCH net-next v4 2/5] net: stmmac: dwmac-sun8i: Get the EPHY
 clock and reset before the MAC probe
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261120-sun8i-emac-mux-uaf-v4-2-57eba8915f25@gmail.com>
References: <20261120-sun8i-emac-mux-uaf-v4-0-57eba8915f25@gmail.com>
In-Reply-To: <20261120-sun8i-emac-mux-uaf-v4-0-57eba8915f25@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
 linux-kernel@vger.kernel.org, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795171532; l=3805;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=IdMjizPApK7IJxwnRCjJXsAyYZSFVRhsVd8BmZt3Fgs=;
 b=5BvxnoZxuBiioBsyYI1RdFJonVr9LRE4yUrmIvOeDDsGWqhVxmKiIB8x5qTud5s8kzLFgtSzC
 vxqVUydt9h4B/Duiy9kNZCXuUjaygHx8I1I/kyOJPIY84a/6IS9Gor9
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

get_ephy_nodes() runs after stmmac_pltfr_probe() has registered the
netdev, so its -EPROBE_DEFER comes too late. An EPHY clock that is not
ready yet does not defer at all: the node is skipped and the probe
fails with -ENODEV.

Look up the clock and reset before stmmac_pltfr_probe(), and defer on
the clock as on the reset.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 34 ++++++++++++++---------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 9fb398f7cf9e..4acfda235394 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -775,16 +775,15 @@ static void sun8i_dwmac_flow_ctrl(struct mac_device_info *hw,
 }
 
 /* Search in mdio-mux node for internal PHY node and get its clk/reset */
-static int get_ephy_nodes(struct stmmac_priv *priv)
+static int get_ephy_nodes(struct device *dev, struct sunxi_priv_data *gmac)
 {
-	struct sunxi_priv_data *gmac = priv->plat->bsp_priv;
 	struct device_node *mdio_internal;
 	struct device_node *mdio_mux;
 	int ret;
 
-	mdio_mux = of_get_child_by_name(priv->device->of_node, "mdio-mux");
+	mdio_mux = of_get_child_by_name(dev->of_node, "mdio-mux");
 	if (!mdio_mux) {
-		dev_err(priv->device, "Cannot get mdio-mux node\n");
+		dev_err(dev, "Cannot get mdio-mux node\n");
 		return -ENODEV;
 	}
 
@@ -792,7 +791,7 @@ static int get_ephy_nodes(struct stmmac_priv *priv)
 						"allwinner,sun8i-h3-mdio-internal");
 	of_node_put(mdio_mux);
 	if (!mdio_internal) {
-		dev_err(priv->device, "Cannot get internal_mdio node\n");
+		dev_err(dev, "Cannot get internal_mdio node\n");
 		return -ENODEV;
 	}
 
@@ -801,8 +800,13 @@ static int get_ephy_nodes(struct stmmac_priv *priv)
 		struct clk *ephy_clk;
 
 		ephy_clk = of_clk_get(iphynode, 0);
-		if (IS_ERR(ephy_clk))
+		if (IS_ERR(ephy_clk)) {
+			if (PTR_ERR(ephy_clk) == -EPROBE_DEFER) {
+				of_node_put(mdio_internal);
+				return -EPROBE_DEFER;
+			}
 			continue;
+		}
 		gmac->rst_ephy = of_reset_control_get_exclusive(iphynode, NULL);
 		if (IS_ERR(gmac->rst_ephy)) {
 			ret = PTR_ERR(gmac->rst_ephy);
@@ -814,7 +818,7 @@ static int get_ephy_nodes(struct stmmac_priv *priv)
 			continue;
 		}
 		gmac->ephy_clk = ephy_clk;
-		dev_info(priv->device, "Found internal PHY node\n");
+		dev_info(dev, "Found internal PHY node\n");
 		of_node_put(mdio_internal);
 		return 0;
 	}
@@ -1209,9 +1213,15 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 	plat_dat->tx_fifo_size = 4096;
 	plat_dat->rx_fifo_size = 16384;
 
+	if (gmac->variant->soc_has_internal_phy) {
+		ret = get_ephy_nodes(dev, gmac);
+		if (ret)
+			return ret;
+	}
+
 	ret = sun8i_dwmac_set_syscon(&pdev->dev, plat_dat);
 	if (ret)
-		return ret;
+		goto dwmac_ephy;
 
 	ret = stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
 	if (ret)
@@ -1230,9 +1240,6 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 	 * so after stmmac_dvr_probe()
 	 */
 	if (gmac->variant->soc_has_internal_phy) {
-		ret = get_ephy_nodes(priv);
-		if (ret)
-			goto dwmac_remove;
 		ret = sun8i_dwmac_register_mdio_mux(priv);
 		if (ret) {
 			dev_err(&pdev->dev, "Failed to register mux\n");
@@ -1247,10 +1254,11 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 dwmac_remove:
 	pm_runtime_put_noidle(&pdev->dev);
 	stmmac_pltfr_remove(pdev);
-	reset_control_put(gmac->rst_ephy);
-	clk_put(gmac->ephy_clk);
 dwmac_syscon:
 	sun8i_dwmac_unset_syscon(gmac);
+dwmac_ephy:
+	reset_control_put(gmac->rst_ephy);
+	clk_put(gmac->ephy_clk);
 
 	return ret;
 }

-- 
2.55.0


