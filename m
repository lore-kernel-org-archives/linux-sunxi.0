Received: from mail.multiname.org (h2.multiname.org [176.9.137.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5CD7B
	for <linux-sunxi@lists.linux.dev>; Fri, 15 Apr 2022 17:03:42 +0000 (UTC)
Received: from huygens.ccbib.org (unknown [10.0.10.112])
	by mail.multiname.org (Postfix) with SMTP id 4Kg2XV0TYRzKv0QF;
	Fri, 15 Apr 2022 16:56:09 +0000 (UTC)
Received: by huygens.ccbib.org (sSMTP sendmail emulation); Fri, 15 Apr 2022 16:56:09 +0000
From: Harald Geyer <harald@ccbib.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	Torsten Duwe <duwe@suse.de>,
	Harald Geyer <harald@ccbib.org>
Subject: [PATCH] arm64: dts: allwinner: teres-i: Add GPIO port regulators
Date: Fri, 15 Apr 2022 16:56:05 +0000
Message-Id: <20220415165605.28560-1-harald@ccbib.org>
X-Mailer: git-send-email 2.11.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Allwinner A64 SoC has separate supplies for PC, PD, PE, PG and PL.

Usually supplies are linked via the 'regulator-name' property of
regulator nodes. However when regulators are shared we need to
declare the additional links in the pinctrl node.

Signed-off-by: Harald Geyer <harald@ccbib.org>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
index aff0660b899c..cc316ef2e2d6 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
@@ -197,6 +197,11 @@ &ohci1 {
 	status = "okay";
 };
 
+&pio {
+	vcc-pc-supply = <&reg_dcdc1>;
+	vcc-pg-supply = <&reg_aldo2>;
+};
+
 &pwm {
 	status = "okay";
 };
-- 
2.35.2

