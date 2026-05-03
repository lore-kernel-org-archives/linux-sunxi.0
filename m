Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8C23A6F15
	for <linux-sunxi@lists.linux.dev>; Sun,  3 May 2026 19:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777835938; cv=none; b=L7Hu5+tkAcPrDpugftM3AZm7L1Jfv3B1i7IOyHt/CCKT2aykM0HKvijZRvitWTfM+Yz0vPHCx2pJdFpPKHpbvruAMGrtg5yTCnt5hrdOf8uy02WqzCFa0qnK3QXGTAcP8c7OFBcC9ZPVkS9wtEjw4qQ5wMeJgtd9bYzPnaMRMyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777835938; c=relaxed/simple;
	bh=tWwW8xlK/MSqrFa9aQd299c+0S/IVYTry0ZrZ8XSNPw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UeFRO3SE0PYVeOnSUie9H+mWjKRqW8zhKO2q5g6UpKCR2zrOJ3/EhY8XTVxMe0zFIkEfC9EFZB3o9xphgSoAMeSjJRDy+yZY8LIEyIzqWiZbfK+W+8A7rfm14yj/gGEsV2TCeJb7KzZiOxyHjKYQaluFWlfU7an52Bq8AznLz68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V/dEsIVX; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V/dEsIVX"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso23360125e9.1
        for <linux-sunxi@lists.linux.dev>; Sun, 03 May 2026 12:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777835935; x=1778440735; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/5SVr5FfGqw1uBAV0gP9IimhA/pN8ipjATE7h+sfzNk=;
        b=V/dEsIVX/Uaq6B+GCWmFk9fyu2GU12B+mETINxodWq4Ifidz2HJHUKuPCyQ0wG1o0h
         FiEmzbxV3Mn6S01H5ddwRSGsZnPt3Fl7ixAC2uOEQq81Jz9wnKQLLQRwY5DmTRY2EGSU
         GaGf/74l6t1q9BOztwa1vTu4oJpwx/h5oKI+wt87Bog8vfqafxjdmySz0imuv5YSgOcx
         8mREu39Y5p1PhAXKSGa0jZFNIdU+BTHnYDfZgBOE3gMIHnCaKnpSBraWeMb1oDw47p3b
         +getHO2jMo1q9d6W4uGhpMTLE8LM//jZlumkCzKgMvhHwVSSrqP2p+ouLHengEi4u3SZ
         tCgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777835935; x=1778440735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/5SVr5FfGqw1uBAV0gP9IimhA/pN8ipjATE7h+sfzNk=;
        b=nWgdOuvEuQny0rNbya/4toPAruA5ar4uDB6R5DkuzMEgzDf6+sG450kn45T48Zx+aV
         +MPm5jgkQNMTKMRx+ZP9BTCK+ZOgxV688gmKoy80CCc+9LjRoLi7q0rZGo9joyaEW+UH
         7XqIFk0ag38VIHpDDPO1RNi/d6V0w9N5wyjuLl2JfpnupfJe3OmMnKiFYlTtmZ2aUJ2V
         roIj+R2pVzMgFydx8zuLDIVRiJykO9NKSxTi3xKdUnQxegeW/zrCtbgN0lUvkeLZwniK
         3Qk5B/o3Gp9Ni+YDDhGh5L6UH37hPQ08F5KSwRRlCNt8G4LvlpXKDN+CLr2k9WW4mBXk
         rlxQ==
X-Gm-Message-State: AOJu0YwetCKZa7zp8Qj9XMipsY9zczwl2ZwzAgOOcgzlqDN8/KX6A5ND
	Dq1Xwpj/dPsl8X/LkriJnPsshUgCm9R7IEGp8FqavaZ5bNtGSWkhB7wKWvmhZQ==
X-Gm-Gg: AeBDietZjJ6Nxu5RCRcGi7cl0yNs+ub0QQon61lLw2I3riqAREny1daFgXkkIxHaKUw
	udK7Hx0IgWW2gQ4EM9l5F9Gya/O3MQksbnnmBbShlOI/KuoISIzNmCrkc+Krmcw6s8F2UmkqDhE
	teFcCYKoi8ECKhrdUzkCKjaCgOMugy6LYZX0124sSOahDPkW3iUJP9fv7woEZjz1M/yj2yMIzrv
	/jOlHkeB38at1kh1JGknKwBWUtxbe4Hex28y8EJpxfOrjDgMXMACKUWqjCofSzbfVB/o/XAdp5b
	KcWoWRrXux2gwmRQdBXZW/8Iyp/r2zt7tamUMvkTvKnjkeMXxsC8PBrWnD5eVs2gYUvuiZ2Jhxg
	YZO/MlbkXK1SybgOaWaEdkUM7ge/qI6q5iNHDLqdCzpAmEMMTeFZ946AU++8NvGuJJS+W/K2OS0
	5Q9FDUa0agopRYXDdi7JAbhbAlMZOnROdJjNrp8ciEyVhK5AgwjXRg+xAE7VA3Ooo=
X-Received: by 2002:a05:600c:a316:b0:489:2005:b36e with SMTP id 5b1f17b1804b1-48a988a4cfamr83350095e9.19.1777835934701;
        Sun, 03 May 2026 12:18:54 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8fe928f6sm62230925e9.6.2026.05.03.12.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 12:18:54 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: allwinner: A133: add support for Baijie Helper A133 board
Date: Sun,  3 May 2026 21:18:38 +0200
Message-ID: <20260503191842.2736130-4-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260503191842.2736130-1-alexander.sverdlin@gmail.com>
References: <20260503191842.2736130-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Baijie Helper A133 board is a development board around Baijie A133 Core
SBC. Features:

- 1/2/4GiB LPDDR4 DRAM
- 8/16/32GiB eMMC
- AXP707 PMIC
- 2 USB 2.0 ports
- MicroSD slot and on-board eMMC module
- Gigabit Ethernet
- Bluetooth
- WiFi

Add initial support for both the Helper and Core boards, including UART,
PMU, eMMC, USB, Ethernet.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun50i-a133-baije-core.dtsi | 159 ++++++++++++++++++
 .../allwinner/sun50i-a133-baijie-helper.dts   |  92 ++++++++++
 3 files changed, 252 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.dtsi
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index d116864b6c2b..926dfa851100 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -18,6 +18,7 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-sopine-baseboard.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-teres-i.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h64-remix-mini-pc.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a100-allwinner-perf1.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a133-baijie-helper.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a133-liontron-h-a133l.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-bananapi-m2-plus.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-bananapi-m2-plus-v1.2.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.dtsi
new file mode 100644
index 000000000000..78da3baa65bb
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.dtsi
@@ -0,0 +1,159 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2025 Arm Ltd.
+ */
+
+/dts-v1/;
+
+#include "sun50i-a100.dtsi"
+#include "sun50i-a100-cpu-opp.dtsi"
+
+/{
+	aliases {
+		serial1 = &uart1;	/* BT module */
+	};
+};
+
+&cpu0 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
+&pio {
+	vcc-pb-supply = <&reg_dcdc1>;
+	vcc-pc-supply = <&reg_eldo1>;
+	vcc-pd-supply = <&reg_dcdc1>;
+	vcc-pe-supply = <&reg_dldo2>;
+	vcc-pf-supply = <&reg_dcdc1>;
+	vcc-pg-supply = <&reg_dldo1>;
+	vcc-ph-supply = <&reg_dcdc1>;
+};
+
+&mmc2 {
+	vmmc-supply = <&reg_dcdc1>;
+	vqmmc-supply = <&reg_eldo1>;
+	cap-mmc-hw-reset;
+	non-removable;
+	bus-width = <8>;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	status = "okay";
+};
+
+&r_i2c0 {
+	status = "okay";
+
+	axp803: pmic@34 {
+		compatible = "x-powers,axp803";
+		reg = <0x34>;
+		interrupt-parent = <&r_intc>;
+		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
+#include "axp803.dtsi"
+
+&ac_power_supply {
+	status = "okay";
+};
+
+&reg_aldo1 {
+	regulator-always-on;
+	regulator-min-microvolt = <700000>;
+	regulator-max-microvolt = <3300000>;
+};
+
+&reg_aldo2 {
+	regulator-always-on;
+	regulator-min-microvolt = <700000>;
+	regulator-max-microvolt = <3300000>;
+};
+
+&reg_aldo3 {
+	regulator-always-on;
+	regulator-min-microvolt = <700000>;
+	regulator-max-microvolt = <3300000>;
+	regulator-enable-ramp-delay = <1000>;
+};
+
+&reg_dcdc1 {
+	regulator-always-on;
+	regulator-min-microvolt = <1600000>;
+	regulator-max-microvolt = <3400000>;
+	regulator-name = "vcc-3v3";
+};
+
+&reg_dcdc2 {
+	regulator-always-on;
+	regulator-min-microvolt = <500000>;
+	regulator-max-microvolt = <1300000>;
+	regulator-name = "vdd-cpu";
+};
+
+&reg_dcdc3 {
+	regulator-always-on;
+	regulator-min-microvolt = <500000>;
+	regulator-max-microvolt = <1300000>;
+};
+
+&reg_dcdc4 {
+	regulator-always-on;
+	regulator-min-microvolt = <500000>;
+	regulator-max-microvolt = <1300000>;
+	regulator-name = "vdd-sys";
+};
+
+&reg_dcdc5 {
+	regulator-always-on;
+	regulator-min-microvolt = <800000>;
+	regulator-max-microvolt = <1840000>;
+	regulator-name = "vcc-dram";
+};
+
+/* DCDC6 unused */
+
+&reg_dldo1 {
+	regulator-min-microvolt = <700000>;
+	regulator-max-microvolt = <3300000>;
+	regulator-enable-ramp-delay = <1000>;
+};
+
+&reg_dldo2 {
+	regulator-min-microvolt = <700000>;
+	regulator-max-microvolt = <3400000>;
+	regulator-enable-ramp-delay = <1000>;
+};
+
+&reg_dldo3 {
+	regulator-min-microvolt = <700000>;
+	regulator-max-microvolt = <3300000>;
+	regulator-enable-ramp-delay = <1000>;
+	regulator-name = "avdd-csi";
+};
+
+&reg_dldo4 {
+	regulator-min-microvolt = <700000>;
+	regulator-max-microvolt = <3300000>;
+	regulator-enable-ramp-delay = <1000>;
+};
+
+&reg_eldo1 {
+	regulator-min-microvolt = <700000>;
+	regulator-max-microvolt = <1900000>;
+	regulator-enable-ramp-delay = <1000>;
+};
+
+&reg_eldo2 {
+	regulator-min-microvolt = <700000>;
+	regulator-max-microvolt = <1900000>;
+	regulator-enable-ramp-delay = <1000>;
+	regulator-name = "dvdd-csi";
+};
+
+/* ELDO3 unused */
+
+&reg_fldo1 {
+	regulator-always-on;
+	regulator-min-microvolt = <700000>;
+	regulator-max-microvolt = <1450000>;
+	regulator-name = "vdd-cpus-usb";
+};
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts b/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts
new file mode 100644
index 000000000000..d48b47ef2ed0
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2025 Arm Ltd.
+ */
+
+/dts-v1/;
+
+#include "sun50i-a133-baije-core.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+
+/{
+	model = "HelperBoard A133";
+	compatible = "baijie,helper-a133", "allwinner,sun50i-a100";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led {
+			function = LED_FUNCTION_INDICATOR;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&pio 7 13 GPIO_ACTIVE_LOW>;	/* PH13 */
+		};
+	};
+};
+
+&mmc0 {
+	vmmc-supply = <&reg_dcdc1>;
+	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;	/* PF6 */
+	bus-width = <4>;
+	status = "okay";
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pb_pins>;
+	status = "okay";
+};
+
+&rgmii0_pins {
+	drive-strength = <30>;
+};
+
+&emac0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&rgmii0_pins>;
+	phy-handle = <&eth_phy>;
+	phy-mode = "rgmii-id";
+	allwinner,rx-delay-ps = <200>;
+	allwinner,tx-delay-ps = <200>;
+	status = "okay";
+};
+
+&mdio0 {
+	reset-gpios = <&pio 7 11 GPIO_ACTIVE_LOW>;	/* PH11 */
+	reset-delay-us = <10000>;
+	reset-post-delay-us = <150000>;
+
+	eth_phy: ethernet-phy@1 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <1>;
+	};
+};
+
+&usbphy {
+	status = "okay";
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&ohci1 {
+	status = "okay";
+};
-- 
2.53.0

