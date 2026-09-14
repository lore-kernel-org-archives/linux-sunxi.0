Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A23ED414A29
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Sep 2026 21:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789419969; cv=none; b=c0lSQ1za4/jRz7sPRrgIIcRt730WzZuZPk+x41jpzXYjKR1j+L+x+R6oQco8t4lnuKRlQBWKxYEkUQslEjusdCe/vxeaGda/rS+3hQpvnMl5Y4qzgxY4/QDKEv8KDxOtEJBysceMR9rxSA6IVxOMBIBNUuLNfbWiPQusOap1pCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789419969; c=relaxed/simple;
	bh=FJTn15qto8SkZuW/rQdvfilVulV/vGsboJv3j1Pdpq4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z7X5+6znuDlPCxxfP2SYLR7rfuX+OAs2KDOHCq4CqE/KuSvBN7ePpkFG9CZeq6BMKaZGqG1y4yg+7nNnS5+d5wSEFIsIaVdjRnnRJJw09+gNTVtRP7HMK0uPu4EyRXDLcGrH5BjXzojyG3rMsmzwKZXkOh7D6MEHjiPIiRK/DWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=SObcF8V6; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="SObcF8V6"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BBF2F1D15;
	Mon, 14 Sep 2026 14:06:03 -0700 (PDT)
Received: from ryzen.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 740113F882;
	Mon, 14 Sep 2026 14:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789419967; bh=FJTn15qto8SkZuW/rQdvfilVulV/vGsboJv3j1Pdpq4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SObcF8V6uXSG7UCTMAZ3a4JwB1TVnACf+JrREO51S7Jj859p/73Q4YETsHVaztt3o
	 3Uc3Ps1FpX0iiOzQKjVZApIOF0tA2/piYUNu1N1QLgf2rTP40yQ3YUtP7CJen1oGxS
	 UqM8KoWJ3tL1dg5q2FOzfyIJ28voL2/TENoajg+8=
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Paul Kocialkowski <paulk@sys-base.io>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 3/3] arm64: dts: allwinner: A133: add basic support for Teclast P80 tablet
Date: Mon, 14 Sep 2026 23:01:15 +0200
Message-ID: <20260914210115.28151-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.4
In-Reply-To: <20260914210115.28151-1-andre.przywara@arm.com>
References: <20260914210115.28151-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Teclast P80 tablet is an 8 inch entry-level tablet from around 2020,
featuring an Allwinner A133 SoC. It features:
    - Allwinner A133 SoC (4*Arm Cortex-A53) at 1.6 GHz
    - 2 GiB LPDDR4 DRAM
    - 32GiB eMMC
    - microSD card slot
    - AXP707 PMIC
    - USB-C OTG port (also for charging)
    - 800x1200 pixel 8" IPS panel
    - unknown Bluetooth and WiFi
    - secure boot, but takes any key

Add initial support for the tablet, including UART, PMIC, eMMC, SD, USB.
The tablet uses secure boot, so it needs a signed TOC0 wrapped image to
boot, but it has no key hash burnt into the efuses, so it accepts an
image signed with any key.

Please note that there are older models also being named P80: a device
with an Mediatek SoC from around 2018, based on 32-bit ARM cores, and an
Intel Atom based one from around 2014.
This device here is sometimes listed as G4, the Mediatek one as G3.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun50i-a133-teclast-p80.dts | 205 ++++++++++++++++++
 2 files changed, 206 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a133-teclast-p80.dts

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index aa21f58a4be1f..d1f768dd6461d 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -26,6 +26,7 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h64-remix-mini-pc.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a100-allwinner-perf1.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a133-helperboard.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a133-liontron-h-a133l.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a133-teclast-p80.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-bananapi-m2-plus.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-bananapi-m2-plus-v1.2.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-emlid-neutis-n5-devboard.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-teclast-p80.dts b/arch/arm64/boot/dts/allwinner/sun50i-a133-teclast-p80.dts
new file mode 100644
index 0000000000000..47b5f2ac824ae
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-teclast-p80.dts
@@ -0,0 +1,205 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2026 Arm Ltd.
+ */
+
+/dts-v1/;
+
+#include "sun50i-a100.dtsi"
+#include "sun50i-a100-cpu-opp.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+
+/{
+	model = "Teclast P80";
+	compatible = "teclast,p80", "allwinner,sun50i-a133";
+	chassis-type = "tablet";
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
+		/* external power input from the USB-C port*/
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-name = "vcc-5v";
+	};
+
+	speaker_amp: audio-amplifier {
+		compatible = "simple-audio-amplifier";
+		enable-gpios = <&pio 7 6 GPIO_ACTIVE_HIGH>; /* PH6 */
+		sound-name-prefix = "Speaker Amp";
+	};
+};
+
+&cpu0 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&mmc0 {
+	bus-width = <4>;
+	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
+	disable-wp;
+	vmmc-supply = <&reg_dcdc1>;
+	status = "okay";
+};
+
+&mmc2 {
+	bus-width = <8>;
+	cap-mmc-hw-reset;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	non-removable;
+	vmmc-supply = <&reg_dcdc1>;
+	vqmmc-supply = <&reg_eldo1>;
+	status = "okay";
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&r_i2c0 {
+	status = "okay";
+
+	axp803: pmic@34 {
+		compatible = "x-powers,axp803";
+		reg = <0x34>;
+		interrupt-parent = <&r_intc>;
+		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+		x-powers,drive-vbus-en;
+	};
+};
+
+#include "axp803.dtsi"
+
+&ac_power_supply {
+	status = "okay";
+};
+
+&battery_power_supply {
+	status = "okay";
+};
+
+&reg_aldo1 {
+	regulator-always-on;
+	regulator-min-microvolt = <1800000>;
+	regulator-max-microvolt = <1800000>;
+	regulator-name = "vcc-codec-avcc";
+};
+
+&reg_aldo2 {
+	regulator-always-on;
+	regulator-min-microvolt = <1800000>;
+	regulator-max-microvolt = <1800000>;
+	regulator-name = "vcc-dram-1";
+};
+
+&reg_aldo3 {
+	regulator-always-on;
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+	regulator-name = "vcc-usb-pl";
+};
+
+&reg_dcdc1 {
+	regulator-always-on;
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+	regulator-name = "vcc-io-usb-pd-mmc";
+};
+
+&reg_dcdc2 {
+	regulator-always-on;
+	regulator-min-microvolt = <810000>;
+	regulator-max-microvolt = <1200000>;
+	regulator-name = "vdd-cpux";
+};
+
+&reg_dcdc3 {
+	regulator-always-on;
+	regulator-min-microvolt = <900000>;
+	regulator-max-microvolt = <900000>;
+	regulator-name = "vdd-usb-cpus";
+};
+
+&reg_dcdc4 {
+	regulator-always-on;
+	regulator-min-microvolt = <950000>;
+	regulator-max-microvolt = <950000>;
+	regulator-name = "vdd-sys";
+};
+
+&reg_dcdc5 {
+	regulator-always-on;
+	regulator-min-microvolt = <1100000>;
+	regulator-max-microvolt = <1100000>;
+	regulator-name = "vcc-dram";
+};
+
+&reg_dc1sw {
+	regulator-name = "vcc-dc1sw";
+};
+
+&reg_drivevbus {
+	regulator-name = "usb0-vbus";
+	status = "okay";
+};
+
+&reg_dldo1 {
+	regulator-always-on;
+	regulator-min-microvolt = <1800000>;
+	regulator-max-microvolt = <1800000>;
+	regulator-name = "vcc-dldo1";
+};
+
+&reg_eldo1 {
+	regulator-min-microvolt = <1800000>;
+	regulator-max-microvolt = <1800000>;
+	regulator-name = "vcc-eldo1";
+};
+
+&reg_eldo3 {
+	regulator-min-microvolt = <1800000>;
+	regulator-max-microvolt = <1800000>;
+	regulator-name = "vcc-eldo3";
+};
+
+&reg_fldo1 {
+	regulator-always-on;
+	regulator-min-microvolt = <900000>;
+	regulator-max-microvolt = <900000>;
+	regulator-name = "vdd-cpus-usb";
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pb_pins>;
+	status = "okay";
+};
+
+&usb_otg {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&usb_power_supply {
+	status = "okay";
+};
+
+&usbphy {
+	usb0_vbus-supply = <&reg_drivevbus>;
+	usb0_id_det-gpios = <&pio 7 8 GPIO_ACTIVE_HIGH>; /* PH8 */
+	status = "okay";
+};
-- 
2.46.4

