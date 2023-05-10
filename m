Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F7D12B63
	for <linux-sunxi@lists.linux.dev>; Wed, 10 May 2023 08:12:13 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-306f2b42a86so4393288f8f.3
        for <linux-sunxi@lists.linux.dev>; Wed, 10 May 2023 01:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683706331; x=1686298331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J7busPrq4Ix2D0XVL7/yDg+1KY42O5SIQ2uX5rrJTys=;
        b=cwfH/+hXjPVqsFqPAIMVFAMy/0AZnkWQv5AVzAZ4kFPGmzVfJfihnaFyDcE+SELLRt
         NOopU7B/B1n31QF6G211fNpBJQqAoY5hWVtj/0ecksqZLNLoo5SL55M1qGVXmbeW8VsN
         hdjpovHFnThVqzLFoeJi1QMDuIbJyKzt2y7ElcQnJgfUg8BRGDS1cxZY6c9WddnZrsyF
         hum5LUNIP6ExTkPdbNmdAP7TwUclhdPKtIdTBx5Sg+M2FKi/ypgCWDqrZsDaXwM5DmMt
         +U1pLrLSyv5+xgD0ftvRhqro6o9fehPhh9SAnZJH8PJfPoaytTlB1baXd7y+uEUIbcc0
         c8Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683706331; x=1686298331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J7busPrq4Ix2D0XVL7/yDg+1KY42O5SIQ2uX5rrJTys=;
        b=TZLtmvMzfYd/ImhT9qPidYPXExYaX8slSC6E+lcITx9mvL6SRBUsL90i2qMcUwQRqH
         U6lVFVpfYAvINTs7SOU6ywfhVkMd9ChwGCGXgqfiG3dVB1LdiMvZMKqbdt1GixQzYtJ8
         hgldOO6mD5cSzZYbGr9lZctzEqQeK9oY5dix94+cV6ZxjwLSz4Lhs14amFmC+XV+Vtos
         voYJmjPD40ASLFufnOuy3/5YENfKhlvgjfBIodLDX6OIMgF8Ijc/BsdVP0M/l3qMQpyQ
         77VJDij3DBZUjJ+lytviIxERR9AZ5lt46Iezn1eL+3aeCVt/72ZGeCE2GMwdAau9Hgw2
         bHNQ==
X-Gm-Message-State: AC+VfDwNeZ1QKtYOdjPEwMLO/wPahb5hxPYF5klR2bV+svSVBLOZakC3
	RKnKDjmOxzUE3jV5P7oeJIs=
X-Google-Smtp-Source: ACHHUZ4/QkzVl0TJSqhBhDoUCH2XfVGSUjiyUzXaRk2eB1bjvRBst+fKX1rWZ4a5w4/LIhNzGfSHSg==
X-Received: by 2002:adf:f2c3:0:b0:306:2b81:88e1 with SMTP id d3-20020adff2c3000000b003062b8188e1mr12417493wrp.0.1683706331190;
        Wed, 10 May 2023 01:12:11 -0700 (PDT)
Received: from localhost.localdomain ([176.221.215.212])
        by smtp.gmail.com with ESMTPSA id f16-20020a5d4dd0000000b003062ad45243sm16496375wru.14.2023.05.10.01.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 01:12:10 -0700 (PDT)
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
Subject: [PATCH v5 4/5] spi: sun6i: add support for R329/D1/R528/T113s SPI controllers
Date: Wed, 10 May 2023 11:11:11 +0300
Message-Id: <20230510081121.3463710-5-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230510081121.3463710-1-bigunclemax@gmail.com>
References: <20230510081121.3463710-1-bigunclemax@gmail.com>
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

