Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15EF13FEE
	for <linux-sunxi@lists.linux.dev>; Fri, 11 Apr 2025 00:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744332007; cv=none; b=RcpDUhholMxPcekaT89Dv9b1OtrVSDjtoUGXw9h7VsCS+u0TsrKzkHLETZ+bgkUdfuGdegT9mHN+ATENbCsiMx4lMAGq34sTOML/uDd/F+ij1a/leNLjaZ/LSfR7o/ZJDn0tjuxd5B5KqtgjTf+Hym0SO2RXMaJ7dtbiNbWsyN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744332007; c=relaxed/simple;
	bh=z60GVKKnq+EBoMPOIQiGwthlZL/5bB21DgiBmuXlxlY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yx9ijuqJZVy1SwlsYfGGIorP6k+VavW84JjYzwaWfL+5bXN6IVrzdzjho43EyZpi/6n0l+1tDs4qXiqOi4UchUxIeZp5e5a+FWx8UxZFxSEkq3LSKI1q/WlA1FmdZCp4UXZ/xOz648cQOnmiJSN4V3djkoS5S0Lmap6B4bpEyco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e2/Nh19T; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e2/Nh19T"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3061513d353so15198721fa.2
        for <linux-sunxi@lists.linux.dev>; Thu, 10 Apr 2025 17:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744332004; x=1744936804; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+rSfwK2IdMno7cgyqb3eYYWrYZbiRnVldmhW9L6vWA=;
        b=e2/Nh19TDtH0CFmO4MIaOBAxT/arwwGcD0NkNo8hDG7dBXRMZLZ0+dlt8FPk2PmG7A
         i4NAuQvRj0jtWzZLgpJjIShnC+wopPfeVrWdYzj2S/1KthZ/gUfxh2J7BdiqSjsCTdwP
         7DqUUF+RNdzEvuwEFPJVj+LqvrzI9qVPLdQs640BitI90y40dP0j01ptKOFVOIMlm3qi
         a5BgJWxehQKQL9WdTt8rBbolmenP68zMGkm3zXuffBhGTiuSnZMo99JDUPSZIBdHSiZ7
         pCV/Vd0Wlspg02BtKktcC5R9fPmZ1+aJl93b/y/gH4AHf8HHQ3fG14HjRVh6iyjmFqsy
         ZwiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744332004; x=1744936804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d+rSfwK2IdMno7cgyqb3eYYWrYZbiRnVldmhW9L6vWA=;
        b=Zoe96U74tSFrVBh4cuw00Z+f+xPGgPT4GZ13Gp5Ua/HABjlSy3KW2wJ4mEZ5NgKmYp
         kWXrbLCeeT2zUuKTZBUXKKfAN8Vh4nOf4DXuTarfmKzZnwFbol9rADk07qCt9RiIiVL3
         cOrRkVHNiNyLMl2ZyvLWT8i5kAGcxnxN30oAsjCBj3fW2gASu/juoO9V3zvDbdPNYtu7
         Zc1EfQYYM9lFx3LBj1tXWt/uN0akGhgH69zCq8NDWeEEFUnXzBXTwL1W8K5iKbfB9EDt
         iLftbhESG8+wQAI+CH7zm2wi5JvZxqdVcrkD4heNRDbBJRK9WoEOIb9VAtFvQ73kFxT+
         /L7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUmt7KlSNL6Wc11IYfzlWvyf58RtVX+fNb8fNTE6Iv7jJhMP1NYSeFlR+Bj9gVlC42iGtWSTm40bq+03Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzYF6EBQsaMWSKouMn5ql27U0OQXboqwlhL0Q9MpijXMtcESlkf
	POXKsQNS76uDI7b0TUFJ/CnvlPiLg5uNjthaNoA7TBGfypHxo982
X-Gm-Gg: ASbGncuxqimh/c3JFRQjHvpGz4o79se8lqguZ/KY6W84ORRZExhVnqQndi8+G4/xQ8T
	mNk0nc72oStAOI1GffjwQNmv4WD95Hq8b4/J46SV2WyRmnrnCddmjp1sPBKI5j5mFsffTLi88/X
	dLuSClqJnQq47nPBWRM7+BhM23szpNq91pU/mQTuJsDW/PM1jMJRdq1EBww34m9bOX71oqtzX5k
	AtzTj0ZXHVimkJSbVGw3cuAnjXQas+ZSg7Lke0DxmmDOqty4fN5i+aBKS5DBSI/IYdGHNszcFTC
	ugVmLxZ+BuwPshc+ZZVm5Pu9FREN6odWtZWByuCDg6GwZDtKDw==
X-Google-Smtp-Source: AGHT+IEHx3pLyyA7RUjJFQMZKlcC6nirFWEfuuk3UQ55sdEchAVrUtO52D2wnKHHqYnoHtifKxO3Bg==
X-Received: by 2002:a2e:ab18:0:b0:30c:7a7:e87c with SMTP id 38308e7fff4ca-31049a9a9f5mr2279391fa.35.1744332003965;
        Thu, 10 Apr 2025 17:40:03 -0700 (PDT)
Received: from localhost.localdomain ([176.106.241.81])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f464ea5c6sm6344251fa.62.2025.04.10.17.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 17:40:03 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Subject: [PATCH 3/6] thermal/drivers/sun8i: Add support for A523 THS0/1 controllers
Date: Fri, 11 Apr 2025 08:38:23 +0800
Message-ID: <20250411003827.782544-4-iuncuim@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250411003827.782544-1-iuncuim@gmail.com>
References: <20250411003827.782544-1-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mikhail Kalashnikov <iuncuim@gmail.com>

The A523 processor has two temperature controllers, THS0 and THS1.
THS0 has only one temperature sensor, which is located in the DRAM.

THS1 does have 3 sensors:
ths1_0 - "big" cores
ths1_1 - "little" cores
ths1_2 - gpu

The datasheet mentions a fourth sensor in the NPU, but lacks any registers
for operation other than calibration registers. The vendor code reads the
value from ths1_2, but uses separate calibration data, so we get two
different values from real one.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 drivers/thermal/sun8i_thermal.c | 134 ++++++++++++++++++++++++++++++++
 1 file changed, 134 insertions(+)

diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
index dc4055c9c..919b05a96 100644
--- a/drivers/thermal/sun8i_thermal.c
+++ b/drivers/thermal/sun8i_thermal.c
@@ -116,6 +116,15 @@ static int sun50i_h5_calc_temp(struct ths_device *tmdev,
 		return -1590 * reg / 10 + 276000;
 }
 
+static int sun55i_a523_calc_temp(struct ths_device *tmdev,
+					int id, int reg)
+{
+	if (reg >= 0x7c8)
+		return tmdev->chip->scale * (tmdev->chip->offset - reg);
+	else
+		return 65 * (2825 - reg);
+}
+
 static int sun8i_ths_get_temp(struct thermal_zone_device *tz, int *temp)
 {
 	struct tsensor *s = thermal_zone_device_priv(tz);
@@ -208,6 +217,100 @@ static irqreturn_t sun8i_irq_thread(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+
+/*
+ * The A523 nvmem calibration values. The ths1_3 is not used as it
+ * doesn't have its own sensor and doesn't have any internal switch.
+ * Instead, the value from the ths1_2 sensor is used, which gives the
+ * illusion of an independent sensor for NPU and GPU when using
+ * different calibration values.
+ *
+ * efuse layout 0x38-0x3F (caldata[0..3]):
+ *     caldata[0]      caldata[1]      caldata[2]      caldata[3]
+ * 0               16      24      32  36          48          60 64
+ * +---------------+---------------+---------------+---------------+
+ * |               |       |   temp    |  ths1_0   |  ths1_1   |   +
+ * +---------------+---------------+---------------+---------------+
+ *
+ * efuse layout 0x40-0x43 (caldata[4..5]) - not in use
+ *
+ * efuse layout 0x44-0x4B (caldata[6..9]):
+ *     caldata[6]      caldata[7]      caldata[8]      caldata[9]
+ * 0           12  16      24      32  36          48             64
+ * +---------------+---------------+---------------+---------------+
+ * |  ths1_2   |  ths1_3   |  ths0_0   |           |               +
+ * +---------------+---------------+---------------+---------------+
+ */
+static int sun55i_a523_ths_calibrate(struct ths_device *tmdev,
+				   u16 *caldata, int callen)
+{
+	struct device *dev = tmdev->dev;
+	int i, ft_temp;
+
+	if (!caldata[0])
+		return -EINVAL;
+
+	ft_temp = (((caldata[2] << 8) | (caldata[1] >> 8)) & FT_TEMP_MASK) * 100;
+
+	for (i = 0; i < tmdev->chip->sensor_num; i++) {
+		int sensor_reg, sensor_temp, cdata, offset;
+		/*
+		 * Chips ths0 and ths1 have common parameters for value
+		 * calibration. To separate them we can use the number of
+		 * temperature sensors on each chip.
+		 * For ths0 this value is 1.
+		 */
+		if (tmdev->chip->sensor_num == 1) {
+			sensor_reg = ((caldata[7] >> 8) | (caldata[8] << 8)) & TEMP_CALIB_MASK;
+		} else {
+			switch (i) {
+			case 0:
+				sensor_reg = (caldata[2] >> 4) & TEMP_CALIB_MASK;
+				break;
+			case 1:
+				sensor_reg = caldata[3] & TEMP_CALIB_MASK;
+				break;
+			case 2:
+				sensor_reg = caldata[6] & TEMP_CALIB_MASK;
+				break;
+			default:
+				sensor_reg = 0;
+				break;
+			}
+		}
+
+		sensor_temp = tmdev->chip->calc_temp(tmdev, i, sensor_reg);
+
+		/*
+		 * Calibration data is CALIBRATE_DEFAULT - (calculated
+		 * temperature from sensor reading at factory temperature
+		 * minus actual factory temperature) * X (scale from
+		 * temperature to register values)
+		 */
+		cdata = CALIBRATE_DEFAULT -
+			((sensor_temp - ft_temp) / tmdev->chip->scale);
+
+		if (cdata & ~TEMP_CALIB_MASK) {
+			/*
+			 * Calibration value more than 12-bit, but calibration
+			 * register is 12-bit. In this case, ths hardware can
+			 * still work without calibration, although the data
+			 * won't be so accurate.
+			 */
+			dev_warn(dev, "sensor%d is not calibrated.\n", i);
+			continue;
+		}
+
+		offset = (i % 2) * 16;
+		regmap_update_bits(tmdev->regmap,
+				   SUN50I_H6_THS_TEMP_CALIB + (i / 2 * 4),
+				   TEMP_CALIB_MASK << offset,
+				   cdata << offset);
+	}
+
+	return 0;
+}
+
 static int sun8i_h3_ths_calibrate(struct ths_device *tmdev,
 				  u16 *caldata, int callen)
 {
@@ -721,6 +824,35 @@ static const struct ths_thermal_chip sun50i_h616_ths = {
 	.calc_temp = sun8i_ths_calc_temp,
 };
 
+/* The A523 has a shared reset line for both chips */
+static const struct ths_thermal_chip sun55i_a523_ths0 = {
+	.sensor_num = 1,
+	.has_bus_clk_reset = true,
+	.has_gpadc_clk = true,
+	.ft_deviation = 5000,
+	.offset = 2736,
+	.scale = 74,
+	.temp_data_base = SUN50I_H6_THS_TEMP_DATA,
+	.calibrate = sun55i_a523_ths_calibrate,
+	.init = sun50i_h6_thermal_init,
+	.irq_ack = sun50i_h6_irq_ack,
+	.calc_temp = sun55i_a523_calc_temp,
+};
+
+static const struct ths_thermal_chip sun55i_a523_ths1 = {
+	.sensor_num = 3,
+	.has_bus_clk_reset = true,
+	.has_gpadc_clk = true,
+	.ft_deviation = 5000,
+	.offset = 2736,
+	.scale = 74,
+	.temp_data_base = SUN50I_H6_THS_TEMP_DATA,
+	.calibrate = sun55i_a523_ths_calibrate,
+	.init = sun50i_h6_thermal_init,
+	.irq_ack = sun50i_h6_irq_ack,
+	.calc_temp = sun55i_a523_calc_temp,
+};
+
 static const struct of_device_id of_ths_match[] = {
 	{ .compatible = "allwinner,sun8i-a83t-ths", .data = &sun8i_a83t_ths },
 	{ .compatible = "allwinner,sun8i-h3-ths", .data = &sun8i_h3_ths },
@@ -731,6 +863,8 @@ static const struct of_device_id of_ths_match[] = {
 	{ .compatible = "allwinner,sun50i-h6-ths", .data = &sun50i_h6_ths },
 	{ .compatible = "allwinner,sun20i-d1-ths", .data = &sun20i_d1_ths },
 	{ .compatible = "allwinner,sun50i-h616-ths", .data = &sun50i_h616_ths },
+	{ .compatible = "allwinner,sun55i-a523-ths0", .data = &sun55i_a523_ths0 },
+	{ .compatible = "allwinner,sun55i-a523-ths1", .data = &sun55i_a523_ths1 },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, of_ths_match);
-- 
2.49.0

