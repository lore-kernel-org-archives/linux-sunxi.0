Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABC72C80
	for <linux-sunxi@lists.linux.dev>; Thu, 13 Jan 2022 05:37:50 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id m3so1726240lfu.0
        for <linux-sunxi@lists.linux.dev>; Wed, 12 Jan 2022 21:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wirenboard-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vIhVOFoEFO3ge9QX7EEmaWp+M7MlXRkxdj6Ox9QmAu4=;
        b=bs5njQm/d7lRUNLXwg+jL7bjAJsuyx82JmChSb3YKsmIG7tQc0srQdbl6ga+Q2LPnO
         ld9HhOOwtBQ3kzmSNeelAFtRv1OfaGnd4BOcEPuJl9Sw4S4n7Ciq68EuiWmVmu+ZXw/7
         TsLjZi+jKF9kEfSnE0x75x8D9eeUHu56OYA+4LD1htPw7gM63Y4xGPb85i+dZavV8b8O
         iYbuBoYoUhnkqpKvWLaxW70JbjcmnpN82ODPDkI66FP9o20fl/KZ7ApKOBiPLNAFBlZD
         pO5EyJONm9l5L8FYQW70bj1QhdCSrh7aYkvmDcUDED51BOjKtPfzIE4y0B+/sZxrrlwC
         EIBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vIhVOFoEFO3ge9QX7EEmaWp+M7MlXRkxdj6Ox9QmAu4=;
        b=2fED8RTfwhnLzu2xJz2+AuRTTgCC/c9yP1DN3JYmtX5O4c/gCHJEZOVWmWaKi9EJlZ
         uA4X/tMXEZ2C5+79RcHmhGYOHNsXFp0F3YdyrCpm4++vWMOg6MdMI4RDhFmZZ95tOsE3
         fVPqZ8uRzVT+Nrb85ysU+rAVDHJyDdeV/xDvh6gJhk0ad0mXXxEQG/I76WQBZtsG2RXy
         bP8qNkA6wdfI7MMnieYqDAnrTkvcx6DDUyANC2c9Kw+981Yk1px2ZO67fqbXrfOK9aEF
         aAqu+ScqL8kGTq+RxClzhCaZwMYfnl2M1p0zBS4HTT7NjIDdQaONjYr3wiWND7kLkDgh
         6JMA==
X-Gm-Message-State: AOAM533sWrcWqqYoyzmOV15BhDTK4553sRgLSKc5C6gQN/XaYSe2FQuU
	Kz8gFKUediZbXXKS3wU+50UM1Q==
X-Google-Smtp-Source: ABdhPJyVV0NrO6DO+IvlzUdJgBUhS30P0tshAoYYNF1cPgGBE0bBQQt+qKLDR4dI3UMvJgGkR3jo9Q==
X-Received: by 2002:a2e:a88a:: with SMTP id m10mr1989969ljq.506.1642052268785;
        Wed, 12 Jan 2022 21:37:48 -0800 (PST)
Received: from boger-laptop.lan (81.5.110.253.dhcp.mipt-telecom.ru. [81.5.110.253])
        by smtp.gmail.com with ESMTPSA id x21sm180212lfa.296.2022.01.12.21.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jan 2022 21:37:48 -0800 (PST)
From: Evgeny Boger <boger@wirenboard.com>
To: Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	linux-arm-kernel@lists.infradead.org
Cc: Evgeny Boger <boger@wirenboard.com>,
	devicetree@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v5 3/3] ARM: dts: sun8i: r40: add second ethernet support
Date: Thu, 13 Jan 2022 08:37:34 +0300
Message-Id: <20220113053734.105813-4-boger@wirenboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220113053734.105813-1-boger@wirenboard.com>
References: <20220113053734.105813-1-boger@wirenboard.com>
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
index 03d3e5f45a09..8770b105f86e 100644
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
@@ -553,6 +566,24 @@ gmac_rgmii_pins: gmac-rgmii-pins {
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
@@ -999,6 +1030,24 @@ gmac_mdio: mdio {
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

