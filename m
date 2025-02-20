Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989AE1F3D3E
	for <linux-sunxi@lists.linux.dev>; Thu, 20 Feb 2025 11:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740051513; cv=none; b=jhSQZnJzDvPCYOtQU46ryP4r/MzYlpKC2pSs0XG5x1JTeU+8BMUCgIy1dXuMFwKPacvooaqcDmjG2P7MV/C6AzwiMnlOCbTcqgzZxcgmD7dfuZ9M1dxLL6OkI7W9JzXHzKegBBMc9bOOR1Af/eM7zMwBoXOYSzZ5g2o0eCi4cSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740051513; c=relaxed/simple;
	bh=+Bz4MMy1JRSDhE2rgB6ML0bRlLGnbn9wbdNBtvLsphQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PDv96iyPOYx6MGuIyiVgUjvTOCJJQZqvDYSkMDH6mw7ZeTaYbTIZWM6EGs4+uBpVis1Eydn1JuZTuukyLc74SBBU2MMqQwGidc0Juc2je6cNmfIvsc+0pxzbMqkMme0f5Ftr283Y1gOD6R3GDQwWpk82xLrZWwbGpRsUEkaJ4BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VG+9vMit; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VG+9vMit"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-abba1b74586so126797066b.2
        for <linux-sunxi@lists.linux.dev>; Thu, 20 Feb 2025 03:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740051510; x=1740656310; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ExfFdnElv6RE+Criap0BQCRCLdiCh0cHD/QHqlYNoyM=;
        b=VG+9vMitjU35dWPKhoaClHCTIrjYNE8vzaYLRuXRAKID7CIM7D6AlPVc1QuEQnbog8
         hTCQ4bnJQJktybS9kfMnHBHsNaNqygsyCBVU1xhcJAUUwBhLsP3aYp6ZICF+HlCMCwyF
         JmwjPNe9dqT/V3+SV+m2OcXOwL9QdYmrC9CqjA1PISBTs3m0mQnv4uPonnH4JxtCliNq
         PHdK1HloeWCmMRujV1TGzoyBwu80+CGWciZldiuDUvPQNdkEeIUBPXCnkhZbKa80NGAm
         Yka9a/ulRWNAn3cQffoH6yZSpi1xkpHvxPKMaNWWRAGO+Umv0IM03fmfzM1WLbfzx5Mi
         SNBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740051510; x=1740656310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ExfFdnElv6RE+Criap0BQCRCLdiCh0cHD/QHqlYNoyM=;
        b=F8K1ngli8fVVtLQ3tVvHosHwB2i2E5jNYBmMSwSqxxWJrOEEFWigSm66gZdqS4VPwj
         PEJHHz/4/cnnU4W5yDXdIYt1vzDx7LsmUDjU1/wI0k2a/U26xnAQQdlfuD5Gnf30YWy/
         2jvyN+H/cPYvUDH314oCEBum2uHxXxiaRuUCwWPc5OGIpaMmxjeq2f1JiDzDQsnaSMm7
         GCHIB7LyTb0pRQ4uH69M5/Awo3OofnfwGwDy7R6YPngljM2VZUK2BS1MBmiC8vYpwG+y
         bHH3TG/Uw7pzVsA/ztZK/Grv/wlbCTjRZczJcNSC5EvFq5Kfp12lM30WNuyLORlqs+kZ
         kOyA==
X-Forwarded-Encrypted: i=1; AJvYcCXDgNY0Um8gtHqYK6+tIMF0coR1jLOajreQFJT1ExT38a46nnXN/2P8k1ezdrkkE2cxRW3sLIvKq4jUvA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyaLnT/nsJccOvnmfZSGdz1tcD0xyRO8RdzVDV0wolNwRPvDhuP
	37IW/8xGe4a6gzRlazu3GPGN36s4vpTomzZzRwKgjl3AxiIW654Y
X-Gm-Gg: ASbGnct1xNK5j0cqDSKKQ+xg+dldbtW7ydEChWaf3XFS2+PJpUA4PWjv/yV6qTyYWsr
	ry/wAlS07TLU69LgNPy33mLAXrz6oppCcQpe15R9Lp1k5nsenC13brtXzYnLf6hCflgkzeC43pU
	fff5LzQQgcN0RC1+k/xpavayAeY6ocaZnsRddQqYTb69LouXttYVSmSQ/pazyyX10xYEppw3XOa
	emk4UWKUdtE+OrSykJuoIYnRIX1OIAhyzIm1OZM+9uG6qB+WtTgQ/SsE9SoPsqkpuZklKkKga65
	4gpvWPL9d6eW7atOUGzEOtXE/RgCigeVI1iBvPYUmrzir46WavXhZMuTT9UKvRafPKWpcv6HmUm
	WSA==
X-Google-Smtp-Source: AGHT+IGjGppdPvcKBaNnCyGcV/by69IhzWTFcP15FubbfmQQ7R/MJ4PUeEtgq7WsyithVWyBUUJNNw==
X-Received: by 2002:a17:907:c02:b0:ab6:d575:9540 with SMTP id a640c23a62f3a-abb70df619emr2280560566b.50.1740051509436;
        Thu, 20 Feb 2025 03:38:29 -0800 (PST)
Received: from localhost.localdomain (146.10-240-81.adsl-dyn.isp.belgacom.be. [81.240.10.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb7200144fsm1047675466b.184.2025.02.20.03.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 03:38:29 -0800 (PST)
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
Cc: Philippe Simons <simons.philippe@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v3 1/1] clk: sunxi-ng: h616: Reparent GPU clock during frequency changes
Date: Thu, 20 Feb 2025 12:38:08 +0100
Message-ID: <20250220113808.1122414-2-simons.philippe@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250220113808.1122414-1-simons.philippe@gmail.com>
References: <20250220113808.1122414-1-simons.philippe@gmail.com>
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
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 36 +++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
index 190816c35..6050cbfa9 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
@@ -328,10 +328,16 @@ static SUNXI_CCU_M_WITH_MUX_GATE(gpu0_clk, "gpu0", gpu0_parents, 0x670,
 				       24, 1,	/* mux */
 				       BIT(31),	/* gate */
 				       CLK_SET_RATE_PARENT);
+
+/*
+ * This clk is needed as a temporary fall back during GPU PLL freq changes.
+ * Set CLK_IS_CRITICAL flag to prevent from being disabled.
+ */
+#define SUN50I_H616_GPU_CLK1_REG        0x674
 static SUNXI_CCU_M_WITH_GATE(gpu1_clk, "gpu1", "pll-periph0-2x", 0x674,
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
+	.common		= &gpu0_clk.common,
+	.cm		= &gpu0_clk.mux,
+	.delay_us	= 1, /* manual doesn't really say */
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
+	 * Set the input-divider for the gpu1 clock to 3, to reach a safe 400 MHz.
+	 */
+	val = readl(reg + SUN50I_H616_GPU_CLK1_REG);
+	val &= ~GENMASK(1, 0);
+	val |= 2;
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

