Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACA21C286
	for <linux-sunxi@lists.linux.dev>; Thu, 19 Sep 2024 19:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.91.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726773336; cv=none; b=U2YhZTEcNE5w6zz8trbNspWon2jIGEOZ0XCKKs8pXHzUVUAs0Rj2otmQTuc6KE7KQdktl3hPyxe/QPoBfUG1s06AfDV/WHLx/KQU+L+4NGKIAtjijM7MzMR+AyMLjMIkKO+JyoXIMp3q5qhjruI1ZZKsnsMyJGmJI4hZyub4CPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726773336; c=relaxed/simple;
	bh=9E/3Qgq2rBfpbjtgScTbvjHlvjhKQCG8spRqQWxVBg4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sw4cF0FKn4tXfY/EbI7PT1Gu1sxz8DznIdhbdoEggmlcx2OMD3gC1xkxC3t2JO7TEOu/0dfK9bF4ipktzu0SV3CrsYzaFAHzbX8e74/SsMmXjLxhRpyHnRgpFIk1c+UF2paxWpoQCt+Aig7HzZxtqHGmTKQGdGb2wkS4ONNcaC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=EmatWS/a; arc=none smtp.client-ip=116.203.91.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="EmatWS/a"
From: Dragan Simic <dsimic@manjaro.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1726773331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=frPsoF6IA06vxq/9oAWMuWEe1ZHs1o7Nlj0WlKwuAH4=;
	b=EmatWS/aEWyUf+NmlF6h9+8efCkgP8142ojQhpU4D3/WmIAlHnHVh1l5Iha4oVZX5+VSIJ
	AERMsRQlPCR5kkdvlN7o55S112csBJR/aflj/7Cw9k5mVBIjaLWFuwM1ZFRXxGrIvBJhbE
	H9kgAM2sEzT15+wDSxTx94p+MS+Ng8B+VlG2Q2C0KCyQoU2kPdhAbYbnY2o4fr4zQuPNdY
	dkX3MWNAAtu2uqN9x3gAhye8kPHa83Mj3WFQ0o54t4BWtJRA2i53vkua3DQxfx9Vl8EO9P
	iVq1kuZ9qoH/I+bgs/kCveghEEUP3Vo1GvlzUnmU7eG5xecoV0OdOfe2nO8DSQ==
To: linux-sunxi@lists.linux.dev
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ondrej Jirman <megi@xff.cz>,
	Andrey Skvortsov <andrej.skvortzov@gmail.com>
Subject: [PATCH] arm64: dts: allwinner: pinephone: Add mount matrix to accelerometer
Date: Thu, 19 Sep 2024 21:15:26 +0200
Message-Id: <129f0c754d071cca1db5d207d9d4a7bd9831dff7.1726773282.git.dsimic@manjaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

The way InvenSense MPU-6050 accelerometer is mounted on the user-facing side
of the Pine64 PinePhone mainboard, which makes it rotated 90 degrees counter-
clockwise, [1] requires the accelerometer's x- and y-axis to be swapped, and
the direction of the accelerometer's y-axis to be inverted.

Rectify this by adding a mount-matrix to the accelerometer definition in the
Pine64 PinePhone dtsi file.

[1] https://files.pine64.org/doc/PinePhone/PinePhone%20mainboard%20bottom%20placement%20v1.1%2020191031.pdf

Fixes: 91f480d40942 ("arm64: dts: allwinner: Add initial support for Pine64 PinePhone")
Cc: stable@vger.kernel.org
Helped-by: Ondrej Jirman <megi@xff.cz>
Helped-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Signed-off-by: Dragan Simic <dsimic@manjaro.org>
---

Notes:
    See also the linux-sunxi thread [2] that has led to this patch, which
    provides a rather detailed analysis with additional details and pictures.
    This patch effectively replaces the patch submitted in that thread.
    
    [2] https://lore.kernel.org/linux-sunxi/20240916204521.2033218-1-andrej.skvortzov@gmail.com/T/#u

 arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
index 6eab61a12cd8..b844759f52c0 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
@@ -212,6 +212,9 @@ accelerometer@68 {
 		interrupts = <7 5 IRQ_TYPE_EDGE_RISING>; /* PH5 */
 		vdd-supply = <&reg_dldo1>;
 		vddio-supply = <&reg_dldo1>;
+		mount-matrix = "0", "1", "0",
+			       "-1", "0", "0",
+			       "0", "0", "1";
 	};
 };
 
