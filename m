Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FFF2746F
	for <linux-sunxi@lists.linux.dev>; Tue, 10 Oct 2023 15:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from Vostro-3710.lan (unknown [58.61.141.228])
	by mail-m121145.qiye.163.com (Hmail) with ESMTPA id 5D8038000B0;
	Tue, 10 Oct 2023 23:38:21 +0800 (CST)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH 2/2] arm64: dts: allwinner: h616: update emac properties for Orange Pi Zero 3
Date: Tue, 10 Oct 2023 23:38:12 +0800
Message-Id: <20231010153812.2869633-2-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231010153812.2869633-1-amadeus@jmu.edu.cn>
References: <20231010153812.2869633-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZGUwfVkofTEgYQh5DTk4fH1UTARMWGhIXJBQOD1
	lXWRgSC1lBWU5DVU1KVUpPSlVJSUNZV1kWGg8SFR0UWUFZT0tIVUpKS0hKQ1VKS0tVS1kG
X-HM-Tid: 0a8b1a3d3885b03akuuu5d8038000b0
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MiI6SBw*STw8LhASFhkrExpJ
	OhQaFBVVSlVKTUJNQk5JSEtJSU1PVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWU5D
	VU1KVUpPSlVJSUNZV1kIAVlBSU5CTzcG

Add the correct delay value to emac. Also add missing mdio
properties for the YT8531 PHY (clock output required).
With these changes, Ethernet now looks stable.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts
index 00fe28caac93..02c7836b624a 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts
@@ -13,10 +13,14 @@ / {
 };
 
 &emac0 {
+	allwinner,rx-delay-ps = <1800>;
+	allwinner,tx-delay-ps = <700>;
 	phy-supply = <&reg_dldo1>;
 };
 
 &ext_rgmii_phy {
+	motorcomm,keep-pll-enabled;
+	motorcomm,auto-sleep-disabled;
 	motorcomm,clk-out-frequency-hz = <125000000>;
 };
 
-- 
2.25.1

