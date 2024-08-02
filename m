Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E69B1547C5
	for <linux-sunxi@lists.linux.dev>; Fri,  2 Aug 2024 19:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722626573; cv=none; b=PGFqLlQC+q62XCYAAP2xD/jakHbP1fNVjswww1ruIcemZm0kgZVoAd6q9bH7QkNDnJbyuCGL77yfey92MvEUAiuKgJf+rn1bwrZa5CJ28HeFgRH6at3+5Wo+Qo/yxku/X6P1BuA1Cc2iOomJqArVhdKH7eeJ68ZmkexqQ4XWoIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722626573; c=relaxed/simple;
	bh=oeKh3JxFFyFc9s3MxdEoaLMTx5bHc9Y7RCEmv06+bT0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OJkHq+LWiKehnj81n23C75ABWF80D78MqqcfMaEzVgQjUX5iEkhql2oXAiJTdCXPDDH1hYftSOfTWfpV/28bdO+M/sSHYPKWSOpcMtqNZBdyt/hcqdZWd30FwAjCEIqnypvdeK+cYftQQBrlDJBE8eB4MtBF3BYWzCHgPvPeWGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A8JgpbYy; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A8JgpbYy"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3db1657c0fdso5230522b6e.1
        for <linux-sunxi@lists.linux.dev>; Fri, 02 Aug 2024 12:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722626570; x=1723231370; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MibRB3AQvGbIlGoFS4ggjPfR2n/+IwZ38Kf7aUZ1OD8=;
        b=A8JgpbYyitm7MDzN7FrnQc5gBamSNcklpL08buVD39Bl2VoT0/trictHw35DXMy/X9
         pYLHmtZWrcpX2VJqyfeR0Ee8f/69GGxP+Qs3Rk6TuOTmuZ6J7yKfnMLOH3gxKKZmR7g7
         9PnSckaWUCl+VWWKDZrm0Ianx64SAnbn2CArdk5zOV5SMYpUOfMD4ns6vlE/B1NY5yHN
         kmIA7OrY94R2FFtIkBl6GkHNHE0LGPQlLicE8Oo5ixOFy8YK3NPblxq3yu+FU8EmBn0J
         SoktpEfhjQ5Vue/ODQoa6Ka4GDothrq6ztZNYym4ZWVFt1ybFva1DAB/JLgV+QI3UCCi
         IqkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722626570; x=1723231370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MibRB3AQvGbIlGoFS4ggjPfR2n/+IwZ38Kf7aUZ1OD8=;
        b=nY+rClJuWS0UC1wLLSlaiOPK9GxyGn8Ee+MfBvIUr/EbcgZv2kulausGPrECD7XJhu
         qfM6tIp/UJnLWQF8j1h3rUzlMhrX8MYfF8ZocKAg19zC3iWJsxUoqECp5RnoW14QV1MD
         PiqN18zJJq7eTF4iFMRqw+Fyzp092W1AySwBSR7c0Re+LJ7VDYT9ZiXW+fYzDIjlpteS
         gDb7nDQee15ym2Owhl26EncXROydjT3SeOUj5+4cqFzgX7oPELJ4ZujRfuWKBWl7nqdV
         Ft4vWVePtRYma9EhsTY81drmuwBxg1gIpLdnGuQVcIN1ElzIh3y9okDNBYOTb2UIj2tM
         sDaw==
X-Gm-Message-State: AOJu0Ywaa7shNChwwjGjBbLvq9L6QBmCXauySlC05JpxTcbVqfKMNQj3
	BfgpFjNrTyy/NiqxN2bwo/c1bBWiwPj+4iX8FYOZM9nvIJX3gTYNfULrXw==
X-Google-Smtp-Source: AGHT+IGiyHXqIqt2Gxy3xDWDxaI1wwnaQV2gEmdDkbsTJ9N/Zvz54RsUGUUI1CFHapa/j3O/y0nxFg==
X-Received: by 2002:a05:6808:2126:b0:3d9:3e48:8af7 with SMTP id 5614622812f47-3db55830c83mr6143565b6e.40.1722626570257;
        Fri, 02 Aug 2024 12:22:50 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf::54])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3db563b7065sm584592b6e.46.2024.08.02.12.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 12:22:50 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	quentin.schulz@free-electrons.com,
	mripard@kernel.org,
	tgamblin@baylibre.com,
	aidanmacdonald.0x0@gmail.com,
	u.kleine-koenig@pengutronix.de,
	lee@kernel.org,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	sre@kernel.org,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	lars@metafoo.de,
	jic23@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V2 01/15] iio: adc: axp20x_adc: Add adc_en1 and adc_en1 to axp_data
Date: Fri,  2 Aug 2024 14:20:12 -0500
Message-Id: <20240802192026.446344-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240802192026.446344-1-macroalpha82@gmail.com>
References: <20240802192026.446344-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add the register for adc_en1 and adc_en2 to the axp_data struct. This
allows us to specify a different register to enable the adc channels
for different devices such as the AXP717.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/iio/adc/axp20x_adc.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/iio/adc/axp20x_adc.c b/drivers/iio/adc/axp20x_adc.c
index b487e577befb..368ba6ee7a80 100644
--- a/drivers/iio/adc/axp20x_adc.c
+++ b/drivers/iio/adc/axp20x_adc.c
@@ -889,7 +889,9 @@ struct axp_data {
 	const struct iio_info		*iio_info;
 	int				num_channels;
 	struct iio_chan_spec const	*channels;
+	unsigned long			adc_en1;
 	unsigned long			adc_en1_mask;
+	unsigned long			adc_en2;
 	unsigned long			adc_en2_mask;
 	int				(*adc_rate)(struct axp20x_adc_iio *info,
 						    int rate);
@@ -910,7 +912,9 @@ static const struct axp_data axp20x_data = {
 	.iio_info = &axp20x_adc_iio_info,
 	.num_channels = ARRAY_SIZE(axp20x_adc_channels),
 	.channels = axp20x_adc_channels,
+	.adc_en1 = AXP20X_ADC_EN1,
 	.adc_en1_mask = AXP20X_ADC_EN1_MASK,
+	.adc_en2 = AXP20X_ADC_EN2,
 	.adc_en2_mask = AXP20X_ADC_EN2_MASK,
 	.adc_rate = axp20x_adc_rate,
 	.maps = axp20x_maps,
@@ -920,6 +924,7 @@ static const struct axp_data axp22x_data = {
 	.iio_info = &axp22x_adc_iio_info,
 	.num_channels = ARRAY_SIZE(axp22x_adc_channels),
 	.channels = axp22x_adc_channels,
+	.adc_en1 = AXP20X_ADC_EN1,
 	.adc_en1_mask = AXP22X_ADC_EN1_MASK,
 	.adc_rate = axp22x_adc_rate,
 	.maps = axp22x_maps,
@@ -929,6 +934,7 @@ static const struct axp_data axp813_data = {
 	.iio_info = &axp813_adc_iio_info,
 	.num_channels = ARRAY_SIZE(axp813_adc_channels),
 	.channels = axp813_adc_channels,
+	.adc_en1 = AXP20X_ADC_EN1,
 	.adc_en1_mask = AXP22X_ADC_EN1_MASK,
 	.adc_rate = axp813_adc_rate,
 	.maps = axp22x_maps,
@@ -988,14 +994,16 @@ static int axp20x_probe(struct platform_device *pdev)
 	indio_dev->channels = info->data->channels;
 
 	/* Enable the ADCs on IP */
-	regmap_write(info->regmap, AXP20X_ADC_EN1, info->data->adc_en1_mask);
+	regmap_write(info->regmap, info->data->adc_en1,
+		     info->data->adc_en1_mask);
 
 	if (info->data->adc_en2_mask)
-		regmap_set_bits(info->regmap, AXP20X_ADC_EN2,
+		regmap_set_bits(info->regmap, info->data->adc_en2,
 				info->data->adc_en2_mask);
 
 	/* Configure ADCs rate */
-	info->data->adc_rate(info, 100);
+	if (info->data->adc_rate)
+		info->data->adc_rate(info, 100);
 
 	ret = iio_map_array_register(indio_dev, info->data->maps);
 	if (ret < 0) {
@@ -1015,10 +1023,10 @@ static int axp20x_probe(struct platform_device *pdev)
 	iio_map_array_unregister(indio_dev);
 
 fail_map:
-	regmap_write(info->regmap, AXP20X_ADC_EN1, 0);
+	regmap_write(info->regmap, info->data->adc_en1, 0);
 
 	if (info->data->adc_en2_mask)
-		regmap_write(info->regmap, AXP20X_ADC_EN2, 0);
+		regmap_write(info->regmap, info->data->adc_en2, 0);
 
 	return ret;
 }
@@ -1031,10 +1039,10 @@ static void axp20x_remove(struct platform_device *pdev)
 	iio_device_unregister(indio_dev);
 	iio_map_array_unregister(indio_dev);
 
-	regmap_write(info->regmap, AXP20X_ADC_EN1, 0);
+	regmap_write(info->regmap, info->data->adc_en1, 0);
 
 	if (info->data->adc_en2_mask)
-		regmap_write(info->regmap, AXP20X_ADC_EN2, 0);
+		regmap_write(info->regmap, info->data->adc_en2, 0);
 }
 
 static struct platform_driver axp20x_adc_driver = {
-- 
2.34.1

