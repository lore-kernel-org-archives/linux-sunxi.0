Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B641ADC7D
	for <linux-sunxi@lists.linux.dev>; Tue, 14 Jan 2025 09:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.68.50.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736848788; cv=none; b=qsvJ+N8P0KoqLcnirbMRJnDV6FV3xjS0n5E/G1U4LzZDvgR2SBh59LyJCiaBlhm2SNgsxLQLctbXmBsMrWnlGJ7ETS6IwwqPUy8USfOxwLOy0+Tb13uY5KdzhNLX0ssAr14v5cu6lAGuF7YoJDuZSBJO/3jxfz0W8tXCsrFPmHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736848788; c=relaxed/simple;
	bh=7/3z6S5SUm+jJ4qxcZc4MrW49/k7CUcxLf+113y6sVE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kDx7Xz473n4nUfqwMHVGsA5cIlvk9J2zXJ701j3cCgc8QppYStRPJR4az9ZyZaj0AY1dg9E86Fu4kDOh0vaxMiu6rKxnXLdcUT9uAB7spcMfBWS/6Oouq/ElSB5Y+9AW4zCdbxPSdjAfxfJJtDKCP9nMWWOir0LMorfJO51g1Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu; spf=pass smtp.mailfrom=prolan.hu; dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b=Vlx49ypu; arc=none smtp.client-ip=193.68.50.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prolan.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b="Vlx49ypu"
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 0943CA0AB9;
	Tue, 14 Jan 2025 10:59:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=jzX5EdLsCWjyFAlDUCXLOh7T18XLl+qs3XwQKiuLtpU=; b=
	Vlx49ypumGK4OYALTAT+3gqfJ37n+GyTzB9YcrZhg4vvDhSSXP/xgqjghbq3BqkW
	99auOeXdbCUZ/ZT1f1KuE3Y0OgBfTHzApliAmgk0bpCmqMvb3P1ZulajE03l3TCo
	yACcZa9AKvEJS+SCqDZJkFY8x/ESB2BXHCn61BINGXdaj/W/+OcE+H+4joKcu4zB
	0CXsVUDJRekrWNSKsedX2WBW7wARoKGpDmsfbzeVCQxkoRDKdcJtVnDq9kQDWj8T
	xjHEei3Zn+R/2PSfguprp4vBMnjwM0GeE3NXfKWXfoCX7bmq4KFALUXH1fBjLIgY
	XT/oBNBDJNiiS3MgerUjOFfZW+h1ZHHaFfGm3IJaZi+KojaP1Ov8FThP6qBWhd0z
	Jsw+WxsRA1xi+SZSOKjB0QS7bppm26gDhbdVKCzBiX/MYpmTerSN5/ny00JYxfsX
	YwOAWTAg+kxjRjXp/S3gjCDgmhfmtxoMdsvOSWAMf3l2DPj0kcNvCQqmgAY1lE9S
	+HM+gknf3avJybCVpjZA0FGquknN5qtvAi9EE+BToCLWZ7e+ZHIRxEFj9lEUKAIW
	xyUn3IVUQpjacz4d0tMSld6wkAnjGMToP3Ekhfe/al0fjBsza13gms7IlZQ5lhzY
	cOtFNmvn/o5gAQwGtmGlSy+3T+uinoHrX0pY1u4IKmU=
From: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
To: <linux-sound@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>
CC: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>, "Liam
 Girdwood" <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Jaroslav
 Kysela" <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Chen-Yu Tsai
	<wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
	<samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v2] ASoC: sun4i-codec: Use new devm clk and reset APIs
Date: Tue, 14 Jan 2025 10:59:07 +0100
Message-ID: <20250114095909.798559-1-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.48.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1736848776;VERSION=7983;MC=2726077745;ID=287044;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D9485264766B

Clean up error handling by using the new devm_
clock and reset functions. This should make it
easier to add new code, as we can eliminate the
"goto ladder" in probe().

Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
---

Notes:
    Changes in v2:
    * remove unused `scodec` var
    * rebase onto current for-next

 sound/soc/sunxi/sun4i-codec.c | 42 ++++++-----------------------------
 1 file changed, 7 insertions(+), 35 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index 3d6156fefe75..886b3fa537d2 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -2273,7 +2273,7 @@ static int sun4i_codec_probe(struct platform_device *pdev)
 	}
 
 	/* Get the clocks from the DT */
-	scodec->clk_apb = devm_clk_get(&pdev->dev, "apb");
+	scodec->clk_apb = devm_clk_get_enabled(&pdev->dev, "apb");
 	if (IS_ERR(scodec->clk_apb)) {
 		dev_err(&pdev->dev, "Failed to get the APB clock\n");
 		return PTR_ERR(scodec->clk_apb);
@@ -2286,8 +2286,7 @@ static int sun4i_codec_probe(struct platform_device *pdev)
 	}
 
 	if (quirks->has_reset) {
-		scodec->rst = devm_reset_control_get_exclusive(&pdev->dev,
-							       NULL);
+		scodec->rst = devm_reset_control_get_exclusive_deasserted(&pdev->dev, NULL);
 		if (IS_ERR(scodec->rst)) {
 			dev_err(&pdev->dev, "Failed to get reset control\n");
 			return PTR_ERR(scodec->rst);
@@ -2323,22 +2322,6 @@ static int sun4i_codec_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	/* Enable the bus clock */
-	if (clk_prepare_enable(scodec->clk_apb)) {
-		dev_err(&pdev->dev, "Failed to enable the APB clock\n");
-		return -EINVAL;
-	}
-
-	/* Deassert the reset control */
-	if (scodec->rst) {
-		ret = reset_control_deassert(scodec->rst);
-		if (ret) {
-			dev_err(&pdev->dev,
-				"Failed to deassert the reset control\n");
-			goto err_clk_disable;
-		}
-	}
-
 	/* DMA configuration for TX FIFO */
 	scodec->playback_dma_data.addr = res->start + quirks->reg_dac_txdata;
 	scodec->playback_dma_data.maxburst = quirks->dma_max_burst;
@@ -2356,7 +2339,7 @@ static int sun4i_codec_probe(struct platform_device *pdev)
 				     &sun4i_codec_dai, 1);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register our codec\n");
-		goto err_assert_reset;
+		return ret;
 	}
 
 	ret = devm_snd_soc_register_component(&pdev->dev,
@@ -2364,20 +2347,20 @@ static int sun4i_codec_probe(struct platform_device *pdev)
 					      &dummy_cpu_dai, 1);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register our DAI\n");
-		goto err_assert_reset;
+		return ret;
 	}
 
 	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register against DMAEngine\n");
-		goto err_assert_reset;
+		return ret;
 	}
 
 	card = quirks->create_card(&pdev->dev);
 	if (IS_ERR(card)) {
 		ret = PTR_ERR(card);
 		dev_err(&pdev->dev, "Failed to create our card\n");
-		goto err_assert_reset;
+		return ret;
 	}
 
 	snd_soc_card_set_drvdata(card, scodec);
@@ -2385,28 +2368,17 @@ static int sun4i_codec_probe(struct platform_device *pdev)
 	ret = snd_soc_register_card(card);
 	if (ret) {
 		dev_err_probe(&pdev->dev, ret, "Failed to register our card\n");
-		goto err_assert_reset;
+		return ret;
 	}
 
 	return 0;
-
-err_assert_reset:
-	if (scodec->rst)
-		reset_control_assert(scodec->rst);
-err_clk_disable:
-	clk_disable_unprepare(scodec->clk_apb);
-	return ret;
 }
 
 static void sun4i_codec_remove(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
-	struct sun4i_codec *scodec = snd_soc_card_get_drvdata(card);
 
 	snd_soc_unregister_card(card);
-	if (scodec->rst)
-		reset_control_assert(scodec->rst);
-	clk_disable_unprepare(scodec->clk_apb);
 }
 
 static struct platform_driver sun4i_codec_driver = {
-- 
2.48.0


