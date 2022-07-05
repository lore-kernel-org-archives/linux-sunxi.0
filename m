Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0362917
	for <linux-sunxi@lists.linux.dev>; Tue,  5 Jul 2022 07:52:41 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id y4so843447edc.4
        for <linux-sunxi@lists.linux.dev>; Tue, 05 Jul 2022 00:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sVHg27tFoCVvZZIXk/W94pwI0Pu4JuMAc/g2EqD7c8I=;
        b=CYr0HGCmIpU9tGWD2SZn/cCWxwGIhI4vSE7yNrw3jvX35pfLMdSuYkZn+aRhaqQrFV
         wUiljZdTSAT1Qphe09CajjMcNNRnZoLQSqWUKN1dMnHSybQYHCj3DH3pcjcsCdGXP3h4
         vRrOrUL/ZBeuYpPmACPFsXqQQ4JoJPDo39HZESMHB4X9FK5g8U1lc8GpTJodXm6wYMBm
         WXKMtYKcvuL5bvqEQIkvfYmthZXs6zyeHrhVlUJgdud1+zK863uHkFMZ31enqw6dzC6E
         Z7ct5el9AqIuEb3hN5YuEEBBqV/EDTCCDFAeCDmBJcQm1R3ghLtwg+wQ1sY+z6zxdQLl
         bpcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sVHg27tFoCVvZZIXk/W94pwI0Pu4JuMAc/g2EqD7c8I=;
        b=lVj145OrUJf5hkbqHuA/DYG9FESIbxhGi3iinyVMHuUYtvbTkdCjfepGQVZzcbUbmq
         Jbp20YbpzpCKTaOXXyv7H+kPXmmg4U7b8NHUGlK8fA6alJ6U+72d9ydbBpXyVXaL3r7t
         utkuDbVTpPpXEWctesYUz6gF8bCnwGSJzHnvzlZe7n/4QLIb+KK8Bc4ZOLEYjuAsOgDm
         AV26F8uD60lT43sbmUnt0956qy+2KkeI8e8KiwoeFrqLmyowochiKafE9DCuIKv6I0o8
         7qM9SoGklhpLDnvhyFwLlwhLaiAEthXjbeHTjHQytbj9I6K4/bklG6lnhlzqG++oNLo+
         NVow==
X-Gm-Message-State: AJIora/AO4glTQN85gijGrA/zvmPHEeZHYrTjn2lFMhFIsAVBs4sKoDi
	HA2o8PJkCNzj2DY6WG4atVI=
X-Google-Smtp-Source: AGRyM1vYJUa7eNnjIo+BOJ3SwH3f9c/JjmwfxHh5ctJZ51DjW1EJTxHpL1HA2YYhSpMihoKRCuag0g==
X-Received: by 2002:a05:6402:4414:b0:434:f58c:ee2e with SMTP id y20-20020a056402441400b00434f58cee2emr43708933eda.362.1657007560160;
        Tue, 05 Jul 2022 00:52:40 -0700 (PDT)
Received: from roman-Latitude-3400.globallogic.com ([195.234.74.2])
        by smtp.gmail.com with ESMTPSA id q17-20020a17090676d100b0072aac7446edsm4171579ejn.41.2022.07.05.00.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 00:52:39 -0700 (PDT)
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
Subject: [PATCH v3] clk: sunxi-ng: sun50i: h6: Modify GPU clock configuration to support DFS
Date: Tue,  5 Jul 2022 10:52:26 +0300
Message-Id: <20220705075226.359475-1-r.stratiienko@gmail.com>
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

V3:
- Adjust comments
---
 drivers/clk/sunxi-ng/ccu-sun50i-h6.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h6.c b/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
index 2ddf0a0da526f..068d1a6b2ebf3 100644
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
 
+	/* Force PLL_GPU output divider bits to 0 */
+	val = readl(reg + SUN50I_H6_PLL_GPU_REG);
+	val &= ~BIT(0);
+	writel(val, reg + SUN50I_H6_PLL_GPU_REG);
+
+	/* Force GPU_CLK divider bits to 0 */
+	val = readl(reg + gpu_clk.common.reg);
+	val &= ~GENMASK(3, 0);
+	writel(val, reg + gpu_clk.common.reg);
+
 	/* Enable the lock bits on all PLLs */
 	for (i = 0; i < ARRAY_SIZE(pll_regs); i++) {
 		val = readl(reg + pll_regs[i]);
-- 
2.34.1

