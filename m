Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F05C408013
	for <linux-sunxi@lists.linux.dev>; Mon, 29 Jun 2026 12:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782736961; cv=none; b=JKE00ZN/pRU8e8W/VvnwQX2BFAooB52t9SOFDCIsgG2nT1G46vNKKsYvZmlwkII+kX7VYQiE8LnxmzEk55vuS5dMbXGj6S+jTCV/shZUzKicYIeXogJX3vjyNp7FG4YmS6u0b3HP62pD1BXmBGgp3CXFoaqdRyptB8Qn7uClAd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782736961; c=relaxed/simple;
	bh=mDE5aNV7J0YTDC++0PyqpQq+1LRXe/OEq5dNJJriQq0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gm9oPhrQj5S0IFKuuCRNysFe/ApeUXuPPNCPkG8PXfn0BCtL2YU/2o/LlWUWN3fxh6BlSKj8yS0drqrRnH5e/gjoWmLanvbZYukNYAGDcr49B8E/X36FLhXJH83ec2PkxqP7fML9k6SOL9Heyek8A7VTUJDzWo9DHkngrDtNI68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=DvWxht2f; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="DvWxht2f"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so27200955e9.1
        for <linux-sunxi@lists.linux.dev>; Mon, 29 Jun 2026 05:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782736959; x=1783341759; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rSh1ZBRvKf6dioysT8A/x6MNdQs15mKol/PsSCRG53E=;
        b=DvWxht2fqedmcN5yqfmcbaq0RSCSCHZoB0SSts+usRxndtq7R1ZB46vwaYB+bJoW3S
         x+OwnOeKtH9FmRDflvFdRhkXwSxPLi8bEJ77bmNuQipfmK/gGtHzTPGhKcHh4dREN9Lu
         2Gnt7AahmIWPU0K1kkfkzdVIh6lRVzOuVpBz/zVplzk2DhqXUByVtHp5Pg/Plre+8tfZ
         zikEUmdJAaolucRN3l9XMbQIdChwIn/HljaP+DLsUvubKEOGqpxHU/HyvyC8PUTRP5Pg
         n3W5QCMaGzIkWfQxXh75g2EiHSN0D5k0fL5Qa+eddlLuJ5XSLsYysZEX66XRRQ/iFISP
         Cs5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782736959; x=1783341759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rSh1ZBRvKf6dioysT8A/x6MNdQs15mKol/PsSCRG53E=;
        b=hdcubZSpBqa0WXsw9kRZJNpiq4EN8G7DXEx1kTKBo0z/Tay/6sPfZEZshmyeo6UaVe
         s6K6eqXktSWuiJCn9WjT75K2EBf/WnI0beO6Hu9kFjvN2wTGzZa8PTmhOxhc78lhnAIy
         YacCu27wL9qfRblengm1qRbq0AlN0/+jMsJWafwJQNGsc4TKZmq9gYP+h2CHDWg91lBS
         Gcb9c1MSAQtkc898kupT8RJQibDQnIDZdHrqchEvo8G1XMzj/W0+zlHDKyTto9rJWaLF
         F3v5yUQXiW89HeJI+xRVmZxlksb9VdXw8nnT2CiFrHAi1Dw8k6gN6k+wYOsC9Lz7nEiZ
         1VqA==
X-Forwarded-Encrypted: i=1; AFNElJ9fdM7WUVB0+DdNWNV88oKZyALdzcap+SDXkFd3c7u633VJjVCjL4N7kDf2fTPHW6FIYCgyK7XuPfoEbQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxgwjaPx+fkcV1YUOkLsUh6p6AZROJaV/XGSAkAZJthTzPKKdJX
	g66omB76W+yjC78rPAL3VX56F/A2V+rJV11reD1Hasmsa75gwnGv1dBG8YfYcxBJNrM=
X-Gm-Gg: AfdE7cn9AIyJHplhN77bSSN0+Sqx4u83Yo83qMBkUNj7ln3NJzCzhpBOEouVrDg7OmF
	S6v4GESt1Xev5itrn106gO48zrEy3aPkFX0hc0nKZjYpnJHdVZFYEk30qFjktheITdxaC9dFEDe
	CWPToyAvx7DsQkVzOi0AQe8Hi1K3BZwVh2mDZmTUrRzwxghOdOMT7QMKdxmZgHK7PeZdg0LsnYV
	5QOSlmcDnIO90bgA/uw+ZFs92y2ovSacaWOEfON9ZDBDySycIznkCjIba5S3oWW8ripzPn8tyEI
	xSa92/U4/fH/leCr4oXE4eh9OzLEr4HhQNpw4RUi5Nwsz4953I5pk40aatDYH0BfMPThozduqRH
	iuUwI9w91prS4q10TG2SYxHVJ93EO+xDrQKYJc4zhiXRt7P1Y5rsUXP6w6C6JarzVJJxs0jdObG
	jVGDXWkuwyHvw=
X-Received: by 2002:a05:600c:8b30:b0:492:6eff:7d02 with SMTP id 5b1f17b1804b1-493b71dad66mr10202405e9.30.1782736958743;
        Mon, 29 Jun 2026 05:42:38 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1d21:f5d5:2d3c:23a7])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4730937e18dsm14116290f8f.21.2026.06.29.05.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:42:38 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 29 Jun 2026 14:42:09 +0200
Subject: [PATCH v2 5/6] clk: sunxi-ng: sun6i-rtc: split main oscillator div
 and gate.
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-a733-rtc-v2-5-7b72112784f8@baylibre.com>
References: <20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com>
In-Reply-To: <20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2479; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=mDE5aNV7J0YTDC++0PyqpQq+1LRXe/OEq5dNJJriQq0=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqQmgwCcpAim4iGNmxcdYBHSDfCGlZjMmgEkjlG
 pEgFgGXBn+JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakJoMAAKCRDm/A8cN/La
 haOZEACnFfbvW3FhdzHAFggeUxMCHosJfDMAsVLsgX8coJCaSYo7KTr+uvuDH5zi96kgfbQFk82
 JX8sRKJemEUWdYZWWiBiqVSWYlk0LGOqL1aeqZjNYRpcHDuo+bEZSUute478X/gtGo+xF+Euqyx
 qc7ecT16wVXAGk6Ti6B14ixs+kgmoai6oyYcW7u8hhVpyfsC8+RaawD/4ng0FE5W0U5mhkAtrZU
 quu/IsG8QrFmvHaRy2b+clEQdK9t885FlCriHWlqqv6L0Sq1OLS2oyFpXmtwNpcdx3yrzPr2IIl
 +3EU7yJCxknNQh42OtSEBB+KwnCUUY/mWyQnOPihDWtxWT3Uoc3OVdJsaZdYkOL5zBrttkVmMKr
 d5E5ddcl3ChK4VuC8rjgjMhs19xua46P9haUS4YSlaXtUn3xftoXpfNwtcERxLlxVjAD37M0ti9
 ioQJ093gTZFRC7JPe6LETF2qSlneea758Jm26jQy72/2XhemfiIZUdQ1Vg9iD5zVlFvRDZ4Xv2F
 +WVGtuV6ayT1kuc/vV+VwQ8umGEzGBF5JsTxHTUjPvOxQIy5AncPF9bkWrxrG0Cilc4JNgYNZ6/
 k4f5yOMZyIOlo+C1LPERCOt0MZICSk9UBeQeyrAEqHGaL52hNAQtcQ3b2W1yVzdcy6S0YkN4Wjv
 2JBzJngCguw2AUQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On the a733 the "osc24M-32k" clock has the same gate bits as the previously
supported SoC but a different divider implementation.

Instead of a fixed 750 divider, the divider is selected based on the
rate of the oscillator. It can be seen as a simple read-only divider.

To easily replace the divider part depending the SoC, split the divider
and gate into two separate clock entities.

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

