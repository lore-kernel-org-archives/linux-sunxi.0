Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A844C14AD17
	for <linux-sunxi@lists.linux.dev>; Thu, 29 Aug 2024 06:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724912603; cv=none; b=RW+JxRuY1LvCjtNAfRfPGg90rDiVPd6E/HhU4puBMfY9Pv3KEcwD/+nJzwgUsgzkqhM092LThJdmSMJSVfWSNW9VtUwUs1B3daH4DgTXaHGcFILN2rqU9nqKs+OJjcTyQtzsnfBNT0G4MunJTuGvH+jdTpQrpIWGxY/o3fMAatg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724912603; c=relaxed/simple;
	bh=fo6dAkCUFJMXJgHrnZ+QObFp9zoEaQSZapQdcOQgbNk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TBmifDtefYJibVXcA9Zu74iBA7UYNwSuE/Q1i82xV+C9tVcOE6KLBAIlipHa5adhAPuEUDK09DG7g1LDs2f8l1RcOpWFPXQr0rkESoEDBiHUFlBWwgiwIlVB6wnF/ReZsUJyZu1o1dbRPWs6qWFDzm3yXJoXp8iKEWHiNphWV7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4WvWR94vfszyQTH;
	Thu, 29 Aug 2024 14:22:29 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 35D2618007C;
	Thu, 29 Aug 2024 14:23:19 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 29 Aug
 2024 14:23:18 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <woojung.huh@microchip.com>, <andrew@lunn.ch>, <f.fainelli@gmail.com>,
	<olteanv@gmail.com>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <linus.walleij@linaro.org>,
	<alsi@bang-olufsen.dk>, <justin.chen@broadcom.com>,
	<sebastian.hesselbarth@gmail.com>, <alexandre.torgue@foss.st.com>,
	<joabreu@synopsys.com>, <wens@csie.org>, <jernej.skrabec@gmail.com>,
	<samuel@sholland.org>, <mcoquelin.stm32@gmail.com>, <hkallweit1@gmail.com>,
	<linux@armlinux.org.uk>, <ansuelsmth@gmail.com>,
	<UNGLinuxDriver@microchip.com>, <netdev@vger.kernel.org>,
	<bcm-kernel-feedback-list@broadcom.com>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
	<krzk@kernel.org>, <jic23@kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH net-next v3 01/13] net: stmmac: dwmac-sun8i: Use for_each_child_of_node_scoped()
Date: Thu, 29 Aug 2024 14:31:06 +0800
Message-ID: <20240829063118.67453-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240829063118.67453-1-ruanjinjie@huawei.com>
References: <20240829063118.67453-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemh500013.china.huawei.com (7.202.181.146)

Avoid need to manually handle of_node_put() by using
for_each_child_of_node_scoped(), which can simplfy code.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
v3:
- Sort the variables, longest first, shortest last
- Add Reviewed-by.
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index cc93f73a380e..4a0ae92b3055 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -774,8 +774,8 @@ static int sun8i_dwmac_reset(struct stmmac_priv *priv)
 static int get_ephy_nodes(struct stmmac_priv *priv)
 {
 	struct sunxi_priv_data *gmac = priv->plat->bsp_priv;
-	struct device_node *mdio_mux, *iphynode;
 	struct device_node *mdio_internal;
+	struct device_node *mdio_mux;
 	int ret;
 
 	mdio_mux = of_get_child_by_name(priv->device->of_node, "mdio-mux");
@@ -793,7 +793,7 @@ static int get_ephy_nodes(struct stmmac_priv *priv)
 	}
 
 	/* Seek for internal PHY */
-	for_each_child_of_node(mdio_internal, iphynode) {
+	for_each_child_of_node_scoped(mdio_internal, iphynode) {
 		gmac->ephy_clk = of_clk_get(iphynode, 0);
 		if (IS_ERR(gmac->ephy_clk))
 			continue;
@@ -801,14 +801,12 @@ static int get_ephy_nodes(struct stmmac_priv *priv)
 		if (IS_ERR(gmac->rst_ephy)) {
 			ret = PTR_ERR(gmac->rst_ephy);
 			if (ret == -EPROBE_DEFER) {
-				of_node_put(iphynode);
 				of_node_put(mdio_internal);
 				return ret;
 			}
 			continue;
 		}
 		dev_info(priv->device, "Found internal PHY node\n");
-		of_node_put(iphynode);
 		of_node_put(mdio_internal);
 		return 0;
 	}
-- 
2.34.1

