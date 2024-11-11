Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E571A262A
	for <linux-sunxi@lists.linux.dev>; Mon, 11 Nov 2024 16:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731342333; cv=none; b=SZSPuIIaFaGtxxr+6zyWTvB9yiH1WBUvwbR7g7g01tPMMdd5LrfAdXw3eWm5vh0GYATMNqqc5bGHuWnComeRp9GgVN1RavcySV0OzBg5DE4QuldZtzOojBYOBU3walQoxuRHJKVXQhcWtkj27/VM9lCOcsACXDD8E42pXO3k+dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731342333; c=relaxed/simple;
	bh=76RzPW8RcT4orB/VklxF++mK4pyLoo50KIMbw8KSEYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t0VHm9LV7riF9Bkx69HwwwffWCLZpW6roprvkoeiTemq0vqB0pjdUBTejSkEMF121GJN8npt+NOgxnDFBaFOvqCrMgsos2omAXFKkrOo5V71Kd2BluTtiwPWFK29pZJurNPtHM3e/YimI1RKopd2PsSUQ+5awfbDSrmWGAejYB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lJBUqgH4; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lJBUqgH4"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-539f1292a9bso5760998e87.2
        for <linux-sunxi@lists.linux.dev>; Mon, 11 Nov 2024 08:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731342330; x=1731947130; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sdaW5kfpiaTfiF12KAXhCU6CQhCro9H+J/CsRfMkYO8=;
        b=lJBUqgH4eMKBUi2qFDExRswVSk66ZWgW5UhAM/1Prc5VE7OayLKmv7BsbHThwOkcDc
         tJxZ2/WNVzRW2M0dQp5AOv6Kv8tgG5CmlRwAzF52LOEg+csmkNyEPUH08EHnHt3S0w/r
         eUEnhL2923iYOg2pNkgs0P+kjHBDO4bP2H4IwTKo+5YK842dF+2prkamBcwf7kQYvbF1
         xAqYsfOod7ovpfmqfjG2ZhqywXk/08sAmPxdHNWjYra1BrRSIH+P34F/xL9G+cvGpP1F
         THwWD4dlkZuam7Q3lj8MXd9BON21KNAd9M9B7WZEKVGfKSWzfA2+zpI5i0phB4P3mcyj
         H9ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731342330; x=1731947130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sdaW5kfpiaTfiF12KAXhCU6CQhCro9H+J/CsRfMkYO8=;
        b=fofJ0MYvFPSFyRF5nKXMW9ai9CDvlvU+YUGm2k5GtU+Z6F0eW6D3oXBg81RYxTRIvo
         +9aSMehdFdbqUNA9E+3zBKBXpPZjw1VuuoenqTT0YmTuM/u9UyF3X7N/V7eiI/Pvy42n
         gD2oOijx9INCxqlwXpPT6lBepZOBbIFCiO6SVbOAv+sLgKgQTKRn/GqiWHfIsvAyzjPs
         R/tKsciXQsIv5MQeJ8enGVQ2p7KCXPatVChM+x1CAWMhnVWhaTd9X5gh1kP3KGipRkOV
         KVOWASUU1BYiR5LId059pGx7B35+qLadS2ahs45/nNVQAJAiykq3DFYDvhruPRb6ebN/
         qF3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUs7vJX685TX3zuHERM4QKp7BZSzLKvpk1CicHL0z11GFVTcPOK+t5dmNsE35osvy9xXjxpXmKUc3kTWw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxbpNFMYMcxlaOMzYulGEsvyUriX7yxv0v8OQKlt8pvdT0hvtql
	5dKEjE4mNNHkSji1tjGnzl1jQ9aUJWLFj20xRJnw0J9zpc8YpC/nlzwqGJ6N
X-Google-Smtp-Source: AGHT+IHjidSenCJkr5FUNWAm4Y6bXamQ3Ryqvj8VKRbPZjsYvS4BKCPVBWtxFuWLxC9OMU3f7f++sQ==
X-Received: by 2002:a05:6512:224b:b0:539:f554:78ac with SMTP id 2adb3069b0e04-53d862b4524mr5911112e87.9.1731342329683;
        Mon, 11 Nov 2024 08:25:29 -0800 (PST)
Received: from localhost.localdomain (c90-142-33-119.bredband.tele2.se. [90.142.33.119])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826786acsm1622926e87.30.2024.11.11.08.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 08:25:29 -0800 (PST)
From: codekipper@gmail.com
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@vger.kernel.org,
	linux-sunxi@googlegroups.com,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org
Cc: conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	andre.przywara@arm.com,
	wens@csie.org,
	macromorgan@hotmail.com,
	jszhang@kernel.org,
	uwu@icenowy.me,
	ryan@testtoast.com,
	dsimic@manjaro.org,
	mripard@kernel.org,
	Marcus Cooper <codekipper@gmail.com>
Subject: [PATCH 2/2] arm64: dts: allwinner: Add initial support for the X96Q-Pro STB
Date: Mon, 11 Nov 2024 17:25:06 +0100
Message-ID: <20241111162524.46812-3-codekipper@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241111162524.46812-1-codekipper@gmail.com>
References: <20241111162524.46812-1-codekipper@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Marcus Cooper <codekipper@gmail.com>

The X96Q-Pro is an STB based on the Allwinner H313 SoC with a SD
slot, 2 USB-2 ports, a 10/100M ethernet port using the SoC's
integrated PHY, Wifi via an sdio wifi chip, HDMI, an IR receiver,
a blue LED display, an audio video connector and an digital S/PDIF
connector.

Add the devicetree file describing the currently supported features,
namely IR, LEDs, SD card, PMIC, audio codec, SPDIF and USB.

Signed-off-by: Marcus Cooper <codekipper@gmail.com>
---
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun50i-h313-x96q-pro.dts    | 176 ++++++++++++++++++
 2 files changed, 177 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h313-x96q-pro.dts

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index 00bed412ee31c..e0bcea1840c1f 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -18,6 +18,7 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-sopine-baseboard.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-teres-i.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h64-remix-mini-pc.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a100-allwinner-perf1.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h313-x96q-pro.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-bananapi-m2-plus.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-bananapi-m2-plus-v1.2.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-emlid-neutis-n5-devboard.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h313-x96q-pro.dts b/arch/arm64/boot/dts/allwinner/sun50i-h313-x96q-pro.dts
new file mode 100644
index 0000000000000..4427545ea143c
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h313-x96q-pro.dts
@@ -0,0 +1,176 @@
+// SPDX-License-Identifier: (GPL-2.0+ or MIT)
+/*
+ */
+
+/dts-v1/;
+
+#include "sun50i-h616.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	model = "X96Q Pro";
+	compatible = "amediatech,x96q-pro", "allwinner,sun50i-h616";
+
+	aliases {
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
+	sound-spdif {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "sun50i-h616-spdif";
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
+};
+
+&codec {
+	allwinner,audio-routing = "Line Out", "LINEOUT";
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
+&ir {
+	status = "okay";
+};
+
+&mmc0 {
+	vmmc-supply = <&reg_dldo1>;
+	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;	/* PF6 */
+	bus-width = <4>;
+	status = "okay";
+};
+
+&mmc2 {
+	vmmc-supply = <&reg_dldo1>;
+	vqmmc-supply = <&reg_aldo1>;
+	bus-width = <8>;
+	non-removable;
+	cap-mmc-hw-reset;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
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
+	vcc-pc-supply = <&reg_dldo1>;
+	vcc-pf-supply = <&reg_dldo1>;
+	vcc-pg-supply = <&reg_aldo1>;
+	vcc-ph-supply = <&reg_dldo1>;
+	vcc-pi-supply = <&reg_dldo1>;
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
+		interrupts = <2 9 IRQ_TYPE_LEVEL_LOW>;	/* PC9 */
+
+		vin1-supply = <&reg_vcc5v>;
+		vin2-supply = <&reg_vcc5v>;
+		vin3-supply = <&reg_vcc5v>;
+
+		regulators {
+			/* Supplies VCC-PLL, so needs to be always on. */
+			reg_aldo1: aldo1 {
+				regulator-always-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vcc1v8";
+			};
+
+			/* Supplies VCC-IO, so needs to be always on. */
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
+				regulator-min-microvolt = <1100000>;
+				regulator-max-microvolt = <1100000>;
+				regulator-name = "vdd-dram";
+			};
+		};
+	};
+};
+
+&spdif {
+	status = "okay";
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_ph_pins>;
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
-- 
2.47.0

