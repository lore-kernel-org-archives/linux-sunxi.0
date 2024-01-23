Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A7D4D5AB
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Jan 2024 21:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706046495; cv=none; b=Vap1U57Y6VKoy4S/2AbhZaeaytymuunUDcs0mIMRI6RSi0pKnpiWBO1yOdzwRlBQKBFr+Q3FohkU94UsR+bbBA61VEMUpfqEvuoG7hJznJ5/u0qatOIdfSZKR4g7aDC9BsD6uk7HvS8VpxRMRxRYTKPv7cKXCqQ0X7QyCBdQ9F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706046495; c=relaxed/simple;
	bh=cot/RLa5B+VvYdjsSjzRhdQNUXnW5oMxtw+aZzsx/eQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=evuaYt4OQbEZhwwlVE+2aQo7EAvCsjIhsAqCKb/ZukxDn1BiDD2UyLKEVJUgRmSroMhvITS5py4FJPudKC0M692HWaNlExCEkPwlXcGipeeB/28xVwcBNLcmosJrOv1P/rmYkAj86wqtgN6YQ3D8Zf5US5MqrzKOMAWsqOiB6W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EEC130Sj; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EEC130Sj"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-50f11e3ba3aso6898519e87.1
        for <linux-sunxi@lists.linux.dev>; Tue, 23 Jan 2024 13:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706046490; x=1706651290; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hxTUu07Tw3JZQ4EBg2GvG/6CFogECC0naJLXgFJuN6s=;
        b=EEC130SjhmdJwTE+WfVBdmf+6Z1BbQfTM1VNWejBs312cPMiVIl5nQlp+o7mpDuA7x
         p+IVPLYpA/3eOqUKxZO5YSozdZtj4VpjuIT9DBI5EJuQwpm7BszJY2uWzjJeRP6w0PEp
         Av0wGUj3FGgAQNN73eCaaOLama82DxLvdX9hYMCslZ06CsFOEh6YFocoklSRPv56AoQQ
         J6eEKbfrPT9kaAcZ5USkPor/Z+RUBhVKxp569vQVIXrcOKdv6qSwu94K38dIh5JbyoQg
         fop0qgSiZxjp+HmDhz+h19SVF2zlJuPPrsAMdy7/WQAiM1YYlBj99yLpOkPf4acSaPAH
         XxuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706046490; x=1706651290;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hxTUu07Tw3JZQ4EBg2GvG/6CFogECC0naJLXgFJuN6s=;
        b=BnRo7OSaytSDWIEs9PGl2hczHDe9Pa1S0D61+LDjFwaseJq+nTiO9i1wcfB+u8esPO
         xREITlHeHq4Ef93fsg4rCM9PMIJshpuFZ3XAdF4Ll871f+v4mIO7zsW5vIk4nKs18Xke
         b7mSK/JXZhl1tTi/1G5xeXTa7BouFV+KGjZ+5XZiV7RKuNju4FQ6oqsiFzEJzuNMWH4W
         BcbwNI4dtPr6JYnquNlD0AQn4/vWi2UU7QlZjEcOZ6cKIP453Etd7wCSKpJMZrZVivEm
         4Y/EP4LvcMKxV5aadv0kKnptnRdf4kbyb8gSfwh9lvwTHKyxB8WhojuvNAN7L4qGOtKa
         IrSg==
X-Gm-Message-State: AOJu0Ywb/humfQh7EfWVDwMndSzx1XwmTvQVV/VueY0JI195xFcp6vpG
	eg4thmhyK7ZBiO8hhb1lUY5gCkZdhutJoaIWbQkHlS72tdHlRD3F
X-Google-Smtp-Source: AGHT+IHZ4f7jIFRNJ+6G/KFQ8DhBSxZWT2NG2LD0URxwP0fjG+Ik3wpsd03v9PwttJz5KM4uopPA3g==
X-Received: by 2002:a05:6512:ba5:b0:50e:8e74:6406 with SMTP id b37-20020a0565120ba500b0050e8e746406mr4251539lfv.36.1706046489310;
        Tue, 23 Jan 2024 13:48:09 -0800 (PST)
Received: from localhost.localdomain ([2a05:3580:f312:6c01:1b8f:2a1b:d18:1951])
        by smtp.gmail.com with ESMTPSA id z7-20020ac24187000000b005100c6c925csm133993lfh.88.2024.01.23.13.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 13:48:08 -0800 (PST)
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ondrej Jirman <megi@xff.cz>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Pavel Machek <pavel@ucw.cz>,
	Arnaud Ferraris <arnaud.ferraris@collabora.com>
Cc: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Subject: [PATCH] arm64: dts: sun50i-a64-pinephone: Add front/back cameras
Date: Wed, 24 Jan 2024 00:47:29 +0300
Message-ID: <20240123214729.2852346-1-andrej.skvortzov@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ondřej Jirman <megi@xff.cz>

Pinephone has OV5640 back camera and GC2145 front camera. Add support
for both.

Signed-off-by: Ondrej Jirman <megi@xff.cz>
Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
---
 .../dts/allwinner/sun50i-a64-pinephone.dtsi   | 91 +++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
index 87847116ab6d..4104a136ff75 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
@@ -36,6 +36,15 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	i2c_csi: i2c-csi {
+		compatible = "i2c-gpio";
+		sda-gpios = <&pio 4 13 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>; /* PE13 */
+		scl-gpios = <&pio 4 12 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>; /* PE12 */
+		i2c-gpio,delay-us = <3>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -124,6 +133,36 @@ &cpu3 {
 	cpu-supply = <&reg_dcdc2>;
 };
 
+&csi {
+	pinctrl-0 = <&csi_pins>, <&csi_mclk_pin>;
+	status = "okay";
+
+	port {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		csi_ov5640_ep: endpoint@0 {
+			reg = <0>;
+			remote-endpoint = <&ov5640_ep>;
+			bus-width = <8>;
+			hsync-active = <1>; /* Active high */
+			vsync-active = <0>; /* Active low */
+			data-active = <1>;  /* Active high */
+			pclk-sample = <1>;  /* Rising */
+		};
+
+		csi_gc2145_ep: endpoint@1 {
+			reg = <1>;
+			remote-endpoint = <&gc2145_ep>;
+			bus-width = <8>;
+			hsync-active = <1>;
+			vsync-active = <1>;
+			data-active = <1>;
+			pclk-sample = <1>;
+		};
+	};
+};
+
 &dai {
 	status = "okay";
 };
@@ -158,6 +197,58 @@ &ehci1 {
 	status = "okay";
 };
 
+&i2c_csi {
+	gc2145: front-camera@3c {
+		compatible = "galaxycore,gc2145";
+		reg = <0x3c>;
+		clocks = <&ccu CLK_CSI_MCLK>;
+		clock-names = "xclk";
+		avdd-supply = <&reg_dldo3>;
+		dvdd-supply = <&reg_aldo1>;
+		iovdd-supply = <&reg_eldo3>;
+		reset-gpios = <&pio 4 16 (GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN)>; /* PE16 */
+		powerdown-gpios = <&pio 4 17 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>; /* PE17 */
+		rotation = <270>;
+		orientation = <0>;
+
+		port {
+			gc2145_ep: endpoint {
+				remote-endpoint = <&csi_gc2145_ep>;
+				bus-width = <8>;
+				hsync-active = <1>;
+				vsync-active = <1>;
+				data-active = <1>;
+				pclk-sample = <1>;
+			};
+		};
+	};
+
+	ov5640: rear-camera@4c {
+		compatible = "ovti,ov5640";
+		reg = <0x4c>;
+		clocks = <&ccu CLK_CSI_MCLK>;
+		clock-names = "xclk";
+		AVDD-supply = <&reg_dldo3>;
+		DOVDD-supply = <&reg_aldo1>; /* shared with AFVCC */
+		DVDD-supply = <&reg_eldo3>;
+		reset-gpios = <&pio 3 3 (GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN)>; /* PD3 */
+		powerdown-gpios = <&pio 2 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>; /* PC0 */
+		rotation = <90>;
+		orientation = <1>;
+
+		port {
+			ov5640_ep: endpoint {
+				remote-endpoint = <&csi_ov5640_ep>;
+				bus-width = <8>;
+				hsync-active = <1>; /* Active high */
+				vsync-active = <0>; /* Active low */
+				data-active = <1>;  /* Active high */
+				pclk-sample = <1>;  /* Rising */
+			};
+		};
+	};
+};
+
 &i2c0 {
 	status = "okay";
 
-- 
2.43.0

