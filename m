Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793413621;
	b=SNfb4uVDFZvvyTSCfpszHDDlk/Lk54ZXrhKslUUhPqc79eu6D1Kyswwzb6MGavkwMlN4
	 1J8iOwYD80ICl2a5i2znhTfrH5PRUrFPOE8nOyHFO9i8YOPD9SyLfaYpHRH6egv8ALHRg
	 FV0f+eGEZy9ypDnOFvAvGZKUXu06+0av9M0XNRwg5hp4ecW9UjBx7EBh/aUUcT+E2Fyho
	 5O+G/AKS3XOGMxLFatwQuG6LFgVb8ELzF/xCM4jrUNCAb6goWCBvRXV6oeAs1zCYIU9sG
	 tD/swp16b13FgYXvyjgvyV2F7wvz8vu+SR04QG0jo9onq/RG8E8I8QqMFzJjclXck2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793413621;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=gupym1n+xeYfXlKxr4mVV1r8LeK87CtMgPULEvE3iVc=;
	b=MMVJOyvXGRnXPBZt00p1VaC2nfpr1LM20Wi7143Il8nr67OA9hMHeQT5pWOSQahfheWy
	 zyh4nqMloRMwPglEgZXtSu6OE7mtcUBA4JyqsmiAQkyzOFqoJsR+4p+FSlQ+lAC5yztLg
	 op8l5cwNfYaElNrISo6rTazTfo/7O8oGf0HmiwaVzxwBT06JzwFDcvA/lXdZxhWN9JVSp
	 YjyMZObPsviuaJy4mM6UxEspVO3m9cSmxcD4e4OBxYHv40tqWrsWrLyc0H5Udcx8C+lmP
	 Oo3kXl6VcIwzz6asCCvLkocYkdHSvzaPvikzI6UJInBbb1O4XDdM8nDDkbp+t86Jpqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BhcdwPO3;
	arc=none smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949E6606A327
	for <linux-sunxi@lists.linux.dev>; Sat, 31 Oct 2026 02:27:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 949E6606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BhcdwPO3
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6f5a0893610so1061584eaf.1
        for <linux-sunxi@lists.linux.dev>; Fri, 30 Oct 2026 19:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793413619; x=1794018419; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gupym1n+xeYfXlKxr4mVV1r8LeK87CtMgPULEvE3iVc=;
        b=BhcdwPO3K4GaWmGFDtLKEKF6FVpVxP99vdyJPvBnNCSXi06pAR+Hl9ILhPd4IYDFQ8
         3lY7H4d8XyaNqO9vqYrzHfBqcb+sf/YKKWexEAQRIZDyf1QfjrJnNFp2RluZBdzhJEF/
         RmzbmpIfHOiTFUr3dLJENhO3S3QItKnoSv0bncbmkg9DeJVh3sOmvKufX+j9biXlCHDP
         lmFo32PaX78OwOOt8dQlCwQoakoPeTR/8Gn2Z9PZWQwN4FMz8lzegkDlleHTLAHhcOfF
         uNIAKk74D/z6+5RxWr9uiIZ2VPm8beT/lol835i1Tc19jz/70rFADlSfmiiaMnyi8jgH
         foew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793413619; x=1794018419;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gupym1n+xeYfXlKxr4mVV1r8LeK87CtMgPULEvE3iVc=;
        b=mbKUDYxhNP+7lqJDlraJuMx8+QTVqCn61UjwQNEoGY/1AiDk6CDqPyIFCT4WJhiR8W
         r1j3zQKlAO9t3QnzWhag+A4cFgK6Oc8kwHbwSmQ3gN+WqNSVay1B6vSguDQBspGauVEg
         z3FRaoeLYYVQe0Iy1O2j9MVjXlq8GKXkXOm6ZVDOzVdulWJ9EJnIBiNMmZBTT3DE8uZq
         MwP3j8A2Ps25JTllbPq7Xie4lxKPQE+xnHqWYDa5xCA/xCvIy9f95RwoQBnzE9bp9TPS
         dhJUUmf0+5/2TOBcKeYclhOISWIrW6aPXZWS0bKXdFPdQ24y4CawSXw+8YeLPQlegaR5
         xraQ==
X-Forwarded-Encrypted: i=1; AKwUvBwmXWJkO3GigPGZBnyNrc5RKlLtMCNESJGAWA7s2V7HD2G0LojS6t8tAe4d0BWdMagasrb5O8BM3mrCIA==@lists.linux.dev
X-Gm-Message-State: AFq9FYIzjCjMCvVdceAAeraICEGatOZHZGfnFH069h9V+I57dL9XeBTv
	96gB9dOLAirRnzQnNZGAKldir8cInGNTNqCm3p+VTJc11qDeebLkUS1E
X-Gm-Gg: AYBFou0Qo8qBBukLnDJjnFMnPqEnhLB6xBzSDWYo8tMf2WTuIy42mAM5Yo86/ki1KQP
	gO09gOFISkfR7aUCIAMrVWd9kbx3XqJ3DPief5JqIeckMnQeneoVAMES4PIM30kGRnRGg5nfkRm
	9adumvv1blX6WbpNwhD5O/aBnb0JIof8YFt7P/25b+csWFmzQPWh6Z+/5DzbwEvJiycPGpzdNB8
	IwOryJKU++gwEJ7eqAqzfqA1pHyHJzc7ijnnXtX56+lr5SgFHD9XLrBR6TyaGXLCb2MKi0yU8I/
	O/W5ZWBE7ihYSKO1dJN3yHhJktBN+1rjVNfbF9p8gFVbexEcrJ9+7WzOfZZh4MPkZNAKptGvxhD
	jPTENcoIOfW2JJ9Ns7hpKJRnagJaFlh4freVB8/y503poQqaH36ETrMIZTa4a1yPbNX2EZ9QVvZ
	tpH9xLCWsP72WbM/654XL5pLzcEQqgrvISqvBabikG12Sb9cjrcGSLdv1Jh8zYIMeim9Y5NSUhb
	Kd6uWHo/5k39qxT7DLh1sWC1QD05n/2JR61Y8pj+51TE0191ZM7p1MoxygR6IadfSz+3bwN9u6D
	MDvkBm/hdnC2MLXfaNMLwRb32+bm5LIjU/RO1Qi1bzOJu3bzKnwmVHc8uMlrznJNCEYmebWpep7
	xqa58zajz+ZbgrjpyNLuVfoIXRAk=
X-Received: by 2002:a05:6820:1384:b0:70a:12a9:c43d with SMTP id 006d021491bc7-714f2988c22mr2274753eaf.22.1793413619538;
        Fri, 30 Oct 2026 19:26:59 -0700 (PDT)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354d12f2sm3401232a34.17.2026.10.30.19.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 19:26:59 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Subject: [PATCH v2 3/3] arm64: dts: allwinner: add Radxa Cubie A7S board
Date: Fri, 30 Oct 2026 22:26:57 -0400
Message-ID: <20261031020640-263f7b05-a7s-dt-v2-3@gmail.com>
In-Reply-To: <20261031020640-263f7b05-a7s-dt-v2-0@gmail.com>
References: <20261031020640-263f7b05-a7s-dt-v2-0@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Supply the 26 MHz crystal and 32768 Hz RTC input, enable UART0 and the
AXP318W on R-I2C0, and describe the schematic's PMIC input/output and
CPU supply connections. Preserve firmware settings on rails whose
working voltage is not established. In particular, BLDO2 has no
programmed voltage constraint: its software 3.3 V selector does not
establish its physical output with the schematic's nominal 2.4 V input.

Describe the card's SWOUT2 supply and PF6 active-high detect with an
internal pull-down. Enable MMC0 at up to 50 MHz using 3.3 V signaling
only. Its high-voltage path uses VCCIO; CLDO5 also feeds PC and the PF
1.8 V input and must not be raised for SD signaling. Firmware must
select the 3.3 V PF path; dynamic voltage switching is not provided.
Keep other storage off.

Connect the documented bank supplies. PL's self-supply phandle is
omitted to avoid the PMIC/I2C/pinctrl bootstrap cycle, as on the
upstream Cubie A5E; ALDO1 is retained always-on. The separate pinctrl
fix is required so these connections do not trigger incompatible one-bit
bias programming.

AI assistance: Codex:gpt-6-astra.

Assisted-by: LLM
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun60i-a733-cubie-a7s.dts   | 284 ++++++++++++++++++
 2 files changed, 285 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index d1f768dd6461d5a40537473fc62da6ba6a0d82c0..792152525b433b0caa5118ed2669f548835717e0 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -68,3 +68,4 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun55i-a527-cubie-a5e.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-h728-x96qpro+.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-t527-avaota-a1.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-t527-orangepi-4a.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun60i-a733-cubie-a7s.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts
new file mode 100644
index 0000000000000000000000000000000000000000..341c24360ce29e29f8fc4631924eaf48b7b1f809
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts
@@ -0,0 +1,284 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+/dts-v1/;
+
+#include "sun60i-a733.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model = "Radxa Cubie A7S";
+	compatible = "radxa,cubie-a7s", "allwinner,sun60i-a733";
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
+		regulator-name = "ldo-input";
+		/* ETA3521: 0.6 V * (1 + RP298 / RP299), 30k / 10k. */
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
+	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_HIGH | GPIO_PULL_DOWN)>;
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
+	vcc-pf-supply = <&reg_cldo5>;
+	vcc-pg-supply = <&reg_aldo1>;
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
+				regulator-always-on;
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
+			reg_eldo1: eldo1 {
+				regulator-name = "vcc09-vdd2l";
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
2.53.0

