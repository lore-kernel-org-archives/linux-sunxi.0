Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC4032F76D
	for <linux-sunxi@lists.linux.dev>; Sun, 13 Sep 2026 14:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789311415; cv=none; b=tWI5qBz6ttyb393LzSRgsTNSBfM+5rc/cltWP7YNfyIC4Nev+o3jvmBTE2fLGOBzkiuCCmlyn63vR8nLuvQJQs8me3p068auDl1Xhd58ioudeJfCrJ0AuW+1q7nH/gjziNLHW480UvGueoyKsfMS6i47hUfLzmxSjPV8+spOm5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789311415; c=relaxed/simple;
	bh=002rqKnwYlIeVlmK+OrjXg0dmApCO+jy4dOIn8rGOwc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Yh2HR3p4CIkzlRHS++cKwsMfFGAmO0f86QC0rvQk8sXTdK/CPt8idN9HiyTZORGkMdovOa47zMHF64eUsvsu6Hykip+qYasdXF6mmQ2QohH1VJU9S1hkMEDCZnQX2nhmPJUzAbBpAGM1rYowGV5Wl8bKiqWuKiLOywqH1MD9SOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SR7jGNDx; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SR7jGNDx"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d942c7cc2fso23188785ad.3
        for <linux-sunxi@lists.linux.dev>; Sun, 13 Sep 2026 07:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789311411; x=1789916211; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MFmILcFARM3nbjJrUrOfoTXP5jUQVkRuUWrnpYTCEmM=;
        b=SR7jGNDxVmAhjmEakxBRuzQsH1MtLkbLzZE9sXhlPP23yFzP0sTzvNwCKDxiPgR3Iz
         sHQF3JoxjOstdOteHnU1j9JGuxoeDTpsYdSHu63rZhHY9N+CehasM+zX+g1EeK6PoBX4
         VslRGwjxDWbtZVErqjBOxauJ3H2aWzwvOazj5xcEpdHV8TQZoiST7rnOU9DUg8UsNrSn
         CueimjTLd0waN114RB9+tT/lA30k4g6EajlGuoUPZGMQtTY9VQuquSgID4oWfaSem53b
         qDWtxGIuecBlMpp7b5cohXHeAe6KWuW8IPd2zUXmaqp4/PNsIPoFDwrP+0iNq5BI6KLC
         qnoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789311411; x=1789916211;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MFmILcFARM3nbjJrUrOfoTXP5jUQVkRuUWrnpYTCEmM=;
        b=mYLkGDZGkKf8s8GQYv7rcS3nNwg3s+OFvATcBCee6XyYSraBd33twlyB9w7RP0M43m
         AzdXFtIJY7cxyIriV3qe4bIndfWvXxBSPEFdiAQ5r9BZfYj/3nBNV5O0mNy0uS5/WpQa
         /SMf59ffqAbjiJyuYjuBm3vF732Tm4h8EUUGrS6Np5eyYYhHb/cgRcOKFOnx+6szJc7E
         86Qb1gGw72PBZmfk16QpLbjgpRDqxwrxDl68dn3tSIlb/+j7qmhTNUYnMR54B+34ZfG0
         D5xDPjh6Cei2erOP2Jw8OvFzWxGzYQQ8IB+DGWHUlNMXWkMEIOCJa3Q2CCoemioOX59N
         YLXg==
X-Forwarded-Encrypted: i=1; AKwUvByA4ZYXJ0NjsVjxfxW1eYs57oO7uMytKCbbCSNh3NtdYO+2wxVfnQkwQkQFXsuwhEzvC7gCkoPafCq8Pg==@lists.linux.dev
X-Gm-Message-State: AFuF++mapaYaXi1fNq34thI3YRGoDov+pF8Day1JAg+x9WYPcvS7yNRg
	9bTQTk1hd+fUr2tVSSI5m/dO6pGzjvHbkrYsCGUZmhQSC+bp4PxrcRRa
X-Gm-Gg: AYBFou0I16OP18KBQVYLgf45VzR+nqoc2hLPVn1N7+dcUpdjs9bLQYZAE/jm5rZKLbO
	UCsxiz3JQz7rQ8x489UL3WOwXvwfNxnquVnpy+1Cj1tnvFWZNely1wp5jcOBFS47+5Wwhl6Y3vC
	crgAOKP8bN+uNRQj0np9rLxhcczA8ndS1oRMIIYpKYoQcGOVH7LP3qdsYPICG2NtIon6d5QzUKu
	dmTAl4XFkltsefj+Sm/REGX2X8El+Gsx34nLJzscmSWrg/z0a47r73k+5o26X/1h+hpsCySkYAo
	c9H91TjPHnwz1HEnC/ICRHlUJI+hhAXSdGFCIOq7X1OVKGW5GqZZEAfNBlEpn8OE6XNCcjpxrhv
	1Fw6By1w7Y5Xms2+RjA/+n0cWO1goHdAN+skin3efGDGOPxLLQw1+cETMlAE6QW6/s8+CHxMcAY
	oXcHUuLDIPQg+9Hre0qt/4/hONFzt9gmiaElpKTms/LqofCvpVcCgF4UFCcN9ZkpEs
X-Received: by 2002:a17:90b:51c8:b0:38e:5b59:c2ff with SMTP id 98e67ed59e1d1-39d9bbc802bmr22552630a91.3.1789311411298;
        Sun, 13 Sep 2026 07:56:51 -0700 (PDT)
Received: from archlinux ([207.90.239.231])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba7a9bb56sm21467366eec.31.2026.09.13.07.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 07:56:50 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	=?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v6 4/5] thermal/drivers/sun8i: Add support for A523 THS0/1 controllers
Date: Sun, 13 Sep 2026 22:55:26 +0800
Message-ID: <20260913145527.18148-5-iuncuim@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913145527.18148-1-iuncuim@gmail.com>
References: <20260913145527.18148-1-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Mikhail Kalashnikov <iuncuim@gmail.com>

The A523 processor has two temperature controllers, THS0 and THS1.
THS0 has only one temperature sensor, which is located in the DRAM
controller. THS1 does have 4 sensors:
ths1_0 - "big" cores
ths1_1 - "little" cores
ths1_2 - gpu
ths1_3 - npu

The user manual for the T527 processor describes 4 sensors, whereas
the one for the A523 describes only 3. As additional information, the BSP
driver was used, in which the value SUN55IW3_CAL_COM(5000) is used as
the calibration value in the formula; in the mainline driver it is
treated as the ft_deviation value. Also, in the BSP driver the NPU sensor
is used for both the GPU and the NPU — its actual purpose is unclear;
both sensors are functional and show temperature changes depending on
load.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 drivers/thermal/sun8i_thermal.c | 147 ++++++++++++++++++++++++++++++++
 1 file changed, 147 insertions(+)

diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
index 360654880..4a81486f8 100644
--- a/drivers/thermal/sun8i_thermal.c
+++ b/drivers/thermal/sun8i_thermal.c
@@ -59,6 +59,12 @@
 #define SUN50I_H6_THS_PC_TEMP_PERIOD(x)		((GENMASK(19, 0) & (x)) << 12)
 #define SUN50I_H6_THS_DATA_IRQ_STS(x)		BIT(x)
 
+#define SUN55I_A523_DELIMITER			0x7c8
+#define SUN55I_A523_OFFSET_BELOW		2736
+#define SUN55I_A523_OFFSET_ABOVE		2825
+#define SUN55I_A523_SCALE_BELOW			74
+#define SUN55I_A523_SCALE_ABOVE			65
+
 struct tsensor {
 	struct ths_device		*tmdev;
 	struct thermal_zone_device	*tzd;
@@ -114,6 +120,21 @@ static int sun50i_h5_calc_temp(struct ths_device *tmdev,
 		return -1590 * reg / 10 + 276000;
 }
 
+/*
+ * The constant names were chosen in accordance with the BSP driver;
+ * they indicate whether the value corresponds to a high or low
+ * temperature (relative to a value of ~55 °C), rather than the reg value
+ * that was read.
+ */
+static int sun55i_a523_calc_temp(struct ths_device *tmdev,
+				 int id, int reg)
+{
+	if (reg >= SUN55I_A523_DELIMITER)
+		return SUN55I_A523_SCALE_BELOW * (SUN55I_A523_OFFSET_BELOW - reg);
+	else
+		return SUN55I_A523_SCALE_ABOVE * (SUN55I_A523_OFFSET_ABOVE - reg);
+}
+
 static int sun8i_ths_get_temp(struct thermal_zone_device *tz, int *temp)
 {
 	struct tsensor *s = thermal_zone_device_priv(tz);
@@ -298,6 +319,105 @@ static int sun50i_h6_ths_calibrate(struct ths_device *tmdev,
 	return 0;
 }
 
+/*
+ * The A523 calibration data is stored in the eFuse, split across two
+ * nvmem cells. THS1 has four sensors, including ths1_3 which is used
+ * for the NPU, each with its own calibration value. The fields are
+ * packed as shown in the layouts below.
+ *
+ * efuse layout 0x38-0x3F (caldata[0..3]):
+ *     caldata[0]      caldata[1]      caldata[2]      caldata[3]
+ * 0               16      24      32  36          48          60 64
+ * +---------------+---------------+---------------+---------------+
+ * |               |       |   temp    |  ths1_0   |  ths1_1   |   +
+ * +---------------+---------------+---------------+---------------+
+ *
+ * efuse layout 0x44-0x4B (caldata[4..7]):
+ *     caldata[4]      caldata[5]      caldata[6]      caldata[7]
+ * 0           12  16      24      32  36          48             64
+ * +---------------+---------------+---------------+---------------+
+ * |  ths1_2   |  ths1_3   |    ths0   |           |               +
+ * +---------------+---------------+---------------+---------------+
+ */
+static int sun55i_a523_ths_calibrate(struct ths_device *tmdev,
+				     u16 *caldata, int callen)
+{
+	struct device *dev = tmdev->dev;
+	int i, ft_temp;
+
+	if (!caldata[1])
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
+			sensor_reg = ((caldata[5] >> 8) |
+				      (caldata[6] << 8)) & TEMP_CALIB_MASK;
+		} else {
+			switch (i) {
+			case 0:
+				sensor_reg = (caldata[2] >> 4) & TEMP_CALIB_MASK;
+				break;
+			case 1:
+				sensor_reg = caldata[3] & TEMP_CALIB_MASK;
+				break;
+			case 2:
+				sensor_reg = caldata[4] & TEMP_CALIB_MASK;
+				break;
+			case 3:
+				sensor_reg = ((caldata[4] >> 12) |
+					      (caldata[5] << 4)) & TEMP_CALIB_MASK;
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
+		 * temperature to register values).
+		 *
+		 * The BSP's SUN55IW3_CAL_COM(5000) is applied as ft_deviation
+		 * in sun8i_ths_get_temp(), after calc_temp(), and therefore
+		 * intentionally not repeated here.
+		 */
+		cdata = CALIBRATE_DEFAULT -
+			((sensor_temp - ft_temp) / SUN55I_A523_SCALE_BELOW);
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
 static int sun8i_ths_calibrate(struct ths_device *tmdev)
 {
 	struct nvmem_cell *calcell = NULL;
@@ -719,6 +839,31 @@ static const struct ths_thermal_chip sun50i_h616_ths = {
 	.calc_temp = sun8i_ths_calc_temp,
 };
 
+/* The A523 has a shared reset line for both chips */
+static const struct ths_thermal_chip sun55i_a523_ths0 = {
+	.sensor_num = 1,
+	.has_bus_clk_reset = true,
+	.has_mod_clk = true,
+	.ft_deviation = 5000,
+	.temp_data_base = SUN50I_H6_THS_TEMP_DATA,
+	.calibrate = sun55i_a523_ths_calibrate,
+	.init = sun50i_h6_thermal_init,
+	.irq_ack = sun50i_h6_irq_ack,
+	.calc_temp = sun55i_a523_calc_temp,
+};
+
+static const struct ths_thermal_chip sun55i_a523_ths1 = {
+	.sensor_num = 4,
+	.has_bus_clk_reset = true,
+	.has_mod_clk = true,
+	.ft_deviation = 5000,
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
@@ -729,6 +874,8 @@ static const struct of_device_id of_ths_match[] = {
 	{ .compatible = "allwinner,sun50i-h6-ths", .data = &sun50i_h6_ths },
 	{ .compatible = "allwinner,sun20i-d1-ths", .data = &sun20i_d1_ths },
 	{ .compatible = "allwinner,sun50i-h616-ths", .data = &sun50i_h616_ths },
+	{ .compatible = "allwinner,sun55i-a523-ths0", .data = &sun55i_a523_ths0 },
+	{ .compatible = "allwinner,sun55i-a523-ths1", .data = &sun55i_a523_ths1 },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, of_ths_match);
-- 
2.55.0

