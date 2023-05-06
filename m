Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2EC01C26
	for <linux-sunxi@lists.linux.dev>; Sat,  6 May 2023 07:32:54 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-307664010fdso2164156f8f.0
        for <linux-sunxi@lists.linux.dev>; Sat, 06 May 2023 00:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683358373; x=1685950373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YWuJ3928FeRTXQHnTSMxeQkrFwzW1lu8cWO5/HghD9g=;
        b=SxlItSYNZ/2N62zQ8HfucNmvZcoo/BQ4uyVe4rxcCiyML65I125OynPbPBNPH3zYiL
         yPg6jxtKxtCPSdyVoOkztDZ6/RMNvOlkAnO1EREyP9+eXaoqHxfsetThSDFthHdWeddJ
         l+14hEIcR9ZJtg3tZQ+QFVU75bRNgHcNwSUCH5EvYzUbTNodGUQkLh3Ai/bUzhN/WG15
         uL23qvhTXUo+Iq5qNsZG2H/70+M9qBOi6XH3v4A9TsebybJJiezSTnqM2WqLRqCC8opk
         wId8FaN/uvkZ7k8Lq//3xBclUyATUr0Mc/VPhlvR/1YcMw6ryBp8342rOZQ8VTdymWGv
         22dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683358373; x=1685950373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YWuJ3928FeRTXQHnTSMxeQkrFwzW1lu8cWO5/HghD9g=;
        b=KRo9UvVsz6T7TyH5TiAwxK94wtfumYkAs2CMglyBDub1H69ZUNyQwfYgncd5jadGr/
         goAwGZHl+iD4c6wT+rakc1V/jz0xwdZTH3cTKxZcpaxEMfDM0ONVA9RDBsukira9W15O
         OdVUx1M1GQ3sy3bBi4uj1yzEsWj/wO1HTKM1nLR5I9uyqhuC4EnlMZtmo1stW7A0//hl
         t7f1FsNjTtybAQ9f+eCeCtxtNOrR7FPAYoE0mBy5Qk8qboLVjxO6DKJIiTF+uE7Ge5e7
         5IiVesDhD9yZob7sicysNVFhEmI/0S3cAZqYQLwEvL1qnokBReMNCr/UE6E8Z6+/BceX
         LjOA==
X-Gm-Message-State: AC+VfDxq/RFvXh8MtBPIvmISL3krVIJKTqRJVH4wbXpjYXqHyB0MY+53
	MXWYq9h4rUH85B18V5UlnGc=
X-Google-Smtp-Source: ACHHUZ4CkzM5IntmGzc8H9/kN5AIgGpbIpiHnLmq347VIXPzfjwWlxjDpZCmmsWECMktlC6y4X8xEw==
X-Received: by 2002:adf:f552:0:b0:306:772:5c2e with SMTP id j18-20020adff552000000b0030607725c2emr2669948wrp.70.1683358372892;
        Sat, 06 May 2023 00:32:52 -0700 (PDT)
Received: from localhost.localdomain ([176.221.215.212])
        by smtp.gmail.com with ESMTPSA id q14-20020a7bce8e000000b003f182a10106sm10071944wmj.8.2023.05.06.00.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 May 2023 00:32:52 -0700 (PDT)
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
Subject: [PATCH v2 6/6] riscv: dts: allwinner: d1: Add SPI0 controller node
Date: Sat,  6 May 2023 10:30:14 +0300
Message-Id: <20230506073018.1411583-7-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230506073018.1411583-1-bigunclemax@gmail.com>
References: <20230506073018.1411583-1-bigunclemax@gmail.com>
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

So let's add its DT node.

Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
---
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index 922e8e0e2c09..a52999240a8e 100644
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
@@ -447,6 +453,21 @@ mmc2: mmc@4022000 {
 			#size-cells = <0>;
 		};
 
+		spi0: spi@4025000 {
+			compatible = "allwinner,sun20i-d1-spi",
+				     "allwinner,sun50i-r329-spi";
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

