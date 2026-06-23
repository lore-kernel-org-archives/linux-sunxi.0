Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDCD3ACF14
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Jun 2026 20:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782247732; cv=none; b=PcahhF6z+UoEX/nq1GXidSnAVBcpWmezd1FXX/psmu8Iyq+bJbG2p0GDwCgHOHhKmiv6iukAxYR9J3DwRR1W4bW5EINe2Q75kGfGeZDMymsoZvrschbviqbWcBwCeMKgUcpbSLAPz7ijQO7yIWdRFoLPyzmNDh9yCWRFV5yB4r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782247732; c=relaxed/simple;
	bh=kDr2xBEtgmjzuHMhUmmo8nMGXVZVg0h5DcPuluFIFns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XPAP8NzThQkETtFf84ek/dLttkTJKSr4anYuPDAqgoFtmQOJDwTIyL9bWltBW1678QupQOZ278zZD6HVRAHGGjG855GGnfNdFHRaUhJUCNCGCGo2o29xq5ytHia4VIqmAeSejBfQcjyO1D+IJP32ZGX9GDTdKFCxNpEdzA5Wd9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YfyYjo8x; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YfyYjo8x"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-45ef189aa1cso245321f8f.0
        for <linux-sunxi@lists.linux.dev>; Tue, 23 Jun 2026 13:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782247723; x=1782852523; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3VmlgmQI7H4S8qo2yEQ+YQUSbvnieo421LNuRZ/c1mQ=;
        b=YfyYjo8xWfDRVDMeuhi6S5sF2qX6YwWpuDfOiX1VDVFC/r7T9XO9Dre58fHKHNOFSU
         itjTMLfTiJmKv4l9v/rZyGxHcHvjpIeFiYLKSVGKtbHmj8aao2cmwf6j63UeKV8g/yax
         +yqIcc1r5mAG6hg/mLZmJP4aeo1uQuvkVfTPu2+XaKYJibQ0c5L7N1pw92ztYscrA8ZS
         B38Key6bmwPhvkppz5wGSb52wzG+vUPo985FzyA2yLrZItJbU6gFtsoMlUfdS03zrrhV
         f2o9dkD5UXExGoexFfv8noWfiPRtb4fr6/7tF4H4opHLiC7PP79KuKaP2jYjayn1zlJ/
         M1hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782247723; x=1782852523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3VmlgmQI7H4S8qo2yEQ+YQUSbvnieo421LNuRZ/c1mQ=;
        b=eZy9iajKbSoNvDAeG4PgBTi6t0m7BWNZMaHH2IFOuLvE3Llhixct9KMCkhiWWSqo19
         Xj1tc+vcpXWPEH7MECD2Bj87JEy4rjoP+GnjaSl7t6+lBP30L2UOsBNTTKCCSQV1Ga0E
         5ka2mN+1FgoLzVtbtNT6gXS3qCv2TD1i0BFXhQn6bGE8QwNuS5mnGO4c2iKvFQn+a1gh
         S3p8nSB2gj3Vtv7EIvOOAzC22xPh1jkUuRblySHxfpsre0C6IdVK3ZJ9QqMeMIvW58lA
         rc7nK+eSYdeh5tAhZlLLHE2USizYLWFY+pd/dPN4KA3eJXOiJ3/+Mx5bmOS8LCkwu/El
         K+0g==
X-Forwarded-Encrypted: i=1; AHgh+Rqp5znMmhDwETAtgGr4odCfvJby/ooBSHchT+Yth89lP/a1D4BInB/yYPL7wHyoIhcOeTnDK3UflDJHnw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzWGhEQX/Q5SElBR+L5MebOYzicKlet3l0JxjpRTPSJibQuV3hZ
	HPos10Udu2DhB0khDcLFJcGOlese5bxAqf82A0lSpiqrmzA301VeYbTT
X-Gm-Gg: AfdE7cnszNsPsdDRZ8PpRCNLEivGVHZl+fe++mZ9IQVrWoth6XF4ywcIhSGnLvWzfLC
	/ZckLraBLzNgAnDaRuSwKcwQ3gDKSJCsF2vFax/k7O2e86wD/WoYaBrW6+9yNB6CffrsYEsdg0y
	IdYmM8vNSQwm+QihV1J5mxA5785b3hQ0yATGDOwT1Bva3/Dn3XYdTaZBlbs/4uXMlrpiwkYhRWd
	IoeRnNa/xKfxyEqipnll4NHwY+RHMlEzSoyMmOuj2qIGKtDpN1jVCEYYdcPi1rcpKDOK0VJwC79
	6W5m/kdP8zXsiGoYI/KQoOjhSlJPCqMJ/PUC3DVhFjy9msyyNAbRr+sq88dYlZTcoWHBjBo1o2k
	mLeGkaiL2YfoR+zIyGZmUGgBkgIqrE2WRLItUUFE+d1+W1qeQfRfM7O2hthxMh82jhz5Hpz75r0
	Asb/KueQsuzUYWOs+71rBBgJxJ08OActjO+v8YQifL8g==
X-Received: by 2002:a05:6000:298f:20b0:45e:ea46:ce13 with SMTP id ffacd0b85a97d-46c0990089bmr554253f8f.10.1782247722883;
        Tue, 23 Jun 2026 13:48:42 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1e840f80sm351996f8f.6.2026.06.23.13.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 13:48:42 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans de Goede <hansg@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	=?UTF-8?q?J=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Eric Biggers <ebiggers@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Luca Weiss <luca@lucaweiss.eu>,
	Sven Peter <sven@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH v5 5/6] arm64: dts: allwinner: a100: Add LRADC node
Date: Tue, 23 Jun 2026 22:48:17 +0200
Message-ID: <20260623204824.691832-6-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260623204824.691832-1-alexander.sverdlin@gmail.com>
References: <20260623204824.691832-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A100/A133 SoCs feature a Low Rate ADC (LRADC) for Key application.

Specs:
- Power supply voltage: 1.8 V
- Reference voltage: 1.35 V
- Interrupt support
- Support Hold Key and General Key
- Support normal, continue and single work mode
- 6-bits resolution, sample rate up to 2 kHz
- Voltage input range between 0 and 1.35 V

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v5:
- reflowed "compatible" property of lradc node
v4:
- added allwinner,sun50i-a100-lradc compatible
v3:
- new patch

 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
index b3fb1e0ee796..ba6020989ce9 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
@@ -466,6 +466,16 @@ ths: thermal-sensor@5070400 {
 			#thermal-sensor-cells = <1>;
 		};
 
+		lradc: lradc@5070800 {
+			compatible = "allwinner,sun50i-a100-lradc",
+				     "allwinner,sun50i-r329-lradc";
+			reg = <0x05070800 0x400>;
+			interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_LRADC>;
+			resets = <&ccu RST_BUS_LRADC>;
+			status = "disabled";
+		};
+
 		usb_otg: usb@5100000 {
 			compatible = "allwinner,sun50i-a100-musb",
 				     "allwinner,sun8i-a33-musb";
-- 
2.54.0

