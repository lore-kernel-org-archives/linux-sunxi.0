Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CF5395D8C
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Feb 2026 08:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772095753; cv=none; b=TKCegzKBJN24slxsOZGSCXKI59eUw0nBOf0n0mi+yNCCtMag+yji7sYPHypaqN1Q6y6q0QUgaq4F5HFRSaBWTcN5H3XkxUleGk5MtvluOMTCO04QZAZkEh6oX3Ef3cD8y3/vXBXFqBgHqSFnJ8M4Dn6kg5Wu5B0Am/LS5Zo7Phk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772095753; c=relaxed/simple;
	bh=E08U1x0/zxAfcCl+me+LPWuwMOGAvskckUZfpqX4oIg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ckOTT6cifMO9lh5nnwGtygcRHwfcL3MmCZ5GyVZwL6z3s3+YVcbdfHryKTJDLMsZo5QV8dvPecE9D3lq46xSHca93dFq53ndDjdqJeOwAM4T2n7IN9zRCM8nIHiSXZgshdh5nMbkupS4x54OVTRowUKhERe+irVt7fqMYIOl3tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N0mOrXpT; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N0mOrXpT"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-824ac5d28f9so684469b3a.0
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Feb 2026 00:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772095749; x=1772700549; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oTKetamP2EeNXOUhoU5K8kxvTOyJjzbTJBd4dOGFFHM=;
        b=N0mOrXpTNlmOnjJuB1wjVeXagkXC3oMqtGfW35p/hQbo/vs85F5OW3MYO01u9rVv3O
         +B8NMMIXOd1oSfpYXtLWtKEY+wdVUATJhJ2RCj7RhDktLrGtKnuaNUKrfti/LqsMBg4h
         zQt9nSHMqbgaM9VbpZr+zZDvkqwj1SREd2OJCxoRmrKccO/QYTlaTwWd4IukUbaNQkma
         uG1hQIXCxVbwv/ou8v46NmqbMyUzKKSDpRkXjcFHamepWcNLaCPEIjPDRC8upWZ5Dvhp
         DDL5sbYQkYsm8Uy+33gA1Hga3HMET1eRUBdiIlUZeJ5eV5DvmRbTLya03Z0lYtZdwBZI
         mKvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772095749; x=1772700549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oTKetamP2EeNXOUhoU5K8kxvTOyJjzbTJBd4dOGFFHM=;
        b=GCy4d+JWIRMtqahRwg18YY0iA9L0kSUGZdYEtO+oAmK+Ij4TfZEZacZVl5bRtOULDm
         nVJi2E4ZKFvzW1ZXpfMeeLo/1nK9v0YEYqIHo8kA8+3ZrkS5qUxD0C1fQgx4TTDDptpt
         9NG7AsMjwiWaXdJTLotKZSpJfb534/sUhTUdTVG26pludo59GeQMSsBzR97ylqnJXXmL
         82rWPjnXHiidwzDFKXV+X7hxQaxt6+swXIUYgTT5PQErmPpHSCXx2mQ63ye54nsh/0ec
         jL67by1KzRQFjGfoc/pS1GdArcdTvNe7/tPdv67JdBqxOEBKaRDyhNjKtinaPy4JVxzA
         1nSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUi86MJWofUPnv9Urk6lu8rAisD2p7yIMy+/I8rNo624jlVjeGj7f5nWwxnrMXR9e5qsPXp4M/lRPfBg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzhmhDtvavXca/jXjfX1aMC9kiCX11NbeTzh4WsG0oGDreF/nQg
	+BdS6TSI5ASy9iFJ2L2J6HrAer2h+tEIlZrv+y+Qow1idueKO4CHFkfL
X-Gm-Gg: ATEYQzyQpRBhw8UeMSPaYhn/uyEnKHZ5V9/GKA2Q8q1mnjBukWceYUiaad+pkcXc7ez
	GAutzAQD2Ao/rUMlv/rgqPDS1OGzHP2z1a64oGxOtAMhzX2eJEcYShQksrecngQryyXblyd7r01
	gtcjw1m6MrJUyOLF2cOI/wTpdVI28vlo8uj3pQPuNk81NUJO4YQrVIPZR/92JwIRH0ekDeL/u46
	RFzjYplTPDSj3NPGamuJEmifjaEEGghm7DY/sbAHl8jqIbeUtbUa1p1wj69TPa5+qVcayDZViYN
	RUQIejNaEM9ge+u7wIqO/THD/V2XJiPeFFwdBerT4a6ASRk6i8kQMIYsUp6yMCb6UR3HqrZ+rlp
	/TFGLLFfGyKqvMJlJmQR4bHIv8wPuFV/fCxxVITHwR5+RWais6yckjOkmYyCgBTpqoNtqDQhIMl
	sa0vRIQ/eUYjzNbF8nmLZJ6KXKTjytRP410e0L
X-Received: by 2002:a05:6a20:6a15:b0:394:a026:4c60 with SMTP id adf61e73a8af0-395ad0f204fmr3272592637.32.1772095748941;
        Thu, 26 Feb 2026 00:49:08 -0800 (PST)
Received: from arch.localdomain ([117.147.91.218])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa848471sm1342441a12.30.2026.02.26.00.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 00:49:08 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	mripard@kernel.org,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH 3/3] arm64: dts: allwinner: h6: Add TaiqiCat (TQC) A01 support
Date: Thu, 26 Feb 2026 16:48:47 +0800
Message-ID: <20260226084850.417731-4-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260226084850.417731-1-jerrysteve1101@gmail.com>
References: <20260226084850.417731-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TaiqiCat (TQC) A01 is a set-top box powered by an Allwinner H6 SoC,
equipped with an AXP305 PMIC, 1GB LPDDR3 RAM, 8GB eMMC, an AP6212
WiFi/BT combo module, one 100M Ethernet port, one USB 3.0 Type-A port,
one USB 2.0 Type-A port, one Micro USB port, HDMI, SPDIF, Micro-SD, and
infrared input.

It was released by UQsoft as a blockchain-based terminal and is
now discontinued and no longer supported.

  https://web.archive.org/web/20190409213228/https://tq.ultrapower.com.cn/product.html

Hardware schematics are not available at this time; however, the
dts from the vendor firmware is provided for reference [1].

Based on the PCB silkscreen marking "AZW-KT02 2.0", the ODM/OEM
can be confirmed as AZW, and the overall hardware circuit design
is highly similar to the Beelink GS1.

Tested, works:
- debug UART
- status LED
- USB 3.0 Type-A port
- USB 2.0 Type-A port
- Micro USB port (Host)
- MicroSD
- eMMC
- WiFi/Bluetooth
- HDMI video output

Does not work:
- Ethernet (requires AC200 MFD/EPHY driver)
- HDMI audio

Untested:
- SPDIF
- IR receiver

[1] https://archive.org/download/tqc-a01-stock-fw/tqc-a01-stock-fw.dts

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun50i-h6-taiqicat-a01.dts  | 361 ++++++++++++++++++
 2 files changed, 362 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index 2edfa7bf4ab3..d116864b6c2b 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -38,6 +38,7 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-orangepi-lite2.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-orangepi-one-plus.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-pine-h64.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-pine-h64-model-b.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-taiqicat-a01.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-tanix-tx6.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-tanix-tx6-mini.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h313-tanix-tx1.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts
new file mode 100644
index 000000000000..2a685eba08f2
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts
@@ -0,0 +1,361 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+// Copyright (C) 2026 Jun Yan <jerrysteve1101@gmail.com>
+
+/dts-v1/;
+
+#include "sun50i-h6.dtsi"
+#include "sun50i-h6-cpu-opp.dtsi"
+#include "sun50i-h6-gpu-opp.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model = "TaiqiCat (TQC) A01";
+	compatible = "uqsoft,taiqicat-a01", "allwinner,sun50i-h6";
+
+	aliases {
+		serial0 = &uart0;
+		serial1 = &uart1;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	connector {
+		compatible = "hdmi-connector";
+		ddc-en-gpios = <&pio 7 2 GPIO_ACTIVE_HIGH>; /* PH2 */
+		type = "a";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
+
+	ext_osc32k: ext-osc32k-clk {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <32768>;
+		clock-output-names = "ext_osc32k";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			label = "taiqicat:blue:power";
+			gpios = <&r_pio 0 4 GPIO_ACTIVE_HIGH>; /* PL4 */
+			default-state = "on";
+		};
+	};
+
+	reg_vcc5v: vcc5v {
+		/* board wide 5V supply directly from the DC jack */
+		compatible = "regulator-fixed";
+		regulator-name = "vcc-5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	sound-spdif {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "sun50i-h6-spdif";
+
+		simple-audio-card,cpu {
+			sound-dai = <&spdif>;
+		};
+
+		simple-audio-card,codec {
+			sound-dai = <&spdif_out>;
+		};
+	};
+
+	spdif_out: spdif-out {
+		#sound-dai-cells = <0>;
+		compatible = "linux,spdif-dit";
+	};
+
+	wifi_pwrseq: wifi-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		clocks = <&rtc CLK_OSC32K_FANOUT>;
+		clock-names = "ext_clock";
+		reset-gpios = <&r_pio 0 8 GPIO_ACTIVE_LOW>; /* PL8 */
+		post-power-on-delay-ms = <200>;
+	};
+};
+
+&cpu0 {
+	cpu-supply = <&reg_dcdca>;
+};
+
+&de {
+	status = "okay";
+};
+
+&dwc3 {
+	status = "okay";
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&ehci3 {
+	status = "okay";
+};
+
+&gpu {
+	mali-supply = <&reg_dcdcc>;
+	status = "okay";
+};
+
+&hdmi {
+	hvcc-supply = <&reg_bldo2>;
+	status = "okay";
+};
+
+&hdmi_out {
+	hdmi_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};
+
+&mmc0 {
+	vmmc-supply = <&reg_cldo1>;
+	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
+	bus-width = <4>;
+	disable-wp;
+	status = "okay";
+};
+
+&mmc1 {
+	vmmc-supply = <&reg_cldo3>;
+	vqmmc-supply = <&reg_bldo3>;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	bus-width = <4>;
+	non-removable;
+	keep-power-in-suspend;
+	status = "okay";
+
+	brcm: sdio-wifi@1 {
+		reg = <1>;
+		compatible = "brcm,bcm43430a1-fmac", "brcm,bcm4329-fmac";
+		interrupt-parent = <&r_pio>;
+		interrupts = <1 0 IRQ_TYPE_LEVEL_LOW>; /* PM0 */
+		interrupt-names = "host-wake";
+	};
+};
+
+&mmc2 {
+	vmmc-supply = <&reg_cldo1>;
+	vqmmc-supply = <&reg_bldo2>;
+	cap-mmc-hw-reset;
+	non-removable;
+	mmc-hs200-1_8v;
+	bus-width = <8>;
+	status = "okay";
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&ohci3 {
+	status = "okay";
+};
+
+&pio {
+	vcc-pc-supply = <&reg_bldo2>;
+	vcc-pd-supply = <&reg_cldo1>;
+	vcc-pg-supply = <&reg_bldo3>;
+};
+
+&r_i2c {
+	status = "okay";
+
+	axp805: pmic@36 {
+		compatible = "x-powers,axp805", "x-powers,axp806";
+		reg = <0x36>;
+		interrupt-parent = <&r_intc>;
+		interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-controller;
+		#interrupt-cells = <1>;
+		x-powers,self-working-mode;
+		vina-supply = <&reg_vcc5v>;
+		vinb-supply = <&reg_vcc5v>;
+		vinc-supply = <&reg_vcc5v>;
+		vind-supply = <&reg_vcc5v>;
+		vine-supply = <&reg_vcc5v>;
+		aldoin-supply = <&reg_vcc5v>;
+		bldoin-supply = <&reg_vcc5v>;
+		cldoin-supply = <&reg_vcc5v>;
+
+		regulators {
+			reg_aldo1: aldo1 {
+				regulator-always-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcc-pl-led-ir-pg-pm-ts";
+			};
+
+			reg_aldo2: aldo2 {
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcc-ac200";
+				regulator-enable-ramp-delay = <100000>;
+			};
+
+			aldo3 {
+				/* unused */
+			};
+
+			reg_bldo1: bldo1 {
+				regulator-always-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vcc18-dram-bias-pll";
+			};
+
+			reg_bldo2: bldo2 {
+				regulator-always-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vcc-pc-emmc-efuse-hdmi";
+			};
+
+			reg_bldo3: bldo3 {
+				regulator-always-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vcc-pg-wifiio";
+			};
+
+			bldo4 {
+				/* unused */
+			};
+
+			reg_cldo1: cldo1 {
+				regulator-always-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcc33-io-pd-emmc-sd-usb-uart";
+			};
+
+			/* This regulator is connected with CLDO3 */
+			reg_cldo2: cldo2 {
+				regulator-always-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcc-wifi-1";
+			};
+
+			reg_cldo3: cldo3 {
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcc-wifi-2";
+			};
+
+			reg_dcdca: dcdca {
+				regulator-always-on;
+				regulator-min-microvolt = <810000>;
+				regulator-max-microvolt = <1160000>;
+				regulator-ramp-delay = <2500>;
+				regulator-name = "vdd-cpu";
+			};
+
+			reg_dcdcc: dcdcc {
+				regulator-enable-ramp-delay = <32000>;
+				regulator-min-microvolt = <810000>;
+				regulator-max-microvolt = <1080000>;
+				regulator-ramp-delay = <2500>;
+				regulator-name = "vdd-gpu";
+			};
+
+			reg_dcdcd: dcdcd {
+				regulator-always-on;
+				regulator-min-microvolt = <960000>;
+				regulator-max-microvolt = <960000>;
+				regulator-name = "vdd-sys-hdmi-usb";
+			};
+
+			reg_dcdce: dcdce {
+				regulator-always-on;
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-name = "vcc-dram";
+			};
+
+			sw {
+				/* unused */
+			};
+		};
+	};
+};
+
+&r_ir {
+	status = "okay";
+};
+
+&r_pio {
+	/*
+	 * PL0 and PL1 are used for PMIC I2C
+	 * don't enable the pl-supply else
+	 * it will fail at boot
+	 *
+	 * vcc-pl-supply = <&reg_aldo1>;
+	 */
+	vcc-pm-supply = <&reg_aldo1>;
+};
+
+&rtc {
+	clocks = <&ext_osc32k>;
+};
+
+&spdif {
+	pinctrl-names = "default";
+	pinctrl-0 = <&spdif_tx_pin>;
+	status = "okay";
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_ph_pins>;
+	status = "okay";
+};
+
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart1_pins>, <&uart1_rts_cts_pins>;
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm43430a1-bt";
+		clocks = <&rtc CLK_OSC32K_FANOUT>;
+		clock-names = "lpo";
+		vbat-supply = <&reg_cldo3>;
+		vddio-supply = <&reg_bldo3>;
+		device-wakeup-gpios = <&r_pio 1 2 GPIO_ACTIVE_HIGH>; /* PM2 */
+		host-wakeup-gpios = <&r_pio 1 1 GPIO_ACTIVE_HIGH>; /* PM1 */
+		shutdown-gpios = <&r_pio 1 4 GPIO_ACTIVE_HIGH>; /* PM4 */
+		max-speed = <1500000>;
+	};
+};
+
+&usb2otg {
+	dr_mode = "host";
+	status = "okay";
+};
+
+&usb2phy {
+	usb0_vbus-supply = <&reg_vcc5v>;
+	usb3_vbus-supply = <&reg_vcc5v>;
+	status = "okay";
+};
+
+&usb3phy {
+	status = "okay";
+};
-- 
2.53.0

