Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08A5433E66
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Jul 2026 09:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784799611; cv=none; b=HZhRysfEcJ5LCszsvsY3ANW33f2/MvmxAGtP9dL2v0e5Olw4zCnWzvSIWCDhHwkfyntivTvF5MystJShP3Ni3P5tGc++zxCezwGUQuCG1EmQ24yyNQ67k6bIZ+niBsvwFNErPymIqvteSCy2V4dISq8aOzWHcbQZbkSx8Mylccg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784799611; c=relaxed/simple;
	bh=h886BmU9pfC+RezdnkZ3J5Ik53qoiogLhSBSntAHgiM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SLA+HM2xYK6jaxZ6EhJXcRw09XJqz4MrPOdSdxDePEoPVTDuZCclkEexV7n0WIiBkIHFEFk4Xnu7EJJyMTkKKKqofn1YKZO4BrTKnKw8So5UeFva5IBlkl2DwKfHhFu5A+Y2nDsBX3lt5IzqClOcEDxcdIcwH0ygot9Yqx7usww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=COPfxpvG; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="COPfxpvG"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47f64ca1c2dso94645f8f.2
        for <linux-sunxi@lists.linux.dev>; Thu, 23 Jul 2026 02:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784799606; x=1785404406; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=unyjlYSQAHCuBkgYy9GiPNfKBr8X4sZKbeG1doQS/7s=;
        b=COPfxpvGb7uNbQJxR4RSAev81a+jJ+wIHdFZ8LVpmPkAlrc0dnCW1szTMHI2kEXnJL
         TDO5Gh2a0G+aUtQaqOObIsiOc61ciaN4WtIsIWZG7ua5Jewm3FCkwVZUhy+xbnmlhmNe
         Cx/azJMUt7EJpGiIBxGVH6/HPr24i4y/kUoVLznvLyq9nis1mvununszcSdjnWm2jW7Q
         39H2rK8D0ibeE7OJwsVBJyXv/zhi31NFiyAckM8igExNeZUs80CKsIp3GnpftfSyJ4VZ
         g6sTW/Wt2h5C6Tn4Tk1gsCvrY9I7HXmfOiruhnh9qStr2bQkUgUymMqy47i3UubTv6+J
         GIKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784799606; x=1785404406;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=unyjlYSQAHCuBkgYy9GiPNfKBr8X4sZKbeG1doQS/7s=;
        b=ktGrI+U3cGYfHd8xBcTXthMZFCfQBoxF4hhCZwjjeppkWLRGvYP+RU5SklCe83O1ay
         /b/lxUTRxfEa7C4YanFtuy6xXWfIodUC2KBH1hkWRocdl6lLcoTTwcfdz03SP9srNBbo
         3CUBGap1jGNImpfu9axCOLQEskpihHJnbojAhVnSa7JQPhhoiIUoFZIiziKQ9gWNeWqM
         y6ITGcapgXAyTWU1WCbEevRrR9+TSHjMwWByujdtSX/mDV3766MQqitPZSCcIvcfAZh/
         jBLAP1odaNvnG8jaNEbPX8e+qMuU8UDxe2gaN3CzdT83cAi7Kws1Hs7LLkwGp5XPuxAf
         zElg==
X-Forwarded-Encrypted: i=1; AHgh+RoDHZSt/ItU6zo119nv6Oms2pfwWMRoHNTZXFMdPOAAGbpFBmbLRgP2+Gl/Q9HQD5+GNO3+OSor9A5Q5w==@lists.linux.dev
X-Gm-Message-State: AOJu0YxhPj4zgaozmxQ+Tq+v4K7PxwQ2BdZ1I4MaVzHNypgmnOTOTLSA
	FvFbmAspqC18GSvyxYr4MxQzmR2vI3kjz7QGap0DvDIR9UygvbB/UWHw9C+vOQq0KDY=
X-Gm-Gg: AR+sD105fhTUwn9xlBZSj7Gyktosra3gI96yAqwxeJNOXCAVqAvk8a0au2TNn+RHjgS
	kNW2kdI5Nmdi6MKrfo2o7VWAVCGF56u5qpHMw8ctODPewcilHFn+Sdu/LFYnLZ0f+RigDb244uT
	KasmEO2DiKLFzg+RnkF9DC7h7uLTuQhRpjhMDKYfw4WAhd9cDBbhgTJnPYUUYNvTY+QrPo3CifX
	2Xv6SwjLkKttKJ9q9aF58FLVwSPPIwJ1l/BzMHAWEB+w/n5XU36Baznl7AyjR09nAx8SNJkLYKF
	DypOC5eMtL6pKD9D6f1QalBjo9usXokyyw/hNlDFb77r94hVaJvaWPDRVC3yYfdmtZq2m0TXwtz
	gI7PPM6TXNIe8u28L4hb0YvKqN+sqk5ZX1Xit71UBjv6ZYe1Msl3wJAvAmQlNoAmjMS0BF+qAU/
	l7
X-Received: by 2002:a05:6000:27c2:b0:47f:920b:7fad with SMTP id ffacd0b85a97d-47f920b8051mr1216847f8f.51.1784799606034;
        Thu, 23 Jul 2026 02:40:06 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:3274:dbb5:2710:802b])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f85c6f076sm14217165f8f.34.2026.07.23.02.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 02:40:05 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 23 Jul 2026 11:39:51 +0200
Subject: [PATCH v7 1/4] clk: sunxi-ng: mux: fix determine helper rate
 propagation
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-a733-rtc-v7-1-8fd68aab94ae@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4256; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=h886BmU9pfC+RezdnkZ3J5Ik53qoiogLhSBSntAHgiM=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqYeFtpYPA3bOOb2j0Z9hzyBatcOuHwPVa9K9nD
 Y0q6zTCxbCJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCamHhbQAKCRDm/A8cN/La
 hXFoEACQiqosl4kiv5gDmdbrtXdNvJ48ZH9JDp5cPQpUo/TJyNpAMmT5sefdW4IGUWqZ+oukkkf
 Z0pS8hwDD1kwY2rHFnt+6wyPhQo4y3SOvckimSFCONLnNQEz4UbUr7JBeYrugzt6/INv3wjUdf7
 T8DBb6q3RKDzbncuWsX/QmFR5L2t92vuDCETY2IHpSI2p4S42P/XxptxLtMrkdvgM+mguKZOZ/5
 nJAB8yCq8m3bJamX/PBrfI1yGBnvMXX2zGeIQR8xU4aCo01m6v1RZrta2SxmN25uK2E9mfRSPyA
 /+Pdlnt9zSCXfBjyM34JYxaNW9y4+hfDOwY+/qQoOViGeXM9My4IG1OqeLjhsoGjEZcprUweJUT
 cwHD/uc5xbvyTsNmfnub68J1scN71a3petL9skxO6u0AEmz9MMJn6sJJTTidPmNafxpkcgfY2Ez
 c8azmoaMNZMX+KDtlDXT6LYTWBCDZbTvyVHh7Krhnlnrh83p4MrlEv68EB+c6etnC9g5uQZY/92
 tZ7rtUcBW03DB5w4mFXO+qEW4Ey1CA3UyCFcneniGBfr2w8cweBqgmUXxFnsFRoBDNfdJZz1EOX
 wqkIAohMIeAOvgigkj2icl0mrpqo/KjkcMMF+TmqHUQsYeRPxAYn/9HU2fVGNmgxeNMXB/mrUiO
 ktpwRCWZjUnHGGQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Applying the pre divider on the parent rate is wrong because, while
handling rate propagation through determine_rate(), the framework will
likely round the parent rate again while cycling through the possibilities,
throwing away the prediv applied. This means, the parent rate will then
be wrong when the prediv is unapplied from a parent rate on which it
was never applied to begin with.

The right way to do it is to unapply the prediv from the requested rate,
which is the wanted rate at the input on the clock element, and pass this
to framework to do its thing.

Change the determine rate mux helper in this way.

Fixes: 1c8d7af61b37 ("clk: sunxi-ng: convert from divider_round_rate_parent() to divider_determine_rate()")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/sunxi-ng/ccu_mux.c | 57 +++++++++++++++++++++---------------------
 1 file changed, 28 insertions(+), 29 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu_mux.c
index 09230728c400..4503c9780c39 100644
--- a/drivers/clk/sunxi-ng/ccu_mux.c
+++ b/drivers/clk/sunxi-ng/ccu_mux.c
@@ -92,66 +92,65 @@ int ccu_mux_helper_determine_rate(struct ccu_common *common,
 		struct clk_rate_request adj_req = *req;
 
 		best_parent = clk_hw_get_parent(hw);
-		best_parent_rate = clk_hw_get_rate(best_parent);
-
+		adj_req.best_parent_rate = clk_hw_get_rate(best_parent);
 		adj_req.best_parent_hw = best_parent;
-		adj_req.best_parent_rate = ccu_mux_helper_apply_prediv(common, cm, -1,
-								       best_parent_rate);
+
+		/*
+		 * This effectively treats the predivider as a postdivider.
+		 * It stays mathematically correct and ensures whatever
+		 * round() will do stays correct while walking the tree.
+		 * It may query the parent rate too while handling rate
+		 * propagation.
+		 */
+		adj_req.rate = ccu_mux_helper_unapply_prediv(common, cm, -1,
+							     req->rate);
 
 		ret = round(cm, &adj_req, data);
 		if (ret)
 			return ret;
 
-		best_rate = adj_req.rate;
-
 		/*
-		 * best_parent_rate might have been modified by our clock.
-		 * Unapply the pre-divider if there's one, and give
-		 * the actual frequency the parent needs to run at.
+		 * parent_rate might have been modified by our clock as part
+		 * of the rate propagation mechanism. Same goes below.
 		 */
-		best_parent_rate = ccu_mux_helper_unapply_prediv(common, cm, -1,
-								 adj_req.best_parent_rate);
+		best_parent_rate = adj_req.best_parent_rate;
+		best_rate = ccu_mux_helper_apply_prediv(common, cm, -1,
+							adj_req.rate);
 
 		goto out;
 	}
 
 	for (i = 0; i < clk_hw_get_num_parents(hw); i++) {
 		struct clk_rate_request tmp_req = *req;
-		unsigned long parent_rate;
+		unsigned long rate;
 		struct clk_hw *parent;
 
 		parent = clk_hw_get_parent_by_index(hw, i);
 		if (!parent)
 			continue;
 
-		parent_rate = ccu_mux_helper_apply_prediv(common, cm, i,
-							  clk_hw_get_rate(parent));
-
 		tmp_req.best_parent_hw = parent;
-		tmp_req.best_parent_rate = parent_rate;
+		tmp_req.best_parent_rate = clk_hw_get_rate(parent);
+		tmp_req.rate = ccu_mux_helper_unapply_prediv(common, cm, i,
+							     req->rate);
 
 		ret = round(cm, &tmp_req, data);
 		if (ret)
 			continue;
 
-		/*
-		 * parent_rate might have been modified by our clock.
-		 * Unapply the pre-divider if there's one, and give
-		 * the actual frequency the parent needs to run at.
-		 */
-		parent_rate = ccu_mux_helper_unapply_prediv(common, cm, i,
-							    tmp_req.best_parent_rate);
+		rate = ccu_mux_helper_apply_prediv(common, cm, i,
+						   tmp_req.rate);
 
-		if (tmp_req.rate == req->rate) {
+		if (rate == req->rate) {
 			best_parent = parent;
-			best_parent_rate = parent_rate;
-			best_rate = tmp_req.rate;
+			best_parent_rate = tmp_req.best_parent_rate;
+			best_rate = rate;
 			goto out;
 		}
 
-		if (ccu_is_better_rate(common, req->rate, tmp_req.rate, best_rate)) {
-			best_rate = tmp_req.rate;
-			best_parent_rate = parent_rate;
+		if (ccu_is_better_rate(common, req->rate, rate, best_rate)) {
+			best_rate = rate;
+			best_parent_rate = tmp_req.best_parent_rate;
 			best_parent = parent;
 		}
 	}

-- 
2.47.3

