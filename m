Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53AC7A20
	for <linux-sunxi@lists.linux.dev>; Wed, 27 Jul 2022 21:03:28 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id v17so7137257wrr.10
        for <linux-sunxi@lists.linux.dev>; Wed, 27 Jul 2022 14:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linexp-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KoCo3jVOreA60M5B2h+gu+yJSl6IxRYoUlnzq7WRBI0=;
        b=FGGLVzfx4BZq6tb0SPQJeiGIls9Y9otMd0oDQ8KKBCrCOid6Um1zjDXdapW9zopV3O
         gNsZWoglPbSDWFPOyr9yJdyGtgE3IaYP3VsjNwEoHVOcs6zgY78tgAt++783huFC8N25
         bC2KsnGaPbvpqtwIGI/j4O9EQLi608OQLkJI2RGqRVysceitXpr/OiH5AAvn9aq0Q8cr
         fOXbpIXzmgMltKUJWGu4HM1dWlIJKjouOnZdJR1ZI3SLJOHbUMeKDVcy1vy/7R1Xo7K5
         mZDvdKMUVTSP5EO8wSd1HMJnPqk2O4aRBPZZccissOcB+IjnYWKQ59QMPpFUllEh0Xw8
         oo+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KoCo3jVOreA60M5B2h+gu+yJSl6IxRYoUlnzq7WRBI0=;
        b=T/+OFz0Fmx1VDA9LRDcPYANWldJcze083wgIFqBN6RSRf10Q7CoPkbf3MPUCs2/WKB
         7YOWBfT0FDlgCXWkx9R1g0mZJdUm2Kur4qoSBimwHXb4vXMuE0vOY4mDu6Bg8K/fltmz
         ScjQFH5Opp7FXT2HkcFE1bSLxDSaekZBrffivpLJ/SDyY51vdjpemDPx+RgL3oJ9yhwV
         HBDG6kY2wsWTJUYHJet6uVXA1zwr7P4G1WAmuFbB9Hny17A4jL5tdkxmrPSDOeTHcNhf
         dZNJjpiGOfpHXGOxLLsXEEGkST4Njdyad8ifOLnTQC0fYFh8OYLkDQFmhHf7dNzzOcDJ
         8fZw==
X-Gm-Message-State: AJIora+0eAoksoOF/d5Qqrs4kMB9q1sBna6DFyTjz1msS/oq0c/i/iw0
	IKDb0lu/Ssf05/9HlqTY0sbA7w==
X-Google-Smtp-Source: AGRyM1tXz/i+RQouBdI72BasLcWFpSsgokti/kC2BxvW6NBwQNGEzXEydiPc+macGX4K1FVqLUI8AQ==
X-Received: by 2002:a05:6000:1a8b:b0:21d:9ae8:f8d9 with SMTP id f11-20020a0560001a8b00b0021d9ae8f8d9mr14493418wry.686.1658955806595;
        Wed, 27 Jul 2022 14:03:26 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:65a8:ebd8:4098:d9d0])
        by smtp.gmail.com with ESMTPSA id h6-20020a05600c350600b003a38606385esm37908wmq.3.2022.07.27.14.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 14:03:26 -0700 (PDT)
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
	Amit Kucheria <amitk@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi SoC support),
	linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi SoC support)
Subject: [PATCH v3 08/32] thermal/drivers/sun8i: Switch to new of API
Date: Wed, 27 Jul 2022 23:02:29 +0200
Message-Id: <20220727210253.3794069-9-daniel.lezcano@linexp.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220727210253.3794069-1-daniel.lezcano@linexp.org>
References: <20220727210253.3794069-1-daniel.lezcano@linexp.org>
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
---
 drivers/thermal/sun8i_thermal.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
index 212c87e63a66..e64d06d1328c 100644
--- a/drivers/thermal/sun8i_thermal.c
+++ b/drivers/thermal/sun8i_thermal.c
@@ -108,9 +108,9 @@ static int sun50i_h5_calc_temp(struct ths_device *tmdev,
 		return -1590 * reg / 10 + 276000;
 }
 
-static int sun8i_ths_get_temp(void *data, int *temp)
+static int sun8i_ths_get_temp(struct thermal_zone_device *tz, int *temp)
 {
-	struct tsensor *s = data;
+	struct tsensor *s = tz->devdata;
 	struct ths_device *tmdev = s->tmdev;
 	int val = 0;
 
@@ -135,7 +135,7 @@ static int sun8i_ths_get_temp(void *data, int *temp)
 	return 0;
 }
 
-static const struct thermal_zone_of_device_ops ths_ops = {
+static const struct thermal_zone_device_ops ths_ops = {
 	.get_temp = sun8i_ths_get_temp,
 };
 
@@ -468,10 +468,10 @@ static int sun8i_ths_register(struct ths_device *tmdev)
 		tmdev->sensor[i].tmdev = tmdev;
 		tmdev->sensor[i].id = i;
 		tmdev->sensor[i].tzd =
-			devm_thermal_zone_of_sensor_register(tmdev->dev,
-							     i,
-							     &tmdev->sensor[i],
-							     &ths_ops);
+			devm_thermal_of_zone_register(tmdev->dev,
+						      i,
+						      &tmdev->sensor[i],
+						      &ths_ops);
 		if (IS_ERR(tmdev->sensor[i].tzd))
 			return PTR_ERR(tmdev->sensor[i].tzd);
 
-- 
2.25.1

