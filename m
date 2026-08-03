Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC9F369236
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 16:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785773486; cv=none; b=cDbeB/qERUO+YqUndZODRinz8PSRzzw8ZwuttAogtPhG1OcvTbyB1tUmIGQ+rt7d6DQAD0XXmUpJnbvSTAGT8bDgW9im5QZIO66k9UqzjFqQGrI2JuVY19dSsbTFXakXmpm6JjETpfczTkaLWYzq+fqkC9cUaeiHYuQh08GaxRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785773486; c=relaxed/simple;
	bh=fTzsF9nNJWce3JZtECoiuvBAAOYdzetgdaAQeWxNuE8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TWM3kDJdmHdpRR/3ElB2sJ7xVYoblN+4GldtlmvNal2AHVMOJyFSMOYHBFmGvthn782nDeO6yN8xf8cOVTzJCTXwy4Lefkvd+kIjUr50UYlz+TM2Z7Pdt4osNsxK96FZE6LEsiQzkeiQE1jT7axPHtD2/IwSfW1qZJZtVbCJRZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OVaSNeYq; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OVaSNeYq"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49553515a8bso36277505e9.1
        for <linux-sunxi@lists.linux.dev>; Mon, 03 Aug 2026 09:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785773481; x=1786378281; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=65tLrBmDcrjX0P/kWTBoZe536eu486JrEmAUPZ6dfSY=;
        b=OVaSNeYqpIva4rz+O/wy9PWQ5oMHW4CFqS1lcdi0IAjklFjRO5Vq2szv2dmgkrejtx
         JhI+xhwobOc/bf1PKqectIA+f/qQ92b+x1xfsilDp5SkZ6T2iES66AghLHi/NBhu4ejq
         xmFEz06OC5EVKFmkGMG1sk2rJgJScYS8+YZ/OazgrXIf1KekTmku05p214Uo5FK7mVcb
         gT/xnBDHEF6yNaMqaDuHKbO8lo97TpiaWACg4V6L0PlF+uEf3t9rYelLmnS26Zs3mWQZ
         DQF9OyJtcJYu8yxbxTpVIU6eNs9BvpcZu1s+iSu/FDYxYCFAfBKNBWk4VZONV2ndcn8t
         LCBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785773481; x=1786378281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=65tLrBmDcrjX0P/kWTBoZe536eu486JrEmAUPZ6dfSY=;
        b=grsxuYWBrMebcg61K9SRFVs/1OqnJYD2Lqa78txLaT2ySXA30iu+Ssvlnfv5lTtoqr
         zdWzV7lCl5wb3khOCefywK0ZGPtLVyZwiwfmad/vuYo0ZGa3XtVncMm68whKJHPP3Cyw
         QaU7oSqN9zcT784vsnWfyHkLEdkzV0hEQTxrmrKRd4dkraBrT0ucE2JqFetH2oYruGmv
         laVyp1yVacTW5aSgNgOzdPNHD4HKelOfaVz1wVBuQoeT6K/26bEJPwF0XSaqwhE9xXDU
         wiovjumsERozhLGvomYvaGPa9GQ/FU2TBEvealoDok9WbV9en5YrlRV9WXiv64d8FuWy
         nmpQ==
X-Forwarded-Encrypted: i=1; AHgh+RpR3LWiOMxMaZaqo56+nSeReENC0p78pgISh+tapinqNJB5YUH37bqUh9TvK2GBC2dbDeTFk/tRbnecUg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwrSJpPkmRp06GKE5He0BXhAXj5axFrvYlgGGROuehyyOOO/0py
	fyuZx+SF5PVBMU2llGgU8aE2Vf5f6iNERa+b8yhJw5G1z61gOsdPmqZc
X-Gm-Gg: AR+sD12Wb+n7xTdnz0Brc8hWPO4J+7Jn/EpmipF6k8fMXYQlpXz5uzC8kWDluCkPPaL
	NzNoT16Fdrl+4xkrWK7XRVftZwEPjgc5/bZ3wPSD9TOJnXtJkpZ0kQpDOLWo6MLUPFu0fd60BGQ
	Dv99wwpkjL3asRqu+nW9stCodSf6+9xGbraC8jVThMNExNmIngRdIDblXz8Y4aXWMbZ86WdeeTs
	0OaG5HJW6WL5t/dJ/scXhI3tMBiQcnfZfRbJESOXq4bHa6rtV6SlwASWopl465fJhQnra4w682v
	gUB5eJFk2649eWbBWC01PDI0bMUZeTeORR4AbsmV2znNeeIt54wPv03KYtR43WZKYP7HoIKSOEA
	tgpgfwDInl249vOoF0h/+2LPd8rflaH4ZqTR4D5KAml0qpz2sS2gROSkGkEa9k2AnU7P0oB4AWt
	YxBCfOb0Qokp1JbVBlaT0XsDlIXMCRczZbR3ftyFqmIuCwSYRY/wq0rL+c9bYLMDgXN60PXpVK9
	oTDBkooN8UCV4qBbdtmOvlS9sU8n5DpmtD/pOa7DIJzs4QL4H4kb1NbJAi7tfRHohYd5C9CUrjz
	UP6b80Zm1UOawJTmaXKWNfZOBPJkm+wJvCyxzei0tcaSGHCfvWUferDZZc3umwgbHTQQ8JMrwxG
	Chx5GwUSNGDiofwmIqONXN7IoQHMmnc42MFH6pA7p0jP9uQ2WOrsICugP1Cv/w3DeXKZ8zGImtz
	DCnA==
X-Received: by 2002:a05:600c:19cf:b0:495:7a04:b006 with SMTP id 5b1f17b1804b1-4980c66b572mr227085475e9.8.1785773480944;
        Mon, 03 Aug 2026 09:11:20 -0700 (PDT)
Received: from jernej-laptop (APN-122-100-117-gprs.simobil.net. [46.122.100.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fc2da2sm3363735e9.3.2026.08.03.09.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 09:11:20 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@kernel.org
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	samuel@sholland.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 04/13] drm/sun4i: tcon-top: Keep mixer routes distinct
Date: Mon,  3 Aug 2026 18:10:42 +0200
Message-ID: <52eb247169b268054302afa71e598add0b04748d.1785772659.git.jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785772659.git.jernej.skrabec@gmail.com>
References: <cover.1785772659.git.jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both mixer selectors reset to TCON 0. Selecting the same TCON for both
mixers causes black or corrupted output.

When a route would collide, park the other mixer on another described
TCON, or an unused selector if none exists.

Since the TCON index is now used as a shift, also reject negative
values.

Tested on Orange Pi 3 with TCON_LCD0 and TCON_TV0.

Link: https://lore.kernel.org/linux-sunxi/Zn8GVkpwXwhaUFno@titan/
Link: https://lore.kernel.org/linux-sunxi/20241108-tcon_fix-v1-1-616218cc0d5f@jookia.org/
Fixes: 05db311a792d ("drm/sun4i: tcon-top: Add helpers for mux switching")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_tcon_top.c | 71 +++++++++++++++++++++-----
 drivers/gpu/drm/sun4i/sun8i_tcon_top.h |  6 +++
 2 files changed, 65 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
index 8adda578c51b..9cbd655518b2 100644
--- a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
+++ b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
@@ -25,6 +25,49 @@ static bool sun8i_tcon_top_node_is_tcon_top(struct device_node *node)
 	return !!of_match_node(sun8i_tcon_top_of_table, node);
 }
 
+static unsigned int sun8i_tcon_top_get_tcon_map(struct device_node *node)
+{
+	static const u32 out_ports[] = {
+		TCON_TOP_MIXER0_OUT_PORT,
+		TCON_TOP_MIXER1_OUT_PORT,
+	};
+	unsigned int i, map = 0;
+
+	for (i = 0; i < ARRAY_SIZE(out_ports); i++) {
+		struct device_node *port;
+
+		port = of_graph_get_port_by_id(node, out_ports[i]);
+		if (!port)
+			continue;
+
+		for_each_of_graph_port_endpoint(port, ep) {
+			struct of_endpoint endpoint;
+
+			if (of_graph_parse_endpoint(ep, &endpoint))
+				continue;
+
+			if (endpoint.id < TCON_TOP_PORT_TCON_NUM)
+				map |= BIT(endpoint.id);
+		}
+
+		of_node_put(port);
+	}
+
+	return map;
+}
+
+static unsigned int sun8i_tcon_top_park_index(struct sun8i_tcon_top *tcon_top,
+					      int tcon)
+{
+	unsigned int candidates;
+
+	candidates = tcon_top->tcon_map & ~BIT(tcon);
+	if (!candidates)
+		candidates = GENMASK(TCON_TOP_PORT_TCON_NUM - 1, 0) & ~BIT(tcon);
+
+	return ffs(candidates) - 1;
+}
+
 int sun8i_tcon_top_set_hdmi_src(struct device *dev, int tcon)
 {
 	struct sun8i_tcon_top *tcon_top = dev_get_drvdata(dev);
@@ -57,6 +100,7 @@ EXPORT_SYMBOL(sun8i_tcon_top_set_hdmi_src);
 int sun8i_tcon_top_de_config(struct device *dev, int mixer, int tcon)
 {
 	struct sun8i_tcon_top *tcon_top = dev_get_drvdata(dev);
+	u32 mixer_msk, other_msk;
 	unsigned long flags;
 	u32 reg;
 
@@ -70,21 +114,27 @@ int sun8i_tcon_top_de_config(struct device *dev, int mixer, int tcon)
 		return -EINVAL;
 	}
 
-	if (tcon > 3) {
-		dev_err(dev, "TCON index is too high!\n");
+	if (tcon < 0 || tcon >= TCON_TOP_PORT_TCON_NUM) {
+		dev_err(dev, "TCON index is invalid!\n");
 		return -EINVAL;
 	}
 
+	mixer_msk = mixer ? TCON_TOP_PORT_DE1_MSK : TCON_TOP_PORT_DE0_MSK;
+	other_msk = mixer ? TCON_TOP_PORT_DE0_MSK : TCON_TOP_PORT_DE1_MSK;
+
 	spin_lock_irqsave(&tcon_top->reg_lock, flags);
 
 	reg = readl(tcon_top->regs + TCON_TOP_PORT_SEL_REG);
-	if (mixer == 0) {
-		reg &= ~TCON_TOP_PORT_DE0_MSK;
-		reg |= FIELD_PREP(TCON_TOP_PORT_DE0_MSK, tcon);
-	} else {
-		reg &= ~TCON_TOP_PORT_DE1_MSK;
-		reg |= FIELD_PREP(TCON_TOP_PORT_DE1_MSK, tcon);
+
+	reg &= ~mixer_msk;
+	reg |= field_prep(mixer_msk, tcon);
+
+	if (field_get(other_msk, reg) == tcon) {
+		reg &= ~other_msk;
+		reg |= field_prep(other_msk,
+				  sun8i_tcon_top_park_index(tcon_top, tcon));
 	}
+
 	writel(reg, tcon_top->regs + TCON_TOP_PORT_SEL_REG);
 
 	spin_unlock_irqrestore(&tcon_top->reg_lock, flags);
@@ -143,6 +193,7 @@ static int sun8i_tcon_top_bind(struct device *dev, struct device *master,
 		return -ENOMEM;
 	clk_data->num = CLK_NUM;
 	tcon_top->clk_data = clk_data;
+	tcon_top->tcon_map = sun8i_tcon_top_get_tcon_map(dev->of_node);
 
 	spin_lock_init(&tcon_top->reg_lock);
 
@@ -175,10 +226,6 @@ static int sun8i_tcon_top_bind(struct device *dev, struct device *master,
 		goto err_assert_reset;
 	}
 
-	/*
-	 * At least on H6, some registers have some bits set by default
-	 * which may cause issues. Clear them here.
-	 */
 	writel(0, regs + TCON_TOP_PORT_SEL_REG);
 	writel(0, regs + TCON_TOP_GATE_SRC_REG);
 
diff --git a/drivers/gpu/drm/sun4i/sun8i_tcon_top.h b/drivers/gpu/drm/sun4i/sun8i_tcon_top.h
index 0390584a330e..2b887470a49f 100644
--- a/drivers/gpu/drm/sun4i/sun8i_tcon_top.h
+++ b/drivers/gpu/drm/sun4i/sun8i_tcon_top.h
@@ -14,6 +14,10 @@
 #define TCON_TOP_PORT_SEL_REG		0x1C
 #define TCON_TOP_PORT_DE0_MSK			GENMASK(1, 0)
 #define TCON_TOP_PORT_DE1_MSK			GENMASK(5, 4)
+#define TCON_TOP_PORT_TCON_NUM			4
+
+#define TCON_TOP_MIXER0_OUT_PORT		1
+#define TCON_TOP_MIXER1_OUT_PORT		3
 
 #define TCON_TOP_GATE_SRC_REG		0x20
 #define TCON_TOP_HDMI_SRC_MSK			GENMASK(29, 28)
@@ -29,6 +33,8 @@ struct sun8i_tcon_top {
 	void __iomem			*regs;
 	struct reset_control		*rst;
 
+	unsigned int			tcon_map;
+
 	/*
 	 * spinlock is used to synchronize access to same
 	 * register where multiple clock gates can be set.
-- 
2.43.0

