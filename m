Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.155.65.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A1310780
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Aug 2023 14:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=biqu3d.com;
	s=tfld2305; t=1691420276;
	bh=zdefhG/PFLyxArKbSW/UaOYL24HZ3WlFssmQfy8avxA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Xs+ZTvRtESLuskNuTQUiDTKZ15kWcBXIn7rYzPJ7PNWy3bB3ZvsUoO9TLUYxbj4Zb
	 gehMX6jVx1u4892s96/6kda7Vd7BYjNhzOhiDy1GPmHy26azJFoA1q91GzTP/5fFW4
	 o1hfmGqV6sNgZNDG3ndMoMN+kLbauc/+s4PgQ6v4=
X-QQ-mid: bizesmtp83t1691420175tsc30ojk
Received: from localhost.localdomain ( [178.41.211.221])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 07 Aug 2023 22:56:00 +0800 (CST)
X-QQ-SSF: 01400000000000803000000A0000000
X-QQ-FEAT: 3M0okmaRx3jZHxKYQ/DeWo6+UfcXXqdJWPtzGFOeVGhgk+tOjxxmIMX5G6RUb
	m9k4dxRIOcSLP8+NV1WPuw/XkK7wW5DUWf50DrBGhIFllnVqehqg3q+n2iMWf52RqQlnx+X
	QJvKDFn52FdxS8dce/sI1x0AhZMveSDYPfeJL08PBubcsrE5fDfINVBvo60dYWJEv8rKyKS
	vy+D/faF17P0ANh93CAiF+isOfLUprjH8H2o1xzA3igqUK6fBHPz51RQGc4e5ijTldZxcSr
	hJX8pnelLxs9r0fkIsRYB4obHEElMHf38+EPcpAEj6dIeSeO/wMjnk94YF75UBEmApU1hp6
	AajoLp/dHM83GnzpQhyV8at4CS6dwMRZlsAgBN+TmIrOE9ggQgRIrfOb7Q5ltaJZvQVYlN4
	y+Yn0UjpMOA=
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 14459560589698925010
From: Martin Botka <martin@biqu3d.com>
To: Martin Botka <martin.botka1@gmail.com>
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
	Andrew Lunn <andrew@lunn.ch>,
	Icenowy Zheng <uwu@icenowy.me>,
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
Subject: [PATCH v4 4/4] arm64: dts: allwinner: h616: Add BigTreeTech Pi support
Date: Mon,  7 Aug 2023 16:53:24 +0200
Message-ID: <09BFA974F83AB0E8+20230807145349.2220490-5-martin@biqu3d.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230807145349.2220490-1-martin@biqu3d.com>
References: <20230807145349.2220490-1-martin@biqu3d.com>
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
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
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

