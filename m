Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0140639937C
	for <linux-sunxi@lists.linux.dev>; Sat, 26 Sep 2026 23:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790465200; cv=none; b=XJsffhJbBh0WO656ox/ONwIxUHqOYcC/KynjHfbh/41hGiF4ytSzdfQn5BHYh4JhKWxJhnCxN0XvWYrg3S7l9GiGqoI62H2stsiCEA7kBk4V6+YkNjG4s3H+0n/ocOBVbRIQiTaOiotKMkxnUthi8Jhn8+p9H7oioVCzacwJd8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790465200; c=relaxed/simple;
	bh=18BAa8o4E9lvNw8wwNFzP1FIpKXx6SRGQiiHFQNFT/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HTR4BPbafY82Ao3bPnx8L8nZa+hcZL2Sd9C1gX9uaVAm3CbVLLQwOPrIqswRDWc2b83cNIER+CpzmDAfSZvxd3qJDMilRagSN6YdEXmaXzg/g84Q5f6OYO+7My6u3vWYhQhD43T5mnKquz4Z+gldAPPybyxHdyz8C4Zcuf2xSQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=vegZt+4D; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="vegZt+4D"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F9B11570;
	Sat, 26 Sep 2026 16:26:35 -0700 (PDT)
Received: from ryzen.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AA47E3F85F;
	Sat, 26 Sep 2026 16:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790465198; bh=18BAa8o4E9lvNw8wwNFzP1FIpKXx6SRGQiiHFQNFT/M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vegZt+4Dru+hnxX89KGXOyf2wnZKm+shsFlnfiTbPpYispoyRFxWxoVRmpMO8y6IM
	 Lmv7M4/ECvjdExyThNWiINNxwALXjKqf/lVKaQLIoK8FJCi3hGwA+MXxIoWQuYS7rF
	 5T38ZgwJpioR0xK/WfKKcOmGQ5czwoXDSA7KxNc4=
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Per Larsson <per@palvencia.se>
Subject: [PATCH v2 2/2] arm64: dts: allwinner: a523: x96qpro+: enable Ethernet support
Date: Sun, 27 Sep 2026 01:21:42 +0200
Message-ID: <20260926232142.5244-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.4
In-Reply-To: <20260926232142.5244-1-andre.przywara@arm.com>
References: <20260926232142.5244-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The X96QPro+ TV Box features a Gigabit Ethernet capable port, which is
driven by the secondary EMAC, and supported by a Maxio MAE0621A PHY.

Add the required devicetree nodes to enable that port.

The PHY is not clocked by an external crystal oscillator, but relies on a
SoC-provided clock fanout pin for its 25 MHz reference input clock. The
clock is referenced in the PHY DT node, which not all systems might enable
before scanning the MDIO bus. To help with that problem, the PHY compatible
string is using the PHY ID, which means the MDIO bus scanning can be
skipped.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Tested-by: Per Larsson <per@palvencia.se>
---
 .../dts/allwinner/sun55i-h728-x96qpro+.dts    | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
index eb9fd0a65b41c..8015473ecb7ae 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
@@ -13,6 +13,7 @@ / {
 
 	aliases {
 		serial0 = &uart0;
+		ethernet0 = &gmac1;
 	};
 
 	chosen {
@@ -72,11 +73,38 @@ &ehci1 {
 	status = "okay";
 };
 
+&gmac1 {
+	clocks = <&ccu CLK_BUS_EMAC1>, <&ccu CLK_MBUS_EMAC1>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&rgmii1_pins>;
+	phy-mode = "rgmii-id";
+	phy-handle = <&ext_rgmii_phy>;
+	phy-supply = <&reg_cldo3>;
+
+	tx-internal-delay-ps = <200>;
+	rx-internal-delay-ps = <500>;
+
+	status = "okay";
+};
+
 &gpu {
 	mali-supply = <&reg_dcdc2>;
 	status = "okay";
 };
 
+&mdio1 {
+	ext_rgmii_phy: ethernet-phy@1 {
+		compatible = "ethernet-phy-id7b74.4411";
+		reg = <1>;
+		clocks = <&ccu CLK_EMAC1_25M>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&ephy1_25m_pin>;
+		reset-gpios = <&pio 9 16 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <150000>;
+	};
+};
+
 &mmc0 {
 	vmmc-supply = <&reg_vcc3v3>;
 	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PF6 */
-- 
2.46.4

