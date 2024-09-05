Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CA01A01B7
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Sep 2024 17:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725557846; cv=none; b=PZNLrZ2vSKZ5Y4SWLj4P70nBO0Z0+CVuE4mlR2iK3+ZX41wdsEme8VQ64HrmasezxqUmadtLs0wozex/YIKitIAbW/9sjWz66sezgog6JhAljd/MIvQGUGfD3tae08MyeEDSp/yWDBB6tKemHN/QtZwd6N/c1QH1TSrRHGpwpCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725557846; c=relaxed/simple;
	bh=RNhLy3kONeDz/+IGq0BW6Nukk5PX4HbKNZTyiChMq2M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qmUBW24HW2epGvBXvABRAc5GpatyYoTHglJ2DBXNBWyOWU3vRIH1s0QX1alrpN0K8gwunLrGgliUkmGTi6o55dzv7UILqX/DIqMYrWWKRbqohN3zPQQSt5+vr28V5ZHVvv14Dyq6+sz+U60CkuWB6Tr/05NNSQ2GReaQb6Qq4HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fk8vwuw2; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fk8vwuw2"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-374c4c6cb29so892326f8f.3
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Sep 2024 10:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725557843; x=1726162643; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oxD/2bn0T/dFXzCPoiChAlaQk6ipCE9icGUJFuoXA1Q=;
        b=fk8vwuw2orqPThALnj4ju+nMDO0+sE+Kx+cJAj9k98CObHF70JR3faSE9ejsAaz28x
         jbMVGq/huTh/t2KdWZO36Fb9wNaHdWOkfp+RR/1+xo9NHenLnFDnNW6Xm2thnkoLuvWb
         lwcvNtUF7H27sFS7qbl9eObnUIqNYatNkRvuHJenD/yCLUbQ+bruzEBa0Cshb6GPiaxf
         F8gKSqxnybi+Q06iF8TMoobYswjh3exp0TLLefZwgJQtg5wAteP98Umt5XaF21fD7lum
         y45gtVC4P6nI7FKiJQcBtHSXMSUGwboCuuTf09/HK3yLh+S+8tmXqkh0/vKTadJHGmFR
         KkDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725557843; x=1726162643;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oxD/2bn0T/dFXzCPoiChAlaQk6ipCE9icGUJFuoXA1Q=;
        b=pL0xJEJ0aWriwPIdh/7hk9Eb36/BBPhha6CSpHTYipBFGyPHwq6LEdD8mHZKzseYpO
         fnf1rQXQJjPKRU6lf2p0C6lWwWLMcL5Ddx5bT2D/S7ga1sfOkjBTIpxskjWqCKxojyqz
         9YfSVoWa6VMdVRNQHaCPyIzb+rMbTZeKiyM/PllRxaGEE6bRgZO5gcADLcpYVgAhA/8F
         QAO4wzq7MkM5VIQ+X513E8XcNObbrBbqBdZ0YHeu2gtiTo9UEKLTg5KY0RCqo618VC0Q
         2yGzhpOctuB8XGU6VJkrchjpZExaTNhuvla3vC01OyKIw8K4zzlSvDxVwRShAdF6UEKZ
         RnLw==
X-Forwarded-Encrypted: i=1; AJvYcCXBKRDlfzqQUcWXj395lwnsh4p1/zmZccoNPSQ3C06FMLF794H7Jx5qYtmGeqIXA+N6dChcQh/4h4yzCA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxX/yK+D+H+Po/eeI4yp0C4rIELnILp38dAf401VnCtLWUUfxkF
	7UZ0PayK+aus9QG3uaiFCAGNrT7DRPxS5WWijDwQIQiqiPr0uBZC
X-Google-Smtp-Source: AGHT+IEIDulTsaaq38yymlQC7bbdXx0m4PCzq23xq+gvpBO7GHB6rSksYTXnQ2o8e1Qm3lp69ntdfg==
X-Received: by 2002:adf:f608:0:b0:374:c05f:2313 with SMTP id ffacd0b85a97d-374c05f2775mr13707086f8f.45.1725557842988;
        Thu, 05 Sep 2024 10:37:22 -0700 (PDT)
Received: from cleve-worktop. (85-193-33-185.rib.o2.cz. [85.193.33.185])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42bb37f7849sm245704605e9.7.2024.09.05.10.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 10:37:22 -0700 (PDT)
From: =?utf-8?q?Kry=C5=A1tof_=C4=8Cern=C3=BD?= <cleverline1mc@gmail.com>
Date: Thu, 05 Sep 2024 19:37:10 +0200
Subject: [PATCH v3 1/2] arm64: dts: allwinner: H5: NanoPi Neo Plus2: Fix
 regulators
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240905-nanopi-neo-plus2-regfix-v3-1-1895dff59598@gmail.com>
References: <20240905-nanopi-neo-plus2-regfix-v3-0-1895dff59598@gmail.com>
In-Reply-To: <20240905-nanopi-neo-plus2-regfix-v3-0-1895dff59598@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Kry=C5=A1tof_=C4=8Cern=C3=BD?= <cleverline1mc@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725557840; l=2036;
 i=cleverline1mc@gmail.com; s=20240824; h=from:subject:message-id;
 bh=RNhLy3kONeDz/+IGq0BW6Nukk5PX4HbKNZTyiChMq2M=;
 b=mRqnuyRIbQD4SoMGj0V2V9H2g3ftmeIT1qPwpgUttP3Ep15ApEySEepSU4AJoX1x0uqG6oQ59
 NkdC329VWZdDCPkNfXmvnoDruhSysZqbd+FVqFRIPWeii4pyYYzqlqR
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

