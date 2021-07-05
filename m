Received: from m12-14.163.com (m12-14.163.com [220.181.12.14])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EC94168
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Jul 2021 03:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=mlvt/TFaHoC2i1egkM
	uZiaKIlPJMLgZcLOd+NMsIg4U=; b=S57yWLVgogMo+mfeyS+/UuTJoK0eeRn1eQ
	NP58OWglIyr5HqP6X6Gwzdee2+R+4PV3HrP1kqQNz86bhAbBbI/F6U+1sGSxJGA5
	Asx/GA7YRRNP9DDdO2Q3gE8xuzZQMsnS+8kHFskxS0SJgU/C+JJgHz6xkrgnHe0j
	c6qW9T08M=
Received: from localhost.localdomain (unknown [218.201.129.20])
	by smtp10 (Coremail) with SMTP id DsCowAB3U30AfeJgWfg4SQ--.36461S6;
	Mon, 05 Jul 2021 11:31:14 +0800 (CST)
From: qianfanguijin@163.com
To: linux-sunxi@lists.linux.dev
Cc: mripard@kernel.org,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	andre.przywara@arm.com,
	qianfan Zhao <qianfanguijin@163.com>
Subject: [PATCH v3 3/3] ARM: dts: sun8i: r40: bananapi-m2-ultra: Enable usb_otg
Date: Mon,  5 Jul 2021 11:31:04 +0800
Message-Id: <20210705033104.7824-3-qianfanguijin@163.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210705033104.7824-1-qianfanguijin@163.com>
References: <20210705033104.7824-1-qianfanguijin@163.com>
X-CM-TRANSID:DsCowAB3U30AfeJgWfg4SQ--.36461S6
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kr1fCF15KryxWw1xXF1kXwb_yoW8XF4rpa
	4DuFs8Cr4rGr43JwnIqr40ya43C3Z5uryFvF1xCa48Jrn7XanrXryfKwn5uFW5G34rAw40
	vFZxZr1xGr4DZw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jnTmhUUUUU=
X-Originating-IP: [218.201.129.20]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/1tbiXALG7VXl0LWzoAAAsz
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

From: qianfan Zhao <qianfanguijin@163.com>

Enable it.

Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
---
 .../boot/dts/sun8i-r40-bananapi-m2-ultra.dts  | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts b/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
index a6a1087a0c9b..23b054665b9a 100644
--- a/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
+++ b/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
@@ -43,6 +43,7 @@
 
 /dts-v1/;
 #include "sun8i-r40.dtsi"
+#include "sunxi-common-regulators.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
 
@@ -159,6 +160,7 @@
 		reg = <0x34>;
 		interrupt-parent = <&nmi_intc>;
 		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+		x-powers,drive-vbus-en;
 	};
 };
 
@@ -293,6 +295,11 @@
 	regulator-name = "vdd2v5-sata";
 };
 
+&reg_drivevbus {
+	regulator-name = "usb0-vbus";
+	status = "okay";
+};
+
 &reg_eldo3 {
 	regulator-min-microvolt = <1200000>;
 	regulator-max-microvolt = <1200000>;
@@ -328,7 +335,20 @@
 	};
 };
 
+&usb_otg {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&usb_power_supply {
+	status = "okay";
+};
+
 &usbphy {
+	usb0_id_det-gpios = <&pio 8 4 GPIO_ACTIVE_HIGH>; /* PI4 */
+	usb0_vbus_det-gpios = <&pio 8 8 GPIO_ACTIVE_HIGH>; /* PI8 */
+	usb0_vbus_power-supply = <&usb_power_supply>;
+	usb0_vbus-supply = <&reg_drivevbus>;
 	usb1_vbus-supply = <&reg_vcc5v0>;
 	usb2_vbus-supply = <&reg_vcc5v0>;
 	status = "okay";
-- 
2.17.1

