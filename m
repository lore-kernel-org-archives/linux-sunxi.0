Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285927;
	b=uYpdcHxTl9YUDMDVD93Z8j1leCj6csksfJsDk+CHSIBRfdFs8Meefzlhi+yASDTYZPCK
	 WQo7TjgKPfvC6sB7+75v1cq2ToPoEyYxp2d6XDBUy8xG4qHU3KpP/ofcN1ao7W5mk3M1j
	 ND0I/v+LC4UZ/5ZvMqOj0BOjRiHDc74/68vpiPH6yEaGu9YphE1r4siXRvgThfxWt1Y2H
	 xbhSJO2aQMe7B+RAaAgDKUtItaNQf9aBmkVp5Qo1NaK4KqjqgK6qmF+xZMf8Z65b9gwjh
	 qiIWqhi6VyA0BpuKg4pJTYTalwp7wb1oz8wwktD9R2qylLwF8N5SNCaAG4Ew+fJ7dSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WI5auzUgMsI7bnDaCKGTvoflozZvYIXMyJqprDk664I=;
	b=xUAnyi/K9eKS6dholxUj02GWYM1M5hQNK8w9mcP6D+Z8/fciA6UhlXWfDkOEduYjHrQE
	 xKqVgMi0ih9ttpgh40GPe78MjC6ReeePSouFdMlHrLxjs63SgReY40PD7Vll+Mi6tuKcI
	 FFHBRaEC2ErO5rJkMQAw8i9v7dNZcqXIhf+z51w0dblgtwWCZZ0XjaI6tY3c0ceEwxTiA
	 f60p+0/lXZUpoUeTddbH07nx1etug3izSjiSqm0x16I0xNeHrsZomWynM6zo9jEOJ29jT
	 S1McgLHuggFiJtGrMatWHO3WEL/YYjII6hedKuKXSxw38bc/0t3WINCnZ6A/T9PcSEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WQX30MS5;
	arc=none smtp.remote-ip=209.85.160.45
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CDF60A260A
	for <linux-sunxi@lists.linux.dev>; Tue, 10 Nov 2026 04:45:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89CDF60A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WQX30MS5
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-4877837890fso864337fac.2
        for <linux-sunxi@lists.linux.dev>; Mon, 09 Nov 2026 20:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794285926; x=1794890726; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WI5auzUgMsI7bnDaCKGTvoflozZvYIXMyJqprDk664I=;
        b=WQX30MS546vUI4KJF95X2Dokf2FtQGF8VuAJ6zQ7lAnYXJ8ggwH8n5UVoEgM0Fmfv4
         j7WYmEl1WmtC/hm9l8rX52Lp8PXN8R/QixRmU+ZzWNjN+GIHUwhTC5H5QmfIUoh9RLVm
         zr3iGbgRiuDTpODKnYHoRPGCMGE70Plqkaht9PDyJMAer4xRa1Yw0zH1YGkSnXClxBgy
         eId16WhHO14qoyHjvwqxUdmBYwo9cxJV+qo0yjnyZUtnhjn8BNH18wmWx0vdSZP5jVia
         1Mzrp3PoLkSYJOJsbgh1hVnOvVQQhvUPq+/H+ONGSdCDoVoMXTDe+j/dxangNk85DUbw
         6jnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794285926; x=1794890726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WI5auzUgMsI7bnDaCKGTvoflozZvYIXMyJqprDk664I=;
        b=BwKa86RfTH94T390b5MNRr5AXxXL5oVNTKhb5J3ldezXr8D0hsXps2W5y9mF+S7P2C
         8dX+5vYZ2MXozKmwHtXW35XyksGVlDUEKzzyCGn8D17d9rfUrhEoVY3Ql3D2bx/Oqu77
         UPb/r4YDioTzijeG3F1Q2omEFlfkc9utOrm1IauvBX/yKaS06Zmxte+4dCs/01EtKfPK
         3uvjzsk/KGZML1YfzGPz9wXrHlcTWxHs1XlT5oeguZI8fmRwJ50Eg6D7QdHGFQB1durC
         PXJthjh5JndyfKesd+lLTPJgtGh6zCGGHNT3h0gB84dmt7rEng8rDjJ2Ju7+vdGsWPEC
         dA+A==
X-Forwarded-Encrypted: i=1; AL+hErEC52W+HIoqmI7Pe76wnPFKVANsC1Kka6S0LCocmTInOniEa9W1niHZYu/srtQ/iW2xAARhRd5HOocLww==@lists.linux.dev
X-Gm-Message-State: APuU4Z/spUxUHQwgOhc3XBUdjGdduE0MbFrK1YWKXUOKWVZjdD8+8eOg
	0v+REIPbZpGego79A2LzYlSAHybtSDcJtlm4e6qnMLN8zzEN7FcVOFAB
X-Gm-Gg: AYBFou1Mxl7ERdussL1zSaQEKX3GWfLmcJEKVaSx4wmrkAMAMWmKipmRYS6pAvb01JM
	8j9NucHnJ4DTtaK8uyaSnBc/qryN/QQT6wlj7y7/NmIpO95gfykuP8muNMUfT1FiRGY1b22xjz+
	huyx+nvoLYzGgrpoYnd7DIk5KviyxUQuz1N1M8OG0DPckdRCJfmI0JEO8AVtV7eWrlWUiMg1Fvb
	7aMfXtTq7qtEMrB1wU055zR1dWrqWZrS2ccTSdJ02zubocjpvxBCwJs2sQwj++3TRg5KUuuPmmn
	h5esL7CU7cvgGz4Afk7uriBHPzY0htmAm2gSg/Fb84zZgFVMVD5xTku0fvnWiiawioyn6HdbQZc
	nk32au9Zs0zUPF627TiJo2WqZ9Jd80Yhc16GyyUu4rBqZ6yHLdNI7zPK79qfPYDKNBHrpLfLPL9
	x5R7R4uesLXcpCPD4b0Q75edZBUSYgN3ZN2PCubWnumoFEK47ibfBFfmmq9N58Qpx+z1Ec/REnr
	D4xTsBXGbw2Tk4Dj742szVtqD9zbPjQy587dpx6566WVSWNP7ellYjJSZTc1/eOWg53UH0BtL0c
	r7QCA90vlisNKMC/671BFx4MQUBJYSLwkQtNAnJQofWstun7tDyeHxFIEf5rxWgawDbZEmH/X8l
	46oobiQ==
X-Received: by 2002:a05:6808:1206:b0:53a:ad3c:17aa with SMTP id 5614622812f47-5683cd9c0e2mr1116024b6e.55.1794285926367;
        Mon, 09 Nov 2026 20:45:26 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-568f083d000sm1258723b6e.0.2026.11.09.20.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:45:25 -0800 (PST)
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
	Lukas Schmid <lukas.schmid@netcube.li>
Subject: [PATCH v3 3/3] arm64: dts: allwinner: add Radxa Cubie A7S board
Date: Mon,  9 Nov 2026 23:45:23 -0500
Message-ID: <0fe5938e04cc8a5af3825a0e01bd07b626a15b46.1794227241.git.enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794227241.git.enzo.adriano.code@gmail.com>
References: <cover.1794227241.git.enzo.adriano.code@gmail.com>
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

Enable the Cubie A7S serial console, PMIC and microSD slot to provide
an initial usable board configuration. Supply the 26 MHz crystal and
32768 Hz RTC input, enable UART0 and the AXP318W on R-I2C0, and describe
the PMIC input/output and CPU supply connections from the Radxa Cubie
A7S schematic v1.10. Preserve firmware settings on rails whose working
voltage is not established. BLDO2 has no programmed voltage constraint:
its software 3.3 V selector does not establish its physical output with
the schematic's nominal 2.4 V input.

Describe the card's SWOUT2 supply and PF6 active-high detect with an
internal pull-down. Enable MMC0 at up to 50 MHz using 3.3 V signaling
only. Its high-voltage path uses VCCIO; CLDO5 also feeds PC and the PF
1.8 V input and must not be raised for SD signaling. Firmware must
select the 3.3 V PF path; dynamic voltage switching is not provided.
Keep other storage off.

Connect the documented bank supplies. PL's self-supply phandle is
omitted to avoid the PMIC/I2C/pinctrl bootstrap cycle, as on the
upstream Cubie A5E; ALDO1 is retained always-on. The separate pinctrl
voltage-mode fix is required for these bank-supply connections.

These board DTS bytes were RAM-booted on a Cubie A7S with vendor
firmware on November 4: UART0, PMIC registration and MMC0 read-only
transfers worked. Card writes, physical hotplug, 1.8 V signaling and
physical BLDO2 voltage were not tested.

Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun60i-a733-cubie-a7s.dts   | 284 ++++++++++++++++++
 2 files changed, 285 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index d1f768dd6461..792152525b43 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -68,3 +68,4 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun55i-a527-cubie-a5e.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-h728-x96qpro+.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-t527-avaota-a1.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-t527-orangepi-4a.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun60i-a733-cubie-a7s.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts
new file mode 100644
index 000000000000..341c24360ce2
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
