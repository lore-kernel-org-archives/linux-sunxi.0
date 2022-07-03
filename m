Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF70B2900
	for <linux-sunxi@lists.linux.dev>; Sun,  3 Jul 2022 16:45:21 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id c65so8878176edf.4
        for <linux-sunxi@lists.linux.dev>; Sun, 03 Jul 2022 09:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wZQhKx9SjXxkWX48wKaFbg88ONnAqEtjEs7NMWwsCnU=;
        b=EjLWg73jFzDraq4SdUK7FbyNFRuxWOhkrwH01sGFxQ35i0DgGBa7cGvr/A8riyYh7J
         RbnML4mM3HMpyZdyBYUPZLRanrcCrlI7G3YRSpkg5mSrBCDhlN4ZNy436klmr3UcF13T
         beHiMxFsIkz7PWbQ7QedO2nOJ3jjSR4ovrQ5ZzS64fz6o6pVl4Pct4ZcRjoA5yiNMhbh
         R4TZpKXhye4o3JxPnGwskd4jhwt/FkAXaMmiTyRxBmyj3pBjlEq/M70gVz6GKvhfWImJ
         +NtqyzWisgLN+rNitkIFBsRVadYm/9JVx8Hscm8Wr2MRvOEZopA5CKYjxg2wrRPrRH+2
         vjMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wZQhKx9SjXxkWX48wKaFbg88ONnAqEtjEs7NMWwsCnU=;
        b=sxBKJR0sgjkdxoheJnf+2ZTMlVZ2NYt/HNZUW3ZruKsLl9U1oaXxrz/5n/CdmYIWvN
         JWL+03/ZyYBfbt4bqB7taSdgcvZeHdwh2MH8Rf2wLEBS1W4d6BIfw4cDFOKOadFFP55e
         j1b5Hkj1Vjs01nCGNVNn2/a/lcImkqPQtiHovUD1ydLuX5aFewO/6UhATNtwtNJ/dBRz
         BD8I04cFe6bVXGfTjZlBEE/YDj2yttOElHrMRsUrNWT2g5oo8gjLRolay70ICuTeRS0N
         9E5D81ITep4dz/YUiTNSptYRETpbh4bF06KTPSrvN1NUHkqeBfC0dnY1fB8GFQlkrtxb
         Flfw==
X-Gm-Message-State: AJIora9K3ZH/gg5Y7QZvRiG8FdFLZUaAi5RocY+Tpr3LmbrqJGub7MB0
	v1B4S7NFnrlwKCvijrENIwY=
X-Google-Smtp-Source: AGRyM1t66LubiO0Cb82rTm9ghCFTx32xDqw1VqAB+JHGRmSfBJQ4ErMe9BmQthqQfggri7r2dqiQNw==
X-Received: by 2002:a05:6402:5388:b0:435:71b:5d44 with SMTP id ew8-20020a056402538800b00435071b5d44mr32155726edb.364.1656866719893;
        Sun, 03 Jul 2022 09:45:19 -0700 (PDT)
Received: from roman-Latitude-3400.globallogic.com ([195.234.74.2])
        by smtp.gmail.com with ESMTPSA id kw25-20020a170907771900b0072aa38d8938sm2263239ejc.149.2022.07.03.09.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 09:45:19 -0700 (PDT)
From: Roman Stratiienko <r.stratiienko@gmail.com>
To: samuel@sholland.org
Cc: peron.clem@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	mripard@kernel.org,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Roman Stratiienko <r.stratiienko@gmail.com>
Subject: [PATCH v2] clk: sunxi-ng: sun50i: h6: Modify GPU clock configuration to support DFS
Date: Sun,  3 Jul 2022 19:45:14 +0300
Message-Id: <20220703164514.308622-1-r.stratiienko@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using simple bash script it was discovered that not all CCU registers
can be safely used for DFS, e.g.:

    while true
    do
        devmem 0x3001030 4 0xb0003e02
        devmem 0x3001030 4 0xb0001e02
    done

Script above changes the GPU_PLL multiplier register value. While the
script is running, the user should interact with the user interface.

Using this method the following results were obtained:

| Register  | Name           | Bits  | Values | Result |
| --        | --             | --    | --     | --     |
| 0x3001030 | GPU_PLL.MULT   | 15..8 | 20-62  | OK     |
| 0x3001030 | GPU_PLL.INDIV  |     1 | 0-1    | OK     |
| 0x3001030 | GPU_PLL.OUTDIV |     0 | 0-1    | FAIL   |
| 0x3001670 | GPU_CLK.DIV    |  3..0 | ANY    | FAIL   |

DVFS started to work seamlessly once dividers which caused the
glitches were set to fixed values.

Signed-off-by: Roman Stratiienko <r.stratiienko@gmail.com>

---

Changelog:

V2:
- Drop changes related to mux
- Drop frequency limiting
- Add unused dividers initialization
---
 drivers/clk/sunxi-ng/ccu-sun50i-h6.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h6.c b/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
index 2ddf0a0da526f..1b0205ff24108 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
@@ -95,13 +95,13 @@ static struct ccu_nkmp pll_periph1_clk = {
 	},
 };
 
+/* For GPU PLL, using an output divider for DFS causes system to fail */
 #define SUN50I_H6_PLL_GPU_REG		0x030
 static struct ccu_nkmp pll_gpu_clk = {
 	.enable		= BIT(31),
 	.lock		= BIT(28),
 	.n		= _SUNXI_CCU_MULT_MIN(8, 8, 12),
 	.m		= _SUNXI_CCU_DIV(1, 1), /* input divider */
-	.p		= _SUNXI_CCU_DIV(0, 1), /* output divider */
 	.common		= {
 		.reg		= 0x030,
 		.hw.init	= CLK_HW_INIT("pll-gpu", "osc24M",
@@ -294,9 +294,9 @@ static SUNXI_CCU_M_WITH_MUX_GATE(deinterlace_clk, "deinterlace",
 static SUNXI_CCU_GATE(bus_deinterlace_clk, "bus-deinterlace", "psi-ahb1-ahb2",
 		      0x62c, BIT(0), 0);
 
+/* Keep GPU_CLK divider const to avoid DFS instability. */
 static const char * const gpu_parents[] = { "pll-gpu" };
-static SUNXI_CCU_M_WITH_MUX_GATE(gpu_clk, "gpu", gpu_parents, 0x670,
-				       0, 3,	/* M */
+static SUNXI_CCU_MUX_WITH_GATE(gpu_clk, "gpu", gpu_parents, 0x670,
 				       24, 1,	/* mux */
 				       BIT(31),	/* gate */
 				       CLK_SET_RATE_PARENT);
@@ -1193,6 +1193,16 @@ static int sun50i_h6_ccu_probe(struct platform_device *pdev)
 	if (IS_ERR(reg))
 		return PTR_ERR(reg);
 
+	/* Force PLL_GPU output divider to 0 */
+	val = readl(reg + SUN50I_H6_PLL_GPU_REG);
+	val &= ~BIT(0);
+	writel(val, reg + SUN50I_H6_PLL_GPU_REG);
+
+	/* Force GPU_CLK divider to 0 */
+	val = readl(reg + gpu_clk.common.reg);
+	val &= ~GENMASK(3, 0);
+	writel(val, reg + gpu_clk.common.reg);
+
 	/* Enable the lock bits on all PLLs */
 	for (i = 0; i < ARRAY_SIZE(pll_regs); i++) {
 		val = readl(reg + pll_regs[i]);
-- 
2.34.1

