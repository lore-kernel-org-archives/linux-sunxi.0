Received: from mail.multiname.org (h2.multiname.org [176.9.137.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7971FD4
	for <linux-sunxi@lists.linux.dev>; Sat, 30 Apr 2022 19:20:25 +0000 (UTC)
Received: from huygens.ccbib.org (unknown [10.0.10.112])
	by mail.multiname.org (Postfix) with SMTP id 4KrJpW2cSqzKtyYG;
	Sat, 30 Apr 2022 19:10:27 +0000 (UTC)
Received: by huygens.ccbib.org (sSMTP sendmail emulation); Sat, 30 Apr 2022 19:10:27 +0000
From: Harald Geyer <harald@ccbib.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	Torsten Duwe <duwe@suse.de>,
	Harald Geyer <harald@ccbib.org>
Subject: [PATCHv2] arm64: dts: allwinner: teres-i: Add GPIO port regulators
Date: Sat, 30 Apr 2022 19:10:09 +0000
Message-Id: <20220430191009.73946-1-harald@ccbib.org>
X-Mailer: git-send-email 2.11.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Allwinner A64 SoC has separate supplies for PC, PD, PE, PG and PL.

Signed-off-by: Harald Geyer <harald@ccbib.org>
---
Changes since v1:
 * Add supplies for PD and PE even though they are matched from
   'regulator-name' properties, as this is a Linuxism.
 * Add generic IO voltage as supply for PF as this is an implicit
   (chip internal) dependency.

 arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
index aff0660b899c..1128030e4c25 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
@@ -197,6 +197,14 @@ &ohci1 {
 	status = "okay";
 };
 
+&pio {
+	vcc-pc-supply = <&reg_dcdc1>;
+	vcc-pd-supply = <&reg_dldo2>;
+	vcc-pe-supply = <&reg_aldo1>;
+	vcc-pf-supply = <&reg_dcdc1>;  /* No dedicated supply-pin for this */
+	vcc-pg-supply = <&reg_aldo2>;
+};
+
 &pwm {
 	status = "okay";
 };
-- 
2.35.2

