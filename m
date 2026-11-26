Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729498;
	b=RnYzJIwRRKXoJrERCDZIK2ZHiBUrQ8n1JymfbWHHbGM16URRKdGGTf61kl1iZT9djHGZ
	 B+cuTdKcOvQ9rdNpQ8gJNborvvrzLaNr2eyUKbR+s2xJ8Hny5xZo2HQanEkfn9Tgt1ZIV
	 5izrcOdZVOTLHEF/Zjjyki1GJgxlq3nxcRxdwBtun6TXr6SIgDde1gGdrOvlWdjnNJ9dZ
	 cWBYC0Zyl8mtae6Rsyx6sgtMT66wzAXMMNZ9ksf0BYk8LhuzFoAKhztCdLRAoFe86Nugj
	 HlHZ9SBQPIuuxgINJNirQDkOk0B8tcFacXO7nnryV1lTNwakgAyMqpn7OVLDU36FTMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729498;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rgoIgw35YcjRzBDNQLX8AgVyjJr3fxJKdB7QZhfiyn4=;
	b=HtOAKh+TEhLuJbOwzmgCdEBWdZQI6HjhINetzn8ULZt40sXiCUMNiqIrGeYXbZ7jCEQj
	 jyEgYNoTRiRpbNAN8sqCjsz5HnZRySmQmgZWBJXa2jTTqiaDqnX7qKJqG8DqHUrUCT4aT
	 xBx+dI8RjU4F+Oodo3ahOvydQrckB8uJa7mu1bb2jzfxM1HDaGL1Jt3YUp7VojRw99Yk5
	 fIY/FqZ0Ry73JG6qGs3t1mlsVi9N8Kj0bX4odk5tMm4+QW6Iy/T1H8B2RGTcBowd/sVr5
	 QVQigwGL0lAsEoKb89QiJ5qU9n3JtbMgZNFOukfQuErsOYaJaHC4/IY4TNXhQSjSaGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zlViqTwB;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2723606A68D
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 21:44:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2723606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zlViqTwB
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48dee593f18so6980707f8f.3
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 13:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729496; x=1796334296; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rgoIgw35YcjRzBDNQLX8AgVyjJr3fxJKdB7QZhfiyn4=;
        b=zlViqTwBIyBLu4MXyg+Gy/iXGFWP8kdlUYzztCtZrCsT8YppUCIM1ocOU/DCRcq0Ic
         xlTNBKRZZptnZ6GZ5VH+2zDqt3k6rkXsopySMyS7PnkLVNP7ItJ/4qW29EylhFWXIugL
         +pGyFpOqYCXYz/WVZ3JXMCjXg65H0FAoY0mped9Ee53KhiTEUVYzNELan/Ti5mYgxCwV
         CleeNOYJhgLxXbuGMcXkdAVnItXk9LaNm1BUW7h0w8W28kVM6VYKn2DNri1lnq+jM2Dy
         TdnoUBLFLnxIP6xL05X3VrYoeJfQUmpGRYwm7mDQPyZQx8zf3l8pQwBgwI3aOvqWv+mD
         fdyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729496; x=1796334296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rgoIgw35YcjRzBDNQLX8AgVyjJr3fxJKdB7QZhfiyn4=;
        b=btj/tufFfqQTNkuHc3rTnitm8770XXU1azkm3+fgpFf/2nQpdnND0tKxVSRyktIuTq
         4rvcLfZJYqnn8+XBiwPF9UaDlxJ4zUBWqZ73Fg5rwpSTQP4k4IG6K2pGea7pafwDaHg+
         O6KFzYMMP9tYCJioIzr6Xc02Kx6y/RGKSYGcAbi+CYuwwIC+SjiLF0197ktjI8V8VvLE
         5OAsWeHupEbJ5tM3Ob2CXLjOOnBMetGWu8Prv4yqUzPrMjurb6iKtKHMi1JFyTZsbOVI
         9KoIXynIdbLsW4ndLjTFec+8rTyTwtzBQDVLKikwWB81AybQRwUG61f6XX8MKouE/mBA
         2xwQ==
X-Forwarded-Encrypted: i=1; AL+hErEKUN9uKWMmQ82yrOpMFF/ajgt9QlIERSCATwGqbDeQlGtvTh/vGW/jO1OHnWi8kJQ+ni/x1S+X8ga3/w==@lists.linux.dev
X-Gm-Message-State: APuU4Z/SL1plaFGRw3YwEPTGe2JRgUVkGQGWeozwsRepwYpX4kQhItRH
	5h6ke1sVLSLwwp5rTwqhYgTYGK14F9gxT4F5bfPmUkIOXs9hiladRylR
X-Gm-Gg: AZFdTZdah9Sqn6C2I9RctBzjXPQtlvUma+y2R+JTleVuzao2gnlZ8Y46PpCCmfJ2kpR
	SgWMbfnyxpqpKs5g9cd2s3k1T6Pu4Y8NmOMXLPDEKE9aN4RIY/Rc+yGzzwNKkOzDwJ46oEeB2e7
	x/eXihGDc0BdV+f3MU+ePJuqRdeGay5hmJVWRaej+soj1eEPwVHV/RGzP4RqqfIwtxoOEFCtzOf
	Ect9cSCqOhOw2QO/lpN9DGblttxGR3Nm0e1NzeWvbEru7O36zz3HUYad+iVKP2nZoo9wjMsW2b4
	qCsDgIJlT61wXIYEao/FY9sdBaUPnhvyk4LnMdjeCSK0jde5JeiFBf37jiXe0rc8wOopYV2YZT9
	wZ81TIgkUMMhZKNc1N+mQ+JuFbyUyrR7hkpplow/iPUhoiQhTLBpclUoWkTMeHf5Vwmzorn3s1Q
	rBdto+6HgeuMZYkqiXec4Z2y5nse6sr9oFpK1rUzJLoS9k0RwZ5Qg7DYia08zymch1PnOx8kGaK
	ug2PVBkEfnzHGyAEi4zLGhQBv5tSu7+A6WhWPgpsRiqXYNHOh9OGZN0BwdOD/A81mrjsYwr172b
	JFm1TbcJCtLpuQSGQJhTI/vtCrrfsoImxbtTS/sHIxA7HFRieQg7JLb+6ADxwq8gbzZrfC0HJbP
	MTe0gM4PZiDWd2it3j11ErJUwkUDMwOa31Fmy8PICOk5Mr0YKCEIBqtP3H4tbdkULyDmlqrZ3fs
	/3bK1upA/GHr6Wyb1FuqJVj/uAoqf5pLZGle7VYGMZPwkeR99GKs9sy8wDY3q8c1/Lm9kcL1Mcx
	ZRKEHiQVIKCGNEIotZASP6Bm/bagi/HVwcYVE3SJA==
X-Received: by 2002:a5d:5846:0:b0:4a6:4ac6:d950 with SMTP id ffacd0b85a97d-4abb400ae95mr45098156f8f.39.1795729495913;
        Thu, 26 Nov 2026 13:44:55 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm40403963f8f.18.2026.11.26.13.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:44:54 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	jernej.skrabec@gmail.com,
	p.zabel@pengutronix.de,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 11/11] arm64: dts: allwinner: h616: Enable HDMI on several boards
Date: Thu, 26 Nov 2026 22:44:33 +0100
Message-ID: <20261126214433.3562326-12-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
References: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that H616 display pipeline is added, enable HDMI on several boards.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../dts/allwinner/sun50i-h313-tanix-tx1.dts   | 30 +++++++++++++++++++
 .../allwinner/sun50i-h616-orangepi-zero.dtsi  | 25 ++++++++++++++++
 .../allwinner/sun50i-h616-orangepi-zero2.dts  |  5 ++++
 .../dts/allwinner/sun50i-h616-x96-mate.dts    | 30 +++++++++++++++++++
 .../allwinner/sun50i-h618-orangepi-zero3.dts  |  5 ++++
 .../sun50i-h618-transpeed-8k618-t.dts         | 30 +++++++++++++++++++
 .../sun50i-h618-yuzukihd-chameleon.dts        | 30 +++++++++++++++++++
 7 files changed, 155 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dts b/arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dts
index 7906b79c0389..c5226a427eaa 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dts
@@ -26,6 +26,17 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 
@@ -75,6 +86,10 @@ &cpu0 {
 	cpu-supply = <&reg_dcdc2>;
 };
 
+&de {
+	status = "okay";
+};
+
 &ehci0 {
 	status = "okay";
 };
@@ -84,6 +99,17 @@ &gpu {
 	status = "okay";
 };
 
+&hdmi {
+	hvcc-supply = <&reg_aldo1>;
+	status = "okay";
+};
+
+&hdmi_out {
+	hdmi_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};
+
 &ir {
 	status = "okay";
 };
@@ -178,6 +204,10 @@ reg_dcdc3: dcdc3 {
 	};
 };
 
+&tcon_tv0 {
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_ph_pins>;
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
index 0d3e761f6466..51c8ebdbdc88 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
@@ -22,6 +22,17 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	connector {
+		compatible = "hdmi-connector";
+		type = "d";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -64,6 +75,10 @@ &codec {
 	status = "okay";
 };
 
+&de {
+	status = "okay";
+};
+
 &ehci1 {
 	status = "okay";
 };
@@ -81,6 +96,12 @@ &gpu {
 	status = "okay";
 };
 
+&hdmi_out {
+	hdmi_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};
+
 &mdio0 {
 	ext_rgmii_phy: ethernet-phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
@@ -113,6 +134,10 @@ flash@0 {
 	};
 };
 
+&tcon_tv0 {
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_ph_pins>;
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
index 90c25e12e189..0f25b043e020 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
@@ -28,6 +28,11 @@ &gpu {
 	mali-supply = <&reg_dcdcc>;
 };
 
+&hdmi {
+	hvcc-supply = <&reg_bldo1>;
+	status = "okay";
+};
+
 &mmc0 {
 	vmmc-supply = <&reg_dcdce>;
 };
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dts b/arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dts
index 085f3e4e8eaa..568de6f57015 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dts
@@ -23,6 +23,17 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
+
 	reg_vcc5v: vcc5v {
 		/* board wide 5V supply directly from the DC input */
 		compatible = "regulator-fixed";
@@ -42,6 +53,10 @@ &cpu0 {
 	cpu-supply = <&reg_dcdca>;
 };
 
+&de {
+	status = "okay";
+};
+
 &ehci0 {
 	status = "okay";
 };
@@ -55,6 +70,17 @@ &gpu {
 	status = "okay";
 };
 
+&hdmi {
+	hvcc-supply = <&reg_bldo1>;
+	status = "okay";
+};
+
+&hdmi_out {
+	hdmi_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};
+
 &ir {
 	status = "okay";
 };
@@ -202,6 +228,10 @@ sw {
 	};
 };
 
+&tcon_tv0 {
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_ph_pins>;
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts
index c51d4d9120de..4a1754eeb0b6 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts
@@ -31,6 +31,11 @@ &gpu {
 	mali-supply = <&reg_dcdc1>;
 };
 
+&hdmi {
+	hvcc-supply = <&reg_aldo1>;
+	status = "okay";
+};
+
 &mmc0 {
 	/*
 	 * The schematic shows the card detect pin wired up to PF6, via an
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts
index efe0faa252f5..2f09a5cabed5 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts
@@ -24,6 +24,17 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
+
 	reg_vcc5v: vcc5v {
 		/* board wide 5V supply directly from the DC input */
 		compatible = "regulator-fixed";
@@ -61,6 +72,10 @@ &cpu0 {
 	cpu-supply = <&reg_dcdc2>;
 };
 
+&de {
+	status = "okay";
+};
+
 &ehci0 {
 	status = "okay";
 };
@@ -74,6 +89,17 @@ &gpu {
 	status = "okay";
 };
 
+&hdmi {
+	hvcc-supply = <&reg_aldo1>;
+	status = "okay";
+};
+
+&hdmi_out {
+	hdmi_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};
+
 &ir {
 	status = "okay";
 };
@@ -177,6 +203,10 @@ &pio {
 	vcc-pi-supply = <&reg_dldo1>;
 };
 
+&tcon_tv0 {
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_ph_pins>;
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon.dts
index 9e275f0217ec..11b087dad0c1 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon.dts
@@ -24,6 +24,17 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
+
 	reg_vcc5v: vcc5v {
 		/* board wide 5V supply directly from the USB-C socket */
 		compatible = "regulator-fixed";
@@ -52,6 +63,10 @@ &cpu0 {
 	cpu-supply = <&reg_dcdc2>;
 };
 
+&de {
+	status = "okay";
+};
+
 &ehci0 {
 	status = "okay";
 };
@@ -73,6 +88,17 @@ &gpu {
 	status = "okay";
 };
 
+&hdmi {
+	hvcc-supply = <&reg_aldo1>;
+	status = "okay";
+};
+
+&hdmi_out {
+	hdmi_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};
+
 &mmc0 {
 	bus-width = <4>;
 	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;	/* PF6 */
@@ -187,6 +213,10 @@ reg_dcdc3: dcdc3 {
 	};
 };
 
+&tcon_tv0 {
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_ph_pins>;
-- 
2.43.0

