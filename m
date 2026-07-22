Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCEA43C054
	for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 20:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784752444; cv=none; b=lHRh35WfIo1aVTEtMtB36xyNoZbWYOrUV7vz7d33dqoyIiVnHvxQVadyl9PhS7nOOtAUudvnyeqp41iXXB9rebF4hGErbjx7xUqvsHTx0Hu0MkIGs4LCD5HlTUCCFKM0vgsyaUnrsqBh4P8waCUC3xQ+/kWcjra5PMY2OS6tP9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784752444; c=relaxed/simple;
	bh=XJPPHxvlhX7+yckB+Oxkh/O6RdSQleix8ttfdkXWMwc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hHWJyjieaRFd+6XWizSPl5LPfow4wd2iQWWTrpLMA4CDdNj5+2vTEe+uokWCOkR+zFFOQPzZTrBDvPtboW+j3rfqKYJ5ghoHvv9NJWn4tUqLsb7KiFrOQg4FhsXHX+nWzT53F/tKsX3qjj5JJn5E+7bRt2FPAYuOMDQXwxl4LpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LfXi4/FV; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LfXi4/FV"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4954f5e8020so23676055e9.2
        for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 13:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784752440; x=1785357240; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r+zTFoTWUUJ+4b3U4GZ5sdW+uFxLxmihuq+hef+CKeU=;
        b=LfXi4/FVA1XBF6NgYcLHX8LLy6zBqNtZ7E3ipbWbqN/MHVlTl/gpIXPKsk4jYvVC5Q
         wEIJM/Hsfq6r98/JQTF4dlHhYJD8rNHS9JSCTiQVXU/jIl0p9xs4vwlhgYhxbemmXJbb
         e2SqnfbY9eMzoY4i67VYVIJY8s9fHdB4P+YOx+DDx+4HF2Jcu7RK2OHOou7Sb+bKmpo4
         V0j7CiJ/Nrvn1pXAO93nevju2ZJkEwctOnuNVxVS9zoW5OBjXtDyp11GtnVzgkI4GCV6
         S+vE8AGrTFZlgOCk/TnKOVTZPwnkYUn0wtUxKkDtJql9mY8/YeEoo+GuqKP90G6EQpuU
         sz6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784752440; x=1785357240;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r+zTFoTWUUJ+4b3U4GZ5sdW+uFxLxmihuq+hef+CKeU=;
        b=jmdS5qJ2su697dnYzzaQjduOjp65O7Is/W/IOkbjUhgThX8fhoP+WPkHjHLltNAGKs
         SEEY7GCOBeE7tK+ZDkqbGf58bRI7MrpB6uOmF7YdQdcWZAGh5ivGNXlK5Mv7mQ9pk7wS
         iUfqu8r8Y+7LUcxwBrE0EXOQTTZYCA3MNLLomLHr0Z8450FJkLl04o5YkbaAGobcH+FU
         +G6g5cVwnPLgczLgzcql7jQMZNx5i6FF1muvgS3bWvNU4ZmVZNG7GC++EqYibCZBnjiL
         jFaBK9bJpfrYtq0IeDartSQp1NKrzLLYw4z4iz+CLaYHiGyVmsKrMG3ExOvBNkusRDBJ
         zG9Q==
X-Forwarded-Encrypted: i=1; AHgh+RpKHWEuRgwBpg1KBNnufwftMHoNbpw1adVg3yVCJb/cclJsHizZmoR8xjJNv1YWTc1yOkC+6/4RCemV4Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9jun1d+a3ZcK9I6BVSTgxeGH2Sf07G0suOD4ZkWDwkqNlowBV
	bwHsGD+A7RxLph9B3iUesSdxdfoFUXZ/4bYz481isOF8GnhquPtEKggv
X-Gm-Gg: AR+sD13YuYgzWyt4dz+nN+ga+aCYIQI0EicNlP0y68T7oo/SBB+jqZnZtRJnZCficWJ
	yHuDqifz7t1egt+WbYcL/lkhuJjGJWpnscGu7SNf1f9ASN6Zvtpg2LD6qe42xloL6TGm838orhQ
	6S71CLyBzdQyrq4Q3GBP5UwCcfyBc9YbtI8KvBPBezbVlB9gV8bhPcU55rxKda9j4l6Y10DFrN/
	UO1qB/yMl3qsOiu2YjwOZXfYmr1fvLofsN3nVNvKt3c5z9I1K05RR+3YrnVD7dgUog9N7Qo9NlZ
	kZnW9/dviSrJ4c4T14usXWOQWQUKku4JRypinXSfb/LG1hTXPw32g7tsc1V6emPNYJiKODKZdt0
	lmoYDvLna2IMqo3Bg9CAQNj/ObDWVvVQ7hqjz1Xpqu6ttExTacy0hdyMOUisgcPMLlaB5Tet9aj
	822Spz82iKAvLTxv4LDlidNFFaoTDqLl+PRzY=
X-Received: by 2002:a7b:cb86:0:b0:493:bc4b:b8c with SMTP id 5b1f17b1804b1-49573cf1557mr1519575e9.38.1784752440278;
        Wed, 22 Jul 2026 13:34:00 -0700 (PDT)
Received: from coolemuke.fritz.box ([2a00:6020:b320:1a00:c256:1463:a40b:d8c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956ab2f0a2sm63134945e9.1.2026.07.22.13.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 13:33:59 -0700 (PDT)
From: "=?UTF-8?q?S=C3=B6ren=20Hantel?=" <fugininsane@gmail.com>
X-Google-Original-From: =?UTF-8?q?S=C3=B6ren=20Hantel?= <fugininsane@googlemail.com>
To: linux-pm@vger.kernel.org
Cc: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Rossak <embed3d@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?S=C3=B6ren=20Hantel?= <fugininsane@googlemail.com>,
	Claude Fable 5 <noreply@anthropic.com>
Subject: [PATCH 2/3] thermal/drivers/sun8i: Add support for the A80 THS
Date: Wed, 22 Jul 2026 22:33:40 +0200
Message-ID: <20260722203341.2917852-3-fugininsane@googlemail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722203341.2917852-1-fugininsane@googlemail.com>
References: <20260722203341.2917852-1-fugininsane@googlemail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Allwinner A80 thermal sensor is an early relative of the THS found
in the A83T and later SoCs. It shares its register block, bus gate,
4 MHz module clock and reset line with the GPADC; the THS registers
live at offset 0x40 of the shared block, with four data registers for
the four sensors (0: big cluster, 1: DRAM, 2: GPU, 3: little cluster).

Register layout, initialization values and the temperature formula
(T = 190 - raw * 1000 / 14543, i.e. offset 190000 / scale 688 in this
driver's convention) are taken from the vendor BSP kernel. The init
sequence also programs the hardware alarm (~90 degC) and emergency
shutdown (~105 degC) thresholds the BSP uses, since their reset
defaults are undefined.

Unlike on later SoCs the data-ready interrupt fires at the conversion
rate (tens of kHz), so it is left disabled and the thermal core polls
the sensors; the interrupt line only serves the alarm and shutdown
events, matching the vendor BSP behaviour.

The A80 SID is not yet supported by the sunxi nvmem driver, so
calibration data is currently unavailable and the driver falls back to
the defaults, which yield plausible results (idle temperatures around
40 degC, full-load peaks in the mid 50s on a Cubieboard4).

Tested on a Cubietech Cubieboard4: all four zones report load-reactive
temperatures via polling.

Co-authored-by: Claude Fable 5 <noreply@anthropic.com>
Signed-off-by: Sören Hantel <fugininsane@googlemail.com>
---
 drivers/thermal/sun8i_thermal.c | 93 ++++++++++++++++++++++++++++++++-
 1 file changed, 92 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
index 2267479..3e7bfda 100644
--- a/drivers/thermal/sun8i_thermal.c
+++ b/drivers/thermal/sun8i_thermal.c
@@ -65,8 +65,27 @@ struct tsensor {
 	int				id;
 };
 
+/*
+ * The A80 thermal sensor shares its register block with the GPADC.
+ * The THS registers start at offset 0x40 within that block.
+ */
+#define SUN9I_THS_CTRL				0x40
+#define SUN9I_THS_IC				0x44
+#define SUN9I_THS_IS				0x48
+#define SUN9I_THS_ALARM_TH(x)			(0x50 + (x) * 0x4)
+#define SUN9I_THS_SHUT_TH(x)			(0x60 + (x) * 0x4)
+#define SUN9I_THS_MFC				0x70
+#define SUN9I_THS_TEMP_DATA			0x80
+#define SUN9I_THS_CTRL_ACQ(x)			((x) << 16)
+#define SUN9I_THS_CTRL_SENSOR_EN		GENMASK(3, 0)
+#define SUN9I_THS_ALARM_IRQ_EN			GENMASK(3, 0)
+#define SUN9I_THS_SHUT_IRQ_EN			GENMASK(7, 4)
+#define SUN9I_THS_ALARM_IRQ_STS(x)		BIT(x)
+#define SUN9I_THS_SHUT_IRQ_STS(x)		BIT(4 + (x))
+
 struct ths_thermal_chip {
 	bool            has_mod_clk;
+	unsigned long	mod_clk_rate;
 	bool            has_bus_clk_reset;
 	bool		needs_sram;
 	int		sensor_num;
@@ -413,7 +432,8 @@ static int sun8i_ths_resource_init(struct ths_device *tmdev)
 			return PTR_ERR(tmdev->mod_clk);
 	}
 
-	ret = clk_set_rate(tmdev->mod_clk, 24000000);
+	ret = clk_set_rate(tmdev->mod_clk, tmdev->chip->mod_clk_rate ?:
+			   24000000);
 	if (ret)
 		return ret;
 
@@ -596,6 +616,76 @@ static int sun8i_ths_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static int sun9i_a80_thermal_init(struct ths_device *tmdev)
+{
+	int i;
+
+	/* clear any pending interrupt status */
+	regmap_write(tmdev->regmap, SUN9I_THS_IS, 0xfff);
+	/* set up the median filter, average over 8 samples */
+	regmap_write(tmdev->regmap, SUN9I_THS_MFC, 0x5);
+
+	/*
+	 * Program the protection thresholds with the values the vendor
+	 * BSP uses (thresholds are in raw sensor units, which decrease
+	 * with rising temperature): an alarm interrupt at ~90 degC and
+	 * an emergency hardware shutdown at ~105 degC.
+	 */
+	for (i = 0; i < tmdev->chip->sensor_num; i++) {
+		regmap_write(tmdev->regmap, SUN9I_THS_ALARM_TH(i),
+			     (1454 << 16) | 0xfff);
+		regmap_write(tmdev->regmap, SUN9I_THS_SHUT_TH(i),
+			     (1231 << 16) | 0xfff);
+	}
+
+	/*
+	 * Unlike on later SoCs, the data-ready interrupt fires at the
+	 * conversion rate (tens of kHz), so leave it disabled and let the
+	 * thermal core poll the data registers; the interrupt line only
+	 * serves the alarm and shutdown events, like in the vendor BSP.
+	 */
+	regmap_write(tmdev->regmap, SUN9I_THS_IC,
+		     SUN9I_THS_ALARM_IRQ_EN | SUN9I_THS_SHUT_IRQ_EN);
+	/* acquire time 0x2f, enable all four sensors */
+	regmap_write(tmdev->regmap, SUN9I_THS_CTRL,
+		     SUN9I_THS_CTRL_ACQ(0x2f) | SUN9I_THS_CTRL_SENSOR_EN);
+
+	return 0;
+}
+
+static unsigned long sun9i_a80_irq_ack(struct ths_device *tmdev)
+{
+	unsigned long irq_bitmap = 0;
+	int i, state;
+
+	regmap_read(tmdev->regmap, SUN9I_THS_IS, &state);
+
+	for (i = 0; i < MAX_SENSOR_NUM; i++) {
+		if (state & (SUN9I_THS_ALARM_IRQ_STS(i) |
+			     SUN9I_THS_SHUT_IRQ_STS(i))) {
+			regmap_write(tmdev->regmap, SUN9I_THS_IS,
+				     state & (SUN9I_THS_ALARM_IRQ_STS(i) |
+					      SUN9I_THS_SHUT_IRQ_STS(i)));
+			set_bit(i, &irq_bitmap);
+		}
+	}
+
+	return irq_bitmap;
+}
+
+static const struct ths_thermal_chip sun9i_a80_ths = {
+	.sensor_num = 4,
+	.has_mod_clk = true,
+	.mod_clk_rate = 4000000,
+	.has_bus_clk_reset = true,
+	.scale = 688,
+	.offset = 190000,
+	.temp_data_base = SUN9I_THS_TEMP_DATA,
+	.init = sun9i_a80_thermal_init,
+	.irq_ack = sun9i_a80_irq_ack,
+	.calc_temp = sun8i_ths_calc_temp,
+};
+
 static const struct ths_thermal_chip sun8i_a83t_ths = {
 	.sensor_num = 3,
 	.scale = 705,
@@ -711,6 +801,7 @@ static const struct ths_thermal_chip sun50i_h616_ths = {
 
 static const struct of_device_id of_ths_match[] = {
 	{ .compatible = "allwinner,sun8i-a83t-ths", .data = &sun8i_a83t_ths },
+	{ .compatible = "allwinner,sun9i-a80-ths", .data = &sun9i_a80_ths },
 	{ .compatible = "allwinner,sun8i-h3-ths", .data = &sun8i_h3_ths },
 	{ .compatible = "allwinner,sun8i-r40-ths", .data = &sun8i_r40_ths },
 	{ .compatible = "allwinner,sun50i-a64-ths", .data = &sun50i_a64_ths },
-- 
2.43.0

