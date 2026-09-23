Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B78043803B
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 05:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790141792; cv=none; b=JXjMMolT3Tkuj+5j05BlYzlUwMNdiXNDM78cwf5a3++eolI4sah28SSITvh1r+3SfONcJRQRXGqPHTnke3IKbRhIcGHSuTrau7FFv49EGxDHTSDfxqRhcehxgcoK+x8weI3CZjCXGLibFjef1G/36XVPoDN5M3f+RwIY+OCPj3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790141792; c=relaxed/simple;
	bh=cxjDKZ0MA9VUms6JcpknLJlKdT7ZoJ5aaylgo7tCtYM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I8oD9aTVA0usfTIE9TDBj4gZg8cOiac6sZoFmhWWhfILbdCPzzli+MKJ6v0YOu2mv87sukV6OmcOHG4MYPzaGrLKxIu329xZg3WWyfZN5Eq77LZ4bMey3PYAQMwwN2yNtmMh4UZuKmoSQcCx0cgutt+ohO9S16z+XUwHcdey8v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eN4b+Q0H; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eN4b+Q0H"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c4bf3defecso442126b6e.3
        for <linux-sunxi@lists.linux.dev>; Tue, 22 Sep 2026 22:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790141788; x=1790746588; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FHj476tA2byKc8arhZaw8Ci81fHtdMiGqz0hVZIDFng=;
        b=eN4b+Q0HKDzC8jCURvF+ChM35xSfVSZyC7KjIqEIznSbdXNpRm/+uCZGFkzLX99QS6
         TYbeZROH8+IA37wVV4dHk93LzpmS0KER7yddIrj6wf5zWRe3Mih72Bcy/+ouCUYr2EiK
         SJIZQ0Bq+ThiT9hAZjN6VKFP1GDGmWWheiz67NyEA5Mpp+tTL3ZTcBWyDBzUgFEWDSph
         6LhJkqrEfS2wh+4kzZGFCK9/Z4P4Bvutum0WTInqVbF9fQ53yD9yAfoZbVKJuwzjVVvt
         ig3gdFVp0/prsaj37eTHOSa3OMUdmws519kCS8rto1S7QsuCi2047FGb6HohEXaamtzL
         P5hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790141788; x=1790746588;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FHj476tA2byKc8arhZaw8Ci81fHtdMiGqz0hVZIDFng=;
        b=j+3lt9FlsOX1Fk758eJojo+/yw0h3mSWlSR34miUM8tPt2l9nIYT82vtT5kGIfZAWt
         hTVWPXHr9GzYqkMix6kd8Rvl8G66vDstmkPlNyjp6GFR3rfUKJkTfsDBD2v4+HULEQnY
         b0ZbY9L3ZeFbA1EDHN672J89bEl+drEMRT6zU6nTZJqFQ7k8W3YEfZSYIR+v+VQ3D0xu
         Urs7d0DMksDHuaX5Nur35ge/CJ/NYs6znotlFLy+fnODky75mG4XQkMQ8sJH5IPB3eSU
         ITUm0SS1/OwuJ2fgNrg/eYti66zEQKNZ2lzGg2SA0A+svfuppfAzduTrIeoWZ3TR46aO
         KTgQ==
X-Forwarded-Encrypted: i=1; AKwUvByYnjBKLDQLcY/NKWpzchj5Gx/QKpqs2Thegkq5xobaf/6CzG2vxG78AjHQnt2MazfV5mmcLOeHpTEnvg==@lists.linux.dev
X-Gm-Message-State: AFuF++m1sh65B6j5Yg0Q1cBG2jojrgIUG/AQqKq/zlV5xFnTmy187cH9
	8MOo4faAa8Sul3EPo6N+8pwXUrYleq7biYPn7vKRXLQS4b4N4OpXrZsL
X-Gm-Gg: AYBFou0yT4U457Omr/VIH4i/1BVKFX+dzULaV6mi/6o2QnJD+MdbIfawlteEQdnjJeB
	wWM4TAbKIX0fWnubUW9w8L5U+ETjHdK6QHu3v3RCsuwLZ+F5vJL228ErYq19mA1fB1bqLZHS99l
	lR2T1Dg8dD/atTTLpl9hUVYDJHWwBfikPcTBLN9Wj9my2BXvAsRhIhO4ndAfIg4JZq4QWYVwfRU
	QKmNOUmdAp15mSNbVyH/Ldj5M+uq7GakKHSfImNzw63ZMCkl2MvwXx+CpPeAvT81X0g47g7QjQE
	NCPjh1iX4i88ZvjdiCnbdlcAAmqGYRUiaS2u6SfPrY/FON5x94ZkygvGM8rEcw2jEM1mHBN62cM
	4Kt9za/VD0cvjCZ7MguoQNR5Ljz7p7VBTjQvAhW0kWeGQCobMziw6ZL5Psf41UYzSi/KbS7c8gO
	57Dd81XUNz3HBRvygyfOdBTYq/3jMSQlWG7S2MpQghX9VKOx6Dk6wq+et5nIIPZvfZ08luiIX9d
	JdMypK70y5PUFPHWy3AcZ/SmpmYqaGsYphPPzI+UDkqQuODQAlZxudhFX/B1p5GNuFvw24BbIdB
	hH2ZYD9S0Px6v2TUUkOFLndIKTX9fYGvSQX77Voy+3eO7oy5byLopba39a/YsedSuIr5L0z/Sdj
	WDsdkuIpPJWCLpuKpn5wi
X-Received: by 2002:a05:6808:1783:b0:4c6:eddf:ca6f with SMTP id 5614622812f47-4d5b6bda069mr1922304b6e.12.1790141788407;
        Tue, 22 Sep 2026 22:36:28 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4d5c4aed99bsm1436896b6e.12.2026.09.22.22.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 22:36:27 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 22 Sep 2026 23:36:17 -0600
Subject: [PATCH v10 4/5] arm64: dts: allwinner: h616: add PWM controller
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-h616-pwm-v8-v10-4-dccebbe1aabf@gmail.com>
References: <20260922-h616-pwm-v8-v10-0-dccebbe1aabf@gmail.com>
In-Reply-To: <20260922-h616-pwm-v8-v10-0-dccebbe1aabf@gmail.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 John Stultz <jstultz@google.com>, Joao Schim <joao@schimsalabim.eu>, 
 bigunclemax@gmail.com, linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
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

