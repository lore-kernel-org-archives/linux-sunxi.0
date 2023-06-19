Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F83107A4
	for <linux-sunxi@lists.linux.dev>; Mon, 19 Jun 2023 15:44:39 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-4f849605df4so4660585e87.3
        for <linux-sunxi@lists.linux.dev>; Mon, 19 Jun 2023 08:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687189477; x=1689781477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A2xW1pdD4hh2VGs4Mpg9cKE/j/pXz/wg2o6KnZsreRQ=;
        b=SXi9EuYemDFlDxp0BqouWi1+qLw4f2dj8Wiuwrapoqielba8KLGExvIZVg831z4yh3
         n9YHgewmBi/vaHWDfDGSKEpC72HxQIzH8PcrDpN3EpQZvZMqRoHVJ7V8WC0h071yrRd/
         yjJ1KFmUABIwfoo0Cwrw7pSyffKMlHGB0qgS1k8qkXTXKQ+OBnZ0SQ8rnR2diuoSUD5B
         fWhRAyGZkSnFTAsdlUAwXFnx2UYjxddxGfSfNnLGrO2nqRd1bq9WNetJYb+RsWW85ED2
         zjFc46hV/eGrfqKuG/LfBj6tpbAUcdzezYY8RJOCeJSfHi2CKqHwiHBukPmYhJlnsQkq
         VzPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687189477; x=1689781477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A2xW1pdD4hh2VGs4Mpg9cKE/j/pXz/wg2o6KnZsreRQ=;
        b=kBojWv+U4ytfEj5Uwj1sqNo1jmtj8KenKgydt/W6UQHwklUflygnnruDCUk9j96Jnj
         Ku2o3ZqzOSQiyhfyFL33x+h+Ngp35hlrXI8XIDUNZNxeGUeFpJ+wC/dxSDXwXbY2mf/N
         ClKmtYJjlAvtcErQVVeGUesm//AmaRo1XENmfljUn4yf5WwCpuT+ZnBzYpsLaYyXrwSJ
         IPSXrMVy8k8UXBH/4RQ7PWm6pyPClzneuHnCPoXHx4yutXCNyzXca4ocLZ7Uydvyf029
         e5wDsrHvXzxEznvFZwL1EPcdSWkG4sF2zgVdhW70ExlYR0OHtKY2GIWCYf7QPYuBCWDN
         Yr8Q==
X-Gm-Message-State: AC+VfDwYzX08Z73D/lbEktF5kwQh/RAgz15U9x5uuqnpXf/ljqUwAVnD
	j5PuVjiTmhTsmzNJrgz+c8Q=
X-Google-Smtp-Source: ACHHUZ6fyzgyF6IaPo1cFaZ/Jbu3BHrWZiNQ4Ii9axwoUxhdnuwBR6cJW7DJpqJrgj7c7vZ8IZ/jdQ==
X-Received: by 2002:a19:505b:0:b0:4f8:5af4:73ef with SMTP id z27-20020a19505b000000b004f85af473efmr4062285lfj.28.1687189477519;
        Mon, 19 Jun 2023 08:44:37 -0700 (PDT)
Received: from user-PC.. ([178.134.198.138])
        by smtp.gmail.com with ESMTPSA id f11-20020a19ae0b000000b004f85e53250bsm1207144lfc.191.2023.06.19.08.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 08:44:37 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: linux-iio@vger.kernel.org
Cc: Maksim Kiselev <bigunclemax@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ramona Bolboaca <ramona.bolboaca@analog.com>,
	=?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
	ChiYuan Huang <cy_huang@richtek.com>,
	Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
	ChiaEn Wu <chiaen_wu@richtek.com>,
	William Breathitt Gray <william.gray@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	Maxime Ripard <mripard@kernel.org>,
	Quentin Schulz <quentin.schulz@free-electrons.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v8 4/4] riscv: dts: allwinner: d1: Add GPADC node
Date: Mon, 19 Jun 2023 18:42:27 +0300
Message-Id: <20230619154252.3951913-5-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619154252.3951913-1-bigunclemax@gmail.com>
References: <20230619154252.3951913-1-bigunclemax@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds declaration of the general purpose ADC for D1
and T113s SoCs.

Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
---
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index 922e8e0e2c09..cb353d5805cb 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -138,6 +138,16 @@ ccu: clock-controller@2001000 {
 			#reset-cells = <1>;
 		};
 
+		gpadc: adc@2009000 {
+			compatible = "allwinner,sun20i-d1-gpadc";
+			reg = <0x2009000 0x400>;
+			clocks = <&ccu CLK_BUS_GPADC>;
+			resets = <&ccu RST_BUS_GPADC>;
+			interrupts = <SOC_PERIPHERAL_IRQ(57) IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+			#io-channel-cells = <1>;
+		};
+
 		dmic: dmic@2031000 {
 			compatible = "allwinner,sun20i-d1-dmic",
 				     "allwinner,sun50i-h6-dmic";
-- 
2.39.2

