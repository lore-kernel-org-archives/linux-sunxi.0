Received: from m12-16.163.com (m12-16.163.com [220.181.12.16])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 741082F80
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Jul 2021 03:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=WeaJGdyDq6wy0v+z6A
	Mo6cfvvAXi7JWG2I8/UQhJHLg=; b=c9VA8AdEhmxUNOZepm/UoDbjXpVG11bmLU
	B0GFoVNhektR71QSnfKttS6jmQItO7vWWA71HEF1LN9E6mQ38/vl4zViEZt0Oids
	mOOHLDJX7a+Q2M0c5NEUGr9X8nu8rHJUfaGcGIMNhSCEty+FYqPaKbZ6xoXaNxAL
	Y2KeMQQn0=
Received: from localhost.localdomain (unknown [218.201.129.20])
	by smtp10 (Coremail) with SMTP id DsCowAB3U30AfeJgWfg4SQ--.36461S5;
	Mon, 05 Jul 2021 11:31:14 +0800 (CST)
From: qianfanguijin@163.com
To: linux-sunxi@lists.linux.dev
Cc: mripard@kernel.org,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	andre.przywara@arm.com,
	qianfan Zhao <qianfanguijin@163.com>
Subject: [PATCH v3 2/3] ARM: dts: sun8i: r40: Add usb_otg device node
Date: Mon,  5 Jul 2021 11:31:03 +0800
Message-Id: <20210705033104.7824-2-qianfanguijin@163.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210705033104.7824-1-qianfanguijin@163.com>
References: <20210705033104.7824-1-qianfanguijin@163.com>
X-CM-TRANSID:DsCowAB3U30AfeJgWfg4SQ--.36461S5
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xr4fJr1kCw45Xr13KFW3Jrb_yoWDWrbEvF
	1fWayvgrWrJFyDtF95X3y5Z3yIvr48G3yDWa4Iqr1UJa1Fvwn5WF4DJa97ua15KrW7KF9I
	kay5XFyrtw1a9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbPrcPUUUUU==
X-Originating-IP: [218.201.129.20]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/xtbBdgLG7VUMRevYuQAAsJ
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

From: qianfan Zhao <qianfanguijin@163.com>

R40's usb otg is compatibled with H3.

Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
---
 arch/arm/boot/dts/sun8i-r40.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-r40.dtsi b/arch/arm/boot/dts/sun8i-r40.dtsi
index d5ad3b9efd12..f30873ac3073 100644
--- a/arch/arm/boot/dts/sun8i-r40.dtsi
+++ b/arch/arm/boot/dts/sun8i-r40.dtsi
@@ -363,6 +363,21 @@
 			#size-cells = <0>;
 		};
 
+		usb_otg: usb@1c13000 {
+			compatible = "allwinner,sun8i-r40-musb",
+				     "allwinner,sun8i-h3-musb";
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

