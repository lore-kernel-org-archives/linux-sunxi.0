Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0C6C2EB
	for <linux-sunxi@lists.linux.dev>; Sat,  6 May 2023 23:27:39 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3078fa679a7so172823f8f.3
        for <linux-sunxi@lists.linux.dev>; Sat, 06 May 2023 16:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683415658; x=1686007658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RfUmN9P7DlgthaW0XDXu/SCHNJ/yWqL0BMYXFISq3mY=;
        b=pZIHZyoskmE3DAtChZfA5R1Y8Dpl8An8woCavYLm9RxLniuygU0hO22S3l3aRaz5B7
         5Q6VSxz0O9RnpN+mKW1luqVy7fBspjnxn8DXO0mbS3QBW6DzO4BZruQ//7+mTmgJTSQp
         fFOyL9fDB7TMHWiliL6CF0CJUawqzuJ5GcNOWVaDi0JeEbLdJcRQV6/69CLY4IIR8ggw
         MMAch9kmYaDVji7P6erO4ebdn4Ms7MaiDyq1bDpX0YfCFrMnMh/4dFDPHFuz/xkExwVS
         6NkYhKQZ/7GOkx/sO4+1ZqjwUFna+iIjSTV4NFNKkNvf5pkgzAyEkHm76UiEcc6vyPP6
         WOiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683415658; x=1686007658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RfUmN9P7DlgthaW0XDXu/SCHNJ/yWqL0BMYXFISq3mY=;
        b=EdLMc84qZPcToAbNZdOFnahw6Vfupr8eipo6IO5hvQUInogHNpWs2p4cow92XkCGVt
         9kgoxjkDtmJ1ZePEeWrGb6toXqswfTDI/RWafrNCMjqEqqQkxLob0ys3xV/yLpTP8TyG
         euyI3k1/KrfGK7utlTb8NAU3EA36OXyno3jjorV6ppN5AOskKniuRyR/KbpukBnmnD3t
         K3qIrUBnziGvcDg33qrUGhphI4BOfCOOKu8Ne+4v/ROTf97m4y8qiZ6bexZ5vPTAWDRL
         Edv04xfhZwLi9rI8WZbbnUIIZgvDEupJC8dChoj0SVHBrJ4b7HpQt2N1mh7HU2eNYzXX
         OnJA==
X-Gm-Message-State: AC+VfDznG7eOfsf/paxI8Qyf8pX9NbBqfwdq14IIvQ4ljf7hZryF6sHJ
	rU6owgdJbh99ahQYREq0R8s=
X-Google-Smtp-Source: ACHHUZ74RtTob+l2N406yInvbgRhhnjxXQw38H3pS8jI+Z4uv6EUhlXDQlad7bvlWaQMVqe72/wksw==
X-Received: by 2002:a05:6000:11cd:b0:306:2638:6fea with SMTP id i13-20020a05600011cd00b0030626386feamr4588568wrx.54.1683415657935;
        Sat, 06 May 2023 16:27:37 -0700 (PDT)
Received: from localhost.localdomain ([176.221.215.212])
        by smtp.gmail.com with ESMTPSA id p4-20020a1c7404000000b003f1739a0116sm12098655wmc.33.2023.05.06.16.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 May 2023 16:27:37 -0700 (PDT)
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
Subject: [PATCH v3 4/5] spi: sun6i: add support for R329/D1/R528/T113s SPI controllers
Date: Sun,  7 May 2023 02:26:07 +0300
Message-Id: <20230506232616.1792109-5-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230506232616.1792109-1-bigunclemax@gmail.com>
References: <20230506232616.1792109-1-bigunclemax@gmail.com>
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
---
 drivers/spi/spi-sun6i.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/spi/spi-sun6i.c b/drivers/spi/spi-sun6i.c
index 1e9e9a8159d9..292fd6101283 100644
--- a/drivers/spi/spi-sun6i.c
+++ b/drivers/spi/spi-sun6i.c
@@ -739,9 +739,17 @@ static const struct sun6i_spi_cfg sun8i_h3_spi_cfg = {
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

