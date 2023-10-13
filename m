Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1425A23741
	for <linux-sunxi@lists.linux.dev>; Fri, 13 Oct 2023 18:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VKABW2vK"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40566f8a093so24456805e9.3
        for <linux-sunxi@lists.linux.dev>; Fri, 13 Oct 2023 11:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697221050; x=1697825850; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U9nTHaFndFfh4gMEpmSZ2pg3B4FHQG8rnUIGTQ2gc1Q=;
        b=VKABW2vKV6xGaqeRApwhkpTsZ9zinnEa1dfzeokQ1Z/iUutDvK3tvCnvZeOdRMVe9v
         XCDrESoc4noaGFYulw9q1/ByDKGifowkC9WQz3eiTzR2voJiDRyVUjA+uvqbkkuyfBoP
         j0HYFS6xTbsqtutt6kvJ88ECUSZitWhq4DKN7GhOsq28D/FfdNxyNy5wjyjb/YffBiRe
         iii9Cj/9P+Rx8NFqheNF88aU+XDBPJ/fe86FluyLYznna/RYmK9f3K/dIg7o8r4YVvhC
         SySNsi3K8BFpjx4wOg//3V2xwX4hDw53MlZy+iX/ZQdaW69OIjx2yOthZTebTY2tgLVp
         q4MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697221050; x=1697825850;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U9nTHaFndFfh4gMEpmSZ2pg3B4FHQG8rnUIGTQ2gc1Q=;
        b=ECjfP2XgEH1hOkMtYldv4DK0Pf2mSjhcsPlpmiL/Oc2FMhKVpEpTiwQ8kcglXkhouv
         T6wyxXI7EkDZ3GKAkoGT9GjmEV1oAqvuF4vQxDSEbyoZZleshYlZMzpgnfw3pc9wyWnv
         lIgbIOn+T1tqLtRiohtpLxeeY626ObdWC03gBrHlMDo2bRGMjxhzXDyKcSICwRGbaLrs
         swFBQZ2rAXBiN+TkLmX1ZculNtjuH3h8cGWcbZsm4J/FhVyhR2h8CnSQRZoSyEM4i1Kj
         kgNxBlnzQa6/BV9PYwEo6FSO4oEzZMl9uAzwAIgtaWLMz4tslLbUHlYh9jriV8OkLFyp
         unkg==
X-Gm-Message-State: AOJu0YxoO0PZ20xlibrdorp4u97jwI/E30i/3A6a3/1P0eNE9BaER33c
	TBq7dcfx3unaAtW1dW4zdHwj69f1l7qyuw==
X-Google-Smtp-Source: AGHT+IEMQY+8CQG2bWBaKCxftHAZJe3ebRiK21zhKCFBNlUyZOjkFnTF7uZ1aniwLQKOsBk9CH5xOA==
X-Received: by 2002:a05:600c:3586:b0:406:849c:52c3 with SMTP id p6-20020a05600c358600b00406849c52c3mr23139477wmq.22.1697221049878;
        Fri, 13 Oct 2023 11:17:29 -0700 (PDT)
Received: from localhost.localdomain ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id r8-20020a05600c458800b004064cd71aa8sm800127wmo.34.2023.10.13.11.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 11:17:29 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org,
	samuel@sholland.org
Cc: sboyd@kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chad Wagner <wagnerch42@gmail.com>
Subject: [PATCH] clk: sunxi-ng: h6: Reparent CPUX during PLL CPUX rate change
Date: Fri, 13 Oct 2023 20:17:12 +0200
Message-ID: <20231013181712.2128037-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While PLL CPUX clock rate change when CPU is running from it works in
vast majority of cases, now and then it causes instability. This leads
to system crashes and other undefined behaviour. After a lot of testing
(30+ hours) while also doing a lot of frequency switches, we can't
observe any instability issues anymore when doing reparenting to stable
clock like 24 MHz oscillator.

Fixes: 524353ea480b ("clk: sunxi-ng: add support for the Allwinner H6 CCU")
Reported-by: Chad Wagner <wagnerch42@gmail.com>
Link: https://forum.libreelec.tv/thread/27295-orange-pi-3-lts-freezes/
Tested-by: Chad Wagner <wagnerch42@gmail.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun50i-h6.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h6.c b/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
index 42568c616181..892df807275c 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
@@ -1181,11 +1181,18 @@ static const u32 usb2_clk_regs[] = {
 	SUN50I_H6_USB3_CLK_REG,
 };
 
+static struct ccu_mux_nb sun50i_h6_cpu_nb = {
+	.common		= &cpux_clk.common,
+	.cm		= &cpux_clk.mux,
+	.delay_us       = 1,
+	.bypass_index   = 0, /* index of 24 MHz oscillator */
+};
+
 static int sun50i_h6_ccu_probe(struct platform_device *pdev)
 {
 	void __iomem *reg;
+	int i, ret;
 	u32 val;
-	int i;
 
 	reg = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(reg))
@@ -1252,7 +1259,15 @@ static int sun50i_h6_ccu_probe(struct platform_device *pdev)
 	val |= BIT(24);
 	writel(val, reg + SUN50I_H6_HDMI_CEC_CLK_REG);
 
-	return devm_sunxi_ccu_probe(&pdev->dev, reg, &sun50i_h6_ccu_desc);
+	ret = devm_sunxi_ccu_probe(&pdev->dev, reg, &sun50i_h6_ccu_desc);
+	if (ret)
+		return ret;
+
+	/* Reparent CPU during PLL CPUX rate changes */
+	ccu_mux_notifier_register(pll_cpux_clk.common.hw.clk,
+				  &sun50i_h6_cpu_nb);
+
+	return 0;
 }
 
 static const struct of_device_id sun50i_h6_ccu_ids[] = {
-- 
2.42.0

