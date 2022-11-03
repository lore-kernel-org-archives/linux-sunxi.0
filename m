Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C077481
	for <linux-sunxi@lists.linux.dev>; Thu,  3 Nov 2022 14:48:41 +0000 (UTC)
Received: from relay11.mail.gandi.net (unknown [217.70.178.231])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 979DDC3B81
	for <linux-sunxi@lists.linux.dev>; Thu,  3 Nov 2022 14:44:39 +0000 (UTC)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id D516B10000E;
	Thu,  3 Nov 2022 14:44:06 +0000 (UTC)
From: Quentin Schulz <foss+kernel@0leil.net>
To: hadess@hadess.net,
	hdegoede@redhat.com,
	dmitry.torokhov@gmail.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	agross@kernel.org,
	andersson@kernel.org,
	konrad.dybcio@somainline.org,
	heiko@sntech.de
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>
Subject: [RFC PATCH 0/7] fix reset line polarity for Goodix touchscreen controllers
Date: Thu,  3 Nov 2022 15:43:45 +0100
Message-Id: <20221103-upstream-goodix-reset-v1-0-87b49ae589f1@theobroma-systems.com>
X-Mailer: git-send-email 2.38.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The Goodix touchscreen controller has a reset line active low. It happens to
also be used to configure its i2c address at runtime. If the reset line is
incorrectly asserted, the address will be wrongly configured. This cost me a few
hours yesterday, trying to figure out why the touchscreen wouldn't work.

The driver is "asserting" this reset GPIO by setting its output to 0, probably
to reflect the physical state of the line. However, this relies on the fact that
the Device Tree node setting the reset line polarity to active high, which is
incorrect since the reset is active low in hardware.

To fix this inconsistency, the polarity is inverted to not confuse the user
about the reset line polarity.

This is marked as RFC because it breaks DT compatibility and also the Google
CoachZ device is the only one with an active low polarity for the reset GPIO
in DT, so not sure if it is a typo or its state is actually inverted (so GPIO
active high to drive the reset line low). Changing it anyways since the polarity
is changed in the driver so it needs to be changed in DT too.

I'm all ears if there's a better way to handle this. We could document this in
the DT binding but this kinda breaks the promise we make that the DT is not
bound to the driver implementation.

Thanks,
Quentin

To: Bastien Nocera <hadess@hadess.net>
To: Hans de Goede <hdegoede@redhat.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
To: Shawn Guo <shawnguo@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
To: NXP Linux Team <linux-imx@nxp.com>
To: Chen-Yu Tsai <wens@csie.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>
To: Andy Gross <agross@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@somainline.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>

---
Quentin Schulz (7):
      Input: goodix - fix reset polarity
      ARM: dts: imx: fix touchscreen reset GPIO polarity
      ARM: dts: sunxi: fix touchscreen reset GPIO polarity
      arm64: dts: allwinner: fix touchscreen reset GPIO polarity
      arm64: dts: imx: fix touchscreen reset GPIO polarity
      arm64: dts: qcom: fix touchscreen reset GPIO polarity
      arm64: dts: rockchip: fix touchscreen reset GPIO polarity

 arch/arm/boot/dts/imx6q-kp.dtsi                                  | 2 +-
 arch/arm/boot/dts/imx6ul-kontron-bl-43.dts                       | 2 +-
 arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts                   | 2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts       | 2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64-oceanic-5205-5inmfd.dts | 2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi          | 2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab.dts             | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-prt8mm.dts                  | 2 +-
 arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts          | 2 +-
 arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts                  | 2 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi              | 2 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi            | 2 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland.dtsi             | 2 +-
 arch/arm64/boot/dts/rockchip/px30-evb.dts                        | 2 +-
 arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi               | 2 +-
 arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts                 | 2 +-
 drivers/input/touchscreen/goodix.c                               | 4 ++--
 17 files changed, 18 insertions(+), 18 deletions(-)
---
base-commit: 8e5423e991e8cd0988d0c4a3f4ac4ca1af7d148a
change-id: 20221103-upstream-goodix-reset-aa1c65994f57

Best regards,
-- 
Quentin Schulz <quentin.schulz@theobroma-systems.com>
