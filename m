Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADC47F
	for <linux-sunxi@lists.linux.dev>; Mon,  1 Aug 2022 21:24:14 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id bk11so5758805wrb.10
        for <linux-sunxi@lists.linux.dev>; Mon, 01 Aug 2022 14:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linexp-org.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=kpAJvHnsGVgVYdV6CGwRXamKol+XLg/BJyowOdExSUs=;
        b=F9Rp5XIfTNsMRnVUYBaGtl9WsUFHBiNlkLG5UhGRqxRe0iTwGYk81ALUdZg+JpG/3G
         85OitBnsTprwJCW8T0AS1CTGhKIGy+QfEXJSdHE0KZ6i3nyjb36u1nYai9GvGnW9X9O1
         LAw+RZKjbidHFELCpadPbRpRY0/dJtc/UKPOhwWT8Cl9PHwn7UFL2AuWunjh3M5HiKtW
         wbIv6wjZ/U5AeLvlvK9ja8iH3Lz2xideY5d0taJEO4JLAORWwykIdxzfgn7j9JoGUEEn
         KrDGACM1Nl53w5ln23Vg97tgiiZClVdRTPD0uYjXnrehwshvrS/ZqHS/OMX5P9PfpGQz
         yeAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=kpAJvHnsGVgVYdV6CGwRXamKol+XLg/BJyowOdExSUs=;
        b=DSdNcwfHXZU5raWeSNM8bxUuT/fy4UZZ5gUM6GTCQjgm46ByLhVYPhbYoLjTD5I27S
         IPDRTl6byNLTvYnX7qtwg2yzK7bjDnOvZ8eGSxOCP0aKSbWvF7r4Y5elmxrQCHnKj3n2
         z9SKXY1YOksowQOZJrnc4PuvFAt0uwZkVzlwIQVUA5im33EkhptwtpJBpQvfXOzKtlEy
         iYB89QzbfdE0Ik7RrdZB+WhW24QUo9dMEgoMByTM+mRVUlq5WOi6D4QNzkWdv2dctqfu
         2p9rUxbenNaF91qZUdDSWAngjYufP+G0WCXi2mZa4t+fOPtyXwL8cvryPRmcm8QMTy8W
         WRcA==
X-Gm-Message-State: ACgBeo2ClhDwLLUofBpYaiR5zWrMmeKEDdcEI86zf0kiTCIcDqq5fLG/
	TzaZ1pchlSveLYv5Bznlzbpv+A==
X-Google-Smtp-Source: AA6agR5cjynS7Tv4uPwkZ4YQew9ugTBY9m8nxDP2tIpAzTjc9/d3an3hkoOLOqz64Geqky9SMdLt1w==
X-Received: by 2002:a5d:47c4:0:b0:21f:f34:56fd with SMTP id o4-20020a5d47c4000000b0021f0f3456fdmr10744222wrc.585.1659389052349;
        Mon, 01 Aug 2022 14:24:12 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:d00:ceb8:9c09:1302])
        by smtp.gmail.com with ESMTPSA id c7-20020adffb07000000b0021e501519d3sm12995285wrr.67.2022.08.01.14.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Aug 2022 14:24:12 -0700 (PDT)
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
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)...),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi SoC support),
	linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi SoC support)
Subject: [PATCH v4 28/32] Input: sun4i-ts - switch to new of thermal API
Date: Mon,  1 Aug 2022 23:22:40 +0200
Message-Id: <20220801212244.1124867-29-daniel.lezcano@linexp.org>
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
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/sun4i-ts.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/input/touchscreen/sun4i-ts.c b/drivers/input/touchscreen/sun4i-ts.c
index 742a7e96c1b5..73eb8f80be6e 100644
--- a/drivers/input/touchscreen/sun4i-ts.c
+++ b/drivers/input/touchscreen/sun4i-ts.c
@@ -192,12 +192,12 @@ static int sun4i_get_temp(const struct sun4i_ts_data *ts, int *temp)
 	return 0;
 }
 
-static int sun4i_get_tz_temp(void *data, int *temp)
+static int sun4i_get_tz_temp(struct thermal_zone_device *tz, int *temp)
 {
-	return sun4i_get_temp(data, temp);
+	return sun4i_get_temp(tz->devdata, temp);
 }
 
-static const struct thermal_zone_of_device_ops sun4i_ts_tz_ops = {
+static const struct thermal_zone_device_ops sun4i_ts_tz_ops = {
 	.get_temp = sun4i_get_tz_temp,
 };
 
@@ -356,8 +356,8 @@ static int sun4i_ts_probe(struct platform_device *pdev)
 	if (IS_ERR(hwmon))
 		return PTR_ERR(hwmon);
 
-	thermal = devm_thermal_zone_of_sensor_register(ts->dev, 0, ts,
-						       &sun4i_ts_tz_ops);
+	thermal = devm_thermal_of_zone_register(ts->dev, 0, ts,
+						&sun4i_ts_tz_ops);
 	if (IS_ERR(thermal))
 		return PTR_ERR(thermal);
 
-- 
2.25.1

