Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1D64229C3
	for <linux-sunxi@lists.linux.dev>; Thu,  2 Jul 2026 08:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782979860; cv=none; b=Zu5MzxWC8md8Tz2KGws7Fi3CUXeUP43O1zvHrX7wWtg4GvIquuSfZAsus8CKa/PAOeoM6Os91kTv8eulCsE1FkccYZuMoNd+MuXtBNCgGyjz9mfHZzpikqhAEMeIV84+GYkUt83gKn02rGPqZ+XXh2SYMtWz7jZ7+GMDWYD5i+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782979860; c=relaxed/simple;
	bh=2L2d0QfPA9w8m9zLHFuDIP+92mtPVG6eY7jP2BAgsNc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yap+5qylRNDoRQZyplZLYjWNzRSC3xa1yIzbAv+bSKZ6O84WNkBh5Sa98F2Lw0yYVRQD34FnqH9+ByWNKwPSDmg8BO4yrSss4T0NUUXlMEd8EX9GwlMWLzLT+YceKm21l6MsW4Z/YQh1U2Fo+ZdUXGRSgRGkkmfcNr9vMxM5vkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ndc9HbB1; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ndc9HbB1"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493c733f15aso1824285e9.0
        for <linux-sunxi@lists.linux.dev>; Thu, 02 Jul 2026 01:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782979857; x=1783584657; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zMIl1Eh3yVsZrdBP1XorCdcYvGVBjprl7wt0TiPGGoE=;
        b=ndc9HbB1fDrMrHJvRMnXszIfE78caBwUy6SyQK4a+oZf13BaOvsziFzAoZtqfy2WWB
         H4emHX+chOgPUkEYCc7+xDkT3xaLy1JfMznSZhUaikoJgLVxcSTY2X0m+1vnAnkHYF0i
         dTStyf6xaNjA/53si0Xsa+qVxpNgq92YCEIiBjyln2BC75NnQCz21wwNypbY6WlBq1kl
         kw0R2dYkmXFK3OKDOm4NAyIGzZc6F74ECfeHiyf4sOpa2vC6fnEJt3SgMvyQw5Z6b2w6
         aKkT5pvhzd7pTINdcPXeZaIzwsSi8G/IrqRS7wO93L7+XHZKT6isbe7Xqhk8EWs0Yk/r
         Vwww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782979857; x=1783584657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zMIl1Eh3yVsZrdBP1XorCdcYvGVBjprl7wt0TiPGGoE=;
        b=iqIsrF707Dd/pBPYU6zqOCjzwE4JBDWFtLKqecCknPt63VukO9EVWz9GRcPb7EMnhW
         UQlqZ50PHA9B/R+Mg0aowIexItnn1K3cf/ibqaGyIQ7kvnZuXfsxv+X+8oW9/A+83C2J
         +IHueL/KhGpqMVSn4SZ8aeDZ0aUW044lP4PeWb0PgSGlobBaj0I0RkAlP38kxP3qOIYb
         aPFmuGKKq2+ANXtv7V2tv7XJmVdRZSZbDhWCAHDXKlG6ofClB25Wp0oJ7fBnvMJ16sGS
         3aGH8K8blOPMPMX73Qw0M265fadsBQi4PQhTDELEp1ZbJ6jh+2UvGwD/DXWZmweuCeRU
         H12w==
X-Forwarded-Encrypted: i=1; AFNElJ8JqRQhFftIWE3fg/n1VfQSIAvh4wXhKMzcnF+RfarISfITmLmSR+Se5sMGhsbANofOsz8NckM1nof7DQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwmAUBd8DJn40Lv/tJxPOrKIV6MGodr/G0wVZ3qiEQSRvQ0qxZv
	U94OSG8D/6/uVLUJ9qph/Gelz8z/7iMeJ8Mebx1U/9nWe6m8pNYke1OyYmdxNwoV6s4=
X-Gm-Gg: AfdE7cl7Mx2m1wbylUZMWbKb/CfsMfH31zlQvMPTHpndGtILRNMOgNXAGQkvbigFiBg
	01LLfpo3IFRp17DtRJCGuEtfQqIXzTrac7iU60erVMMdmgcvrbs1n8Dy4TI/21qo51WkGRrhc4X
	Kz8N5Ul9ZPUu7UB4AJH91TrerOQtB+tHV1Mw6nNWLal2h8mu3FlhkzaO89dFCfz8Wker06m9P4P
	MKAgm2Sh/d4JS7YK9L3opHB9NrBKu8CufStW5j1x1/kL8wWPc+4dAd93pKuWExHUSM1B89qZ5oB
	lyoTfdivyXyGlStdI3xu6GvzdTOYMWKgop4VmQIs+j2b2IBWQQa22XTsHMJBrzjPDUuM7emvAtu
	53cKHVk8sBYl3jMP8IgWgqZWpsftrnqhdkUIf+4nZUIfDgAIY80vxe89v7kAhc6G+mIy+PCyEy1
	DGeMzJrXDlcr0=
X-Received: by 2002:a05:600c:3e15:b0:493:a8ff:d7af with SMTP id 5b1f17b1804b1-493c2b15c9bmr72077075e9.4.1782979857187;
        Thu, 02 Jul 2026 01:10:57 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:2e3a:7dcd:d2a4:6556])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493c6354771sm29596785e9.3.2026.07.02.01.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 01:10:56 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 02 Jul 2026 10:10:05 +0200
Subject: [PATCH v3 6/8] clk: sunxi-ng: div: add read-only operation support
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-a733-rtc-v3-6-eb2580374de6@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4152; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=2L2d0QfPA9w8m9zLHFuDIP+92mtPVG6eY7jP2BAgsNc=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqRhz7i1ZELfjYtb5C5oSl5YLVh5u5d5JSDVFlW
 oxSy/mKcsyJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakYc+wAKCRDm/A8cN/La
 hXkTD/9UqEGQ7lP5+o137L4ZK0dj6r9uITACcbnFagNW8dgCdbRUU1Gkc0pqcmmiv7+UB8ntF87
 o3jhmGckjY10GSP4z5O8LRX/RFDQxleFMjfojpwO36ioEKJgnSlA+lu6OQhi+g46wQnN6DtJxEr
 7JlXSuU8D4pI9ZQn31jIAnknDdGuyFwCU4AyWVBFecyW+hb4MBoA2tFxwxGlNEVY/TUTXx2QY4x
 tYvNkf1qU8DkddNz3GUjYzAil3ORQTbsYfo2jaVBXakn+CO9BWdNsGeBhkUn4ztynpV6xy/rtuU
 lT79/EIarFGTxDfnY+bVcEwjofdNIiVhoX+pH7wegGNzkxeYD5ZQaBA/BkWGCtjunu01dEGyu1D
 qfKldcvBjqwRW6evTZxpsz4AelUn8ryl95Z5blQogwYlL0us3lXlUBIA7yXmxL5H6T/aWPctE8y
 6vgieBFPI3dWAgVTtuQiLGVMCGH9oUWKi+yHa9vSDnK6YOz1MT7iOcNqkzYDdwVv4TT+9uvUGB3
 DCbtmqU4H6691jYrfWWqQ1Pqet1p5g4i+mv30yFGfOlGL370t9V+6n+XWEq7wiSIbX53129CGo/
 xFa0KgrvLpUNUzhv2A9ND2uuvgGDvNbpeN+kjVgK1rB2PNnhZ8gwqPB7CuvqchwTz7tb4Z1BAh6
 7IchPeO7hREhSqA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Add support for sunxi-ng read-only dividers. This will be
useful to the a733 oscillator detection logic.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/sunxi-ng/ccu_div.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/sunxi-ng/ccu_div.h |  1 +
 drivers/clk/sunxi-ng/ccu_mux.c |  3 ++-
 drivers/clk/sunxi-ng/ccu_mux.h |  4 ++++
 4 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu_div.c b/drivers/clk/sunxi-ng/ccu_div.c
index 62d680ccb524..d1c8c7baa12d 100644
--- a/drivers/clk/sunxi-ng/ccu_div.c
+++ b/drivers/clk/sunxi-ng/ccu_div.c
@@ -84,6 +84,36 @@ static int ccu_div_determine_rate(struct clk_hw *hw,
 					     req, ccu_div_determine_rate_helper, cd);
 }
 
+static int ccu_rodiv_determine_rate(struct clk_hw *hw,
+				    struct clk_rate_request *req)
+{
+	struct ccu_div *cd = hw_to_ccu_div(hw);
+	unsigned long val;
+	u32 reg;
+	int ret;
+
+	reg = readl(cd->common.base + cd->common.reg);
+	val = reg >> cd->div.shift;
+	val &= (1 << cd->div.width) - 1;
+
+	req->rate = ccu_mux_helper_unapply_prediv(&cd->common, &cd->mux, -1,
+						  req->rate);
+
+	if (cd->common.features & CCU_FEATURE_FIXED_POSTDIV)
+		req->rate *= cd->fixed_post_div;
+
+	ret = divider_ro_determine_rate(hw, req, cd->div.table,
+					cd->div.width, cd->div.flags, val);
+
+	if (cd->common.features & CCU_FEATURE_FIXED_POSTDIV)
+		req->rate /= cd->fixed_post_div;
+
+	req->rate = ccu_mux_helper_apply_prediv(&cd->common, &cd->mux, -1,
+						req->rate);
+
+	return ret;
+}
+
 static int ccu_div_set_rate(struct clk_hw *hw, unsigned long rate,
 			   unsigned long parent_rate)
 {
@@ -143,3 +173,15 @@ const struct clk_ops ccu_div_ops = {
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
+
+	.determine_rate	= ccu_rodiv_determine_rate,
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
diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu_mux.c
index 766f27cff748..e2d6833a6d33 100644
--- a/drivers/clk/sunxi-ng/ccu_mux.c
+++ b/drivers/clk/sunxi-ng/ccu_mux.c
@@ -68,13 +68,14 @@ unsigned long ccu_mux_helper_apply_prediv(struct ccu_common *common,
 }
 EXPORT_SYMBOL_NS_GPL(ccu_mux_helper_apply_prediv, "SUNXI_CCU");
 
-static unsigned long ccu_mux_helper_unapply_prediv(struct ccu_common *common,
+unsigned long ccu_mux_helper_unapply_prediv(struct ccu_common *common,
 					    struct ccu_mux_internal *cm,
 					    int parent_index,
 					    unsigned long parent_rate)
 {
 	return parent_rate * ccu_mux_get_prediv(common, cm, parent_index);
 }
+EXPORT_SYMBOL_NS_GPL(ccu_mux_helper_unapply_prediv, "SUNXI_CCU");
 
 int ccu_mux_helper_determine_rate(struct ccu_common *common,
 				  struct ccu_mux_internal *cm,
diff --git a/drivers/clk/sunxi-ng/ccu_mux.h b/drivers/clk/sunxi-ng/ccu_mux.h
index c94a4bde5d01..272a2c36a8f2 100644
--- a/drivers/clk/sunxi-ng/ccu_mux.h
+++ b/drivers/clk/sunxi-ng/ccu_mux.h
@@ -134,6 +134,10 @@ unsigned long ccu_mux_helper_apply_prediv(struct ccu_common *common,
 					  struct ccu_mux_internal *cm,
 					  int parent_index,
 					  unsigned long parent_rate);
+unsigned long ccu_mux_helper_unapply_prediv(struct ccu_common *common,
+					    struct ccu_mux_internal *cm,
+					    int parent_index,
+					    unsigned long parent_rate);
 int ccu_mux_helper_determine_rate(struct ccu_common *common,
 				  struct ccu_mux_internal *cm,
 				  struct clk_rate_request *req,

-- 
2.47.3

