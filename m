Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAEB4C65
	for <linux-sunxi@lists.linux.dev>; Sun, 17 Mar 2024 01:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710639371; cv=none; b=iOM9cZhVAxZmuGEtJ7RqKNCCOKQFOE2CboQjiTMhPH4Pgopsxv2tWvsA8nnSwDVYIztrCJkkxiCmA6b4g9s40mIT+hSPs2YMI+QsMsYRM0LUGphTg5wMmVC7nn143y5kd7yWc9ot7zuE7YVWN4akr/bHnuRnw2Z7o/B1AaZOZQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710639371; c=relaxed/simple;
	bh=rVxcods5ZDyrWaNLRIPVF8mu6TfbQA0SDuybPSHzyCU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ik91AX9oyDOwWDzCadla7pvvP7uoQsx5L8DMwk9rP2rFODbTCI2HLHc/c+KjYFNsv10wFKhKg+QviaPAeTANfJebhVjdn71IT7ruf3gYU2UrDj9iL4a0D6vUbos1mV0Bo8YGvxxbzB164zf4ouvpVlmqIf8jK53Hvb4PJd6QTj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GfG1OLKo; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GfG1OLKo"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-51381021af1so4688031e87.0
        for <linux-sunxi@lists.linux.dev>; Sat, 16 Mar 2024 18:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710639368; x=1711244168; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/XzytzZXUjo7YH6VehAfoVb/MA7UtVN4BCKXxPtpIPA=;
        b=GfG1OLKowxiXoUDp+Wfu+l8OwA4dyh1IlPvk7vQM9jmyfa4snkOUBxrmkNsamlOyTD
         867UJRc4qdZZdrdM+hqUSGQz1nS8AnjiFNU1Qmzy4cqNOJ/WqUkOo/v9iysbpMCo7Als
         pCJ/EV2xiyQrapqFg0VAPeHDgNjCjtt4AxQFp5hZnvKMGbFg/ILAUDVhw0cHiq13JRs5
         H6OQOAWEk4L8Cnu9ihcpD3BDkgXBgiPLCYoq1sttzHzR744rA5vzLA5yk+sAx56NPpyM
         hes7XfUSrbsMctXBt8fp04f6UvJNmJiKmYsaCkPe0mmjD87wY/32e3XXeAO+t0U7R3at
         u1cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710639368; x=1711244168;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/XzytzZXUjo7YH6VehAfoVb/MA7UtVN4BCKXxPtpIPA=;
        b=jAtrr8vGQIteU1fmcebSRVTzaEL0TWJtz5JmkBuW+CYKeMGOG1kqcDBi083VhZ/Sdm
         IGOXB1XczYYuTBbkF8uEJd8Mvbl5zf7RuZrCibIC/fkyVvrgLuS0PGaPFcbpJz+cUmwH
         mS77quFidGjDRHORHTpt6Z9zV6qEzFLCty6SahndnxMH/dIKlDMvv7FQ+GPJSo0bi4y8
         BSSufoa0/zuRmplElpGHqVRORVe2BRNdn8W45Kqhbel16yybRcL/XD5RR+8sQ+PM7Y33
         YcaHeZcGWVnUd9zWqe6lQpNfQpxdCqpO3QNPV2zzaVpYWnYoLlT6cON7LLp0f+4+FF8G
         K5HQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbKdYprwAsGfwUsYmfPHoIEFF5hUNFVmXIXZsEKZGT0L69dgyXQjZvv6FRd1uDmpYs3g0sLia6YwUy3NTjKx7B8YK9ITaE7hQg9oA=
X-Gm-Message-State: AOJu0Yw6vutWNi4aMzbZ5inSwM2yHF0B8ZtBsQBh2PKeiCfT+OEMpt0f
	aiDhYconZAGtqqy5m7gu4qE63gOISuFEqWHCBPF3PMkDCBpeTF7PME+vvCsJUp3X/A==
X-Google-Smtp-Source: AGHT+IFyrKxW6qlFPCt+/ADVwRcABp8+lfhmA0g2SVUrbYaOKGC8b2vb2cWTu/b82B2sQpnwYdjEvQ==
X-Received: by 2002:ac2:5330:0:b0:513:c488:5b5d with SMTP id f16-20020ac25330000000b00513c4885b5dmr2319287lfh.44.1710639367787;
        Sat, 16 Mar 2024 18:36:07 -0700 (PDT)
Received: from ALDERLEJK. (89-76-44-138.dynamic.chello.pl. [89.76.44.138])
        by smtp.gmail.com with ESMTPSA id p7-20020a17090635c700b00a465b6c9a67sm3273109ejb.6.2024.03.16.18.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Mar 2024 18:36:07 -0700 (PDT)
From: Kamil Kasperski <ressetkk@gmail.com>
Date: Sun, 17 Mar 2024 02:34:01 +0100
Subject: [PATCH v2 3/3] arm64: dts: allwinner: h616: add support for T95 tv
 boxes
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240317-add-t95-axp313-support-v2-3-e38032811758@gmail.com>
References: <20240317-add-t95-axp313-support-v2-0-e38032811758@gmail.com>
In-Reply-To: <20240317-add-t95-axp313-support-v2-0-e38032811758@gmail.com>
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Kamil Kasperski <ressetkk@gmail.com>
X-Mailer: b4 0.13.0

Add dtsi file for T95 tv boxes and add initial
support for T95 5G AXP313A variant with a board name
H616-T95MAX-AXP313A-v3.0

internal NAND chip is connected to NAND controller
I can't see any nand in sun50i-h616.dtsi, so access to
internal memory is not implemented.

Signed-off-by: Kamil Kasperski <ressetkk@gmail.com>
---
 arch/arm64/boot/dts/allwinner/Makefile             |   1 +
 arch/arm64/boot/dts/allwinner/sun50i-h616-t95.dtsi | 109 +++++++++++++++++++++
 .../dts/allwinner/sun50i-h616-t95max-axp313.dts    |  85 ++++++++++++++++
 3 files changed, 195 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index 21149b346a60..294921f12b73 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -42,6 +42,7 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-tanix-tx6-mini.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-bigtreetech-cb1-manta.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-bigtreetech-pi.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-orangepi-zero2.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-t95max-axp313.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-x96-mate.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-longanpi-3h.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-orangepi-zero2w.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-t95.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616-t95.dtsi
new file mode 100644
index 000000000000..2af17439ba86
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-t95.dtsi
@@ -0,0 +1,109 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2024 Kamil Kasperski <ressetkk@gmail.com>
+ *
+ * Common DT nodes for H616-based T95 TV boxes
+ * There are two versions reported with different PMIC variants.
+ */
+
+#include "sun50i-h616.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	aliases {
+		ethernet1 = &sdio_wifi;
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	reg_vcc5v: vcc5v {
+		/* board wide 5V supply directly from the DC input */
+		compatible = "regulator-fixed";
+		regulator-name = "vcc-5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	reg_vcc3v3: vcc3v3 {
+		/* discrete 3.3V regulator */
+		compatible = "regulator-fixed";
+		regulator-name = "vcc-3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	wifi_pwrseq: wifi_pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		clocks = <&rtc CLK_OSC32K_FANOUT>;
+		clock-names = "ext_clock";
+		pinctrl-0 = <&x32clk_fanout_pin>;
+		pinctrl-names = "default";
+		reset-gpios = <&pio 6 18 GPIO_ACTIVE_LOW>; /* PG18 */
+	};
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&ehci2 {
+	status = "okay";
+};
+
+&ir {
+	status = "okay";
+};
+
+&mmc0 {
+	cd-gpios = <&pio 8 16 GPIO_ACTIVE_LOW>;	/* PI16 */
+	bus-width = <4>;
+	status = "okay";
+};
+
+&mmc1 {
+	mmc-pwrseq = <&wifi_pwrseq>;
+	bus-width = <4>;
+	non-removable;
+	status = "okay";
+
+	sdio_wifi: wifi@1 {
+		reg = <1>;
+	};
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&ohci2 {
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
+};
+
+&usbotg {
+	dr_mode = "host";	/* USB A type receptable */
+	status = "okay";
+};
+
+&usbphy {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-t95max-axp313.dts b/arch/arm64/boot/dts/allwinner/sun50i-h616-t95max-axp313.dts
new file mode 100644
index 000000000000..c8650aca2407
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-t95max-axp313.dts
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2024 Kamil Kasperski <ressetkk@gmail.com>
+ *
+ * Configuration for T95 TV box with board label H616-T95MAX-AXP313A-v3.0
+ */
+
+/dts-v1/;
+
+#include "sun50i-h616-t95.dtsi"
+
+/ {
+	model = "T95 5G (AXP313)";
+	compatible = "t95,t95max-axp313", "allwinner,sun50i-h616";
+};
+
+&mmc0 {
+	vmmc-supply = <&reg_dldo1>;
+};
+
+&mmc1 {
+	vmmc-supply = <&reg_dldo1>;
+	vqmmc-supply = <&reg_aldo1>;
+};
+
+&r_i2c {
+	status = "okay";
+
+	axp313: pmic@36 {
+		compatible = "x-powers,axp313a";
+		reg = <0x36>;
+		#interrupt-cells = <1>;
+		interrupt-controller;
+		interrupt-parent = <&pio>;
+
+		vin1-supply = <&reg_vcc5v>;
+		vin2-supply = <&reg_vcc5v>;
+		vin3-supply = <&reg_vcc5v>;
+
+		regulators {
+			reg_aldo1: aldo1 {
+				regulator-always-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vcc1v8";
+			};
+
+			reg_dldo1: dldo1 {
+				regulator-always-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcc3v3";
+			};
+
+			reg_dcdc1: dcdc1 {
+				regulator-always-on;
+				regulator-min-microvolt = <810000>;
+				regulator-max-microvolt = <990000>;
+				regulator-name = "vdd-gpu-sys";
+			};
+
+			reg_dcdc2: dcdc2 {
+				regulator-always-on;
+				regulator-min-microvolt = <810000>;
+				regulator-max-microvolt = <1100000>;
+				regulator-name = "vdd-cpu";
+			};
+
+			reg_dcdc3: dcdc3 {
+				regulator-always-on;
+				regulator-min-microvolt = <1500000>;
+				regulator-max-microvolt = <1500000>;
+				regulator-name = "vdd-dram";
+			};
+		};
+	};
+};
+
+&pio {
+	vcc-pc-supply = <&reg_aldo1>;
+	vcc-pf-supply = <&reg_dldo1>;
+	vcc-pg-supply = <&reg_dldo1>;
+	vcc-ph-supply = <&reg_dldo1>;
+	vcc-pi-supply = <&reg_dldo1>;
+};

-- 
2.34.1

