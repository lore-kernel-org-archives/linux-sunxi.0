Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE9320FC
	for <linux-sunxi@lists.linux.dev>; Sat, 10 Jun 2023 20:36:24 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3f735bfcbbbso21213565e9.2
        for <linux-sunxi@lists.linux.dev>; Sat, 10 Jun 2023 13:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686429383; x=1689021383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e9cOOb3r9v8BRSMkdUQlBjQ12Gi0JnIYbGoQ0F774a0=;
        b=hCzJ8w/C8XAiKMLk1PQVqDGJUYz+ewadst0OkQUn4d5nizx00kUrz+JvsV5fjHJOs1
         xYN7oz/akg9Y/NBAodNbp7uwpGj7HcK++NNAtUFmiRQTPl7g8/4jYmmg/y0cuvOudf1z
         EY6uBG3TAPq0mFe3X/T8YGU230zN5YUKmwSoODaUofWBqgMEf5ZHqRO2vFsZ9giLPHD+
         xbaWYFLF4lEIo51q7jS30UB3k5tgtJSEalnDNpZNciBuNxSt6AJUubqrD1V9pbvpOdF5
         zOkfgWYCkLE4YeuVNtGKw1XL7w6HUJravJGULA496KvFehy6T0ENZSaQVGYE0sXfj8zw
         R0xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686429383; x=1689021383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e9cOOb3r9v8BRSMkdUQlBjQ12Gi0JnIYbGoQ0F774a0=;
        b=HDgtXP4TPvX7C0Yhpk1+NlmYdEUqyJkqJGCRUU10J+n9iKX3X0tJpSVefqXaIwQxPm
         R7PfjXBt+ExaZqXUsqFbL1+4z/ZprmVssxsL5rEANfyGpw8DrY7Wf03SbkH0dFNsk7sA
         xbiSUbVKhMrV77b9bIzlapnCzOWeLyL/LxLdLaovLlT4M0jx7i1ogsdpw8b9BJz3xTKM
         hikM6lpeZMoba4h48P4PnPGQYtukIuyuM9zRJqOr0E0AVvu092cYQ7bDiBPyn0pm6zZG
         Ch+uen/qTa24ehUBJEJ5CY2MJxFswNnAhd/pblXEM4HOeTwn+dDsRHidP/Knj3HBBCSD
         mBnQ==
X-Gm-Message-State: AC+VfDyfmN1sPmGAdUXcLmXlk6QdJK072VydnmepWlntykLi3bTf1ly0
	EPYzaJejS0uXncPuwjZImVw=
X-Google-Smtp-Source: ACHHUZ6znngh/wR+0bLuo2/c7FCAm/DUauulTjJoR3scCyrl5bnT5rG0oH5Yd0jsw/WxkHptEHGjQQ==
X-Received: by 2002:a7b:c7d8:0:b0:3f7:16ed:4cb2 with SMTP id z24-20020a7bc7d8000000b003f716ed4cb2mr3232250wmk.13.1686429382439;
        Sat, 10 Jun 2023 13:36:22 -0700 (PDT)
Received: from user-PC.. ([92.51.95.194])
        by smtp.gmail.com with ESMTPSA id m13-20020a7bce0d000000b003f42a75ac2asm6572867wmc.23.2023.06.10.13.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jun 2023 13:36:22 -0700 (PDT)
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
Subject: [PATCH v2 2/3] thermal: sun8i: Add D1/T113s THS controller support
Date: Sat, 10 Jun 2023 23:35:43 +0300
Message-Id: <20230610203549.1127334-3-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230610203549.1127334-1-bigunclemax@gmail.com>
References: <20230610203549.1127334-1-bigunclemax@gmail.com>
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
Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
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

