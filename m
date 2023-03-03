Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869931FA1
	for <linux-sunxi@lists.linux.dev>; Fri,  3 Mar 2023 17:21:26 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pY95f-000752-PW; Fri, 03 Mar 2023 18:21:07 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pY95e-001boV-Vi; Fri, 03 Mar 2023 18:21:06 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pY95e-001tma-1s; Fri, 03 Mar 2023 18:21:06 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mark Brown <broonie@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	kernel@pengutronix.de
Subject: [PATCH 74/87] spi: sun4i: Convert to platform remove callback returning void
Date: Fri,  3 Mar 2023 18:20:28 +0100
Message-Id: <20230303172041.2103336-75-u.kleine-koenig@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1556; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=99g9qdfvrSS6qm9iWAxK+wzfSUWBvdAyiijDNit3EBg=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkAiwqcCo3xWxzJzcGnx5prGyPVruiRtD7EF/nI rzT4XSvyLeJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAIsKgAKCRDB/BR4rcrs CckBB/0agkiww+BvoJrtKNgFUshm76/Smt+E19AaDyarBUQRqtRZcigP3f21l3295Q6R/hu99Pa sa2KlrRm/Jra77tPUetLZgcFAdm/q0sXkCgBbQEOcvNwQpugynZF4mT4ZPSUZ02ozIOeuK1FuRn tJVWmGD3o2TaEmBb1BCepyvPmM73TIj+j2Owj6GE0nWUp8jRuq0WD/n5ihe/EGypSfADYHjlO0k jOMJyoK7IRDmf8QIoTGS3UBIuj/20Fq0CZd+D43xvr04OWnXST12hrMaL5MbKOiLdD5+ln2Bu1G KekksLM1Kw/ux8f4t3sAukJq1sCip/gpUXbq6FI++cJTRQKE
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
 drivers/spi/spi-sun4i.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-sun4i.c b/drivers/spi/spi-sun4i.c
index 6000d0761206..994d0fb50e68 100644
--- a/drivers/spi/spi-sun4i.c
+++ b/drivers/spi/spi-sun4i.c
@@ -516,11 +516,9 @@ static int sun4i_spi_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int sun4i_spi_remove(struct platform_device *pdev)
+static void sun4i_spi_remove(struct platform_device *pdev)
 {
 	pm_runtime_force_suspend(&pdev->dev);
-
-	return 0;
 }
 
 static const struct of_device_id sun4i_spi_match[] = {
@@ -536,7 +534,7 @@ static const struct dev_pm_ops sun4i_spi_pm_ops = {
 
 static struct platform_driver sun4i_spi_driver = {
 	.probe	= sun4i_spi_probe,
-	.remove	= sun4i_spi_remove,
+	.remove_new = sun4i_spi_remove,
 	.driver	= {
 		.name		= "sun4i-spi",
 		.of_match_table	= sun4i_spi_match,
-- 
2.39.1

