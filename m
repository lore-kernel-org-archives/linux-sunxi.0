Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426EA25A333
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Feb 2025 17:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739381808; cv=none; b=sQOrycSCbJ5mvquSt5GqpXXQpzVIbcb+wmjZa+w3WSj1WUfMoaobCVRIHBA/xc8bqVj3bShJ3AgXNSoMubmkXLTBWFSrvUI9DIDgCf/YJ/Ddok4RSNt/XKADtmIPxdDtXVWRGShnlpfvo/VNtm9s5CW57vm5h5zDWWJIwXav3TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739381808; c=relaxed/simple;
	bh=F9wiijtTYA6qqPa8iyHu/cykIH+jWU/oHC3FG3o4qGY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oPI9PTWGCmWaPZU7y9OEu12wL728B41W0qCdmB6TCcjUxTk4nlPRZf9SYAVSyJFCXc52NdqqvucUzSfCn689k1s+6PxHu6WvcxWC1UX96uET/gazEsSpaovv4ZQMHlJPV30urozT1IgCEdFdsGq9Jbwkq2PqQ5ju615vEBlcfS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SeiMst1z; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SeiMst1z"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ab7430e27b2so5313266b.3
        for <linux-sunxi@lists.linux.dev>; Wed, 12 Feb 2025 09:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739381804; x=1739986604; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5HOAmeZSd8XozBfBj4jNyXC9XonCoX2cwbZMmLfFjDQ=;
        b=SeiMst1zZH/vIoWivN15+8tmQ08Mqr8M358xduChaNBIIGwCdUyyNyHgn3Xi1T+s6D
         Wh7D1LFp8jfNYW3R5uLCDNeX/XQjqmWu6eHEnfzEYRW5sa7vHRP/ENkZIDxx0AahycVv
         PL4Ui0tH31TgmFon3duYN5/KSuGA5zufDu/PknMCvH2aX8uivcC4U15IZaFdvB4635X6
         RNH2wyArTVvtbyqwD+pX/0xQW7xi2EqgkDt2qN71Yc1zk5XmKTPGdz78Kb5BhggkAr0R
         zqyaFoLKYL86qdNfevNAY8JaIqlHyGA4Jaa+OkGewtS5B/3u2M9FYKttjeGtUFlqZXsJ
         Vlxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739381804; x=1739986604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5HOAmeZSd8XozBfBj4jNyXC9XonCoX2cwbZMmLfFjDQ=;
        b=wfOaU6mQ53L8rL87gaHyjPpuGWQJTs5n8PaQjZvL0SHZnf8BXMGfwG59eczLDICrnn
         9q5yeL+DURnChzc1Rac50inW/RDTjUtVWZ59TzU+/K2v9w/jYOOQVOWZokwzwxOPj1kl
         vey1T0t5VfA9b31m/QSAW62apFpxtA8RxapT/AQHDMsJBKU4rRkEXwRAZ3appeSz6Ih0
         16C9bciIS7LqfinO7JT//ImIeJHWKxlVLBxf5R9KyykGVsvZ9SRZW+8sOW4EMqKxg+Ow
         07YUTIg34JvJnSbvg+xa2ETJ4QrqFslcag7HdhPguXmtVcADxHd9BZJ0GARpnk9B73Xv
         0IVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWG8p4Ma+B7472GFFCrIqkiozCDjuYT1xcbU7NIdzQtm9SDZMarJ/2owtcRqL0zKIiSnHnpMXY4bfZ4lw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwbiwGl9kAAICrmRmTOZssYuuqdLLCefzoofc9bqgt3L1lVLp/u
	hrRBiIriWwXn9D6pdJ8ovbE9yqb5Fci9nnmLQQKQc7rBchHJ6Nvs
X-Gm-Gg: ASbGncsaZ86Ya6Qxmc6bynCbRdQoG66I4N9+NARLM8VlARhCOf0HmLezc2Tj6DfKkNp
	L2jBQEv6kAXVPAUA63RzmM6d/CZetvTvwU7bK7bY+nGZhv/lKhJheqN3n0oFfzyJ45ehHPPINJo
	Ad9jIJETdYDMSjWehcBfE7BJPYMhV/H440qVWV6NA+ExPBtddA2DrWyez+nfgEHnnr/3rQkoz9A
	Uo/xRHXWhkjnwO/VkOp0WbU5jFLNumqKnBCS98GHjj+kvF6liLgX5a31QehCfLbjr/y4PsxBpOE
	kZPS3taiO5Zm3Q1phTFx11TKaXi67u/qIFGamtKPDUJupP2lFeLageQ40uEXWQIAXJsYGUaGrMs
	F/w==
X-Google-Smtp-Source: AGHT+IHDCBgJfM+/ys0ROHnLWBIi5z2k0taelB9+5yUdQur2jxtf7oYUmNm/5oCfY1oM9+jShWu3Ig==
X-Received: by 2002:a17:907:971f:b0:ab6:511d:8908 with SMTP id a640c23a62f3a-ab7f34a0f04mr350523966b.40.1739381804140;
        Wed, 12 Feb 2025 09:36:44 -0800 (PST)
Received: from localhost.localdomain (146.10-240-81.adsl-dyn.isp.belgacom.be. [81.240.10.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7d18e006csm500162466b.52.2025.02.12.09.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 09:36:43 -0800 (PST)
From: Philippe Simons <simons.philippe@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi SoC support),
	linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Philippe Simons <simons.philippe@gmail.com>
Subject: [PATCH v2] clk: sunxi-ng: h616: Reparent GPU clock during frequency changes
Date: Wed, 12 Feb 2025 18:36:39 +0100
Message-ID: <20250212173640.396404-1-simons.philippe@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The H616 manual does not state that the GPU PLL supports
dynamic frequency configuration, so we must take extra care when changing
the frequency. Currently any attempt to do device DVFS on the GPU lead
to panfrost various ooops, and GPU hangs.

The manual describes the algorithm for changing the PLL
frequency, which the CPU PLL notifier code already support, so we reuse
that to reparent the GPU clock to GPU1 clock during frequency
changes.

Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 38 ++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
index 190816c35..884f9a6b5 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
@@ -328,10 +328,16 @@ static SUNXI_CCU_M_WITH_MUX_GATE(gpu0_clk, "gpu0", gpu0_parents, 0x670,
 				       24, 1,	/* mux */
 				       BIT(31),	/* gate */
 				       CLK_SET_RATE_PARENT);
-static SUNXI_CCU_M_WITH_GATE(gpu1_clk, "gpu1", "pll-periph0-2x", 0x674,
+
+/*
+ * This clk is needed as a temporary fall back during GPU PLL freq changes.
+ * Set CLK_IS_CRITICAL flag to prevent from being disabled.
+ */
+ #define SUN50I_H616_GPU_CLK1_REG        0x674
+ static SUNXI_CCU_M_WITH_GATE(gpu1_clk, "gpu1", "pll-periph0-2x", 0x674,
 					0, 2,	/* M */
 					BIT(31),/* gate */
-					0);
+					CLK_IS_CRITICAL);
 
 static SUNXI_CCU_GATE(bus_gpu_clk, "bus-gpu", "psi-ahb1-ahb2",
 		      0x67c, BIT(0), 0);
@@ -1120,6 +1126,19 @@ static struct ccu_pll_nb sun50i_h616_pll_cpu_nb = {
 	.lock		= BIT(28),
 };
 
+static struct ccu_mux_nb sun50i_h616_gpu_nb = {
+	.common			= &gpu0_clk.common,
+	.cm				= &gpu0_clk.mux,
+	.delay_us		= 1, /* manual doesn't really say */
+	.bypass_index	= 1, /* GPU_CLK1@400MHz */
+};
+
+static struct ccu_pll_nb sun50i_h616_pll_gpu_nb = {
+	.common		= &pll_gpu_clk.common,
+	.enable		= BIT(29),	/* LOCK_ENABLE */
+	.lock		= BIT(28),
+};
+
 static int sun50i_h616_ccu_probe(struct platform_device *pdev)
 {
 	void __iomem *reg;
@@ -1170,6 +1189,14 @@ static int sun50i_h616_ccu_probe(struct platform_device *pdev)
 	val |= BIT(0);
 	writel(val, reg + SUN50I_H616_PLL_AUDIO_REG);
 
+	/*
+	 * Set the input-divider for the gpu1 clock to 3.
+	 */
+	val = readl(reg + SUN50I_H616_GPU_CLK1_REG);
+	val &= ~GENMASK(1, 0);
+	val |= BIT(1);
+	writel(val, reg + SUN50I_H616_GPU_CLK1_REG);
+
 	/*
 	 * First clock parent (osc32K) is unusable for CEC. But since there
 	 * is no good way to force parent switch (both run with same frequency),
@@ -1190,6 +1217,13 @@ static int sun50i_h616_ccu_probe(struct platform_device *pdev)
 	/* Re-lock the CPU PLL after any rate changes */
 	ccu_pll_notifier_register(&sun50i_h616_pll_cpu_nb);
 
+	/* Reparent GPU during GPU PLL rate changes */
+	ccu_mux_notifier_register(pll_gpu_clk.common.hw.clk,
+				  &sun50i_h616_gpu_nb);
+
+	/* Re-lock the GPU PLL after any rate changes */
+	ccu_pll_notifier_register(&sun50i_h616_pll_gpu_nb);
+
 	return 0;
 }
 
-- 
2.48.1

