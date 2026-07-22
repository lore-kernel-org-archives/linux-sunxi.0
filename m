Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF8636DA03
	for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 14:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784731721; cv=none; b=uPzvpTfqWDlBmXpSStZPOR+CNZTzSib/mnlOkjncwm88Qrpsr5n7lBSO60yfj44xeqvV34c75E1JFJAKcC5/ndj5UE/fisV+JoLp6vkk5CG+/J4J3Ve1xzMROZ+/ftctlEoNe2B/MizkYFIhRQh3j34UYGLdaXrLpC31WMWD0Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784731721; c=relaxed/simple;
	bh=vX/TCHLAjOkQRelKPMwYvdNToDOf4unxRAm1iZEzSxs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=baVvUoyWslnczeUTokAjjKhw2Tox1thI2BAGI/AL27bW8TJVivnkssUD4c7WB/43ufRwVP9Q1srpZwxm0diIzym6UsRE4gqcXdvwd0adnwaOeuXBg+tys3CvzPh3TEZdnHrhSa1J5WK3J8x0/jI1ok5lUQ1rqpdWdVY1ylJew8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=nzGUjj+3; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="nzGUjj+3"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47f878135e0so486693f8f.2
        for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 07:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784731717; x=1785336517; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sCHBjnXnCbVICbmg1fFBQry3N4DeY7D0jzFS6saVNag=;
        b=nzGUjj+3MRuPJqcdv0++gslspHaary+x5d7U0G+9T2TD+705db2cgONgX5dHuJo5gS
         YhD4ZWWciX2YO0my4gpM16ozEdXjUB9Ujg1hBRtzp+pjKK9r+69hXauN0j1ywQbDmo/L
         Yq1eIS6VybmMievwIlD7lKuNmMkZjL8fpOlqFhBiW3idJzMepq4GSqlJWcFTn9PTpnsF
         78sHHnJfK4n4ZCLi4UtVKvH0HiAGloLbzAkl50bTL7j/bJoGHfPnClQC1v2uSzSsxdzU
         kw121tSgvcEqEqyqPajPKmiit2Q4BgQxxkV3uzTmP1JMojfaFwNjKQihJCQddI1ABwTV
         fZJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784731717; x=1785336517;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sCHBjnXnCbVICbmg1fFBQry3N4DeY7D0jzFS6saVNag=;
        b=FEvjIFNBW3ZuKThh/LRA/MO7tWotLU8TEavjJKZuBaKgi5pram58bnvAcrOatyrYpe
         bllCF1TCNXsounEJD8BnQRzXsVYbsRsnR7hOe2WyuRT0O1MqdhmSdvX26pLlZxTOyC2/
         pK0xJAgyRWpCF1WsI5cd1V4rr5SicIEy6qdXLz9IVmh6bsWqcaNuMpQvgZO/vziH9i/g
         AU2ZEtO7oH4Qrkpqr0DQiV6ZR9eYw/RJZspJwnfUzA8yvcnOuWTXS4/2AZiNg47jlcuC
         5Xu7/vbU9vtxETqjFAmg52NciqyxrRXSgjpzxa8P4JJP8mqjtm8omm3VJJz4tK5fGquv
         nZXw==
X-Forwarded-Encrypted: i=1; AHgh+RqqjozDdx7V3akU+0BPrWrm/3tJ5IdnTXKsgwoiF29T3AQsuOB7shbbQ7wwMs98TclsK/A+pt4GzWyIPw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxnmnZ1UqofjKnP00bXQ+vzW+2zHABCCYMKu/nGMdlFdKIkvfYm
	am3SD2utvzlKPx0wF8Dj3suM/VOjGSvvkRmiONZeuGkNYRe0T2Dl4TcKee813Q2qnkQ=
X-Gm-Gg: AR+sD12E8lb6LkplkkvIcqb7IeSYV7Sq19BrcieXw2bN4NoBN0Yxu9JINMNNj2dTdH1
	1WvF5zYo4qg3mZeCy8BAA6rbmIxLkp0GJxsZU5lkwj3wCC5ueWelgEJpA2sDE1h/HCGcGUa0obI
	LXErFlvBtEpUjSAalQ415vBpyq0NhW6+JMvh6vVCDjEJLKWTkwRETL5dCvqghHtPWHn86ZZ/wdp
	bstFxoBR7D9uf2cgNhF9KbeXKjD6OCM/ZzXGkVHZHhNVNUfN5kSdZUEecl2VAT7GOlqeXA3gKtB
	uG04qGOvD3MGZbTtSQA39bf3WBpsRManVLkpH4tboTZeTeslvt2Rv3RWCkNdV97HLaNs1hpToTO
	0S+G0PqPbYZOQKAbUr01FL6OOBhomb9VbIvm63gv7Dx4CCED5xMN8UZZ9j+FuX9a6mlTMDAx0Hh
	YV
X-Received: by 2002:a05:6000:298e:20b0:47f:6d4e:4cdf with SMTP id ffacd0b85a97d-47f6d4e4e09mr15710230f8f.58.1784731716959;
        Wed, 22 Jul 2026 07:48:36 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:a589:14b5:ba97:3626])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f85bd77a9sm6306269f8f.14.2026.07.22.07.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 07:48:36 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 22 Jul 2026 16:48:20 +0200
Subject: [PATCH v6 2/4] clk: sunxi-ng: div: add read-only operation support
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-a733-rtc-v6-2-631cca28cc9a@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3700; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=vX/TCHLAjOkQRelKPMwYvdNToDOf4unxRAm1iZEzSxs=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqYNg70PtrvTpA4LWczjYUn7V/UXWZ9hOuvW3P+
 O0Lia3J/vCJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCamDYOwAKCRDm/A8cN/La
 hawdEACxatHfiQJA9GAhWuY+R5eP92r1ye/bpxxeNgaevjHIs1u1UMo3XqTzbVP8rgDpmw8zmyy
 Ja0tqYLVTqx74NMqLcBPuXXRe41PSxyc301FcUQcqW2B5CQJoit2dSnsRPtDMm/IDoWOKnap94U
 ZMe2fz7U3BVo2nHwhNrLD6dx7WBwi3QFAxwoipIHvht+RwqKTgfMi4YEBzL4bDP1kJi3AmTKj0j
 psjlQmncda6vKprmIHEu1gY1sCzcwb+qrVm1Ml5cG7zRMfr2f4MbjOfc5ka6B3JnDl7W20dOUid
 xrnLMrxixVCexbbvR/868TGSe7hsYXhlcOLFxVGyr1okgk925IE9+UuFSg5tMU4NQlGvB547MPs
 1UqorgDd6oITa9OUx4gTwKPfZ0C01mVBSjZy0SIv0I/eiHm2b906V3YcRQ34n2ASEc5RC5nZ1v+
 B2M7aXJPTRVAhuCZ7Z8TO0oSvyRL2Yr0lfSFxCTYcKS/xAh+BrRw8MbW0CC6SIke1vqh6+PALZ6
 Da4z/sKrP3Eqm2LG8trpNsIcwcqGXtrHwTuzTkkOsDtcFP9TlB5lTVAIkIL6pWD8KFEy1fVmV3/
 Xz3/AQPG/D2jiPSBQrFIVGdICFEK2ppSHclER7XEBL/Ql0yyVDKIyhdSHGD3OnFmYQ9KkszQS5D
 FtimUa/AqjJCufQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Add support for sunxi-ng read-only dividers. This will be
useful to the a733 oscillator detection logic.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/sunxi-ng/ccu_div.c | 31 +++++++++++++++++++++++++++++--
 drivers/clk/sunxi-ng/ccu_div.h |  1 +
 drivers/clk/sunxi-ng/ccu_mux.c |  2 +-
 drivers/clk/sunxi-ng/ccu_mux.h |  4 ++++
 4 files changed, 35 insertions(+), 3 deletions(-)

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
diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu_mux.c
index 4503c9780c39..12bfc99c9172 100644
--- a/drivers/clk/sunxi-ng/ccu_mux.c
+++ b/drivers/clk/sunxi-ng/ccu_mux.c
@@ -67,7 +67,7 @@ unsigned long ccu_mux_helper_apply_prediv(struct ccu_common *common,
 	return parent_rate / ccu_mux_get_prediv(common, cm, parent_index);
 }
 
-static unsigned long ccu_mux_helper_unapply_prediv(struct ccu_common *common,
+unsigned long ccu_mux_helper_unapply_prediv(struct ccu_common *common,
 					    struct ccu_mux_internal *cm,
 					    int parent_index,
 					    unsigned long parent_rate)
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

