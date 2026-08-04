Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224AF41E6DA
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Aug 2026 21:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785878865; cv=none; b=pqjxr7t24Mf/7+Lpwxtf9Y/PecrZKmY8iDQJdZzV12ru8zJMffyPMVtCKzVUPbzICg/Xu9Bx5mcd7cTVZrpsc6HeKA0snDVVBRgadTtAlLtNKv8SWQs8pc+GyvbAi6Fa7H9CQeT5aT2yY9GI5J5ZnERfG4Am1RI3ilvk514Hebo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785878865; c=relaxed/simple;
	bh=cxjDKZ0MA9VUms6JcpknLJlKdT7ZoJ5aaylgo7tCtYM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g09T8v5JFcjkIAKBmTIETpz3ZZogGVopN82I54kggeaCEoUxY8tKKivoFLbk+lyxQPthFll75HVhb29xBC5sBMhMGOPJQLIgjT200lYu4uGOduxjbuqC19W3meBt1ATKtOEqipR9B/WWHg6XJYuQIK5R4HTCH9Yh3fP6YFiqbfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nDPM2Uaw; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nDPM2Uaw"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-4a4c6081f9fso121281b6e.3
        for <linux-sunxi@lists.linux.dev>; Tue, 04 Aug 2026 14:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785878861; x=1786483661; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FHj476tA2byKc8arhZaw8Ci81fHtdMiGqz0hVZIDFng=;
        b=nDPM2UawZxVD8Dxl+Vr834TnUi94C90AL+Rw0eByvudtd1jsLyvjPUOBed3ZQxf9Dl
         gGxQEHAlO0fAfPYketsc5ndi5CIRVbIty7+JSHLqMFtQ6kBPRjDLTwBIzEYfBQs5lqr2
         SJUmEG90OYkNE9vO7kz3HlhSUmqmpD5JY9prUlq0061q6hZ4ECzro5xpLZnmtr4M09ht
         XbmljQuhIig/O3gsw2eU2gkeFIMYZm4OI0tWYTw8kcsySDxYusMW5nCxrmr8CyVHNXZO
         ZI7FKrKLQ71It0Dh8n9kSDFcyEnlhqv82z+OAm3DeTuNpud1L769uH0fU9RmOFE9S/S0
         lb1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785878861; x=1786483661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FHj476tA2byKc8arhZaw8Ci81fHtdMiGqz0hVZIDFng=;
        b=UYnM28dP8oFxvg92nUTcabgMs7U+N3wKnMY1Cr6alVvg3pIiXhiKsIfQDgS6ahmotz
         NGYZj4wCig7Op5+G39qrCk9Q67NJG8jP+Oqxj1F2QtvdG1SCF8NrwdF4Nf98tQRloEVi
         Xq8HJCC7qha89pVR6cvLfd4PV7J1HzX0yJi0ow5UnFkrpdErM74Rb8Abo1xc9IY6rvSN
         OgVhC0MNXJz41yVK28VRRQpYokwuAjqZaKU/xx9+D5jbJQCB8ZsUy82099UeICbWDuhF
         rHVOi1mKEb7OGGjqWNyAGthWhZV7JI84uyyPgwEkpVHMnEVFxhPV8EbF0+yoeNbXLNzY
         3qmw==
X-Forwarded-Encrypted: i=1; AHgh+RozHEE3iwV/K/dpYB3KsvjnInEc45tHwHCZmfLScbY+FfKhd9wmI2OomBX7HjgUMGUAm90B6XSOg0ii8w==@lists.linux.dev
X-Gm-Message-State: AOJu0YyNmqpf1GV3ITGeKzDry0Hdb6xSsYBcmFR42N9ydjDYhHCox48E
	wghmOPnhtW31uWmvlOYgdu9wwB5laOrLGGAOMScXtE1Nn9h1viWZAYKF
X-Gm-Gg: AR+sD105kae2a6yEX1sD6yyL0U6BURb0V5BKsgBGm0b5GgTl+z63YV6idCPRjdfsFrQ
	ZEAQoVJ3U0OUiGuT14o1WXdVI8bOv6qfA3jxxymxwQ6hyY8yANNU8QLNpYeeyJHfof/3bcoKbZk
	1XWI2ASCEW6EnUwI+Mv209zcik6yf94Vj6w6ZjIrBUAo5wm5XuoDRs+8ELXp3Ys4LVYtlW0+dOW
	EAI5To5N/UY0ptc0SA+7CIamtH7QvpROMSNDzW9uKN4HgiqlJKaMg9xWDc8GMCU3eEGiGRrM/u0
	GL9XAHxJFLyg4xUPTQKMV9UuU3GAGbg4IUyabCsE//Qzb3kT74+DwfmaDFtrpTjJgcXKmieBjXE
	3eNvEKbiVVmBNEm8YGuTMVGNfPZ3Xd+c+VN1w4SZCYz74tvI/SO6iabc6pSQ7j0JMYfZncpCBD5
	XKm53Tbnd0ahV3nagwcJPMR8Yz8GOaWeiFHSi1VEOYwri4j1NzLQxlE4G4JAliiugsCOZWh3gdo
	Fsbr7Nw9PyoW8NgrRpQJEWlkshoLZoWVwJYzlNbVt8fY7VASQ3KeVHndPB/JrYk9aqCoahmQbcr
	mR1fh4OEtIU9HRz97L+LEzPHztQ+oToUAnXEK+IVofeeT06Rnw3WNNblWKaCQHGfLk5JpPQTZPF
	GGSkWCrNQ4bn57VlL
X-Received: by 2002:a05:6808:1646:b0:496:559d:5474 with SMTP id 5614622812f47-4afadfb0140mr961793b6e.8.1785878860975;
        Tue, 04 Aug 2026 14:27:40 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4afae7c50e9sm451659b6e.17.2026.08.04.14.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 14:27:40 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 04 Aug 2026 15:27:26 -0600
Subject: [PATCH v8 3/4] arm64: dts: allwinner: h616: add PWM controller
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-h616-pwm-v8-v8-3-db37ab8624ae@gmail.com>
References: <20260804-h616-pwm-v8-v8-0-db37ab8624ae@gmail.com>
In-Reply-To: <20260804-h616-pwm-v8-v8-0-db37ab8624ae@gmail.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Paul Kocialkowski <paulk@sys-base.io>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 John Stultz <jstultz@google.com>, Joao Schim <joao@schimsalabim.eu>, 
 bigunclemax@gmail.com, linux-clk@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

From: Richard Genoud <richard.genoud@bootlin.com>

The H616 has a PWM controller that can provide PWM signals, but also
plain clocks.

Add the PWM controller node and pins in the device tree.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 47 ++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index 1598e86259ab..90fe56a1d3cd 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -281,6 +281,17 @@ watchdog: watchdog@30090a0 {
 			clocks = <&osc24M>;
 		};
 
+		pwm: pwm@300a000 {
+			compatible = "allwinner,sun50i-h616-pwm";
+			reg = <0x0300a000 0x400>;
+			clocks = <&osc24M>, <&ccu CLK_BUS_PWM>;
+			clock-names = "mod", "bus";
+			resets = <&ccu RST_BUS_PWM>;
+			#pwm-cells = <3>;
+			#clock-cells = <1>;
+			status = "disabled";
+		};
+
 		pio: pinctrl@300b000 {
 			compatible = "allwinner,sun50i-h616-pinctrl";
 			reg = <0x0300b000 0x400>;
@@ -385,6 +396,42 @@ nand_rb1_pin: nand-rb1-pin {
 				bias-pull-up;
 			};
 
+			/omit-if-no-ref/
+			pwm0_pin: pwm0-pin {
+				pins = "PD28";
+				function = "pwm0";
+			};
+
+			/omit-if-no-ref/
+			pwm1_pin: pwm1-pin {
+				pins = "PG19";
+				function = "pwm1";
+			};
+
+			/omit-if-no-ref/
+			pwm2_pin: pwm2-pin {
+				pins = "PH2";
+				function = "pwm2";
+			};
+
+			/omit-if-no-ref/
+			pwm3_pin: pwm3-pin {
+				pins = "PH0";
+				function = "pwm3";
+			};
+
+			/omit-if-no-ref/
+			pwm4_pin: pwm4-pin {
+				pins = "PI14";
+				function = "pwm4";
+			};
+
+			/omit-if-no-ref/
+			pwm5_pin: pwm5-pin {
+				pins = "PA12";
+				function = "pwm5";
+			};
+
 			/omit-if-no-ref/
 			spi0_pins: spi0-pins {
 				pins = "PC0", "PC2", "PC4";

-- 
2.53.0

