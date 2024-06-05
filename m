Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8079613A405
	for <linux-sunxi@lists.linux.dev>; Wed,  5 Jun 2024 18:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717613628; cv=none; b=d5htBPSVK6Yg2OU0nIR2GFolpXJVSLoBJvOLAtWgCfVnU/UQ4QRZlxEvcUmcg1l9PJwwCGiWA+5KeKnXO2Bp2UJGR4jwO4f49W0SzIn9XVvdJNGwFf7K43jgxSFh5r+5v04R8WWGDexKLVsC0tfAU8gIxQ41g4o0YfDq/bHGG/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717613628; c=relaxed/simple;
	bh=m0o4qU4xdSzIZ8XDo1kERZeybM2oCvBTijiRasia6IY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eJJJ9WLEJsBTQAlISoDoA0SO1HeGSHpbEGUUKYty5Fcx0J2WW+n/4/V9jfAeZiyVzYSuIj5uI5oIWTwHJ0Fvl8nZyTkQJcO77TWTQKhnSsYnEAyuGgz8EfmpfaVbCbeVsr8RyB55znzESfoor/CC8Xn2uoi4+BeKDooDSfDJL9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kT+ZqEoO; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kT+ZqEoO"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3c9cc681ee7so43322b6e.1
        for <linux-sunxi@lists.linux.dev>; Wed, 05 Jun 2024 11:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717613625; x=1718218425; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HVzijw5v1Z5XO8oLrdI75BOMEE1r3cCrfFvzujbNVWo=;
        b=kT+ZqEoOWeUPQzMsSDpZNj89uWk+QXZDJZ7CstHCUavDvQ3+nL1y/ypZwi0J62K1EG
         WcAYtekOODVf4yLzQUx/G7ktBbB9KOACE46Y6dhRdGDSZI1bLuTWEeM998Idgzg8d4Cf
         9xuao268tzOa1qjxsvV/6r43IhWPj/6keafFcTM7mJ9XKcY+FWqF6JiLFR633DS+G1El
         wajE7SbfGo+iIb+5nZpdW1D58oYhV00hgna84CmFzaVwWKY7pJsN9+/D4OPs6S/6v0HQ
         ETv81pZT3GBM6eb6B3z+vpx9n0poennnctSdz9tspvVZrPDCB+pfecLvcaR+Y0o60kq3
         Nn2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717613625; x=1718218425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HVzijw5v1Z5XO8oLrdI75BOMEE1r3cCrfFvzujbNVWo=;
        b=nM6VF4gG9lpTYp17CyPjpKceREnhAlL/gj0uHExKdV5+/9regIugNeY9hQKCLvaHOw
         swnYxS+R6QcwjLS8Yj4ecVEmM8wcPC78JZZGVxZGUQ0YipDq21A+rGzE6usSnJ3CpzMb
         439C0xZk3oTvR8hjO6LPlWFExNIMFbutJ5pkKhyeca8hCHSxJpxV5Yf7crKjaF882j4A
         +DBWlH7blpnSZTiN4GRcd1soNpoRpsZgLYuGBf6G5pWSXxjQ04fsL4aCIlgLwMNh7RB/
         ek4oCTCLxmtygW9gjM9NteSTXPvTvVQ+3ls8mR5yfm3qT0upRhBBWBV/6YFadTjZHF15
         XY+w==
X-Gm-Message-State: AOJu0YxZ4JWHACLKnYgHXjHZIYrEePG7bit70ZHSSLhxzITEnckt5Jgp
	zCVsNkKjw/gV9GXVYXSmNMXm/1/1XeSTUOMxcDAPXVbvP7WMzWmYImhJMg==
X-Google-Smtp-Source: AGHT+IFMBeInfPFiKR9FlYP1Y+NHRP2CUswLOsLD32j97ZpNCuEuFpS0tGQcOonAcXNvqJm8CtVCBQ==
X-Received: by 2002:a05:6808:4406:b0:3c7:21b4:6e1 with SMTP id 5614622812f47-3d20a798627mr108110b6e.2.1717613625404;
        Wed, 05 Jun 2024 11:53:45 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d20a7a37a1sm29684b6e.4.2024.06.05.11.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 11:53:45 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	mripard@kernel.org,
	ryan@testtoast.com,
	andre.przywara@arm.com,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 2/2] arm64: dts: allwinner: h700: Add Anbernic RG35XX-SP
Date: Wed,  5 Jun 2024 13:53:39 -0500
Message-Id: <20240605185339.266833-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240605185339.266833-1-macroalpha82@gmail.com>
References: <20240605185339.266833-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

The Anbernic RG35XXSP is almost identical to the RG35XX-Plus, but in a
clamshell form-factor. The key differences between the SP and the Plus
is a lid switch and an RTC on the same i2c bus as the PMIC.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 arch/arm64/boot/dts/allwinner/Makefile        |   3 +-
 .../sun50i-h700-anbernic-rg35xx-sp.dts        | 145 ++++++++++++++++++
 2 files changed, 147 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dts

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index 0db7b60b49a1..00bed412ee31 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -49,5 +49,6 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-orangepi-zero2w.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-orangepi-zero3.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-transpeed-8k618-t.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-2024.dtb
-dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-plus.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-h.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-plus.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-sp.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dts
new file mode 100644
index 000000000000..a1d16b65ef5d
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dts
@@ -0,0 +1,145 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright (C) 2024 Ryan Walklin <ryan@testtoast.com>.
+ * Copyright (C) 2024 Chris Morgan <macroalpha82@gmail.com>.
+ */
+
+#include <dt-bindings/input/gpio-keys.h>
+#include "sun50i-h700-anbernic-rg35xx-plus.dts"
+
+/ {
+	model = "Anbernic RG35XX SP";
+	compatible = "anbernic,rg35xx-sp", "allwinner,sun50i-h700";
+
+	gpio-keys-lid {
+		compatible = "gpio-keys";
+
+		lid-switch {
+			label = "Lid Switch";
+			gpios = <&pio 4 7 GPIO_ACTIVE_LOW>; /* PE7 */
+			linux,can-disable;
+			linux,code = <SW_LID>;
+			linux,input-type = <EV_SW>;
+			wakeup-event-action = <EV_ACT_DEASSERTED>;
+			wakeup-source;
+		};
+	};
+};
+
+/delete-node/ &r_rsb;
+
+&r_i2c {
+	pinctrl-0 = <&r_i2c_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	axp717: pmic@34 {
+		compatible = "x-powers,axp717";
+		reg = <0x34>;
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
+
+	rtc_ext: rtc@51 {
+		compatible = "nxp,pcf8563";
+		reg = <0x51>;
+	};
+};
-- 
2.34.1

