Received: from wfhigh6-smtp.messagingengine.com (wfhigh6-smtp.messagingengine.com [64.147.123.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D2314AAD
	for <linux-sunxi@lists.linux.dev>; Sat, 20 Apr 2024 10:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713610024; cv=none; b=G+qJFYnnhaP2usEPQHSKXSaw9Mgs2s34c6TKv+NjcmItjF3RScjsaVIOYNoyPMvvt+/BPmOAp5NPBa72hoAKAyBsyu3GyhUUdbE+yYSsyFj3FvuR5kbrIcAdAEn7m5x3MZZKM961G2mBq7asBjZhKR1hJ8CXnfkd/wVYdnI6VCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713610024; c=relaxed/simple;
	bh=jMK+12xMfqqmfiFhabj92S81CP+k/inw4RT40G0MK2I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bq1E3SKmiTaHtxxoExFna7HVGmwR6IR7PmfBxwfFSg74gujg2G4EydRIaSjSOh7HXymrqqCnl0SUY7sLcN7tFvw7Pw7wPCrCXYlA62hsTwwndl0sWq7ZBqdLMF7CKlIT9S0mqgJUvhSPjR0dXK9dW16l+DFGFP80+sSf7oMOutQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=DLsDB0CP; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=aWdKv9ci; arc=none smtp.client-ip=64.147.123.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="DLsDB0CP";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="aWdKv9ci"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfhigh.west.internal (Postfix) with ESMTP id 7B22818000EB;
	Sat, 20 Apr 2024 06:47:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Sat, 20 Apr 2024 06:47:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1713610020; x=
	1713696420; bh=o8qF2YcznVUSPWY1ksJnXIbhO7Ec53tLrk9iAfogLPE=; b=D
	LsDB0CPl+R9fLJx6BpjM03bQJaMLDkw1gJu053vfGsp7kJDhwRyFjMtcPFw+RFm1
	FuZOPKl/sBSyxoPP0AsXxrRu2aXWLeOdBpuX5MJARjIrh1ewG2qBj+nHxhFB+Qk7
	5vdtNyb4T6JQQP0iCQMxuoQpBpetcN8g0p89wldtjK9eIz38nDOXpceHZUXKrBfZ
	DMv9RDQZvJaLRTpnxFG4bmltOJiHkX8T0vF1TXV4LiOn86/cuU/OWW1ceP8WRMfo
	aABuVaVzj3J9S4CdnTK3E3EvjViiIljNMFQuEz5LezGW8bKJ+mRo0kS96sdZtDtw
	06b1fdOYYF5/e5T9gmT+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1713610020; x=
	1713696420; bh=o8qF2YcznVUSPWY1ksJnXIbhO7Ec53tLrk9iAfogLPE=; b=a
	WdKv9cibLE9NB4Y2t1R6urYZcnwVXnS19oOJ/+PCib6THJpVllMpADaJqIE4nDoX
	ovWLbFztT3eldEOcoxCV8FAVBaxNUETVXjiDMznoCtao8JdsP2/VlxWJYO0Phxby
	NiM0eKEY7N5/CSCeSpnEeNvDx0kaMpq4iuWdFe+vuQlWYZ3cUe65Tk7GOlYD7mYP
	ie5/Tmtf8hGRMdlQrWrSQtAj9bIVRWLuB7EFVZDpkJWkXt8OkVloqP9FHFQaEtFd
	I+yW2Gnfq/qbzi0IKx0oisfVjbVLNAizWA5/AtRiKwIUgGoVy70pNCd7C3zfDlxu
	StBNwffwH3q/ecI87gFxw==
X-ME-Sender: <xms:JJ0jZgfoLXfu8nqjn0SEoBPegh3nzXFXyGl_wYNl_xyB1hykPq5L3w>
    <xme:JJ0jZiMxbD14G6ZABo-fHIZ3FA0NpZ7uo_ct8BsQN6AXeJCYUP1fYCqWxZA7nMKY5
    tV4fXkp6zg3syKBdg>
X-ME-Received: <xmr:JJ0jZhi22vi8I5rJAyPvgaejoXcjn8tPb-5be9fGDmy-hC09HSCE3gkU-_jXb6Aw0_c0wX3xNZ_nQFoTlBpBZY-4ywCQl97BiFnV4C4v0G2Z7hvw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudekgedgfedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfihrghn
    ucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtffrrg
    htthgvrhhnpeehgeduffeiveeiuddufeelffeuteeiiedulefhteevgefgffehheeuudff
    veejvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgt
    ohhm
X-ME-Proxy: <xmx:JJ0jZl-EvGe4HXpf1EGjhkBMCMBOTr00isH0ExD0F-j6RCxG-khpzw>
    <xmx:JJ0jZst6CTDyQi-cjch0IGpGvw668EAX7Swstn2JozJsqalpulqFBQ>
    <xmx:JJ0jZsFGZrb4xRUnRpzpIZS-j8BuTigK4xjsqWBZ5vOO731fs6f94Q>
    <xmx:JJ0jZrMXp5c-9J0b0Cd6RvXFJBWhh5_hwa_GT8smyL85IvefXIBiNA>
    <xmx:JJ0jZsGLj8rIWQ60Ftjl7794OUzX1l09y8UrnptDCctZ9f2ITKYbKjHL>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 20 Apr 2024 06:46:57 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
To: Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Chris Morgan <macromorgan@hotmail.com>
Cc: devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 2/5] arm64: dts: allwinner: h700: Add RG35XX 2024 DTS
Date: Sat, 20 Apr 2024 22:43:56 +1200
Message-ID: <20240420104354.334947-8-ryan@testtoast.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240420104354.334947-5-ryan@testtoast.com>
References: <20240420104354.334947-5-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The base model RG35XX (2024) is a handheld gaming device based on an Allwinner H700 chip.

The H700 is a H616 variant (4x ARM Cortex-A53 cores @ 1.5Ghz with Mali G31 GPU) which exposes RGB LCD and NMI pins.

Device features:
- Allwinner H700 @ 1.5GHz
- 1GB LPDDR4 DRAM
- X-Powers AXP717 PMIC
- 3.5" 640x480 RGB LCD
- Two microSD slots
- Mini-HDMI out
- GPIO keypad
- 3.5mm headphone jack

Enabled in this DTS:
- AXP717 PMIC with regulators (interrupt controller TBC/TBD)
- Power LED (charge LED on device controlled directly by PMIC)
- Serial UART (accessible from PIN headers on the board)
- MMC slots

Changelog v1..v2:
- Update copyright
- Spaces -> Tabs
- Add cpufreq support [1]
- Remove MMC aliases
- Fix GPIO button and regulator node names
- Note unused AXP717 regulators
- Update regulator for SD slots
- Remove unused I2C3 device
- Update NMI interrupt controller for AXP717 [2]
- Add chassis-type
- Address USB EHCI/OHCI0 correctly and add usb vbus supply
- Add PIO vcc-pg-supply
- Correct boost regulator voltage and name

Signed-off-by: Ryan Walklin <ryan@testtoast.com>

[1]: https://lore.kernel.org/linux-sunxi/20240419071450.7aiheeoyq35yjoo7@vireshk-i7/T/#t
[2]: https://lore.kernel.org/linux-sunxi/20240418181615.1370179-1-macroalpha82@gmail.com/T/#t

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 .../sun50i-h700-anbernic-rg35xx-2024.dts      | 375 ++++++++++++++++++
 1 file changed, 375 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
new file mode 100644
index 000000000000..d8081273677d
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
@@ -0,0 +1,375 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright (C) 2024 Ryan Walklin <ryan@testtoast.com>.
+ */
+
+/dts-v1/;
+
+#include "sun50i-h616.dtsi"
+#include "sun50i-h616-cpu-opp.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/leds/common.h>
+
+/ {
+	model = "Anbernic RG35XX 2024";
+	chassis-type = "handset";
+	compatible = "anbernic,rg35xx-2024", "allwinner,sun50i-h700";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			function = LED_FUNCTION_POWER;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&pio 8 12 GPIO_ACTIVE_HIGH>; /* PI12 */
+			default-state = "on";
+		};
+	};
+
+	gpio-keys {
+	   compatible = "gpio-keys";
+
+	   button-up {
+		   label = "D-Pad Up";
+		   gpios = <&pio 0 6 GPIO_ACTIVE_LOW>; /* PA6 */
+		   linux,input-type = <EV_KEY>;
+		   linux,code = <BTN_DPAD_UP>;
+		};
+
+		button-down {
+			label = "D-Pad Down";
+			gpios = <&pio 4 0 GPIO_ACTIVE_LOW>; /* PE0 */
+			linux,input-type = <EV_KEY>;
+			linux,code = <BTN_DPAD_DOWN>;
+		};
+
+		button-left {
+			label = "D-Pad left";
+			gpios = <&pio 0 8 GPIO_ACTIVE_LOW>; /* PA8 */
+			linux,input-type = <EV_KEY>;
+			linux,code = <BTN_DPAD_LEFT>;
+		};
+
+		button-right {
+			label = "D-Pad Right";
+			gpios = <&pio 0 9 GPIO_ACTIVE_LOW>; /* PA9 */
+			linux,input-type = <EV_KEY>;
+			linux,code = <BTN_DPAD_RIGHT>;
+		};
+
+		button-a {
+			label = "Action-Pad A";
+			gpios = <&pio 0 0 GPIO_ACTIVE_LOW>; /* PA0 */
+			linux,input-type = <EV_KEY>;
+			linux,code = <BTN_EAST>;
+		};
+
+		button-b {
+			label = "Action-Pad B";
+			gpios = <&pio 0 1 GPIO_ACTIVE_LOW>; /* PA1 */
+			linux,input-type = <EV_KEY>;
+			linux,code = <BTN_SOUTH>;
+		};
+
+		button-x {
+			label = "Action-Pad X";
+			gpios = <&pio 0 3 GPIO_ACTIVE_LOW>; /* PA3 */
+			linux,input-type = <EV_KEY>;
+			linux,code = <BTN_NORTH>;
+		};
+
+		button-y {
+			label = "Action Pad Y";
+			gpios = <&pio 0 2 GPIO_ACTIVE_LOW>; /* PA2 */
+			linux,input-type = <EV_KEY>;
+			linux,code = <BTN_WEST>;
+		};
+
+		button-start {
+			label = "Key Start";
+			gpios = <&pio 0 4 GPIO_ACTIVE_LOW>; /* PA4 */
+			linux,input-type = <EV_KEY>;
+			linux,code = <BTN_START>;
+		};
+
+		button-select {
+			label = "Key Select";
+			gpios = <&pio 0 5 GPIO_ACTIVE_LOW>; /* PA5 */
+			linux,input-type = <EV_KEY>;
+			linux,code = <BTN_SELECT>;
+		};
+
+		button-l1 {
+			label = "Key L1";
+			gpios = <&pio 0 10 GPIO_ACTIVE_LOW>; /* PA10 */
+			linux,input-type = <EV_KEY>;
+			linux,code = <BTN_TL>;
+		};
+
+		button-l2 {
+			label = "Key L2";
+			gpios = <&pio 0 11 GPIO_ACTIVE_LOW>; /* PA11 */
+			linux,input-type = <EV_KEY>;
+			linux,code = <BTN_TL2>;
+		};
+
+		button-r1 {
+			label = "Key R1";
+			gpios = <&pio 0 12 GPIO_ACTIVE_LOW>; /* PA12 */
+			linux,input-type = <EV_KEY>;
+			linux,code = <BTN_TR>;
+		};
+
+		button-r2 {
+			label = "Key R2";
+			gpios = <&pio 0 7 GPIO_ACTIVE_LOW>; /* PA7 */
+			linux,input-type = <EV_KEY>;
+			linux,code = <BTN_TR2>;
+		};
+
+		button-menu {
+			label = "Key Menu";
+			gpios = <&pio 4 3 GPIO_ACTIVE_LOW>; /* PE3 */
+			linux,input-type = <EV_KEY>;
+			linux,code = <BTN_MODE>;
+		};
+
+		button-vol-up {
+			label = "Key Volume Up";
+			gpios = <&pio 4 1 GPIO_ACTIVE_LOW>; /* PE1 */
+			linux,input-type = <EV_KEY>;
+			linux,code = <KEY_VOLUMEUP>;
+		};
+
+		button-vol-down {
+			label = "Key Volume Down";
+			gpios = <&pio 4 2 GPIO_ACTIVE_LOW>; /* PE2 */
+			linux,input-type = <EV_KEY>;
+			linux,code = <KEY_VOLUMEDOWN>;
+		};
+	};
+
+	reg_vcc_sd2: regulator-vcc3v3 {
+		compatible = "regulator-fixed";
+		gpio = <&pio 4 4 GPIO_ACTIVE_HIGH>; /* PE4 */
+		regulator-name = "vcc_3v3_sd2";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	reg_vcc_usb: regulator-vcc-5v0-usb {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&pio 8 7 GPIO_ACTIVE_HIGH>; /* PI7 */
+		regulator-name = "vcc_5v0_usb";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc_3v3_usb>;
+	};
+
+	vcc_3v3_usb: vcc-3v3-usb {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&pio 4 5 GPIO_ACTIVE_HIGH>; /* PE5 */
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-name = "vcc_3v3_usb";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+	};
+
+	reg_vcc5v: regulator-vcc5v { /* USB-C power input */
+		compatible = "regulator-fixed";
+		regulator-name = "vcc-5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	reg_pll_dcx0: regulator-pll-dcx0 {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-name = "vcc-pll";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+};
+
+&cpu0 {
+	cpu-supply = <&reg_dcdc1>;
+};
+
+&mmc0 {
+	vmmc-supply = <&reg_vcc_sd2>;
+	disable-wp;
+	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;  /* PF6 */
+	bus-width = <4>;
+	status = "okay";
+};
+
+&mmc2 {
+	vmmc-supply = <&reg_vcc_sd2>;
+	vqmmc-supply = <&reg_aldo1>;
+	cd-gpios = <&pio 4 22 GPIO_ACTIVE_LOW>; /* PE22 */
+	bus-width = <4>;
+	status = "okay";
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&r_rsb {
+   status = "okay";
+
+   axp717: pmic@3a3 {
+		compatible = "x-powers,axp717";
+		reg = <0x3a3>;
+		interrupt-controller;
+		#interrupt-cells = <1>;
+		interrupt-parent = <&nmi_intc>;
+		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+		x-powers,drive-vbus-en;
+
+		vin1-supply = <&reg_vcc5v>;
+		vin2-supply = <&reg_vcc5v>;
+		vin3-supply = <&reg_vcc5v>;
+		vin4-supply = <&reg_vcc5v>;
+
+		regulators {
+			reg_dcdc1: dcdc1 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <810000>;
+				regulator-max-microvolt = <1100000>;
+				regulator-name = "vdd-cpu";
+			};
+
+			reg_dcdc2: dcdc2 {
+				regulator-always-on;
+				regulator-min-microvolt = <940000>;
+				regulator-max-microvolt = <940000>;
+				regulator-name = "vdd-sys";
+			};
+
+			reg_dcdc3: dcdc3 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1100000>;
+				regulator-max-microvolt = <1100000>;
+				regulator-name = "vdd-dram";
+			};
+
+			reg_aldo1: aldo1 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcc-sd2";
+			};
+
+			reg_aldo2: aldo2 {
+				/* unused */
+			};
+
+			reg_aldo3: aldo3 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3500000>;
+				regulator-name = "axp717-aldo3";
+			};
+
+			reg_aldo4: aldo4 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3500000>;
+				regulator-name = "axp717-aldo4";
+			};
+
+			reg_bldo1: bldo1 {
+				/* unused */
+			};
+
+			reg_bldo2: bldo2 {
+				regulator-always-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vcc-pll";
+			};
+
+			reg_bldo3: bldo3 {
+				/* unused */
+			};
+
+			reg_bldo4: bldo4 {
+				/* unused */
+			};
+
+			reg_cldo1: cldo1 {
+				/* unused */
+			};
+
+			reg_cldo2: cldo2 {
+				/* unused */
+			};
+
+			reg_cldo3: cldo3 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3500000>;
+				regulator-name = "axp717-cldo3";
+			};
+
+			reg_cldo4: cldo4 {
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcc-wifi";
+			};
+
+			reg_boost: boost {
+				regulator-min-microvolt = <5126000>;
+				regulator-max-microvolt = <5126000>;
+				regulator-name = "boost";
+			};
+
+			reg_cpusldo: cpusldo {
+				/* unused */
+			};
+		};
+	};
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_ph_pins>;
+	status = "okay";
+};
+
+&pio {
+	vcc-pg-supply = <&reg_pll_dcx0>;
+};
+
+/* the AXP717 has USB type-C role switch functionality, to be implemented */
+&usbotg {
+	dr_mode = "host";   /* USB type-C receptable */
+	status = "okay";
+};
+
+&usbphy {
+	usb0_vbus-supply = <&reg_vcc_usb>;
+	status = "okay";
+};
-- 
2.44.0

