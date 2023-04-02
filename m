Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B6C2F2D
	for <linux-sunxi@lists.linux.dev>; Sun,  2 Apr 2023 14:31:18 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1piyjI-0002tv-B5; Sun, 02 Apr 2023 16:30:48 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1piyjF-008TQw-4g; Sun, 02 Apr 2023 16:30:45 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1piyjE-009zBt-I8; Sun, 02 Apr 2023 16:30:44 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	kernel@pengutronix.de
Subject: [PATCH net-next 10/11] net: stmmac: dwmac-sun8i: Convert to platform remove callback returning void
Date: Sun,  2 Apr 2023 16:30:24 +0200
Message-Id: <20230402143025.2524443-11-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230402143025.2524443-1-u.kleine-koenig@pengutronix.de>
References: <20230402143025.2524443-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1929; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=anKtvZugCAQ7612WUfgw0lecBejL8+CxdJGcr65UJQw=; b=owGbwMvMwMXY3/A7olbonx/jabUkhhTNiZWbugVTy1km2KinmF0Pjv5aWRTW155csLqkVPlcH pvCzJJORmMWBkYuBlkxRRb7xjWZVlVykZ1r/12GGcTKBDKFgYtTACayYiL7f38RnVcbu255Ptqc PydwSoNrUePp/s/ztx/ZqTX5Cu++7H0uBr7yZvVqhrUWO9etPL1uU2ap+PKK/u2xF86sb+n8L3b op7NshTbbzytGgq2Trp++HH7iqH1354LU8gUX+G31bz+3k2t3lTkh/XKXe1fg3qoInsMtGc/vxJ me4imuVM5TLJrgvS7+9f706rDwRNaEh388js6evc+GW1hP8KFb5JatWfpvF+Unxfb/XXron26IH zejvVWYtVkW477wbBm9rgzTYysMZJXmNyllmTL8DPpy3/2czH4O3V9zjp+uemG1WVn6KueRWWrN Fs/yGyN+ihttZ5X5evzyrKXZqtsK817Y3tN9zGEXFuMEAA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-sunxi@lists.linux.dev

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index f834472599f7..b12927c799ce 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -1282,7 +1282,7 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int sun8i_dwmac_remove(struct platform_device *pdev)
+static void sun8i_dwmac_remove(struct platform_device *pdev)
 {
 	struct net_device *ndev = platform_get_drvdata(pdev);
 	struct stmmac_priv *priv = netdev_priv(ndev);
@@ -1297,8 +1297,6 @@ static int sun8i_dwmac_remove(struct platform_device *pdev)
 
 	stmmac_pltfr_remove(pdev);
 	sun8i_dwmac_unset_syscon(gmac);
-
-	return 0;
 }
 
 static void sun8i_dwmac_shutdown(struct platform_device *pdev)
@@ -1329,7 +1327,7 @@ MODULE_DEVICE_TABLE(of, sun8i_dwmac_match);
 
 static struct platform_driver sun8i_dwmac_driver = {
 	.probe  = sun8i_dwmac_probe,
-	.remove = sun8i_dwmac_remove,
+	.remove_new = sun8i_dwmac_remove,
 	.shutdown = sun8i_dwmac_shutdown,
 	.driver = {
 		.name           = "dwmac-sun8i",
-- 
2.39.2

