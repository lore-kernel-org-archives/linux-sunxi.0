Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F6D53AB
	for <linux-sunxi@lists.linux.dev>; Wed, 15 Mar 2023 15:08:52 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjy-0000QT-9y; Wed, 15 Mar 2023 16:08:34 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjt-004Ker-T0; Wed, 15 Mar 2023 16:08:29 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjs-0057l4-MI; Wed, 15 Mar 2023 16:08:28 +0100
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
Subject: [PATCH 144/173] ASoC: sunxi: sun8i-codec: Convert to platform remove callback returning void
Date: Wed, 15 Mar 2023 16:07:16 +0100
Message-Id: <20230315150745.67084-145-u.kleine-koenig@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1652; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=PKZLUUN2FnYm9E45kDT+erWezzQ4AUZAVT1pyOCNUaE=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd7kJZBA5L8T3lsg8WMR+VXbx+6E9hoN/Zgx9 P1VmeBcBcKJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHe5AAKCRDB/BR4rcrs Ceg1B/4gksIQaHhoSv2yjkYstPXz3vvl3ILg0AUMo5CJN4UP+IJdXd4OU3/Vx3/OMVm003lxeAd 8wMO+ljo4kxN5KGbScBlE1R5aYVEjiCe0DmxIK6CzTX+miVfdhuCO6R0Hdk82lHO4i5boNn7XlO 8Eqf2TVLSC8JBav8DGGrt6WiGL51y5JQESOLgErWxloaNylKpsGTbY7vivhn67BtJLQntHs3sG9 O7jMcwH3+nEWJn99pnm+tJeq4kY45Ac7tWIp6Ec7JKjYhOgYn1mUFeG7+LwJhtvOyL8Sjah+buw Y5MFjzWijMWzrBui0GanOVa2OmIQp0Wz3iU7dev92ls530la
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
 sound/soc/sunxi/sun8i-codec.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index 9844978d91e6..4c0d0d7d3e58 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -1349,13 +1349,11 @@ static int sun8i_codec_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int sun8i_codec_remove(struct platform_device *pdev)
+static void sun8i_codec_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		sun8i_codec_runtime_suspend(&pdev->dev);
-
-	return 0;
 }
 
 static const struct sun8i_codec_quirks sun8i_a33_quirks = {
@@ -1385,7 +1383,7 @@ static struct platform_driver sun8i_codec_driver = {
 		.pm = &sun8i_codec_pm_ops,
 	},
 	.probe = sun8i_codec_probe,
-	.remove = sun8i_codec_remove,
+	.remove_new = sun8i_codec_remove,
 };
 module_platform_driver(sun8i_codec_driver);
 
-- 
2.39.2

