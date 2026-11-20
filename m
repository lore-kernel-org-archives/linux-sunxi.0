Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795171543;
	b=nh/pcNI+YIKqOCTMbH/95REgn5HP6xFylOFE6TRo+lcYxSwAbBctmt8zIr8dF4uTNHmT
	 BLV6Yk6zVBd9PzGcjdBcmH3LG1kFiGAsOVXGdYaoPT9JLBW+dO0Uxe9jqgB7AqAWumSCe
	 t44bsPMIgBeR7tYMw8tbBV93QJW8cWfTAYpyZ58Y6pPa0F298kykoGqNxEjL9pTxcDXco
	 wbjrOEj7FAb97S2gWTRqHBwA6zMiaqfA7HBADGN4sh681UAuQqa08ZruzCXr3hr1dCtqm
	 Xg7R7Z2lZqdexTyXi/oBtDX9k2g4xrOQX0b2n1Xfw1N7IP9a7rnkPuNWsX/nPDDvAqQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171543;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ULv9Bdwa1mzjUCCyb50Jfy/iR+5Oeq3ji6ZCzv6E3po=;
	b=vqx43eVajseByQhA44ToN7/VJdjzkyONhlEx7FPmLyLW2Lj3qJoEIFpcZFFHyR6Y2KhW
	 LPYHkKL7yu7a51v2giitDtuL7fxmFjwqzhItn31cZfpXoeNKezFeEjzavwQ+/ErFqGg9C
	 b1QD7Hqk/cD/bm9BBLu7eEaLTZADnoS7+TQbc3lThFLlJZykK0WrkOK9I/YHYlBxcCdXG
	 QJK45icycXOWiRzazVtlmDEApFWLu9aXvAr+yZtaCYQD1VuCa6/FuUfDfSAvWe0cOeyWx
	 0M5TB9g4fY2KqHB321TETTa3cM6HSYBzERCVv5T1vTCHoKqHYZjogcAxGyurxEmKiQw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="JDK8l/2I";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB2B606A33D;
	Fri, 20 Nov 2026 10:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JDK8l/2I
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795171542;
	b=dKbHhZ5Y7PcP22YOo3dHPjyO6pFHhV9KNC1wTNidLmVyimy0BB99vPtJuh5tYRbPblYV
	 o5tHyneF6qVAZ5ZbOYLNJEM42pYBxz7TuKuAkcdqMvZ//gdv4E57qOcM5VOvndyIWoTJT
	 UGGx5aSY6SwdT5OfNj1SfGESpH7ZrCRcxCdoBdJBm3GNp6Yo+ZI4Vco2yZ6ED6W7ROHBu
	 ji/ClNlpdC0qb7c0iOi+cSnEFHlqN8KOg16oAEkY4EckTqtLzzGFzuQHIGOusupjgM1sD
	 UtvcDE59EgFUVbqgVr/G4TvCBEg/CQWlRTHC0x3vH3ZmkUcyE0Gw7/unJbIk919M5ig==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795171542;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ULv9Bdwa1mzjUCCyb50Jfy/iR+5Oeq3ji6ZCzv6E3po=;
	b=DryIxU6djca4XCGrI7Xy+YsKoXkD6Y/0bfLTQiX/cy5neAcIxswALWKpGEcTxdWmZlws
	 5m633KuH2Od/FFbaYcHFFodaVbcZhSz+uYRfpzVyuzOXFfl7yP0jdO46ooUgD0hzWBs5q
	 PPywdPpIHUi0zZtWXPsud5mTWojmv5XMDZI0AbkTCKytT/uK6KJIH8NnElsgdD0Zpecpk
	 y3Aay5ijvcAYanqnqH4KqeMs4UYHJEgJR7ApqjuhFfIJBJ6u0LPgdxm9XGtIeyxcKLG8W
	 O0Hfrj7Sdyv+aAFovvhrZLxrdsKTdEUcfv9ytI/MIrFh+p669FtQhcC/6PjuLj6NKPQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1EBE01F000D0;
	Fri, 20 Nov 2026 10:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795171542;
	bh=ULv9Bdwa1mzjUCCyb50Jfy/iR+5Oeq3ji6ZCzv6E3po=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=JDK8l/2I1yOVrldLOFPwF0zm0NFHXwviqT9VVbtv8xT6pUCOQM3tf0EHTUbILC5Ay
	 TPHuEtZwC5+v+P9piVpeuTQ14XjL93jWCcbZYfeMZ5/FZCHwGORiMO6aCt2RC0OK+v
	 GG3YTXzg9flY4fw6+K1UAzD1tnUwUKUyWI4zMQCy7llGH7llcPw9/IoN1DDJA8DyMA
	 ZpOnJ8fl6Wi8KthVL/16Q10o8aI3VDD1TORIpe3zL17ZUkX6tJTtcEvBEUkLcoBeaG
	 rliJYC07ER58S8Fy5STyiOJhj5d1LfiL1XWscZX4tJXsHMfbXZ+175/emeaPsV+XvO
	 miixZzsxcOMRg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9FA94497D5;
	Fri, 20 Nov 2026 10:45:32 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Fri, 20 Nov 2026 10:45:32 +0000
Subject: [PATCH net-next v4 1/5] net: stmmac: dwmac-sun8i: Put the EPHY
 clock and reset after the MAC
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
Message-Id: <20261120-sun8i-emac-mux-uaf-v4-1-57eba8915f25@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795171532; l=2122;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=zeDU/ie5mpEDPgDE4ZGiqAqgOX9E3SDKKC5wYWtaBU0=;
 b=t/igZe+xTX/0i5PLRfuaa1Gv+fjIDiunNi9b8S5A+ogJpuhxE/sI+198+B+rfmqwhYg382Lpz
 opxtf4+8pQwC1U4RUjk6F22wyRVooUvNNchEEitqd61roewZ0fdpDIE
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

sun8i_dwmac_exit() unpowers the internal PHY through ephy_clk and
rst_ephy, but the probe error path and sun8i_dwmac_remove() put both
before stmmac_pltfr_remove() calls it. If mdio_mux_init() fails after
the scan of the internal bus has powered the PHY, this is a
use-after-free.

Put them after stmmac_pltfr_remove(). The explicit unpower in remove()
is then redundant.

Suggested-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 2ece7ba9dd73..9fb398f7cf9e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -1236,7 +1236,7 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 		ret = sun8i_dwmac_register_mdio_mux(priv);
 		if (ret) {
 			dev_err(&pdev->dev, "Failed to register mux\n");
-			goto dwmac_mux;
+			goto dwmac_remove;
 		}
 	}
 
@@ -1244,12 +1244,11 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 
 	return 0;
 
-dwmac_mux:
-	reset_control_put(gmac->rst_ephy);
-	clk_put(gmac->ephy_clk);
 dwmac_remove:
 	pm_runtime_put_noidle(&pdev->dev);
 	stmmac_pltfr_remove(pdev);
+	reset_control_put(gmac->rst_ephy);
+	clk_put(gmac->ephy_clk);
 dwmac_syscon:
 	sun8i_dwmac_unset_syscon(gmac);
 
@@ -1262,14 +1261,12 @@ static void sun8i_dwmac_remove(struct platform_device *pdev)
 	struct stmmac_priv *priv = netdev_priv(ndev);
 	struct sunxi_priv_data *gmac = priv->plat->bsp_priv;
 
-	if (gmac->variant->soc_has_internal_phy) {
+	if (gmac->variant->soc_has_internal_phy)
 		mdio_mux_uninit(gmac->mux_handle);
-		sun8i_dwmac_unpower_internal_phy(gmac);
-		reset_control_put(gmac->rst_ephy);
-		clk_put(gmac->ephy_clk);
-	}
 
 	stmmac_pltfr_remove(pdev);
+	reset_control_put(gmac->rst_ephy);
+	clk_put(gmac->ephy_clk);
 	sun8i_dwmac_unset_syscon(gmac);
 }
 

-- 
2.55.0


