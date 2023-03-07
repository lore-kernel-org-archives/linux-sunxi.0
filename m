Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E553C00
	for <linux-sunxi@lists.linux.dev>; Tue,  7 Mar 2023 11:59:34 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pZVyI-0006T5-3W; Tue, 07 Mar 2023 12:59:10 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pZVyE-002TES-Vg; Tue, 07 Mar 2023 12:59:06 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pZVyE-002yij-Bb; Tue, 07 Mar 2023 12:59:06 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Icenowy Zheng <uwu@icenowy.me>
Cc: linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	kernel@pengutronix.de
Subject: [PATCH 01/31] phy: allwinner: phy-sun4i-usb: Convert to platform remove callback returning void
Date: Tue,  7 Mar 2023 12:58:30 +0100
Message-Id: <20230307115900.2293120-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230307115900.2293120-1-u.kleine-koenig@pengutronix.de>
References: <20230307115900.2293120-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1919; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=A5l2lPoT4HwDDiKEGOetfLehy9xFEfoPwry6wSlMEIE=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkByZ+ndr34KC6+DU92fWTYCRBx4D/esBgsXBP8 fUFnd0kDF2JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAcmfgAKCRDB/BR4rcrs Cd8FB/4sVyrd21Uvk3d9LFOA2z189btbrMjnjrgUaePBHfcLUhL4vOXbmh+Hm3zHVUXOPC5m4yd jvMxSaA2GokI/ztFBvHqe/3g6A2f4MsZktdk/T8OdYbnkm9b2aCeRmGKATFJcwTDz0DtWugU1QY RUxpwCRvXpBDxH+tkajVez4tK+ohcLarFEnQu+PjVZEvdOUobkPjgLxPuL1CwBnKj3xK04xpngu zBe6pG6tGfclP6hDb9j02r40kb6Ozk9jpCMz41gW0r7WP6mtBxGsPRVPnIaBNUdH+grYMZoTvoo WrVr7zHRDhP96xKjTwk/3OMViaZHUio00HXlgMtvddUi756R
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
 drivers/phy/allwinner/phy-sun4i-usb.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
index fbcd7014ab43..6a74e5ce180a 100644
--- a/drivers/phy/allwinner/phy-sun4i-usb.c
+++ b/drivers/phy/allwinner/phy-sun4i-usb.c
@@ -698,7 +698,7 @@ static struct phy *sun4i_usb_phy_xlate(struct device *dev,
 	return data->phys[args->args[0]].phy;
 }
 
-static int sun4i_usb_phy_remove(struct platform_device *pdev)
+static void sun4i_usb_phy_remove(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct sun4i_usb_phy_data *data = dev_get_drvdata(dev);
@@ -711,8 +711,6 @@ static int sun4i_usb_phy_remove(struct platform_device *pdev)
 		devm_free_irq(dev, data->vbus_det_irq, data);
 
 	cancel_delayed_work_sync(&data->detect);
-
-	return 0;
 }
 
 static const unsigned int sun4i_usb_phy0_cable[] = {
@@ -1054,7 +1052,7 @@ MODULE_DEVICE_TABLE(of, sun4i_usb_phy_of_match);
 
 static struct platform_driver sun4i_usb_phy_driver = {
 	.probe	= sun4i_usb_phy_probe,
-	.remove	= sun4i_usb_phy_remove,
+	.remove_new = sun4i_usb_phy_remove,
 	.driver = {
 		.of_match_table	= sun4i_usb_phy_of_match,
 		.name  = "sun4i-usb-phy",
-- 
2.39.1

