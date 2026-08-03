Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E9B3A640C
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 05:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785734155; cv=none; b=nK7ToJEHIFkjCptLDqSEXgZiQM3EToCqAQqICBMmPGhw0Dn+IhPSBnIr9jVqiB/FYhBjOLqBCEIQAAk/Opcw1rGo8bvtF03VWvQaGqS/CoFN3S7/iAGSSJ5gSxoSv3LPKPdI4vp/OIvKpHXd/xaq2GgdTRQ9bkK0u4pXGtCLlhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785734155; c=relaxed/simple;
	bh=6ziM+f30xkSte3zlDzpBhj7lMZ8ieILh8cGDDWCvnhA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aog0XYn7MCqdujs6AaIX9BrYNic2jqxv/Tl2jSuFpV2r2vdNmo+ahWqup2F/VbgBe50tHmSZyNAANzVBVneKmbSv9L1cxjg3WAAkZ2mV3aQrSbVAVUIHZOUhwWSQanezEe0ESOBr82cYVQbzUoKzEbjsoILsKNGyla/a9fesL2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VPHjWEgi; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VPHjWEgi"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-497d3e4460aso3200695b6e.1
        for <linux-sunxi@lists.linux.dev>; Sun, 02 Aug 2026 22:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785734151; x=1786338951; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e9FeknYPclzv16XYXDkTzfHxoN/DCYzLCAYv6oC+ejo=;
        b=VPHjWEgiiLRJYJE2xhv3ovGySiPueX8vJt2KNfKMi7iHnvep++xlNRLsTHH1TWFOjK
         b6sgdHxUttTEl7oU/PajYc4YCrVFeoQdOLOBOBDQsZCc5Ir7w17sUbuosHB27jkdimoc
         Upqsl/oanKcHBGUKqsS7NN5F3hvjfR6/LoOxBOCOi7Bw1u60ZBPYRXhdCvOmJytd9D5w
         ixxEkUbEeflkNWDaAR1rTClUuUAtA6qWBllD4mUaVmAbV7i1YcXVlUZT7tl2UmMAWL/6
         kRJU7gdrdbeHTWA3VYq1RrKsRZGSKGAW63OOOAEKjYNheiD7r/2zHblsa/mUB+VM01Zv
         1exA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785734151; x=1786338951;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e9FeknYPclzv16XYXDkTzfHxoN/DCYzLCAYv6oC+ejo=;
        b=LigUU8cuF4+jY3rGK4n/wgz3hmXODDRHDwxpg1qzG4lG76047DhJa7SjeziAVuCbv5
         J/EQaUgJR7+cqNarFVkrWJgtt/f3IedHPL8S2b/boHMSHAijof53Qq0cvJpxfWDZS6pB
         7oL027eKa8Wx8S9n2YSLfut3pk6L7ERKpEIRRdvVKIVeikV+ySJORzGENDrz0pIt98jg
         Jk2WCTnIyqxZGlBE6aoB3d85KUmnoyh9shcH0JwsMFqzomv5xVIKBi7tQT2HI5yTAaaa
         8g8Z2sS10lSJPnZnutgbrtutzrqNAA6yKw1Fx6Vi3OEJTLOnV5v/JfejvxzOz/+9gx1W
         FbAg==
X-Forwarded-Encrypted: i=1; AHgh+RqkORFbi2WG4sHjRQ7+3bt54TFEow222OEejqYqEiwAynqUvdswkj5fuXfgkPFbv23QMob1q3Wv79RZmw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyefaSOp41gR7yRSFBBXDYed3ifZnyqXKJqhj84jP4JcDOYfXhQ
	kHt1WDT+qMGK5gc2XETqbE5+wabBg8vL3WYxNScAqHhf3Q1KJLIyDRuT
X-Gm-Gg: AR+sD13fr7+P7SkBDKfsh76B7JoKMSs640VYJDxMmGs0Aa23gIMuhF61pA4OUE0+oMB
	eZDwA/pTcNfSInUsr7Z3Azc3PaV1A1BjrWmif2DJ8z4IK2nGwVNzse0PQs01/WKXywmhP6hMBhF
	WUQKWTJ1ooAQ51f1RfXP5tbN5h224c5u+1wjMtIG/31lSia+VnEYUF60YAnQlGJ9elNKrFKxiGE
	pFxSk55gREb03vqKPEEXmAf+WaJqyh6vCESGWMWNxVjTnx/qmQX8z6gmdlGxiz5kogT7ZhxqTb2
	wT6hpl7Cahj1hMsh7l7t88lHLIl65bf2D1iS1q4OQwd8Y68H/rXU1Ih4s/ZtglC/1c74IHb+Vds
	KTyLGCX4y42pqXzdEmZO0V51rD5U5AOgUhnH0cznwiRtcwoiS9kOjyWMYTg/yuOm2/SBwyTn2k2
	pDrgalEBpNQc96ydXOc1QtkxD93D/Iksj0h6Ldg/OFgNhQGmUhRLpvsoV2UiYrKOhNyB0DvHYqN
	T7qFwepBTbv5TcAmU6Lsg/6Nd1b3e9CZg7+sz+D1cUmmgIdYIJ7B2xIOqRLJ8beGoZ2iGS7QpwQ
	B7Ios+jUr6i3Ww7BIuTuiUwKQczwXS5dNTcdB4m7TMRGcKl1TatchP27KbUHlsiqWSZyy3rUvNE
	0t54snozpVmzDARzH
X-Received: by 2002:a05:6808:1797:b0:495:f697:92d9 with SMTP id 5614622812f47-4ae3188b02dmr15246163b6e.7.1785734151556;
        Sun, 02 Aug 2026 22:15:51 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18f07a5e3sm6787108a34.15.2026.08.02.22.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 22:15:51 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 02 Aug 2026 23:14:29 -0600
Subject: [PATCH 19/21] arm64: dts: allwinner: h6: add AC200 EPHY resources
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-submit-acx00-of-dynamic-v1-v1-19-0a53cd9e21cc@gmail.com>
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
In-Reply-To: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 mfd@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Add the H6 I2C3 controller and pinmux, the PWM-derived 24 MHz AC200
clock, SID calibration cells, RMII pinmux, and the AC200 MFD and EPHY
control nodes.

Describe the co-packaged AC200 INTB output on PB20. Keep both reusable
AC200 nodes disabled so boards must explicitly enable the parent and its
EPHY control function when the companion is present.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 73 ++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
index 72ce1a75647b..55e6e185a4e5 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
@@ -17,6 +17,16 @@ / {
 	#address-cells = <1>;
 	#size-cells = <1>;
 
+	ac200_pwm_clk: ac200-clock {
+		compatible = "pwm-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pwm1_pin>;
+		pwms = <&pwm 1 42 0>;
+		status = "disabled";
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -314,6 +324,15 @@ ths_calibration: thermal-sensor-calibration@14 {
 			cpu_speed_grade: cpu-speed-grade@1c {
 				reg = <0x1c 0x4>;
 			};
+
+			ephy_calibration: ethernet-phy-calibration@2c,0 {
+				reg = <0x2c 1>;
+				bits = <0 4>;
+			};
+
+			ac200_bandgap: bandgap@30 {
+				reg = <0x30 2>;
+			};
 		};
 
 		timer@3009000 {
@@ -368,6 +387,13 @@ ext_rgmii_pins: rgmii-pins {
 				drive-strength = <40>;
 			};
 
+			ext_rmii_pins: rmii-pins {
+				pins = "PA0", "PA1", "PA2", "PA3", "PA4",
+				       "PA5", "PA6", "PA7", "PA8", "PA9";
+				function = "emac";
+				drive-strength = <40>;
+			};
+
 			hdmi_pins: hdmi-pins {
 				pins = "PH8", "PH9", "PH10";
 				function = "hdmi";
@@ -388,6 +414,12 @@ i2c2_pins: i2c2-pins {
 				function = "i2c2";
 			};
 
+			i2c3_pins: i2c3-pins {
+				pins = "PB17", "PB18";
+				function = "i2c3";
+				bias-pull-up;
+			};
+
 			mmc0_pins: mmc0-pins {
 				pins = "PF0", "PF1", "PF2", "PF3",
 				       "PF4", "PF5";
@@ -414,6 +446,11 @@ mmc2_pins: mmc2-pins {
 				bias-pull-up;
 			};
 
+			pwm1_pin: pwm1-pin {
+				pins = "PB19";
+				function = "pwm1";
+			};
+
 			/omit-if-no-ref/
 			spi0_pins: spi0-pins {
 				pins = "PC0", "PC2", "PC3";
@@ -626,6 +663,42 @@ i2c2: i2c@5002800 {
 			#size-cells = <0>;
 		};
 
+		i2c3: i2c@5002c00 {
+			compatible = "allwinner,sun50i-h6-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x05002c00 0x400>;
+			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_I2C3>;
+			resets = <&ccu RST_BUS_I2C3>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c3_pins>;
+			clock-frequency = <400000>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			ac200: mixed-signal@10 {
+				compatible = "x-powers,ac200";
+				reg = <0x10>;
+				clocks = <&ac200_pwm_clk>;
+				interrupt-parent = <&pio>;
+				interrupts = <1 20 IRQ_TYPE_LEVEL_LOW>;
+				interrupt-controller;
+				#interrupt-cells = <1>;
+				nvmem-cells = <&ac200_bandgap>;
+				nvmem-cell-names = "bandgap";
+				status = "disabled";
+
+				ac200_ephy_ctl: ethernet-phy-control {
+					compatible = "x-powers,ac200-ephy-ctl";
+					nvmem-cells = <&ephy_calibration>;
+					nvmem-cell-names = "calibration";
+					phy-mode = "rmii";
+					status = "disabled";
+				};
+			};
+		};
+
 		spi0: spi@5010000 {
 			compatible = "allwinner,sun50i-h6-spi",
 				     "allwinner,sun8i-h3-spi";

-- 
2.53.0

