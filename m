Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94133374C9
	for <linux-sunxi@lists.linux.dev>; Thu,  9 Nov 2023 20:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1r1BeH-000307-0E; Thu, 09 Nov 2023 21:29:09 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r1BeD-007rWn-TW; Thu, 09 Nov 2023 21:29:05 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r1BeD-00GGtj-K5; Thu, 09 Nov 2023 21:29:05 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Arnd Bergmann <arnd@arndb.de>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH 06/12] bus: sun50i-de2: Convert to platform remove callback returning void
Date: Thu,  9 Nov 2023 21:28:36 +0100
Message-ID: <20231109202830.4124591-7-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
In-Reply-To: <20231109202830.4124591-1-u.kleine-koenig@pengutronix.de>
References: <20231109202830.4124591-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1726; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=YjxQ9k2VhTNSjPuszXvrypquoQe61zCjR6hyAesl/x0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlTUD1h/FL212JBtXnUYvTOt6e/oAiPyWOeMRVg MwOBzqtJD2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZU1A9QAKCRCPgPtYfRL+ TtAtB/40Cw1OEL2T46KLdtC6CPWjFjNclqSJ+qr/t4mj2hWDKwQtf0kTynpCe6dsTwfyifEPBfQ d3VgfUp1eO2NYm9OBdHXDl32gc0MDmOoNpdgDKlCc6aYawUN/noK27PmoPWdFuEcm1VyU9uMAuX sR5pS1cctbTPPozjbI4Y43ApHt0iatVbNW2jxyRqQW7Ac+Bi/tfW+R4g2VJqQ3O78mZ3dSY5MLt q7CyCWxnhD1PXANJFoeNMAgGd65yzDtNxJ66WOLbB/W5SkCO0WrqOoVNBIBUmsCU7nTUwhDZUVT hIhBabSoRtg8sz8beNoY1SfoJ4H6moejJnD+pPh8i+i+h+2g
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-sunxi@lists.linux.dev

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.

To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new(), which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/bus/sun50i-de2.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/bus/sun50i-de2.c b/drivers/bus/sun50i-de2.c
index 414f29cdedf0..3339311ce068 100644
--- a/drivers/bus/sun50i-de2.c
+++ b/drivers/bus/sun50i-de2.c
@@ -24,10 +24,9 @@ static int sun50i_de2_bus_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int sun50i_de2_bus_remove(struct platform_device *pdev)
+static void sun50i_de2_bus_remove(struct platform_device *pdev)
 {
 	sunxi_sram_release(&pdev->dev);
-	return 0;
 }
 
 static const struct of_device_id sun50i_de2_bus_of_match[] = {
@@ -37,7 +36,7 @@ static const struct of_device_id sun50i_de2_bus_of_match[] = {
 
 static struct platform_driver sun50i_de2_bus_driver = {
 	.probe = sun50i_de2_bus_probe,
-	.remove = sun50i_de2_bus_remove,
+	.remove_new = sun50i_de2_bus_remove,
 	.driver = {
 		.name = "sun50i-de2-bus",
 		.of_match_table = sun50i_de2_bus_of_match,
-- 
2.42.0

