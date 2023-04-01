Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD393C39
	for <linux-sunxi@lists.linux.dev>; Sat,  1 Apr 2023 16:20:08 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxO-0000H3-NT; Sat, 01 Apr 2023 18:19:58 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxM-008GT3-M6; Sat, 01 Apr 2023 18:19:56 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxL-009ki1-Tu; Sat, 01 Apr 2023 18:19:55 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	kernel@pengutronix.de
Subject: [PATCH 46/49] mtd: rawnand: sunxi: Convert to platform remove callback returning void
Date: Sat,  1 Apr 2023 18:19:35 +0200
Message-Id: <20230401161938.2503204-47-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1784; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=X08OgOol1r208v7SCAuNsUZxIRp3p+XIkNYqv7E4PHI=; b=owGbwMvMwMXY3/A7olbonx/jabUkhhSNyKCo+xreZc9zV8yU2Oldn8YmpmtaVS3SNHWHwrkTq SZWMYc6GY1ZGBi5GGTFFFnsG9dkWlXJRXau/XcZZhArE8gUBi5OAZjIoXPs/xRCHErE9lhOFfhr rvixW1s9IPn0X48I7hPuaZudfAx+3dQ8OFdLWrHCb7nk0+a+VUrVfgXfnm+2Wbhq+YSTy2dwcs+ 8e2tFQdANicKeA6zJNw7M6PZw2fj89Zk70kGa/h/eeOV5bOzPXqBtae5UWLf2N6/T6fYfhZ0dS+ Wbb13Ub7QIqTUpqTt5lq2ivUeB1ShjgmuPR/CaxnW3fu/5lVJ1S/72oUXSj1m3Ho27/nBZ5h5t5 YYfl9ikhC4ozomcsKcnIKxkYs+K1PBT+uqJ91Q9PTdN8WF7kKk1N3ddjXBC29RC6bV8SZse1My9 W8pkWy4mXp94ZOkj/qCL7z7r1iis4swumHU3uD9p7oG9AA==
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
 drivers/mtd/nand/raw/sunxi_nand.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 13e3e0198d15..9884304634f6 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -2173,7 +2173,7 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int sunxi_nfc_remove(struct platform_device *pdev)
+static void sunxi_nfc_remove(struct platform_device *pdev)
 {
 	struct sunxi_nfc *nfc = platform_get_drvdata(pdev);
 
@@ -2185,8 +2185,6 @@ static int sunxi_nfc_remove(struct platform_device *pdev)
 		dma_release_channel(nfc->dmac);
 	clk_disable_unprepare(nfc->mod_clk);
 	clk_disable_unprepare(nfc->ahb_clk);
-
-	return 0;
 }
 
 static const struct sunxi_nfc_caps sunxi_nfc_a10_caps = {
@@ -2219,7 +2217,7 @@ static struct platform_driver sunxi_nfc_driver = {
 		.of_match_table = sunxi_nfc_ids,
 	},
 	.probe = sunxi_nfc_probe,
-	.remove = sunxi_nfc_remove,
+	.remove_new = sunxi_nfc_remove,
 };
 module_platform_driver(sunxi_nfc_driver);
 
-- 
2.39.2

