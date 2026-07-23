Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649244322E5
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Jul 2026 09:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784799614; cv=none; b=oZSG47UKAyiJtl7a5VXk4ScUZ8SPR1bNYMYSRO4GVvblz5cQp+sVzOcy66XuhjtyI8+nEFJ3b0kHOsjRIRENI7MPNzQ9OsE/WApnAZ+omp0ZswoeBiarJrQb0DrSUtKZ4Gi8r3Zb3i/BnWfYOjfSeK56UUJMZS9DzIrkPGXXpWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784799614; c=relaxed/simple;
	bh=JBCNsbbmpvOyQAHYAiNtZ0xGeCHrftQkcKapQT6A/2Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zr6fs9XxRJNiCDrQQcQBM4SNr8ITA23C3LSGXclpswYIEJfCdjvcPUJ+oJ0SXPKWytq08Ln2Kf5NXlUZ3ZIXpHRhWblH3KFWtrUq/BIUX/E2+g+IJZ00wE6YfITOx5N3iIg8LG6REEqiO3ZM/OXmNkr4DGkkC6NRzbL7zD50zMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=GWd1LNf4; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="GWd1LNf4"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49548e01d02so2393485e9.0
        for <linux-sunxi@lists.linux.dev>; Thu, 23 Jul 2026 02:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784799610; x=1785404410; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZjvDxGaz/+Ym5ockvfd8pkGSRzvwp3SWGNBrqT7Ifz0=;
        b=GWd1LNf4HBU7ocSWaEkeeMu/8CrPB4+mI4KZGrGfE17AJx5yCtRhHOJWHVBD+3ynB9
         dK1+e/kKLJKWfmyI1xKQfMlnIxHjtWwLDKT0njtAwGqXDYq6sAno7u7OAoPj3pTmEtZ3
         73IEI/ENbNTs1PFtK1usiYor4Oatsi1X4Sc4gUKBzgj9h9t/TGdzRJsfPVEY0T1UhGwk
         fvRMXO/+7zwxAJIkgwfYCBlHs5J7EgGu/i4NjFCotYl/yANmIxZdfCZOQh2GzlAiJPM0
         2aBaz0cRcDy1+wToDH9j7qTevis5dMFyTAHVnhFlHQpZoogtNEoOCCeulF0w6QHgUk0R
         1Irw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784799610; x=1785404410;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZjvDxGaz/+Ym5ockvfd8pkGSRzvwp3SWGNBrqT7Ifz0=;
        b=RHZbfLxMT+ptOP50IajJ/3eLZWdB6e8MUVpPol6eex3kfbNy4KZejp4slEbTe74v/n
         rWFn+z8k9l0EgY/UooCFMm6IKn0Mn1HTd4KC7GUOG36VGf6WKvuUXI/l/Ev1Q8C0ECLo
         I4d2yVqRdb8TlNYccXn6cMN8USsVjZZt/u+0muNyiYx38nzMohHGx6AsCUwu9QFn4ipx
         mxudRuZ4k0rrHJ21NLvTYGxjIV3h4qKmW6memxkdp/dQ3BnxiH3F2rhBzTLJX54Vmv9Q
         FzJasdcJ2CJeKFyX1z4Y7h3S0gn2AI5frmr9pyFnB1AaC9tQ4F+tHTX6T93aSie0GZZE
         q50w==
X-Forwarded-Encrypted: i=1; AHgh+Ro+ECEukIMqEitid/L06NBjKW+FtjguVc2itcEbQoTTiEOGTxDOt+U3kROKF05Sts9rxdUFKLO32kBzkw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxR00KO6ihSyY4Vluj3WzwMCsO8Ot4gAVhPIp8n+XInlMWYBGB6
	ZXe7RJ92tzepZN1cdJEIzWr3QOORqCvGFnKK/jBWX1wZPwANmepMBZfK3svJ8Phjwpg=
X-Gm-Gg: AR+sD13HrC408Pw/BvikXNdLJ+veCCX56GX/oOE8d7xT1i029qarIW5+IJww2qaGfp3
	vCNfVCC4M9jAU4ZkVONnPkGkTKMmQS47vAcf+JVnSx5aHqLXNKLawrBb4FY7ZJwBlp+/Q7xc8QG
	ZLqWpS4mH6sgIjf7ax/ZQt69U/Hpa9Kvt2mdYA2k7ILVqvJ9ibAEFP9unCLtfo4blQ+6x3zD6eV
	puC3Tfvj7Ze9Kr59h+7xRgbwajgEyus9+AHEXc+SEI+au/Cm9lzZDZjLRj3RPyR0cef+zLfomn/
	h3lMAzx/BBirIReNDBbhgVD+vqimYmoUNONz8lheAFn3zbQYxcBDwOKnmyF0yISYLxZCeDx/m7Y
	teOcSAbVAQwefqWI4Z2RGfFOF6kRJqWKV9OCzSE3vN82dPW8xdhBOJD+1zH+mKccYipL08xxnjs
	I++q6z5dqkad4=
X-Received: by 2002:a05:600c:4ecd:b0:493:c77c:108a with SMTP id 5b1f17b1804b1-49573d218camr23593405e9.36.1784799610474;
        Thu, 23 Jul 2026 02:40:10 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:3274:dbb5:2710:802b])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f85c6f076sm14217894f8f.34.2026.07.23.02.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 02:40:10 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 23 Jul 2026 11:39:53 +0200
Subject: [PATCH v7 3/4] clk: sunxi-ng: sun6i-rtc: split main oscillator div
 and gate
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-a733-rtc-v7-3-8fd68aab94ae@baylibre.com>
References: <20260723-a733-rtc-v7-0-8fd68aab94ae@baylibre.com>
In-Reply-To: <20260723-a733-rtc-v7-0-8fd68aab94ae@baylibre.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2641; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=JBCNsbbmpvOyQAHYAiNtZ0xGeCHrftQkcKapQT6A/2Y=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqYeFvjq1VgqkrnRX4lgbpVG1CsAXk0OXhBpCAY
 2cCxet3nn2JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCamHhbwAKCRDm/A8cN/La
 hf+4D/9zXNDTBscW+MTjTDh5NosjbTzIiSUcS/dzhnCjmVmQ22U54ZbigzSwc6euLyNEtodPs1C
 /83GyQHXZt+edY9PQwiZPYblQf+aVW1yKbeYf6FFTVVge5OGW3uMbf9OafZ444Ub/xyM7n9nGTL
 XW7lMm7/LwIzHt4uT1zqEwBFeGSWbtpq42X5f5XSAWzj0D/Sfg/UNEzJt+Rs+um4Vl4r6c13Ch2
 jgSCFGwtao3MN98b2BVBehZnTVyzXa3tKeJ74cHMVt1fIqo42wGGN4MW6hIyGnpcKhRZVBUTPpj
 nImEEQ/hlmQBjgiMcaKdGtY/IN8KqnMZxLGR807JujAmNNxr2G6VLFHBf69hKJMuRSFapjHy3f+
 6g8EfwUeZcwlSHhe5v9kw7q4+t1Zn9dFcxPktxBOmr8jtipsQ+Foc6AxBT5/zYW3c/9kz7rr7hT
 /MHiWwdeMGFzyCU1iVvoPB8GrWdMpoL6V89Iin13MOxCvLchXPPD2prKYFPK6dxhZggyxOWl16M
 87kPE9H1TtPTKfcVmm+e2FKcEVn4s/R8VC+ea3KAS9sOw8scj8hQZU7GuSCX+FTvMUZstkPhCzJ
 9N08h3ySwaNa7DjKju7KfJTrOTYdqNgr4IKfsaevnZUUtEgvNDH5hQDqy7wzqNj2ezZl7zu5VEQ
 YE3e07IaksL7KFA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On the a733 the "osc24M-32k" clock has the same gate bits as the previously
supported SoC but a different divider implementation.

Instead of a fixed 750 divider, the divider is selected based on the
rate of the oscillator. It can be seen as a simple read-only divider.

On the A733 the gate and the divider are on different register which is
not supported by sunxi combined clocks. These element will be split on the
A733. Split them for the older SoC as well to keep on sharing the gate
definition.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c | 20 +++++++++++---------
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.h |  3 ++-
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
index b24c8b196e66..25dd87e78eb7 100644
--- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
+++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
@@ -218,17 +218,18 @@ static const struct clk_parent_data osc24M[] = {
 	{ .fw_name = "hosc", .name = "osc24M" }
 };
 
-static struct ccu_gate osc24M_32k_clk = {
-	.enable	= BIT(16),
-	.common	= {
-		.reg		= LOSC_OUT_GATING_REG,
-		.prediv		= 750,
-		.features	= CCU_FEATURE_ALL_PREDIV,
-		.hw.init	= CLK_HW_INIT_PARENTS_DATA("osc24M-32k", osc24M,
-							   &ccu_gate_ops, 0),
-	},
+static struct clk_fixed_factor osc24M_32k_div_clk = {
+	.mult = 1,
+	.div = 750,
+	.hw.init = CLK_HW_INIT_PARENTS_DATA("osc24M-32k-div",
+					    osc24M,
+					    &clk_fixed_factor_ops,
+					    0),
 };
 
+static SUNXI_CCU_GATE_HW(osc24M_32k_clk, "osc24M-32k", &osc24M_32k_div_clk.hw,
+			 LOSC_OUT_GATING_REG, BIT(16), 0);
+
 static const struct clk_hw *rtc_32k_parents[] = {
 	&osc32k_clk.common.hw,
 	&osc24M_32k_clk.common.hw
@@ -286,6 +287,7 @@ static struct clk_hw_onecell_data sun6i_rtc_ccu_hw_clks = {
 		[CLK_EXT_OSC32K_GATE]	= &ext_osc32k_gate_clk.common.hw,
 		[CLK_OSC24M_32K]	= &osc24M_32k_clk.common.hw,
 		[CLK_RTC_32K]		= &rtc_32k_clk.common.hw,
+		[CLK_OSC24M_32K_DIV]	= &osc24M_32k_div_clk.hw,
 	},
 };
 
diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.h b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.h
index 9ae821fc2599..ab7b92b47f59 100644
--- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.h
+++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.h
@@ -9,7 +9,8 @@
 #define CLK_EXT_OSC32K_GATE	4
 #define CLK_OSC24M_32K		5
 #define CLK_RTC_32K		6
+#define CLK_OSC24M_32K_DIV	7
 
-#define CLK_NUMBER		(CLK_RTC_32K + 1)
+#define CLK_NUMBER		(CLK_OSC24M_32K_DIV + 1)
 
 #endif /* _CCU_SUN6I_RTC_H */

-- 
2.47.3

