Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D4344BCBB
	for <linux-sunxi@lists.linux.dev>; Mon,  6 Jul 2026 09:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330366; cv=none; b=mFON+T0GZT+lsZFnnOPw7bPZ3dPp5FJj1ftWhitzOzok+3UZQvuU1YJrhuJUnzCUm4yxmex57ahabhKTcQlQjLhjNlKSwDQlJRG/3651mVGll46/1Gmr2xtSkWC/BQrlaPVHVZdNWluLcHpSCQlWkVE6G64sh5cvoyLXKdZ6ais=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330366; c=relaxed/simple;
	bh=YM5ShWAEXTvmgI5Fwj/9iD61+1bTWSy4EWyE1bdkdA4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dfnjZvIFAMAU6KH7UlTEsnDW7VGvIl87alBUUdY2XmDOV4FYfdWIQQetXyiUM2CEVutTWAjjGTHr48gNfG05b97OzGZu12VxACEsZnXVSd32l7wormhy3bURLXFJMyhnfK3ekfU0tcDeMMKN61xdt9zIGjqB1gdRwI9aIm0Bf38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=B+h9M4m9; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="B+h9M4m9"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47db714766aso450068f8f.0
        for <linux-sunxi@lists.linux.dev>; Mon, 06 Jul 2026 02:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783330359; x=1783935159; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8qaD3KpHXlXTlsicr8XbDQzikndK4UikxNXryf78w+g=;
        b=B+h9M4m9LzhbnrHTcwwTUHuXfsPar+WYf+dM5yp0OAiNjxy/N8krPCaDOSIPbIAFNR
         j23LTY01E/RXIZFkr8IuX3J5kyR2+Kj6XZrueXWSLTftA4vELfqfl9ktjS7YAw7n/acU
         5QQ5un2aL+EwjTcmKu3UEkLvz7+b+h/Mf9KHc5aeT4gtNungDVWVNGQOSQneeNe9XvfH
         Kry5h59ioNMndhI1O5kczx6BpdG66QAqGOotPLTIjJrShB8NopwUeZImx+P67FoFgMBI
         WCxnyTwLuxs4dk5Ecmashu38HDU2G4ign5SFHFHxKmXwxidm+0m0mUUn2l9wCPIWRbPb
         OtBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330359; x=1783935159;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8qaD3KpHXlXTlsicr8XbDQzikndK4UikxNXryf78w+g=;
        b=bY+/HL40QHQUpSVhC8Oi557npXt2TUnZRQgak+cEis6PxoI55cUtErlVJdg7OnUt4c
         gYuvMhYR+y+2XIUgDCSmEBIhnA5graRmTNSMuqvOX2cRQhv4tPtSggTRaXMmi2VZRjin
         OOuisfx9xNRgLzT9i62x0l06ldxPbvlFu4RJ3T6b4H7KzFeCH5G47IOWzSWVe5rVZlu4
         OVXZy36esy0fVcK07NapMhw4adZp35SmsHqPLVb6e5v6dWOexeZX34NVoF+HNOYtp1Wx
         TmW3h/EAVpB+0HUQCx0O/TpZ7pZY6xBz6/orTxKK9wMdkGmSTMcpS+da9Urd3HLOZm3D
         Jamw==
X-Forwarded-Encrypted: i=1; AHgh+RrBwRVQs5czk6oFRqohCmWWA71Ztf0YItQsgwMqUnMWKhcFBTtsrOORykNXKQk+gv8KY2YJn1mu3U318Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzSFg1qaGIKBZoQ3qtx3z2milUE2/ttUDiPjKT83pZGfjK0L6U0
	aZgx1Vr/jUvhdHDgZaD4N5BWBaRLhDH39uFtaPJXzh1SHJF+pdlfdGLmv4Eqvc6iCjE=
X-Gm-Gg: AfdE7ckulcIZYHnd/F70XbvOA9v5TIDLRRsNC1DJSzNcERnU+KGvULvxgE+Del4mJ5E
	iokAJwqUuBiJ6gKa1mB+ijbj/0nn3hi9ArQtt05Fln6H/XthwjTKTkBOJRvXxtherVeFkQzb1X5
	ka234y0+N/tUbyXnyIxpYXgQ6L4q9W/B0WeUzgt0+0xHxaQamHr4wtJ/dV0OYn/C09IgSFlmHxr
	yCPz/kQaQmaoN/cKwnmaOTFy4++zl4w170kc5Xbb9ctTb22Ge8o6etZOeuGnVoyYlEpKOmuf6v8
	rlGhEFWZlnJ7X4rgmO2GZgc2wVHyGOhWoOWcwZELA3c6iLaD6I1go8zpHpIuMIWAUYSltX8iwTb
	moY2vP8FlHzqxT4x/lTEz2VmJGW57iaRF8IDnWKVAh8H4W1WWlPJz+5WnOIkYNKT4vTC8pHt6S/
	0MhlGxfeEsxdE=
X-Received: by 2002:a05:6000:25e4:b0:473:41c6:f1b9 with SMTP id ffacd0b85a97d-47abad9f4e9mr10488782f8f.11.1783330358720;
        Mon, 06 Jul 2026 02:32:38 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1495:8c97:96f4:dff8])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47a9e4d6da9sm22724967f8f.12.2026.07.06.02.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:32:38 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 06 Jul 2026 11:32:14 +0200
Subject: [PATCH v4 6/9] clk: sunxi-ng: div: add read-only operation support
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-a733-rtc-v4-6-f330728db3d3@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3945; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=YM5ShWAEXTvmgI5Fwj/9iD61+1bTWSy4EWyE1bdkdA4=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqS3Yl3dlm1jKmbVqsn7Rcc9HiTF6eoKTChjUWI
 t1qYB/aI5OJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakt2JQAKCRDm/A8cN/La
 hbzyD/9+ecBIMkVBHC9SbhtGLh+1Wq/re/x8RaQWpRit6MC1z/qa3av70z1wyB2NcUDQkRWHeBA
 SjFnA/G6Ba3ajJfE7fEzeqeoGCeApCTWt9js6jPSzMbQzQl8c2JBmRF1sRlxWzkTJl+L/Vp/yqb
 mWCp4QZAFRq7xxeBYzuAeGYj0mObaO57Th7VCqYlTxQFrBtDURG5eXacWE46CA7qC1QYl9oDb95
 gPPKegGUH40KsqiC7k+dQXklTL8bU61dR1CzYx4jzYIcQmTWCr2TCPy/sI1ft1uL1P0Du9TfXaf
 AxPDUv98UFuUcAJXZlive0q8HiYhwUe39R9DhriwKXzGTt19Axex6TRBEIh0v6FZ/VNjmZEJEKq
 29p7D6jXKU06slB4XfVElIyW949dAdP5cNWjFtpdb6Y+HGh0EuxAIajiGTmcqgxCEt8SmHKk5DH
 rPSIQKzA3HZwk6oIJficJ/t7RwAUo7VE6zTFQ0BY/skXgzwin0D48AfyAeTIJtyzGLRDdFaR18K
 mQB1F47Ks5G89dWYJpsYOzcb6YYlCXKVN1BzsruSmYO0MIfFEt++ssSijsUzaUx3NPEZyR1JFYO
 szCS45D5E4IJuFEZuwlcWr4GUUJQmxp+WwUX9SJ9kCul0K0log1R1X8qH1FWizjlI5Ov9Pv2Fym
 579DH1hjT/dZqKQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Add support for sunxi-ng read-only dividers. This will be
useful to the a733 oscillator detection logic.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/sunxi-ng/ccu_div.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/sunxi-ng/ccu_div.h |  1 +
 drivers/clk/sunxi-ng/ccu_mux.c |  2 +-
 drivers/clk/sunxi-ng/ccu_mux.h |  4 ++++
 4 files changed, 48 insertions(+), 1 deletion(-)

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
index 766f27cff748..775d396ccf31 100644
--- a/drivers/clk/sunxi-ng/ccu_mux.c
+++ b/drivers/clk/sunxi-ng/ccu_mux.c
@@ -68,7 +68,7 @@ unsigned long ccu_mux_helper_apply_prediv(struct ccu_common *common,
 }
 EXPORT_SYMBOL_NS_GPL(ccu_mux_helper_apply_prediv, "SUNXI_CCU");
 
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

