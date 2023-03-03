Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C008F4E
	for <linux-sunxi@lists.linux.dev>; Fri,  3 Mar 2023 17:21:26 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pY95f-00074l-LQ; Fri, 03 Mar 2023 18:21:07 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pY95e-001boQ-Si; Fri, 03 Mar 2023 18:21:06 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pY95e-001tmd-7m; Fri, 03 Mar 2023 18:21:06 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mark Brown <broonie@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	kernel@pengutronix.de
Subject: [PATCH 75/87] spi: sun6i: Convert to platform remove callback returning void
Date: Fri,  3 Mar 2023 18:20:29 +0100
Message-Id: <20230303172041.2103336-76-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230303172041.2103336-1-u.kleine-koenig@pengutronix.de>
References: <20230303172041.2103336-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1756; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=L9wdw5mZJD1vsaD4GQEwuVfgNTBs6fWoi0FoLR2rTVQ=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkAiwuITs6LHj/7rTzi+xymG3RU8lwSvLmlKteT 41KREEJwfuJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAIsLgAKCRDB/BR4rcrs CeCXB/sE2z5MFD566vGSlmJavCVDcZrF68yI0pBjuSqykzU3+Mkky/Sw1K39smK9bXqKPXy0H4N as9HApWNnhaeaguFYcjW1P5xANjs6VUa3Fs4n+85PZmiXRwN9sdfvI18SHX4pwnn3VgcE1j59SI RyF80D+eyk/ijOavSgh2X1D7MfG6OKari//TlmGg+5Ipt/aOJHoz6TXDuHizC+jnDI4qH0aZTEX 84YNldTZogH4gGtXbj7KJT3skxuTMmaZnhOujc20PzfAB3F92z9ROsQDycDZ1g45kEtHeCoHIFB zQ/0awKt9m8Bn2sLyhj/E5+RPDhjMer5OFGyvSYRtgWu6lOg
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
 drivers/spi/spi-sun6i.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-sun6i.c b/drivers/spi/spi-sun6i.c
index 23ad052528db..43c29afea6bb 100644
--- a/drivers/spi/spi-sun6i.c
+++ b/drivers/spi/spi-sun6i.c
@@ -683,7 +683,7 @@ static int sun6i_spi_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int sun6i_spi_remove(struct platform_device *pdev)
+static void sun6i_spi_remove(struct platform_device *pdev)
 {
 	struct spi_master *master = platform_get_drvdata(pdev);
 
@@ -693,7 +693,6 @@ static int sun6i_spi_remove(struct platform_device *pdev)
 		dma_release_channel(master->dma_tx);
 	if (master->dma_rx)
 		dma_release_channel(master->dma_rx);
-	return 0;
 }
 
 static const struct of_device_id sun6i_spi_match[] = {
@@ -710,7 +709,7 @@ static const struct dev_pm_ops sun6i_spi_pm_ops = {
 
 static struct platform_driver sun6i_spi_driver = {
 	.probe	= sun6i_spi_probe,
-	.remove	= sun6i_spi_remove,
+	.remove_new = sun6i_spi_remove,
 	.driver	= {
 		.name		= "sun6i-spi",
 		.of_match_table	= sun6i_spi_match,
-- 
2.39.1

