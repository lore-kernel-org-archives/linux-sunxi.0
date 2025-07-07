Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BE5221720
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Jul 2025 16:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751907243; cv=none; b=IZFIE3nZOPcuA0HYaGgsrPgBGCcCawnCePMn6nxOJrGMDjDow8TcRBxK8O/qKb35No5WFIjqwhx9Sx+5tcM1RWu7q5LLyo9zRs0n0xt2f+ZawUg1WKgegszV3YrNiHQmbpFImikDvMb339Jgz0vJ7aoidIizG4W1IeGUQa8sxVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751907243; c=relaxed/simple;
	bh=dSDtzgHJhb5nkTok5hdWeyc72epjdPSgyP5Q3UFWO2c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VIdJ3N0DmTFVDtrzNl7piQ/nbiKLSSoPBE5gGJS/pc8xP3Bv96XTDRZ/3wLakb8ggCCofO9uiktwgFOfJf/m465Hvw3F3PRvjg/EBGDajWPWz/xXPceojcpdBMFIUcpFXHcSFbZ/4wKuGBLAGES8xYz5Tj49Ie7QzvSkooRNQUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 121751F0003D
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Jul 2025 16:53:59 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 87466ACAEF5; Mon,  7 Jul 2025 16:53:58 +0000 (UTC)
X-Spam-Level: *
Received: from localhost.localdomain (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id 25322ACAEE3;
	Mon,  7 Jul 2025 16:52:09 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v2 2/4] arm64: dts: allwinner: a100: Add pin definitions for RGMII/RMII
Date: Mon,  7 Jul 2025 18:51:53 +0200
Message-ID: <20250707165155.581579-3-paulk@sys-base.io>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707165155.581579-1-paulk@sys-base.io>
References: <20250707165155.581579-1-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner A100/A133 supports both RGMII and RMII for its Ethernet
MAC (EMAC) controller. Add corresponding pin definitions.

Note that the sun50iw10 die actually includes two ethernet controllers,
the second of which is rarely exposed to pins. Call the first controller
"emac0" to distinguish it from the second that may be added later.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
index bd366389b238..7d5be0975371 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
@@ -236,6 +236,21 @@ mmc2_pins: mmc2-pins {
 				bias-pull-up;
 			};
 
+			rgmii0_pins: rgmii0-pins {
+				pins = "PH0", "PH1", "PH2", "PH3", "PH4",
+				       "PH5", "PH6", "PH7", "PH9", "PH10",
+				       "PH14", "PH15", "PH16", "PH17", "PH18";
+				function = "emac0";
+				drive-strength = <40>;
+			};
+
+			rmii0_pins: rmii0-pins {
+				pins = "PH0", "PH1", "PH2", "PH3", "PH4",
+				       "PH5", "PH6", "PH7", "PH9", "PH10";
+				function = "emac0";
+				drive-strength = <40>;
+			};
+
 			uart0_pb_pins: uart0-pb-pins {
 				pins = "PB9", "PB10";
 				function = "uart0";
-- 
2.49.0

