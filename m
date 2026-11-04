Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793820310;
	b=sWqYApiNX8Hs2dzvgUVqpcsXePsjwWAEPhaht2fbfBk3irRp1cx5eT9LTu1K1w8eNk9N
	 AeYnScnnDiL7kYzZXGQUSHGhMnbEel14Wn4Q64Rju28gij+1FdfKuFZpjp5yhkErFKweW
	 x5IjC03qGC1xRA15vmmJ4URNW3gzz60iRIEoPijT3NFGFwTo3rP8L31MpBuW4Ytah7RJJ
	 mecHi3PibeKhQFNcw7JT7MDIVsPIPMAWN8yY0qIE5X4L7t0ezLeKMMsBnJqUA+TaYUxVk
	 Fy1GppmJXkAEsLBMxSmATs0gQwt6j9ofGdOUdTXL2p18wyAf9rklocfIlYHZaQjeyLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793820310;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=eGQwnQ2neaJQ1jlowOf5tkGQBWxndnEwh30xNQGSIkQ=;
	b=Cp0m42p/jwxmTMqWBQik2mN1ZLr8PrJRYxwGhIi4Us2cyOJUFO9Uz39BPP7JbeLbMkbx
	 3SCkMivHwIkeGbjqUChflZJy3NesvTsw7Z/HzlX833uKO+e3pITCeaXxrcZbCGjs3xuhR
	 y14ocQ9FAFfTPLuFUdg0C47Qb88qnEdWCCJ3IMUDBdDbE7fbFyTuhwG30BZLUwupJ9toK
	 dREMWLKMMCUV5J3TNFstmurE+6socRUGnOSOZmvyVPqaA0rBgaHBkb3FzHUd/2jfp6y1o
	 XoX++M1soWW1pGXH5ys0vw/p8AYWdtOFPlXa4RdA2mNKtsOshwfa3DOv6e5hiKfn5zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yzFlKYJJ;
	arc=none smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433A6607F2B3
	for <linux-sunxi@lists.linux.dev>; Wed,  4 Nov 2026 19:25:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 433A6607F2B3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yzFlKYJJ
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-70b875f6f13so1005636eaf.0
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Nov 2026 11:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793820309; x=1794425109; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eGQwnQ2neaJQ1jlowOf5tkGQBWxndnEwh30xNQGSIkQ=;
        b=yzFlKYJJfTXVsWZznZ1cuh7GeO/22fTAVRujpFfgz0pCLH6cKeSWunGA3KS+JZfgzx
         zMmtvlKUqfkVzWCLAuDC6jay/E6B2SVtdS1LacsgCMKDSTF8/tDGAy8AbthHYtGKwoeK
         RNgXBw0xkLeT6RLci+yANIVHM43mW6W7K//iH5y1W/nwcFtUgDu8mI3TbUoxf4yvAmxZ
         MxM1O+mPqI3vw7heFPyonJ66uRocdVhBh6aVvu4bjryqB4RqVVX6lYfssAzN8OietHz8
         UODzL21vVemKeELrCzZUmTSYDhTrqRZVSxDdkuwSq4R0olFLD/M1Qz/ejZmJKuT024xD
         OCrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793820309; x=1794425109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eGQwnQ2neaJQ1jlowOf5tkGQBWxndnEwh30xNQGSIkQ=;
        b=ImWD0x5NpmYXZByLFPuxX7FbP375r6Zk0L2xFU4+gp55XhlJUoje3VoLtR9MpKgX+Q
         0yUixJPhYO0p63UYQwGzYlvr1Jf2G/LcObVQLy5fphf8tVSwWJWU9l/zRkYB3A+mNA47
         miuzaZg4rqko9oy14Q67c0Bqy65XTmYhRxlSYtB3zvF9qxne5fdeQUOHPqieSFrLRxda
         9Ll/Et2Dx2QdkuVlgVnSLqzKNxtTV9suXiKypB5KsLKwOszsDPkyCqpSdkle4O0suU2f
         4g4eLVkUafFDpmHKbcc0SIibhJZjT3cxQS8Qssnc3xNdh7BrxcpzC9c/9S0lCFvScXs1
         Xg0g==
X-Forwarded-Encrypted: i=1; AKwUvBwYjWrbMobkJvgL+FbEQMOqZLFDt6kOoofdImZorrdM8AQb5avDYwDZ8XotgD01TjhSXoGfukSE3WSGNg==@lists.linux.dev
X-Gm-Message-State: APuU4Z8441gyRu2mHnGYTkypfMhp//t7IkSaYBnn/jYECvvlIkScgxLl
	NF1ZFnj2sjbFW7hMzMoW6MgAtrPechV4BXV+0ZdZuq2P93eh2ptqa5kG
X-Gm-Gg: AYBFou3DUy9UPhbAnVHc1ZZKTY/rjjDeLOnT577uT+Q6A2E88xuV3ccGC6zKAOGM5bb
	YStoDabZADy30zGscf0bUcegLj8yELuflJysluZzHX7G1rW4fYNvm+2DEl/eFBUs2O2Qda/e/sP
	H4YtlJslYu5jWAOi+F+YfIzzN/nhn8SdGg5CaITItsJkn3GPMUGHba0RGA6IKXtCN0A/LkSIVG2
	m9Pg/+RU4sUJbLwyJNLdyG+sHFgaokzEOUWmXhweV5oQEnXkTxoZVVYtyMji0VVqBH684nBpTQd
	Hm/eoQDPJxGv+VqR3Pup+sdpvOL1BgnfR9LdwGOzP6YtzOYf+GD+kE5kjAFBh9ucHxsJE2LjJqG
	wIkbVZvTjgQqyVWEYAzfXzQ2ud+rm0PDrMl/R8FmT5VkhcYrcOGN3BS+L7FLSSpp4xLZL+QfgH4
	bojjEq92LMasIOe4wut3sBKS/jF+jtbhAL077MdEa5byvsHHZ+gwDol4Sc4/cxFXuRjqAtaUC/7
	uKNjscktPJ6rt1g5A3ALazK3x8jW2a+hAVrWYRCWLpN8m4r4Jx8F1gLYWNWKWlHvudVbUNRGnuV
	l/T44AKucz3gT/Zlz3p6hGaaJbCBsNTJGs8ML7cDuZmiVUw3CDAABj31NKPKqMgzGmDdXet1VPJ
	gQuE6D1g45iF8dSQJ1xz2WdRRdjpstDqroKxUD1fxyOmSFB7wlXjeqMPzpchgDdr4kABVolnyDB
	bbPX1KsrWSouAJRxuZkUdyVJ7xZmIkT6NRsLQPr740EGCbVQePcVHO
X-Received: by 2002:a05:6808:2218:b0:52b:7641:33a6 with SMTP id 5614622812f47-5640deea502mr12233182b6e.14.1793820309111;
        Wed, 04 Nov 2026 11:25:09 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9c7bbcesm2328723b6e.1.2026.11.04.11.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:25:08 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 04 Nov 2026 12:24:54 -0700
Subject: [PATCH v12 4/5] arm64: dts: allwinner: h616: add PWM controller
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
Message-Id: <20261104-h616-pwm-v8-v12-4-8ed39b0dba69@gmail.com>
References: <20261104-h616-pwm-v8-v12-0-8ed39b0dba69@gmail.com>
In-Reply-To: <20261104-h616-pwm-v8-v12-0-8ed39b0dba69@gmail.com>
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

