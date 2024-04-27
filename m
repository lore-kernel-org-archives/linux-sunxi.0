Received: from fout4-smtp.messagingengine.com (fout4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2FA481D0
	for <linux-sunxi@lists.linux.dev>; Sat, 27 Apr 2024 11:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714216009; cv=none; b=Tr332NGJfE44/ciB2Dqq39Qf2mqi3ji0Y4rGkuYkLHiXavl+tnmPtkJ/YCzmVkveQ5kc4l9OmDWXxYIBqtq0lI2+cgBlRNQffDsSevrj/JEr4zpii9PvMfw8VC3tPuYYP3XEL7lZBk9fx9+T6QUj36eSWverUi8ueHmaIlfwF4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714216009; c=relaxed/simple;
	bh=him7/5TVVe1BYX8gGzpC3SdgbzcWOC4JT1QmXKRpqpk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f0DA9G73qVoHkzJHqiWsiGaZuBtQHMGsUdUzlGXSxuO5bsKLeVru9UubIgv4cLNNhYwOQNGJ6FfOlUH1/oMHV1LlHT6oiSmhYdxqOnUCST7B1q2FQ7/PRiC5hcHaxynOCzDSq/VbRaq8xie41TnJq3E0/Yat9hRQR1+B93MxFuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=kdU82R7H; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=a6Kt1C5P; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="kdU82R7H";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="a6Kt1C5P"
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailfout.nyi.internal (Postfix) with ESMTP id 0DE861380089;
	Sat, 27 Apr 2024 07:06:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Sat, 27 Apr 2024 07:06:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1714216005; x=
	1714302405; bh=7UxF/1KdNGmFLvGL7Uu/k3ddCE9qc+VNm4E3GhzecoA=; b=k
	dU82R7HvQ/B584Rh3DqVk0ENQ+2e9uHxFuR/iss9aHJwKk/pzbcFPY0wovLXPixH
	q5S5RlVsFh+9vAd+Wp7xX3XYaJyWxW4mk+2f9cXLzXBJyy+TR3dkyAriO4k0iuMI
	RpGztts5+qbBqe2CagiYcuXgPqnoI9lILdIVNdSJeiX7AtQiVEq2fF57FzuWUJyS
	0BZw5iUNfCcKY4LssN5udgcpXYIn2acOEZftUxIdVYo8k5AZ1xjuEqUCeS1xF80N
	aw4STxgQqkbzhA9ujehQWYOMYrC+J925paV3dCNBJ40XRgk3HMJpuvdiXs5Isr5A
	uUIym/5DWOyw1GA83spjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1714216005; x=
	1714302405; bh=7UxF/1KdNGmFLvGL7Uu/k3ddCE9qc+VNm4E3GhzecoA=; b=a
	6Kt1C5Ppu64uADOZvQis2W7CP3iVISMIABIv8vC7VlDfjq9ztzZ42JGRMAPKWrJX
	uJMAj0+GmMkxYjET8lv4pls4L5jkh633UVeaGGfqp6xLKT91r9NukJd/ziv6rH1V
	4K+8yXp7x6wSrgKtFlWzVsHwHzg5H1qMiTcTL7mM0siWKnlF67hT2tanXyvwVOwW
	n1xnrLif4dsCh+/uWjSRNwqAmJrF40qtw6jYi2b38vX7G9CIRksbTzn1JbfLJDW0
	OilFJlAc8bv5esD6a7Wv2ElcwFM70QLXDBvQ0T9WMnNutbvNYPLanmeBVej77hsd
	LfCOwg+FR3RxVS0HPVbZg==
X-ME-Sender: <xms:RNwsZo0yfWQn3L-PFZ-xoWcGFNtcfya_D24AyCyj5PO371HtvV_g9w>
    <xme:RNwsZjFQq2x7HCmPh8APjhe1W9F2XWLQ1oenaLp1TG8pUHiGoADeidwcOiL3tYKvy
    eMomiS7waSPsmxlpg>
X-ME-Received: <xmr:RNwsZg6DiZGS0Cq84Eu1Wj1MFfV5-x1K0t9hvGAOZIaMBwEjIANzNZ2dAUeQEdrf7luSyWhELF1Hr7btBrmoXDd132m-TWi16rrFoKtG7XZYReJg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddtuddgfeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfihrghn
    ucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtffrrg
    htthgvrhhnpeehgeduffeiveeiuddufeelffeuteeiiedulefhteevgefgffehheeuudff
    veejvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgt
    ohhm
X-ME-Proxy: <xmx:RNwsZh3NFr37bGoKwO9rJprFDEQjUg62gST-waJGK1r7H3u6LRRUTA>
    <xmx:RNwsZrEn_Xdz2X60raSL2o-W_wIA2R36kRP7kj7rNCxh3O6VoQkopg>
    <xmx:RNwsZq-IhR7QVqqCVxw3JOagjrAmry5BTKO222vK-n9YI3I-Ozf2dg>
    <xmx:RNwsZgn-mS03IkAAfrWu-YSlXwlrdLVwMf3iRtkCd6x-pvi82oEGYQ>
    <xmx:RdwsZi8l25jmleePQ23A31KOtDyCw9qdPHPtTXva6cbvE2KrPCGoMpvs>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 27 Apr 2024 07:06:41 -0400 (EDT)
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
Subject: [PATCH v6 2/4] arm64: dts: allwinner: h700: Add RG35XX 2024 DTS
Date: Sat, 27 Apr 2024 23:02:26 +1200
Message-ID: <20240427110225.727472-6-ryan@testtoast.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240427110225.727472-2-ryan@testtoast.com>
References: <20240427110225.727472-2-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The base model RG35XX (2024) is a handheld gaming device based on an
Allwinner H700 chip.

The H700 is a H616 variant (4x ARM Cortex-A53 cores @ 1.5Ghz with Mali G31
GPU) which exposes RGB LCD and NMI pins.

Device features:
- Allwinner H700 @ 1.5GHz
- 1GB LPDDR4 DRAM
- X-Powers AXP717 PMIC
- 3.5" 640x480 RGB LCD
- Two microSD slots
- Mini-HDMI out
- GPIO keypad
- 3.5mm headphone jack
- USB-C charging port

Enabled in this DTS:
- AXP717 PMIC with RSB serial interface, regulators and NMI interrupt
  controller
- Power LED (charge LED on device controlled directly by PMIC)
- Serial UART (accessible from headers on the board)
- First SD slot (SD2 appears to have a GPIO-switched regulator for 1.8v
  low-voltage signalling, this is not yet modeled. Enablement with a
  switched regulator will be confirmed and posted in a follow-up patch).

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
Changelog v1..v2:
- Update copyright
- Spaces -> Tabs
- Add cpufreq support
- Remove MMC aliases
- Fix GPIO button and regulator node names
- Note unused AXP717 regulators
- Update regulators for SD slots
- Remove unused I2C3 device
- Update NMI interrupt controller for AXP717, requires H616 support patch in dt-next [1]
- Add chassis-type
- Address USB EHCI/OHCI0 correctly and add usb vbus supply
- Add PIO vcc-pg-supply
- Correct boost regulator voltage and name

Changelog v2..v3:
- Remove cpufreq support (patch still pending for 6.10, will followup with enablement patch once opp table merged)
- Add dtb to Makefile
- Remove unnecessary duplicated PLL regulator
- Remove unimplemented/not-present drive-vbus feature from AXP717
- Rename CLDO3 to "vcc-io", inferring function from board testing by Chris Morgan
- Correct MMC1 vmmc-supply to CLDO3 and MMC2 to CLDO4
- Reduce DCDC1 "vdd-cpu" supply voltage range to 0.9v-1.1v to match lowest OPP voltage
- Identify DCDC2 as GPU supply - rename to "vdd-gpu-sys", remove always-on and use fixed 0.94v voltage
- Fix indentation
- Correct boot/always-on states and voltages for various regulators from vendor BSP
- Change USB-OTG mode to "peripheral" and correct comment
- Correct and add remaining PIO supplies
- Move volume key GPIOs to separate block to allow key repeat
- Alphabetically orrder gamepad GPIOs
- Move changelog and links below fold-line
- Remove USB 3.3v VCC-USB and VCC-SD2 regulators pending further hardware investigation (to be submitted as subsequent patch)
- Constrain boost regulator voltage to 5.0v to 5.2v to capture default voltage of 5.126v

Changelog v3..v4:
- Cluster USB nodes
- Do not define voltage range for currently unused CLDO1 (connected to audio codec according to vendor BSP - driver not yet implemented) and ALDO3 (1.8v).
- Note voltages set for currently unused regulators from vendor BSP in comments to aid identification
- Remove regulator-boot-on from several regulators where it was not required
- Fix indentation
- Add "disable-wp" for SD2 as for SD1 (doesn't make sense for micro-SD)
- Restore fixed 3.3v regulator for SD2 (vcc_3v3_sd2), which is required for SD2 to function. ALDO1 appears to be the 1.8v supply required for low-voltage UHS-I signalling, however a GPIO pin to switch between the supplies is not yet confirmed (likely PE4) and will be implemented in a subsequent patch.

Changelog v4..v5:
- Remove comment referencing vendor BSP node
- Reorder nodes alphabetically and remove empty lines
- Add note to commit message about SD2 regulators, rename vcc_3v3_sd2

Changelog v5..v6:
- Remove SD2 slot and regulator definitions until confirmation of regulator/GPIO states required for LV signalling switching
- Re-sort nodes

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?h=dt/next&id=d47bca77bf3ab475c33b3929c33c80aeb49df35c

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../sun50i-h700-anbernic-rg35xx-2024.dts      | 327 ++++++++++++++++++
 2 files changed, 328 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index 21149b346a60..6f997157968e 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -47,3 +47,4 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-longanpi-3h.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-orangepi-zero2w.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-orangepi-zero3.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-transpeed-8k618-t.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-2024.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
new file mode 100644
index 000000000000..ee30584b6ad7
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
@@ -0,0 +1,327 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright (C) 2024 Ryan Walklin <ryan@testtoast.com>.
+ */
+
+/dts-v1/;
+
+#include "sun50i-h616.dtsi"
+
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
+	gpio_keys_gamepad: gpio-keys-gamepad {
+		compatible = "gpio-keys";
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
+		button-down {
+			label = "D-Pad Down";
+			gpios = <&pio 4 0 GPIO_ACTIVE_LOW>; /* PE0 */
+			linux,input-type = <EV_KEY>;
+			linux,code = <BTN_DPAD_DOWN>;
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
+		button-left {
+			label = "D-Pad left";
+			gpios = <&pio 0 8 GPIO_ACTIVE_LOW>; /* PA8 */
+			linux,input-type = <EV_KEY>;
+			linux,code = <BTN_DPAD_LEFT>;
+		};
+
+		button-menu {
+			label = "Key Menu";
+			gpios = <&pio 4 3 GPIO_ACTIVE_LOW>; /* PE3 */
+			linux,input-type = <EV_KEY>;
+			linux,code = <BTN_MODE>;
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
+		button-right {
+			label = "D-Pad Right";
+			gpios = <&pio 0 9 GPIO_ACTIVE_LOW>; /* PA9 */
+			linux,input-type = <EV_KEY>;
+			linux,code = <BTN_DPAD_RIGHT>;
+		};
+
+		button-select {
+			label = "Key Select";
+			gpios = <&pio 0 5 GPIO_ACTIVE_LOW>; /* PA5 */
+			linux,input-type = <EV_KEY>;
+			linux,code = <BTN_SELECT>;
+		};
+		button-start {
+			label = "Key Start";
+			gpios = <&pio 0 4 GPIO_ACTIVE_LOW>; /* PA4 */
+			linux,input-type = <EV_KEY>;
+			linux,code = <BTN_START>;
+		};
+
+		button-up {
+			label = "D-Pad Up";
+			gpios = <&pio 0 6 GPIO_ACTIVE_LOW>; /* PA6 */
+			linux,input-type = <EV_KEY>;
+			linux,code = <BTN_DPAD_UP>;
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
+	};
+
+	gpio-keys-volume {
+		compatible = "gpio-keys";
+		autorepeat;
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
+	reg_vcc5v: regulator-vcc5v { /* USB-C power input */
+		compatible = "regulator-fixed";
+		regulator-name = "vcc-5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+};
+
+&cpu0 {
+	cpu-supply = <&reg_dcdc1>;
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&mmc0 {
+	vmmc-supply = <&reg_cldo3>;
+	disable-wp;
+	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;  /* PF6 */
+	bus-width = <4>;
+	status = "okay";
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&pio {
+	vcc-pa-supply = <&reg_cldo3>;
+	vcc-pc-supply = <&reg_cldo3>;
+	vcc-pe-supply = <&reg_cldo3>;
+	vcc-pf-supply = <&reg_cldo3>;
+	vcc-pg-supply = <&reg_aldo4>;
+	vcc-ph-supply = <&reg_cldo3>;
+	vcc-pi-supply = <&reg_cldo3>;
+};
+
+&r_rsb {
+	status = "okay";
+
+	axp717: pmic@3a3 {
+		compatible = "x-powers,axp717";
+		reg = <0x3a3>;
+		interrupt-controller;
+		#interrupt-cells = <1>;
+		interrupt-parent = <&nmi_intc>;
+		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+
+		vin1-supply = <&reg_vcc5v>;
+		vin2-supply = <&reg_vcc5v>;
+		vin3-supply = <&reg_vcc5v>;
+		vin4-supply = <&reg_vcc5v>;
+
+		regulators {
+			reg_dcdc1: dcdc1 {
+				regulator-always-on;
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <1100000>;
+				regulator-name = "vdd-cpu";
+			};
+
+			reg_dcdc2: dcdc2 {
+				regulator-always-on;
+				regulator-min-microvolt = <940000>;
+				regulator-max-microvolt = <940000>;
+				regulator-name = "vdd-gpu-sys";
+			};
+
+			reg_dcdc3: dcdc3 {
+				regulator-always-on;
+				regulator-min-microvolt = <1100000>;
+				regulator-max-microvolt = <1100000>;
+				regulator-name = "vdd-dram";
+			};
+
+			reg_aldo1: aldo1 {
+				/* 1.8v - unused */
+			};
+
+			reg_aldo2: aldo2 {
+				/* 1.8v - unused */
+			};
+
+			reg_aldo3: aldo3 {
+				/* 1.8v - unused */
+			};
+
+			reg_aldo4: aldo4 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vcc-pg";
+			};
+
+			reg_bldo1: bldo1 {
+				/* 1.8v - unused */
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
+				/* 2.8v - unused */
+			};
+
+			reg_bldo4: bldo4 {
+				/* 1.2v - unused */
+			};
+
+			reg_cldo1: cldo1 {
+				/* 3.3v - audio codec - not yet implemented */
+			};
+
+			reg_cldo2: cldo2 {
+				/* 3.3v - unused */
+			};
+
+			reg_cldo3: cldo3 {
+				regulator-always-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcc-io";
+			};
+
+			reg_cldo4: cldo4 {
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcc-wifi";
+			};
+
+			reg_boost: boost {
+				regulator-min-microvolt = <5000000>;
+				regulator-max-microvolt = <5200000>;
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
+/* the AXP717 has USB type-C role switch functionality, not yet described by the binding */
+&usbotg {
+	dr_mode = "peripheral";   /* USB type-C receptable */
+	status = "okay";
+};
+
+&usbphy {
+	status = "okay";
+};
-- 
2.44.0

