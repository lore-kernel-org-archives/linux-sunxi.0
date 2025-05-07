Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C515128F522
	for <linux-sunxi@lists.linux.dev>; Wed,  7 May 2025 20:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746649368; cv=none; b=VXX0rCHk3YgvlMNMTJJVgC+TitqP6/b6QgGrJNgA7+Pd8eUel7tbPPfoxKazznipS45bQ1CoyhCyPjaAsyD3yC1pjP/RP9AUdLSuk85KL4YGSNuyEWUOnoKmKhr0JTSy/ol5DwRmrAmiPLWD1ybcJOFr8MGvEGbCmZWavyXeDsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746649368; c=relaxed/simple;
	bh=QCzpVPQHNchf1q6nV+Jbu/0f+gEBfuqV3eX09A3d8fM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fFCTZoQBl9g0pr+BmMSrWgyGGtDpBLpJzin4wtEBoDdJNGVjvmz1LKjcMq15aeIMmY4LOiu73A94REGbb6BvtAt9bakKsoTFrpb68H2wVcT6suoAL+UHIhUirJ+OQxpQdBwAaHfnFgXAXA44tYb8DKJbAm4zktlaSJzDdUkdGZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FHhnIJJw; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FHhnIJJw"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7301c227512so140121a34.2
        for <linux-sunxi@lists.linux.dev>; Wed, 07 May 2025 13:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746649365; x=1747254165; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1hb5ufZpV43bt8teP3h3YtOVqm0V+W6AkapWdcxcadM=;
        b=FHhnIJJw3PbPZo18MrYcvgE9pIpgF6Grm2tcp4vFZ7sFtRcUJ7LYSqqobJ1FDVJc4E
         m0BwrgTzYLRqCYNok/MS+83a3MpGM1NXNJJj1klaDrDGeR77lPS15nbQSc9Tflh/YFnB
         kNvTF0Grt7xgrAF0dA3ZPrd0kDEdwGzXP8Chvuwv1hblaG/bIOaBFcYLUOXVCq8vU1s3
         ngcAQkxa29D4fv+Qe4MsmeyB1UuDpZ68eAokWb2hro6jcAqkGTbBxYGd0CY/QvUclaph
         XmMhD5qW1Ck/liPUit7W7gNr5Ts14/cWF/fVet9D7EUtqUwOPawRiu9Ttikl3uBrgIOY
         F0lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746649365; x=1747254165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1hb5ufZpV43bt8teP3h3YtOVqm0V+W6AkapWdcxcadM=;
        b=YOZ6eM7JnJ/s/OrMy9N5DQt63SYVMUVXkJjkpKf9qhAY3RR5v9oe1GyWN+zJw+xFHc
         4HPuIhrJ0T9wqvn70w3mNQNc44077cC8USn6qvqNue92Czmvr76/4s7vw1PES0RtFCHc
         Nw0aDHwoAtLoIiP8k/rXMphdU6+B3C4XM4UohB6dDxSGGUJB0LEMeM8eHiHCdBVtkl+B
         9VH1dnc3V4CKqEZQV4G3WEMagXzIu59fxvlMeqyS+FiYlkViPKBlcViwwCznLd86pSNz
         2nIfTUFo/kUO0pUK9ra0dl478cz1JIlByuhQJX/7TU+DcHOUZSph67sZeZZl1W+TfTFq
         ZcQA==
X-Gm-Message-State: AOJu0YwDD/0RtN44gPrw2d/dnwVfvcQp6XFJ7Y73jj2E36QlU1LcwvP8
	sLz1IJCpr7nKFGhLqAO6o9+MkIRpqK3BNyHhN1q6H2f4OUmMh8RptwLw8w==
X-Gm-Gg: ASbGncshCr0xuHTp2xdxFyflOyPjJsmCqZ0fQZ2UinbBPbfWR01Ke6CiheQfwsNJTQb
	LYqhGZsCUfOlbrJ1D7lsmD31e1UsTo7ToiP3TV0N+04v9OAu/xv8dcPj9BdneZcYeB8WW2n7pue
	y6DAbOxFzeP+YpuWHuGDhm8zkbzN+JJEsQvb34dOlxZ77XbDmcNUj7CFvVQlrzNaTV8d9Kt6Y6G
	/7XKlf6GbpGZ51I07TGuY/lbKhkjZPMgISRkpOGcET8EaJQxrYt7XyRG/3lR3h7kmtxELhuWcfp
	1FeyYMQ85WPEylR4hGjPA6uEypGjYwshWPcP5r+SPV2ObxWXeNKNWryq7Fd8
X-Google-Smtp-Source: AGHT+IEc2bzedU/Bbbz0Jce68RPz4itDPGQFZVpr2AL3l0c19gcdR7gdkcuLajDbJPMrYebzAIA4IQ==
X-Received: by 2002:a05:6830:6181:b0:72b:8a8b:e02c with SMTP id 46e09a7af769-73210a69ba6mr3020411a34.2.1746649365602;
        Wed, 07 May 2025 13:22:45 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:e46c:46ba:cecd:a52c])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-732109df2dcsm725945a34.9.2025.05.07.13.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 13:22:45 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	ryan@testtoast.com,
	macromorgan@hotmail.com,
	p.zabel@pengutronix.de,
	tzimmermann@suse.de,
	maarten.lankhorst@linux.intel.com,
	simona@ffwll.ch,
	airlied@gmail.com,
	mripard@kernel.org,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org
Subject: [PATCH V9 24/24] arm64: dts: allwinner: rg35xx: Enable LCD output
Date: Wed,  7 May 2025 15:19:43 -0500
Message-ID: <20250507201943.330111-25-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250507201943.330111-1-macroalpha82@gmail.com>
References: <20250507201943.330111-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

The RG35XX has a 640x480 RGB/SPI LCD panel, supported by the SoC display
pipeline and an NV3052C controller. The H616 SOC's GPIO bank D contains
the muxed display pins for RGB and LVDS output support.

Enable the display engine and LCD timing controller, configure the
panel, and add a fixed 3.3v GPIO-controlled regulator for the panel, and
a VCC supply for the display pins as per the other GPIO banks.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../sun50i-h700-anbernic-rg35xx-2024.dts      | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
index 95f2ae04bd95..260c2d55a86e 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
@@ -187,6 +187,49 @@ reg_vcc5v: regulator-vcc5v { /* USB-C power input */
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 	};
+
+	reg_lcd: regulator-gpio-lcd-vdd {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-name = "vdd-lcd";
+		gpio = <&pio 8 15 GPIO_ACTIVE_HIGH>; // PI15
+		enable-active-high;
+	};
+
+	spi_lcd: spi {
+		compatible = "spi-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		sck-gpios = <&pio 8 9 GPIO_ACTIVE_HIGH>; // PI9
+		mosi-gpios = <&pio 8 10 GPIO_ACTIVE_HIGH>; // PI10
+		cs-gpios = <&pio 8 8 GPIO_ACTIVE_HIGH>; // PI8
+		num-chipselects = <1>;
+
+		panel: panel@0 {
+			compatible = "anbernic,rg35xx-plus-panel";
+
+			reg = <0>;
+
+			spi-max-frequency = <3125000>;
+			spi-3wire;
+
+			reset-gpios = <&pio 8 14 GPIO_ACTIVE_LOW>; // PI14
+
+			backlight = <&backlight>;
+			power-supply = <&reg_lcd>;
+
+			pinctrl-0 = <&lcd0_rgb888_pins>;
+			pinctrl-names = "default";
+
+			port {
+				panel_in_rgb: endpoint {
+					remote-endpoint = <&tcon_lcd0_out_lcd>;
+				};
+			};
+		};
+	};
 };
 
 &codec {
@@ -199,6 +242,10 @@ &cpu0 {
 	cpu-supply = <&reg_dcdc1>;
 };
 
+&de {
+	status = "okay";
+};
+
 &ehci0 {
 	status = "okay";
 };
@@ -218,6 +265,7 @@ &ohci0 {
 &pio {
 	vcc-pa-supply = <&reg_cldo3>;
 	vcc-pc-supply = <&reg_cldo3>;
+	vcc-pd-supply = <&reg_cldo3>;
 	vcc-pe-supply = <&reg_cldo3>;
 	vcc-pf-supply = <&reg_cldo3>;
 	vcc-pg-supply = <&reg_aldo4>;
@@ -377,3 +425,14 @@ &usbotg {
 &usbphy {
 	status = "okay";
 };
+
+&tcon_lcd0 {
+	status = "okay";
+};
+
+&tcon_lcd0_out {
+	tcon_lcd0_out_lcd: endpoint@1 {
+		reg = <1>;
+		remote-endpoint = <&panel_in_rgb>;
+	};
+};
-- 
2.43.0

