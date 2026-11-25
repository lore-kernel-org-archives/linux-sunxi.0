Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612492;
	b=LO+y0zcN7TC3Q4D4JD3kr6qUFdUk+TVwnCEbUMb1RxgVm3uNsKmqm6yXhHVqib49NwBC
	 FQ2JwujEf5IH9TQGIiqyw/PNpTLBqwpI/YJ+jJX6aguKW85i+AtMdNjSZnxAh2Xjzjupe
	 nfbfrKCZzMg3Z8fCpByuJOeCNyHbN3hdmEyKdOSAqkB5aV47BMzoaYfBKKkE+SU1clbCh
	 3SkEVeD5VXCH1k2XRpGHVZvB2wUcnDY6g195mnDVcDciHGYopMrvuBoh39nLgtTwGfo0m
	 qgZY8vaY44pFe9NKfxW7BHrbzWcWEmKHpUoQ05a6ULoltSi1hZWcpaPR6Q0X0vzwmMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LRF5QTWppdjUyNg9f7oWi7JO8GIaHo80pSnFUSRChkM=;
	b=xxXzMg1Yxpr8XFZyalY3eLmejar9z8scubGMLGAeIeOzmm9y9A94sPEfkHAm783onE0I
	 bXGpH9pCqxFmQAxQ1NeYVb38yn9lHYQFQA6tsSAt/Rq7qL/6WvtcCXvUHHU8QHK181jgU
	 cJsG2fKNq0Yi/Yp2R3otdr3raSvBHU+G/I3JRxxCDOMPDIAmcyxQhxVTDD7pZVPPNdbnv
	 KzrYCMW/gbDqbvN2tS+o727klH8J5YVUmBeD6P9xwi3XPxeFYQccDfjRMU/pFAtZToI/N
	 t8PbYKywrUshhWkcICI5DPDHoOKHKMzCP9Ia2bOQaDSGNxD4hZTtZ0XGerHGnhIdqZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KmwCM5ma;
	arc=none smtp.remote-ip=209.85.217.51
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AAF606A326
	for <linux-sunxi@lists.linux.dev>; Wed, 25 Nov 2026 13:14:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6AAF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KmwCM5ma
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-7d2bf046d7fso3261593137.3
        for <linux-sunxi@lists.linux.dev>; Wed, 25 Nov 2026 05:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795612490; x=1796217290; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LRF5QTWppdjUyNg9f7oWi7JO8GIaHo80pSnFUSRChkM=;
        b=KmwCM5maYi771g2nsBeMLIL24jRLMbhsNA23emmWAetuCanGM0mXTsC1Ea4ZKTY4e7
         pbqDdRdtvgckVq+Nk8aU3re1ImsRBTa9e/dhRnd+w6qSC2H9ydHUdyHPzjAVsZliDGdX
         pbxunifmuOgxhpewow+jhnq+56Kzza+zPH6P4AGefeakXYG27B+jn7DImo7Z2SJz/qTv
         FxEu2/fQ33tkO57mhi6B2Wvk8OYWLo++fvFyTx9b8RQsi5NXk+Kobm2A7SOj2S4YywII
         gbqgFTPnhyG0RlzKOZCKf9UBv3hj6zsDcYIZJ5ruLDKIyTM5jJVc1PHE4FKArLqQgLul
         KdOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612490; x=1796217290;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LRF5QTWppdjUyNg9f7oWi7JO8GIaHo80pSnFUSRChkM=;
        b=EKmksYTNqkBDu5jEMYMZXAfRWBA2x0BoHdGpasU8LkLIAsge3bvoN1wiBi0Mub+m26
         lToCCbpUWBzmq78OlzwJlS+y8dWXssjmoSAqKVNJwum9Uu88/RmEiw8i4WCvPjnBkGwD
         FsIbywtVhKI0Lt/7vXATu3CL2N368n6rwp84kfciPIpJaPypSG2SmMEPRweXSxrihoOq
         xq//aJei1Fmb9m5Jx9ToTSV2T2V3pQn/Er3dEBSzxsZ3oltwqwlcUMcbglngoqfvqLyQ
         PZoQCwyBD3mXcejjva6ZKJu8tgRZ9IMMmWCaeARoBgClgfBUC1ldOF5ue/L8Q7+nfBg/
         LjiQ==
X-Forwarded-Encrypted: i=1; AL+hErEL9alSXpiLEnxMQAThme/zAWGN7VJxg3Xzkvq9jG81gssf8naE/+veV3C2myZjZQ5St/yT+5Z0DksAJQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z9gxiPXZ3vmdQjJUklBtrVNl18fV+k/LKCAAJePMnOtyC5KtWFl
	rcHeGxR9RXAM/Ry02RMeTH09cpX94ZgChq22cOA9Q4mshrihVbFzz48I
X-Gm-Gg: AZFdTZd3hclzbjZfOL8KPbi3Il+xx3m0EwsHhslFGp0RJP7c6IyjBsbkXg0/KZL+CUu
	HK7HDcRltSuD/SRFgkntWWx/Bj+IPZkkzxPWsP/CQ2SNA/l4P9n6hbZKK+a2RMRj9bb0pykc/NH
	h0kT2AF1w0poQWD9taa+YyoRpW7mPup6cuSAX7gif0mLsTb50CQYCOZLjXje/lg/t/rBIFLU9a7
	b0y0le8wELoCAg4UxDxsGZWiyXXzBlhCE+vot+LFv9tpiZ+744AuS8sxW3/ZBL3S7oxLIez3BLo
	yIji+/8BEgPqksuYfmu94DUC9rKmBoX1MBJ3j6/H4q/N8Cfajovme0/o8DZA7hc4aZIF7lcbPLv
	gObYqSEcUQiTIiA8zxbIlDgrrF3/omhLLbyjPIFQwT+tNKlKefxOk7tF9OHV3wNRIHVTztdJew1
	Np0Z8xAdTtsOgkndXhb10KoDA2K+gacvRUZxf8nqq6tHelkI6ujzCtP5tr9j5KrZfEE2sQNstIn
	vGG7IsnLIDg8Oo5hdwTTBjpafajmwHYxuinSiHuOmwpitTgYZ/zQ5X/7CYlkVddBdZiuhELN27S
	KOBDidwCDj5mzoMKLhFXjR5EmXW5VMFbpV/CaESVO7DcLrp2sH1qErC5AmDIQJZUx3wVTurCr9V
	hcIqCemEMqZ4aPt6rHQEb4pjRNuwq0bShbsMKKMXwLBSGOU9b
X-Received: by 2002:a05:6102:f97:b0:7cc:226a:f977 with SMTP id ada2fe7eead31-7d7396157a3mr8531352137.36.1795612490432;
        Wed, 25 Nov 2026 05:14:50 -0800 (PST)
Received: from localhost.localdomain ([2804:1b2:aa42:30d0:f600:3026:6717:b8b7])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e7fa0467sm18908745137.6.2026.11.25.05.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:14:50 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: allwinner: add Radxa Cubie A7Z board
Date: Wed, 25 Nov 2026 10:14:35 -0300
Message-ID: <20261125131435.33190-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Add the device tree for the Radxa Cubie A7Z, an Allwinner A733
board with LPDDR4, a microSD slot and a 40-pin header.

Enable the UART0 console, AXP318W PMIC on R-I2C0, MMC0, RTC and
green user LED, and describe the board regulators and pin bank supplies.

The device tree is based on Enzo Adriano's Cubie A7S board description
and has been tested on A7Z v1.11 hardware.

Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
---
Changes since v1:

- Fold the LED patch into the board DTS, as requested by Krzysztof.
- Apply Andre's MMC, regulator and pin supply review comments.
- Set DCDC9 to 1.24 V and use GPIO_PULL_UP for card detection.
- Drop cap-sdio-irq after Chen-Yu questioned its use on the A7S;
  sunxi-mmc already sets MMC_CAP_SDIO_IRQ.
- Update node names and property ordering following review.
- Rename osc to hosc to match Enzo's v5.

The A7Z binding entry is not included here. Andre asked Enzo to
include it in his next revision.

Base: sunxi/for-next at 2ba07dfcd45b, with Enzo's A733/Cubie A7S
v5 [1] applied first. The runtime dependencies are the ones in the
cover letter of [1], plus the A733 EINT-mux fix [2], which I applied
locally for the card-detect test.

Tested on a Cubie A7Z v1.11 with a v7.4-rc1 kernel carrying some of
those dependencies, not the full set. All eight CPUs boot, PMU
counting and overflow interrupts work on both the A55 and A76, the
AXP318W probes, and MMC0 runs at 3.3 V and 50 MHz with a matching
SHA-256 readback. Three card-detect hotplug cycles passed with
GPIO_PULL_UP, on the previous revision of this DTS. Regulator cleanup
at about 32 s gave no errors, and the green LED blinks in heartbeat.
The test DTB had a local 16 MiB no-map reservation that is not part
of this patch. I have not tried PCB v1.10 with GPIO_PULL_UP, and
v2.00 is untested.

[1] https://lore.kernel.org/r/20261121-a733-cubie-a7s-dt-v5-0@gmail.com
[2] https://lore.kernel.org/r/20261110130157.112155-1-vinicius.eduardo.pedrosa@gmail.com
Previous version:
https://lore.kernel.org/r/20261111134919.90264-1-vinicius.eduardo.pedrosa@gmail.com

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
index 000000000000..fea9d90d43c7
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
+	reg_ps: regulator-ps {
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
-- 
2.43.0

