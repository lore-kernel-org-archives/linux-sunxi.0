Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3E0185F
	for <linux-sunxi@lists.linux.dev>; Fri,  5 May 2023 07:47:21 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-3f19323259dso14331625e9.3
        for <linux-sunxi@lists.linux.dev>; Fri, 05 May 2023 00:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683272839; x=1685864839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GNV1oA5bifbHrVzVGDwGABZ92MbgAi9sOiOOiEw4RrY=;
        b=lkg+LH04TwCQLhmLbRKDg/dBJWQ7XdfptJmigPx/HjYBXY0JRepARb5d/8OAgeih30
         3s4tXEUw9Eyzzf6rPHJisFmt66eFJtGTRs0+k7bGdujqpSbJM4E5IQ7BCKaxvynwbRGA
         mJV3MzMugU0NIXgPwW4Ydux0lvBTjIwHjJw13UBxeyldqBJyTDc8XMZydN5t31/e1Ql/
         Gz32EkDcx+AeFOVED0YbBJ8E0NpUnnrwX5MhiJJ1kkFyR7H4D8l+1EL8ZOeYFjy5m2zh
         rJr/4WDj4rDXo6MBKHzKd+T57LDftmdNnEZgDlp6IQW/vY/Ec/nq7wWhUtLHN9iY7Ppq
         7HEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683272839; x=1685864839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GNV1oA5bifbHrVzVGDwGABZ92MbgAi9sOiOOiEw4RrY=;
        b=MR9bZxw43nmLLpPJ2JgnXtts4s5L1ZAbT63JreBtkrUv1pCkVjdrRgR0U45eywxf8E
         UkI7FkHtyPyc3pddpIf1etNKARqayVF20k3cyEz6D3D0CB0mNE+XmPViJWjgwYUEtnmP
         SqVBMoi0o2mY4ivwC6fmEwkWuTjNoDM2yO5q776e4rXSkprwER+gvxfx25Kt5DMMsUSJ
         BJfvFs+4jlhGslErIli0AGjdwpeztyTtpI60nt1nD7chyvoRbRZQaHyPKlGpjuGcNZ4F
         +oixiitMsNVNaksjNHnfrgZ1QKCuVgGfCGAWKpEaRQrlzwQ4xhzInOd9qHynLi7VLH6y
         EA3w==
X-Gm-Message-State: AC+VfDwMgWYMycYW8aoLXpM8FPvMFi/OCp5IuopuQb7bRBlyHSmjz8KR
	oz0i3h2adGqr7mqNZjdnLRRDgVj4+nnZzA==
X-Google-Smtp-Source: ACHHUZ78e8aWw5mYmh7dTuHHV6lAjpYMYlKpnXW26CWTb45fLRd/NUafiy9B/9qFUCG0CUV5EcoWJw==
X-Received: by 2002:a1c:4b0a:0:b0:3ee:96f0:ea31 with SMTP id y10-20020a1c4b0a000000b003ee96f0ea31mr375663wma.18.1683272839493;
        Fri, 05 May 2023 00:47:19 -0700 (PDT)
Received: from localhost.localdomain ([176.221.215.212])
        by smtp.gmail.com with ESMTPSA id j8-20020a5d5648000000b003062cdc6ac5sm1482198wrw.89.2023.05.05.00.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 00:47:19 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: robh+dt@kernel.org
Cc: Maksim Kiselev <bigunclemax@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: dts: allwinner: d1: Add SPI0 controller node
Date: Fri,  5 May 2023 10:46:51 +0300
Message-Id: <20230505074701.1030980-1-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some boards form the MangoPi family (MQ\MQ-Dual\MQ-R) may have
an optional SPI flash that connects to the SPI0 controller.
This controller is already supported by sun8i-h3-spi driver.
So let's add its DT node.

Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
---
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index 922e8e0e2c09..d2de211d67d7 100644
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
@@ -447,6 +453,20 @@ mmc2: mmc@4022000 {
 			#size-cells = <0>;
 		};
 
+		spi0: spi@4025000 {
+			compatible = "allwinner,sun8i-h3-spi";
+			reg = <0x04025000 0x300>;
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
 		usb_otg: usb@4100000 {
 			compatible = "allwinner,sun20i-d1-musb",
 				     "allwinner,sun8i-a33-musb";
-- 
2.39.2

