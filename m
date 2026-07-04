Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37598374E4C
	for <linux-sunxi@lists.linux.dev>; Sat,  4 Jul 2026 17:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783185358; cv=none; b=eJQDePN2dtcKmVIfKkQ7+DMaDC0P461uS3YDzzp25QGTpnpGQlO3IMbbSFn7ByKV6W3bQyLmPyeeL2g8cYT/TWYfp8boYqk8+RiFc1C1bVXX6ViKbCeRjYc5N1MVIkkEYnwrC+K3Fv0Qgd1j6yxmP91sfHH8M8kh2cTIbp3h/MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783185358; c=relaxed/simple;
	bh=seTZIEtXtqVVYV7kSKXvd99fs7QNW1ZFwg2DmcgKEAI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DiL72lJRICBqdSceLSlgfXRMNOlDawaEzXQIDSkQLplaAxepTMS2XEJYocklUS4v8D0A3uPpV+PIK/q5YB+T+W1hvB7soSGQrkW/jl/SdTrfnQxRA+s4DqMqF+YiRasjJPwhzDgCIX8RsgPNy2qK4iLrsUwTreK33aHSGWRl18U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KR3Smi4N; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KR3Smi4N"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-845c92bc464so1080543b3a.2
        for <linux-sunxi@lists.linux.dev>; Sat, 04 Jul 2026 10:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783185356; x=1783790156; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+gR5VfBTV21+OrP9WqQJ4BqzawxRB45whAsA2GtJSFg=;
        b=KR3Smi4NP6i82wBHQcxJzySC4CkBU2vfVEQUAI7/H7VNHcJXUacA0HppFKa0h0rINm
         MEdRUzk5oFWmzXVs1g5Hf9t+fXYdWsKhwyuiq2zPjMAsr+RMUmtOSz7KGP5Sbam0wdd+
         V8XpgRZsckRjJDRKvtPpqdv4/4+vv5i68gdzij7vXw8yNua2ZPoz2lz/9QdgQlhNJN9U
         1ZXh1lIS5/Bc4tTY4guL0xSXBZtXKa167iLoWyZsq0nDxcatwrYKpU+y2EpvH+omuIpY
         3u4TUxiJwL38HYaMksYIn3Q00y27o5L9ztEOVtbqWzxK2Tq2fCOiRLUdmZ0CRq8mZdLJ
         oq1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783185356; x=1783790156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+gR5VfBTV21+OrP9WqQJ4BqzawxRB45whAsA2GtJSFg=;
        b=NTCiygjwb/+3x3RA0fXV1GNv+xZ0f4NmLmXKFL1HHdtQKrNGQjllBBGoyXFh/1RWp0
         wyFdO5iF2EEZo8oC1t2fvxwyO7n2SKFDfEThMx06WYmV7AwemZ+sai8fBNZ69aPE8RCZ
         IYcR1QhuXaDgr5CRj5PB8SN1pFYReACgaNxfDajx5fKp1p6A6ilEe9JZUh1MaWS0LU1d
         w5Yheec0KCWJywwwSOL2zOMIQ1esP5ioDqdMRily43yZaftsx9eYvN/VXGBDqZDJVbDR
         QNcDVSvzoytdBYttUcC/6l3aWP1k05d4EHcXkmqnoyvB879wA6LjyRaZwKDZqeUx6UD+
         IJ+A==
X-Forwarded-Encrypted: i=1; AFNElJ+dB1jI2v6JG+ZAybToQANxsu33whHdvM3gvH5CYzjYpbtlygnYLEDsR4f9tztCRTdiVGG2POLDaYMs4w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwFr2pQXElu9yhi8wp9tz1rBwN7oqAYme2z2ZE+93qcP7l6Q5XF
	Am5Rntk95L+gpTUt9kCHt8geBYRSahcq/1SbOwIHUJBoZ5yuktGXSjJI
X-Gm-Gg: AfdE7clN/lOMZxpTFyh5E+9wiKmJoonUrsc6A7/SrUsQ+HitEd328aSiF6rSPSN6t6Q
	2Qg46lkcZXiSl1WSKiZ/RpvBH41FCduSiCS5cV5solNrQ5pVi7bB2qhL0dsUR4u4bq0exLdkrXX
	pv7cMnlIvm8iTxad6a/3n+XT5Sx4wiiEe8kr1tTi5G9sq3yvGhjcOjzMM/WOQvmIf8/LsCZg9Ev
	VaVq5/ia6w5e0ilDHH73x0J90ZY6Ijs19Lh/k3FnBkpd468bTDO2eWR38VULsdr8L5YkzjDcpHc
	w0lHuSrlbM42QW5Y7C8pZkdWl7DLG87akcu7DfpA5QwZwP/ImtHRxDrYubEI+J3SzNyqD3CB0uB
	7+f7J9YNEuzUxsVeSMUXW+TaElgpq6oBk5bowRNwJsxtGOtIGRL6fCUsgHSeJDOktyMqpViPbUQ
	wBcjtuebcRsG1GtxQ=
X-Received: by 2002:a05:6a00:2394:b0:845:ec31:26cd with SMTP id d2e1a72fcca58-847f6f4fe9bmr3324398b3a.46.1783185356439;
        Sat, 04 Jul 2026 10:15:56 -0700 (PDT)
Received: from archlinux ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d498adsm1379101b3a.32.2026.07.04.10.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 10:15:54 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 4/5] thermal/drivers/sun8i: Add support for A523 THS0/1 controllers
Date: Sun,  5 Jul 2026 01:14:10 +0800
Message-ID: <20260704171411.1413349-5-iuncuim@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260704171411.1413349-1-iuncuim@gmail.com>
References: <20260704171411.1413349-1-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The A523 processor has two temperature controllers, THS0 and THS1.
THS0 has only one temperature sensor, which is located in the DRAM
controller. THS1 does have 3 sensors:
ths1_0 - "big" cores
ths1_1 - "little" cores
ths1_2 - gpu

The datasheet mentions a fourth sensor in the NPU, but lacks any registers
for operation other than calibration registers. The vendor code reads the
value from ths1_2, but uses separate calibration data, so we get two
different values from real one.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
---
 drivers/thermal/sun8i_thermal.c | 133 ++++++++++++++++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
index 3bdd62aa8..f48ed9eae 100644
--- a/drivers/thermal/sun8i_thermal.c
+++ b/drivers/thermal/sun8i_thermal.c
@@ -59,6 +59,12 @@
 #define SUN50I_H6_THS_PC_TEMP_PERIOD(x)		((GENMASK(19, 0) & (x)) << 12)
 #define SUN50I_H6_THS_DATA_IRQ_STS(x)		BIT(x)
 
+#define SUN55I_A523_DELIMITER			0x7c8
+#define SUN55I_A523_OFFSET_ABOVE		2736
+#define SUN55I_A523_OFFSET_BELOW		2825
+#define SUN55I_A523_SCALE_ABOVE			74
+#define SUN55I_A523_SCALE_BELOW			65
+
 struct tsensor {
 	struct ths_device		*tmdev;
 	struct thermal_zone_device	*tzd;
@@ -114,6 +120,15 @@ static int sun50i_h5_calc_temp(struct ths_device *tmdev,
 		return -1590 * reg / 10 + 276000;
 }
 
+static int sun55i_a523_calc_temp(struct ths_device *tmdev,
+				 int id, int reg)
+{
+	if (reg >= SUN55I_A523_DELIMITER)
+		return SUN55I_A523_SCALE_ABOVE * (SUN55I_A523_OFFSET_ABOVE - reg);
+	else
+		return SUN55I_A523_SCALE_BELOW * (SUN55I_A523_OFFSET_BELOW - reg);
+}
+
 static int sun8i_ths_get_temp(struct thermal_zone_device *tz, int *temp)
 {
 	struct tsensor *s = thermal_zone_device_priv(tz);
@@ -299,6 +314,97 @@ static int sun50i_h6_ths_calibrate(struct ths_device *tmdev,
 	return 0;
 }
 
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
+			sensor_reg = ((caldata[5] >> 8) | (caldata[6] << 8)) & TEMP_CALIB_MASK;
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
+			((sensor_temp - ft_temp) / SUN55I_A523_SCALE_ABOVE);
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
@@ -717,6 +823,31 @@ static const struct ths_thermal_chip sun50i_h616_ths = {
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
+	.sensor_num = 3,
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
@@ -727,6 +858,8 @@ static const struct of_device_id of_ths_match[] = {
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

