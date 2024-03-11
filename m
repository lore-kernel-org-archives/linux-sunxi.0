Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA794D9E8
	for <linux-sunxi@lists.linux.dev>; Mon, 11 Mar 2024 17:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710179289; cv=none; b=iKgslkOpYRiOQp7H57Yzp1IJmuFHRN4VWGj4GrB3eRR5zX/YDIbawm9wGg4e9KLhxJdcSuWth8Wqkd3stOWqEnF7hMURvtRIRuEs8CUO/rGIf6i/6wo7OSeppn6oRJ42StXURL+EGh4N36rcNPFYH1iG+2y7mC68Uujq6hxDAWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710179289; c=relaxed/simple;
	bh=01dw+5Io0u3q/4zdg6iAbSQK8g6cxaowyqpEGd8nGJQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nF37vDY1gmRsIFC7PQjjkA1WMiHqQE3MfPBtjoSeCM0odQ5JNEhhWDxStFsrm8rTsWeB7VGbRRCp9rQ5+JDZ2EQiAiTW7cowpsrteBHBHRp4sTW1/OfjV5JAGLCCndjqzin0YRdgQSRyVj+2q0WmythuKvOHZlgbTSG9ctQitJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MFhhyLSn; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MFhhyLSn"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-56847d9b002so2549980a12.1
        for <linux-sunxi@lists.linux.dev>; Mon, 11 Mar 2024 10:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710179285; x=1710784085; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9jC9WGBSGgScxGKsd54B5wH+Py7gDoT3kyXwvtBbZIA=;
        b=MFhhyLSn/QtYLWor4OvkFa2OEd+ehLtHhWwWvTsxQfMNkw4Cl84Qc2xjytJc26H1Id
         uzjRSmREHuCDwfS+7Y016y5C22WMArxubR78IdhnenEMWj83dYOhkgnUMGNH43N3qgAG
         znWO4Vi15VePJqRiIdw3TQ3bptMj7YEWRRrnHbY0bYnfoJW49tTVCu8XHdg6gzszPp4R
         bMTHLBRNxHHXjK55FriM7Lpt0wSdrHlVfkQfGSOx516C163vP6IIl7rYPW9vdgcOeRI8
         Yq3FYjFDHRs0TqPOWq4JLk4dY/QyzAhA+uCV+heUkX0kuriIhnNQyR/w1pBiY3ZNHlEI
         NUnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710179285; x=1710784085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9jC9WGBSGgScxGKsd54B5wH+Py7gDoT3kyXwvtBbZIA=;
        b=PJl5WRrWZrYhzf3cOU6sD2vovjJGvjEOiyoat9+JNMd9NCwJ3CvGJwfEV8JV9JeW6l
         9Uvs9QUvt24r0RU+OnqISLl4KG44uWoVYTyY7dE5Yw01Aieste3Ry52T/kJF6rn4d4Vq
         eGi3fzXkcwsSRQB8yQ+7vaxLKAYN5NCtJjeq9iQvJY1aQ06Sar/mtS90mV+dMtzcWlxy
         PsWfpgK1bwQG/8lZZDY2nWD7i0JJDe/sUVMFzjurIXUEmovKdq0oC2aFFvzbwTSfL60N
         uFBntIC++AOtWdRM7ltP9ozum6rF5PUknv4X2+eKUpYw8OEKhDQdigHa0JJTp4IWGGT0
         A8jQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWwPp1/N8Zvqrs2u3U+QnVlGhGXnx/f7XNgR8Z6wldmf3qrX6Myk246tXm3T94A9+9w/f4xLYCqb3ELwCUNdWQ+6vNA9H9pO74OLI=
X-Gm-Message-State: AOJu0YxzZ7Pc4jCffkEjVhOcEyNozcxT1UViQ0LsEA5HvdBCj3AkEfqq
	aq7accMBmKaK6i8AzXFhZW5dvYivved2t7W1Sr8tktozy4I0T4o0
X-Google-Smtp-Source: AGHT+IGBmrhuYv0ZQ/+hV8IFSH69K/s7pWbTS4iV97QN/TGK2BOH7pCt6S8uFNKgNHoWEhwKcDZYzw==
X-Received: by 2002:a50:ccc1:0:b0:568:93f:36c6 with SMTP id b1-20020a50ccc1000000b00568093f36c6mr4761702edj.22.1710179285540;
        Mon, 11 Mar 2024 10:48:05 -0700 (PDT)
Received: from localhost.localdomain (89-76-44-138.dynamic.chello.pl. [89.76.44.138])
        by smtp.gmail.com with ESMTPSA id r24-20020aa7d158000000b00568525ab2e8sm1757060edo.55.2024.03.11.10.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 10:48:05 -0700 (PDT)
From: Kamil Kasperski <ressetkk@gmail.com>
To: wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kamil Kasperski <ressetkk@gmail.com>
Subject: [PATCH 3/3] dts: arm64: sunxi: add initial dts for T95 AXP313 tv box
Date: Mon, 11 Mar 2024 18:47:50 +0100
Message-Id: <20240311174750.6428-4-ressetkk@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240311174750.6428-1-ressetkk@gmail.com>
References: <20240311174750.6428-1-ressetkk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

T95 is a most commonly known for being a box with a pre-installed malware.
It uses Allwinner H616 and comes with eMMC and DDR3 memory.

Those TV boxes usually come with common hardware:
- Allwinner H616 SoC
- 2/4 GB DDR3 SDRAM (Hynix H5TQ2G43BFR)
- 16/32/64 GB eMMC
- microSD slot
- AXP305 or AXP313 PMIC depending on board revision
- 3.5mm A/V output
- HDMI port
- 2x USB 2.0 ports
- 100M ETH using Internal PHY
- 7-segment display
- DC 5V barrel jack port

The board contains holes hor UART header wired to &uart0.
From the DRAM specification its operation voltage is 1.5V.

Signed-off-by: Kamil Kasperski <ressetkk@gmail.com>
---
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun50i-h616-t95-axp313.dts  | 138 ++++++++++++++++++
 2 files changed, 139 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h616-t95-axp313.dts

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index 21149b346a60..183dcdea40ad 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -43,6 +43,7 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-bigtreetech-cb1-manta.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-bigtreetech-pi.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-orangepi-zero2.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-x96-mate.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-t95-axp313.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-longanpi-3h.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-orangepi-zero2w.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-orangepi-zero3.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-t95-axp313.dts b/arch/arm64/boot/dts/allwinner/sun50i-h616-t95-axp313.dts
new file mode 100644
index 000000000000..830a8815e675
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-t95-axp313.dts
@@ -0,0 +1,138 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2024 Kamil Kasperski <ressetkk@gmail.com>
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
+	model = "T95 5G (AXP313)";
+	compatible = "t95,t95-axp313", "allwinner,sun50i-h616";
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
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&ehci2 {
+	status = "okay";
+};
+
+&ir {
+	status = "okay";
+};
+
+&mmc0 {
+	broken-cd;
+	vmmc-supply = <&reg_dldo1>;
+	status = "okay";
+};
+
+&mmc2 {
+	vmmc-supply = <&reg_dldo1>;
+	bus-width = <8>;
+	non-removable;
+	cap-mmc-hw-reset;
+	status = "okay";
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&ohci2 {
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
+		interrupt-parent = <&pio>;
+		interrupts = <2 9 IRQ_TYPE_LEVEL_LOW>;	/* PC9 */
+
+		vin1-supply = <&reg_vcc5v>;
+		vin2-supply = <&reg_vcc5v>;
+		vin3-supply = <&reg_vcc5v>;
+
+		regulators {
+			/* Supplies VCC-PLL, so needs to be always on. */
+			reg_aldo1: aldo1 {
+				regulator-always-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vcc1v8";
+			};
+
+			/* Supplies VCC-IO, so needs to be always on. */
+			reg_dldo1: dldo1 {
+				regulator-always-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcc3v3";
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
+				regulator-min-microvolt = <1500000>;
+				regulator-max-microvolt = <1500000>;
+				regulator-name = "vdd-dram";
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

