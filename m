Received: from smtpbg587.qq.com (smtpbg587.qq.com [113.96.223.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2A63481
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Aug 2021 06:26:24 +0000 (UTC)
X-QQ-Spam: true
X-QQ-mid: bizesmtp41t1627885392twhm8kke
Received: from localhost.localdomain (unknown [113.89.245.207])
	by esmtp6.qq.com (ESMTP) with 
	id ; Mon, 02 Aug 2021 14:23:11 +0800 (CST)
X-QQ-SSF: 01100000002000206000B00A0000000
From: Icenowy Zheng <icenowy@sipeed.com>
To: Rob Herring <robh+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <icenowy@sipeed.com>
Subject: [PATCH 17/17] arm64: allwinner: dts: r329: add support for Sipeed MaixSense
Date: Mon,  2 Aug 2021 14:22:12 +0800
Message-Id: <20210802062212.73220-18-icenowy@sipeed.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210802062212.73220-1-icenowy@sipeed.com>
References: <20210802062212.73220-1-icenowy@sipeed.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:sipeed.com:qybgspam:qybgspam3

Sipeed MaixSense is a R329 devkit based on Maix IIA SoM.

Add support for it.

Signed-off-by: Icenowy Zheng <icenowy@sipeed.com>
---
 arch/arm64/boot/dts/allwinner/Makefile        |  1 +
 .../dts/allwinner/sun50i-r329-maixsense.dts   | 37 +++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-r329-maixsense.dts

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index a96d9d2d8dd8..80a336d480ac 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -37,3 +37,4 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-orangepi-one-plus.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-pine-h64.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-pine-h64-model-b.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-tanix-tx6.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun50i-r329-maixsense.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-r329-maixsense.dts b/arch/arm64/boot/dts/allwinner/sun50i-r329-maixsense.dts
new file mode 100644
index 000000000000..1876b9d0b080
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-r329-maixsense.dts
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+// Copyright (c) 2021 Sipeed
+
+/dts-v1/;
+
+#include "sun50i-r329-maix-iia.dtsi"
+
+/ {
+	model = "Sipeed MaixSense";
+	compatible = "sipeed,maixsense", "sipeed,maix-iia",
+		     "allwinner,sun50i-r329";
+
+	aliases {
+		serial0 = &uart0;
+		mmc0 = &mmc0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&mmc0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc0_pf_pins>;
+
+	vmmc-supply = <&reg_vcc3v3>;
+	bus-width = <4>;
+	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
+	status = "okay";
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pb_pins>;
+	status = "okay";
+};
-- 
2.30.2

