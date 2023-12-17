Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6EB481D1
	for <linux-sunxi@lists.linux.dev>; Sun, 17 Dec 2023 21:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N2sFAhKn"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-55333eb0312so480019a12.1
        for <linux-sunxi@lists.linux.dev>; Sun, 17 Dec 2023 13:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702847361; x=1703452161; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LAUbIAntM3d+P1r7PxLEQx0z9V8P0MjzX6e4WUbLKOw=;
        b=N2sFAhKn3cOWt0+vlnfo+2w8GPVqVoUNptfSI/XMpcw/A8V9DAeL6cEIyKiHUvKYZg
         JSMFfm4Wi587cM5+BV7P5BZdZ6STMFhAUpVGigeAkU2LWe6UlTKr5xuhFR2Xs8omLEtv
         Al+gL3/T4YS116OAX8zh/JiTZx9xNPheMyo45W/kOsa2wL/kX3Unc8xT4Z6jC2wykBT4
         mDHGm1MFwf1s/pZCxztlHRI8I8ZQGJ9OEJpsG6Z2JDo2FKNB5tMn5MNyzxYuTWy7Vk7X
         3vhWNb8lD/VwRm5QDRVPwaLNjmIziwx/b4MGyaQ+lcClJkwAt5L0dSou+FtSRPtoUs0E
         pt9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702847361; x=1703452161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LAUbIAntM3d+P1r7PxLEQx0z9V8P0MjzX6e4WUbLKOw=;
        b=F41+sHANrxoKrU+8FSXAEzcX6rMjFpY7FnKnJ1MbloACKVGgKRGPUKz09iec5rIht9
         qUtQUI5vjqIR7dkxbnoFhvwIo3w3b1I+s3zDnpZtqh911Kp0NS77+Q7ScVuaR/BHdEqN
         9gXjGBlcQTxqM3o3wU91G1BVUmHX2f2VW+SB9QkAb8TV3K381csT+jh33U4IcwR1HVbD
         Q5KIsWCfU6yblJUjAcuytJh186fzW0r9CQXT2QAi5h3agYjvalvn2bspQgwmJiDGDh+2
         yjBau8VZzdk0DKt/CmFOCE2SilJ6omZHmCzlaq/VFYxQeNEi9PbM4h/XAo1n4wI1b+3q
         Curw==
X-Gm-Message-State: AOJu0Yy0nBaQitXYdP/OP3Z7K7/84ILqFuyIjkbcBgm0tNA9dVgYXVlT
	ULwYKBLadnnt1Fq7zjZVdGY=
X-Google-Smtp-Source: AGHT+IGXBluqcGQB7k35DpbnUHnaijO7J6FnYJlOKlthAcSTpRKN4IAiy50prOqyAzcchEuhhGrjqg==
X-Received: by 2002:a17:907:a0d:b0:a23:3212:9c37 with SMTP id bb13-20020a1709070a0d00b00a2332129c37mr1452093ejc.50.1702847360868;
        Sun, 17 Dec 2023 13:09:20 -0800 (PST)
Received: from wpc.yadro.com (188-169-139-214.dsl.utg.ge. [188.169.139.214])
        by smtp.gmail.com with ESMTPSA id vc11-20020a170907d08b00b00a1ce58e9fc7sm13316096ejc.64.2023.12.17.13.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Dec 2023 13:09:20 -0800 (PST)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: 
Cc: Andre Przywara <andre.przywara@arm.com>,
	Maxim Kiselev <bigunclemax@gmail.com>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	John Watts <contact@jookia.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v6 2/3] thermal: sun8i: Add D1/T113s THS controller support
Date: Mon, 18 Dec 2023 00:06:23 +0300
Message-Id: <20231217210629.131486-3-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231217210629.131486-1-bigunclemax@gmail.com>
References: <20231217210629.131486-1-bigunclemax@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Maxim Kiselev <bigunclemax@gmail.com>

This patch adds a thermal sensor controller support for the D1/T113s,
which is similar to the one on H6, but with only one sensor and
different scale and offset values.

Signed-off-by: Maxim Kiselev <bigunclemax@gmail.com>
---
 drivers/thermal/sun8i_thermal.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
index f989b55a8aa8..6a8e386dbc8d 100644
--- a/drivers/thermal/sun8i_thermal.c
+++ b/drivers/thermal/sun8i_thermal.c
@@ -606,6 +606,18 @@ static const struct ths_thermal_chip sun50i_h6_ths = {
 	.calc_temp = sun8i_ths_calc_temp,
 };
 
+static const struct ths_thermal_chip sun20i_d1_ths = {
+	.sensor_num = 1,
+	.has_bus_clk_reset = true,
+	.offset = 188552,
+	.scale = 673,
+	.temp_data_base = SUN50I_H6_THS_TEMP_DATA,
+	.calibrate = sun50i_h6_ths_calibrate,
+	.init = sun50i_h6_thermal_init,
+	.irq_ack = sun50i_h6_irq_ack,
+	.calc_temp = sun8i_ths_calc_temp,
+};
+
 static const struct of_device_id of_ths_match[] = {
 	{ .compatible = "allwinner,sun8i-a83t-ths", .data = &sun8i_a83t_ths },
 	{ .compatible = "allwinner,sun8i-h3-ths", .data = &sun8i_h3_ths },
@@ -614,6 +626,7 @@ static const struct of_device_id of_ths_match[] = {
 	{ .compatible = "allwinner,sun50i-a100-ths", .data = &sun50i_a100_ths },
 	{ .compatible = "allwinner,sun50i-h5-ths", .data = &sun50i_h5_ths },
 	{ .compatible = "allwinner,sun50i-h6-ths", .data = &sun50i_h6_ths },
+	{ .compatible = "allwinner,sun20i-d1-ths", .data = &sun20i_d1_ths },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, of_ths_match);
-- 
2.40.1

