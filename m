Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFABA7F
	for <linux-sunxi@lists.linux.dev>; Mon, 12 Sep 2022 00:02:05 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DECA116F8;
	Sun, 11 Sep 2022 17:02:11 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D6AD23F73B;
	Sun, 11 Sep 2022 17:02:02 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Karl Kurbjun <karl.os@veroson.com>,
	Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH 7/7] arm64: dts: allwinner: h616: X96 Mate: Add USB nodes
Date: Mon, 12 Sep 2022 00:59:45 +0100
Message-Id: <20220911235945.6635-8-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220911235945.6635-1-andre.przywara@arm.com>
References: <20220911235945.6635-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The X96 Mate TV box has two USB-A ports, VBUS is always on and connected
to the DC input.
Since USB port 0 is connected to an USB-A receptable, we configure it
as a host port. Using it as a peripheral is dangerous, because VBUS is
always on.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 .../dts/allwinner/sun50i-h616-x96-mate.dts    | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dts b/arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dts
index 6619db34714a..07424c28b696 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dts
@@ -32,6 +32,14 @@ reg_vcc5v: vcc5v {
 	};
 };
 
+&ehci0 {
+	status = "okay";
+};
+
+&ehci2 {
+	status = "okay";
+};
+
 &ir {
 	status = "okay";
 };
@@ -54,6 +62,14 @@ &mmc2 {
 	status = "okay";
 };
 
+&ohci0 {
+	status = "okay";
+};
+
+&ohci2 {
+	status = "okay";
+};
+
 &r_rsb {
 	status = "okay";
 
@@ -175,3 +191,12 @@ &uart0 {
 	pinctrl-0 = <&uart0_ph_pins>;
 	status = "okay";
 };
+
+&usbotg {
+	dr_mode = "host";	/* USB A type receptable */
+	status = "okay";
+};
+
+&usbphy {
+	status = "okay";
+};
-- 
2.35.3

