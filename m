Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795725361;
	b=V+5VE3ZSPGicVIiZCuVJ5PChUXuhhw6PfU9ux9a/xa+o1zM+sdEqf9paY+yj5rFJm7sm
	 /dhIkUXRqKf96HC4GnXlV/aBrzMUxrgYXpUoiQyGDdWsQGK4qeaxAoE94SsX1V0yfbNcU
	 A6zp/CxpoYgjFUZ6RGSI4PQr7ufbDJYP+1NkwTynesU8Ph2W22AkNCemNq7RJNE697l6z
	 O9U7c0x9TxijbZdryVAiAJTXc7vXWP1rzhQ/d6M6FbzoeuBQf5W+lfrzAA8CWscGZw1qO
	 3sOvmDgkAwHTpGzVLhj8F4uBwNH/OOtUTHD3fTg/QDM9bcp5+5cC1LMzpzF6M0b0/jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795725361;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GYQ/8mRa+rNincTB4E2wqlqplAQOpEoznj3zJjc2l9I=;
	b=pCzp0dFuqYaIkfmYibPdI1Rbr/ntxesZCIn3kbNJUOc6HnvRQs1mb5XT5ANGbPeAiXIM
	 a7hH1ARolChBOTx25mpqvfv5Bhn3ymOwsBOtzR8HtlvAYa41OYgBFyTUEWzyQGYtIQwMk
	 fCpopdNu/Hv0Wt4kT/PUJ2G38VrVFD4qKgpFcFZbpg2uCtV6vZ5fr4GNwdjYiP9dsqxav
	 KWs3gpDBBH38H7kmu+5TZS/biwBq6i9vIsvh7rX1o4VHMBbsZeB4efRMlsCmOVa6tmuuU
	 DLRw/xBkPefjtp9WhRzyO74UrQHrIU+GxN3+C0Xq3RCRrCVbhvwN9aI5I8tt8CunRrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p9YDeoyn;
	arc=none smtp.remote-ip=209.85.160.44
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32B6606A31E
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 20:36:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C32B6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p9YDeoyn
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-4877837890fso3974146fac.2
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 12:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795725360; x=1796330160; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GYQ/8mRa+rNincTB4E2wqlqplAQOpEoznj3zJjc2l9I=;
        b=p9YDeoynJRRLZkjm3Pq0fRJJKwiaE3r/k6YyK5dPGrf4UN1qeullYvW5SXOrvD2j/6
         SH95ZH0HwJKiB+fXDviEG6Czg/24SlMpcDc3l/0HaTAog47lnmfeaFOkQ0VpH7BcLAbl
         sZpLEHxygxzltw6lI2oUKWKlK0sAWTU/sHJpX4K3TmCycKK9vVryFQA6/irD54koRBCB
         gnLbi4wojwjpmm7RBtZMlEcHq18sCWCjRN8mqFBamZlrt6nriCzaLDOOXnxBp7nAXh6c
         EFb6Pe3rXXQpIkCLXYtMLXKEOK4vZzM5pFN1kZtBWS3wUFXrOPJNw0EP8/Gfj208powb
         AOuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795725360; x=1796330160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GYQ/8mRa+rNincTB4E2wqlqplAQOpEoznj3zJjc2l9I=;
        b=iEnp0ACP2BGsf4UhAumKjUQ89+GgdwkBpnTCkeve9u0x+TIS19NYk7xD5JjGkZJUIo
         Qj8CUzyyeI1B6R6UZg1cKG8d0gzIJf2QVVAuEVsjDqiqpVOkE1dX23K4J8EzgKPSAkrP
         I53vJV5R4nHARyERZ2cuSA5kjOZY0Gf9BLi5nPpJsOrMQBLv/wk9JxX6xJLbPu4Fpuup
         buix3qsoJ7wQ6k2hRAvWpGUUXYIenzvWyijyrkONKaQQAaIbO7Pr4VdxgVBdf84OW4VH
         /FnYUjX1w6tRi4NbS3YhP4xxM2QF0K2sjEtxUUMHmZ05/O3Hh2Umn9B3xN8Sz6HOo5NQ
         rOfA==
X-Forwarded-Encrypted: i=1; AL+hErFJCtHruJU8SmoQqV4kA0xLKIOE8UpExnj1dqjLEUQ9bF71wAFY681z/f5YFzoGENNd3aQpu/uMbP4XTQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z8DFIFyoIBK+cqqD3QJPmh2rKXvX2KRDzTJHyNWcvAyfi2w9G1l
	NyaPKIBK/rDUrfmfm4lGkVfQiilKuO0cS6BSQp1XlqCD9ZQqmD/dk+Yl
X-Gm-Gg: AZFdTZf/jwN8/h1ZFKafTZsTayT1hWit+ZVAK99/HSkOSWnSf2K9cJ3w8W9xQRdDedV
	fqdKL3FULGdy1rddl2YRrX7MutF3MnQAvBfygkOHvWkUMJLAzbl53xKGFdLd6wF2cTngTWRZYw0
	iWL631XqJPfXpbH7LjFH8n9hCSI+x5zZ28lLn/1tTRtog5bacghcJBcZoBuGz3e+eqIzv25FaGX
	KuLg/Qwm6U9MMvy42XUlMOIHUKpg8GpYQ3qqKSnPlcH4skAIbEn3XmHK71SnFZM+HH+NI35dr6X
	nnJZJzCZzKI6KByFi6CBQPA5fZUJjwwuGNrmNOhEmd8AfpHb60bpRdX+i9zfFwxwKURYMSoGTuo
	6ECG1w2r/PHQioak5mmrTXmDaAfK070tAFOksxyQYkMJtWryYIbA/hxpAeWUUx1Ibv1eYVFyVPH
	MNxd+AOSoNIrXjsgyetrJwOO4CpJ9QZHaw1ZyzoqYcjx0Mu7+ldKqy+mwVqkOWi8IpC6xwZryE1
	lYlB0dBYGi47cZLlqZdddHCjIfNWk42XmU0ieRqFM5LrIIfOTfbCoQLudiPMf+8V3g1OZGNcFQ2
	rmQhCDJI+oR0UiUx4fvNm8dBnspcTAX8tpW4MvRl3/vT605Al6JmGYR2t+IPRW5FJSWZALPoxmn
	l0KBf
X-Received: by 2002:a05:6808:13ce:b0:4e5:c2b4:33a4 with SMTP id 5614622812f47-57a0c6c0ed9mr23486300b6e.50.1795725359663;
        Thu, 26 Nov 2026 12:35:59 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5ebdbb4fsm18636738fac.5.2026.11.26.12.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 12:35:58 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Cristian Filipescu <filipescu.cristian@gmail.com>,
	Norman Herms <dockseed@proton.me>
Subject: [PATCH v6 4/5] arm64: dts: allwinner: add Radxa Cubie A7Z board
Date: Thu, 26 Nov 2026 15:35:56 -0500
Message-ID: <20261126-a733-cubie-a7s-dt-v6-4@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>

Add the device tree for the Radxa Cubie A7Z, an Allwinner A733
board with LPDDR4, a microSD slot and a 40-pin header.

Enable the UART0 console, AXP318W PMIC on R-I2C0, MMC0, RTC and
green user LED, and describe the board regulators and pin bank supplies.

The device tree is based on Enzo Adriano's Cubie A7S board description
and has been tested on A7Z v1.11 hardware.

Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
[enzo: use regulator-ps-output to satisfy the DT schema unit-suffix check]
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---
Changes since the DT series v5:
- Bring in the standalone Cubie A7Z v2 patch. Rename the PS supply
  node to regulator-ps-output because the -ps suffix is matched as
  a picosecond unit by the DT schema. The regulator properties and
  connections are unchanged. The hardware report is in the cover.

Link: https://lore.kernel.org/r/20261125131435.33190-1-vinicius.eduardo.pedrosa@gmail.com

 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun60i-a733-cubie-a7z.dts   | 349 ++++++++++++++++++
 2 files changed, 350 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index 9d1e740ff19e..62fab1d727d0 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -70,3 +70,4 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun55i-h728-x96qpro+.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-t527-avaota-a1.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-t527-orangepi-4a.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun60i-a733-cubie-a7s.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun60i-a733-cubie-a7z.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts
new file mode 100644
index 000000000000..049e6b67c23a
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts
@@ -0,0 +1,349 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+// Copyright (C) 2026 Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
+/dts-v1/;
+
+#include "sun60i-a733.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+
+/ {
+	model = "Radxa Cubie A7Z";
+	compatible = "radxa,cubie-a7z", "allwinner,sun60i-a733";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	osc32k: clock-osc32k {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			function = LED_FUNCTION_HEARTBEAT;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&r_pio 1 2 GPIO_ACTIVE_HIGH>; /* PM2 */
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
+	/*
+	 * Discrete SY8089 step-down regulator, present on v1.11; v1.10
+	 * feeds BLDOIN from SWOUT2 and CLDOIN from PS instead. The schematic
+	 * names this rail LDO2V5-INPUT, but it is set to 2.4 V.
+	 */
+	reg_ldo_input: regulator-ldo2v5-input {
+		compatible = "regulator-fixed";
+		regulator-name = "ldo2v5-input";
+		regulator-min-microvolt = <2400000>;
+		regulator-max-microvolt = <2400000>;
+		regulator-always-on;
+		vin-supply = <&reg_ps>;
+	};
+
+	/* PMIC PS output, fed from the DCIN pins. 5 V is nominal. */
+	reg_ps: regulator-ps-output {
+		compatible = "regulator-fixed";
+		regulator-name = "ps";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		vin-supply = <&reg_vcc5v0>;
+	};
+
+	/* Board wide 5 V supply from the USB-C connector. */
+	reg_vcc5v0: regulator-vcc5v0 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0-sys";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+};
+
+&cpu0 {
+	cpu-supply = <&reg_dcdc5>;
+};
+
+&cpu1 {
+	cpu-supply = <&reg_dcdc5>;
+};
+
+&cpu2 {
+	cpu-supply = <&reg_dcdc5>;
+};
+
+&cpu3 {
+	cpu-supply = <&reg_dcdc5>;
+};
+
+&cpu4 {
+	cpu-supply = <&reg_dcdc5>;
+};
+
+&cpu5 {
+	cpu-supply = <&reg_dcdc5>;
+};
+
+&cpu6 {
+	cpu-supply = <&reg_dcdc3>;
+};
+
+&cpu7 {
+	cpu-supply = <&reg_dcdc3>;
+};
+
+&hosc {
+	clock-frequency = <26000000>;
+};
+
+&mmc0 {
+	bus-width = <4>;
+	cap-mmc-highspeed;
+	cap-sd-highspeed;
+	/* v1.11 has an external 10k pull-up on PF6, v1.10 does not. */
+	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>;
+	disable-wp;
+	vmmc-supply = <&reg_swout2>;
+	status = "okay";
+};
+
+&pio {
+	/* VCC-IO */
+	vcc-pb-supply = <&reg_swout2>;
+	vcc-pc-supply = <&reg_cldo5>;
+	vcc-pd-supply = <&reg_swout1>;
+	vcc-pe-supply = <&reg_bldo1>;
+	/* VCC-IO */
+	vcc-pf-supply = <&reg_swout2>;
+	vcc-pg-supply = <&reg_bldo5>;
+	/* VCC-IO */
+	vcc-ph-supply = <&reg_swout2>;
+	vcc-pj-supply = <&reg_swout1>;
+	vcc-pk-supply = <&reg_bldo1>;
+};
+
+&r_i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&r_i2c0_pl_pins>;
+	status = "okay";
+
+	axp318w: pmic@36 {
+		compatible = "x-powers,axp318w";
+		reg = <0x36>;
+		interrupt-parent = <&nmi_intc>;
+		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-controller;
+		#interrupt-cells = <1>;
+
+		aldo156in-supply = <&reg_ps>;
+		aldo234in-supply = <&reg_aldo1>;
+		/* v1.10: BLDOIN from SWOUT2 and CLDOIN from PS */
+		bldoin-supply = <&reg_ldo_input>;
+		cldoin-supply = <&reg_ldo_input>;
+		dldoin-supply = <&reg_ps>;
+		eldoin-supply = <&reg_dcdc9>;
+		ips-supply = <&reg_ps>;
+		vin19-supply = <&reg_ps>;
+		vin23-supply = <&reg_ps>;
+		vin45-supply = <&reg_ps>;
+		vin678-supply = <&reg_ps>;
+
+		regulators {
+			reg_aldo1: aldo1 {
+				/* Port L powers the PMIC's own I2C bus. */
+				regulator-name = "vcc-pl-usb";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			reg_bldo1: bldo1 {
+				regulator-name = "vcc-pe-pk-mcsi";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			reg_bldo2: bldo2 {
+				regulator-name = "vcc-lvds0";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			reg_bldo4: bldo4 {
+				regulator-name = "vcc18-codec";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			reg_bldo5: bldo5 {
+				regulator-name = "vcc-pg";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			reg_cldo1: cldo1 {
+				/* LPDDR4 VDD1. */
+				regulator-name = "vcc-pm-lpddr";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+
+			reg_cldo2: cldo2 {
+				regulator-name = "vcc18-hdmi";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			reg_cldo3: cldo3 {
+				/* DRAM PLL and PHY 1.8 V. */
+				regulator-name = "vcc-pll-dram";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+
+			reg_cldo5: cldo5 {
+				regulator-name = "vcc-pc-combo";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			reg_dcdc1: dcdc1 {
+				/* Board 3.3 V loads and the SWOUT1/2 input. */
+				regulator-name = "vcc-3v3";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			reg_dcdc2: dcdc2 {
+				/* System and DRAM core supply. */
+				regulator-name = "vdd-sys";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <800000>;
+				regulator-always-on;
+			};
+
+			reg_dcdc3: dcdc3 {
+				/* Powers the running Cortex-A76 CPUs. */
+				regulator-name = "vdd-cpub";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1050000>;
+				regulator-always-on;
+			};
+
+			reg_dcdc4: dcdc4 {
+				regulator-name = "vdd-gpu";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <960000>;
+			};
+
+			reg_dcdc5: dcdc5 {
+				/* Powers the running Cortex-A55 CPUs. */
+				regulator-name = "vdd-cpul";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1050000>;
+				regulator-always-on;
+			};
+
+			reg_dcdc6: dcdc6 {
+				/* DRAM PHY supply. */
+				regulator-name = "vcc-draml";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <800000>;
+				regulator-always-on;
+			};
+
+			reg_dcdc7: dcdc7 {
+				/* DRAM VDD2 and VDDQ. */
+				regulator-name = "vcc-dram";
+				regulator-min-microvolt = <1100000>;
+				regulator-max-microvolt = <1100000>;
+				regulator-always-on;
+			};
+
+			reg_dcdc8: dcdc8 {
+				regulator-name = "vcc-ufs-io";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+			};
+
+			reg_dcdc9: dcdc9 {
+				/* ELDOIN input, needs at least 1.2 V; firmware leaves 1.24 V. */
+				regulator-name = "eldo-input";
+				regulator-min-microvolt = <1240000>;
+				regulator-max-microvolt = <1240000>;
+			};
+
+			reg_dldo1: dldo1 {
+				/* SoC eFuse supply, no consumer is modelled yet. */
+				regulator-name = "vcc-efuse";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+
+			reg_dldo6: dldo6 {
+				regulator-name = "vcc-ufs";
+				regulator-min-microvolt = <2500000>;
+				regulator-max-microvolt = <2500000>;
+			};
+
+			reg_eldo6: eldo6 {
+				/* Standby CPU and USB supply. */
+				regulator-name = "vdd-cpus";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <800000>;
+				regulator-always-on;
+			};
+
+			reg_rtc_ldo: rtc-ldo {
+				regulator-name = "vcc-rtc";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+
+			reg_swout1: swout1 {
+				regulator-name = "vcc-pd-pj";
+			};
+
+			reg_swout2: swout2 {
+				/* VCC-IO to the console and microSD. */
+				regulator-name = "vcc-io-ph-usb";
+				regulator-always-on;
+			};
+		};
+	};
+};
+
+&r_pio {
+	/*
+	 * PL powers the PMIC bus itself, so firmware must keep ALDO1 enabled:
+	 * vcc-pl-supply = <&reg_aldo1>;
+	 */
+	vcc-pm-supply = <&reg_aldo1>;
+};
+
+&rtc {
+	clocks = <&r_ccu CLK_BUS_R_RTC>, <&hosc>, <&r_ccu CLK_R_AHB>,
+		 <&osc32k>;
+	clock-names = "bus", "hosc", "ahb", "ext-osc32k";
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pb_pins>;
+	status = "okay";
+};

