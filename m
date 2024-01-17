Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D7822627
	for <linux-sunxi@lists.linux.dev>; Wed, 17 Jan 2024 16:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705509510; cv=none; b=YD5JW7AdWoA3v/1WJfQU6p6fD3GW7+LQa8DDxFatUp5/V+qsu/+CiYm8qNVAkiDCnRdmWQuK9wAMY+757rit3Afuo2ZylhzEDVQhoRbGiwMOmnKG5EFVKTmxPLQK5bcxriNUlUyExDgPNm8/yCO3m4tuXR3H+TbAqBLmp3NQjhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705509510; c=relaxed/simple;
	bh=eXckDmCXknZRoTsequjLg/7ye7USa+9Vf49r1Y8gDzE=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:From:
	 To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding; b=UvRI5qjbcGnsWar5oGfN5fpk2U0B0aU/xZCrOvB4nZ6Y3NwrtMSUNCFnMc9/dMy/GqDZ3C2r2+4Nj59oHjBOMgB2zZ0sVizeLu1I08HFBMYyQ3Ng3VosdspQ6wIgzTF899D4V2RoDcGKyecrW1+Bi8vjSnhNh+L3tmDeq6Sbgik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U4Rs10NX; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U4Rs10NX"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-783293278adso671871885a.3
        for <linux-sunxi@lists.linux.dev>; Wed, 17 Jan 2024 08:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705509508; x=1706114308; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lpSpvdXF/aN1Mwo9ZnYSxkTm8q5Xet2UmvVBXOFYMZM=;
        b=U4Rs10NXSqDH8f7pbOahjjusNjUjrh30nf7DiOmpoprYDkMEidVlsL2PuNCXhTcRyE
         0QsREavNUtdQ+7RR7dwJY1g1lM9Pb3J8akduOSnK258CgQlHwewsQiyEMYFp6TqHHB09
         9Z773f0w+wCa2qJbdAOGXEGSbUG8OQpnJAMkb6uxmyoOdMI+ZzLbh0FPoxmBL7F0/Rl2
         ENliL4AWlYf7WBAj9QEDkzc+V8ymvT4uMhepBbhIVKgKAvBDtaiUk3C+/OhVUW9ZEBOe
         y14MGNfSbDVgK3hNppuWyNzp+tVr32UNa/9JdezgblAwDUy4TSYmIe6Hjl+5aLD5dFS1
         LrHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705509508; x=1706114308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lpSpvdXF/aN1Mwo9ZnYSxkTm8q5Xet2UmvVBXOFYMZM=;
        b=pRcH0+nL/kyeCJbCz8KX/QacQ+hZtf3165IhTKNOz913Mp3NnKwDDyWV7Zy7cT+l2A
         P5QZvBVmy+93eXMYvIRGRZOHzlEh8hGsytssoZtvRWqgt/RLPZmWJ0oAoRSCtvlIQelU
         6EAfRRVFxRUs7CRKWcsCu4qm8tT8SVvtDg8sa9P6M2PjQjUfhtrgYHUFjMUAmYeiGvJb
         2iAQLGt9nE3q0NOwCymOpKcqElZDVAsxW11/QsP43CYPzXGRiewq/EL0kBwwAgCE/Of4
         OOVg4VdX6/eMJmlK7WgSAyDO6LeCNnD7zo/xxl9NsOD3Dh3XHtMhPAVYsu348FNdcaDp
         oiFw==
X-Gm-Message-State: AOJu0Yw+YIYU9mHQaaagmxd9or2LvZYgS3o5Ntm5CRNMphTYKX1IIkQP
	5piVs6sENdfocEqbOV9oyNM=
X-Google-Smtp-Source: AGHT+IGZmg/FAu/L44TcnvECa5UGFRbWksJU6lqwlSA0VA7Zw7RRPEBDJZTgDypEP5ikYrFlFx5QmA==
X-Received: by 2002:a05:620a:2414:b0:783:1ecd:bfd1 with SMTP id d20-20020a05620a241400b007831ecdbfd1mr11897076qkn.66.1705509507710;
        Wed, 17 Jan 2024 08:38:27 -0800 (PST)
Received: from localhost.localdomain (bras-vprn-ckvlon1747w-lp130-29-70-29-79-15.dsl.bell.ca. [70.29.79.15])
        by smtp.gmail.com with ESMTPSA id q9-20020a05620a038900b00783237b3330sm4623850qkm.31.2024.01.17.08.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 08:38:27 -0800 (PST)
From: Nick Alilovic <nickalilovic@gmail.com>
To: u-boot@lists.denx.de
Cc: andre.przywara@arm.com,
	jagan@amarulasolutions.com,
	linux-sunxi@lists.linux.dev,
	Nick Alilovic <nickalilovic@gmail.com>
Subject: [PATCH 1/2] arm: dts: Transpeed 8K618-T: Add Transpeed 8K618-T board support
Date: Wed, 17 Jan 2024 11:37:55 -0500
Message-Id: <20240117163756.63875-1-nickalilovic@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is the DT I used from the Linux kernel. Made changes to the Makefile to build the new DTB.

Signed-off-by: Nick Alilovic <nickalilovic@gmail.com>
---
 arch/arm/dts/Makefile                         |   1 +
 .../arm/dts/sun50i-h618-transpeed-8k618-t.dts | 161 ++++++++++++++++++
 2 files changed, 162 insertions(+)
 create mode 100644 arch/arm/dts/sun50i-h618-transpeed-8k618-t.dts

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index d456a524b3..cacd21558a 100644
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -836,6 +836,7 @@ dtb-$(CONFIG_MACH_SUN50I_H6) += \
 dtb-$(CONFIG_MACH_SUN50I_H616) += \
 	sun50i-h616-orangepi-zero2.dtb \
 	sun50i-h618-orangepi-zero3.dtb \
+	sun50i-h618-transpeed-8k618-t.dtb \
 	sun50i-h616-x96-mate.dtb
 dtb-$(CONFIG_MACH_SUN50I) += \
 	sun50i-a64-amarula-relic.dtb \
diff --git a/arch/arm/dts/sun50i-h618-transpeed-8k618-t.dts b/arch/arm/dts/sun50i-h618-transpeed-8k618-t.dts
new file mode 100644
index 0000000000..8ea1fd41ae
--- /dev/null
+++ b/arch/arm/dts/sun50i-h618-transpeed-8k618-t.dts
@@ -0,0 +1,161 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2023 Arm Ltd.
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
+	model = "Transpeed 8K618-T";
+	compatible = "transpeed,8k618-t", "allwinner,sun50i-h618";
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
+	reg_vcc3v3: vcc3v3 {
+		/* discrete 3.3V regulator */
+		compatible = "regulator-fixed";
+		regulator-name = "vcc-3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&ir {
+	status = "okay";
+};
+
+&mmc0 {
+	vmmc-supply = <&reg_dldo1>;
+	cd-gpios = <&pio 8 16 GPIO_ACTIVE_LOW>;	/* PI16 */
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
+&ohci1 {
+	status = "okay";
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
+
+		vin1-supply = <&reg_vcc5v>;
+		vin2-supply = <&reg_vcc5v>;
+		vin3-supply = <&reg_vcc5v>;
+
+		regulators {
+			reg_aldo1: aldo1 {
+				regulator-always-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vcc-1v8-pll";
+			};
+
+			reg_dldo1: dldo1 {
+				regulator-always-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcc-3v3-io-mmc";
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
+				regulator-min-microvolt = <1360000>;
+				regulator-max-microvolt = <1360000>;
+				regulator-name = "vdd-dram";
+			};
+		};
+	};
+};
+
+&pio {
+	vcc-pc-supply = <&reg_aldo1>;
+	vcc-pg-supply = <&reg_dldo1>;
+	vcc-ph-supply = <&reg_dldo1>;
+	vcc-pi-supply = <&reg_dldo1>;
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_ph_pins>;
+	status = "okay";
+};
+
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart1_pins>, <&uart1_rts_cts_pins>;
+	uart-has-rtscts;
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
2.34.1

