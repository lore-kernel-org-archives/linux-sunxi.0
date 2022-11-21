Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353496FA6
	for <linux-sunxi@lists.linux.dev>; Mon, 21 Nov 2022 17:18:21 +0000 (UTC)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id 0EE4960006;
	Mon, 21 Nov 2022 17:18:14 +0000 (UTC)
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
Subject: [PATCH RFC v2 6/7] arm64: dts: qcom: fix touchscreen reset GPIO polarity
Date: Mon, 21 Nov 2022 18:17:23 +0100
Message-Id: <20221103-upstream-goodix-reset-v2-6-2c38fb03a300@theobroma-systems.com>
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
Content-Transfer-Encoding: quoted-printable

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>=0D

The reset line is active low for the Goodix touchscreen controller so=0D
let's fix the polarity in the Device Tree node.=0D
=0D
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>=0D
---=0D
Changes in v2:=0D
- removed Qcom SC7180 Trogdor-based devices changes as they are not using t=
his Goodix driver,=0D
=0D
 arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts | 2 +-=0D
 1 file changed, 1 insertion(+), 1 deletion(-)=0D
=0D
diff --git a/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts b/arch/arm64/b=
oot/dts/qcom/msm8998-fxtec-pro1.dts=0D
index 429ba57e20f71..8f738cade2652 100644=0D
--- a/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts=0D
+++ b/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts=0D
@@ -249,7 +249,7 @@ touchscreen@14 {=0D
 		reg =3D <0x14>;=0D
 		interrupt-parent =3D <&tlmm>;=0D
 		interrupts =3D <125 IRQ_TYPE_LEVEL_LOW>;=0D
-		reset-gpios =3D <&tlmm 89 GPIO_ACTIVE_HIGH>;=0D
+		reset-gpios =3D <&tlmm 89 GPIO_ACTIVE_LOW>;=0D
 		AVDD28-supply =3D <&vreg_l28_3p0>;=0D
 		VDDIO-supply =3D <&ts_vio_vreg>;=0D
 		pinctrl-names =3D "active";=0D
=0D
-- =0D
b4 0.10.1=0D
