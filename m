Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB643D67
	for <linux-sunxi@lists.linux.dev>; Sun,  7 May 2023 15:06:08 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3f41dceb9c9so6523145e9.3
        for <linux-sunxi@lists.linux.dev>; Sun, 07 May 2023 08:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683471967; x=1686063967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ziv+62Y+GAylpM/ibpSxQKGKhNzMiq6MRDwumNWDsYk=;
        b=sRTmU8JbDncgX6NXneNlIuiUj6m6ACDXUTCTvC8rFEGY/QPS4SM8iQwXH/DSfPKc/K
         JQYtiAT+eOKtjCqorW6x+aQpfPEPIDq9FZiSVgNPkymU+XzUMkNki17jRHfHPQjfltWE
         2FrvxzITEUZo/8nOnTmTxLc+Ghh0dXdKALZR7E1GyEXJkQVGQe3F34+mvWpeeTaJ0B4i
         2DFcnEvEvVCBtSNWKA6EX2ZcrwFdlV32CV4Ij7HVvJEqIm5pvWDQ/LluaNxstTTMWYhO
         EgM7gNmxO2KFZBqBlHKhjmyvL2I6mYn/95rj85cljFIjkqIbRYV091+oNPDqRiPMFq2v
         CTrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683471967; x=1686063967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ziv+62Y+GAylpM/ibpSxQKGKhNzMiq6MRDwumNWDsYk=;
        b=PIe2e3dJr1UXasVsJz9Td96j279U4+FW3YgtXSIdJFmAiRpuXkMfNBOzZciDTje3JO
         m+sQRG365U7F0VVGizihH9NpojKeJboxe3cX89B45URAibYzbNieItj3DNwurt623Pv3
         5eIHhR2YYVyzsyDMF5AsXRVtH6auVYVTDGASVNJYqeOKmSxVirrCx3cHMceIFDl1dhS2
         gIqaV+Gx8j+J0Y9zZSBxwFWXz72Bc8lmY3jieij7AeYszUnR8t80Z/m84JTNjfKm5PwX
         OSVE8G6fONCg4+eh/SnujiXn5XWyN8D4Cjx6rzVlK+Jn93bcVGiLftbwgMvTpa5qGHNM
         veVQ==
X-Gm-Message-State: AC+VfDzX6i5IVSo0jYMd4AE+l09aRHDoxPmjY2aZX79mKj4sA4yfNMeH
	6/XsMWPehrv73DVrVunUgMo=
X-Google-Smtp-Source: ACHHUZ6j8yqhFjZ0rqUBjPV5gzZfUrJxy8WXKvBq6Dbeit0CPEpd8ylflGfJYynkyLbuiKrRSZ46TA==
X-Received: by 2002:adf:e341:0:b0:307:5097:ab60 with SMTP id n1-20020adfe341000000b003075097ab60mr5133166wrj.63.1683471966755;
        Sun, 07 May 2023 08:06:06 -0700 (PDT)
Received: from localhost.localdomain ([176.221.215.212])
        by smtp.gmail.com with ESMTPSA id e15-20020a5d594f000000b0030771c6e443sm8437998wri.42.2023.05.07.08.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 08:06:06 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Icenowy Zheng <icenowy@aosc.io>,
	Maksim Kiselev <bigunclemax@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
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
Subject: [PATCH v4 5/5] riscv: dts: allwinner: d1: Add SPI controllers node
Date: Sun,  7 May 2023 18:03:37 +0300
Message-Id: <20230507150345.1971083-6-bigunclemax@gmail.com>
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

Some boards form the MangoPi family (MQ\MQ-Dual\MQ-R) may have
an optional SPI flash that connects to the SPI0 controller.

This controller is the same for R329/D1/R528/T113s SoCs and
should be supported by the sun50i-r329-spi driver.

So let's add its DT nodes.

Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
---
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index 922e8e0e2c09..1bb1e5cae602 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -108,6 +108,12 @@ rmii_pe_pins: rmii-pe-pins {
 				function = "emac";
 			};
 
+			/omit-if-no-ref/
+			spi0_pins: spi0-pins {
+				pins = "PC2", "PC3", "PC4", "PC5";
+				function = "spi0";
+			};
+
 			/omit-if-no-ref/
 			uart1_pg6_pins: uart1-pg6-pins {
 				pins = "PG6", "PG7";
@@ -447,6 +453,37 @@ mmc2: mmc@4022000 {
 			#size-cells = <0>;
 		};
 
+		spi0: spi@4025000 {
+			compatible = "allwinner,sun20i-d1-spi",
+				     "allwinner,sun50i-r329-spi";
+			reg = <0x04025000 0x1000>;
+			interrupts = <SOC_PERIPHERAL_IRQ(15) IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_SPI0>, <&ccu CLK_SPI0>;
+			clock-names = "ahb", "mod";
+			dmas = <&dma 22>, <&dma 22>;
+			dma-names = "rx", "tx";
+			resets = <&ccu RST_BUS_SPI0>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		spi1: spi@4026000 {
+			compatible = "allwinner,sun20i-d1-spi-dbi",
+				     "allwinner,sun50i-r329-spi-dbi",
+				     "allwinner,sun50i-r329-spi";
+			reg = <0x04026000 0x1000>;
+			interrupts = <SOC_PERIPHERAL_IRQ(16) IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_SPI1>, <&ccu CLK_SPI1>;
+			clock-names = "ahb", "mod";
+			dmas = <&dma 23>, <&dma 23>;
+			dma-names = "rx", "tx";
+			resets = <&ccu RST_BUS_SPI1>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
 		usb_otg: usb@4100000 {
 			compatible = "allwinner,sun20i-d1-musb",
 				     "allwinner,sun8i-a33-musb";
-- 
2.39.2

