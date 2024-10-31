Received: from thales.epochal.quest (thales.epochal.quest [51.222.15.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BEF148FF6
	for <linux-sunxi@lists.linux.dev>; Thu, 31 Oct 2024 07:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.222.15.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730358213; cv=none; b=LyIso01bxzFN1Ja/fHF5aPQAEFXA1GvbIBQpogqwC7RPX6HjKB5UscOsgltiyYjYnpkT81/uati2NB0CPvXOI7db9kynamPPTjWFv3xCHh8L/YjV5Zsw/mthMjQWF6juFWxBSzxfPwiZSOVVhA7gYek2wVBOBSlMuIadsWqAJL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730358213; c=relaxed/simple;
	bh=QWIMkRwFSfYR0dNnMv3AW5ldohDRRnDT3LYte1P8RX8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A0S/PKUDKjQQ0sinCVrvFbuU4b1o580712muGu9MqgR8X74De9oAp9vgNQ4WrZVc32uiGrEO3IjQ16BRiQx0s0T2PWujCNriKL0nBkKfUkA8rUBnB1votqFoubvtCL4BkPQBf/k+/kVU2whNA5LMHKkg5dWgfCYUk3E5t4Qwd9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=epochal.quest; spf=pass smtp.mailfrom=epochal.quest; dkim=pass (2048-bit key) header.d=epochal.quest header.i=@epochal.quest header.b=SXFadOLv; arc=none smtp.client-ip=51.222.15.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=epochal.quest
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=epochal.quest
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=epochal.quest header.i=@epochal.quest header.b="SXFadOLv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=epochal.quest;
	s=default; t=1730358204;
	bh=QWIMkRwFSfYR0dNnMv3AW5ldohDRRnDT3LYte1P8RX8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SXFadOLvX/GyAtSLeo3PViVQiCHN8pHiW359bVjDXZzTgblk1t+pxwGpmJ4q3gqb6
	 cpyoKU+1d4nsp21NslKYTVrOXz/v1lM0NMt1sfV/qp/OP1UDfQYrZVL+r+LBfIJlqG
	 y6yZR/SnP8iw6QcuWbmubI9sxZSwPgW3Vh94XGOifz7G3ZJfCKDEN9M9qJN1xJPeRe
	 DV/1WBlQ585KqQznivxbsAI12bc0Vrafw8//3fv1ysvHsEYxOT/dT2ZxFUXFEm0FWi
	 dafOJL60o4i4FuV25DhD8bu64vjs8J0XukE00Sf/xwr2J/T4jZiUvr6SzwlYCe68yU
	 8ykoXM91RFSVg==
X-Virus-Scanned: by epochal.quest
From: Cody Eksal <masterr3c0rd@epochal.quest>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Nishanth Menon <nm@ti.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Yangtao Li <tiny.windzz@gmail.com>,
	Parthiban <parthiban@linumiz.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Cody Eksal <masterr3c0rd@epochal.quest>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/13] arm64: allwinner: A100: enable EHCI, OHCI and USB PHY nodes in Perf1
Date: Thu, 31 Oct 2024 04:02:20 -0300
Message-ID: <20241031070232.1793078-8-masterr3c0rd@epochal.quest>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241031070232.1793078-1-masterr3c0rd@epochal.quest>
References: <20241031070232.1793078-1-masterr3c0rd@epochal.quest>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yangtao Li <frank@allwinnertech.com>

Add USB support on A100 perf1 board, which include two USB2.0 port.

Signed-off-by: Yangtao Li <frank@allwinnertech.com>
Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
---
Changes in V2:
 - Add dr_mode here, instead of in the .dtsi

 .../allwinner/sun50i-a100-allwinner-perf1.dts | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100-allwinner-perf1.dts b/arch/arm64/boot/dts/allwinner/sun50i-a100-allwinner-perf1.dts
index f5c5c1464482..2f8c7ee60283 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a100-allwinner-perf1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a100-allwinner-perf1.dts
@@ -7,6 +7,8 @@
 
 #include "sun50i-a100.dtsi"
 
+#include <dt-bindings/gpio/gpio.h>
+
 /{
 	model = "Allwinner A100 Perf1";
 	compatible = "allwinner,a100-perf1", "allwinner,sun50i-a100";
@@ -18,6 +20,36 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	reg_usb1_vbus: usb1-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "usb1-vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&pio 7 10 GPIO_ACTIVE_HIGH>; /* PH10 */
+		enable-active-high;
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
+&ohci0 {
+	status = "okay";
+};
+
+&ohci1 {
+	status = "okay";
+};
+
+&usb_otg {
+	dr_mode = "otg";
+	status = "okay";
 };
 
 &pio {
@@ -178,3 +210,10 @@ &uart0 {
 	pinctrl-0 = <&uart0_pb_pins>;
 	status = "okay";
 };
+
+&usbphy {
+	usb0_id_det-gpios = <&pio 7 8 GPIO_ACTIVE_HIGH>; /* PH8 */
+	usb0_vbus-supply = <&reg_drivevbus>;
+	usb1_vbus-supply = <&reg_usb1_vbus>;
+	status = "okay";
+};
-- 
2.47.0

