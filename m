Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39AF3D67
	for <linux-sunxi@lists.linux.dev>; Sun,  7 May 2023 15:05:58 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3078fa679a7so609656f8f.3
        for <linux-sunxi@lists.linux.dev>; Sun, 07 May 2023 08:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683471957; x=1686063957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J7busPrq4Ix2D0XVL7/yDg+1KY42O5SIQ2uX5rrJTys=;
        b=WJviFBiRpKKdvo1AbdVorv1k0LHGOVJgpFX4nC2Bi+cMQlqBqyIvX4pWyPQ9zWDuU5
         bCfrjfVXnvCwV1yFR20U13u10aFZqJIv1e8E7idIxkNWP+oP3RPNIeZDFxbywq0ALqFO
         XccX3TebqOKg04UsHzW12VyT9FdtC2x1cMNTeSzFW4ZAuu2UoRb32QFv4/E/DPmO6lbv
         g/mm3cYM97lkrjN0F3nIQN1/SCU15/Uqc0p9v+SzQevYcmUwiNGJmVdmmS01sL/q4rx2
         RxVFvOiun6xporcGtN8DaG7QRxYfkpA4E3SAEtvDkSTBsC7FHXxQbtrJSfND19PilENn
         lkDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683471957; x=1686063957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J7busPrq4Ix2D0XVL7/yDg+1KY42O5SIQ2uX5rrJTys=;
        b=K1iVOJoqFB5wibw6OK+frW0UEAHFWesU09Z4eUWSB5SdlIrRwdRtJd5UiGFLmjs8yY
         GPjqDj8boN8EvBW1k5ma0lPzgMPF3oNMg6sv1D5lE3eMJICyaCUzXcikM98hcWkv9ppb
         Y35Zoq11+gxACANY1h9Gpz/sVmRlqsH1kEEk7TLt1sGJBeJB3WqMxfPnRfiZ8cEREeCj
         n/cR1gGcv3iq5H+Y/kwLFhVqzJ4fFg1qXy3+ImTxI6VrMur2bMB/nZu9Rwf4kUHS3kNB
         Y/8zfRK/qqLQa0kECjwyDDKNsTTXzqQ1jEIwjS540FXxgGqRHoVCdCmDTUPYXBgvVnKB
         I/hA==
X-Gm-Message-State: AC+VfDwkqwX7L8/5j9Lpdcz5zrjz3W6Psl4sISUOIFafZv5NpHerF7eJ
	LCZ4XIUrkuIlMoQQDXo3Ecs=
X-Google-Smtp-Source: ACHHUZ6Tgq00goUGd6cc5bfJap5ngrn1ZPs4mrdlVseReHkslpgNcCs6pqxjKm3kGw5VrEUK/xif5w==
X-Received: by 2002:adf:f84b:0:b0:307:8b6f:dcff with SMTP id d11-20020adff84b000000b003078b6fdcffmr2923274wrq.37.1683471957047;
        Sun, 07 May 2023 08:05:57 -0700 (PDT)
Received: from localhost.localdomain ([176.221.215.212])
        by smtp.gmail.com with ESMTPSA id e15-20020a5d594f000000b0030771c6e443sm8437998wri.42.2023.05.07.08.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 08:05:56 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Icenowy Zheng <icenowy@aosc.io>,
	Maksim Kiselev <bigunclemax@gmail.com>,
	Mark Brown <broonie@kernel.org>,
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
	Maxime Ripard <mripard@kernel.org>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v4 4/5] spi: sun6i: add support for R329/D1/R528/T113s SPI controllers
Date: Sun,  7 May 2023 18:03:36 +0300
Message-Id: <20230507150345.1971083-5-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507150345.1971083-1-bigunclemax@gmail.com>
References: <20230507150345.1971083-1-bigunclemax@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These SoCs has two SPI controllers. One of it is quite similar to previous
ones, but with internal clock divider removed; the other added MIPI DBI
Type-C offload based on the first one.

Add basical support for these controllers. As we're not going to
support the DBI functionality now, just implement the two kinds of
controllers as the same.

Co-developed-by: Icenowy Zheng <icenowy@aosc.io>
Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/spi/spi-sun6i.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/spi/spi-sun6i.c b/drivers/spi/spi-sun6i.c
index e4efab310469..02a3a4f2b3a0 100644
--- a/drivers/spi/spi-sun6i.c
+++ b/drivers/spi/spi-sun6i.c
@@ -738,9 +738,17 @@ static const struct sun6i_spi_cfg sun8i_h3_spi_cfg = {
 	.has_clk_ctl	= true,
 };
 
+static const struct sun6i_spi_cfg sun50i_r329_spi_cfg = {
+	.fifo_depth	= SUN8I_FIFO_DEPTH,
+};
+
 static const struct of_device_id sun6i_spi_match[] = {
 	{ .compatible = "allwinner,sun6i-a31-spi", .data = &sun6i_a31_spi_cfg },
 	{ .compatible = "allwinner,sun8i-h3-spi",  .data = &sun8i_h3_spi_cfg },
+	{
+		.compatible = "allwinner,sun50i-r329-spi",
+		.data = &sun50i_r329_spi_cfg
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, sun6i_spi_match);
-- 
2.39.2

