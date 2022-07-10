Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBC91C3D
	for <linux-sunxi@lists.linux.dev>; Sun, 10 Jul 2022 21:25:23 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id bu1so3584326wrb.9
        for <linux-sunxi@lists.linux.dev>; Sun, 10 Jul 2022 14:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linexp-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JHt96uT4Q7BwS4NdRXSU1MVIN9ZQRmgKBYoUqlA70sg=;
        b=FTmtHevb/2lCiduv1bxN2jNSRFQIRp1jQ/TUsaCdBwAW/diJI+MM6X5FtZpJwCzVf3
         xFWyF1+0v3PX7grCleGiUZm577zgV6OCoxe/iNYb6agevNc8T+GA5VXWgMU5cpaWYEBF
         7FDYF6mc+ZQkiaNF9fOgCkXuuWuHDE3v6XnFCI0Lfr/ViYuHr7P9EZThxmTbJYEqO7Lc
         3kEoa0C2AA2hLg3U7vfgE7HgyBpa1NzcFta7EJPcXQvO8K+9vcDp834AfTGXBZ0+eZqT
         D/ZCenPS+afAUNbazuch9U8MPl56fezX+Sfhj2+98avOEg11/9H4dBRFDs+0XsBTrxTT
         nMfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JHt96uT4Q7BwS4NdRXSU1MVIN9ZQRmgKBYoUqlA70sg=;
        b=KuEwE8QHB0cepxQgArRoGrcsjqwhnnUThUQVrEoDborcij5GURjxU3c/J2tzz1Cr/I
         FYar8LBwuWqh8GAvZbClTug5hsULv9DnkJcqsCBU53jOVsQwlJoI+gqAmxcrzTKjvEZu
         qfZRCE53krf6FPwIkFrqFQ/IpLakefgjFUgVhE8AIwEbaiD1pyDinu4FxA7R+XzPCcW7
         GLS3RtfeqqkNLho/ikMcPNlD2ctPM67AbzhrUPdmoUYpYbSTvt8LlRFZnxTa5pusLJZ6
         1jXQGQAIx3aF9AR939pHl76ugDwUJnfIEfNA0ThmFlhnfZhllAx1E1hxtwCU55ogaVBY
         ftlw==
X-Gm-Message-State: AJIora87Lf3Ka++2umO+uC9STItiQ9Muo6918uud8aWYDppm/vfMDPBn
	S9ib+tberBCDgNPmD0FrCG1vVQ==
X-Google-Smtp-Source: AGRyM1uU2a9N+Tlm73VXF1neUxMMjGVz19hV+EhKo6BBv9h2XUa3CSeloMqm50v7vGSnm5mdnJA8Kw==
X-Received: by 2002:a5d:6d0d:0:b0:21d:7ae5:22ee with SMTP id e13-20020a5d6d0d000000b0021d7ae522eemr13289006wrq.152.1657488321495;
        Sun, 10 Jul 2022 14:25:21 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:c7c0:6823:f3ce:2447])
        by smtp.gmail.com with ESMTPSA id m19-20020a05600c3b1300b003a2dd0d21f0sm7142759wms.13.2022.07.10.14.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 14:25:21 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linexp.org>
To: daniel.lezcano@linaro.org,
	rafael@kernel.org
Cc: rui.zhang@intel.com,
	khilman@baylibre.com,
	abailon@baylibre.com,
	amitk@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)...),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi SoC support),
	linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi SoC support)
Subject: [PATCH v1 28/33] input/drivers/touchscreen_sun4i: Switch to new of thermal API
Date: Sun, 10 Jul 2022 23:24:18 +0200
Message-Id: <20220710212423.681301-29-daniel.lezcano@linexp.org>
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
 drivers/input/touchscreen/sun4i-ts.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/input/touchscreen/sun4i-ts.c b/drivers/input/touchscreen/sun4i-ts.c
index 742a7e96c1b5..7cee09504e34 100644
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
+static struct thermal_zone_device_ops sun4i_ts_tz_ops = {
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

