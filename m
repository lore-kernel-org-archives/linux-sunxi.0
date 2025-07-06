Received: from mail.netcube.li (mail.netcube.li [173.249.15.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477AD2BCF6C
	for <linux-sunxi@lists.linux.dev>; Sun,  6 Jul 2025 18:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.249.15.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751827015; cv=none; b=Rg8BOzSKAtI3VJRKBMb88oVe28FXfqNlxHiLlTb5u+W1mN/URPBqg+zckq3qN3q2cyXm+N/YqdrRIbI+gq+OiSYmhopSHs73xIoeVj97bRz1t3Yazafp7rE/h8luIC9S6GDZXSCjJDztj+oagjrUKKNqnMWRaXvrxLd1wYQo4tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751827015; c=relaxed/simple;
	bh=DRMQbRZWUhGw5/lqb+APwMKFprX1xofy2byBElLuM7Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=p27GNI4B+i+hG3h+H2ydI+2LFpcMn1tdnhGTYLy1zRsoCuce252Iy93FPqtcDIbm0gFRREb/FQrxaqHNoOhoMMZL82db/3aqGlKYLViukBw/SKGqbu+RBiSbJddU0RXQsYKwp5uZZTpcbOVRX8mtGD5KSAkaTAXGjK7tswGE3gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li; spf=pass smtp.mailfrom=netcube.li; dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b=IxiNZX2V; arc=none smtp.client-ip=173.249.15.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netcube.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b="IxiNZX2V"
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References;
	bh=iY45rPf6NfJfIsrjOR+vhY8BHVO+tt89pB/hI839SL0=;
	b=IxiNZX2V7e1kYb8xWKqy97tsVTlgu3EcEdx1wo23BhXNCK5VF3YQnWSGF1xO7+wpm+VhGV8iRY05+pJTIjbVRClL3oqVrF9RtOzbGdsuO0jSBDLSxtXARo0TDZ0J54tzMljua3raN3QfwVOtXsKd34c1QWoj0hpMgdeynphtO4o=
Received: from lukas-hpz440workstation.lan.sk100508.local (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPA
	; Sun, 6 Jul 2025 20:36:21 +0200
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
Subject: [PATCH v2 2/5] riscv: dts: allwinner: d1s-t113: Add pinctrl's required by NetCube Systems Nagami SoM
Date: Sun,  6 Jul 2025 20:35:55 +0200
Message-Id: <20250706183601.157523-3-lukas.schmid@netcube.li>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250706183601.157523-1-lukas.schmid@netcube.li>
References: <20250706183601.157523-1-lukas.schmid@netcube.li>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added the following pinctrl's used by the NetCube Systems Nagami SoM
  * i2c2_pins
  * i2c3_pins
  * i2s1_pins, i2s1_din_pins, i2s1_dout_pins
  * spi1_pins

Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
---
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index e4175adb0..8dc3deccb 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -78,6 +78,36 @@ dsi_4lane_pins: dsi-4lane-pins {
 				function = "dsi";
 			};
 
+			/omit-if-no-ref/
+			i2c2_pins: i2c2-pins {
+				pins = "PD20", "PD21";
+				function = "i2c2";
+			};
+
+			/omit-if-no-ref/
+			i2c3_pins: i2c3-pins {
+				pins = "PG10", "PG11";
+				function = "i2c3";
+			};
+
+			/omit-if-no-ref/
+			i2s1_pins: i2s1-pins {
+				pins = "PG12", "PG13";
+				function = "i2s1";
+			};
+
+			/omit-if-no-ref/
+			i2s1_din_pins: i2s1-din-pins {
+				pins = "PG14";
+				function = "i2s1_din";
+			};
+
+			/omit-if-no-ref/
+			i2s1_dout_pins: i2s1-dout-pins {
+				pins = "PG15";
+				function = "i2s1_dout";
+			};
+
 			/omit-if-no-ref/
 			lcd_rgb666_pins: lcd-rgb666-pins {
 				pins = "PD0", "PD1", "PD2", "PD3", "PD4", "PD5",
@@ -126,6 +156,12 @@ spi0_pins: spi0-pins {
 				function = "spi0";
 			};
 
+			/omit-if-no-ref/
+			spi1_pins: spi1-pins {
+				pins = "PD10", "PD11", "PD12", "PD13", "PD14", "PD15";
+				function = "spi1";
+			};
+
 			/omit-if-no-ref/
 			uart1_pg6_pins: uart1-pg6-pins {
 				pins = "PG6", "PG7";
-- 
2.39.5


