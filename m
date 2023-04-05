Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0525033ED
	for <linux-sunxi@lists.linux.dev>; Wed,  5 Apr 2023 14:10:38 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pk3q6-0003Gd-5b; Wed, 05 Apr 2023 16:10:18 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pk3q5-009AcB-Ge; Wed, 05 Apr 2023 16:10:17 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pk3q4-00AmUB-5w; Wed, 05 Apr 2023 16:10:16 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Bin Liu <b-liu@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	kernel@pengutronix.de
Subject: [PATCH 08/10] usb: musb: sunxi: Convert to platform remove callback returning void
Date: Wed,  5 Apr 2023 16:10:07 +0200
Message-Id: <20230405141009.3400693-9-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230405141009.3400693-1-u.kleine-koenig@pengutronix.de>
References: <20230405141009.3400693-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1723; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=VGy668YjNWEOyE9jlokD5shLJgWu2+buOf3F85pJEhw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkLYE5nUtPCluhFwk7HJgsIfzc/ASCOAvSSwMHx aB5wp0TUjWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZC2BOQAKCRCPgPtYfRL+ TochB/0fSfsfOZmiWE3YGBXkM9CLeY37F+JhJp8fxt38Kl0QbaeEHTMocCk2SRrVUgaV38SWmRW BDO6S3a1CfB/1nuaRThsJLKQx08WJspRNArSQnOHPMAQ8vvFaOXa65EUP9IkfLL6CyMyLbFpPRr O8QUj8901MWJKv5ONV4UPKT408HAd17ojVBvdQJMH41uOrs5358Dc+e0f93s87k16L8MRSR3ep6 w2P8jscxPHFp1s4pe8Nmk48DnGWZiKiiKD3ofkHW03ECfS/97Ow+i4PmOHaIPInnXLe/PprmjDK CYQ76pAWaO89Vo8c+a36t8Y5K55Ub8psu77YBTwFdKsPSZnd
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
 drivers/usb/musb/sunxi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/musb/sunxi.c b/drivers/usb/musb/sunxi.c
index 9b622cd9b2bd..c5c6c4e09300 100644
--- a/drivers/usb/musb/sunxi.c
+++ b/drivers/usb/musb/sunxi.c
@@ -805,15 +805,13 @@ static int sunxi_musb_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int sunxi_musb_remove(struct platform_device *pdev)
+static void sunxi_musb_remove(struct platform_device *pdev)
 {
 	struct sunxi_glue *glue = platform_get_drvdata(pdev);
 	struct platform_device *usb_phy = glue->usb_phy;
 
 	platform_device_unregister(glue->musb_pdev);
 	usb_phy_generic_unregister(usb_phy);
-
-	return 0;
 }
 
 static const struct sunxi_musb_cfg sun4i_a10_musb_cfg = {
@@ -862,7 +860,7 @@ MODULE_DEVICE_TABLE(of, sunxi_musb_match);
 
 static struct platform_driver sunxi_musb_driver = {
 	.probe = sunxi_musb_probe,
-	.remove = sunxi_musb_remove,
+	.remove_new = sunxi_musb_remove,
 	.driver = {
 		.name = "musb-sunxi",
 		.of_match_table = sunxi_musb_match,
-- 
2.39.2

