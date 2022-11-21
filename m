Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD10B6FA6
	for <linux-sunxi@lists.linux.dev>; Mon, 21 Nov 2022 17:18:28 +0000 (UTC)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id ECFB16000B;
	Mon, 21 Nov 2022 17:18:20 +0000 (UTC)
From: Quentin Schulz <foss+kernel@0leil.net>
To: Shawn Guo <shawnguo@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Samuel Holland <samuel@sholland.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	Fabio Estevam <festevam@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Bastien Nocera <hadess@hadess.net>,
	Chen-Yu Tsai <wens@csie.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Hans de Goede <hdegoede@redhat.com>,
	Andy Gross <agross@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	NXP Linux Team <linux-imx@nxp.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: [PATCH RFC v2 7/7] arm64: dts: rockchip: fix touchscreen reset GPIO polarity
Date: Mon, 21 Nov 2022 18:17:24 +0100
Message-Id: <20221103-upstream-goodix-reset-v2-7-2c38fb03a300@theobroma-systems.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221103-upstream-goodix-reset-v2-0-2c38fb03a300@theobroma-systems.com>
References: <20221103-upstream-goodix-reset-v2-0-2c38fb03a300@theobroma-systems.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.1
Content-Transfer-Encoding: 8bit

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

The reset line is active low for the Goodix touchscreen controller so
let's fix the polarity in the Device Tree node.

Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 arch/arm64/boot/dts/rockchip/px30-evb.dts          | 2 +-
 arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi | 2 +-
 arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/px30-evb.dts b/arch/arm64/boot/dts/rockchip/px30-evb.dts
index 07008d84434c1..7ecd38566e7e4 100644
--- a/arch/arm64/boot/dts/rockchip/px30-evb.dts
+++ b/arch/arm64/boot/dts/rockchip/px30-evb.dts
@@ -420,7 +420,7 @@ touchscreen@14 {
 		interrupt-parent = <&gpio0>;
 		interrupts = <RK_PA5 IRQ_TYPE_LEVEL_LOW>;
 		irq-gpios = <&gpio0 RK_PA5 GPIO_ACTIVE_LOW>;
-		reset-gpios = <&gpio0 RK_PB4 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&gpio0 RK_PB4 GPIO_ACTIVE_LOW>;
 		VDDIO-supply = <&vcc3v3_lcd>;
 	};
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi
index 78157521e9449..e63491fb443be 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi
@@ -588,7 +588,7 @@ touch: touchscreen@5d {
 		AVDD28-supply = <&vcc3v0_touch>;
 		VDDIO-supply = <&vcc3v0_touch>;
 		irq-gpios = <&gpio4 RK_PD5 GPIO_ACTIVE_HIGH>;
-		reset-gpios = <&gpio4 RK_PD6 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&gpio4 RK_PD6 GPIO_ACTIVE_LOW>;
 		status = "disabled";
 	};
 };
diff --git a/arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts
index 674792567fa6e..234531aaa430a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts
@@ -495,7 +495,7 @@ touchscreen0: goodix@14 {
 		irq-gpios = <&gpio0 RK_PB5 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&touch_int &touch_rst>;
-		reset-gpios = <&gpio0 RK_PB6 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&gpio0 RK_PB6 GPIO_ACTIVE_LOW>;
 		VDDIO-supply = <&vcc3v3_lcd0_n>;
 	};
 };

-- 
b4 0.10.1
