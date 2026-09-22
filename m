Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9E02192F9
	for <linux-sunxi@lists.linux.dev>; Tue, 22 Sep 2026 00:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790035612; cv=none; b=D4djGkHACkXDGBniW5pWyI6l74d/iKrqtSu8cyXQEcJUkdzh1FSKekPiB0Sf1ZR2oJ07yxTPjOoWCswGiq34vo5/Q9PjTznNnOTpstswoGNpZFvZBtR+LbANvmklW58jaM0sZRSw9x5aDtAhLldjo6ltjl/XBoIhce9R/3D6Qrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790035612; c=relaxed/simple;
	bh=cxjDKZ0MA9VUms6JcpknLJlKdT7ZoJ5aaylgo7tCtYM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CBykBcYe0Xo1Fjam25wx8NAObOMyT/LkpZyuKeEXuNwAi0UY6xZETinUlaqnD/adcq5ZWa/SssDBidjusjZJhAXKAePtUYMNoP/Spm1KqpibXnKlFHzzY8cMgz+mt6DhQdY2rWqcU8Zq3YbBHX/MzqyrQ+cxJQCWcVLE8GrvWI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MZbMAFjG; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MZbMAFjG"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-482620dc91bso2566540fac.2
        for <linux-sunxi@lists.linux.dev>; Mon, 21 Sep 2026 17:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790035609; x=1790640409; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FHj476tA2byKc8arhZaw8Ci81fHtdMiGqz0hVZIDFng=;
        b=MZbMAFjG/wTH5OInIuARwFZGpfFozn0ZDaUl+YzeJm5pBFJJ37MisO2WTqmpETqCDf
         HX9MchjSSeXQc2/qt19Nm3gjtiZxlyBuGva3GTZLK26oSD+hsPMLi4Kq/ZOdNQnyHHPM
         VomZX5GrqV5qTSzwSSTRXu2eYWaQyWLxj65cbtlGSNzAtuXYYVvbE1I69Rz655lB9Yqd
         EboutFx8IOScM+cZDVgMACMAKT4Xby1PaQ4XZb0UjMGA5leveKN5LR/k1aluVUM2uxUh
         6BF8N6TN45MMBo4iiTPahyoN52Rjj81D8sVKJ9C8UVtMBKK+EZsgc3gg/DLR+Fl+i8fA
         DM4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790035609; x=1790640409;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FHj476tA2byKc8arhZaw8Ci81fHtdMiGqz0hVZIDFng=;
        b=iCt2MUCItvWl5x4IMDV5uZuwgGU87qWmqhD80WM8IG/6GLm7Bq2MPxhv69QzKQ2WBA
         rEuGFgIJUjvFaxA5PKxOQOSivA/WEEnLYCMpXtECBhNIdpe0+F81jpQpZnidjracOJBU
         6GWJN0naW2OsPDdbVV7YdulNMV3hCvjrJiHmlqUKHKrlyhuykc0Lea1HItLjdREXt8sE
         tdLHmO6rp7kuuCAXOdx24U7wTEnT3Mteeg9KWQt14ppQMvsBUJ7QTcj/jF/rxONw/t+G
         Lw/PA7/qcmjnTyKoGauKPlwV+GYhhMFFf9bNLWLGAUi6/7IKKy/iO9mgH2xinEwnSr/r
         FC2g==
X-Forwarded-Encrypted: i=1; AKwUvBwXa80xjB57RE2k7jm6kL+DiFHYwtvi9tPD+wyXz18RsQeHSnAaehmLmNfQsZmtnlXPjHVt+VfjKHUn5g==@lists.linux.dev
X-Gm-Message-State: AFuF++lIWxJLnQTkVT9D3QHYoSABIb9heVsgep5aZ4CUCiq1myvqrLpV
	OBrIaavfHEBNc0AgXrpJqvxQkMSzUM40KktwXxAxIkP6GyeCfKynfMF9
X-Gm-Gg: AYBFou0xWS9QB4/7wuWAGcRJJb4/SPg96IRZj5XW2DGlBLEHBHJ4h4yvergNXUR9FDh
	lquZDnixAOJwjUEbmFQYKdy8D7V5iPA1fhPbGytwSSgs313WeevmjiCzF4tAe4Co5wKFsFKGZuC
	KrS8/1wAez9AexiWu4O27tjA6G0xSH+OYPNkTQ5DPwRfZloY3B1u6ZoecoWh1Fz/vGNo3bkobyR
	oeBVPLxGvMTfPaAbEO5cp3jlrww5tmGkWWbjZN+B5YLqgCplL8DOKicylG/teDZDtEy/uzxCeMN
	7L/IOAix0JBSrMjsSzcTo7d48QHSA1fDWzGMJahmY9AvUsfji5HCcOhPNvbMLyQvj8/yHH7voBD
	TjQWjaGjhJHtCmuAqJgcfCG9wvJFhPPSlgMsLfXbP25oIl5V/GaCKZewrknk6xNRi67IKmAkzGw
	IbJpN09CCk9AHlO+Y2iuuaRaHbd0WwQinOkfEdY0gp3IrtfoglKczdprP75JhMn7BWsRIP3NjT3
	MB8/2ODlImmAFGm7xuosDTFAM2hXpWOulER9yHW+fybBaF+RL7IPAkj6C+utwXk8iyab/ICOTyg
	D5k+ydv6qtRa9BWUijZFj9Y9EKsbA/jkfyQJM8f9vEXtvh+a6p+Xiudgf7zHClQ1WbK4GiAn5aG
	5YIUJ+nCzvbYW9b0gxgN1
X-Received: by 2002:a05:6870:21e4:b0:464:c314:ddc2 with SMTP id 586e51a60fabf-486e4bbce38mr12349868fac.8.1790035609185;
        Mon, 21 Sep 2026 17:06:49 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-48f7280cf14sm801683fac.13.2026.09.21.17.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 17:06:48 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 21 Sep 2026 18:06:33 -0600
Subject: [PATCH v9 4/5] arm64: dts: allwinner: h616: add PWM controller
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-h616-pwm-v8-v9-4-37bec6201ff5@gmail.com>
References: <20260921-h616-pwm-v8-v9-0-37bec6201ff5@gmail.com>
In-Reply-To: <20260921-h616-pwm-v8-v9-0-37bec6201ff5@gmail.com>
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

