Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D851EA7E2
	for <linux-sunxi@lists.linux.dev>; Fri,  4 Apr 2025 11:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743767827; cv=none; b=Z3Sf4Lc6KKNnKzP7Sq1yoVgia4qak5Cla7efr9cyfNUqmhCVAUO5s3GZyEOfeWMqzmHqSShqmBTJxt+fO9GMnFcy6+kKWZRX1/RytWDEj6s+vdhuvHd1cuY5dz6ZQhIYalwIHS7Co0sXnyHF8r77gTPbgkod0dmsaprwMqFHuek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743767827; c=relaxed/simple;
	bh=ZIlp12gUJ3TOZlm4LUJ6yds6K8SvLpJOolQ3dHPZQgA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DHtrDkTQgEdxaqPp8GoYI6gOSfNrY0mnAEsRUSxTsIQIMdEezmr76yongNEfxUV/tG77AOeXCePsQfjj7pb1xU9mQVdWipbEDl2OTgYBEJSY1gGvazzJg8pt1LN+xiI6lHv3OC9FwhH2oUPvJaSHnzxEp2+kWrt7cx5bPowZCJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dm/8Pt+g; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dm/8Pt+g"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-391324ef4a0so191520f8f.2
        for <linux-sunxi@lists.linux.dev>; Fri, 04 Apr 2025 04:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743767822; x=1744372622; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V2NzIbuLVsOaJahdT641xBUsFIJNpkjAwbl7cZpldXQ=;
        b=dm/8Pt+gH32heDZg55gjO/5vXr+9lJCdLQ9d2BRfw/Bf1z14knI8yD1x+c2KdGlrjW
         39jiNaF97i7PNFE8BXWCG7M6e68Y7UIIl0Dpr6gV0eUCddmkZKevkml3/YbpPXjtlbTg
         RCV7AmxgB3bjYXNCVnfh0SEOfASbV/RZzcqMWdGmyWgvB8BBuIL7zu/+qro+KrpjqIzM
         RnJ9UcMpvW3ICLu3AW1Smfrif6BgYEaPYwBtuzDPChvVHyhLUrj5iganOhbdq5Sd4atq
         kRcp+bYWA0ZKQ5PmBzP1Jqvh8EOvK+APy/NkrcUxBHrKE2VoYs3eG3oFOboR6YVsz0Ve
         2NWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743767822; x=1744372622;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V2NzIbuLVsOaJahdT641xBUsFIJNpkjAwbl7cZpldXQ=;
        b=oUgDDgtShmdCJTbPKGBLhkJZOv4LUK+NAR2U0gtUtwosn0xZXQLY+/mcO2IvjdKi9Z
         6DP6525qmrfHvBO9+IBz3j7D2R0JJjmwANh6dWy4j9GFKiIXQxwDferetZ8+I2sZB0sJ
         B0Nd8UnKYuQrExrBL0faThnsxsSSIoVZzHkLb0p1w+v8IH8SNPNKytqguFPeHe5ntvcz
         7hgb4qg7r7Q8fH/HaObroYNQdzYrp1Lc1UYixBZbFXO9HwglKiHSX8BdMlHZjuWbs0ec
         sja9zzL3a6oFGnozfSTN2IL6YGooMdQhiQ+GFgOrxro/spvgz6J53shR3ypYvGwAFfjx
         JRtw==
X-Forwarded-Encrypted: i=1; AJvYcCVGVeST5fV/8dGJUs6rWDej2ISsbqVSY1f1rgbMz0k+jZ9D9V+MOM9OeCAPUrlpWKhjprL4ztUUMwMCOA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyUYHlYp7RRDXl3xLpxiz/RawkDJRMtP8yIJkdQK85DZHqp9ici
	jff3WuaLTljj0i1q2bqTYKakyTY0UVy53G5SypA9KaaYG+exORUl96kFCimIHeQ=
X-Gm-Gg: ASbGnctz3/WIV9t7Ah07JRk7FNo/q76nBTHsWcqxkzQ8rIxnanaNO6h88CHqH4qggmc
	jpn8eWchQvDDi6ZrQZfHRQ+O1lbmBU9nu9coW02p0sxgakZ+WAN7iyUwZsdV0KPTN/hXeOE0GWA
	HGmv7t7UEDuUGgsCpYgHY8RWJ5ceJk3lbt1V4XGbItomOWvUvNczpR1B//VszsI2dCUwQikaHxg
	4blk+cLHHBdh1AvnLo6e0k2FA2p1ejMrA54OXpFQzwYa9+ODly0Fgk4hriKUfunMEqc8yG/sY//
	7bfNReDiMJGV6/4gZfLFWyAZqEfI8CXA1B4zkr2z/uiuf78cnhayIIaKN6PWSISmiJBfVOL3yw=
	=
X-Google-Smtp-Source: AGHT+IFxuBP0nmnZWUjwXivSZyFM5R5EOm7OqMfFckNVWAgHA5LCnGmvvIDCOlE0EShLntnYXKvpnQ==
X-Received: by 2002:a05:600c:348b:b0:439:8c80:6aee with SMTP id 5b1f17b1804b1-43ecf9c2b5emr11378355e9.4.1743767821387;
        Fri, 04 Apr 2025 04:57:01 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec364cb9asm43842815e9.31.2025.04.04.04.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 04:57:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 04 Apr 2025 13:56:57 +0200
Subject: [PATCH 1/5] clk: meson: Do not enable by default during compile
 testing
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250404-kconfig-defaults-clk-v1-1-4d2df5603332@linaro.org>
References: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
In-Reply-To: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 =?utf-8?q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

Enabling the compile test should not cause automatic enabling of all
drivers.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/meson/Kconfig | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
index be2e3a5f83363b07cdcec2601acf15780ff24892..ff003dc5ab20d904c91fc34c701ba499a11d0b63 100644
--- a/drivers/clk/meson/Kconfig
+++ b/drivers/clk/meson/Kconfig
@@ -55,7 +55,7 @@ config COMMON_CLK_MESON_CPU_DYNDIV
 config COMMON_CLK_MESON8B
 	bool "Meson8 SoC Clock controller support"
 	depends on ARM
-	default y
+	default ARCH_MESON
 	select COMMON_CLK_MESON_REGMAP
 	select COMMON_CLK_MESON_CLKC_UTILS
 	select COMMON_CLK_MESON_MPLL
@@ -70,7 +70,7 @@ config COMMON_CLK_MESON8B
 config COMMON_CLK_GXBB
 	tristate "GXBB and GXL SoC clock controllers support"
 	depends on ARM64
-	default y
+	default ARCH_MESON
 	select COMMON_CLK_MESON_REGMAP
 	select COMMON_CLK_MESON_DUALDIV
 	select COMMON_CLK_MESON_VID_PLL_DIV
@@ -86,7 +86,7 @@ config COMMON_CLK_GXBB
 config COMMON_CLK_AXG
 	tristate "AXG SoC clock controllers support"
 	depends on ARM64
-	default y
+	default ARCH_MESON
 	select COMMON_CLK_MESON_REGMAP
 	select COMMON_CLK_MESON_DUALDIV
 	select COMMON_CLK_MESON_MPLL
@@ -136,7 +136,7 @@ config COMMON_CLK_A1_PERIPHERALS
 config COMMON_CLK_C3_PLL
 	tristate "Amlogic C3 PLL clock controller"
 	depends on ARM64
-	default y
+	default ARCH_MESON
 	select COMMON_CLK_MESON_REGMAP
 	select COMMON_CLK_MESON_PLL
 	select COMMON_CLK_MESON_CLKC_UTILS
@@ -149,7 +149,7 @@ config COMMON_CLK_C3_PLL
 config COMMON_CLK_C3_PERIPHERALS
 	tristate "Amlogic C3 peripherals clock controller"
 	depends on ARM64
-	default y
+	default ARCH_MESON
 	select COMMON_CLK_MESON_REGMAP
 	select COMMON_CLK_MESON_DUALDIV
 	select COMMON_CLK_MESON_CLKC_UTILS
@@ -163,7 +163,7 @@ config COMMON_CLK_C3_PERIPHERALS
 config COMMON_CLK_G12A
 	tristate "G12 and SM1 SoC clock controllers support"
 	depends on ARM64
-	default y
+	default ARCH_MESON
 	select COMMON_CLK_MESON_REGMAP
 	select COMMON_CLK_MESON_DUALDIV
 	select COMMON_CLK_MESON_MPLL
@@ -181,7 +181,7 @@ config COMMON_CLK_G12A
 config COMMON_CLK_S4_PLL
 	tristate "S4 SoC PLL clock controllers support"
 	depends on ARM64
-	default y
+	default ARCH_MESON
 	select COMMON_CLK_MESON_CLKC_UTILS
 	select COMMON_CLK_MESON_MPLL
 	select COMMON_CLK_MESON_PLL
@@ -194,7 +194,7 @@ config COMMON_CLK_S4_PLL
 config COMMON_CLK_S4_PERIPHERALS
 	tristate "S4 SoC peripherals clock controllers support"
 	depends on ARM64
-	default y
+	default ARCH_MESON
 	select COMMON_CLK_MESON_CLKC_UTILS
 	select COMMON_CLK_MESON_REGMAP
 	select COMMON_CLK_MESON_DUALDIV

-- 
2.45.2

