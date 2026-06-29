Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFA940683F
	for <linux-sunxi@lists.linux.dev>; Mon, 29 Jun 2026 12:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782736955; cv=none; b=S+g+8Kn5nTEY8lJrA7hR+ZzB9S8x5IBsGsGblpVw9bhds6bMMGj1ivBMLWx4QoKrPzxKOHwokvJQ+ClZmQ8x5DcJEk4zYTPv0/jw4fDEFQqRysZ25vVExTjzdMRZ0RDzVeWOHmEaZF+664DXV4u5oBKOUHBwB8PF1J5DZn7d5Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782736955; c=relaxed/simple;
	bh=QIDVb4v67kXTxypoR7T1A+2qrv5ugJGiyI5f/4IznIg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OrD9efCkQx5wsNibJG8JuVWkz9dmeXxOjD9FsIs1rvGu0e91eSZKrO0HrQSkt+SRnVZjaBBp0X6lxGTQvE4ICfnfGDauEpgvuNHKfRoIIzzdAip8NrMHAY32jNMAKRRuI3Ojlb6Os2jJFodJt5NW4iGxMntxl75tkuFjnKqlj8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=fsiBFoQg; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="fsiBFoQg"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493a440bc10so10350065e9.1
        for <linux-sunxi@lists.linux.dev>; Mon, 29 Jun 2026 05:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782736952; x=1783341752; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p9gMufAEHeq0Shwigbm5Xg4KyFFoCIavO1i9vrLQZfU=;
        b=fsiBFoQgExG4DRk0p6DCgiHj/8KrdIQVqEp1bmU1mSLIK/vfHWbvEQ+mREqEAqsG8I
         4A0bQk5q9uX+pc7sdDHSQQNqEP/OR1VWzjVsFfuOH123fRZoVT/3+7TwlFy/kD0h3t+n
         VfS6JgQrM/gQ5swTa4DjEVa0DW2FH0vnotLi6VkiyLvD5Zr83zoGq7GiWjcC7Ij4U/6/
         nmQQ7dhYLzCfgdYAH8WQZ460HBRyUL43wbk8xhq4v0uiHXdHYJoNoCKcnDK7DieVV1jV
         aL5TXSx0IhHrILR4LVNZOHX5XUyWPjZws1bDp+zotm4/eDz8USjR9R4Sx0xOI4mkoBMw
         /1Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782736952; x=1783341752;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p9gMufAEHeq0Shwigbm5Xg4KyFFoCIavO1i9vrLQZfU=;
        b=KRxDNCd5rRFs6Ie0Ci+7UzeTVaie33V3zOUizrd//dGpgzvTHa0hAHT5ZlCz9NEK4N
         Ic3JwtEtxpOTMNUb5EWJdshl7G1YTbwSSqRD3nT9eb3NmlJGhwS0eJIOem99ITmcWDuT
         ILzqrX13N5oo+zCZcYvy1fA6p8wlnwinfpnQvnHFY7aUrvfsBfi+ecwZ3U5FtPPhn7os
         2XQldFKR5MN/oV2x3+Es38eWC9rBMxMDUlvEDtJqjIuzAFqwmdeJvjHxuuh0WuGime2A
         9mDjpAt8lCAPEC7YCFItJK+m2xFymibNYdKfgixAvci/6Qz73LDJo4BpSLVMupgrxp2V
         gHfQ==
X-Forwarded-Encrypted: i=1; AFNElJ+dWyLRfRkkDSg6lDAEBkgB7G9Es4aV823r1y6IXCfwaMqgggxMOzo8hN0f4s8cwWfpB3MnoAg5vAbMrA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwpLCWnGlR+0Wa3JC+oIWFMcZwSAVnaTBYuaWJeDmnGg9mODkFA
	MFiLPY9qBu7XuAA84v6Sydee4U293I4xy0GPVhUREcf1oXjfJDGhUy90G8r3iJxKpL0=
X-Gm-Gg: AfdE7clc0aGj62XoFLwMz5PNnjitLt45PjS+Loe3WxlOomwZ5Q/gexf2WlJd4u6PRbd
	a4bTkpgCoH3yyDdEokSNWBkwVhF29tKCG8mDqqU2eeLq5Oxxb+OnPXbjSzrwIJfkR3sIUxtprWT
	K6nA9wfpq4/8A6W+xgMCuEdPE65LXrb0kSHTIVf3ztUa9c6RWsyArONiwzhdPpJ49fJOKpGyk+i
	v5EwNWE3C/fOzNZpKjxhhUo2uFcViuW+qpB7KN7QUO2oGumPbKb/zZbm/5gvVYUmq7ASESTmTu8
	RkWg1BulyVqt43F+Vc93hbzjype25S7fE3KMFQ9fkBYjltKSb9xQ9pDmci4AgBEONm6/ksoOusq
	9TVKs7dnlZ+bl2rto+8PR7sFmb7nKAmVtW7mbIBCGNISqqyEKDYKCqlwA9+S5C+6qsY146Vv8o4
	Vy17CIKM4mFqQ=
X-Received: by 2002:a05:600c:8117:b0:493:a607:f3b8 with SMTP id 5b1f17b1804b1-493b71413demr11373165e9.0.1782736952553;
        Mon, 29 Jun 2026 05:42:32 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1d21:f5d5:2d3c:23a7])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4726b76e6f8sm19182406f8f.13.2026.06.29.05.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:42:32 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 29 Jun 2026 14:42:06 +0200
Subject: [PATCH v2 2/6] clk: sunxi-ng: sun6i-rtc: clean up DT usage
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-a733-rtc-v2-2-7b72112784f8@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2634; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=QIDVb4v67kXTxypoR7T1A+2qrv5ugJGiyI5f/4IznIg=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqQmgu5DnB+eudiTNdZyR8LEcTDWwt/TL8OLgi8
 mOLm0C8spKJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakJoLgAKCRDm/A8cN/La
 hX1QD/95lLPuPyszhXE8d/DJws2q5hAdSAN/+TLFua8a1fFg/xdl1HEmX5SP5l1C7lgaka8FqIm
 rMRKHh0oeizypSTZFQfWkyqPsR8pSx3LiOiKOXwNykN+bmJ4oQqIYKd9LQjKyiFMSUxSmmUbGMH
 hGqFxT6yVW1I76xgw5WCS8tCzdSmePBXggO3hUvLqmE4DU+V/DEokJdKNwmD4zNfxoefthIRnOh
 T9bzIFPN2EiYH1D8oXvkF+GFLqbH6Sl6zpNPLKkzc7HE4fFxE5EY24G1u3VaE0nUlcLn5vEH5PI
 6TrdXRzss5NYcXu6w8m4OnZoUzzSWe6fPy74ExMOrIKH8vUXKsbt632rhR38x7JpO4av+CVwxFv
 XC3sb94OTpYo4I2r5k1uZZz80CEy1BxxcnOSgiDpwWW7dNzsYwivpa8U1v4LrTjX8k5xFILIIDQ
 tjHCt0iDk9qctrHojzZZqsVQdgHiJMY1UerL/4TTdz8NAFah87tu4+TCs3utPCJ3ZRjqAZgAncd
 8iPsOkHBMvKawDAxy82FyLWptvch17SXKekO88Tly3x6sMxR516cMKY04ti/Xm0zJWO+Fyd9cUU
 LG+hzHdrg22dHqqfGNZ4+3ee8nNSvIpsdv1jXwZTeN4oqSvpOsjLKdBNN6Ukri5WQbGGTzKH35F
 WdjsUrDbyv+7IxQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

With sun6i-rtc compatible devices, the "ext-osc32k" clock input
is optional for the devices that support this input (r329 and onward).

Probably preparing for older SoC support, the driver does something funny
when parsing DT. It check if "ext-osc32k" is present in the clock-names and
if it is not, it uses the first clock as "ext-osc32k". This clock will
actually be the rtc bus clock so what the driver does is wrong.

At the moment, the driver does not support the older SoCs that would have
an external 32k clock provided on index #0 so just remove this quirk.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c | 23 +++--------------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
index f6bfeba009e8..0f528bfaed00 100644
--- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
+++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
@@ -191,10 +191,8 @@ static struct ccu_common iosc_32k_clk = {
 					 CLK_GET_RATE_NOCACHE),
 };
 
-static const struct clk_hw *ext_osc32k[] = { NULL }; /* updated during probe */
-
-static SUNXI_CCU_GATE_HWS(ext_osc32k_gate_clk, "ext-osc32k-gate",
-			  ext_osc32k, 0x0, BIT(4), 0);
+static SUNXI_CCU_GATE_FW(ext_osc32k_gate_clk, "ext-osc32k-gate",
+			  "ext-osc32k", 0x0, BIT(4), 0);
 
 static const struct clk_hw *osc32k_parents[] = {
 	&iosc_32k_clk.hw,
@@ -352,7 +350,6 @@ MODULE_DEVICE_TABLE(of, sun6i_rtc_ccu_match);
 int sun6i_rtc_ccu_probe(struct device *dev, void __iomem *reg)
 {
 	const struct sun6i_rtc_match_data *data;
-	struct clk *ext_osc32k_clk = NULL;
 	const struct of_device_id *match;
 
 	/* This driver is only used for newer variants of the hardware. */
@@ -363,21 +360,7 @@ int sun6i_rtc_ccu_probe(struct device *dev, void __iomem *reg)
 	data = match->data;
 	have_iosc_calibration = data->have_iosc_calibration;
 
-	if (data->have_ext_osc32k) {
-		const char *fw_name;
-
-		/* ext-osc32k was the only input clock in the old binding. */
-		fw_name = of_property_present(dev->of_node, "clock-names")
-			? "ext-osc32k" : NULL;
-		ext_osc32k_clk = devm_clk_get_optional(dev, fw_name);
-		if (IS_ERR(ext_osc32k_clk))
-			return PTR_ERR(ext_osc32k_clk);
-	}
-
-	if (ext_osc32k_clk) {
-		/* Link ext-osc32k-gate to its parent. */
-		*ext_osc32k = __clk_get_hw(ext_osc32k_clk);
-	} else {
+	if (!data->have_ext_osc32k) {
 		/* ext-osc32k-gate is an orphan, so do not register it. */
 		sun6i_rtc_ccu_hw_clks.hws[CLK_EXT_OSC32K_GATE] = NULL;
 		osc32k_init_data.num_parents = 1;

-- 
2.47.3

