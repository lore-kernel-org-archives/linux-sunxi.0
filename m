Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFE0256C61
	for <linux-sunxi@lists.linux.dev>; Mon,  4 May 2026 05:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777871050; cv=none; b=Xn5rPfGCedPCKS5v9UuIDE69do2RFu3weaN4tDn4IDxR09Wnlm+WUB+b6URThC0RTPBg597My5VtYQjtthYa2COfKK9HH2K5IBQaecM2z3jW7/53ag1FirC6r3lN1AJScsbcQrSCC2M4rAJskQwORdkEXjVdDdORdiFCz1ktipc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777871050; c=relaxed/simple;
	bh=QyoUgJ2jJeKlm1ndIJvXIiS5587bYg8xTKAl4U8ecQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FrM0V4slUoN42JPg5QRTbkAV6UTkGx16vTAtUrP6B0dcXo9ia3sABGycW1RNRN+3igxioTMDbuiqHZ5G/U2KX0isyM1EvOT0iVup/PI6nOaUFBieV3wL1w7au8BPq26L98Icvednxy72vSyy1ZghHazzmW6QxD7NEg1RnL0sgVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a+TKlZ6j; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a+TKlZ6j"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-365425c98c6so357194a91.0
        for <linux-sunxi@lists.linux.dev>; Sun, 03 May 2026 22:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777871049; x=1778475849; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B3+Iww+WFVs530WIpfYPC8wfiAgNCYmHbA4msVXQjbo=;
        b=a+TKlZ6jaa1zfwmEElqMey3h1CCNsmTRrc/B1uaHvmai7DBrpelL9s9znsydic24rI
         5ZG/UQ5S6xWoRurXerHvYyv3ZnRsVugRGOYpGwkEmDQ+bpO4W1d+b4+EjwOYtk93HsYl
         je2PFnKHGWitBW1VBMRIhOM3j4NHwEx6/d4NJeJjeI26s0vWi9r+ugKYc1RZch2W4fwy
         I0LafN+UnNVs1/JEZOZRfCF+i9YI46TjSPjd66LVM7+gM3dNFOVSNCvtBCWMT+eHcp5D
         uPX5e1cxZj/Qy2ZNI8nOnjqDVlJ8dNB/maca9L+4sEdsB5aB79trHiBH0v2lpgPptBcP
         YCWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777871049; x=1778475849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B3+Iww+WFVs530WIpfYPC8wfiAgNCYmHbA4msVXQjbo=;
        b=IQwFQeHNdJRrY7FA3LdCJs6QonsRIM/AUtIJBy40hNxftcUo44EN6iQw/AeMo/lU8E
         auAzUNNNo3/n39fZYVhQ4fLrsV7X8sTuUcdpagGcXtykX4QtxH+mpsCLd6He0NNe/2bm
         z33loxbE37dMzVC4p2JDiqJUhZfOA5OAR3VbZ6mp4F5HFa5WEYV/XduTGe+RP8I38SUM
         lPST8Q2EZw0uAPfk0e2uHSghE4+d+IDmPHaqX2d1dsyrMFVi6NOBlCUv06wTP2Cf7CVA
         HT8Vl/Um3kvz5dfkQnjcl8pZBBb43eVYplFSs/w+sGAuEl11rONitx9uIPGejSmvgyl8
         r1FQ==
X-Forwarded-Encrypted: i=1; AFNElJ8iEcLy8PFTM10VNbSLVeYYhOatDARMdi4g+U0a0wIxcGaCxcGMNKC0PyGGDJAS9UJGM7f4fyr4ihIwww==@lists.linux.dev
X-Gm-Message-State: AOJu0YxZ7l9z5QnEoEmWh2r63vE39h1geSvZoOrwSVUJ++w434aTukts
	osCczQeiaYND9AlR+DUbCzwUhsT3TND4dGS6Y2BkSbIdBxTTYd4FuWcH
X-Gm-Gg: AeBDietmbFeqYT4uvCKL9fI+j9l7iOC4aseAW9CaAOS4oZR/2pYKXh1StjTsEvC2SCC
	PyUElZ/YxJ1qfDbem8HGUPI3bmQCPhOyjzJVDE70t4CLcSQS362cyXmzkEwe06rtIJzI239b3az
	gprxrjikkO8l6cdSi8gP9mb2nWF65JwoINVIgw2d/OmEnvTErEi8NszlBdpxpEqD5EvELcYBkBH
	lBJdYfbiP5Dg/Q/urmHVbRMFIiFHkDcIso1tPLITufwa6DA/VqQ1/IBeeCS02DPWh+4NcyTH6R7
	e7ZUjHTRjjMHfwte9Jlocf2Tn4xE5R70TiUVrEFvnuDpEeDyAeLOOo3mHKfsQVMGLImKc7Se7Md
	ZluA9IyaV8pv3MhpyabWPn7E0xeER4TMIf4cK6IkHUHoJ7d9geJOL9kpqfHy4MMSMpPAYL7J7eA
	+3Kw==
X-Received: by 2002:a17:90b:2b45:b0:35d:8fdb:4f36 with SMTP id 98e67ed59e1d1-3650ce0098dmr8169319a91.18.1777871048840;
        Sun, 03 May 2026 22:04:08 -0700 (PDT)
Received: from archlinux ([2605:e440:15::152])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365437b50b0sm2662908a91.0.2026.05.03.22.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 22:04:08 -0700 (PDT)
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
Subject: [PATCH v4 4/5] thermal/drivers/sun8i: Add support for A523 THS0/1 controllers
Date: Mon,  4 May 2026 13:02:44 +0800
Message-ID: <20260504050245.646078-5-iuncuim@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260504050245.646078-1-iuncuim@gmail.com>
References: <20260504050245.646078-1-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
 drivers/thermal/sun8i_thermal.c | 133 ++++++++++++++++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
index c4aaff8f7..3b73aafab 100644
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
@@ -722,6 +828,31 @@ static const struct ths_thermal_chip sun50i_h616_ths = {
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
@@ -732,6 +863,8 @@ static const struct of_device_id of_ths_match[] = {
 	{ .compatible = "allwinner,sun50i-h6-ths", .data = &sun50i_h6_ths },
 	{ .compatible = "allwinner,sun20i-d1-ths", .data = &sun20i_d1_ths },
 	{ .compatible = "allwinner,sun50i-h616-ths", .data = &sun50i_h616_ths },
+	{ .compatible = "allwinner,sun55i-a523-ths0", .data = &sun55i_a523_ths0 },
+	{ .compatible = "allwinner,sun55i-a523-ths1", .data = &sun55i_a523_ths1 },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, of_ths_match);
-- 
2.54.0

