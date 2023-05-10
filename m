Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA4D258D
	for <linux-sunxi@lists.linux.dev>; Wed, 10 May 2023 08:11:45 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3f475366514so3410705e9.2
        for <linux-sunxi@lists.linux.dev>; Wed, 10 May 2023 01:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683706304; x=1686298304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Qz4LzR1x4XZFp0u1LWMlSQ1HYwXXgzIFPiahRVFlGE=;
        b=jcAW8pADW5wrQPFMxuV7lCESCNGQ7Mktzd+xzZ8iPUVsCAnQ6YuF7TwVsiY+XRUoMN
         g8FyEXCzZQT5k4K5nVUZfC697YtZ+zh9t6TNwm79/9TceGFIz4m904zkzKVoFoJRhvPB
         618soVvnIxK+YS78XxBtjJG9TqoM2Nw7kSCYpbYb/zBzQ57IjcDuIeWpeoVm1AmjzD/U
         xZPSQUov2WFyN0n26jvgxhYI8PsSN1FZwPSBu1HhODBdiNBpQzGIk1gKU+2F7rtuOZaf
         P555z9qkvEqF0PDkB5MnMluAyEsgHVzlgBr/3uNlfTdQN4X6W20ybGCLZInpCjWonoQa
         XT5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683706304; x=1686298304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Qz4LzR1x4XZFp0u1LWMlSQ1HYwXXgzIFPiahRVFlGE=;
        b=h55f71jZsZV9fSuIt55TInE+n0g+PGhXO2cKZ2bvVoxslbBWZg9rIchDHpuUQwkNb3
         gxSvYZsNWXwIaAHyzpCdgErRe7zkmQc0b5X0paR1OUlFcpoaEuOzn7Pyf7aYpmwmjwU/
         xQOW7spQtaYHExUfNM/szFvJx3lmj1NAva8CSbb4p/H/stQONnq3pCM3l3ou2KglL9d3
         hJ57E2h78psrH9OwiBOcwJoR5i6/7AMUIIHYgaBmw5SqCw6zSLr+REHkak27rbkes0jq
         PpLp9rvavxnSQrIrNEX+42E95pdZ+rGxVu8mQ1aVATKnFvYhymSJ8eftSlKPYieKw15w
         IPIQ==
X-Gm-Message-State: AC+VfDwbspXazDkFv+dp/p1OFrdvEx/I+uwQWpIPztxJw+r5Z8t+b6/x
	Aj1a2fcaxshEdlxo/rgDEZE=
X-Google-Smtp-Source: ACHHUZ7PLnbhBi7vF8l7BFUZ2Ef1MzGS52Yc/K80mJCYCiMT6ANzAX7IY5wv1U8XJB5LXjpxzcKLiQ==
X-Received: by 2002:a05:600c:2317:b0:3f1:76d4:d43f with SMTP id 23-20020a05600c231700b003f176d4d43fmr11272984wmo.8.1683706303974;
        Wed, 10 May 2023 01:11:43 -0700 (PDT)
Received: from localhost.localdomain ([176.221.215.212])
        by smtp.gmail.com with ESMTPSA id f16-20020a5d4dd0000000b003062ad45243sm16496375wru.14.2023.05.10.01.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 01:11:43 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Icenowy Zheng <icenowy@aosc.io>,
	Maksim Kiselev <bigunclemax@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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
Subject: [PATCH v5 1/5] dt-bindings: spi: sun6i: add DT bindings for Allwinner R329/D1/R528/T113s SPI
Date: Wed, 10 May 2023 11:11:08 +0300
Message-Id: <20230510081121.3463710-2-bigunclemax@gmail.com>
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

Listed above Allwinner SoCs has two SPI controllers. First is the regular
SPI controller and the second one has additional functionality for
MIPI-DBI Type C.

Add compatible strings for these controllers

Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/spi/allwinner,sun6i-a31-spi.yaml          | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
index de36c6a34a0f..fa5260eca531 100644
--- a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
@@ -19,6 +19,7 @@ properties:
 
   compatible:
     oneOf:
+      - const: allwinner,sun50i-r329-spi
       - const: allwinner,sun6i-a31-spi
       - const: allwinner,sun8i-h3-spi
       - items:
@@ -28,6 +29,15 @@ properties:
               - allwinner,sun50i-h616-spi
               - allwinner,suniv-f1c100s-spi
           - const: allwinner,sun8i-h3-spi
+      - items:
+          - enum:
+              - allwinner,sun20i-d1-spi
+              - allwinner,sun50i-r329-spi-dbi
+          - const: allwinner,sun50i-r329-spi
+      - items:
+          - const: allwinner,sun20i-d1-spi-dbi
+          - const: allwinner,sun50i-r329-spi-dbi
+          - const: allwinner,sun50i-r329-spi
 
   reg:
     maxItems: 1
-- 
2.39.2

