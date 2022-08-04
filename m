Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732236AA2
	for <linux-sunxi@lists.linux.dev>; Thu,  4 Aug 2022 22:52:14 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id j15so1370766wrr.2
        for <linux-sunxi@lists.linux.dev>; Thu, 04 Aug 2022 15:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linexp-org.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=KoCo3jVOreA60M5B2h+gu+yJSl6IxRYoUlnzq7WRBI0=;
        b=tK8BZUrYjVSQkECpXaiG1qT4bYmfWcZCkyTFwzwm2zJsiqOs2137daSTFMuKmG6ZWf
         6uxkl6beWGwhQZETcttDQAPtqpYYgBIkCsMTq+ac+SYyQFmkkzYYfgb7SPtRylhlT1MY
         hbSCVHmggrCRjLOEhccrCXswC8ML7Siwn7aI4rS4H4ZnDUU8pSwx+gPcUPFvtZQfqB6u
         /1CoVD3XIICZRz210i7lsScpbpQguQur0gISJO46OEXFjAtdMr5Jk7IBpqGU7KDXVn6G
         dObIG9YBDlYlvqHkRfawbEOcWbsiYobcEwnVQ1+hckMOCfjwPnrwFE8aqdcCAXFWBm3d
         QgSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=KoCo3jVOreA60M5B2h+gu+yJSl6IxRYoUlnzq7WRBI0=;
        b=U1rxLEdI1VRMlQ0UEQkoPdWvsKS1W+QgsazJzi9bXfidt7YLqRd1urRTsBf3/XG8Az
         bTWImWB0350uCRgt5drdke6DV69azJGTslf8gWsFfy5nJYk6X08bLmnZ/+nPdGPQfpiW
         xyDCNJlfNRnbm3nUpBGi5AaxCLI+BKoaGDj8bBg1yZNLOrTJ5pZeUiDMCuketRyRUKGW
         h2Bs2Ik/NQrkduVaZkIbKaPRKV6c7wZ2qmzBuXsX6Z7+vvzKd67EJWTZP8uPgSKM15Iq
         T7XalCMzMTshL5iggZbsbsEizjWSzl5S6Ac2jDIA0j7ut/aeMzyYtefpCDWa0ZIgdtg0
         YldQ==
X-Gm-Message-State: ACgBeo1VFRcebYApIGOQY7NFZYLCL8RcBs5B/WEgN16eCRG/QXqvfDxZ
	NyWni8oBEGclRfXuXciIkafRaw==
X-Google-Smtp-Source: AA6agR57CkmUOuQZ/UDgeWmNjX/seB7gnWJdHW8biXGloj7zueDyqn8OOWCYGy0WwgScQ6ACI16iOg==
X-Received: by 2002:a5d:5957:0:b0:220:79d5:f8ae with SMTP id e23-20020a5d5957000000b0022079d5f8aemr2588998wri.160.1659653532830;
        Thu, 04 Aug 2022 15:52:12 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:31aa:ed2c:3f7:19d])
        by smtp.gmail.com with ESMTPSA id a16-20020a056000051000b0021f87e8945asm2495906wrf.12.2022.08.04.15.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 15:52:12 -0700 (PDT)
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
Subject: [PATCH v5 08/33] thermal/drivers/sun8i: Switch to new of API
Date: Fri,  5 Aug 2022 00:43:24 +0200
Message-Id: <20220804224349.1926752-9-daniel.lezcano@linexp.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220804224349.1926752-1-daniel.lezcano@linexp.org>
References: <20220804224349.1926752-1-daniel.lezcano@linexp.org>
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

