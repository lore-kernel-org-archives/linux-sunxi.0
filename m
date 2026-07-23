Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A99435509
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Jul 2026 09:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784799613; cv=none; b=r/YXOKANywyy7E6LkLJz5+lTJSU8P7YROPe3x+cUqKii32FBXVqc+aq3MwQJf4OUoCZMiiDccyeL256CjYIS+vvavO4BDKcmOnP9oi5dpmmvkCTqZwYo4mKhZc8VaW88Z6b4T7UomME7LcXlUrEojIT8MmcDpQf8UNmpMlgb7cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784799613; c=relaxed/simple;
	bh=BJX69CI3rhPgFIC+UOKYakZAgmiE1nvMLkgOXW1N7vs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JfY0lP30N1qporkUH/YIEgWCaeVu4WZMRSh983JIcKR6LBfDEOVhoYn91cnVYsr/gkT0gN09FOrs61MGstpOJXxczwYDV8yb/kJR0wIvvVjaxhK75mLcZl0+lYCP8+WcqufwXjhhmWqQMqMopzyRueqARNrOu4W0Le8mkf6HnnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=eWVF1g5Y; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="eWVF1g5Y"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-471eeac43bfso392262f8f.3
        for <linux-sunxi@lists.linux.dev>; Thu, 23 Jul 2026 02:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784799608; x=1785404408; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ANuM1EedXU7mO5+fHrN+6vU75uZRwSQMOxEu7bukQuY=;
        b=eWVF1g5YEgsTILfCrMu+TsOomJrFzgZLwwN2pNyIXCd45n4GwoPRGwJXtFs9cU507E
         IxV+lbIP60xql054KGhTs3M0ZrMXt0i6UzhpSI6Nh3YFqm3X+v69orT+cruVw8RxMb1N
         2bi5mGSuzFR7rt0pQ6VxZiJXCPKGaE4kHf22JpUV7NVogVJxxm6h5uKI5UUV65qPYCBs
         XY6R3fU45BUuKhDruY/N8ncEpp3732ITrgRQNUMGCZP7NlaYYigVvay50bksR4bMTQUF
         OdOaSESQ8Qr17xUSjv9j8/aikTGiK1a9qOv3jfsBW4m39nv4CPSL9W95SmDcs7hJ7m1/
         y1JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784799608; x=1785404408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ANuM1EedXU7mO5+fHrN+6vU75uZRwSQMOxEu7bukQuY=;
        b=gEhNGC6OaK/ws7Sv52r6WamrbldKc3q+yoFI1kJl/6YAH3FbcnOKgxOcdN0EAgh4yq
         PmKt/iAEbnBDj7knSQDK6HXBe3jppTEF+yUsMQxBbG+NkbMxn3uzor2mZAlr5rkp6W+H
         owV0ofnXpjQeKmwzCV12+QpjOLz7tYHjV+hFAd/p7z3d5U91S6tKQl35CasW0ZHJpqlC
         BKOHQbIHWNfBbfjfDl9Xw3NcJlk3fbzCGBVJvvQxP97MovzKBlpYuEdpfZFwF4jDXSby
         W91WbhEre5RXWg+9Vz/SXlczqOZ0JdCeIOO2dcJr6fo6xYRXRBGuBF3/wQph/aPcJQa7
         /cYg==
X-Forwarded-Encrypted: i=1; AHgh+RrDOoMEvB4gz+gxoDEhuHNThnV7YBGBYMG3ZYwHE1d/+ABXowYvtrj4kz152Xai6ud1BP45o9CT6gzOtg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3OTr+ZDNl6mIPK/ZJy8POTDhxaT+gm34BrJUGJa1hM4u3pYYd
	FM1dPaahd2NMeI/2EW5JBQRRtRbbaghj9QbVyOFAkEbjuimyV0nCnXy7LSHYWdJ4nhs=
X-Gm-Gg: AR+sD10opC9v7AjBPR7F/fK+g1Ea1JgT089NVVZJqSHT48MPdHC2ECnkr1MOSCRuXuB
	gbFnbgudIHeqFUmlpjL8mIskfFkiCw8UourVuY5+vebdpZIVirJiYcc9HmMnJ8QkNzQ9vYfJxEc
	2UCD5bwgtkgOaUHkbjYufbPHOuX5N2E7I1XTITMXIECoYyygo4PR3O0VTomnTy9Vry79fYVEg3p
	Hog8tHcggtrFDMuspq1kHPTQYsmRUdaeuxZkCe3gg02gQcorcDYcA16oleVdnSVM3XakBg/1pnS
	BMbrEVCftxf8BAEFvCcSPOjrNOuyMyPweTkwbMojj7p3UAghN9cTBG7abJJINRyjpRsjtXl95ie
	F7MQ6lu21uehs30ijdH8EV50+LuUmWVrwNsMmIzzSb1VWmU6n7Gd5aA+mOXcFaNlPbkxuO9hhzk
	+k
X-Received: by 2002:a05:6000:1883:b0:474:5a38:f650 with SMTP id ffacd0b85a97d-47f8d710ffemr2834486f8f.3.1784799608255;
        Thu, 23 Jul 2026 02:40:08 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:3274:dbb5:2710:802b])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f85b9a6d7sm15256235f8f.2.2026.07.23.02.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 02:40:07 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 23 Jul 2026 11:39:52 +0200
Subject: [PATCH v7 2/4] clk: sunxi-ng: div: add read-only operation support
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-a733-rtc-v7-2-8fd68aab94ae@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2289; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=BJX69CI3rhPgFIC+UOKYakZAgmiE1nvMLkgOXW1N7vs=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqYeFuAonlP7DkbS7g2+GVMpDyLmLNQ/yrcz3K4
 GDc7mIRf2aJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCamHhbgAKCRDm/A8cN/La
 hXuMD/4yhmqW9LF67++G2u3n2Ore+4UjWpvySCijqdBgw7p7SquucWZp1DLDI2TxsuNXpFv4Vu0
 ZJ6wnSE7VhjkXU8frv89pskHWhdH/uQzwHyFfrUH+uS2J6S95Iha5zJ++bum+V3v4wZ6uzar1rh
 /2EhCsUEVeoG+74PZ5izkjZ4Im3XihSvPXs4zOGX8GGAEiMNRPY6pE5eOXlOG5XPfDqKZswX+GI
 wGZNcGXAzU9CY2B2/wTgy1bfmtZo9F09IeQ4YrZ+a6mTQl3Gb7qVk/JKr39p/Jyvd/tlMiZxkaJ
 2qQZLF+SSPslhfmDmoxW8DGHtln+LI94LvPzjsO2HotayRJgELlH5DBiyE3vV/ZOFPUhHMx9PpA
 MsSr+nobCw9ddH2GmjXRDtQopTN8d80N8jROx5c2p3Jivgz8Hcg6AGZ9bl59BhKnImTIhtPsYGH
 ngyF3AyOUkZlSbu9cHSaS/9+HKDCiOlhH5GOpn/T8lhyQZns6+Ukw8CDbpUPK1JPYMrxNV4/6/M
 6EWg730zZZ0S0jAvdeofo3VTd7PTXG2za6B+PVgJ3H5eOcX5OtZqIMFLlef8EEiIyFpB7LsyXUB
 8+c1NEs6MA0n+m97jU9jrmh1yzs/9QvvoBFaaAbowrv2R+zAnTD+8FUHOvFz68EDYA/A44M4wrI
 t+Eb0dJFejElW5w==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Add support for sunxi-ng read-only dividers. This will be
useful to the a733 oscillator detection logic.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/sunxi-ng/ccu_div.c | 31 +++++++++++++++++++++++++++++--
 drivers/clk/sunxi-ng/ccu_div.h |  1 +
 2 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_div.c b/drivers/clk/sunxi-ng/ccu_div.c
index 62d680ccb524..c385e0160f13 100644
--- a/drivers/clk/sunxi-ng/ccu_div.c
+++ b/drivers/clk/sunxi-ng/ccu_div.c
@@ -20,8 +20,22 @@ static int ccu_div_determine_rate_helper(struct ccu_mux_internal *mux,
 	if (cd->common.features & CCU_FEATURE_FIXED_POSTDIV)
 		req->rate *= cd->fixed_post_div;
 
-	ret = divider_determine_rate(&cd->common.hw, req, cd->div.table,
-				     cd->div.width, cd->div.flags);
+	if (cd->div.flags & CLK_DIVIDER_READ_ONLY) {
+		unsigned long val;
+		u32 reg;
+
+		reg = readl(cd->common.base + cd->common.reg);
+		val = reg >> cd->div.shift;
+		val &= (1 << cd->div.width) - 1;
+
+		ret = divider_ro_determine_rate(&cd->common.hw, req, cd->div.table,
+						cd->div.width, cd->div.flags, val);
+
+	} else {
+		ret = divider_determine_rate(&cd->common.hw, req, cd->div.table,
+					     cd->div.width, cd->div.flags);
+	}
+
 	if (ret)
 		return ret;
 
@@ -143,3 +157,16 @@ const struct clk_ops ccu_div_ops = {
 	.set_rate	= ccu_div_set_rate,
 };
 EXPORT_SYMBOL_NS_GPL(ccu_div_ops, "SUNXI_CCU");
+
+const struct clk_ops ccu_rodiv_ops = {
+	.disable	= ccu_div_disable,
+	.enable		= ccu_div_enable,
+	.is_enabled	= ccu_div_is_enabled,
+
+	.get_parent	= ccu_div_get_parent,
+	.set_parent	= ccu_div_set_parent,
+
+	.determine_rate	= ccu_div_determine_rate,
+	.recalc_rate	= ccu_div_recalc_rate,
+};
+EXPORT_SYMBOL_NS_GPL(ccu_rodiv_ops, "SUNXI_CCU");
diff --git a/drivers/clk/sunxi-ng/ccu_div.h b/drivers/clk/sunxi-ng/ccu_div.h
index be00b3277e97..a30a92780a05 100644
--- a/drivers/clk/sunxi-ng/ccu_div.h
+++ b/drivers/clk/sunxi-ng/ccu_div.h
@@ -300,5 +300,6 @@ static inline struct ccu_div *hw_to_ccu_div(struct clk_hw *hw)
 }
 
 extern const struct clk_ops ccu_div_ops;
+extern const struct clk_ops ccu_rodiv_ops;
 
 #endif /* _CCU_DIV_H_ */

-- 
2.47.3

