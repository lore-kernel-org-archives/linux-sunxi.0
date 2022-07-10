Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACE81C3D
	for <linux-sunxi@lists.linux.dev>; Sun, 10 Jul 2022 21:25:20 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id bi22-20020a05600c3d9600b003a04de22ab6so2026600wmb.1
        for <linux-sunxi@lists.linux.dev>; Sun, 10 Jul 2022 14:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linexp-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bIVAQgjKJeGSe1gmg5bAAUf+sy08/mvTvr//Arvl8d4=;
        b=bwX6DCXV1ANz93kGzRrBmIE/uBbuJYI+xg3LHrquj+GqnzRrXEwv2HZISLJZRSW78o
         GODhKJHDXJfbj9ZT8y+gmA2bXumlAY4BOTyrDf9HbdkC1easWhcVHrvT+W+ZcdMoTRTr
         0UiUeG5ZpH1hqUduzq5ntInHXeWUZec9LwsVNTISLAMTaEp0IGQS/lhesFRQb37jLfNv
         a5eJ9spCAqNawYa2oeQxtgldjk3j89qfJ6M9l03mEfjBnAAcl3qKuVMyT6hpIGP3WQjO
         4JJlkE8MzN5CMvsuggDbJoehMwEB00/3fW6hE0yon1yGp65J0Vwdfjcq9rsQBxQUAGts
         kbjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bIVAQgjKJeGSe1gmg5bAAUf+sy08/mvTvr//Arvl8d4=;
        b=irxpDjfJzO4xUg+8kApay26yg0xn88aZZA0e893pVXzruvfQujacq0jVjYTCQ1aPot
         vP3ftzKVfiFhF95582jgU+E56qtKMAwd6zaDZtU3DOCrwLuONExOTrpW+eq6dk3QfRfo
         e8NGMY0osuu1iLgl1H98lZw74vD03B598m+sJgpdlHiqJ6qUldFM2Axv7YeUP1DES/IQ
         AOi5Bw67xpUiZNSdYYkB9C1J8rRllvWb85uuYSsrNamxdtDvHMW+lLEJEXVw6qn0uuIk
         ZpvRhEHTzQ6Hj2LruxFNd5zxJwsWmSqyWgOz5b4awuxcuRokkJYFf7H3q2AC6vQ/2FZo
         CibA==
X-Gm-Message-State: AJIora+vVeRvydvROdItUSUKJWpyZlBni1i4e/rsGv4OIGI5HuAnUxT1
	QqvF9wA7UBI8yBqwNOKtbC+KSQ==
X-Google-Smtp-Source: AGRyM1uo9Otvut72zMkDjHYnOsl3cCTcguJq1mSCKLu7tr3jw2jx6zah1dNAu0rjKPZTlUupXnCIMg==
X-Received: by 2002:a05:600c:190a:b0:3a2:e8cc:57ca with SMTP id j10-20020a05600c190a00b003a2e8cc57camr383824wmq.118.1657488319230;
        Sun, 10 Jul 2022 14:25:19 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:c7c0:6823:f3ce:2447])
        by smtp.gmail.com with ESMTPSA id m19-20020a05600c3b1300b003a2dd0d21f0sm7142759wms.13.2022.07.10.14.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 14:25:18 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linexp.org>
To: daniel.lezcano@linaro.org,
	rafael@kernel.org
Cc: rui.zhang@intel.com,
	khilman@baylibre.com,
	abailon@baylibre.com,
	amitk@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-iio@vger.kernel.org (open list:IIO SUBSYSTEM AND DRIVERS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi SoC support),
	linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi SoC support)
Subject: [PATCH v1 27/33] iio/drivers/sun4i_gpadc: Switch to new of thermal API
Date: Sun, 10 Jul 2022 23:24:17 +0200
Message-Id: <20220710212423.681301-28-daniel.lezcano@linexp.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220710212423.681301-1-daniel.lezcano@linexp.org>
References: <20220710212423.681301-1-daniel.lezcano@linexp.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The thermal OF code has a new API allowing to migrate the OF
initialization to a simpler approach.

Use this new API.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linexp.org>
---
 drivers/iio/adc/sun4i-gpadc-iio.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/adc/sun4i-gpadc-iio.c b/drivers/iio/adc/sun4i-gpadc-iio.c
index 2d393a4dfff6..7aebfd337871 100644
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
+static struct thermal_zone_device_ops sun4i_ts_tz_ops = {
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

