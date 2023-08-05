Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.154.54.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993651FA0
	for <linux-sunxi@lists.linux.dev>; Sat,  5 Aug 2023 08:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=biqu3d.com;
	s=tfld2305; t=1691224761;
	bh=vEKjizOztuDqy9KmC2c7ykzZ5vlzp6rvrwPfNSHRDN0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=luzzkOD9PCNnmq/3WzzeWXWmUUyLBKEL9mbCR4sCDf7GSBFewMgWVyql1lm4KLhni
	 /Zixr4kuqMZ/FBLVVnoDrvjacNr7v/+FYVuA6UoFSYV7pf88ws1HiPWDyG7kpIV6DQ
	 Rw4hsxwEZ0Apt7VsGaUfj6scHu6RgK9jlJ6qMZzU=
X-QQ-mid: bizesmtp83t1691224702t71mm2ha
Received: from localhost.localdomain ( [178.41.211.221])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 05 Aug 2023 16:38:08 +0800 (CST)
X-QQ-SSF: 01400000000000505000000A0000000
X-QQ-FEAT: 1aHTM9ylpVzwFs/GMn1DOEf1VJBKSJIxCwOFsZ9Y00L5UuchrD3isPwzzPlN+
	3Wo9Qi1UuuRj797v532ipG9iSNY5LPW5BPomnvxicYQSGGuQb+49QuGuSutMzIT7Ii2phhb
	dfMb+JCYTs773uVR3/n7OKDQIck34EXPeln1VjATTPQtL4hMHzN81CLRn/iuW0StaqOQ1m2
	gfuDkb+/iU6f/yD8pIpXAfinPp9VBuO8VRYwE0ZGr+rZ0qkY+p/CrfVHDmLpgDO038PckP8
	8v/LSkOE4RMqprCy5FMtp3fndoZpDxpf98Qg08KnN9Gr/ARyKtfEvmFcdKLPSRq5TgIz98R
	wz+LMzNMn1TbzYt+N6dtJw4eDxgiHNq4V2V7LJ2xF3acK/jwtmUmzd6uBR4u3kWN0jxIBTX
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 9226605885258819759
From: Martin Botka <martin@biqu3d.com>
To: martin.botka1@gmail.com
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Jami Kettunen <jamipkettunen@somainline.org>,
	Paul Bouchara <paul.bouchara@somainline.org>,
	Martin Botka <martin.botka@somainline.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Martin Botka <martin@biqu3d.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Ludwig Kormann <ludwig.kormann@ict42.de>,
	Icenowy Zheng <uwu@icenowy.me>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiko Stuebner <heiko@sntech.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Chris Morgan <macromorgan@hotmail.com>,
	Jagan Teki <jagan@edgeble.ai>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] arm64: dts: allwinner: h616: Add BigTreeTech Pi support
Date: Sat,  5 Aug 2023 10:36:07 +0200
Message-ID: <8022803C8A2B3898+20230805083636.788048-5-martin@biqu3d.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230805083636.788048-1-martin@biqu3d.com>
References: <20230805083636.788048-1-martin@biqu3d.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:biqu3d.com:qybglogicsvrgz:qybglogicsvrgz5a-1

The BigTreeTech Pi is an H616 based board based on CB1.
Just in Rpi format board.

It features the same internals as BTT CB1 but adds:
    - Fan port
    - IR receiver
    - ADXL345 Accelerometer connector via SPI
    - 24V DC power supply via terminal plugs
    - USB to CAN module connector (The actual USB to CAN happens on the external module)

List of currently working things is same as BTT CB1 but also:
    - IR receiver
    - ADXL345 connector

Signed-off-by: Martin Botka <martin@biqu3d.com>
---
Changes in V2:
    - Add UART alongside aliases and chosen for it
    - Add model string
    - Enable IR receiver
    - Enable SPI0 for ADXL345 connector
Changes in V3:
    - Add missing semicolons
    - Add pinctrl for SPI0

 arch/arm64/boot/dts/allwinner/Makefile        |  1 +
 .../allwinner/sun50i-h616-bigtreetech-pi.dts  | 70 +++++++++++++++++++
 2 files changed, 71 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dts

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index 7b386428510b..0b6232a7f328 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -39,5 +39,6 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-pine-h64-model-b.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-tanix-tx6.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-tanix-tx6-mini.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-bigtreetech-cb1-manta.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-bigtreetech-pi.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-orangepi-zero2.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-x96-mate.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dts b/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dts
new file mode 100644
index 000000000000..b0d0386e8f13
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dts
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: (GPL-2.0+ or MIT)
+/*
+ * Copyright (C) 2023 Martin Botka <martin@biqu3d.com>.
+ */
+
+/dts-v1/;
+
+#include "sun50i-h616-bigtreetech-cb1.dtsi"
+
+/ {
+	model = "BigTreeTech Pi";
+	compatible = "bigtreetech,pi", "allwinner,sun50i-h616";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
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
+&ehci2 {
+	status = "okay";
+};
+
+&ehci3 {
+	status = "okay";
+};
+
+&ir {
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
+&ohci2 {
+	status = "okay";
+};
+
+&ohci3 {
+	status = "okay";
+};
+
+&spi0 {
+	/* SPI connection for onboard connector for ADXL345 accelerometer */
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi0_pins>, <&spi0_cs0_pin>;
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_ph_pins>;
+	status = "okay";
+};
-- 
2.41.0

