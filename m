Received: from mail.netcube.li (mail.netcube.li [173.249.15.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4962609ED
	for <linux-sunxi@lists.linux.dev>; Sat,  5 Jul 2025 21:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.249.15.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751751605; cv=none; b=q9phDhPKAksBOUdGvxdDq7WuJBS6vWNj+pLCx8yVBSZ9swnAp0qsROyWtUOwhSD/JBItxnO4S6EIlQN+zIPTwfHRRRlnIBD/v2t7Z5xoyEI886Bxcp1IgUywdGY2tPgK7lQ9rUjSwlo8RD5AqlyNSnyrV4eKKq6VrAQgk6HZ4w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751751605; c=relaxed/simple;
	bh=mcTua/G5RFyVLlcXGFD05ezFGsyzRwRteazyZ5tQ4d8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QeiQV/j0hBEkAYVGGUoao5M1UUBWumcJ26mjX5ZWNzwxVQwXjDVpctxudux2W3B1w57AvV6eYRdo7iBSPLFDFMKWP4RAy63zeiuv8ao+cKrdPOcrjyOo26QVutliP4/okOSeKybkW8BTFuTyytXuI9lLEPbNOfBIjFty81879Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li; spf=pass smtp.mailfrom=netcube.li; dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b=NpUDES0e; arc=none smtp.client-ip=173.249.15.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netcube.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b="NpUDES0e"
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References;
	bh=COLdE9Qe9niSYcTfJryg+Zp638/GiYsA4tgZ96AwDNU=;
	b=NpUDES0e32YprLDGVhlwX1FF1It2fo2KnInhncG3dp0HXut2EBBmI4LNhLM/AQrNTrIsCv/yug2UXBEvmljOwfaoppJhUujHEXVraUtGr5HPNwe24EInVAwalpYa9D2KdvlD5UnKNM7mUVOidFAmb5fG1XLfskD3TlehhoDmzjY=
Received: from lukas-hpz440workstation.lan.sk100508.local (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPA
	; Sat, 5 Jul 2025 23:39:58 +0200
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Maxime Ripard <mripard@kernel.org>
Cc: Lukas Schmid <lukas.schmid@netcube.li>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 6/7] ARM: dts: sunxi: add support for NetCube Systems Nagami Basic Carrier
Date: Sat,  5 Jul 2025 23:38:57 +0200
Message-Id: <20250705213900.3614963-7-lukas.schmid@netcube.li>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250705213900.3614963-1-lukas.schmid@netcube.li>
References: <20250705213900.3614963-1-lukas.schmid@netcube.li>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NetCube Systems Nagami Basic Carrier is a Carrier for the Nagami SoM
It provides an ethernet port for the phy on the SoM and some USB-Ports.
All other interfaces and gpios are available on pinheader, except for the
SD-Interface which is available on a micro-sd slot.

Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
---
 arch/arm/boot/dts/allwinner/Makefile          |  2 +
 ...n8i-t113s-netcube-nagami-basic-carrier.dts | 63 +++++++++++++++++++
 2 files changed, 65 insertions(+)
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami-basic-carrier.dts

diff --git a/arch/arm/boot/dts/allwinner/Makefile b/arch/arm/boot/dts/allwinner/Makefile
index d799ad153..af287bb32 100644
--- a/arch/arm/boot/dts/allwinner/Makefile
+++ b/arch/arm/boot/dts/allwinner/Makefile
@@ -199,6 +199,7 @@ DTC_FLAGS_sun8i-h3-nanopi-r1 := -@
 DTC_FLAGS_sun8i-h3-orangepi-pc := -@
 DTC_FLAGS_sun8i-h3-bananapi-m2-plus-v1.2 := -@
 DTC_FLAGS_sun8i-h3-orangepi-pc-plus := -@
+DTC_FLAGS_sun8i-t113s-netcube-nagami-basic-carrier := -@
 DTC_FLAGS_sun8i-v3s-netcube-kumquat := -@
 dtb-$(CONFIG_MACH_SUN8I) += \
 	sun8i-a23-evb.dtb \
@@ -257,6 +258,7 @@ dtb-$(CONFIG_MACH_SUN8I) += \
 	sun8i-s3-lichee-zero-plus.dtb \
 	sun8i-s3-pinecube.dtb \
 	sun8i-t113s-mangopi-mq-r-t113.dtb \
+	sun8i-t113s-netcube-nagami-basic-carrier.dtb \
 	sun8i-t3-cqa3t-bv3.dtb \
 	sun8i-v3-sl631-imx179.dtb \
 	sun8i-v3s-anbernic-rg-nano.dtb \
diff --git a/arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami-basic-carrier.dts b/arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami-basic-carrier.dts
new file mode 100644
index 000000000..1c4e691cd
--- /dev/null
+++ b/arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami-basic-carrier.dts
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2025 Lukas Schmid <lukas.schmid@netcube.li>
+ */
+
+/dts-v1/;
+#include "sun8i-t113s-netcube-nagami.dtsi"
+
+/ {
+	model = "NetCube Systems Nagami Basic Carrier Board";
+	compatible = "netcube,nagami-basic-carrier", "netcube,nagami",
+				 "allwinner,sun8i-t113s";
+};
+
+&can0 {
+	status = "okay";
+};
+
+&can1 {
+	status = "okay";
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
+&i2c2 {
+	status = "okay";
+};
+
+&i2s1 {
+	status = "okay";
+};
+
+&mmc0 {
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
+&spi1 {
+	status = "okay";
+};
+
+&usb_otg {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&usbphy {
+	usb0_id_det-gpios = <&pio 5 6 GPIO_ACTIVE_HIGH>; /* PF6 */
+	status = "okay";
+};
-- 
2.39.5


