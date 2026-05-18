Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1152371878
	for <linux-sunxi@lists.linux.dev>; Mon, 18 May 2026 15:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779118725; cv=none; b=quJfW/LGSJcp/NR3Fd5sKn6Z4ei8TsmjO+XNOXjfx8TZp+Bjzd7sEhszjOoFMZWm8dR2AE43w5aLvgF0IWwQz51QWOJi9ixHyLUKbl0a6YhFfoH26R8Hw+2KJKDYMBfXhYqyezpNWeYvUCWgACXK+sJ9jmr+25OrOlN/4I0sdnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779118725; c=relaxed/simple;
	bh=7Wf6EUbkKr17gYerU37skbZ9k7kw50qJEXicgncFmhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CMWPOFIibLgk1cSUFE1e/jibapQGySM8YDrzc/4XpEM2j3N0gDECNA2nOXVd56WMgUSEvpm/tPXu5Jd+y+Nm4scZksTD4gc9Q1byYgAPOy5D4Fa6Xpqq/Z3ulkjXlX90lH02EjWlUv+2RDsIkqurYArRZk79LWAVnWNh57rVArY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 98C6E1F8005A
	for <linux-sunxi@lists.linux.dev>; Mon, 18 May 2026 15:38:40 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 1710FB40822; Mon, 18 May 2026 15:38:39 +0000 (UTC)
X-Spam-Level: *
Received: from collins (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id CEAC6B40805;
	Mon, 18 May 2026 15:33:48 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Yong Deng <yong.deng@magewell.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH v9 9/9] ARM: dts: sun8i-a83t: Add BananaPi M3 OV8865 camera overlay
Date: Mon, 18 May 2026 17:33:38 +0200
Message-ID: <20260518153339.619947-10-paulk@sys-base.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518153339.619947-1-paulk@sys-base.io>
References: <20260518153339.619947-1-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Add an overlay supporting the OV8865 from the BananaPi Camera v3
peripheral board. The board has two sensors (OV5640 and OV8865)
which cannot be supported in parallel as they share the same reset
pin and the kernel currently has no support for this case.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 arch/arm/boot/dts/allwinner/Makefile          |   3 +
 .../sun8i-a83t-bananapi-m3-camera-ov8865.dtso | 101 ++++++++++++++++++
 2 files changed, 104 insertions(+)
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-a83t-bananapi-m3-camera-ov8865.dtso

diff --git a/arch/arm/boot/dts/allwinner/Makefile b/arch/arm/boot/dts/allwinner/Makefile
index 6975df9d7b46..4a0d4edd8b2d 100644
--- a/arch/arm/boot/dts/allwinner/Makefile
+++ b/arch/arm/boot/dts/allwinner/Makefile
@@ -222,6 +222,7 @@ dtb-$(CONFIG_MACH_SUN8I) += \
 	sun8i-a83t-allwinner-h8homlet-v2.dtb \
 	sun8i-a83t-bananapi-m3.dtb \
 	sun8i-a83t-bananapi-m3-camera-ov5640.dtb \
+	sun8i-a83t-bananapi-m3-camera-ov8865.dtb \
 	sun8i-a83t-cubietruck-plus.dtb \
 	sun8i-a83t-tbs-a711.dtb \
 	sun8i-h2-plus-bananapi-m2-zero.dtb \
@@ -273,6 +274,8 @@ dtb-$(CONFIG_MACH_SUN8I) += \
 	sun8i-v40-bananapi-m2-berry.dtb
 sun8i-a83t-bananapi-m3-camera-ov5640-dtbs += \
 	sun8i-a83t-bananapi-m3.dtb sun8i-a83t-bananapi-m3-camera-ov5640.dtbo
+sun8i-a83t-bananapi-m3-camera-ov8865-dtbs += \
+	sun8i-a83t-bananapi-m3.dtb sun8i-a83t-bananapi-m3-camera-ov8865.dtbo
 sun8i-h2-plus-orangepi-zero-interface-board-dtbs += \
 	sun8i-h2-plus-orangepi-zero.dtb sun8i-orangepi-zero-interface-board.dtbo
 sun8i-h3-orangepi-zero-plus2-interface-board-dtbs += \
diff --git a/arch/arm/boot/dts/allwinner/sun8i-a83t-bananapi-m3-camera-ov8865.dtso b/arch/arm/boot/dts/allwinner/sun8i-a83t-bananapi-m3-camera-ov8865.dtso
new file mode 100644
index 000000000000..4340ca73bfaa
--- /dev/null
+++ b/arch/arm/boot/dts/allwinner/sun8i-a83t-bananapi-m3-camera-ov8865.dtso
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: GPL-2.0 OR X11
+/*
+ * Copyright 2022 Bootlin
+ * Author: Kévin L'hôpital <kevin.lhopital@bootlin.com>
+ * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/sun8i-a83t-ccu.h>
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	/*
+	 * These regulators actually have DLDO4 tied to their EN pin, which is
+	 * described as input supply here for lack of a better representation.
+	 * Their actual supply is PS, which is always-on.
+	 */
+
+	ov8865_avdd: ov8865-avdd {
+		compatible = "regulator-fixed";
+		regulator-name = "ov8865-avdd";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		vin-supply = <&reg_dldo4>;
+	};
+
+	ov8865_dovdd: ov8865-dovdd {
+		compatible = "regulator-fixed";
+		regulator-name = "ov8865-dovdd";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		vin-supply = <&reg_dldo4>;
+	};
+
+	ov8865_dvdd: ov8865-dvdd {
+		compatible = "regulator-fixed";
+		regulator-name = "ov8865-dvdd";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		vin-supply = <&reg_dldo4>;
+	};
+};
+
+&csi {
+	status = "okay";
+};
+
+&i2c2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c2_pe_pins>;
+	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	ov8865: camera@36 {
+		pinctrl-names = "default";
+		pinctrl-0 = <&csi_mclk_pin>;
+
+		compatible = "ovti,ov8865";
+		reg = <0x36>;
+
+		clocks = <&ccu CLK_CSI_MCLK>;
+		assigned-clocks = <&ccu CLK_CSI_MCLK>;
+		assigned-clock-parents = <&osc24M>;
+		assigned-clock-rates = <24000000>;
+
+		avdd-supply = <&ov8865_avdd>;
+		dovdd-supply = <&ov8865_dovdd>;
+		dvdd-supply = <&ov8865_dvdd>;
+
+		powerdown-gpios = <&pio 4 17 GPIO_ACTIVE_LOW>; /* PE17 */
+		reset-gpios = <&pio 4 16 GPIO_ACTIVE_LOW>; /* PE16 */
+
+		port {
+			ov8865_out_mipi_csi2: endpoint {
+				remote-endpoint = <&mipi_csi2_in_ov8865>;
+				link-frequencies = /bits/ 64 <360000000>;
+				data-lanes = <1 2 3 4>;
+			};
+		};
+	};
+};
+
+&mipi_csi2 {
+	status = "okay";
+};
+
+&mipi_csi2_in {
+	mipi_csi2_in_ov8865: endpoint {
+		remote-endpoint = <&ov8865_out_mipi_csi2>;
+		data-lanes = <1 2 3 4>;
+	};
+};
+
+&reg_dldo4 {
+	regulator-min-microvolt = <2800000>;
+	regulator-max-microvolt = <2800000>;
+};
-- 
2.54.0

