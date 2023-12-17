Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34C344386
	for <linux-sunxi@lists.linux.dev>; Sun, 17 Dec 2023 13:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iHQdGnkY"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40c6ea99429so18881785e9.3
        for <linux-sunxi@lists.linux.dev>; Sun, 17 Dec 2023 05:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702821239; x=1703426039; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7l6SuuWclfbVcOTuZs6JSfev7h3TS/9oDDExwi6b7pM=;
        b=iHQdGnkYiVGV33ODrPNMk3FYkVFwUyXibgB7eBAkCQ2Zkxnm4HE0TUX/vhrmEQcek/
         vgQrx8b3tqhIVQVC8wRiUWa4bmFg5EOAgDbLgPKviqdwc/Jqpewmt/b/TSVGwHeu920J
         6MddcCAJ3EXRHNJrXrflDzKlp2+t/aT69uRPNRoYEIzlgeb/P6pe9ztQLcM7FwnKolFj
         LRsZo4IHatExkqAydXz+2miJbTuuWakbq+bsnnoGRCZpYE96k6CkbpoKHtvaFUfGlDCt
         20PgZ5dY2JPr4KxK+Wsas0SOme5TT9o7d3s+TP6T/PfDgyWeqgLuyD3AtHe6FHM28+gL
         hUgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702821239; x=1703426039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7l6SuuWclfbVcOTuZs6JSfev7h3TS/9oDDExwi6b7pM=;
        b=CYanCdVbDzx/fwsgQM+aLnQSMIbmYdJqt/zDAvBZv0JHr0+KGARjjPdXEZSiBHnUIn
         mxii1/eWrzBCkyW3QXqP/D6L6onJXweO94Lo8q6wXCeueMqJrKfJ6lvhHAH8vkOuiFHR
         CP9GszMOiRHXLI7JS04CJ7/GvU7P5J3yPV+xIsc/Jmk4EZJhW2YMmXVkR0QsClrYz5er
         g+HfrWvNsJr2g73SOQWH/8S7tH18b6dhaUnvd/jtMkIbGM/Ywh10gLdxFaCkxwx+SbBf
         wYTlKl2+sxivvjZBqzL0zfl+PK6FLuu3pXqQ4CxbJN/wxqBDJrs+tWtmZ4H6/bIHHkfy
         F5Lg==
X-Gm-Message-State: AOJu0YxHltsK8b6n9mtQNhrz46OwDg41L97mL9UofUclZPWZtGZJmoXQ
	HynjWIPcYY6eJviAF0TVB1A=
X-Google-Smtp-Source: AGHT+IEW3JCvQI7Q3hwLZUTOI9M8yh3XX24F2pz+loq7Z2S4XB7vyZmMIT7P0YAlr69z8+T0dBsjDQ==
X-Received: by 2002:a05:600c:a45:b0:40d:1773:4c57 with SMTP id c5-20020a05600c0a4500b0040d17734c57mr264600wmq.195.1702821238481;
        Sun, 17 Dec 2023 05:53:58 -0800 (PST)
Received: from wpc.yadro.com (188-169-139-214.dsl.utg.ge. [188.169.139.214])
        by smtp.gmail.com with ESMTPSA id i9-20020a05600c354900b003fee6e170f9sm37413770wmq.45.2023.12.17.05.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Dec 2023 05:53:58 -0800 (PST)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: 
Cc: Maksim Kiselev <bigunclemax@gmail.com>,
	Martin Botka <martin.botka@somainline.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-pm@vger.kernel.org (open list:ALLWINNER THERMAL DRIVER),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi SoC support),
	linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v1] thermal: sun8i: extend H6 calibration function to support 4 sensors
Date: Sun, 17 Dec 2023 16:36:36 +0300
Message-Id: <20231217133637.54773-1-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The H616 SoC resembles the H6 thermal sensor controller, with a few
changes like four sensors.

Extend sun50i_h6_ths_calibrate() function to support calibration of
these sensors.

Signed-off-by: Martin Botka <martin.botka@somainline.org>
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
---
 drivers/thermal/sun8i_thermal.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
index f989b55a8aa8..9af95b4785be 100644
--- a/drivers/thermal/sun8i_thermal.c
+++ b/drivers/thermal/sun8i_thermal.c
@@ -221,16 +221,21 @@ static int sun50i_h6_ths_calibrate(struct ths_device *tmdev,
 	struct device *dev = tmdev->dev;
 	int i, ft_temp;
 
-	if (!caldata[0] || callen < 2 + 2 * tmdev->chip->sensor_num)
+	if (!caldata[0])
 		return -EINVAL;
 
 	/*
 	 * efuse layout:
 	 *
-	 *	0   11  16	 32
-	 *	+-------+-------+-------+
-	 *	|temp|  |sensor0|sensor1|
-	 *	+-------+-------+-------+
+	 * 0      11  16     27   32     43   48    57
+	 * +----------+-----------+-----------+-----------+
+	 * |  temp |  |sensor0|   |sensor1|   |sensor2|   |
+	 * +----------+-----------+-----------+-----------+
+	 *                      ^           ^           ^
+	 *                      |           |           |
+	 *                      |           |           sensor3[11:8]
+	 *                      |           sensor3[7:4]
+	 *                      sensor3[3:0]
 	 *
 	 * The calibration data on the H6 is the ambient temperature and
 	 * sensor values that are filled during the factory test stage.
@@ -243,9 +248,16 @@ static int sun50i_h6_ths_calibrate(struct ths_device *tmdev,
 	ft_temp = (caldata[0] & FT_TEMP_MASK) * 100;
 
 	for (i = 0; i < tmdev->chip->sensor_num; i++) {
-		int sensor_reg = caldata[i + 1] & TEMP_CALIB_MASK;
-		int cdata, offset;
-		int sensor_temp = tmdev->chip->calc_temp(tmdev, i, sensor_reg);
+		int sensor_reg, sensor_temp, cdata, offset;
+
+		if (i == 3)
+			sensor_reg = (caldata[1] >> 12)
+				     | ((caldata[2] >> 12) << 4)
+				     | ((caldata[3] >> 12) << 8);
+		else
+			sensor_reg = caldata[i + 1] & TEMP_CALIB_MASK;
+
+		sensor_temp = tmdev->chip->calc_temp(tmdev, i, sensor_reg);
 
 		/*
 		 * Calibration data is CALIBRATE_DEFAULT - (calculated
-- 
2.40.1

