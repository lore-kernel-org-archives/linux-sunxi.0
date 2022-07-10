Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FE7187D
	for <linux-sunxi@lists.linux.dev>; Sun, 10 Jul 2022 17:52:40 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id h17so4439000wrx.0
        for <linux-sunxi@lists.linux.dev>; Sun, 10 Jul 2022 10:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AeSUffjgrxLIDrHX0WRm/GzkZY58B1bVWJKIzfHMVqY=;
        b=Fx0xAcxQswDl6PZOZPn4Ig2Gi+z8tQ3eW9sjga5TlDz1ubNvvqGiBOz+y61CqBBRrG
         7rtnn+Sw8cpEQvDGJeAhqBOD2vpmj0W+qQamEdEDi+vSGoGM2WYrTOozWjIRgwlYwtTH
         6MfIw+1j+v1FJsv8wmAWP03om3TOARE3okCdLHnzZoVhfe95oH++xbARRkV/iuvd7bO1
         vuYRUpxD0kMucxII8XXDqzNB1lTZ5so7rodpfMJXSLM3aCUofra54ax6iITHa5BTOes7
         8iviher/DChZKOOk2kr2wpZ0HjbcsbHAVb/L7+/mFqPcnWEzJLftQhpIAp9eJCEoPRKC
         vlBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AeSUffjgrxLIDrHX0WRm/GzkZY58B1bVWJKIzfHMVqY=;
        b=5GR9K+TrHokoctqDIuR/pJyzeK9QTi86Zro9xC9D8NIqO/8/l0w/ND7TYIpzpvM/yF
         46ceTDogPS2OEtUKAqsyCh23JcXlTiPv4gZL/Rwu+gLsYQ3RIqN8IvWkhnNR1BjqsUvQ
         hHhDR4XZF2w3kVNMWzTJHvQWJIjLBXbE1ajJePaeMTIn2fcDwZFmTm2GlxdnekNBA/iX
         tFrbZOs0PEZKX/fNNTQkwFBbYfdd/PDHQJNWTJnaWl7CLgvAS1X4EHt6ctc0bO0LMdh6
         o21gZ6j62+BfMfVHa28DUBCgYy2ikz9uki+Ts1d5CmJDUqi7ftR/P3xh6u8hBED75jR1
         kxFg==
X-Gm-Message-State: AJIora9oU7KzqhQi/NAH6YMa1/VJ6dszKSLlj5bAJK3JflDirmOuyiHq
	7Nx5w7xwmINYOu3Y8CLBGcs=
X-Google-Smtp-Source: AGRyM1tO70VRNWP+zx9h+dZMqVSgs/r1nVqGy2ngqLU80XsFfk9kYgm6wOt2MUcya3rcsubm/NQJDA==
X-Received: by 2002:a5d:6dab:0:b0:21d:9fc8:3029 with SMTP id u11-20020a5d6dab000000b0021d9fc83029mr4189820wrs.172.1657475558497;
        Sun, 10 Jul 2022 10:52:38 -0700 (PDT)
Received: from roman-Latitude-3400.globallogic.com ([195.234.74.2])
        by smtp.gmail.com with ESMTPSA id c8-20020a7bc848000000b003a2e7c13a3asm840346wml.42.2022.07.10.10.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 10:52:38 -0700 (PDT)
From: Roman Stratiienko <r.stratiienko@gmail.com>
To: samuel@sholland.org
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	mripard@kernel.org,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Roman Stratiienko <r.stratiienko@gmail.com>
Subject: [RFC] ccu-sun50i-h6: Bump-up DDR0 PLL to 1800MHz
Date: Sun, 10 Jul 2022 20:52:14 +0300
Message-Id: <20220710175214.544748-1-r.stratiienko@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While debugging complex animated composition cases  I noticed a glitch
which as it turned-out eventually was caused by lack of memory bandwidth.

I can't find a DRAMC manual to check what input frequency must be
supplied to avoid exceeding the 800MHz LPDDR3 which is installed on
my orangepi3 board. But the system is running stable so far.

Signed-off-by: Roman Stratiienko <r.stratiienko@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun50i-h6.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h6.c b/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
index 750368a86b8b6..abdde80307993 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
@@ -1203,6 +1203,17 @@ static int sun50i_h6_ccu_probe(struct platform_device *pdev)
 	val &= ~GENMASK(3, 0);
 	writel(val, reg + gpu_clk.common.reg);
 
+	/*
+	 * Increase DDR0 PLL from 1488(default) to 1800MHz.
+	 * (DE3.0 require higher memory bandwidth while displaying
+	 * complex composition at 1920x1080@60FPS)
+	 */
+
+	val = readl(reg + SUN50I_H6_PLL_DDR0_REG);
+	val &= ~GENMASK(15, 0);
+	val |= 74 << 8;
+	writel(val, reg + SUN50I_H6_PLL_DDR0_REG);
+
 	/* Enable the lock bits on all PLLs */
 	for (i = 0; i < ARRAY_SIZE(pll_regs); i++) {
 		val = readl(reg + pll_regs[i]);
-- 
2.34.1

