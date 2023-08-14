Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [5.144.164.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1011842
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Aug 2023 08:07:17 +0000 (UTC)
Received: from [192.168.2.137] (bband-dyn221.178-41-211.t-com.sk [178.41.211.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 8FB711F54E;
	Mon, 14 Aug 2023 10:07:09 +0200 (CEST)
From: Martin Botka <martin.botka@somainline.org>
Date: Mon, 14 Aug 2023 10:07:06 +0200
Subject: [PATCH v5 4/4] arm64: dts: allwinner: h616: Add BigTreeTech Pi
 support
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230814-b4-cb1-v5-4-92135086dee4@somainline.org>
References: <20230814-b4-cb1-v5-0-92135086dee4@somainline.org>
In-Reply-To: <20230814-b4-cb1-v5-0-92135086dee4@somainline.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, Andre Przywara <andre.przywara@arm.com>, 
 Alan Ma <tech@biqu3d.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Martin Botka <martin@biqu3d.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Martin Botka <martin.botka@somainline.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692000426; l=2750;
 i=martin.botka@somainline.org; s=20230811; h=from:subject:message-id;
 bh=EegbgtE4WOEsugVNAelzHEdNpUdhoeJMT8E5wnJSOf4=;
 b=6CjT0ZKWHXVj8TcyNkq1HL3NFrOhW+jSfbpY82moZHaYjsWHYvAWc3+lkANg5jDyty3O5JNYq
 6SbqYBtcJYVDIvzs/C9I1g0qNjobwiQcz4Oif6tPTiS37ipA/d5q3W1
X-Developer-Key: i=martin.botka@somainline.org; a=ed25519;
 pk=aTCd3jmwU8GrJidWg3DSKLpdVMcpFzXzCSLXLR6NtWU=

From: Martin Botka <martin@biqu3d.com>

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
 arch/arm64/boot/dts/allwinner/Makefile             |  1 +
 .../dts/allwinner/sun50i-h616-bigtreetech-pi.dts   | 70 ++++++++++++++++++++++
 2 files changed, 71 insertions(+)

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

