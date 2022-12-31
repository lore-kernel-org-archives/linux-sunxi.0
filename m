Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA6F6111
	for <linux-sunxi@lists.linux.dev>; Sat, 31 Dec 2022 23:39:06 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id A24235C00A4;
	Sat, 31 Dec 2022 18:39:05 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Sat, 31 Dec 2022 18:39:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1672529945; x=1672616345; bh=YF
	Kd9giNzlj6iUohyftPkzjCm0pqQLw/TQaK49fbfIE=; b=a7KJ+hf8IGrqRNWT1U
	RWNSZpVMxgZ9iFyyUnyi6b6Rc4VBbw0rgRSgqGNZ5uXBubGAd23IUNhlHi15B+Pu
	hT6ZQ6WvFPW0HVs9LC3URvtTg+fq6w7O1y86lqw259hywBywq808sBfvt1+2CWQV
	s4/Rd22pCSE6G/78C02/pyf0DXnKT2q9SOhUkCJktgOO1E/vxQoqNvyjLywHvGr8
	lqsGky9d2RGQXb5TT1CKYRrf1ReebPgzhfMqzmljxm29KhFTUMgga64qJia2YjYu
	uy8TtYJUeG90FdvWd30xHuQ9WQiTfUJzEuxLuxNP4aDvlCGazV8gVPNuLQJaUYlj
	702w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1672529945; x=1672616345; bh=YFKd9giNzlj6i
	UohyftPkzjCm0pqQLw/TQaK49fbfIE=; b=jRJXt+KZAe7/jfTqfGdEpkcaNMrlg
	cPbuFscOlv16hKDdU70XO+4XF3lPQd7vhT5G+D64LbCTEoSAj0dM6MyIWeaUpu8X
	V5dwI4DBfaENAMWwFPCbEF356uCMCUDtH+/YkxzUksX0vwLYKYIKrMajs4+f/0C2
	Bi6siVOTnVljt6P2heh9TrNvhkigrOS5hTpPyLUN3UP+5DgaY2ms37y1yGZpHlRp
	uGACK5rM1+CZcrAtmykZSxEmiyPIi8+pSWYA88dKtxMjHo6/uO62th/1QQ+C0HR/
	P99vdVCbSUAch4P0ETFoYuMozbFC20JoMhwbZCyi68fsEa1/RQxIzOExA==
X-ME-Sender: <xms:GciwY9i-ZxfpMA1C0Q1JgUxZ_20T9WuKbnjLzAzakitWPeeeWD8GQQ>
    <xme:GciwYyBuuLOCV06rX_yqZ9oAN0SXAGZePY_mmKCfltMVblLMlfX9vQzCZ80EkvShQ
    QyVR7ymgPP_J0egng>
X-ME-Received: <xmr:GciwY9H7V3WvlaLBPncwKdhjqzRTBNlu6ld6zx38WgqdoCCmfh28Ik2FKedo8bVi3Ye0y1f_4J81o7ECMqeSNLW-SJK-rD_mp8bl73r66JmpUaB_-myv2VXpSQI8XYSkLB_KRg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrieelgddufecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpedukeetueduhedtleetvefguddvvdejhfefudelgfduveeggeehgfdu
    feeitdevteenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:GciwYyRqQ6paHTxjOvl3moLjcCQ9rj28vZ5S4vnqhKJ0mJPgxUee-A>
    <xmx:GciwY6xNhF1e0A1NZFNLfmh8pHWFV9dL60IcOiDTIvhIs0vNgSWXuw>
    <xmx:GciwY442lPK3lmNJbZ6w39C87IXh0TNMAxbEvnNNlyLSPfccltPWtg>
    <xmx:GciwY-D7dNYiWWde38qJHw1WvD_uXjao_Y9acnBQh-YaFAzPVOMYmQ>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 31 Dec 2022 18:39:04 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Andre Przywara <andre.przywara@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor@kernel.org>,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>,
	Samuel Holland <samuel@sholland.org>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH v4 09/12] riscv: dts: allwinner: Add Dongshan Nezha STU devicetree
Date: Sat, 31 Dec 2022 17:38:48 -0600
Message-Id: <20221231233851.24923-10-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221231233851.24923-1-samuel@sholland.org>
References: <20221231233851.24923-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 100ask Dongshan Nezha STU is a system-on-module that can be used
standalone or with a carrier board. The SoM provides gigabit Ethernet,
HDMI, a USB peripheral port, and WiFi/Bluetooth via an RTL8723DS chip.

The "DIY" carrier board exposes almost every pin from the D1 SoC to 0.1"
headers, but contains no digital circuitry, so it does not have its own
devicetree.

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Reviewed-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

(no changes since v3)

Changes in v3:
 - Drop mmc alias

 arch/riscv/boot/dts/allwinner/Makefile        |   1 +
 .../sun20i-d1-dongshan-nezha-stu.dts          | 117 ++++++++++++++++++
 2 files changed, 118 insertions(+)
 create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dts

diff --git a/arch/riscv/boot/dts/allwinner/Makefile b/arch/riscv/boot/dts/allwinner/Makefile
index 2ed586fafaea..87f70b1af6b4 100644
--- a/arch/riscv/boot/dts/allwinner/Makefile
+++ b/arch/riscv/boot/dts/allwinner/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1-dongshan-nezha-stu.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1-lichee-rv-86-panel-480p.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1-lichee-rv-86-panel-720p.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1-lichee-rv-dock.dtb
diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dts b/arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dts
new file mode 100644
index 000000000000..8785de3c9224
--- /dev/null
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dts
@@ -0,0 +1,117 @@
+// SPDX-License-Identifier: (GPL-2.0+ or MIT)
+// Copyright (C) 2022 Samuel Holland <samuel@sholland.org>
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+
+/dts-v1/;
+
+#include "sun20i-d1.dtsi"
+#include "sun20i-common-regulators.dtsi"
+
+/ {
+	model = "Dongshan Nezha STU";
+	compatible = "100ask,dongshan-nezha-stu", "allwinner,sun20i-d1";
+
+	aliases {
+		ethernet0 = &emac;
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
+		led-0 {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_STATUS;
+			gpios = <&pio 2 1 GPIO_ACTIVE_HIGH>; /* PC1 */
+		};
+	};
+
+	reg_usbvbus: usbvbus {
+		compatible = "regulator-fixed";
+		regulator-name = "usbvbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&pio 3 19 GPIO_ACTIVE_HIGH>; /* PD19 */
+		enable-active-high;
+		vin-supply = <&reg_vcc>;
+	};
+
+	/*
+	 * This regulator is PWM-controlled, but the PWM controller is not
+	 * yet supported, so fix the regulator to its default voltage.
+	 */
+	reg_vdd_cpu: vdd-cpu {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd-cpu";
+		regulator-min-microvolt = <1100000>;
+		regulator-max-microvolt = <1100000>;
+		vin-supply = <&reg_vcc>;
+	};
+};
+
+&cpu0 {
+	cpu-supply = <&reg_vdd_cpu>;
+};
+
+&dcxo {
+	clock-frequency = <24000000>;
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&emac {
+	pinctrl-0 = <&rgmii_pe_pins>;
+	pinctrl-names = "default";
+	phy-handle = <&ext_rgmii_phy>;
+	phy-mode = "rgmii-id";
+	phy-supply = <&reg_vcc_3v3>;
+	status = "okay";
+};
+
+&mdio {
+	ext_rgmii_phy: ethernet-phy@1 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <1>;
+	};
+};
+
+&mmc0 {
+	broken-cd;
+	bus-width = <4>;
+	disable-wp;
+	vmmc-supply = <&reg_vcc_3v3>;
+	vqmmc-supply = <&reg_vcc_3v3>;
+	pinctrl-0 = <&mmc0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&uart0 {
+	pinctrl-0 = <&uart0_pb8_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&usb_otg {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&usbphy {
+	usb0_id_det-gpios = <&pio 3 21 GPIO_ACTIVE_HIGH>; /* PD21 */
+	usb0_vbus_det-gpios = <&pio 3 20 GPIO_ACTIVE_HIGH>; /* PD20 */
+	usb0_vbus-supply = <&reg_usbvbus>;
+	status = "okay";
+};
-- 
2.37.4

