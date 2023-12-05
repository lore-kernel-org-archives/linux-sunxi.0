Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31F89ECB
	for <linux-sunxi@lists.linux.dev>; Tue,  5 Dec 2023 01:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F29071474;
	Mon,  4 Dec 2023 17:24:46 -0800 (PST)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 201583F5A1;
	Mon,  4 Dec 2023 17:23:59 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: u-boot@lists.denx.de,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH] sunxi: dts: arm64: update emac for Orange Pi Zero 3
Date: Tue,  5 Dec 2023 01:22:28 +0000
Message-Id: <20231205012228.4256-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.8
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chukun Pan <amadeus@jmu.edu.cn>

The current emac setting is not suitable for Orange Pi Zero 3,
move it back to Orange Pi Zero 2 DT. Also update phy mode and
delay values for emac on Orange Pi Zero 3.
With these changes, Ethernet now looks stable.

Fixes: 95c3b0635ea4 ("sunxi: dts: arm64: update devicetree files from Linux-v6.6-rc6")
Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
Hi,

this is a port of the corresponding Linux patch, that fixes Ethernet
on that board. The patch is in Linux' sunxi/fixes-for-6.7 queue,
awaiting a merge anytime soon.
For me this indeed fixes Ethernet operation in U-Boot on that board.

Cheers,
Andre

 arch/arm/dts/sun50i-h616-orangepi-zero.dtsi | 3 ---
 arch/arm/dts/sun50i-h616-orangepi-zero2.dts | 3 +++
 arch/arm/dts/sun50i-h618-orangepi-zero3.dts | 2 ++
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm/dts/sun50i-h616-orangepi-zero.dtsi b/arch/arm/dts/sun50i-h616-orangepi-zero.dtsi
index 15290e6892f..fc7315b9440 100644
--- a/arch/arm/dts/sun50i-h616-orangepi-zero.dtsi
+++ b/arch/arm/dts/sun50i-h616-orangepi-zero.dtsi
@@ -68,10 +68,7 @@
 &emac0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&ext_rgmii_pins>;
-	phy-mode = "rgmii";
 	phy-handle = <&ext_rgmii_phy>;
-	allwinner,rx-delay-ps = <3100>;
-	allwinner,tx-delay-ps = <700>;
 	status = "okay";
 };
 
diff --git a/arch/arm/dts/sun50i-h616-orangepi-zero2.dts b/arch/arm/dts/sun50i-h616-orangepi-zero2.dts
index d83852e72f0..b5d713926a3 100644
--- a/arch/arm/dts/sun50i-h616-orangepi-zero2.dts
+++ b/arch/arm/dts/sun50i-h616-orangepi-zero2.dts
@@ -13,6 +13,9 @@
 };
 
 &emac0 {
+	allwinner,rx-delay-ps = <3100>;
+	allwinner,tx-delay-ps = <700>;
+	phy-mode = "rgmii";
 	phy-supply = <&reg_dcdce>;
 };
 
diff --git a/arch/arm/dts/sun50i-h618-orangepi-zero3.dts b/arch/arm/dts/sun50i-h618-orangepi-zero3.dts
index 00fe28caac9..b3b1b869212 100644
--- a/arch/arm/dts/sun50i-h618-orangepi-zero3.dts
+++ b/arch/arm/dts/sun50i-h618-orangepi-zero3.dts
@@ -13,6 +13,8 @@
 };
 
 &emac0 {
+	allwinner,tx-delay-ps = <700>;
+	phy-mode = "rgmii-rxid";
 	phy-supply = <&reg_dldo1>;
 };
 
-- 
2.35.8

