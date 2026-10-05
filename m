Received: from mail-ed2-f32.google.com (mail-ed2-f32.google.com [74.125.228.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC5F4E56C6
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Oct 2026 20:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791232128; cv=none; b=FHgQXpbxG57BaXYqHBWVUSylRqsJZO83hvUmxa12W9WGhe0XKFedL2h61ZS6sVg6TRo7p6hOCXbgHd5NHAQxag6IIzL3UVlaKuKzOiyMZULiah34RHF7ngnwdNtiUOt9YoNC2PYjMRxZ/pAQbW3OUJ43ZfKqt9LTcIRHG+N/QX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791232128; c=relaxed/simple;
	bh=YZBLXfeQB1l3o/DZB18yK0eNqztDWOMKgbV+XVMA4zM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mp/a0xhhBIw9DSh/tPYEysiBWUyVkzgl3hb8dyiheKHlnPGRhSKhuyuIp1DP7BQqTqU+6KndNBlbtC5jRuw/lD9gte85TWnAaqjEtaS9OOwA+P6ME3yiOwopv2Qn8y3jOLXnpL04EEBstmYro760836RCKGJg5j0Ed26EwppSQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NvLuULcZ; arc=none smtp.client-ip=74.125.228.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NvLuULcZ"
Received: by mail-ed2-f32.google.com with SMTP id 4fb4d7f45d1cf-6acbdf627ccso2838113a12.2
        for <linux-sunxi@lists.linux.dev>; Mon, 05 Oct 2026 13:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791232116; x=1791836916; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lngvV3FBuEfkmR/eOgCU094o1/RwaIUjzlpowVfZV8Y=;
        b=NvLuULcZ4VgPBm2zHVaGe9/lK9AbyeiNzYzCVQRcbpP+JdONnluEiP2kA/W3KJS9mk
         k55xcgANoSqhSW85iDooSfWZQ5J/ech4E3GOq+Y/srG2nDx+qRJNqYsK5kNCJbdQxc54
         aLvVKOYKX/Qv1X3qy62pVTQabbYoiuIEBmL7XHinpCthVi1LPXvA2CDkszxbLD3/W3An
         G15YkXL19MRd4V3b0Zg802g0UnILjjiogsaKrFkTAO7t6O4EkiZ8SviONdxr/yy1ybBu
         buq8Bacw3XUbUOao/fKmCb/qZD1120Kq27/E5Rmsv7prsQQM9d1FjpSeSVq5YzReGSQf
         QJwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791232116; x=1791836916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lngvV3FBuEfkmR/eOgCU094o1/RwaIUjzlpowVfZV8Y=;
        b=YEK2OP0Y1Nk+br0Y6G2FEkN1eIlHlo1VkKIkDMlsvU9/DGk+BkJKnCYMjiASf+EOcv
         Ze6yVZD5GWWMwSePwjM1ri1Vgbg7Qw1HXihRFsAXDgbD6CoLU90GlXmlZXV+T6b856VR
         LnuwszxrAywpqMexS36dQ2rrRPGShIZwebNgnUBKRks/eVVxtX0ELOhnhu+jc0fpCXKk
         5wB89OHujy09SjAqtKDQboFOP9QjRL2gq81frvVEKcwnbFCPl4pPsq1lpM47F8LTvlU1
         9i/dpTRLb6CpMuQiqTA/RcYZR47ViEgfFlvcAvlv0XaOkPoCmn3/p/oZOzx6M0yJcDXL
         80rA==
X-Forwarded-Encrypted: i=1; AKwUvBwxuxhyMOCX3Crnou0Nt1hfrxofAQ01I8QnLuKdSzwZRtYDb1+wIw3OhdQs5zftzNDIOyAM3EOia8VlCw==@lists.linux.dev
X-Gm-Message-State: AFq9FYIyctwhDhINrnLxOvg4f+/bqngAdQGQgLd7Otx8ZTC0GarcAx3y
	lG352okOlSkLxXK9QVWJuFgMwZVBN6jGfOy7/SBsnb6F/xe27NsRXQGG
X-Gm-Gg: AYBFou3gNj00oIT4gB4li23Tg04Z7AnZXpTdEQoD8xvIQQ6XZjGsRMvlbzlqZ9PG9c3
	L60YL2ADJdEVtoWuKVfmwk39qYJ9mzSZmGrWn2MBtrirDWVWjb6Mwklzs2YmliJoje+Bv+XN4J9
	HuuS+O7argm+YDVEXIzVv2UVk/NSfF23sYe4YZCXW4wm2+e5JWkhmjh3d5ZF5Ikd72HHMshXFlc
	p0IXSNV9/sogfRRoFN2hH65OYo3VU2ohrO30CENAXdEmp/nFd0R5fHaGz/FcbcLb36ufuXB5mxT
	0uir1edapoX1w46X5FuFmfBlKhTN6CoQDmB/5uODbX9QUk5wVDCR+j8H9TucpTkz3OXTi2hKbrk
	/oC3YcDpR77zJ3an6zewQ0rdSlQZ6+41B6XaStgtLB/0KnQSbVyiQvai5yEULh+rlyF10yciCnk
	sM2ZwFFM9XGuMJflJ0gUoqaYqkcNZa3G3TFj9SxH30HAUWu7O6Ey2l4s88NNL3xXbmeVVcbiqoA
	ShJMbTqOEOE/aMaWg7j8gKvNOPt4sir
X-Received: by 2002:a05:6402:24c6:b0:6ac:7077:6c4b with SMTP id 4fb4d7f45d1cf-6af9e021817mr7765457a12.5.1791232116509;
        Mon, 05 Oct 2026 13:28:36 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb01e572asm3801024a12.13.2026.10.05.13.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 13:28:34 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v3 11/11] ARM: dts: allwinner: add B288 and the PocketBook Verse
Date: Mon,  5 Oct 2026 21:27:31 +0100
Message-ID: <20261005202731.153971-12-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005202731.153971-1-pmazzini@gmail.com>
References: <20261005202731.153971-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the B288 SoC .dtsi and the PocketBook Verse (PB629) board.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 arch/arm/boot/dts/allwinner/Makefile          |   1 +
 .../allwinner/sun8i-b288-pocketbook-verse.dts | 114 +++++++
 arch/arm/boot/dts/allwinner/sun8i-b288.dtsi   | 290 ++++++++++++++++++
 3 files changed, 405 insertions(+)
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-b288-pocketbook-verse.dts
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-b288.dtsi

diff --git a/arch/arm/boot/dts/allwinner/Makefile b/arch/arm/boot/dts/allwinner/Makefile
index 75b2b6a2f7a6..2dfdc01e4825 100644
--- a/arch/arm/boot/dts/allwinner/Makefile
+++ b/arch/arm/boot/dts/allwinner/Makefile
@@ -227,6 +227,7 @@ dtb-$(CONFIG_MACH_SUN8I) += \
 	sun8i-a83t-bananapi-m3.dtb \
 	sun8i-a83t-cubietruck-plus.dtb \
 	sun8i-a83t-tbs-a711.dtb \
+	sun8i-b288-pocketbook-verse.dtb \
 	sun8i-h2-plus-bananapi-m2-zero.dtb \
 	sun8i-h2-plus-libretech-all-h3-cc.dtb \
 	sun8i-h2-plus-orangepi-r1.dtb \
diff --git a/arch/arm/boot/dts/allwinner/sun8i-b288-pocketbook-verse.dts b/arch/arm/boot/dts/allwinner/sun8i-b288-pocketbook-verse.dts
new file mode 100644
index 000000000000..a60cbb638019
--- /dev/null
+++ b/arch/arm/boot/dts/allwinner/sun8i-b288-pocketbook-verse.dts
@@ -0,0 +1,114 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * PocketBook Verse (PB629), an Allwinner B288 based e-reader.
+ */
+
+/dts-v1/;
+#include "sun8i-b288.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model = "PocketBook Verse";
+	compatible = "pocketbook,verse", "allwinner,sun8i-b288";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pb_pins>;
+	status = "okay";
+};
+
+&mmc0 {
+	vmmc-supply = <&reg_dldo2>;
+	bus-width = <4>;
+	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;	/* PF6 */
+	disable-wp;
+	status = "okay";
+};
+
+&mmc3 {
+	vmmc-supply = <&reg_dcdc1>;
+	vqmmc-supply = <&reg_dldo1>;
+	bus-width = <8>;
+	non-removable;
+	cap-mmc-hw-reset;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	status = "okay";
+};
+
+&pio {
+	vcc-pc-supply = <&reg_dldo1>;
+	vcc-pd-supply = <&reg_dldo1>;
+};
+
+&i2c0 {
+	status = "okay";
+
+	axp22x: pmic@34 {
+		/* labelled AXP227 */
+		compatible = "x-powers,axp221";
+		reg = <0x34>;
+		interrupt-parent = <&nmi_intc>;
+		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
+#include "axp22x.dtsi"
+
+&reg_dcdc1 {
+	regulator-always-on;
+	regulator-min-microvolt = <3000000>;
+	regulator-max-microvolt = <3000000>;
+	regulator-name = "vcc-io";
+};
+
+&reg_dcdc2 {
+	regulator-always-on;
+	regulator-min-microvolt = <1260000>;
+	regulator-max-microvolt = <1260000>;
+	regulator-name = "vdd-cpu";
+};
+
+&reg_dcdc4 {
+	regulator-always-on;
+	regulator-min-microvolt = <1100000>;
+	regulator-max-microvolt = <1100000>;
+	regulator-name = "vdd-sys";
+};
+
+&reg_dcdc5 {
+	regulator-always-on;
+	regulator-min-microvolt = <1350000>;
+	regulator-max-microvolt = <1350000>;
+	regulator-name = "vcc-dram";
+};
+
+&reg_aldo3 {
+	regulator-always-on;
+	regulator-min-microvolt = <3000000>;
+	regulator-max-microvolt = <3000000>;
+	regulator-name = "avcc";
+};
+
+&reg_dldo1 {
+	regulator-min-microvolt = <1800000>;
+	regulator-max-microvolt = <1800000>;
+	regulator-name = "vcc-pc";
+};
+
+&reg_dldo2 {
+	/* microSD slot */
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+	regulator-name = "vcc-sdcv";
+};
diff --git a/arch/arm/boot/dts/allwinner/sun8i-b288.dtsi b/arch/arm/boot/dts/allwinner/sun8i-b288.dtsi
new file mode 100644
index 000000000000..dc8264a547cf
--- /dev/null
+++ b/arch/arm/boot/dts/allwinner/sun8i-b288.dtsi
@@ -0,0 +1,290 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Allwinner B288 (sun8iw10p1) SoC
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/sun8i-b288-ccu.h>
+#include <dt-bindings/reset/sun8i-b288-ccu.h>
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	interrupt-parent = <&gic>;
+
+	osc24M: osc24M-clk {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <24000000>;
+		clock-output-names = "osc24M";
+	};
+
+	osc32k: osc32k-clk {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <32768>;
+		clock-output-names = "osc32k";
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			compatible = "arm,cortex-a7";
+			device_type = "cpu";
+			reg = <0>;
+			clocks = <&ccu CLK_CPUX>;
+			clock-names = "cpu";
+		};
+
+		cpu1: cpu@1 {
+			compatible = "arm,cortex-a7";
+			device_type = "cpu";
+			reg = <1>;
+			clocks = <&ccu CLK_CPUX>;
+			clock-names = "cpu";
+		};
+	};
+
+	timer {
+		compatible = "arm,armv7-timer";
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		nmi_intc: interrupt-controller@1c000d0 {
+			compatible = "allwinner,sun8i-b288-nmi",
+				     "allwinner,sun9i-a80-nmi";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			reg = <0x01c000d0 0x0c>;
+			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		/*
+		 * mmc0 is a v4p1x controller, so it runs in the old timing
+		 * mode and needs the sample and output phase clocks.
+		 */
+		mmc0: mmc@1c0f000 {
+			compatible = "allwinner,sun8i-b288-mmc",
+				     "allwinner,sun7i-a20-mmc";
+			reg = <0x01c0f000 0x1000>;
+			clocks = <&ccu CLK_BUS_SDMMC0_BUS>,
+				 <&ccu CLK_MMC0>,
+				 <&ccu CLK_MMC0_OUTPUT>,
+				 <&ccu CLK_MMC0_SAMPLE>;
+			clock-names = "ahb", "mmc", "output", "sample";
+			resets = <&ccu RST_BUS_MMC0>;
+			reset-names = "ahb";
+			interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&mmc0_pins>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		mmc3: mmc@1c12000 {
+			compatible = "allwinner,sun8i-b288-emmc",
+				     "allwinner,sun50i-a64-emmc";
+			reg = <0x01c12000 0x1000>;
+			clocks = <&ccu CLK_BUS_SDMMC3_BUS>, <&ccu CLK_MMC3>;
+			clock-names = "ahb", "mmc";
+			resets = <&ccu RST_BUS_MMC3>;
+			reset-names = "ahb";
+			interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&mmc3_pins>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		/* mmc2 @0x01c11000 is an unsupported SDHCI-style controller. */
+
+		ccu: clock-controller@1c20000 {
+			compatible = "allwinner,sun8i-b288-ccu";
+			reg = <0x01c20000 0x400>;
+			clocks = <&osc24M>, <&osc32k>;
+			clock-names = "hosc", "losc";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
+		rtc: rtc@1c20400 {
+			compatible = "allwinner,sun8i-b288-rtc";
+			reg = <0x01c20400 0x400>;
+			interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
+			clock-output-names = "osc32k", "osc32k-out";
+			clocks = <&osc32k>;
+			#clock-cells = <1>;
+		};
+
+		pio: pinctrl@1c20800 {
+			compatible = "allwinner,sun8i-b288-pinctrl";
+			reg = <0x01c20800 0x400>;
+			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_PIO>, <&osc24M>, <&osc32k>;
+			clock-names = "apb", "hosc", "losc";
+			gpio-controller;
+			#gpio-cells = <3>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+
+			mmc0_pins: mmc0-pins {
+				pins = "PF0", "PF1", "PF2",
+				       "PF3", "PF4", "PF5";
+				function = "mmc0";
+				allwinner,pinmux = <2>;
+				drive-strength = <30>;
+				bias-pull-up;
+			};
+
+			i2c0_pins: i2c0-pins {
+				pins = "PB6", "PB7";
+				function = "i2c0";
+				allwinner,pinmux = <2>;
+			};
+
+			mmc3_pins: mmc3-pins {
+				pins = "PC1", "PC4", "PC5", "PC6",
+				       "PC7", "PC8", "PC9", "PC10",
+				       "PC11", "PC12", "PC13", "PC14";
+				function = "mmc3";
+				allwinner,pinmux = <5>;
+				drive-strength = <40>;
+				bias-pull-up;
+			};
+
+			uart0_pb_pins: uart0-pb-pins {
+				pins = "PB4", "PB5";
+				function = "uart0";
+				allwinner,pinmux = <2>;
+			};
+		};
+
+		wdt: watchdog@1c20ca0 {
+			compatible = "allwinner,sun8i-b288-wdt",
+				     "allwinner,sun6i-a31-wdt";
+			reg = <0x01c20ca0 0x20>;
+			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&osc24M>;
+		};
+
+		uart0: serial@1c28000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x01c28000 0x400>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&ccu CLK_BUS_UART0>;
+			resets = <&ccu RST_BUS_UART0>;
+			status = "disabled";
+		};
+
+		uart1: serial@1c28400 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x01c28400 0x400>;
+			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&ccu CLK_BUS_UART1>;
+			resets = <&ccu RST_BUS_UART1>;
+			status = "disabled";
+		};
+
+		uart2: serial@1c28800 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x01c28800 0x400>;
+			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&ccu CLK_BUS_UART2>;
+			resets = <&ccu RST_BUS_UART2>;
+			status = "disabled";
+		};
+
+		uart3: serial@1c28c00 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x01c28c00 0x400>;
+			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&ccu CLK_BUS_UART3>;
+			resets = <&ccu RST_BUS_UART3>;
+			status = "disabled";
+		};
+
+		uart4: serial@1c29000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x01c29000 0x400>;
+			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&ccu CLK_BUS_UART4>;
+			resets = <&ccu RST_BUS_UART4>;
+			status = "disabled";
+		};
+
+		i2c0: i2c@1c2ac00 {
+			compatible = "allwinner,sun8i-b288-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x01c2ac00 0x400>;
+			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_TWI0>;
+			resets = <&ccu RST_BUS_I2C0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c0_pins>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c1: i2c@1c2b000 {
+			compatible = "allwinner,sun8i-b288-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x01c2b000 0x400>;
+			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_TWI1>;
+			resets = <&ccu RST_BUS_I2C1>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c2: i2c@1c2b400 {
+			compatible = "allwinner,sun8i-b288-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x01c2b400 0x400>;
+			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_TWI2>;
+			resets = <&ccu RST_BUS_I2C2>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		gic: interrupt-controller@1c81000 {
+			compatible = "arm,gic-400";
+			reg = <0x01c81000 0x1000>,
+			      <0x01c82000 0x2000>,
+			      <0x01c84000 0x2000>,
+			      <0x01c86000 0x2000>;
+			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+		};
+	};
+};
-- 
2.52.0

