Received: from m12-12.163.com (m12-12.163.com [220.181.12.12])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9087929D6
	for <linux-sunxi@lists.linux.dev>; Thu,  1 Jul 2021 01:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=YyZ7AJrTEDN9/86jDu
	8eeELhqiI5k+si9Iv1h5aShMY=; b=WNqAhTOq6g0c77lxo31a9f/TDx5gStfUMe
	3UstjT3cfNl8Bde//Iktc9ysYYhyUQtWdSJ7XLLmFpvTHdY6LZ+LnQ1qKQCqYDNm
	1WBwuweO7AqZKUcjUe2x1um3qK+fbz1Aom0tFUzKq4CV2GjUaG3IfAZ952RI17zW
	SSs34XV24=
Received: from localhost.localdomain (unknown [218.201.129.20])
	by smtp8 (Coremail) with SMTP id DMCowABXPVpUH91g0KifMg--.33338S5;
	Thu, 01 Jul 2021 09:50:14 +0800 (CST)
From: qianfanguijin@163.com
To: linux-sunxi@lists.linux.dev
Cc: mripard@kernel.org,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	qianfan Zhao <qianfanguijin@163.com>
Subject: [PATCH 2/3] ARM: dts: sun8i: r40: Add usb_otg device node
Date: Thu,  1 Jul 2021 09:50:08 +0800
Message-Id: <20210701015009.13985-2-qianfanguijin@163.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210701015009.13985-1-qianfanguijin@163.com>
References: <20210701015009.13985-1-qianfanguijin@163.com>
X-CM-TRANSID:DMCowABXPVpUH91g0KifMg--.33338S5
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xr4fJr1kCw4DWFW5ZFWkZwb_yoWDJrcEv3
	WfWayvgFWrJFyDtFykXw45Z3yIvr48G3yDXa92qr1UJa4Fvw1kWF4DJa97ua15GrW3KF9a
	kayUXFyrtw1a9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbQB_UUUUUU==
X-Originating-IP: [218.201.129.20]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/1tbiXBbC7VXl0I+BWwAAsQ
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

From: qianfan Zhao <qianfanguijin@163.com>

R40's usb otg is compatibled with H3.

Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
---
 arch/arm/boot/dts/sun8i-r40.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-r40.dtsi b/arch/arm/boot/dts/sun8i-r40.dtsi
index d5ad3b9efd12..3edc849d39be 100644
--- a/arch/arm/boot/dts/sun8i-r40.dtsi
+++ b/arch/arm/boot/dts/sun8i-r40.dtsi
@@ -363,6 +363,20 @@
 			#size-cells = <0>;
 		};
 
+		usb_otg: usb@1c13000 {
+			compatible = "allwinner,sun8i-h3-musb";
+			reg = <0x01c13000 0x0400>;
+			clocks = <&ccu CLK_BUS_OTG>;
+			resets = <&ccu RST_BUS_OTG>;
+			interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "mc";
+			phys = <&usbphy 0>;
+			phy-names = "usb";
+			extcon = <&usbphy 0>;
+			dr_mode = "otg";
+			status = "disabled";
+		};
+
 		usbphy: phy@1c13400 {
 			compatible = "allwinner,sun8i-r40-usb-phy";
 			reg = <0x01c13400 0x14>,
-- 
2.17.1


