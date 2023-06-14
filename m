Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF2D6FBB
	for <linux-sunxi@lists.linux.dev>; Wed, 14 Jun 2023 12:56:07 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-3f8c74af64fso5738495e9.1
        for <linux-sunxi@lists.linux.dev>; Wed, 14 Jun 2023 05:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686747365; x=1689339365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YepcUjgWrlzucwsUXaypG8Xwm55IhlbZIwruLgPvyBE=;
        b=F51kGwChgtMam7+0FLFHEzdk+DFy/9+MlYjnFjYPdWQhHG8jv6vSd9cO+88v3BfRPw
         BHCQwfdLUYSjub3dCSa71rl6vUYkohnDsgpoc+98YpmON1uNihUkFG4vJZiPy5O13zuf
         kcRvqBmcbmtEVGwbSB2CdZjd4wqqDaIdfko2K2kHmFqnMsgUVNKNisAjxRGA5sMKnlnc
         HlFGkTFVm6M6LrrHzI7yzcQzMSwaS/S4lfp1JpYzCyn2viM0dMNikN1d5nGe5Hryy9/h
         zhKFnH/NJT/IKKGoXIrNS0rPjg8IJKIPLZf86Kj4YJ4/rjAwVIAn4ivceBv7ICw83b43
         PFdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686747365; x=1689339365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YepcUjgWrlzucwsUXaypG8Xwm55IhlbZIwruLgPvyBE=;
        b=kXh7Cf4IrH2ITeDStwLC7PMw2hoWCZx527Z+4N0rflp3crAEhtrT5eOfJBjqWgyG8Y
         tUrJHQMpeieybzBel54rJf8/BJXRzLfE3vNnGAEhzyN92+HtNwtc2BxLy/Yst/Yls4hX
         I6xxjKXhtMRLWN9viMStwUazmGhPId6e5MaIQeBpdFH0L9H+Ms8C/e275cb7bWEkl0pq
         9PB8yms7gMGAJcfmGFysxk37yDr2pVu0OhVN/SXsSEYFXnLiFe/2ImlxUZ+3cOZUo1TZ
         NIk4IpFhCJl+G6Dv5sJPxq19zVPW7B32d85nrBsLkUpzyoHNdzmXl3Mz0utJezD2TYsS
         /K2w==
X-Gm-Message-State: AC+VfDzUcqaOioWp4sYVjYG+V27n44ICUDDpyvD8vnZRYbh7GmGzQ/Aw
	0z8fRgn/+5UiNRzj0s4KAsk=
X-Google-Smtp-Source: ACHHUZ4jL/18v+yeoDRa6uKUlkZ94eQoDQIc/G0RPv2dXEDM634qS0fXpWbBMwLe/D9AttbkyWXPcw==
X-Received: by 2002:a1c:6a18:0:b0:3f7:19f9:4c4f with SMTP id f24-20020a1c6a18000000b003f719f94c4fmr10721940wmc.21.1686747364978;
        Wed, 14 Jun 2023 05:56:04 -0700 (PDT)
Received: from user-PC.. ([92.51.95.194])
        by smtp.gmail.com with ESMTPSA id c21-20020a05600c0ad500b003f7310a3ffasm17402522wmr.2.2023.06.14.05.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 05:56:04 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Maxim Kiselev <bigunclemax@gmail.com>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Amit Kucheria <amitk@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v5 2/3] thermal: sun8i: Add D1/T113s THS controller support
Date: Wed, 14 Jun 2023 15:55:20 +0300
Message-Id: <20230614125530.660597-3-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230614125530.660597-1-bigunclemax@gmail.com>
References: <20230614125530.660597-1-bigunclemax@gmail.com>
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
index 793ddce72132..01cc4e130892 100644
--- a/drivers/thermal/sun8i_thermal.c
+++ b/drivers/thermal/sun8i_thermal.c
@@ -628,6 +628,18 @@ static const struct ths_thermal_chip sun50i_h6_ths = {
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
@@ -636,6 +648,7 @@ static const struct of_device_id of_ths_match[] = {
 	{ .compatible = "allwinner,sun50i-a100-ths", .data = &sun50i_a100_ths },
 	{ .compatible = "allwinner,sun50i-h5-ths", .data = &sun50i_h5_ths },
 	{ .compatible = "allwinner,sun50i-h6-ths", .data = &sun50i_h6_ths },
+	{ .compatible = "allwinner,sun20i-d1-ths", .data = &sun20i_d1_ths },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, of_ths_match);
-- 
2.39.2

