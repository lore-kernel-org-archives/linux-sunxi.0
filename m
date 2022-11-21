Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844716FA6
	for <linux-sunxi@lists.linux.dev>; Mon, 21 Nov 2022 17:18:16 +0000 (UTC)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id CF6E460013;
	Mon, 21 Nov 2022 17:18:08 +0000 (UTC)
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
Subject: [PATCH RFC v2 5/7] arm64: dts: imx: fix touchscreen reset GPIO polarity
Date: Mon, 21 Nov 2022 18:17:22 +0100
Message-Id: <20221103-upstream-goodix-reset-v2-5-2c38fb03a300@theobroma-systems.com>
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
 arch/arm64/boot/dts/freescale/imx8mm-prt8mm.dts         | 2 +-
 arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-prt8mm.dts b/arch/arm64/boot/dts/freescale/imx8mm-prt8mm.dts
index 9fbbbb556c0b3..df7e5ae9698e1 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-prt8mm.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-prt8mm.dts
@@ -107,7 +107,7 @@ touchscreeen@5d {
 		interrupt-parent = <&gpio1>;
 		interrupts = <8 IRQ_TYPE_NONE>;
 		irq-gpios = <&gpio1 8 GPIO_ACTIVE_HIGH>;
-		reset-gpios = <&gpio1 9 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
 	};
 
 	temp-sense@70 {
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts b/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
index 6445c6b90b5bb..b038300812b1e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
@@ -542,7 +542,7 @@ touchscreen@5d {
 		pinctrl-0 = <&pinctrl_ts>;
 		interrupt-parent = <&gpio3>;
 		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
-		reset-gpios = <&gpio1 5 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&gpio1 5 GPIO_ACTIVE_LOW>;
 		irq-gpios = <&gpio3 0 GPIO_ACTIVE_HIGH>;
 		touchscreen-size-x = <720>;
 		touchscreen-size-y = <1440>;

-- 
b4 0.10.1
