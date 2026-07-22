Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3802E369D6E
	for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 14:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784731724; cv=none; b=DCfZy7Wet7EnZC8tEUBmhB+qE9MQB2hFZoPKshWwLD+AxhGh/08zUW04bub9ssrY1v/zZWOKsKoSUj8+hq3RYFjWDFZwz1CjZ02cif8FmWrjF0FBxPCRUQP/l6ma6pPi84u/zMZOqM74Wmf3UEmRhT4N7LXKsSomWfB11ls4uWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784731724; c=relaxed/simple;
	bh=JBCNsbbmpvOyQAHYAiNtZ0xGeCHrftQkcKapQT6A/2Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iOVYVpZs7tp9lOr59df0GeF78mfDzsvFh4Cq7VM5qS3Xhvs6xDYVqpNLYLlnbTVZ3QQz9CSs5t8lUgpz78vzu+LBuF0QFfhGYCBgi/MH1BZ+3tZGigMGc/XdPTW6dWQYTzyxXmFrkFLZ5LC/NG2KSh58egfgBJeK7okzrQC0mGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=cWfLAIzI; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="cWfLAIzI"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49558ce01afso30911555e9.1
        for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 07:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784731719; x=1785336519; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZjvDxGaz/+Ym5ockvfd8pkGSRzvwp3SWGNBrqT7Ifz0=;
        b=cWfLAIzIutCSGZvmWbZOC/ggQcjOWqfsWA3Q39UxFy8oeBfGkMmEAnD0yVNyfO2ZFc
         DDOQZ82+NgVcUOwv9/A8+eW9WPs32LHx6wyE/1DU23citFKWb06kfof2DSTpn22hnyz/
         bE7H3DKkjaSbFu+nMk6+6Q1F/Zzut7wfYDK9/qxR+xMISMOQ+T2MCVtSG3k5ET0PfXUE
         XFDaG+i8wXfpfLzAlre4rCHUDi5GwiPfJV7VZB+F9AKAOjUle3U6sVGoKu2U0y+e8KBQ
         qt+0e2lz01lI5W4TDWagtxKG4w1cX8ZMJQNInrQrQODvs52v8Dekt8PghdjBcJbYb1il
         R/6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784731719; x=1785336519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZjvDxGaz/+Ym5ockvfd8pkGSRzvwp3SWGNBrqT7Ifz0=;
        b=ckOosQ2fTtm2md7tsZRRb+A2aqu5SJHyd2mbhUH8ufgumh6LRuGUOWX0yaNBRu6PxU
         v6VFAPxqyEZsDq5Gmpz6F4+cNDwOGJ6PKGFwUdGAyUQ4ShF465vH5XCJa0mkLPBgRYY3
         RwsTgy0fHXtXIK2d+Ul0ibbPAYdPrg8Dew1AwUfPkjhkWVaWl0jR/HtztQy/BDT2fC/9
         vk+TW8S1Vdy0xfMqKReZi1yIdOSmSfY0DNe1Kd497QBAFlehnSaS1AawsE0VDwwcW/mA
         e87u0PMWwkwgM47humpgIWOtAQ4Et1gSVNqzo/5x6dVxROgKQZ1l57mbwbPBfCU7e/1c
         XRGg==
X-Forwarded-Encrypted: i=1; AHgh+RqrrZK3KTx9DYZCtBlpUH87or/+UAleJpPAZgd/bJapdxXzswMqsYKZtFPaqogCOvcGvWJpDW1qINArmA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/GMaKZgDi9Af6fgSOdlqQjnb5UvRhHzkshWmL8jVAbgt6KnbL
	JOxwrtkS6bcr0gepFWjZzvPOqS9GJI+grmA/J42mCcmWF4yUnrWOQxMvDPXiS+TKRgk=
X-Gm-Gg: AR+sD124X0keYtOwVX9n2wyT/ZnZTCZEOW3gbUqcWAlAh+6RHeVdSCyHOZK2WxeuBIr
	nZ5cmUjLHg0PyvOdJcyClkuGON3RWl4v0AT2eakr2S0clSqgEop8G8ShH55E9fIWwHKjRbjZTsY
	/GY1lA96GUTJ11w4uTkVgdQ9SoeFL2EJFcj0uu0r5Ote9LoIgRqIkcLPYFNrnlc6iZcUIZQkiY3
	UQAuMnh8rxeN96HWDLl3ElYhXRWL6sXNO9T/WXuQ1uqbcrlUswZoCJzS+Wu32KoW3FtAGgM1H7I
	QG+y/8XjOYohA6rRTtNa2IDse75tZnL5DZP3vblLihYJEG34xj+WFjmmPm//cU+yzYBYraNPI5T
	qxyaQtRb7BH72eC7Yy/feHVx9nxYI8PWjbnBhMunVmNTlc8PCccqc3adBVSCGQvwscsx4Hq+4Ki
	AT
X-Received: by 2002:a05:600c:21da:b0:495:3e08:ad24 with SMTP id 5b1f17b1804b1-4954a51b524mr185452815e9.33.1784731719082;
        Wed, 22 Jul 2026 07:48:39 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:a589:14b5:ba97:3626])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-495653c8760sm139823645e9.14.2026.07.22.07.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 07:48:38 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 22 Jul 2026 16:48:21 +0200
Subject: [PATCH v6 3/4] clk: sunxi-ng: sun6i-rtc: split main oscillator div
 and gate
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-a733-rtc-v6-3-631cca28cc9a@baylibre.com>
References: <20260722-a733-rtc-v6-0-631cca28cc9a@baylibre.com>
In-Reply-To: <20260722-a733-rtc-v6-0-631cca28cc9a@baylibre.com>
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
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqYNg8H3wMJRC9rFCS2UiRPc6rFEZssU9BeWOM0
 IVN3Kqk3IiJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCamDYPAAKCRDm/A8cN/La
 hc8MEACv28/V5ccSfgbQoFHihys/2ZxbPthoGPKW5mVRQE+g/Oz7L+SPyZBpuZsgvMxiFpLUVvA
 CMHDqN+3rNai6f57DbVEELC4zx/u8jRB/ZDoZGgGjMhxTdFO/+39KxpLcInS1n0/GBFkHAIMMkQ
 9tFoo//qXYoacnTNxLHTLjJFoBa/cWgZEEwBNjHIWJMcHsc44QIDzsKQgN7CRprENs5KmmZOR1f
 JumgVe1k3xqIx+7pUpwA7oGi3Ymem4bw5zu1GJxb79mx4FRqYPlL24E9tbIbmneKe0luhQcRDvX
 1kv3GBIbMrOmq0zqvRfU2eAqlGtUQQ9AwEzmV9DbQ0Xn0HVlQMx7L1MbL/UQaQ2vDjoQdHU59s5
 YpSj8Hp7HN70Wxg3Fw7TuvO3oz9pjNkUCovCEVrKVDCJO9G04cicBnu6uYfnxMdOxKE0qQC7gnU
 1lsHznk3OGrrxG53Mf+1RRTTANJROZmFPa9khK5gJS4MHaEbaw5koNWbVqwvTzri0cYFUx3lkOJ
 2fjEsIKt5TELlf1UJSijMcDTZWxdb5xoM23tOtNfHcSYmRYeS6/nePsghZsDNWakso8H5e3G8KE
 uqaFMLAGUbZOStYwp+kEz+oBYtn3TfZl+lzv2oggN/1xZylqxWUMsuj7yX9TpXLSu/g+nmNSN5r
 qc+du/pM9mHomng==
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

