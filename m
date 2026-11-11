Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794404987;
	b=aJQdwkgQNVUVyVTFSYc/w2XMGEXz+DdDqc0Vs2dtKkXgQ88x1YI23+7KdqZGRp7E4Tzk
	 U02dFupek2chgGuJVBKwPafel/nEG0rt0Iwrf4yY9Eh2UrTdiHl3upArAVP+1ECl/rwUB
	 YIPGEaG3rAkhwk5GmMJBQxXyGGAnn5A1NEmZlCU6KgoP7jQDeMy5Irzvk2HUuQmkGhrDc
	 JId3TKlrQIf2oJfee4+kJaIedsfYOBFA9Do3J3sIz3MJ5RL3AtDOArLHDZwf93WFj0VQk
	 ZP55IDcGv50BftFaDBW/E5GFazwB91LK4h6Uha8pSCH+6ncolRTFHimYlhzEZK1Y8nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794404987;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7fnh/1KmjFjEPtr//fod/I5Z9kbTxg0SKyfXY+qNzcY=;
	b=nvSO2WmxgAvcHqpNAH0QNUsnjrdo+TKIYU/5LIPbDYwnPr9GRV7oWhF7RdUohk9aNav3
	 01eNrrgS/CTJJEFS5TOZQopL7UpfxqOr8FpOHnPn3ghEAklH5unc1P2mwUz/pKE3s/DmH
	 S4Dhj/v6kwOYS/G9/1hFEyzUcxzvF1dp58Q/D6XFcV0BfTlUTUxgApo3UjU08TM6A38t+
	 z+6V9n8Pirr/YoeVzBpSASuSFS6EDKAA4lmKwaWzgTh612py+639YZ7c+UKXYQt0hdlKT
	 H3577/inwcZb8Hp2b/TuPR8cn0U1yG3neeJLCzaDN0gwIDk1BslTpP6ysM8iFAtGfsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AdQCwNlM;
	arc=none smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9AF606A8A5
	for <linux-sunxi@lists.linux.dev>; Wed, 11 Nov 2026 13:49:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB9AF606A8A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AdQCwNlM
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b335eeb340so26627127b3.0
        for <linux-sunxi@lists.linux.dev>; Wed, 11 Nov 2026 05:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794404986; x=1795009786; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7fnh/1KmjFjEPtr//fod/I5Z9kbTxg0SKyfXY+qNzcY=;
        b=AdQCwNlMBgLJ/zAkNsDP45sZmXNH8QgWursZOIjTEfp/HjbpDJILxDapjodYMa38Zb
         UxQUHBeWrNKNbcXjQuuogU49yAn44YUhFMEIN0N+7HHr7qIDehaqKdu3T/E15gyxmpRl
         SVIAluADabmQd+EuV1nOQzq+gHyoGR7U3ScK9x/baSQRkBqC6p8RvgL1bNfJCR1G7jw0
         WFhP9uwHQMw+00IWbUHzi9qQWE0tfZtyG3pEfyweqMqa7BazisO/MQO5/M3Oab74luFy
         FIikd8PX5pYcRCnInpKEk2rI+T+O6UMwb4m+h94n1Y3jcaVwo58Az8oRg1Xtoqfap3pS
         xSTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794404986; x=1795009786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7fnh/1KmjFjEPtr//fod/I5Z9kbTxg0SKyfXY+qNzcY=;
        b=kFczlkk9TWvyDe1i38XOVtFA0owSTHlNyUTnLUswWNxF+FgYiMpOPDeFyHcN99/J57
         5XFymHui3KNWT9EEmJwiZUIoAT5vyDlwz1LSpghHujKoX4oRQcvjr2hfFO/0/ec9HAA+
         TNjAgp3KUF4InbvmH8SUsjVEsTZsUMF3/t5ISDs+Gm18So3WQHQDDB8p1/Dg2HzmVMrs
         ECDgooXa3DzLdo/n9GRgCwmsON362Z8IIVf/Rn2sFHpdn+CAJPZZojOgrNdGz3oux+wR
         2H7fiMvH4q8erwm8f+1TGWGgAo01VpteKv2vwJgUUZT1p0EtU6Rx7ckJKiDXVrIkwvEG
         kRPw==
X-Forwarded-Encrypted: i=1; AL+hErEjwuhNC9orhyCWDmaVkQZkuQw+ebCrbOPCYCAeaVwNVtX/GlVsxRiX92T4PWsMle7ZVZnAFG+Wp69vwA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9n+j8r8HyFiKlUEbDu+Hgh2mC3ElOl99RCdopr45y2fa0q5SW8
	8vp1Rk5yRS5oAAOZigdgVzOPWy4zJ7tv1iAqrg9TL4yYrdoXc2F4nwMu
X-Gm-Gg: AYBFou1Y9GlqPiaXjiyTM0EZTLIZ/KSDaB6ALtU9b61Vh5uf3X1GnafgFWdbkF/ZqfV
	uimYGeALzIIw0JrTFvqn2JxUB41FT5bFWYXjROLwV4n8Fdu61tC/hmKvcj3nLPCeWRot9/VC/ud
	YU1a18lFQcVKY0QUORKJNez7lIgFFvcy9aQB+QPsc1z5Wnc2Ia1Fd3s5ltg/zefTYtzmb/JRT+J
	MiIgVdfLh6fFSR/psN7N4MOKLETFNVeBMNAq9Q2XFTf7jiQp4d+h/WnGaN6XunN5rnq0A8FU2Kr
	Bd0fxnyzIxU5hyCh2Q/kYBV15MW4z/DXh9Mgqcw8po9nDy4B7Z+smaVmdJhmWe+tssK4WQvZC3+
	zje3sHnVhYQEeWinC0qTh1IEIODI6rchD5+gPhppmjn7E5ku0ndzLnc7ONQffH0kfvKO8eAL/qM
	bY+Hksw+QWHFcSO3q99U4KOEXEHPz78QHy6NvjiXpW2yR2GhUSGoBXifblC3XtJqFPk1lKr6rJH
	b8INf7E8D4XSHZ44Hld8uDu0fvYUL5lp2YRU19O1iBzqwqN9mUSS9rYhzoKfaE5tFvDug9GY5/t
	LDxfz3vD0Ta8KFlsUmuYzQ9Tf1I4aoh94bbzbGLJUIBI/BLy9QZH2dhovS53dsjNqz6zceB1b9N
	+Iei0qETPnwr6Z6KRfxl2OrJkzCXk/myOQaSahlj8YIlrC/LLrRhPkglYRmTq4r/0tad8YzFXz8
	I=
X-Received: by 2002:a05:690c:86:b0:8b3:2445:889b with SMTP id 00721157ae682-8b3a81d8df2mr17180577b3.91.1794404985437;
        Wed, 11 Nov 2026 05:49:45 -0800 (PST)
Received: from MaquinaLab.. (189.27.147.77.dynamic.adsl.gvt.net.br. [189.27.147.77])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b393426f13sm44519817b3.34.2026.11.11.05.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:49:45 -0800 (PST)
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
Subject: [PATCH 2/3] arm64: dts: allwinner: add Radxa Cubie A7Z board
Date: Wed, 11 Nov 2026 10:49:16 -0300
Message-ID: <20261111134919.90264-3-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111134919.90264-1-vinicius.eduardo.pedrosa@gmail.com>
References: <20261111134919.90264-1-vinicius.eduardo.pedrosa@gmail.com>
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

Add the device tree for the Radxa Cubie A7Z. Describe UART0, the AXP318W
PMIC over R-I2C0, MMC0, RTC and the bank supplies. It is based on the
Cubie A7S DT.

Unlike the A7S, this board uses BLDO5 for PG and a SY8089 regulator for
the PMIC's BLDO and CLDO inputs, and the microSD card-detect line has an
external pull-up, so no internal pull-down is used. ELDO1 only supplies
VDD2L for LPDDR5 and this board uses LPDDR4, so it is not described.
SWOUT1 only feeds ports D and J on the 40-pin header, so it is not kept
always-on.

Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
---
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun60i-a733-cubie-a7z.dts   | 286 ++++++++++++++++++
 2 files changed, 287 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index 792152525b43..2eee91dcbd77 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -69,3 +69,4 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun55i-h728-x96qpro+.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-t527-avaota-a1.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-t527-orangepi-4a.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun60i-a733-cubie-a7s.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun60i-a733-cubie-a7z.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts
new file mode 100644
index 000000000000..ab3d3d70f9ff
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts
@@ -0,0 +1,286 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+/dts-v1/;
+
+#include "sun60i-a733.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model = "Radxa Cubie A7Z";
+	compatible = "radxa,cubie-a7z", "allwinner,sun60i-a733";
+
+	aliases {
+		mmc0 = &mmc0;
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	reg_ps: regulator-system-power {
+		compatible = "regulator-fixed";
+		regulator-name = "ps";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	reg_ldo_input: regulator-ldo-input {
+		compatible = "regulator-fixed";
+		regulator-name = "ldo2v5-input";
+		/* SY8089: 0.6 V * (1 + RP11 / RP6), 30k / 10k. */
+		regulator-min-microvolt = <2400000>;
+		regulator-max-microvolt = <2400000>;
+		regulator-always-on;
+		vin-supply = <&reg_ps>;
+	};
+
+	osc32k: osc32k-clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
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
+&mmc0 {
+	bus-width = <4>;
+	cap-sd-highspeed;
+	/* PF6 has an external 10k pull-up and reads high with a card. */
+	cd-gpios = <&pio 5 6 GPIO_ACTIVE_HIGH>;
+	disable-wp;
+	max-frequency = <50000000>;
+	no-1-8-v;
+	vmmc-supply = <&reg_swout2>;
+	/* The 3.3 V path uses VCC-IO; no Port F voltage switching yet. */
+	vqmmc-supply = <&reg_swout2>;
+	status = "okay";
+};
+
+&osc {
+	clock-frequency = <26000000>;
+};
+
+&pio {
+	vcc-pb-supply = <&reg_swout2>;
+	vcc-pc-supply = <&reg_cldo5>;
+	vcc-pd-supply = <&reg_swout1>;
+	vcc-pe-supply = <&reg_bldo1>;
+	/* CLDO5 feeds VCC18-PF; the 3.3 V path uses VCC-IO. */
+	vcc-pf-supply = <&reg_cldo5>;
+	vcc-pg-supply = <&reg_bldo5>;
+	vcc-ph-supply = <&reg_swout2>;
+	vcc-pj-supply = <&reg_swout1>;
+	vcc-pk-supply = <&reg_bldo1>;
+};
+
+&r_i2c0 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&r_i2c0_pl_pins>;
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
+			reg_dcdc1: dcdc1 {
+				regulator-name = "vcc-3v3";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			reg_dcdc2: dcdc2 {
+				regulator-name = "vdd-sys";
+				regulator-always-on;
+			};
+
+			reg_dcdc3: dcdc3 {
+				regulator-name = "vdd-cpub";
+				regulator-always-on;
+			};
+
+			reg_dcdc4: dcdc4 {
+				regulator-name = "vdd-gpu";
+				regulator-always-on;
+			};
+
+			reg_dcdc5: dcdc5 {
+				regulator-name = "vdd-cpul";
+				regulator-always-on;
+			};
+
+			reg_dcdc6: dcdc6 {
+				regulator-name = "vcc-draml";
+				regulator-always-on;
+			};
+
+			reg_dcdc7: dcdc7 {
+				regulator-name = "vcc-dram";
+				regulator-always-on;
+			};
+
+			reg_dcdc8: dcdc8 {
+				regulator-name = "vcc-ufs-io";
+				regulator-always-on;
+			};
+
+			reg_dcdc9: dcdc9 {
+				regulator-name = "eldo-input";
+				regulator-always-on;
+			};
+
+			reg_swout1: swout1 {
+				regulator-name = "vcc33-lcd";
+			};
+
+			reg_swout2: swout2 {
+				regulator-name = "vcc-io-card";
+				regulator-always-on;
+			};
+
+			reg_aldo1: aldo1 {
+				regulator-name = "vcc-pl";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			reg_bldo1: bldo1 {
+				regulator-name = "vcc-pe-pk-mcsi";
+			};
+
+			reg_bldo2: bldo2 {
+				regulator-name = "vcc-lvds0";
+				regulator-always-on;
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
+				regulator-name = "vcc33-18-usb";
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
+				regulator-name = "vcc-pll-dram";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+
+			reg_cldo5: cldo5 {
+				regulator-name = "vcc18-pf-pc";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+
+			reg_dldo1: dldo1 {
+				regulator-name = "vcc-efuse";
+				regulator-always-on;
+			};
+
+			reg_dldo6: dldo6 {
+				regulator-name = "vcc-ufs";
+				regulator-always-on;
+			};
+
+			reg_eldo6: eldo6 {
+				regulator-name = "vdd-cpus";
+				regulator-always-on;
+			};
+
+			reg_rtc_ldo: rtc-ldo {
+				regulator-name = "vcc-rtc";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+		};
+	};
+};
+
+&r_pio {
+	/* PL powers the PMIC bus itself; firmware must keep ALDO1 enabled. */
+	vcc-pm-supply = <&reg_aldo1>;
+};
+
+&rtc {
+	clocks = <&r_ccu CLK_BUS_R_RTC>, <&osc>, <&r_ccu CLK_R_AHB>,
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

