Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793695242;
	b=WoMpVlUgpuyDiylvaTlF5OJ9nBM3spqmU1CF/bV/PZyMPr0dA7Q4k4jghktHXEUsee11
	 KEd3JLrcLzs3S1fMm48ghlFRBNA8GUxgT9WJoFcMgZgGj8yZF9zcJSHHyOcxKpYRa/HHF
	 t1a/K8FmV0GYSsGO7gb9qbQOwpl1/XZE2Vfyczn6/iv7Ua5HMVzjNzp0UzMdCNTUKjuUd
	 mWDc3fZ0UPqpOR/ZoAVUT5u5Tbi5bn4GmN5eptIG5gLCGTPX6uAH/mKiwPubR6gJtfSjj
	 D85JVllsoOdzeyyqflA5We1lgFQfMPrsSDQKBP/Swi16jInoT0M6DLbUn2aY6k2s7Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793695242;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=eGQwnQ2neaJQ1jlowOf5tkGQBWxndnEwh30xNQGSIkQ=;
	b=mBluyGjaqd88KHCDoyb+1Er1pZRXOboCI8uxzcphsfwfMXqnXHgzAMhT4y+d1DewIRuD
	 cAomGf4xjiZHzBqkElErzaG27Cyf9AchUI/KfDEAdJP5jwb0/1ld6E8WWLkal6JhN76bf
	 ArNCxPsDWMGqVA4Lc4SZn+9wUFfoC5dA2EQtXSCNqofTUpiUSjpCxzOlbjAI/HXs5d64u
	 EkYk/AHA8BqC6o+QYuZRPzBbXvWUIVssxucq9P5lfq2OioMMVijuAoV7sjWb4h/rJPIF+
	 2EOQLETqDBml5m579eLgYPSivuaSzlAuOCS8+DjdCd8rvpHqCVvDInfUhfjn3+XVtWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gbS9hVe2;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9508D606D80F
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Nov 2026 08:40:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9508D606D80F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gbS9hVe2
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6de1ca1b05aso2877474eaf.0
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Nov 2026 00:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793695240; x=1794300040; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eGQwnQ2neaJQ1jlowOf5tkGQBWxndnEwh30xNQGSIkQ=;
        b=gbS9hVe2VVgAfnAxPponCk4HfQrcqJwSAd97Q9vcGT8jYgF6r4riWcl/k4u2sLt1N+
         8LchkVapq5kt3KWvhcjMU5qEzdCvz0PkKjt2qSogUwDz2Eb02DJpUVzuMbYGOw9loiUz
         IWvkC5Ri4ejmwZl2bVbbM0c4Zxr53OAWIdIEBN/yBwNfXxunvkvMgP9e79pjZIqE99yl
         QcQ2qFq9n5mbjjDgT7Kydnvgqzxefuea+zw1hRqTYGcld5tLNNUdfgpudRWaDplUsEfA
         TIHhFj7z1TMYa6nxc+xOAcPZdam/HfmQpX3O3osirFQw9fDg+5QNO8XvRs/0fxbXQEQe
         vPng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793695240; x=1794300040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eGQwnQ2neaJQ1jlowOf5tkGQBWxndnEwh30xNQGSIkQ=;
        b=fmPx7mdAnnG21WHITX//8UsZXHnXupoflg34Scke3pVg02dcCt06R3zRSx9cD2LBSP
         yllIp6OHyHQp7qZpmRxxpT/Yuy8VMGCr4tEruVcnNqq22jmAF9YeYygrtibQRDz91WR3
         1LuXhROKcD1CfDMCk3S1OcXF7DCeLd+Xud9XSKyJUHx7XysTO2PadkzQy9LfoZ52i5nL
         sdV3KvOLtHvTPapuzCCGVUw+D8vymB/LOAtv6jlqcKNIXj65X2rg0xBDKm0fQ1dkt7KQ
         iozGj9/KeLY/pOCmEkXn22y7Vr+WV/HCv91zoAYNPy5uBs3FGC+NFDieqHB0IZe19Y/w
         w0dw==
X-Forwarded-Encrypted: i=1; AKwUvBwBhudpB0J9E92R90ygt3NCGyfqcniM1Xp1MfkTr2KpZ6c0HyyCsxl4pbCLAz+0f2dxE6gId6cM9+e4qA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9ocXfqF9hOp4uF5jWxWHcMJuDNobReGodFvB7wL/VE3A4AQtLe
	yPtG2qc4kC/OTpGUrsgS9HmKIJStp5Nud8PnYnChsYAUG4kOgbWKRsD3
X-Gm-Gg: AYBFou1H2xIxvJqRKJ0EHlfK5PgPgvvLJslkLk5OkEnu9N6gB53+k68a4RsjqVAxfK3
	aO2G9tMWaMYWxpFEb/n8Lau4CQV0nGD3btLg/KLNYSDswzs9Fur4elQHkI//KetQWjPIXWASl/f
	cj/hitLQbLP6mC2qdEMPT6jckCJHxUV4CG1ONoqo94CsdoQgwUmpxvw/bieuSj+Ouv5eERbGLtG
	QetsK195azO7a5lVMsvY9YFhcXBqPBo+EpRiV7tAKcSNsGp7x/tCBJP4MLWIb1QvLzf01n0P2ke
	B/aJyxrOcNVp3BI1lYjGI9yyhylRd7+Q4kHApRbsp+wY7A3/NvAxJoyOpdCbWZGeMrKKRkYjy0A
	ZegoC3l2+pU2kXyNStdbIiCwEHbiDi39A2biD/1b/QUsNkDXAHmLkp32Opv5KsBvZMZCSEYdbED
	03lWGlN7X+d40bkxFYLAmldv0s8qkP2LuqLjYdNC+7R0ulub4zdOYzpjgOzVePSuV+J+k+x/kfI
	KUsCWa3G65lkzRCyizlRfVWHRSDOtuDgCEiyQag/w56RqsGtHvFu75vbG9wiuOBckuTkjKgcnO8
	/GBRSZGNe98V6fl9zTzynyUYUFLKV013PocbLSnqKkhp5UzQ6f3WmC5/MsxLqNH+gJvcIPo4jtI
	sDuJmqOczR1bBBTl/36mjVnELI+ZTdB/1MKGOhPMYF/nLjco95HcPfmUZZku3w8Fwe4kw+PaWjU
	VlZtYM998ASq6WMJvkVB6UJE+/HzDHCZ+HRd+focE4P1yGeCuBCyReep6qhA76yB0eHiipg1Db
X-Received: by 2002:a05:6820:221a:b0:702:778c:ec5c with SMTP id 006d021491bc7-714f29d36c6mr6837555eaf.53.1793695240569;
        Tue, 03 Nov 2026 00:40:40 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f3081097sm10520397eaf.13.2026.11.03.00.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:40:40 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 01:40:29 -0700
Subject: [PATCH v11 4/5] arm64: dts: allwinner: h616: add PWM controller
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-h616-pwm-v8-v11-4-07abb59575c3@gmail.com>
References: <20261103-h616-pwm-v8-v11-0-07abb59575c3@gmail.com>
In-Reply-To: <20261103-h616-pwm-v8-v11-0-07abb59575c3@gmail.com>
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
index c6b3a3f8359a..b6580f0c6e0f 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -293,6 +293,17 @@ watchdog: watchdog@30090a0 {
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
@@ -397,6 +408,42 @@ nand_rb1_pin: nand-rb1-pin {
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

