Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982F453AE
	for <linux-sunxi@lists.linux.dev>; Wed, 15 Mar 2023 15:08:50 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjx-0000PJ-S9; Wed, 15 Mar 2023 16:08:33 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjt-004Kek-Kd; Wed, 15 Mar 2023 16:08:29 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjs-0057kx-98; Wed, 15 Mar 2023 16:08:28 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	kernel@pengutronix.de
Subject: [PATCH 142/173] ASoC: sunxi: sun4i-spdif: Convert to platform remove callback returning void
Date: Wed, 15 Mar 2023 16:07:14 +0100
Message-Id: <20230315150745.67084-143-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1636; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=OoD0/NsEqxU5fRK/LbTs3wPZVaS3oxKRvhUhi6Txvfk=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd7dQzIaPACKsmiIQnsh/hqYmkMHCJ96u+ul5 TJNW/9hIS+JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHe3QAKCRDB/BR4rcrs CdodB/oDDlewV0j3U99T7pNZQ/h8kflA6pF8CVZbDKvnptHiWpa323lumQws+yRs7dVRJJjHAkt VIHOiyMNJKvEWkCzFNY3W0RAE1TPRZbao3KVoJx5owUugEVY9SWh7+ybYtu5dHa6e0op1UPYAWo 03UQcK6YD+eBgGURaEtEeAUWnTmQteNadhShfAuM38+q7y7DNvJh7kmyPZtAgXztcDDFlbpYzM2 Rind26Cic3IW/u+JqHbap2wjJWRZVl1w5DLyEOCrpOCv0x/G38VA0l/eIX6Q7ie6g9NHwMQiUYl 8EFg/WeVmp7NlT1vnMRnSumutXOzxVKo0XLayQ+OUNXO6oEG
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
 sound/soc/sunxi/sun4i-spdif.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
index bcceebca915a..ff18d4113aac 100644
--- a/sound/soc/sunxi/sun4i-spdif.c
+++ b/sound/soc/sunxi/sun4i-spdif.c
@@ -703,13 +703,11 @@ static int sun4i_spdif_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int sun4i_spdif_remove(struct platform_device *pdev)
+static void sun4i_spdif_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		sun4i_spdif_runtime_suspend(&pdev->dev);
-
-	return 0;
 }
 
 static const struct dev_pm_ops sun4i_spdif_pm = {
@@ -724,7 +722,7 @@ static struct platform_driver sun4i_spdif_driver = {
 		.pm	= &sun4i_spdif_pm,
 	},
 	.probe		= sun4i_spdif_probe,
-	.remove		= sun4i_spdif_remove,
+	.remove_new	= sun4i_spdif_remove,
 };
 
 module_platform_driver(sun4i_spdif_driver);
-- 
2.39.2

