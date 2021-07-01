Received: from m12-12.163.com (m12-12.163.com [220.181.12.12])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 478AB168
	for <linux-sunxi@lists.linux.dev>; Thu,  1 Jul 2021 01:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=zHdQnfpXOaaYIj0CmL
	qSBzZnX7QWdRQ6IV6jlCwApK0=; b=MfCJCmMqA1wwcERarrh/K2lndwRUa7kmKO
	Co+LKz7u98PlnblqAWAsf961KcZkNiUdnUG2DqQI2QmALk1KE6JFR+p3rp18HDqp
	g9fwk+fQ3Fjdr1gVsroOwUCAg+BbOCwOC1A6vIhJxQ3ndvwqfO9hsgjxE6O/zo+4
	oc+zIALfU=
Received: from localhost.localdomain (unknown [218.201.129.20])
	by smtp8 (Coremail) with SMTP id DMCowABXPVpUH91g0KifMg--.33338S6;
	Thu, 01 Jul 2021 09:50:14 +0800 (CST)
From: qianfanguijin@163.com
To: linux-sunxi@lists.linux.dev
Cc: mripard@kernel.org,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	qianfan Zhao <qianfanguijin@163.com>
Subject: [PATCH 3/3] ARM: dts: sun8i: r40: bananapi-m2-ultra: Enable usb_otg
Date: Thu,  1 Jul 2021 09:50:09 +0800
Message-Id: <20210701015009.13985-3-qianfanguijin@163.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210701015009.13985-1-qianfanguijin@163.com>
References: <20210701015009.13985-1-qianfanguijin@163.com>
X-CM-TRANSID:DMCowABXPVpUH91g0KifMg--.33338S6
X-Coremail-Antispam: 1Uf129KBjvJXoW7JF1fZFyrCr43ArWUArWDArb_yoW8JryUp3
	sruFZ5G3y8KF4rXwnIvrWvkry5CFnYqrySyF1xCa48Jrn7XayDXryfKwn3uFW5XrWrAw4F
	9FZ3ArnrGr4qvwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j5PEfUUUUU=
X-Originating-IP: [218.201.129.20]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/xtbBRxfC7VPADPh67gAAsM
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

From: qianfan Zhao <qianfanguijin@163.com>

Enable it.

Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
---
 arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts b/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
index a6a1087a0c9b..072535b383b5 100644
--- a/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
+++ b/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
@@ -43,6 +43,7 @@
 
 /dts-v1/;
 #include "sun8i-r40.dtsi"
+#include "sunxi-common-regulators.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
 
@@ -299,6 +300,11 @@
 	regulator-name = "vdd1v2-sata";
 };
 
+&reg_usb0_vbus {
+	gpio = <&pio 8 13 GPIO_ACTIVE_HIGH>; /* PI13 */
+	status = "okay";
+};
+
 &tcon_tv0 {
 	status = "okay";
 };
@@ -328,7 +334,15 @@
 	};
 };
 
+&usb_otg {
+	dr_mode = "peripheral";
+	status = "okay";
+};
+
 &usbphy {
+	usb0_id_det-gpios = <&pio 8 4 GPIO_ACTIVE_HIGH>; /* PI4 */
+	usb0_vbus_det-gpios = <&pio 8 8 GPIO_ACTIVE_HIGH>; /* PH8 */
+	usb0_vbus-supply = <&reg_usb0_vbus>;
 	usb1_vbus-supply = <&reg_vcc5v0>;
 	usb2_vbus-supply = <&reg_vcc5v0>;
 	status = "okay";
-- 
2.17.1


