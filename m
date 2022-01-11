Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7ACC2CA3
	for <linux-sunxi@lists.linux.dev>; Tue, 11 Jan 2022 16:06:14 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id x6so58022918lfa.5
        for <linux-sunxi@lists.linux.dev>; Tue, 11 Jan 2022 08:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wirenboard-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bYtvX5HQuAitP08saJOKuYpfCeQXY0Sh6iR2sKKOOhE=;
        b=V4oNrihpl0g5rusObHEQEingCrDHv8fatmD3Y2N3UezjRfOG+xsixWcPyd4ogqlcQv
         +kBeeusRXKF9jK7XBJaXRKt4flnFEnR5iuFn8X6hyxsAqtD+IXZiTGNJ5F8XmtP8ChDU
         sTHtq7Kj6BLr+sZ4ppr2YXuaokIntn9n1frZjk8rVZK/ok/mSknoOz6hh83PJcewecVK
         ZFhFaLGnORQmGzxBEzxZsqzb4o6MA2VgMTJNM4FJyB1wrd4rBSdusHFOue/Ncom1YPtw
         G6SCL1f3+Nl7gzmnTCbSraOtN1rs4++/LyUjw5q1pGxFGI55dxRn5YNzQRwn1+43vUog
         eghA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bYtvX5HQuAitP08saJOKuYpfCeQXY0Sh6iR2sKKOOhE=;
        b=DLXQhjVagtvj2JazlHjCyoz56OZjfFrI3f2tyjUS9Diusdhlq5GBgZlTdAa1qoRzL7
         0I9A6ncgVTg/xZ/b2sBpeHB9ZJcbkrK/UX0ImTx+hLuwn3576nfosOT6PkFYyvttBmHP
         O2oRzqkKmp1VIo/caRPmKCp4xjVZXXp+lmlZzl9wNgp/yV6dxodvvMtWL5zGqDoJSGGi
         lXG/UG9nUcj1YrQ4X1UGLyIXrULe4drPww6pbLWPudH0ITffNaa3eRtMKB3W+lulFZ9C
         4mIOH89K17mDDcbpoU7GJDrhxel8kUIs3jzPaDqk1ephjo4AKBhZrK18mfGb+ySxh3LZ
         fRhw==
X-Gm-Message-State: AOAM5310Rcig2GmgNm36zNe+4xQVvvvOAvQMtHowZxodoi5rKCzJmPOw
	gfSF1FH/HQhRmOI87Fm5ZtcoUQ==
X-Google-Smtp-Source: ABdhPJzAwnKImXksiAJ5zwd4qBZpNZQNCRyuGjzKiGyUZnZRo1yV5WOyyr85RAkC++U3vMrTVSJi6Q==
X-Received: by 2002:ac2:4d36:: with SMTP id h22mr3740700lfk.560.1641917172789;
        Tue, 11 Jan 2022 08:06:12 -0800 (PST)
Received: from boger-laptop.lan (81.5.110.253.dhcp.mipt-telecom.ru. [81.5.110.253])
        by smtp.gmail.com with ESMTPSA id k39sm564803lfv.150.2022.01.11.08.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 08:06:12 -0800 (PST)
From: Evgeny Boger <boger@wirenboard.com>
To: Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	linux-arm-kernel@lists.infradead.org
Cc: Evgeny Boger <boger@wirenboard.com>,
	devicetree@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v4 3/3] ARM: dts: sun8i: r40: add second ethernet support
Date: Tue, 11 Jan 2022 19:06:00 +0300
Message-Id: <20220111160600.58384-4-boger@wirenboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220111160600.58384-1-boger@wirenboard.com>
References: <20220111160600.58384-1-boger@wirenboard.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

R40 (aka V40, A40i, T3) has two different Ethernet IPs
called EMAC and GMAC. EMAC only support 10/100 Mbit in MII mode,
while GMAC support both 10/100 (MII) and 10/100/1000 (RGMII).

In contrast to A10/A20 where GMAC and EMAC share the same pins
making EMAC somewhat pointless, on R40 EMAC can be routed to port H.
Both EMAC (on port H) and GMAC (on port A) can be then enabled at
the same time, allowing for two ethernet ports.

Signed-off-by: Evgeny Boger <boger@wirenboard.com>
---
 arch/arm/boot/dts/sun8i-r40.dtsi | 49 ++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-r40.dtsi b/arch/arm/boot/dts/sun8i-r40.dtsi
index 1d87fc0c24ee..870d63fae1fc 100644
--- a/arch/arm/boot/dts/sun8i-r40.dtsi
+++ b/arch/arm/boot/dts/sun8i-r40.dtsi
@@ -217,6 +217,19 @@ syscon: system-control@1c00000 {
 			#size-cells = <1>;
 			ranges;
 
+			sram_a: sram@0 {
+				compatible = "mmio-sram";
+				reg = <0x00000000 0xc000>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0 0x00000000 0xc000>;
+
+				emac_sram: sram-section@8000 {
+					compatible = "allwinner,sun4i-a10-sram-a3-a4";
+					reg = <0x8000 0x4000>;
+				};
+			};
+
 			sram_c: sram@1d00000 {
 				compatible = "mmio-sram";
 				reg = <0x01d00000 0xd0000>;
@@ -543,6 +556,24 @@ gmac_rgmii_pins: gmac-rgmii-pins {
 				drive-strength = <40>;
 			};
 
+			emac_pa_pins: emac-pa-pins {
+				pins = "PA0", "PA1", "PA2",
+				       "PA3", "PA4", "PA5", "PA6",
+				       "PA7", "PA8", "PA9", "PA10",
+				       "PA11", "PA12", "PA13", "PA14",
+				       "PA15", "PA16";
+				function = "emac";
+			};
+
+			emac_ph_pins: emac-ph-pins {
+				pins = "PH8", "PH9", "PH10", "PH11",
+				       "PH14", "PH15", "PH16", "PH17",
+				       "PH18","PH19", "PH20", "PH21",
+				       "PH22", "PH23", "PH24", "PH25",
+				       "PH26", "PH27";
+				function = "emac";
+			};
+
 			i2c0_pins: i2c0-pins {
 				pins = "PB0", "PB1";
 				function = "i2c0";
@@ -980,6 +1011,24 @@ gmac_mdio: mdio {
 			};
 		};
 
+		emac: ethernet@1c0b000 {
+			compatible = "allwinner,sun8i-r40-emac";
+			reg = <0x01c0b000 0x1000>;
+			interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_EMAC>;
+			resets = <&ccu RST_BUS_EMAC>;
+			allwinner,sram = <&emac_sram 1>;
+			status = "disabled";
+		};
+
+		emac_mdio: mdio@1c0b080 {
+			compatible = "allwinner,sun4i-a10-mdio";
+			reg = <0x01c0b080 0x14>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
 		mbus: dram-controller@1c62000 {
 			compatible = "allwinner,sun8i-r40-mbus";
 			reg = <0x01c62000 0x1000>;
-- 
2.25.1

