Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9001386D1
	for <linux-sunxi@lists.linux.dev>; Wed,  5 Jun 2024 17:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717608060; cv=none; b=ulPCddSbnhZdMa0YuAfnWkukhRtXy/etoDUEn8vHnLZdAQFNxFrIyiT3EWgZZwbAgXzBuiNz2FsLbSYllBlj6PT2zQDcg5xkvfebyg+5B0DwWLeCN2SSZ6hJSDgCvkGdOT1He/WjcHVFUo6+6g9czUBtvTHOYDn05LDqw7CpRgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717608060; c=relaxed/simple;
	bh=v38uy+IsAqWrg3+fAws6S2ICkUmrSoIfFgYw6LUYthQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lmvtaLMAn/glR7lu2caKVAU6yrLNKYrnNnINhIKQRZ8mixQ9CmNZsmJd6lOHE7VCLKyUdNHG+efskd0pV9USBiSywiPtnFGA+I10/e3b/rarAvcAOCgcqOpJy8wMLHZrBj2wYKC3FuvG+AbiftdnRy2QpNFesLNnKxMbBRD5Ocs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MJxznGvg; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MJxznGvg"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5b9f9e7176eso125824eaf.2
        for <linux-sunxi@lists.linux.dev>; Wed, 05 Jun 2024 10:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717608058; x=1718212858; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q4pcIzPV4SvI/NyTBNCy7Yz0DtvpCZI8zaBZ0O3NwdI=;
        b=MJxznGvg/eD8FGO9Q3W9CONZdqKETuoaDw675IabZJSe2/T9HvwQ8M1+i6zuWAJgkM
         72zufGanGalJAsin2VtvqPjxtDZKR3tgkuBxHhrU/tjnB+lF04rJ7ef2oLDrNMwIo3ez
         zn2fqQ6SafYKQvw0fVfLQR1W/BrOTmR3sco7wAjtscfJh8FS7l9mqL8vtkZrjP9JNu1Q
         3i8NQt6eDcmFqjXyYZ5y/7cHviix/fHmGytKJcZIxL+a7XZH4CEctkzRUV/XTLnzToRE
         RTlZ3zlzg8MKWoBYpZi9LU1225BzEbZqj9hokTKv74mzCaqlzS1OPwfVE2XKxfu9uF/f
         gQOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717608058; x=1718212858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q4pcIzPV4SvI/NyTBNCy7Yz0DtvpCZI8zaBZ0O3NwdI=;
        b=Ps8dH40d6Nw3ipn8JYaOUGclI/QMlqG6or1XGtxEN3Chgc4m/T2n379AjtrfRJFwEa
         11KiUtofWQUpu4wd4G4MwJsLlhAdUk3q/zJJGgZWwc3zDVHM3571a3qgwyAXfLsbkZiU
         i/+e439IitJ0Vy4sWWGnSlc8EiO+UydtqfdExlFp8tYBlIURlH+lSRcdCGheE3JPh9bF
         86TqlV8mRpQm2uYs3/FouDVO2TWbDsBAH84c8nydmxaseh2lzeLI93kECRNocIZ4zJyJ
         3QeUe8KTs2BHMGMc2NHAMGlh8jyQc+X2x09E80JgMmnhN4Qf8PuxVyiQDbbbLN0EqIHY
         FVPQ==
X-Gm-Message-State: AOJu0YxM60+S9VMt7EsImh/HIDcCxJNuWRa/RkgLOerdJUMxt2xTBAYl
	hce78jSf1jiPKVHGrG5zCyryE9YpJ5OnAB7YGsBWaSzUWYoD5z0kYnTQlA==
X-Google-Smtp-Source: AGHT+IGEJO2C3SSIjP34dzzCCjDHbY4yJhxKBT1mGavHFwBkJoiH3hI/Qn94POcXRuJQcwhV0obvmg==
X-Received: by 2002:a05:6820:1c8f:b0:5ba:6b7b:66fe with SMTP id 006d021491bc7-5ba79162559mr3582930eaf.8.1717608057663;
        Wed, 05 Jun 2024 10:20:57 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5ba72cb44f4sm586124eaf.40.2024.06.05.10.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 10:20:57 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	p.zabel@pengutronix.de,
	sboyd@kernel.org,
	mturquette@baylibre.com,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V2 4/4] arm64: dts: allwinner: anbernic-rg35xx-h: Add ADC joysticks
Date: Wed,  5 Jun 2024 12:20:49 -0500
Message-Id: <20240605172049.231108-5-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240605172049.231108-1-macroalpha82@gmail.com>
References: <20240605172049.231108-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the ADC joysticks found on the Anbernic RG35XX-H. The
joysticks use one channel of the GPADC which is muxed 4 ways by an ADC
mux.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../sun50i-h700-anbernic-rg35xx-h.dts         | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dts
index 63036256917f..ff453336eab1 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dts
@@ -9,6 +9,78 @@
 / {
 	model = "Anbernic RG35XX H";
 	compatible = "anbernic,rg35xx-h", "allwinner,sun50i-h700";
+
+	adc-joystick {
+		compatible = "adc-joystick";
+		io-channels = <&adc_mux 0>,
+			      <&adc_mux 1>,
+			      <&adc_mux 2>,
+			      <&adc_mux 3>;
+		pinctrl-0 = <&joy_mux_pin>;
+		pinctrl-names = "default";
+		poll-interval = <60>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		axis@0 {
+			reg = <0>;
+			abs-flat = <32>;
+			abs-fuzz = <32>;
+			abs-range = <4096 0>;
+			linux,code = <ABS_X>;
+		};
+
+		axis@1 {
+			reg = <1>;
+			abs-flat = <32>;
+			abs-fuzz = <32>;
+			abs-range = <0 4096>;
+			linux,code = <ABS_Y>;
+		};
+
+		axis@2 {
+			reg = <2>;
+			abs-flat = <32>;
+			abs-fuzz = <32>;
+			abs-range = <0 4096>;
+			linux,code = <ABS_RX>;
+		};
+
+		axis@3 {
+			reg = <3>;
+			abs-flat = <32>;
+			abs-fuzz = <32>;
+			abs-range = <4096 0>;
+			linux,code = <ABS_RY>;
+		};
+	};
+
+	adc_mux: adc-mux {
+		compatible = "io-channel-mux";
+		channels = "left_x", "left_y", "right_x", "right_y";
+		#io-channel-cells = <1>;
+		io-channels = <&gpadc 0>;
+		io-channel-names = "parent";
+		mux-controls = <&gpio_mux>;
+		settle-time-us = <100>;
+	};
+
+	gpio_mux: mux-controller {
+		compatible = "gpio-mux";
+		mux-gpios = <&pio 8 1 GPIO_ACTIVE_LOW>,
+			    <&pio 8 2 GPIO_ACTIVE_LOW>;
+		#mux-control-cells = <0>;
+	};
+};
+
+&gpadc {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	channel@0 {
+		reg = <0>;
+	};
 };
 
 &gpio_keys_gamepad {
@@ -34,3 +106,10 @@ &ehci1 {
 &ohci1 {
 	status = "okay";
 };
+
+&pio {
+	joy_mux_pin: joy-mux-pin {
+		pins = "PI0";
+		function = "gpio_out";
+	};
+};
-- 
2.34.1

