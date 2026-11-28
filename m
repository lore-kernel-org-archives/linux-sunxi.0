Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795858799;
	b=YQ84jZZ2mzLcyAJXZ19KTm3GJjlGK2jV+kcqoE6X9AEiBKZN1+CEfAnFGzem1lBUhwNj
	 gSwB7fFDg5epBch5MnDm/O8Yqak7dQXH55PMF06+G/KZqUZRdcAZ7oNGMFHKbjfRgM9x/
	 E3YWbp3Hd7jPy+rwi5rNRDAyhNl3Q/e/8HF6CZGrKu9Ng6u13yoUXWMsmGT6ps7wtPsrg
	 Rqb7BR4yips/mjeg0mjFxfWU41IE9uqgdXKqk0Nb7U/sxtL5DDooabppGhWWxJQvvMOSk
	 juSOmrXQqjuWO7h+HCsygYSOy+pVb8BnBnQ1FJ71QFyJhbdavh5VtE6oe87gykCvDZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795858799;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=l7FZGp9xH2kLtiUEhQrOK84mZ04vEfjug+fKkzUMnLQ=;
	b=qzznvCXbY824MYxeIPws4X6w7w2UnKCgpH2NBRPi3QL9AKjIIJPTJl8tUQCnb1WRPAmZ
	 QhLdaL3N7jjvcrgwRBZ8+ofClzukSwdhV2LCrjQ348+NcC3o3bbv4j7WN6aRTamBgVSjg
	 5krsYvUgtS7dgSs5l6kF9kF8lMg+P57wAu+OrNt1GwGB9uoRNxaEZqhY8N536YavREdeH
	 S2w8vhOHC5xNpBsV292+Fr4hnOYc8WwlUTps9IipP+Re8DSR4TQMhz+40Y4uMtjACPATl
	 /MKNxV0GSWV9bCZ2X8oL/W0us5/uUFSp6dAcqpcSiJxHCS6xNCgS3K1XFdIIcwLbpjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=ZUp3FM+B;
	arc=none smtp.remote-ip=45.254.49.198
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37650606A326
	for <linux-sunxi@lists.linux.dev>; Sat, 28 Nov 2026 09:39:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37650606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=ZUp3FM+B
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5655b07c6;
	Sat, 28 Nov 2026 17:39:54 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: emilio@elopez.com.ar,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	mripard@kernel.org,
	hansg@kernel.org,
	bbrezillon@kernel.org
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 2/3] clk: sunxi: Unregister the A31 and A23 APB0 platform clocks
Date: Sat, 28 Nov 2026 17:39:53 +0800
Message-ID: <20261128-f81b700d6c-u17-2@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261128-f81b700d6c-u17-0@mail.sdu.edu.cn>
References: <20261128-f81b700d6c-u17-0@mail.sdu.edu.cn>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa2218686e103a1kunm88140372451bdf
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZTkNPVktKT01KTx4ZGEtPGVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=ZUp3FM+BdBtVh8Ru+GFdjUC6jQEY8WlzJOW7U+DXYZqi9ZaWNjrjsoF91ILn8M6DYYTObrgWmVUkKXn/1PEvJm7fD6Hk96iCLNIK9w0qwogKUZ3vRMYfxJrRXNV8TjIpKVfUE/Z8mwv6DIe/i4+NE3yFIPaLj1nFkYI5qLFeNsQ=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=l7FZGp9xH2kLtiUEhQrOK84mZ04vEfjug+fKkzUMnLQ=;
	h=date:mime-version:subject:message-id:from;

The A31 and A23 APB0 platform drivers register a divider backed by a
device-managed mapping. The clock and its OF provider can remain live
after the mapping is released.

Manage both registrations on A31. On A23, pair the platform registration
with removal while keeping the early DT clock independent.

This issue was found by our static analysis tool under development.

Fixes: c8a76cac19ee ("clk: sunxi: add PRCM (Power/Reset/Clock Management) clks support")
Fixes: 57a1fbf28424 ("clk: sunxi: Add A23 APB0 divider clock support")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/clk/sunxi/clk-sun6i-apb0.c | 13 ++++++-------
 drivers/clk/sunxi/clk-sun8i-apb0.c | 13 ++++++++++++-
 2 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/sunxi/clk-sun6i-apb0.c b/drivers/clk/sunxi/clk-sun6i-apb0.c
index f80c67bafe38..a15a2319eee9 100644
--- a/drivers/clk/sunxi/clk-sun6i-apb0.c
+++ b/drivers/clk/sunxi/clk-sun6i-apb0.c
@@ -33,7 +33,7 @@ static int sun6i_a31_apb0_clk_probe(struct platform_device *pdev)
 	const char *clk_name = np->name;
 	const char *clk_parent;
 	void __iomem *reg;
-	struct clk *clk;
+	struct clk_hw *hw;
 
 	reg = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(reg))
@@ -45,13 +45,12 @@ static int sun6i_a31_apb0_clk_probe(struct platform_device *pdev)
 
 	of_property_read_string(np, "clock-output-names", &clk_name);
 
-	clk = clk_register_divider_table(&pdev->dev, clk_name, clk_parent,
-					 0, reg, 0, 2, 0, sun6i_a31_apb0_divs,
-					 NULL);
-	if (IS_ERR(clk))
-		return PTR_ERR(clk);
+	hw = devm_clk_hw_register_divider_table(&pdev->dev, clk_name, clk_parent,
+						0, reg, 0, 2, 0, sun6i_a31_apb0_divs, NULL);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
 
-	return of_clk_add_provider(np, of_clk_src_simple_get, clk);
+	return devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_simple_get, hw);
 }
 
 static const struct of_device_id sun6i_a31_apb0_clk_dt_ids[] = {
diff --git a/drivers/clk/sunxi/clk-sun8i-apb0.c b/drivers/clk/sunxi/clk-sun8i-apb0.c
index f605ecca879f..61d9b8a844af 100644
--- a/drivers/clk/sunxi/clk-sun8i-apb0.c
+++ b/drivers/clk/sunxi/clk-sun8i-apb0.c
@@ -95,7 +95,17 @@ static int sun8i_a23_apb0_clk_probe(struct platform_device *pdev)
 		return PTR_ERR(reg);
 
 	clk = sun8i_a23_apb0_register(np, reg);
-	return PTR_ERR_OR_ZERO(clk);
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+
+	platform_set_drvdata(pdev, clk);
+	return 0;
+}
+
+static void sun8i_a23_apb0_clk_remove(struct platform_device *pdev)
+{
+	of_clk_del_provider(pdev->dev.of_node);
+	clk_unregister_divider(platform_get_drvdata(pdev));
 }
 
 static const struct of_device_id sun8i_a23_apb0_clk_dt_ids[] = {
@@ -109,5 +119,6 @@ static struct platform_driver sun8i_a23_apb0_clk_driver = {
 		.of_match_table = sun8i_a23_apb0_clk_dt_ids,
 	},
 	.probe = sun8i_a23_apb0_clk_probe,
+	.remove = sun8i_a23_apb0_clk_remove,
 };
 builtin_platform_driver(sun8i_a23_apb0_clk_driver);

-- 
2.43.0

