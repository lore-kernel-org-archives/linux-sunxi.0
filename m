Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794762716;
	b=vsj+QkobUiebIm/oj+2eS+5klgqYEB+Waii0ytWhTx40sP84Sn9rOyTtz8dZtsS4w3Qp
	 b7j0grASgZ7DvlvrvD96nrV/+Lo89tTu9+uiWjP8NNgIDhDDOgfyZumW7ErcZ84uPyykt
	 OqnoVNw/7Y/S4vzY2/PrkwL6I9M2rF6f6buO0Um8+/UXjf8o8CGR+c2Wwo4L7yIe8SDCd
	 0DXdbqvs+dy6gwkiE/37n3rguFpnsAFiwKeeyoZKzY1jFv3XdXzhe04IlxU+4UG+kd+vE
	 ZTdBDqNC0te83B4wHsr9obsCkyZs9MHDWw81AQz1yGMvgSYGkBrLvcHTZDaX7Wv+SKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794762716;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VzAxZ0RnZAjE719KYavFE7LkkGQ9v4Zgw3d/Pw+Z9SA=;
	b=N9jD4HErENCvcbFlnkMufj58bE2rPzfv220jxb1l14FV1OQwi9l1e2YyqvU1c6DCQhLy
	 rCYRnH3/ghkGbB1o6c8MK5FpK34uLupoTpb2t/MISmx/3VbBcTZSPLxFE2+RwMnf4FWRc
	 VmyHdUkOEqrfymJrBwC7WJTtdg7R3B0n33CGZ8YOIn9rKMBsntpxlFzsDTTMic3PaZhjC
	 YXn2wXUmPUSy+xygdI/Wd6NyGOZWBS04zrL/Y4GB2wdmsUriHpm1cRP1uCk5FvX7LsWKa
	 yu8Lt2Ks9/qnXVt8OWhzbKktaIRAMcJmWReT5hBvvg+hc22goVbWDoT6cYPTOny3ONA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YNSYLKXh;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDFA606A891
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 17:11:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BDFA606A891
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YNSYLKXh
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so26560195e9.1
        for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 09:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794762714; x=1795367514; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VzAxZ0RnZAjE719KYavFE7LkkGQ9v4Zgw3d/Pw+Z9SA=;
        b=YNSYLKXhJ5B7066wVx0mWO7Reb6dl5NrH+JQ8iPKRRSMrQA2bcq4jX1B5GcKqwByf2
         Zk8aT5E7fcZe6wMy7u3wpz4bGptkXqnnkDafg+UXDYFX1t60gQ8y+FQhx62YsNlv8wGY
         OGychBXoKWI9ExtoaH2lFYqzHA18njHhX8TW3Joqo2P/M55yu0dPLL8lYJI8aJNxYNeD
         ugdg90T7NnTubuNPAD45u9u/LFGCsHvgqBm8gQrI0yy+FPn6V7YDc9XvAq3uQsvL4R4+
         bTlhBFGDn7EojASN6YC73cheE7ECXtJsRA+S9fPxSqQSz96kyFMv+twg3mCvoWEJhOOK
         aLdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794762714; x=1795367514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VzAxZ0RnZAjE719KYavFE7LkkGQ9v4Zgw3d/Pw+Z9SA=;
        b=RxzKz34g63rkz9akySR1yt6plpw/glqU1IPJamFUau5nDAAjvL4SRfs53xKk6Q6dw2
         uyPSNCS4Ib/4W08tl/ChHa7cOmJ6ITAFmEFPj59/sov9LjHTPVLq7NUpNGPb2xHupLLR
         ufHBRalwmtnFf1sl/yAFtU/n9Ljom6XSVPHPkxOBR54MVLD/Z23vXPwipPsJ8UDnycgx
         dcWQRiWAGm/UHbRojvEj/Bx4+03uVBK6nBVi6UhWIPvH8zWEwXq8tgR/ClAtQ3/fs/zI
         SqdrgnItwOlBRc2gCO25Fk4itpN/5+t5Hp1/ePi8ngt+s73GAyWKTNg7Z50KmLFK57d2
         XTGQ==
X-Forwarded-Encrypted: i=1; AL+hErHj9Y5CjO7/v3HjbgrHI6OxYq0xi8bdxc5EvChX2bylZlx9ok+fpSu6csQB0JPICdmKBgQGsOEEV42tLA==@lists.linux.dev
X-Gm-Message-State: APuU4Z8YC1oqebb/lZGTU33zZTozS7LBIuAT7AVRDJH7jg123bidyY2Z
	KTDPqsQF9oOvKkDkzqUaa/Pvwhi+VPWBdLWFHqq9SyUXBj+BrQwT+eJp
X-Gm-Gg: AYBFou0Rxg8vS93TJ8EvTSlS1720U71u46I6AjTQL93DNjZ1fKc/HoVxwLzIQTuLQO7
	vp5wIy6vgdPedjbFYErkUwto9jNFnBUIqet4M9ce8m7ecrAimQGFwwpTL7tV1o19PT2tMoZLHjJ
	V8z5yv6GlKlG5DL5IQT9CxFUytIM6aES/SJ5zgCPGA6OLj2oy4C2WLTKAZq7lDrR5lYjE5q0Pkb
	svcUKacbAH0hB4TfsKn2kfNgflK9dlsb3DteJT1sAxAEgAvhoQ990HX+Fhoc4Q6YLc35fzuHq66
	WH67WPmuUU1RywQZh7GfNaD3bbKCZqOR1DYR5EgH20Z0W1IL8PTcZByN0HtS7NV4kOA3NimlvBU
	+UmNjJUzoY6kcxxDhD/59CDP3GpAl8CF3gRjLa26P5v/4sHciUOfyF+K2c+o0prie9t63WuPhVT
	UaHWLLYHm0hS05c7g+wdDE40eps4qVtjuiAxwrXmiIpjawgSCr0ngTOb0CuI5youBZ4OQk5ke4D
	UyE5zuZ3n8Yw2v9q5WeA3MwPDOwEY0HE53P/rgMi0aPaFcGWsSsBO8KiiV60fNtVcvSnHhBoGKQ
	3BgIDGf1BSVL7gL2PN6ai+Mah1vTFmvGNpbYj++nSWtPBpDGfG4gopbPpMe+Yi8PSNfLui8a2yn
	hzHeqdn0bgxUu4DNVwPU2kd/UwrdN2uxP5ETvriHkhlnubuRhq5gs8k3zBGTeOHjbHy5LpsrFfy
	iE5CL1PdrQsfCHLJESOAJqaaRxhkOvLJIknCC1Wgj7hgABO3kdZr+ZLEFN4RmOiPYtkodG8f+Nb
	ASP9lQnyNJWUw==
X-Received: by 2002:a05:600c:1906:b0:4a1:c6f5:2450 with SMTP id 5b1f17b1804b1-4bb55ac2a34mr189672185e9.17.1794762713782;
        Sun, 15 Nov 2026 09:11:53 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2538b9sm501415845e9.1.2026.11.15.09.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 09:11:53 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	James Hilliard <james.hilliard1@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 1/2] arm64: dts: allwinner: sun50i-h6: Add AC200 companion chip
Date: Sun, 15 Nov 2026 18:11:47 +0100
Message-ID: <20261115171148.37784-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115171148.37784-1-jernej.skrabec@gmail.com>
References: <20261115171148.37784-1-jernej.skrabec@gmail.com>
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

Every H6 package contains an X-Powers AC200 die next to the SoC. It is
controlled over I2C3 (PB17/PB18), takes its 24 MHz reference clock from
PWM1 (PB19), and its Fast Ethernet PHY connects to the EMAC through the
RMII pins on port A.

Describe these parts in the SoC dtsi:
- the I2C3 controller with the AC200 at address 0x10 as its child,
- a pwm-clock that runs PWM1 in bypass mode at 24 MHz as the AC200
  input clock,
- the I2C3, PWM1 and RMII pin groups,
- the EPHY calibration value in the SID.

Everything stays disabled. Boards that use the AC200 enable the
pwm-clock, the PWM and I2C3 controllers and describe the PHY package on
their MDIO bus.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 53 ++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
index 48c771223af4..5e48b35d13de 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
@@ -17,6 +17,16 @@ / {
 	#address-cells = <1>;
 	#size-cells = <1>;
 
+	ac200_clk: ac200-clk {
+		compatible = "pwm-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pwm1_pin>;
+		pwms = <&pwm 1 42 0>;
+		status = "disabled";
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -314,6 +324,10 @@ ths_calibration: thermal-sensor-calibration@14 {
 			cpu_speed_grade: cpu-speed-grade@1c {
 				reg = <0x1c 0x4>;
 			};
+
+			ephy_calibration: ephy-calibration@2c {
+				reg = <0x2c 0x1>;
+			};
 		};
 
 		timer@3009000 {
@@ -388,6 +402,11 @@ i2c2_pins: i2c2-pins {
 				function = "i2c2";
 			};
 
+			i2c3_pins: i2c3-pins {
+				pins = "PB17", "PB18";
+				function = "i2c3";
+			};
+
 			mmc0_pins: mmc0-pins {
 				pins = "PF0", "PF1", "PF2", "PF3",
 				       "PF4", "PF5";
@@ -414,6 +433,19 @@ mmc2_pins: mmc2-pins {
 				bias-pull-up;
 			};
 
+			pwm1_pin: pwm1-pin {
+				pins = "PB19";
+				function = "pwm1";
+			};
+
+			/omit-if-no-ref/
+			rmii_pins: rmii-pins {
+				pins = "PA0", "PA1", "PA2", "PA3", "PA4",
+				       "PA5", "PA6", "PA7", "PA8", "PA9";
+				function = "emac";
+				drive-strength = <40>;
+			};
+
 			/omit-if-no-ref/
 			spi0_pins: spi0-pins {
 				pins = "PC0", "PC2", "PC3";
@@ -626,6 +658,27 @@ i2c2: i2c@5002800 {
 			#size-cells = <0>;
 		};
 
+		i2c3: i2c@5002c00 {
+			compatible = "allwinner,sun50i-h6-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x05002c00 0x400>;
+			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_I2C3>;
+			resets = <&ccu RST_BUS_I2C3>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c3_pins>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* AC200 is co-packaged with the H6 die. */
+			ac200: mixed-signal@10 {
+				compatible = "x-powers,ac200";
+				reg = <0x10>;
+				clocks = <&ac200_clk>;
+			};
+		};
+
 		spi0: spi@5010000 {
 			compatible = "allwinner,sun50i-h6-spi",
 				     "allwinner,sun8i-h3-spi";
-- 
2.43.0

