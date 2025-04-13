Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF5E19DF5B
	for <linux-sunxi@lists.linux.dev>; Sun, 13 Apr 2025 13:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744552746; cv=none; b=ZR607A+YStOoStxpSYHEPwZ81bUNl56ur/QYt8zJA7IAxdwMtBCu8mgxIBeUUVV4Bt1rwKLIT6OTtLxLhm1z2StmIoHOpz4hRIk19kZSiXPqSQC7v8btQuJb/zSym7GqJWAenLlUYmezZUOasDTiwEvav0AJR68rKQfvNFJNicE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744552746; c=relaxed/simple;
	bh=Kubatdqu3qzEbvGyAPirIfzDb+PXinQP6YFw5KUQCk0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dL0schxFjFfTykekzWQpHSqE/Rdzct45BkfH/TqUK7sSsD3LobnK/rIxEN9r6d5FtNJ3rTxPFGQxVklQUJivZ6nnVfzgS3WGjq7UtOLr3J1y01I2ZYRT/ekzwyMUpYfUZFa2gXEOZJSTpAhxLVl9gB73pUKt91KsHI0q4CQxKxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bWeJ26FP; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bWeJ26FP"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac41514a734so578119766b.2
        for <linux-sunxi@lists.linux.dev>; Sun, 13 Apr 2025 06:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744552742; x=1745157542; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=utJCue1caiiVC6LaI3oId+Yi6e+n4Mbwhya8VRaTo2Y=;
        b=bWeJ26FP8STS3l1PSIMufU2jGLpjPSIJcfN6k9c2S3EzuNWTsi6+GkQxRkgMarT0a2
         rWNWRMW/fAACtVllJ4mwirvQI8gkQC2N5dkIy58r9Zh3m0d4gKwF8YbZdaAaXta1Rj+9
         pGBytzyETpffNRaldvzXYCi80elGNE8t6oigHalcQjq8Ho49D5zZM8DD9zSsuv+RZKcC
         qI/f3BwgoRYDF7D5rhAlEKdrb/xWEITuP6jQ7ej0qGNKnSVS0U9l8HdftYsDsVKb/8ow
         q9OGRsyK4Z7wIamzrDSgP3nxlUiJpgKKQ+KGarDvdvi3EqdkT7b8vRmVBlfy7FEQtsRV
         4epg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744552742; x=1745157542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=utJCue1caiiVC6LaI3oId+Yi6e+n4Mbwhya8VRaTo2Y=;
        b=p7b6hiufWnNK9umZdev++h8/ytKVcg72tiRkGkQqRH9ko2917PWBawxUNPbHRIy0On
         9+wXjVhoAZMPP6YQYcPbTVzjn2cphgzlInAqBOOlJ+IA14+asENsNyf8D8h4npvtw5zl
         4pDtjapa4180XSx8xGIeg6Rx38rGOBse9AdzmDtOMM+PfOxTearfEaF2UPTCeNPPQz5S
         bV7+tFsMxOMCqLh76sidYy+aLQQotm22sDxh4+iKzTrbOpNdCKskKBEF/aonGb7cCAjP
         241AT8PrzoarhjtUEB3qhs2JTu02vQxAvbI/WLo3Hl3r4eIgGM9yK2XE20wNYuAVPSnC
         cQAg==
X-Forwarded-Encrypted: i=1; AJvYcCVTDWVyJsxZAT79zwKn4CxUv3c/QPdDgHxh1TLI2dguLt1nYrbWEFqzEocu4Mc06COR7fgqlFmO+Pvsng==@lists.linux.dev
X-Gm-Message-State: AOJu0YwSZoRfryKZgXavt8+S/a0hkd32RRdLhoTii4r4M86OVtelPAeD
	7SrOcpoNFdzQHHg+TzmTHeOpwZGb19/KmDIl7FvOKohaq7x+B68M
X-Gm-Gg: ASbGnctTzOktZ8489P//5jGI6gRTPx+PauWmreoAhx/q/gLFQzkrqGBsF1Y10sNyaMy
	FwSpBONZwA7ck1AY/3gvYLa40dGYVU/3OdnQFf3ic1o/O/d/TMsClDItmpnL3GyZXXNVH7J1wo1
	0yaT/7ox9oDSbDPkZkcDHSx40Hduu58TmIReuVkgm8/7OtADhdLeRYc0eyhegQAIqYUlJXtJTlR
	nhyNjTCoTgIDcrP5PdDUyFJL5u1QKQEtvqQNQaF2y3QEQKaWLAV1kpIoe/e2XTbRS2hNZ91yTfx
	3eSE/kNiU6oBUIPt6ZR5tc6iPN8mQZ1ylD9D/UKKGjzbi+7WL+x7q2ZGZ/Q=
X-Google-Smtp-Source: AGHT+IFqWK6+W/ftgNa12pbudvEkEdI1jjaGufzqDfLNRVe+EJuwsxPBM904Yn3WNizh9i5HATWBHw==
X-Received: by 2002:a17:907:3fa2:b0:ac7:edc4:3d42 with SMTP id a640c23a62f3a-acad349a039mr807773666b.24.1744552742322;
        Sun, 13 Apr 2025 06:59:02 -0700 (PDT)
Received: from localhost.localdomain ([37.248.246.92])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1be9152sm732602266b.42.2025.04.13.06.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 06:59:01 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: wens@csie.org,
	samuel@sholland.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] Revert "arm64: dts: allwinner: h6: Use RSB for AXP805 PMIC connection"
Date: Sun, 13 Apr 2025 15:58:48 +0200
Message-ID: <20250413135848.67283-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 531fdbeedeb89bd32018a35c6e137765c9cc9e97.

Hardware that uses I2C wasn't designed with high speeds in mind, so
communication with PMIC via RSB can intermittently fail. Go back to I2C
as higher speed and efficiency isn't worth the trouble.

Fixes: 531fdbeedeb8 ("arm64: dts: allwinner: h6: Use RSB for AXP805 PMIC connection")
Link: https://github.com/LibreELEC/LibreELEC.tv/issues/7731
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../dts/allwinner/sun50i-h6-beelink-gs1.dts   | 38 +++++++++----------
 .../dts/allwinner/sun50i-h6-orangepi-3.dts    | 14 +++----
 .../dts/allwinner/sun50i-h6-orangepi.dtsi     | 22 +++++------
 3 files changed, 37 insertions(+), 37 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
index 13a0e63afeaf..2c64d834a2c4 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
@@ -152,28 +152,12 @@ &pio {
 	vcc-pg-supply = <&reg_aldo1>;
 };
 
-&r_ir {
-	linux,rc-map-name = "rc-beelink-gs1";
+&r_i2c {
 	status = "okay";
-};
 
-&r_pio {
-	/*
-	 * FIXME: We can't add that supply for now since it would
-	 * create a circular dependency between pinctrl, the regulator
-	 * and the RSB Bus.
-	 *
-	 * vcc-pl-supply = <&reg_aldo1>;
-	 */
-	vcc-pm-supply = <&reg_aldo1>;
-};
-
-&r_rsb {
-	status = "okay";
-
-	axp805: pmic@745 {
+	axp805: pmic@36 {
 		compatible = "x-powers,axp805", "x-powers,axp806";
-		reg = <0x745>;
+		reg = <0x36>;
 		interrupt-parent = <&r_intc>;
 		interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-controller;
@@ -291,6 +275,22 @@ sw {
 	};
 };
 
+&r_ir {
+	linux,rc-map-name = "rc-beelink-gs1";
+	status = "okay";
+};
+
+&r_pio {
+	/*
+	 * PL0 and PL1 are used for PMIC I2C
+	 * don't enable the pl-supply else
+	 * it will fail at boot
+	 *
+	 * vcc-pl-supply = <&reg_aldo1>;
+	 */
+	vcc-pm-supply = <&reg_aldo1>;
+};
+
 &spdif {
 	pinctrl-names = "default";
 	pinctrl-0 = <&spdif_tx_pin>;
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
index ab87c3447cd7..f005072c68a1 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
@@ -176,16 +176,12 @@ &pio {
 	vcc-pg-supply = <&reg_vcc_wifi_io>;
 };
 
-&r_ir {
+&r_i2c {
 	status = "okay";
-};
 
-&r_rsb {
-	status = "okay";
-
-	axp805: pmic@745 {
+	axp805: pmic@36 {
 		compatible = "x-powers,axp805", "x-powers,axp806";
-		reg = <0x745>;
+		reg = <0x36>;
 		interrupt-parent = <&r_intc>;
 		interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-controller;
@@ -296,6 +292,10 @@ sw {
 	};
 };
 
+&r_ir {
+	status = "okay";
+};
+
 &rtc {
 	clocks = <&ext_osc32k>;
 };
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
index d05dc5d6e6b9..e34dbb992021 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
@@ -113,20 +113,12 @@ &pio {
 	vcc-pg-supply = <&reg_aldo1>;
 };
 
-&r_ir {
+&r_i2c {
 	status = "okay";
-};
 
-&r_pio {
-	vcc-pm-supply = <&reg_bldo3>;
-};
-
-&r_rsb {
-	status = "okay";
-
-	axp805: pmic@745 {
+	axp805: pmic@36 {
 		compatible = "x-powers,axp805", "x-powers,axp806";
-		reg = <0x745>;
+		reg = <0x36>;
 		interrupt-parent = <&r_intc>;
 		interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-controller;
@@ -241,6 +233,14 @@ sw {
 	};
 };
 
+&r_ir {
+	status = "okay";
+};
+
+&r_pio {
+	vcc-pm-supply = <&reg_bldo3>;
+};
+
 &rtc {
 	clocks = <&ext_osc32k>;
 };
-- 
2.49.0

