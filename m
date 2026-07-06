Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B9F4252AD
	for <linux-sunxi@lists.linux.dev>; Mon,  6 Jul 2026 09:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330376; cv=none; b=OnJxX1PmKqVo9qeTvxWM7JzeX3paZ441LiFmSujRpyidIb11I6vx+JDVrMmwT4B2kbUwuorxoMk6QseLM07r+hxgfPwf99KESsrywjUxqa2JwjttKClqD2FuS1nr7hcduyTZgPu4KS1KAI2Ian58Erm4yFu7PMGnV0tEAgE7AHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330376; c=relaxed/simple;
	bh=rBendd4uuEhgkyP4RE0zkVRJMkAWDgIQr5V1OAvN0oA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bxy3eJImTW5zAND2FIVDHFFEYHWNExixbGUFx1gVaB7/5p5iE+uPuHGZanoGdEDeCETkzv4x88OuZJSrWdio1RXMiPXjFH6YXnBy6tKQlzBBoNy2E6vHWBB7Z49r6ieUN+RxdIXostB3G2aVT8I+Q/h8kLA0V7kEtLX9u92H/8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=NTAEbu0I; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="NTAEbu0I"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4758b2a9e2aso1690992f8f.2
        for <linux-sunxi@lists.linux.dev>; Mon, 06 Jul 2026 02:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783330365; x=1783935165; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9owqjjgV0H2CtePOueZPc6abek2AjkJLNAZcj3bC1qU=;
        b=NTAEbu0I88n0Pjuoq8SA2IdF8K6Jg+4JsnnihzzIWgi7HAT6M4zCkjLtJBJOpCdIKN
         15wUko2u7h+JuJW2ZuqYfiJWjKzMGcEQNJmbqqZtGUBp2ok/kW407P26iHPLdp6BnKwh
         QwdAnO77lhs4+s9ILNvdh8nfGWocTlHH/URxwOgri0NcLs8XtsuVmlYrdGZhT4m5e4VO
         Bf0mQDn69NPK3DVWduJYE9Ynfzs+Rt6XwxH201IJ39tQ9QLDIxpr6g9zxdz22DKkHurG
         fsSim1gHNza1EJPgw/OBwW7+SPS53hX6yB0ue8DBL4fCCPf00SR237XukJSW72Nq5g8u
         jymg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330365; x=1783935165;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9owqjjgV0H2CtePOueZPc6abek2AjkJLNAZcj3bC1qU=;
        b=Snkk8aKDYE0WNeJI4w4MlyTdHt3caurVUwB3j+/2C/2gEpOb1k67xMEUpkoEEGWJHe
         LYM+S5GUlYTc6hWiaLH/4UWhb6+158Sdt9cNsUh6T2YcnbXoo91a0EX3i4jhY6ldr8M/
         xdlc3YnokdgzsbK/cpCH/vpzx5CorjkNr7U39r99yqcFvF+bXSPQanZrqZ6wRzkW6F+6
         H96abSWKjJAoLyXmanNl0P4t7llZo2KEKe1IGs0dQlIOsqiBN2EZCbjNpqGeix1gaF6o
         phQI9kWpz1zLvPk8mE9z2/YYYaezya86T3PLsKfZ8Leb1b1iBZkOoB7M1UMe57LMs0T9
         mavg==
X-Forwarded-Encrypted: i=1; AHgh+RrhLoNkwSMXcHbB22tp3NNiN64Gt7wHfF9FPJXDd8Fm2J9+8irQ46/xuDA6jGHE5J6D0USlxW2WtzH1dg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyh04g21mmMKMpPke+JsAcRQuE8EURLFAcNxq3q2G51alGuKNrQ
	pN0RYpxk6wy4B9rc/b1KyoUaOtnUHh8sV1cstOYL94XqWwdkcx+fJflvIiPOZbLOo9g=
X-Gm-Gg: AfdE7ckeiv1HrvQP2PAC0atRyT70YwvgTNE1P7Fe6BAcOkBSJiN/9yY3PJm0DeXOkoG
	scS0lY87/NSCiTOQtoNOu4fz8C9S4SZ4yB2LBIlzqQrFN6M8Wd1z460nBv1Cj0zIKlGbvMPYCAS
	PdIX7sISuJXUauGPssP1QhmgU1nar/I02LCu7uW7d4Q1ECVxRpUQiOHTpB/hUypZcJpHcvPY8x/
	U/W3sUaaUnjRhzgtCdFZxW/0HcSvvjIt4QJkuDmAUZJpD/3RwFEyt9yKx5AZpsBJimQNSe3AXdH
	56PMQ9OtVb1qCIf6VBLW6CMQZjoINHk5zApWYDWDjeweiWoF9SuM2fy2D5/kd6RkDTbTl+vfd/l
	RSuN7ZXaMTuGh6zibbIdXNhNDuBdKMSaK5mtyUQmzcXJoIBugXzNosbJdddMQcUfUykBGLWeu8O
	3ZLs8ExYY+uFU=
X-Received: by 2002:a5d:5849:0:b0:47b:69a5:7263 with SMTP id ffacd0b85a97d-47b69a573dfmr9254906f8f.5.1783330365342;
        Mon, 06 Jul 2026 02:32:45 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1495:8c97:96f4:dff8])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47a9e4d83bdsm23661288f8f.13.2026.07.06.02.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:32:44 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 06 Jul 2026 11:32:17 +0200
Subject: [PATCH v4 9/9] clk: sunxi-ng: sun6i-rtc: add a733 support
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-a733-rtc-v4-9-f330728db3d3@baylibre.com>
References: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
In-Reply-To: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5987; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=rBendd4uuEhgkyP4RE0zkVRJMkAWDgIQr5V1OAvN0oA=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqS3Ynn47pumsEX0UV9EbWmou0XZTJh6Gx0sej3
 bEXMXj48giJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakt2JwAKCRDm/A8cN/La
 hbJuD/9QQ/F/99Cf3KupflAYPk1jey3tzzrofcnCl/hF4pb6PB7BUqKs+BdeGrf6o0Wto8aVcb/
 fu1HDNDwe1awevbgyx4JvK7EhbsDPRWZMlXzwx6P5lbjVPJnbtqmpb2X8oOLMRGlfjmCpVajlxq
 5U6NQbkqUT3xqfzEY1wlcm/tfnageqOvkKCZsfD/6rMTI4DGwAqXG4cMmkAQ7MBWYkKRnuy9m3W
 vrPG2Tnmp9tK8ILEJsDiJH8o+0d3Zyq8HCXzgLt6jrx+ltIJeRDm1cnsvIhwag7cYqPJOPwtNgl
 eGW+52PAmGvjrX3o08dBNu1+LMoOlhWdB5Nm854YlCUbbhkxoz6WFix+A43o7SLHeOqqlGuCm4/
 F2P9/7lqvcNhUG+zlpZg2fa/JaiPKGtpnPNJ6HWeAxQd8FrJS1ObdHiBFZlxjSpo40qwdHcb9nY
 E8ORZ3Y1OiDuF5yiqQz89rjI+1e65aSDwzg5Oxurprl/zmvG09xmeBPGqiBiPu++gCZVVF6d+30
 c/u5zJOF1hqysswfOqArQJFuDXMTMsLdRJFKcpENWPUuGgpBD3cn8SmDW64X0zABHhzOhq5RCs+
 cKIk5bfCF7E7TYH97YBHvSkR63nLqU4RTu44eTx9u/DYb+2dK6oWKYCGNYP6H+NME0A3YIgSnV1
 3dbt6hiOlyMyy7g==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Add support for the sun60i a733 CCU RTC.

Compared to the a523, this SoC has a different input oscillator divider
which auto-detects the oscillator rate and select a divider to provide
a fixed 32768Hz clock. It also provides several phy reference clocks
with dedicated clock gates.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c | 73 ++++++++++++++++++++++++++++++++++--
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.h |  2 +-
 2 files changed, 71 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
index 25dd87e78eb7..6b71bbd80255 100644
--- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
+++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
@@ -44,9 +44,13 @@
 #define DCXO_CTRL_REG			0x160
 #define DCXO_CTRL_CLK16M_RC_EN		BIT(0)
 
+#define DCXO_GATING_REG			0x16c
+
 struct sun6i_rtc_match_data {
 	bool				have_ext_osc32k		: 1;
 	bool				have_iosc_calibration	: 1;
+	bool				have_dcxo_status	: 1;
+	bool				have_phy_ref_gates	: 1;
 	bool				rtc_32k_single_parent	: 1;
 	const struct clk_parent_data	*osc32k_fanout_parents;
 	u8				osc32k_fanout_nparents;
@@ -213,7 +217,12 @@ static struct ccu_mux osc32k_clk = {
 	},
 };
 
-/* This falls back to the global name for fwnodes without a named reference. */
+/*
+ * This falls back to the global name for fwnodes without a named reference.
+ * NOTE: osc24M name might be misleading the oscillator could also be a 26MHz
+ * or a 19.2MHz one starting with the a733. The original name is kept anyway
+ * in case anything is relying on it.
+ */
 static const struct clk_parent_data osc24M[] = {
 	{ .fw_name = "hosc", .name = "osc24M" }
 };
@@ -227,8 +236,28 @@ static struct clk_fixed_factor osc24M_32k_div_clk = {
 					    0),
 };
 
-static SUNXI_CCU_GATE_HW(osc24M_32k_clk, "osc24M-32k", &osc24M_32k_div_clk.hw,
-			 LOSC_OUT_GATING_REG, BIT(16), 0);
+static struct clk_div_table osc24M_32k_div_a733_table[] = {
+	{ .val = 0, .div = 732 },
+	{ .val = 1, .div = 586 },
+	{ .val = 2, .div = 793 },
+	{ .val = 3, .div = 732 },
+	{ /* Sentinel */ },
+};
+
+static struct ccu_div osc24M_32k_div_a733_clk = {
+	.enable = BIT(1),
+	.div	= _SUNXI_CCU_DIV_TABLE(14, 2, osc24M_32k_div_a733_table),
+	.common	= {
+		.reg		= DCXO_CTRL_REG,
+		.hw.init	= CLK_HW_INIT_PARENTS_DATA("osc24M-32k-div",
+							   osc24M,
+							   &ccu_rodiv_ops,
+							   0),
+	},
+};
+
+static SUNXI_CCU_GATE(osc24M_32k_clk, "osc24M-32k", "osc24M-32k-div",
+		      LOSC_OUT_GATING_REG, BIT(16), 0);
 
 static const struct clk_hw *rtc_32k_parents[] = {
 	&osc32k_clk.common.hw,
@@ -267,6 +296,15 @@ static struct ccu_mux osc32k_fanout_clk = {
 	},
 };
 
+static SUNXI_CCU_GATE_FW(hosc_serdes1_clk, "hosc-serdes1", "hosc",
+		      DCXO_GATING_REG, BIT(5), 0);
+static SUNXI_CCU_GATE_FW(hosc_serdes0_clk, "hosc-serdes0", "hosc",
+		      DCXO_GATING_REG, BIT(4), 0);
+static SUNXI_CCU_GATE_FW(hosc_hdmi_clk, "hosc-hdmi", "hosc",
+		      DCXO_GATING_REG, BIT(1), 0);
+static SUNXI_CCU_GATE_FW(hosc_ufs_clk, "hosc-ufs", "hosc",
+		      DCXO_GATING_REG, BIT(0), 0);
+
 static struct ccu_common *sun6i_rtc_ccu_clks[] = {
 	&iosc_clk,
 	&iosc_32k_clk,
@@ -275,6 +313,11 @@ static struct ccu_common *sun6i_rtc_ccu_clks[] = {
 	&osc24M_32k_clk.common,
 	&rtc_32k_clk.common,
 	&osc32k_fanout_clk.common,
+	&osc24M_32k_div_a733_clk.common,
+	&hosc_serdes1_clk.common,
+	&hosc_serdes0_clk.common,
+	&hosc_hdmi_clk.common,
+	&hosc_ufs_clk.common,
 };
 
 static struct clk_hw_onecell_data sun6i_rtc_ccu_hw_clks = {
@@ -288,6 +331,10 @@ static struct clk_hw_onecell_data sun6i_rtc_ccu_hw_clks = {
 		[CLK_OSC24M_32K]	= &osc24M_32k_clk.common.hw,
 		[CLK_RTC_32K]		= &rtc_32k_clk.common.hw,
 		[CLK_OSC24M_32K_DIV]	= &osc24M_32k_div_clk.hw,
+		[CLK_HOSC_UFS]		= &hosc_ufs_clk.common.hw,
+		[CLK_HOSC_HDMI]		= &hosc_hdmi_clk.common.hw,
+		[CLK_HOSC_SERDES0]	= &hosc_serdes0_clk.common.hw,
+		[CLK_HOSC_SERDES1]	= &hosc_serdes1_clk.common.hw,
 	},
 };
 
@@ -330,6 +377,15 @@ static const struct sun6i_rtc_match_data sun55i_a523_rtc_ccu_data = {
 	.osc32k_fanout_nparents	= ARRAY_SIZE(sun50i_r329_osc32k_fanout_parents),
 };
 
+static const struct sun6i_rtc_match_data sun60i_a733_rtc_ccu_data = {
+	.have_ext_osc32k	= true,
+	.have_iosc_calibration	= true,
+	.have_dcxo_status	= true,
+	.have_phy_ref_gates	= true,
+	.osc32k_fanout_parents	= sun50i_r329_osc32k_fanout_parents,
+	.osc32k_fanout_nparents	= ARRAY_SIZE(sun50i_r329_osc32k_fanout_parents),
+};
+
 static const struct of_device_id sun6i_rtc_ccu_match[] = {
 	{
 		.compatible	= "allwinner,sun50i-h616-rtc",
@@ -343,6 +399,10 @@ static const struct of_device_id sun6i_rtc_ccu_match[] = {
 		.compatible	= "allwinner,sun55i-a523-rtc",
 		.data		= &sun55i_a523_rtc_ccu_data,
 	},
+	{
+		.compatible	= "allwinner,sun60i-a733-rtc",
+		.data		= &sun60i_a733_rtc_ccu_data,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, sun6i_rtc_ccu_match);
@@ -375,6 +435,13 @@ int sun6i_rtc_ccu_probe(struct device *dev, void __iomem *reg)
 	osc32k_fanout_init_data.parent_data = data->osc32k_fanout_parents;
 	osc32k_fanout_init_data.num_parents = data->osc32k_fanout_nparents;
 
+	if (data->have_dcxo_status)
+		sun6i_rtc_ccu_hw_clks.hws[CLK_OSC24M_32K_DIV] =
+			&osc24M_32k_div_a733_clk.common.hw;
+
+	if (!data->have_phy_ref_gates)
+		sun6i_rtc_ccu_hw_clks.num = CLK_OSC24M_32K_DIV + 1;
+
 	return devm_sunxi_ccu_probe(dev, reg, &sun6i_rtc_ccu_desc);
 }
 
diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.h b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.h
index ab7b92b47f59..4f4f4cb00f1d 100644
--- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.h
+++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.h
@@ -11,6 +11,6 @@
 #define CLK_RTC_32K		6
 #define CLK_OSC24M_32K_DIV	7
 
-#define CLK_NUMBER		(CLK_OSC24M_32K_DIV + 1)
+#define CLK_NUMBER		(CLK_HOSC_SERDES1 + 1)
 
 #endif /* _CCU_SUN6I_RTC_H */

-- 
2.47.3

