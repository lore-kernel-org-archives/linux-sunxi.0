Received: from msa.smtpout.orange.fr (smtp-70.smtpout.orange.fr [80.12.242.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA09165F02
	for <linux-sunxi@lists.linux.dev>; Sat,  7 Sep 2024 17:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725729920; cv=none; b=TL6CEtJEIXi+Q9ZHPipyL7jZcju7iKvNubvBSjRY4uHaGUZdnB0sFMGrgQ5QYdbPqOEPNd+wvP9IAzFuvU8/gzZBBcJKqRyaTCGOoBl9raUf9LdQbi9evDqvQuH6zSDWxfrOLf1NDctarvayt22aFxGRifNVAuTMwm2I5ZVKpjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725729920; c=relaxed/simple;
	bh=86gVC7KMzi7Wetv1Et1ncZl/QNOzFtKq5uQFL0ag4Jg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BULILbCiq1XPvwisQL4fs+GJ3Va2QMMcOoYuPO6fmu1ENXegqrooewVo8cym4o2ahr/fHX1l/uY2oaTMEzwoHWGHHTVl4Z6DL33Ii2NZM0M5BIoz6MwRC89hbz0CC6v1tS43+K16gWebANkU/prr1nr7BaBv12J6YKsp+gvAHlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=L3iY79qA; arc=none smtp.client-ip=80.12.242.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="L3iY79qA"
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id mzBIscbar0aTdmzBTsLH7S; Sat, 07 Sep 2024 19:25:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1725729916;
	bh=QqNd1qOb7nNU0uwNQowVVSCA68Q31RBB+cNS1Dla0LY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=L3iY79qAD7iFw0HcamIQ0KNnfHVwnj6xPI+WJOE4FHwzVRXV64BuqwI3TAxROau4w
	 Ca2QCl8ABng/ByMLP127VveQ3+zrE7I3ETPCgVm0oKtNhp/vvUlgTxITuxY+t5XMoo
	 UgQ7og9DQLR9G80D3DgYB9kKTgmjjJLCyPmOdNv/Y+BXDm6+XGH0dCkMqx/fqCGL45
	 PDEA3wI4rcp4WaEIoVtBs6RqAcdx7K7PRRt+KD52qpBKRui+wkCuEG75NH2imwq1gt
	 m35+LZPp6UeDRw/ab3ciNjzXw/w+p8qDmJ/HAIjBBRD8daFoy3ZtPX+yaSqAeg5xSu
	 mvdMkpSdJK9Cw==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 07 Sep 2024 19:25:16 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Chen-Yu Tsai <wens@csie.org>,
	Support Opensource <support.opensource@diasemi.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 2/2] iio: adc: Convert to IIO_MAP()
Date: Sat,  7 Sep 2024 19:24:47 +0200
Message-ID: <48f08224fab5a7595f650dbcef012d7cac3f972b.1725729801.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <5729dc3cc3892ecf0d8ea28c5f7307b34e27493e.1725729801.git.christophe.jaillet@wanadoo.fr>
References: <5729dc3cc3892ecf0d8ea28c5f7307b34e27493e.1725729801.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use IIO_MAP() instead of hand-writing it. It is much less verbose.

The change has been do with the following coccinelle script:

@@
identifier STRUCT_NAME;
constant NAME, CHANNEL, LABEL;
@@

	static const struct iio_map STRUCT_NAME[] = {
	...,
-	{
-		.consumer_dev_name = NAME,
-		.consumer_channel = CHANNEL,
-		.adc_channel_label = LABEL,
-	},
+	IIO_MAP(LABEL, NAME, CHANNEL),
	...
	};


@@
identifier STRUCT_NAME;
constant NAME, LABEL;
@@

	static const struct iio_map STRUCT_NAME[] = {
	...,
-	{
-		.consumer_dev_name = NAME,
-		.adc_channel_label = LABEL,
-	},
+	IIO_MAP(LABEL, NAME, NULL),
	...
	};

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
--
Compile tested only
---
 drivers/iio/adc/axp20x_adc.c      | 54 +++++++------------------------
 drivers/iio/adc/da9150-gpadc.c    | 24 +++-----------
 drivers/iio/adc/lp8788_adc.c      | 12 ++-----
 drivers/iio/adc/sun4i-gpadc-iio.c |  5 +--
 4 files changed, 19 insertions(+), 76 deletions(-)

diff --git a/drivers/iio/adc/axp20x_adc.c b/drivers/iio/adc/axp20x_adc.c
index cac3bacf2589..9a935044833a 100644
--- a/drivers/iio/adc/axp20x_adc.c
+++ b/drivers/iio/adc/axp20x_adc.c
@@ -132,51 +132,21 @@ enum axp813_adc_channel_v {
 };
 
 static const struct iio_map axp20x_maps[] = {
-	{
-		.consumer_dev_name = "axp20x-usb-power-supply",
-		.consumer_channel = "vbus_v",
-		.adc_channel_label = "vbus_v",
-	}, {
-		.consumer_dev_name = "axp20x-usb-power-supply",
-		.consumer_channel = "vbus_i",
-		.adc_channel_label = "vbus_i",
-	}, {
-		.consumer_dev_name = "axp20x-ac-power-supply",
-		.consumer_channel = "acin_v",
-		.adc_channel_label = "acin_v",
-	}, {
-		.consumer_dev_name = "axp20x-ac-power-supply",
-		.consumer_channel = "acin_i",
-		.adc_channel_label = "acin_i",
-	}, {
-		.consumer_dev_name = "axp20x-battery-power-supply",
-		.consumer_channel = "batt_v",
-		.adc_channel_label = "batt_v",
-	}, {
-		.consumer_dev_name = "axp20x-battery-power-supply",
-		.consumer_channel = "batt_chrg_i",
-		.adc_channel_label = "batt_chrg_i",
-	}, {
-		.consumer_dev_name = "axp20x-battery-power-supply",
-		.consumer_channel = "batt_dischrg_i",
-		.adc_channel_label = "batt_dischrg_i",
-	}, { /* sentinel */ }
+	IIO_MAP("vbus_v", "axp20x-usb-power-supply", "vbus_v"),
+	IIO_MAP("vbus_i", "axp20x-usb-power-supply", "vbus_i"),
+	IIO_MAP("acin_v", "axp20x-ac-power-supply", "acin_v"),
+	IIO_MAP("acin_i", "axp20x-ac-power-supply", "acin_i"),
+	IIO_MAP("batt_v", "axp20x-battery-power-supply", "batt_v"),
+	IIO_MAP("batt_chrg_i", "axp20x-battery-power-supply", "batt_chrg_i"),
+	IIO_MAP("batt_dischrg_i", "axp20x-battery-power-supply", "batt_dischrg_i"),
+	{ /* sentinel */ }
 };
 
 static const struct iio_map axp22x_maps[] = {
-	{
-		.consumer_dev_name = "axp20x-battery-power-supply",
-		.consumer_channel = "batt_v",
-		.adc_channel_label = "batt_v",
-	}, {
-		.consumer_dev_name = "axp20x-battery-power-supply",
-		.consumer_channel = "batt_chrg_i",
-		.adc_channel_label = "batt_chrg_i",
-	}, {
-		.consumer_dev_name = "axp20x-battery-power-supply",
-		.consumer_channel = "batt_dischrg_i",
-		.adc_channel_label = "batt_dischrg_i",
-	}, { /* sentinel */ }
+	IIO_MAP("batt_v", "axp20x-battery-power-supply", "batt_v"),
+	IIO_MAP("batt_chrg_i", "axp20x-battery-power-supply", "batt_chrg_i"),
+	IIO_MAP("batt_dischrg_i", "axp20x-battery-power-supply", "batt_dischrg_i"),
+	{ /* sentinel */ }
 };
 
 /*
diff --git a/drivers/iio/adc/da9150-gpadc.c b/drivers/iio/adc/da9150-gpadc.c
index 82628746ba8e..0290345ade84 100644
--- a/drivers/iio/adc/da9150-gpadc.c
+++ b/drivers/iio/adc/da9150-gpadc.c
@@ -292,26 +292,10 @@ static const struct iio_chan_spec da9150_gpadc_channels[] = {
 
 /* Default maps used by da9150-charger */
 static const struct iio_map da9150_gpadc_default_maps[] = {
-	{
-		.consumer_dev_name = "da9150-charger",
-		.consumer_channel = "CHAN_IBUS",
-		.adc_channel_label = "IBUS",
-	},
-	{
-		.consumer_dev_name = "da9150-charger",
-		.consumer_channel = "CHAN_VBUS",
-		.adc_channel_label = "VBUS",
-	},
-	{
-		.consumer_dev_name = "da9150-charger",
-		.consumer_channel = "CHAN_TJUNC",
-		.adc_channel_label = "TJUNC_CORE",
-	},
-	{
-		.consumer_dev_name = "da9150-charger",
-		.consumer_channel = "CHAN_VBAT",
-		.adc_channel_label = "VBAT",
-	},
+	IIO_MAP("IBUS", "da9150-charger", "CHAN_IBUS"),
+	IIO_MAP("VBUS", "da9150-charger", "CHAN_VBUS"),
+	IIO_MAP("TJUNC_CORE", "da9150-charger", "CHAN_TJUNC"),
+	IIO_MAP("VBAT", "da9150-charger", "CHAN_VBAT"),
 	{},
 };
 
diff --git a/drivers/iio/adc/lp8788_adc.c b/drivers/iio/adc/lp8788_adc.c
index 0d49be0061a2..33bf8aef79e3 100644
--- a/drivers/iio/adc/lp8788_adc.c
+++ b/drivers/iio/adc/lp8788_adc.c
@@ -150,16 +150,8 @@ static const struct iio_chan_spec lp8788_adc_channels[] = {
 
 /* default maps used by iio consumer (lp8788-charger driver) */
 static const struct iio_map lp8788_default_iio_maps[] = {
-	{
-		.consumer_dev_name = "lp8788-charger",
-		.consumer_channel = "lp8788_vbatt_5p0",
-		.adc_channel_label = "VBATT_5P0",
-	},
-	{
-		.consumer_dev_name = "lp8788-charger",
-		.consumer_channel = "lp8788_adc1",
-		.adc_channel_label = "ADC1",
-	},
+	IIO_MAP("VBATT_5P0", "lp8788-charger", "lp8788_vbatt_5p0"),
+	IIO_MAP("ADC1", "lp8788-charger", "lp8788_adc1"),
 	{ }
 };
 
diff --git a/drivers/iio/adc/sun4i-gpadc-iio.c b/drivers/iio/adc/sun4i-gpadc-iio.c
index 5d459f050634..00a3a4db0fe0 100644
--- a/drivers/iio/adc/sun4i-gpadc-iio.c
+++ b/drivers/iio/adc/sun4i-gpadc-iio.c
@@ -115,10 +115,7 @@ struct sun4i_gpadc_iio {
 }
 
 static const struct iio_map sun4i_gpadc_hwmon_maps[] = {
-	{
-		.adc_channel_label = "temp_adc",
-		.consumer_dev_name = "iio_hwmon.0",
-	},
+	IIO_MAP("temp_adc", "iio_hwmon.0", NULL),
 	{ /* sentinel */ },
 };
 
-- 
2.46.0

