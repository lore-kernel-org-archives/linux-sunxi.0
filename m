Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCC9420E73
	for <linux-sunxi@lists.linux.dev>; Thu,  2 Jul 2026 08:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782979864; cv=none; b=DTTSNX0GUkkNS8ci8Xr9s2URZXLZklmXnqydk13EnF2k+b2VdswBNZyI3pU50FqAzqp8cZ4gcMCsi7YbanEZL4nYTo4LgOBPMRW86DvptOkK/syNyKEtw3W+m3oXY+JE1Aljmyqra9FyWyytPkgp+/Cxgq8KwKXDA+E7Sd9hVy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782979864; c=relaxed/simple;
	bh=rBendd4uuEhgkyP4RE0zkVRJMkAWDgIQr5V1OAvN0oA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fgqOFpKWbtMd1ibGYvfuA1Rju7dQMU4P7G2t9I0dBHltbJPNly5XwVqAHR4p1+MSLyAtUA84gTmAV/cMGH3srW6SAoZ5nWQW3t6oO0Zl0PROzqsonV7eMnbk7kUtsHbz5g3ZD2QwI7Cy/gzmfCB47w2I8LCAAqLSo+VLd2cp1Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=KX7deSTe; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="KX7deSTe"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493c2b3dc8bso8993225e9.2
        for <linux-sunxi@lists.linux.dev>; Thu, 02 Jul 2026 01:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782979861; x=1783584661; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9owqjjgV0H2CtePOueZPc6abek2AjkJLNAZcj3bC1qU=;
        b=KX7deSTex/+TXLRRLeK8mbWKzCBUNqQrydQRhZqhfoWCeE22LvSfhWAuw+Fuptc63h
         PkU0pqrlqV3bbuRxBRV2wX8PDZ3LqLuuQ0H7sfxMLezRK6weomvEELICQvVhEFD4kyX7
         SRFhwq3mK+QVWUi3zilzVYwqfR1yOQh+bBj/m+0AWl8GXs8qv6qXyNXFaDQD/zzKuexk
         10j5A3IzGvOMgzSvIftYoTZG0wDT0iuDMlpyAJ9pI4ipw2oWpFUE2WSuLZBNU6F0/V2m
         p8OHwwYbykdAkFrNyMSwkDQS36GpEeBZCEHN9nm/F+0RR/CTWqchhROJKQRGIyB3y1Vq
         a5fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782979861; x=1783584661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9owqjjgV0H2CtePOueZPc6abek2AjkJLNAZcj3bC1qU=;
        b=szKyDD2HGAluDHdtJWx856HohEMP82qwhjSyYS05lea7Sa+4gavpijMJNpyYt8cqAn
         OOv04ZPNR5yJkvxk00df4YvbOXAfx99jxKQVJ2RGuExoxIGTOyhTJGH5W2LIUClL8u6+
         v4ehIqVyjrjuuWVclBgD4ZXljhp/UyZdCkIp+dtHbjJto15wNW2T1zsTe82ORN0h+3cr
         G3we2AkDHMw4FQYigMlLufiT8QXy758N1VMaulTs1qg4pZdKC4YMbok+RZrPN5s5FBDx
         1rbB9ypm8WjszC9dNeMJ7yRm8OY+FDbua08cnFk1PCqDL8bDK2A1g8Jv2QaqHYiB8ztg
         Vlwg==
X-Forwarded-Encrypted: i=1; AFNElJ/8pNHxcpb/5vlJr1a6jeoliOuYRT/CWy0Zho3IzxlfowOw0DXmZYFUxSzxn18698ZCkLLMMgpqkEMZIQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwfCh2/+55wq40/ylXSq3fweqqcJvheFBXem8C/BCRxhbF1KfG+
	RgUiC3XOHmr60IaCR5TW0ULy74lY2CHQyBGRyKzJ9JFD4KB9WF7MgIjAIgiYDwwflXU=
X-Gm-Gg: AfdE7cmWsAeDc2bZEJE+j2JHdlKTixsgVwPyyqFd2e75SJIra/rdQZsLK6n0yV/mgc/
	OPgytOkdx1FtG0NzWlIrOM/hxg9ErzS0ZeXMO6Fw4p6oNKc4JSPbkyYD16NAFSqVF6ofxUc7++F
	yyB7tvVKCU0Lfp4Vh/moDMLrwMce0lTKzo1kaiIf0exlBQhGniVa2x/N08kmGM/ketxsxB/KhYx
	FhoZqcp2f/nlwBYnlrZipsLjKLogkZcv1cVPg/7Lgg/xRsWppfeI2SydNyH7t/pD3znDio9nlZb
	QEASKsMKzrCu8JZrs8oa/j6wr9yyT1FNuvn99zgnhAToJuDcT7iIjLQCp4lHeexDJU0gM12UH8v
	7u/onEqFM+6WTTPOEg/4QUzWLoi0GnqYqwQB0gPf9u/PV//ltrq6u8yYvMk3pj4hpq2GiHO5V9X
	rOlDvsog4IIcI=
X-Received: by 2002:a05:600d:3:b0:492:523f:a3df with SMTP id 5b1f17b1804b1-493c2b161b3mr65913275e9.5.1782979861478;
        Thu, 02 Jul 2026 01:11:01 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:2e3a:7dcd:d2a4:6556])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493c6372c52sm28787545e9.14.2026.07.02.01.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 01:11:00 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 02 Jul 2026 10:10:07 +0200
Subject: [PATCH v3 8/8] clk: sunxi-ng: sun6i-rtc: add a733 support
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-a733-rtc-v3-8-eb2580374de6@baylibre.com>
References: <20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com>
In-Reply-To: <20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com>
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
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqRhz9MfScamz8f3pP7xitK//ZEvxJoGjJ0MX75
 2HPdtq2wluJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakYc/QAKCRDm/A8cN/La
 hf3tD/4qrfRYAsDWz3OImGSBlUMd9kVZBJFcHpm6lgnF7Xz5khE8dx91e2N/LsXXZ80MMe8QZt+
 tadCt3+gZ7NmM+EaoPyD4JqtQjUU8nn01d2z0GHtytQU0fAT8p99uponfmU15Zb4muhQ2nZ+Pjd
 y9LwLf2oc5qoD8Ms61OJ66IE12pEYJLM5ngg6wjgWyja8uouZTTXtvjb1cHSyCp4KM4fvOA4yf+
 0RUBLu9sgeBbYCQa0wxbAfbx6bknmOAPkx9p/CXO3o+kuB+qRJLdLSPaaFodWhhyEn1h3NX/Ufl
 NvLFPbe5y2IHk9Blfh1QA4eImXCkxVVMv95kTEouSJ3LpEmos26iV1ZCQ2kaUtV/+d/G2cufvMh
 E/DAXhp8iIgWaKtlg8P62ol8Ku3UUOMkn42CgxmSzzhdHCAXTCEuRTTJLSlc4gbrLAziINHYO8H
 j4dmB6JOTCrbXOCFhFwGlnrGMdo0ZVZWc+g4fXobq+W6vpTjEpkw7D7V9dRKQHJmk7/lrUgyZy4
 MjRMJoMrCIw2/ZUUcTgsZlLy8UMSuE9CKYYIHjySqwQcI3YS0OhVobpIurMybhv2ryoziwLmmrU
 SgpR9Ncy46g5XqoQUr7b+WfOMyuT0jHDalAj6OnRP76+VOvImO+Ob6XwgYAX4rWGy3348xv2Cyu
 Rn4LEty4+fXIIxw==
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

