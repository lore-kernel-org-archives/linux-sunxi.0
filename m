Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A36D42643A
	for <linux-sunxi@lists.linux.dev>; Mon,  6 Jul 2026 09:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330373; cv=none; b=fd7AbFQBXud+xQw2iwrBL+6pjXuqZsY11yuwlz+4jA8OVxwJ3lR41a2nJ0pfhLDFvK7wCBpapZuAqifIJhgps7ncNlno4D3GzMh7hKTuTGx3hyecTGyQUXbxsAKs5/aArNLucxfJLgWBoAHyQH8H3N+H5L0XPksN3/nJOiViEVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330373; c=relaxed/simple;
	bh=mDE5aNV7J0YTDC++0PyqpQq+1LRXe/OEq5dNJJriQq0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QIx3CI4X9B6f8uueuV8OmGeeCtaug+CQhHnSq0xw74Ggg0ahNR3oRhlDzzcdtfy3DMni1LQifZOAq3LSrRAA0dcYnSa3R+r/kl1t/Zq20ZYWKWmfzzWlqr04EZ8nv2LZx/ky+0ptxsR26JyemgFnuMj1EpPnpyrQ1a6iESrRfpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=K38AqKzF; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="K38AqKzF"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493c52cde9eso28949795e9.3
        for <linux-sunxi@lists.linux.dev>; Mon, 06 Jul 2026 02:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783330363; x=1783935163; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rSh1ZBRvKf6dioysT8A/x6MNdQs15mKol/PsSCRG53E=;
        b=K38AqKzFWjWxNcORtrPk/MfZD/Nqqs8I4ChbCmh7UFly+Ywr97HBI/jVVxIZ02I6+x
         oTsUshncX9z1ah37Qq0LmGq8WosBZ53gKbEPgP5H7NHH4aIvmvchXAZW91bTDXBusd0C
         7DfpKEJZGM9Xg8KYDGiSE2M1lpRqQ2twCORl0T76Cl/g9oaqa3kYUCZhfXxeONSi6wJg
         Ge7RVz1oFGiTGXoceWoW1sTtu4Qnz15MB09KdfLEOuC12DHUftqQldFVwkClaDBBcj2V
         xeLiMldibJNRDv0vB1oq/jPRAarxVdvlAVbB8m/cGIF61ApHQhUjH6DIKL7C0UsPsxG7
         mmEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330363; x=1783935163;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rSh1ZBRvKf6dioysT8A/x6MNdQs15mKol/PsSCRG53E=;
        b=NZznkB1KUe2FJMQRzuZnVI1wxiYx27MZZe9KJl2c+r7XoehAz8kXq2rjpCitZpmcak
         zO4jboEYGMPR4gn11P+uokAhczoPvhUQSmy9A8zOeeoLZXLXefyjwO8rV8wrYOFhTmDC
         x3gcGiScGTWQnUqnZAQbrtjqP7IviP/P2onvShTfJPKKzXc8VpgTS8gQ/nD1kIDMNVE1
         c348pcj68CJA4IpDq8O+wj2ZH+Z0l0VStZD6JakfvuPHH2pyl2VW4HYJLC0kC7jRm4I8
         ssv5u+VBm+dkOf4LRLW2OEQMdQgE7HNS7PCFYnpvIAE93lBbtw1UgrfkyyWtm4HD7rae
         +A3g==
X-Forwarded-Encrypted: i=1; AHgh+RppaonxIyffqJoUzD4/GEigjxUVC5R5HjmMukfn1+bw/EU4QTURBbfN1kxNxlspy3sYOlnvBcH6aTqpeg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxtLC6Shm1dVsaYGZ81MJG831T3W+7ayBFcllYqSK5U4tD6vGyL
	g7qyyqnlZ7HBeRJE2cbbp1CKnBJsVUlm/tXGdHcOcopNuZYEd8LEOgkPk/K9nAooFPc=
X-Gm-Gg: AfdE7cne1jVQFzwalCEv+7kcgj7mKkI0m2Vh4+PY9HnpuIdmKqpruXgGHxZLmfhnh2P
	1hh5SRB0BvR7tzc+PZbuPh9F3Wc5aL3WMlqfpSnVxJ4agCXUuM/cdnII22LgZb1LwiUeu3/239K
	Bl/qQZ3AdeeeZqBEYDy1ZcO/eFvJkzBEB1TZ8CYk6PxtcvwTnuelPBv3P4jM/Ptta190TqZeeag
	sqS3V2q5pxdKbkTpXASlPzLUJVXIdaFONC0qtBDADFV3JTOwK4pidbTR/Nw2PRE+eU7xfYXJPFR
	K6kG6NyOEn3l9D+7ayhd2zSMd4WZ0Nqg1p2E48YjnAtGgfQw4BSYZv5kNiOhhwcMs4brwznTJku
	BTM2W0elZaw9PTIYPVe9uSZ4uT87kaQvKiM1NAddZSS9TcYj7EFTAzVB67jCHtmCrNYfuCohZCW
	8zOks2OnPvN0s=
X-Received: by 2002:a05:600c:3f0a:b0:492:4a50:41fe with SMTP id 5b1f17b1804b1-493d11f05a3mr108518285e9.22.1783330363453;
        Mon, 06 Jul 2026 02:32:43 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1495:8c97:96f4:dff8])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa0960634sm24496957f8f.26.2026.07.06.02.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:32:43 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 06 Jul 2026 11:32:16 +0200
Subject: [PATCH v4 8/9] clk: sunxi-ng: sun6i-rtc: split main oscillator div
 and gate.
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-a733-rtc-v4-8-f330728db3d3@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2479; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=mDE5aNV7J0YTDC++0PyqpQq+1LRXe/OEq5dNJJriQq0=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqS3YmTWLBuAgutDebw3ejtGqAFUPS56EkSWc4A
 wtGJpbqBNSJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakt2JgAKCRDm/A8cN/La
 hVRZD/9c7MLYh8cPg12ioyQi+NhtPqzROV5AnuK4OgtAmpPfUuF85geQbj6t5HzciSP2Hh5Mc07
 aeHHxl1ymAujhPPVz/w0sx4tnU+MQcTN0E/JoNe6YjsD4IXSKB2UYWaz2Mzj2rHOBpz8Jt9BdFc
 UQ+FcbGsS1mwn9pQK5kgnb/qp6qptHo5Kz/Rih4Zsnx17p0P6tn0hMHPUa1KSiBattQ0RX+xAt2
 IWtiahvXeBrLgJyzYxnMeK70V8BtmwhBIPs1dFcCzFka/fKigZrksQx8e7ZsF0AUqwkcbbSdIRT
 ZCd3xtLzkBr1JoH/pO9xhIl3YI4eAPZVc/jnTc1DfSNmnrplpCz3KKensHb+1OJgpT9r0h84CTP
 c+cJ1JLw3U1lLEzIaDO8qd6WKjb6zIHaifi0TOp+L/JZ+HHGvyCaSc5Dq2tD7PGFpfwEVAMH3xZ
 tL8TXrkKZuCXaxuOJNB7N3lFLcqjU/0C+Xi7RdoDJZDZ8p4ARlcQYEC6p/16tVFuvRWgKI7cEIL
 mwOOfAGoQLdeKsNPTFgA5qOjVVZNIn24USq7nNhqzvmSXlZvTBpSswK5YjYXGrCCO79jPg3hdwR
 POG1wdQfq4QO6f7JNq1s/CJgCpm662359uW9sY5QIdpPDl+Uui0d9y7VRYZHOHWijGo6fR3pkgT
 ySkhTV0XZ+V7+gQ==
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

