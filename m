Received: from smtpfb1-g21.free.fr (smtpfb1-g21.free.fr [212.27.42.9])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A0314400
	for <linux-sunxi@lists.linux.dev>; Sun, 21 Jul 2024 17:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721584152; cv=none; b=bDtmM2F8v5r/zk3ULkZHaWjYWCde/LadIhU1ReqVp5dK8xpEb0VfWWsjzVKes4qFSWUyNe0+cofiK0bwFvj07lDmZiYHmFBB5vdi//suSF69Dq0fcPc+AUdciKKNElzcjiTP/l1x0E71s5vAtHbsLAE4xghHCwu+nkrXrc+Z9Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721584152; c=relaxed/simple;
	bh=3uqE0qV1jieKAoiymx0Gu0bjGrvSXKALH68K4QQeE/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ycuk6uBo2cEUutmeWdcKfAtgW3PN8Xnqr3taIlS5L0+M4VQbm30zcU5hq/Zza5XOHIqsNFoq5nRmhF10f6nYvjirVk8qEesnP6etkqaQK4K9YbmwvAhGECgUpbFcHO0yGlaBZ2MX2+T7dPPf0FUsU1V6A3oQKh7bm1wfaUpv+Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=SxtDaVwV; arc=none smtp.client-ip=212.27.42.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="SxtDaVwV"
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	by smtpfb1-g21.free.fr (Postfix) with ESMTP id 4D88D93095F
	for <linux-sunxi@lists.linux.dev>; Sun, 21 Jul 2024 19:49:00 +0200 (CEST)
Received: from win10. (unknown [91.165.221.98])
	(Authenticated sender: michel.promonet@free.fr)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id 42FA2780511;
	Sun, 21 Jul 2024 19:48:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1721584132;
	bh=3uqE0qV1jieKAoiymx0Gu0bjGrvSXKALH68K4QQeE/Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SxtDaVwVkGt/RPdGnZC6r6w2sYQOS+X3Xl/HCKxQl75FPc6tXdScQeRQijt0fTy4A
	 43AFb5JP1EA5pxZv0XugNDqQWhuqnSy86+p9osnxQKNRTpdTk/YbzOmyTTSud7VBsF
	 vRpdg7mFzhCWzcifm2tHk6TVbqApHHiCQNivoSbkOeIqfGh1++WfXrP8wIUSJLJ/Y7
	 fa1NK4/eR/Jqr9++dygRnsuqG65xuI+IpoE49tn6lV6mI3dlK/dri/REoCwFgo4E8E
	 DGMaScf8x+nvpG4/HhMFxBi9FjDIhbbKMKMOQHVkXrcUFJHXrglGlUfwdytRr22YKL
	 JoPolmZ+wAVeQ==
From: Michel Promonet <michel.promonet@free.fr>
To: linux-sunxi@lists.linux.dev
Cc: Michel Promonet <michel.promonet@free.fr>
Subject: [PATCH] sunxi: add csi video support for nanopi-neo-air
Date: Sun, 21 Jul 2024 19:48:14 +0200
Message-ID: <20240721174832.11916-1-michel.promonet@free.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <michel.promonet@free.fr>
References: <michel.promonet@free.fr>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
 .../dts/allwinner/sun8i-h3-nanopi-neo-air.dts | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-neo-air.dts b/arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-neo-air.dts
index 6d85370e04f1..bab171e1d449 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-neo-air.dts
+++ b/arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-neo-air.dts
@@ -77,6 +77,39 @@ wifi_pwrseq: pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		reset-gpios = <&r_pio 0 7 GPIO_ACTIVE_LOW>; /* PL7 */
 	};
+
+        cam_xclk: cam-xclk {
+                #clock-cells = <0>;
+                compatible = "fixed-clock";
+                clock-frequency = <24000000>;
+                clock-output-names = "cam-xclk";
+        };
+
+        reg_cam_avdd: cam-avdd {
+                compatible = "regulator-fixed";
+                regulator-name = "cam-avdd";
+                regulator-min-microvolt = <2800000>;
+                regulator-max-microvolt = <2800000>;
+                vin-supply = <&reg_vcc3v3>;
+        };
+
+        reg_cam_dovdd: cam-dovdd {
+                compatible = "regulator-fixed";
+                regulator-name = "cam-dovdd";
+                regulator-min-microvolt = <1800000>;
+                regulator-max-microvolt = <1800000>;
+                vin-supply = <&reg_vcc3v3>;
+        };
+
+        reg_cam_dvdd: cam-dvdd {
+                compatible = "regulator-fixed";
+                regulator-name = "cam-dvdd";
+                regulator-min-microvolt = <1500000>;
+                regulator-max-microvolt = <1500000>;
+                vin-supply = <&reg_vcc3v3>;
+        };
+
+
 };
 
 &mmc0 {
@@ -141,3 +174,55 @@ &usbphy {
 	/* USB VBUS is always on */
 	status = "okay";
 };
+
+&csi {
+    status = "okay";
+
+    port {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        /* Parallel bus endpoint */
+        csi_from_ov5640: endpoint {
+            remote-endpoint = <&ov5640_to_csi>;
+            bus-width = <8>;
+            data-shift = <2>;
+            hsync-active = <1>; /* Active high */
+            vsync-active = <0>; /* Active low */
+            data-active = <1>;  /* Active high */
+            pclk-sample = <1>;  /* Rising */
+        };
+    };
+};
+
+&i2c2 {
+   status = "okay";
+
+   ov5640: camera@3c {
+        compatible = "ovti,ov5640";
+        reg = <0x3c>;
+        clocks = <&cam_xclk>;
+        clock-names = "xclk";
+
+        reset-gpios = <&pio 4 14 GPIO_ACTIVE_LOW>;
+        powerdown-gpios = <&pio 4 15 GPIO_ACTIVE_HIGH>;
+        AVDD-supply = <&reg_cam_avdd>;
+        DOVDD-supply = <&reg_cam_dovdd>;
+        DVDD-supply = <&reg_cam_dvdd>;
+
+        port {
+            ov5640_to_csi: endpoint {
+                remote-endpoint = <&csi_from_ov5640>;
+                bus-width = <8>;
+                data-shift = <2>;
+                hsync-active = <1>; /* Active high */
+                vsync-active = <0>; /* Active low */
+                data-active = <1>;  /* Active high */
+                pclk-sample = <1>;  /* Rising */
+            };
+        };
+    };
+};
+&i2c2_pins {
+   bias-pull-up;
+};
-- 
2.43.0

