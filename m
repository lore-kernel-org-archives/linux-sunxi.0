Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1435AD21
	for <linux-sunxi@lists.linux.dev>; Thu, 19 Sep 2024 18:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726770958; cv=none; b=BtQFPCOmDJDtDB0LKGQROYoOLnt19zOEv0lIuOxYzdMEZxKgElKSkDKi/A9epelLs5qKS5zO+C4CaizN9F5YXMwUzuBUPe0xBoITolYYp+GB4b9jM7u1/NE85Ma1DgYEX5wQ1OagL1ploxNrk10TN2WK/BzZHdzQjGlrFWm5zEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726770958; c=relaxed/simple;
	bh=W49WozanLprZEJxgdhsiRD8i1r/Epzp6B7fBpUrzNNE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DTKjg0cWyfXbsnKY9myfRXSerwHuBop1cVmlvZj08444XP0/ybLvIhF+okpue4C7fNmkpMhJRsClhX8bTACnmRHJl72n3MdQ/WcNs36Me8TpXRsa2qbViLmbPHjb7+sTZlr3E1kj03jVJzf6IhQ0HMwXQmfG9oi4q2b0SxJq10Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NNwPwPY4; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NNwPwPY4"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42cb8dac900so10760695e9.3
        for <linux-sunxi@lists.linux.dev>; Thu, 19 Sep 2024 11:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726770955; x=1727375755; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T7wbTHSo9+XfWUpxWPDNev/PMADReLxOtwvmxGAdnEw=;
        b=NNwPwPY4dc0LctgCFgqa3Wk/X77rl2oFVuMbtt1JUI4/LcsZ+R0mtKrflReJXS3PP8
         MSi9YNW5dVs2z+IXa8xbYpbJNJUnRtyLu+PBh6P+4SzSM2vgpBLueUwgEXn5UNFE/P6s
         A55D/7ss+DcX8v+j+vFCaw1Xam04osUuF5pOeI7sHOq7qkdQ78em0Nu2fuWWYdlFa4tc
         +xrYUaAgyCvWZ5MEqQphTAcOfKmnWu6gD+hENVjEMcaxTo0CqsLBD5DVkijOd7lngzVo
         H+Mir+2orebcmkDzMlDkB9cnzy1NUZc9ORc7CzfVWEF+bog91XiHhTomJCoODIvhEbr6
         4lsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726770955; x=1727375755;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T7wbTHSo9+XfWUpxWPDNev/PMADReLxOtwvmxGAdnEw=;
        b=rOJcsjl5/OqYyqwFXGnjU6AXfbfXlHaw6oNJBBiBdzYYCKaH84aS+OTgq+XxR6zQe1
         6NP19e7+S0YohE4Bqe5I/Am27FixGHjtAbuoY+iIiYa8pOPmOL8JrH6NOlPFyAb1L69D
         hVBb2Po6gP2Ih/qscgtNL8sZS89nAvyGIanUSHghX1mRzUVIwBXhzVUFvZKvte0mQ+1F
         TqqEsynOpxbcS4L+mw2IPZXUCMliQ3N8HvXwE9hZimODPQ4kwlirWpTUkt+nH9M+yhqr
         bhA8frNYZWPrTLc+CfTCJAwRA+QmUdR3SnibCVrz4t8s4oJcqLyK/fgmiWiqAnMO/7bV
         2ATw==
X-Forwarded-Encrypted: i=1; AJvYcCU29WQwzvcbfjEw2qO/+v1nBBwX/ggXwl6wmE50QdbZEUklWzeufNijfO1kkDiVYDaXwAPBeGMbph34Tg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yybg7Hwyi1UEHjtkIauzPnVOpBgLD2OoiAxAA/cgBNWzrUwEVAN
	3iUfYzjgEhGwjalCD17XO56uOaqr0MtlsJNLDbUokig7ISwGtywh
X-Google-Smtp-Source: AGHT+IE52EiCmyv96iQ6F9zx0Vq2tE3Sx85XTboMQtqUo9n54qi1QYTgF3Q3MaSwtjjHK9zj1ChviA==
X-Received: by 2002:a05:600c:4f51:b0:428:f0c2:ef4a with SMTP id 5b1f17b1804b1-42e7abf3db1mr3004865e9.13.1726770955107;
        Thu, 19 Sep 2024 11:35:55 -0700 (PDT)
Received: from cleve-worktop. (85-193-33-128.rib.o2.cz. [85.193.33.128])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42e75440657sm29110805e9.20.2024.09.19.11.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 11:35:54 -0700 (PDT)
From: =?utf-8?q?Kry=C5=A1tof_=C4=8Cern=C3=BD?= <cleverline1mc@gmail.com>
Date: Thu, 19 Sep 2024 20:35:39 +0200
Subject: [PATCH v2] arm64: dts: allwinner: Add disable-wp for boards with
 micro SD card
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240919-b4-nanopineoplus2-fix-mmc0-wp-v2-1-c708a9abc9eb@gmail.com>
X-B4-Tracking: v=1; b=H4sIAPtu7GYC/42NWw6CMBREt0Lut9e0tUDwy30YPnjcwk3oI62ih
 rB3Kysw83VmkjMbJIpMCa7FBpFWTuxdBnUqYJg7NxHymBmUUFo0UmOv0XXOB3bkw/JMCg2/0dp
 B4CtgM9a16RuqSnmB7AiR8nz4723mmdPDx89xt8pf+695lZijTKmNGKtKidtkO17Og7fQ7vv+B
 TbRJH/KAAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Kry=C5=A1tof_=C4=8Cern=C3=BD?= <cleverline1mc@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726770954; l=9820;
 i=cleverline1mc@gmail.com; s=20240824; h=from:subject:message-id;
 bh=W49WozanLprZEJxgdhsiRD8i1r/Epzp6B7fBpUrzNNE=;
 b=wfXOiLSQZ9AQdNDPurMx4ypsx/yoUjo62d87kyOsMX3tbkihuOulnziUFV09yRHCP3whqkMBu
 8R7ihgSCnXZB6q2qFHDOYxW39Ooix/+QrajYbKIhNn7b2Wxvnu03vDt
X-Developer-Key: i=cleverline1mc@gmail.com; a=ed25519;
 pk=CQifx5FUgTQKAoj5VCYrwYHi235AkXQ5yT1P6gkaBxM=

Adding disable-wp property for micro SD nodes of Allwinner arm64 devices.
Boards were verified from online pictures/tables
that they have micro SD slots.

Signed-off-by: Kryštof Černý <cleverline1mc@gmail.com>
---
Sorry that my last messages were not in mailing list,
one was wrongly sent and second was rejected, as the bot claimed it contained html.
---
Changes in v2:
- NEW: Added the property to all Sunxi arm64 boards, as discussed in mailing list
- Link to v1: https://lore.kernel.org/r/20240914-b4-nanopineoplus2-fix-mmc0-wp-v1-1-12f54f0d6620@gmail.com
---
 arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts    | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo2.dts         | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts       | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts        | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-prime.dts      | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus.dts  | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts         | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts          | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi           | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts            | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi              | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi    | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dts          | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h618-longanpi-3h.dts       | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts | 1 +
 16 files changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts
index 526443bb736c..18fa541795a6 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts
@@ -136,6 +136,7 @@ &mmc0 {
 	vmmc-supply = <&reg_vcc3v3>;
 	bus-width = <4>;
 	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
+	disable-wp;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo2.dts
index 05486cccee1c..128295f5a5d6 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo2.dts
@@ -88,6 +88,7 @@ ext_rgmii_phy: ethernet-phy@7 {
 
 &mmc0 {
 	vmmc-supply = <&reg_vcc3v3>;
+	disable-wp;
 	bus-width = <4>;
 	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
 	status = "okay";
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts
index 3a7ee44708a2..44fdc8b3f79d 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts
@@ -157,6 +157,7 @@ eth_mac1: mac-address@fa {
 
 &mmc0 {
 	vmmc-supply = <&reg_vcc3v3>;
+	disable-wp;
 	bus-width = <4>;
 	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
 	status = "okay";
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
index ce3ae19e72db..0f29da7d51e6 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
@@ -153,6 +153,7 @@ &ir {
 
 &mmc0 {
 	vmmc-supply = <&reg_vcc3v3>;
+	disable-wp;
 	bus-width = <4>;
 	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
 	status = "okay";
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-prime.dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-prime.dts
index b699bb900e13..d4fc4e60e4e7 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-prime.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-prime.dts
@@ -153,6 +153,7 @@ &ir {
 
 &mmc0 {
 	vmmc-supply = <&reg_vcc3v3>;
+	disable-wp;
 	bus-width = <4>;
 	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
 	status = "okay";
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus.dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus.dts
index ae85131aac9c..3322cc4d9aa4 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus.dts
@@ -82,6 +82,7 @@ ext_rgmii_phy: ethernet-phy@1 {
 
 &mmc0 {
 	vmmc-supply = <&reg_vcc3v3>;
+	disable-wp;
 	bus-width = <4>;
 	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
 	status = "okay";
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
index 734481e998b8..3eb986c354a9 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
@@ -79,6 +79,7 @@ hdmi_out_con: endpoint {
 
 &mmc0 {
 	vmmc-supply = <&reg_vcc3v3>;
+	disable-wp;
 	bus-width = <4>;
 	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
index 3be1e8c2fdb9..13a0e63afeaf 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
@@ -129,6 +129,7 @@ ext_rgmii_phy: ethernet-phy@1 {
 &mmc0 {
 	vmmc-supply = <&reg_cldo1>;
 	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;
+	disable-wp;
 	bus-width = <4>;
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
index 6c3bfe3d09d9..ab87c3447cd7 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
@@ -131,6 +131,7 @@ hdmi_out_con: endpoint {
 &mmc0 {
 	vmmc-supply = <&reg_cldo1>;
 	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
+	disable-wp;
 	bus-width = <4>;
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
index 13b07141c334..d05dc5d6e6b9 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
@@ -94,6 +94,7 @@ hdmi_out_con: endpoint {
 &mmc0 {
 	vmmc-supply = <&reg_cldo1>;
 	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;
+	disable-wp;
 	bus-width = <4>;
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
index c8b275552872..fa7a765ee828 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
@@ -133,6 +133,7 @@ ext_rgmii_phy: ethernet-phy@1 {
 &mmc0 {
 	vmmc-supply = <&reg_cldo1>;
 	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;
+	disable-wp;
 	bus-width = <4>;
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi
index 855b7d43bc50..bb7de37c0d58 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi
@@ -124,6 +124,7 @@ &mmc0 {
 	pinctrl-0 = <&mmc0_pins>;
 	vmmc-supply = <&reg_vcc3v3>;
 	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;
+	disable-wp;
 	bus-width = <4>;
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
index fc7315b94406..a3fe39f8e2ca 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
@@ -81,6 +81,7 @@ ext_rgmii_phy: ethernet-phy@1 {
 
 &mmc0 {
 	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;	/* PF6 */
+	disable-wp;
 	bus-width = <4>;
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dts b/arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dts
index 26d25b5b59e0..dd3bd9cca710 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dts
@@ -52,6 +52,7 @@ &ir {
 &mmc0 {
 	vmmc-supply = <&reg_dcdce>;
 	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;	/* PF6 */
+	disable-wp;
 	bus-width = <4>;
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-longanpi-3h.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-longanpi-3h.dts
index 18b29c6b867f..16c68177ff69 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h618-longanpi-3h.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-longanpi-3h.dts
@@ -111,6 +111,7 @@ ext_rgmii_phy: ethernet-phy@1 {
 };
 
 &mmc0 {
+	disable-wp;
 	bus-width = <4>;
 	cd-gpios = <&pio 5 6 GPIO_ACTIVE_HIGH>;	/* PF6 */
 	vmmc-supply = <&reg_vcc3v3>;
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts
index d6631bfe629f..024377b333c1 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts
@@ -71,6 +71,7 @@ &ir {
 &mmc0 {
 	vmmc-supply = <&reg_dldo1>;
 	cd-gpios = <&pio 8 16 GPIO_ACTIVE_LOW>;	/* PI16 */
+	disable-wp;
 	bus-width = <4>;
 	status = "okay";
 };

---
base-commit: 57f962b956f1d116cd64d5c406776c4975de549d
change-id: 20240914-b4-nanopineoplus2-fix-mmc0-wp-9d77fb9e6513

Best regards,
-- 
Kryštof Černý <cleverline1mc@gmail.com>

