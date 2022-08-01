Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76937F
	for <linux-sunxi@lists.linux.dev>; Mon,  1 Aug 2022 21:24:10 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id b6so6351335wmq.5
        for <linux-sunxi@lists.linux.dev>; Mon, 01 Aug 2022 14:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linexp-org.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=kR3Ri+u8MrlBR31H9vhYMnYhYm+SNLRNtOs1Gp5xhCw=;
        b=xh8Gu6CxZR+eHCxOmg5DvWBOkqxPXW8WLgkpaNchDUH5lQyH7yxJcrq5lgw85+W7VH
         RIbvm50Fu7/2MYWwdSa19QbfmT6UphVTPkuOnjmQGh3SZkccXDK4vW80VyV7h3WRJTSo
         VQutQv0Y4cr81PHha3zpny1JbqRcIXXcbBXk/sx6YgKgp0aDX2oULlAeBZX0yFw8dkcP
         xBf3RXZBss3INtEoO4bZQWBYSslKyoxDehwFDEeWsXMgaTemsPEqdW8Xl43of9/Gsxtq
         AqoL+V/lNNNQEePgCMo/Ux/avVQ1Dah5/+B4qr/uS3PjTQ/cpLcOJ9iqk8CBHCrVLvtt
         xJ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=kR3Ri+u8MrlBR31H9vhYMnYhYm+SNLRNtOs1Gp5xhCw=;
        b=mzu2ktP4qdadxB2oXK/aWnfFw0UEwyfDidqy+jN+o7phyxghjgQIoO5lERt7IBCQFU
         xd21ZJH8umy2+1kckCuk8YYYfIpIsuHWqErujNqYIXQEVEKTnoAumi6RGud/ZObIdEhC
         +OBDsLIOW153RE1DWPtsY0zMkItyx1Sb8ALWcaV0BYSws98wvSdSP4+5OUapr7/aVl60
         1yndEwcqEFLtpENhb75h0Lm8ajKp6vJ9rgwW6hzJBf3vArIKYp+JeH4anYDJW0BDolx4
         JnzsY2PIV2Uak3B+FgcLx9ZKDbdgsPQW8rJiOmOIYoOLPMjOUaSz2wV0m0GmHUt5QdpV
         C5Iw==
X-Gm-Message-State: AJIora+tgbgeX6t7tiE4EZJ64KCpXWPFI6KKhJdqLyZiRwo7+gShlLmJ
	JbVaHBYg5fTux1MKlmQZlE5giA==
X-Google-Smtp-Source: AGRyM1uV5KV0eIULjdt945RlfJzhs3wIx8I+n5plQIxUxm/0jmON2cpIRB7uDxXgLbFNdilwVjimiQ==
X-Received: by 2002:a7b:c8da:0:b0:3a2:ffd2:8059 with SMTP id f26-20020a7bc8da000000b003a2ffd28059mr12277872wml.169.1659389049153;
        Mon, 01 Aug 2022 14:24:09 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:d00:ceb8:9c09:1302])
        by smtp.gmail.com with ESMTPSA id c7-20020adffb07000000b0021e501519d3sm12995285wrr.67.2022.08.01.14.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Aug 2022 14:24:08 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linexp.org>
To: daniel.lezcano@linaro.org,
	rafael@kernel.org
Cc: rui.zhang@intel.com,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	khilman@baylibre.com,
	abailon@baylibre.com,
	lukasz.luba@arm.com,
	broonie@kernel.org,
	damien.lemoal@opensource.wdc.com,
	heiko@sntech.de,
	hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org,
	talel@amazon.com,
	thierry.reding@gmail.com,
	digetx@gmail.com,
	jonathanh@nvidia.com,
	anarsoul@gmail.com,
	tiny.windzz@gmail.com,
	baolin.wang7@gmail.com,
	f.fainelli@gmail.com,
	bjorn.andersson@linaro.org,
	mcoquelin.stm32@gmail.com,
	glaroque@baylibre.com,
	miquel.raynal@bootlin.com,
	shawnguo@kernel.org,
	niklas.soderlund@ragnatech.se,
	matthias.bgg@gmail.com,
	j-keerthy@ti.com,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-iio@vger.kernel.org (open list:IIO SUBSYSTEM AND DRIVERS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi SoC support),
	linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi SoC support)
Subject: [PATCH v4 27/32] iio/drivers/sun4i_gpadc: Switch to new of thermal API
Date: Mon,  1 Aug 2022 23:22:39 +0200
Message-Id: <20220801212244.1124867-28-daniel.lezcano@linexp.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220801212244.1124867-1-daniel.lezcano@linexp.org>
References: <20220801212244.1124867-1-daniel.lezcano@linexp.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The thermal OF code has a new API allowing to migrate the OF
initialization to a simpler approach. The ops are no longer device
tree specific and are the generic ones provided by the core code.

Convert the ops to the thermal_zone_device_ops format and use the new
API to register the thermal zone with these generic ops.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linexp.org>
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 drivers/iio/adc/sun4i-gpadc-iio.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/adc/sun4i-gpadc-iio.c b/drivers/iio/adc/sun4i-gpadc-iio.c
index 2d393a4dfff6..13d1e937357c 100644
--- a/drivers/iio/adc/sun4i-gpadc-iio.c
+++ b/drivers/iio/adc/sun4i-gpadc-iio.c
@@ -412,9 +412,9 @@ static int sun4i_gpadc_runtime_resume(struct device *dev)
 	return 0;
 }
 
-static int sun4i_gpadc_get_temp(void *data, int *temp)
+static int sun4i_gpadc_get_temp(struct thermal_zone_device *tz, int *temp)
 {
-	struct sun4i_gpadc_iio *info = data;
+	struct sun4i_gpadc_iio *info = tz->devdata;
 	int val, scale, offset;
 
 	if (sun4i_gpadc_temp_read(info->indio_dev, &val))
@@ -428,7 +428,7 @@ static int sun4i_gpadc_get_temp(void *data, int *temp)
 	return 0;
 }
 
-static const struct thermal_zone_of_device_ops sun4i_ts_tz_ops = {
+static const struct thermal_zone_device_ops sun4i_ts_tz_ops = {
 	.get_temp = &sun4i_gpadc_get_temp,
 };
 
@@ -637,9 +637,9 @@ static int sun4i_gpadc_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 
 	if (IS_ENABLED(CONFIG_THERMAL_OF)) {
-		info->tzd = thermal_zone_of_sensor_register(info->sensor_device,
-							    0, info,
-							    &sun4i_ts_tz_ops);
+		info->tzd = thermal_of_zone_register(info->sensor_device,
+						     0, info,
+						     &sun4i_ts_tz_ops);
 		/*
 		 * Do not fail driver probing when failing to register in
 		 * thermal because no thermal DT node is found.
-- 
2.25.1

