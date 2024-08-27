Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0501D3637
	for <linux-sunxi@lists.linux.dev>; Tue, 27 Aug 2024 21:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724792488; cv=none; b=H989MlgN46mVqVkXUn9J+qAG4fcdg2CNU9dLabyb3UysfLzzB+rSBsiKJ7kfkuNCAYVVADzW+OXPCD40rOgZof1YR+Qp9Y66q0ICg05EV8yk2UkNOZyJrY8GXTZ9y0SE7Nvdlcx4GYvjckoRWx5Vqg2UcIVol3KauQi8MGXDB+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724792488; c=relaxed/simple;
	bh=RNhLy3kONeDz/+IGq0BW6Nukk5PX4HbKNZTyiChMq2M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u6etgfwtW0tg+83uLwhUebdasvWG605YU9eH0VW4q7IPUOGXmqhpPsB9shX7U+3XfplriEYuO+vsIUJWdj7MU2YWTa6A+cOnBxOqVnh7AG9Cj7YCO25eO1QNPormUdg4YUMax1O1ED2TB5XBHIxR/aYKs+Ek/qVpN6nEqGYQTg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W7+7XChs; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W7+7XChs"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f4f2868783so55431481fa.2
        for <linux-sunxi@lists.linux.dev>; Tue, 27 Aug 2024 14:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724792483; x=1725397283; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oxD/2bn0T/dFXzCPoiChAlaQk6ipCE9icGUJFuoXA1Q=;
        b=W7+7XChs5OWCGuORpkiLU7zW/aBS5u12PbPkPPgQLc3rVLU3jb34RfmwYRRqA+Z+Hq
         3mGqyemlGJS8+QaGCb7MnnVg1S2DtM+gBfCBPraIet7EVjLngYxZb0nEPj/xr3OgT8kv
         w9HXuB1ZMcLtF4Fqxw/SXhm/rLDziwiP1UFBxG2e+jyDMSPj3yQltDW0+FaT+Gzm27m3
         KvadzCCheVKUjnpsgLfhF5ntZfWkAAWu7s20ERLyy2t8SnAUk7izbTfecpx5kNCM6bI9
         w1T/6bN2uDcxSKpLl8QdOhzgIIsMGdFA79SnDZCaJrEwps0Ecx5xf/KTUtaiNjM9wnjF
         intQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724792483; x=1725397283;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oxD/2bn0T/dFXzCPoiChAlaQk6ipCE9icGUJFuoXA1Q=;
        b=XMa+3kcBuFNFQdW2ZYcRA9QMCYaSS5YqYqHxkn1vlJuhYYFXUKyiSiMXLD0ELjhAOI
         susqSKQr4aWM1/rGGUugS3ZH5TiuEbWjBUCVCayI3kmBCpvdV6MKgR9rg1w6OrEO6g8T
         CBysjtuTcj4lwiRZLyZmP9yavmm1XDtluzH0Cb3V5fEDJqRHbFrhBpnh/cph7qfsS1Bz
         4NqEHSub/LKv0pd353GeD2D+DPbhik27snkHmWPfJUFpFYpfwzEkqvDLjGBk6RB8UwNi
         HuiZLbbbLruJhNoeDXgWJUcWCvjggi7YqlYpyMoPtuFjz/Rd+j9muBFojxY2VwkZQ5Mm
         m0NQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyZ2WtS0bU8jy7SMLcMNXpErH70qrXlOCvQ174wHdz7+uXrkU63rzQMpx5dBXDPVXxcLiHowDwSYn5iw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzJRvfQTGj6cJwKr4CWobqiODOib4hc60P3YC0eT+OeGHIH4IA3
	rXVJMGH58mXUnD6DzmzhpVSl6GmvQITPvIJtRTwkNvh9mLXKU4ZI
X-Google-Smtp-Source: AGHT+IHMIJqq+qMc5SFSWqS83HaQQxSJIoBoIh0xhJc6PI4T9xwpLUgf2R1siupu5MnfzMii4vuZpQ==
X-Received: by 2002:a2e:612:0:b0:2f3:ad82:53fd with SMTP id 38308e7fff4ca-2f514a44f48mr23852671fa.28.1724792482231;
        Tue, 27 Aug 2024 14:01:22 -0700 (PDT)
Received: from cleve-worktop. (85-193-33-82.rib.o2.cz. [85.193.33.82])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5c0bb1c3114sm1405835a12.13.2024.08.27.14.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 14:01:21 -0700 (PDT)
From: =?utf-8?q?Kry=C5=A1tof_=C4=8Cern=C3=BD?= <cleverline1mc@gmail.com>
Date: Tue, 27 Aug 2024 23:00:43 +0200
Subject: [PATCH v2 1/3] Fix NanoPi NEO Plus2 regulators
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240827-nanopi-neo-plus2-regfix-v2-1-497684ec82c7@gmail.com>
References: <20240827-nanopi-neo-plus2-regfix-v2-0-497684ec82c7@gmail.com>
In-Reply-To: <20240827-nanopi-neo-plus2-regfix-v2-0-497684ec82c7@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Kry=C5=A1tof_=C4=8Cern=C3=BD?= <cleverline1mc@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724792480; l=2036;
 i=cleverline1mc@gmail.com; s=20240824; h=from:subject:message-id;
 bh=RNhLy3kONeDz/+IGq0BW6Nukk5PX4HbKNZTyiChMq2M=;
 b=9/Mx2+cAHE81RhNqFvprgXDsszsk21dvPoYTZw5zCCYnSpD3rhc7njBnEaHii6djEqcV1725u
 5hpQHzHHVJxARzZQUiinsjRclqW3BCgVK6jlV19RzVEPptPlcYZu1vJ
X-Developer-Key: i=cleverline1mc@gmail.com; a=ed25519;
 pk=CQifx5FUgTQKAoj5VCYrwYHi235AkXQ5yT1P6gkaBxM=

Added the main board 5 V supply regulator,
a 2.5 V supply regulator for GMAC PHY IO and correct vin-supply elements.

Signed-off-by: Kryštof Černý <cleverline1mc@gmail.com>
---
 .../dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts   | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts
index b69032c44557..dee4cd82636b 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts
@@ -45,16 +45,40 @@ reg_gmac_3v3: gmac-3v3 {
 		startup-delay-us = <100000>;
 		enable-active-high;
 		gpio = <&pio 3 6 GPIO_ACTIVE_HIGH>;
+		vin-supply = <&reg_vcc3v3>;
+	};
+
+	reg_gmac_2v5: gmac-2v5 {
+		/* 2V5 supply for GMAC PHY IO */
+		compatible = "regulator-fixed";
+		regulator-name = "gmac-2v5";
+		regulator-min-microvolt = <2500000>;
+		regulator-max-microvolt = <2500000>;
+		regulator-always-on;
+		vin-supply = <&reg_vcc3v3>;
+	};
+
+	reg_vcc5v: regulator-vcc5v {
+		/* board 5V supply from micro USB or pin headers */
+		compatible = "regulator-fixed";
+		regulator-name = "vcc-5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
 	};
 
 	reg_vcc3v3: vcc3v3 {
+		/* board 3V3 supply by SY8089A */
 		compatible = "regulator-fixed";
 		regulator-name = "vcc3v3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		vin-supply = <&reg_vcc5v>;
 	};
 
 	vdd_cpux: gpio-regulator {
+		/* cpu voltage regulator MP2143DJ */
 		compatible = "regulator-gpio";
 		regulator-name = "vdd-cpux";
 		regulator-type = "voltage";
@@ -66,6 +90,7 @@ vdd_cpux: gpio-regulator {
 		gpios = <&r_pio 0 6 GPIO_ACTIVE_HIGH>;
 		gpios-states = <0x1>;
 		states = <1100000 0>, <1300000 1>;
+		vin-supply = <&reg_vcc5v>;
 	};
 
 	wifi_pwrseq: pwrseq {

-- 
2.39.2

