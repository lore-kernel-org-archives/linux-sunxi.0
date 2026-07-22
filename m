Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C007A403AEC
	for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 23:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784763383; cv=none; b=hSQDuT/stjWjJno+7QTdcsVnIVnRu59Zv/ysUmG8yJdjoYWrWfk5dmScSNlq/kY8A2DbE9y8/heAATvnhsTGpGX2oFZTd/rkOv6TXw1P7fq6Ujw6azRBTkRLWxscjUlhxRmbruf9e+B1h5Uc5n2P3B5kLZUF+5WcYFYba6iTlBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784763383; c=relaxed/simple;
	bh=1/CkHD0oxgnHzUCphQPj9uX6mQV8xPw5f6Jx+XznVi0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UeXuFk/Aozqy4DxX4J0Qn8y2eWG7kcYwKxnLWTqaQX6uLvxk+lQn6X58lanlm2SB1BgZtEMpKOSvgMrlTv+YWL3+HmGV68VgMoWnefKEvvx3ifxBr2L28EAx2YMa0l7wF3hIpavHymAc2h8jDsi5oTZnxXLy4A43CjIk9y6yCGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oRvUcY0e; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oRvUcY0e"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-80c5cb9a888so458647b3.3
        for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 16:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784763381; x=1785368181; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gSow7P/U4ty7TVa1wStrr2GU4gsF6dil0NdrrF14oGU=;
        b=oRvUcY0eGRTayYBCXMX3ZH0lMkTmvXRCAy1hZhHao+vyW0rfplWSVw7cPttvfVQVB3
         CJ/WOsIMJKAJ18qMWHKKBBdsk52cUSKGUiHTNErqkiGJx9UycEnonWIN80tJWzCPuTUx
         VAjDf6BwjeB7wcd08aITWH6+G2aFIm1KlraYoXHRDynL3wJgJRnIPQEHNNVK9LTitmR8
         WnTJbbduzJ5nqZQFQmvC2SNO2ykEL4+xbQObm4Zok2pZNEQb9eORhewCCIOqIqlaUsBw
         3axudIJ2jpXqmksOZTEx6qTzJqSec+AjtIFBo/W4kc/7A/PFxthiU0W8LPVmu39xfKjF
         ZHbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784763381; x=1785368181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gSow7P/U4ty7TVa1wStrr2GU4gsF6dil0NdrrF14oGU=;
        b=NIFXiYpKkwryiBlxPQ8lB1SlU1mcqp/MewjTDKBCu+zWUREs6vbWn/r/EN/7GK7D87
         +DMs+BmxqIQwUf7CuOqEwqIShb6Motrtt9yYQ46XiovWZjQqAx4HaKkeOO4yeU15l/EJ
         c/mQAe+pOjq3sEPMzs14THTGyAaekkwwhd/2NXVWE8zJgr7R6/rvYlRM+sS0qepwP08T
         Z6bZJRHOQaHW6Y13pukqfMWGGwoLcmxa3GJVv1PQyffRkNG1iwoV0h4Uft6VS1ouvfH0
         nNaKtPVS6E5iNPWDJ2ff5sHm+16+kdAaslb/S9Z20FfK/DGql4GK/rhZszyuTK7BBYv1
         7Tww==
X-Forwarded-Encrypted: i=1; AHgh+RpFuWLLPAGsMi+xTKQO9OqqibTSzJfw7yvIHySQenOn5E5C/yOtRBMVgHdqMpY+MqLIuxhsQfgylP4Mag==@lists.linux.dev
X-Gm-Message-State: AOJu0YzmD/1WEfuxpiItMjJRRMbQz34yFRDwJw2oWXOfzMAEzveCbCA9
	+t1nz40RTatEbIhe+5OVxYHj+tofws9JNj30N1P0Ufo4GZMe+519qpa7
X-Gm-Gg: AR+sD12fKfkIXt6BUDDJh57WNTj3frWEAsz7ua113UMN2sGK180uHzOKph4WNUmIHdr
	494973h3eksDzwTwhGzthcw5CZnq7kn1c/G2RDwRUEIw4RezPeqTvgJnDRkQFH8H8yzc3BQIjcE
	01HAlHTVNynwg9DIT69JUSFIEZSXCvuPjJiAHTX2mToqmMJwNKW955JKLL7ZF7LlsMIKp23eBFu
	rMb3En//x2K1Tx1sYT+2//WdWBeAShPdWOqLQo5/UpXGOwyAlumbLDCE9ZiHwQ/lmckw4FVDsk1
	ljuhlZ1y/mxcZlPQIXoOVQxhKkkiCNffTxbV5iFn0JYr8qwB4iE+mDc57zIEbrcNvPQnLduwCTL
	Jw5SGXjfZxWg3YfM94y9/F+tkzKJlR3kNYUyjB3lA+crHHb7mSA5v6pYBJX3k38nwMD0WXXzD7q
	8YVzZZRf5imWE385oZiL3m+rEVIWQIAhfGvPjW
X-Received: by 2002:a05:690c:d07:b0:80c:90ed:c79f with SMTP id 00721157ae682-81f4c30b5e3mr2230927b3.52.1784763380753;
        Wed, 22 Jul 2026 16:36:20 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:4392:41cd:1ce2:e391])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f33c627c9sm20937027b3.19.2026.07.22.16.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 16:36:20 -0700 (PDT)
From: Justin Suess <utilityemal77@gmail.com>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v3 4/4] arm64: dts: allwinner: a523: enable IR on the Avaota A1
Date: Wed, 22 Jul 2026 19:36:04 -0400
Message-ID: <20260722233604.3001063-5-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260722233604.3001063-1-utilityemal77@gmail.com>
References: <20260722233604.3001063-1-utilityemal77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andre Przywara <andre.przywara@arm.com>

The Avaota A1 board has an IR receiver chip on the PCB (next to the
Ethernet jacks), wired to the PI8 pin on the SoC.

Add the pin description to the PIO DT node, and enable the CIR receiver
in the main power domain.

Tested on the board with evtest and some random TV remote control.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi          | 7 +++++++
 arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts | 6 ++++++
 2 files changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index c2de662140ce..219fd76a4710 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -155,6 +155,13 @@ i2s2_pi_pins: i2s2-pi-pins {
 				bias-disable;
 			};
 
+			/omit-if-no-ref/
+			ir_rx_pin: ir-rx-pin {
+				pins = "PI8";
+				allwinner,pinmux = <3>;
+				function = "cir_rx";
+			};
+
 			/omit-if-no-ref/
 			ledc_ph_pin: ledc-ph-pin {
 				pins = "PH19";
diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
index 474354fbfcec..994f1e4f0ce7 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
@@ -100,6 +100,12 @@ &gpu {
 	status = "okay";
 };
 
+&ir {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ir_rx_pin>;
+	status = "okay";
+};
+
 &ledc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&ledc_ph_pin>;
-- 
2.54.0

