Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EE514BF85
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Sep 2024 11:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725537315; cv=none; b=reXl7lgHWXDGWi3gddNHbUWpoWfNhjhrXPXB7R3g2b6gzCVmyStGwaBUZlcrkHoirXWrR3CSedS9Hgu/soWgV/7VQG3vZzvh9XpR28cAJzVDFtbrhhYyJLQMtMnVmdRE4x17+0MS0m8MtCk3YncBXYiIS2r1+slNiSWtch/G+2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725537315; c=relaxed/simple;
	bh=Ov2Gn+aOZK8f8K0lH/NyQTfYr/oKrhP386BLMQVquoI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RUK1K4Y9g3ZVoKekEPoRtaBQWhssi6U/eb5EJlB9Mx7kJ7HnsK29nbAEJiFLsq+ied0+gXad2Bzw0WP1cykzFAEsE9XSie+lBL8/pcFpmLCHfn3WhU/itvBFtj8M11WFr+EV0YKJSR2ahbQc1FradcuWN23LjE7lpUzANmILLOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4WzyT265lnzyRLk;
	Thu,  5 Sep 2024 19:54:30 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 0F41A1403D4;
	Thu,  5 Sep 2024 19:55:10 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 5 Sep
 2024 19:55:09 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <wens@csie.org>, <jernej.skrabec@gmail.com>, <samuel@sholland.org>,
	<linux-sunxi@lists.linux.dev>
CC: <zhangzekun11@huawei.com>
Subject: [PATCH] bus: sunxi-rsb: Simplify code with dev_err_probe()
Date: Thu, 5 Sep 2024 19:41:34 +0800
Message-ID: <20240905114134.80310-1-zhangzekun11@huawei.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemf500003.china.huawei.com (7.202.181.241)

Use dev_err_probe() directly in the driver probe phase. This can
simplify the code a bit.

Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
---
 drivers/bus/sunxi-rsb.c | 34 +++++++++++++---------------------
 1 file changed, 13 insertions(+), 21 deletions(-)

diff --git a/drivers/bus/sunxi-rsb.c b/drivers/bus/sunxi-rsb.c
index eee41fb798a1..a89d78925637 100644
--- a/drivers/bus/sunxi-rsb.c
+++ b/drivers/bus/sunxi-rsb.c
@@ -751,12 +751,10 @@ static int sunxi_rsb_probe(struct platform_device *pdev)
 	int irq, ret;
 
 	of_property_read_u32(np, "clock-frequency", &clk_freq);
-	if (clk_freq > RSB_MAX_FREQ) {
-		dev_err(dev,
-			"clock-frequency (%u Hz) is too high (max = 20MHz)\n",
-			clk_freq);
-		return -EINVAL;
-	}
+	if (clk_freq > RSB_MAX_FREQ)
+		return dev_err_probe(dev, -EINVAL,
+				     "clock-frequency (%u Hz) is too high (max = 20MHz)\n",
+				     clk_freq);
 
 	rsb = devm_kzalloc(dev, sizeof(*rsb), GFP_KERNEL);
 	if (!rsb)
@@ -774,28 +772,22 @@ static int sunxi_rsb_probe(struct platform_device *pdev)
 		return irq;
 
 	rsb->clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(rsb->clk)) {
-		ret = PTR_ERR(rsb->clk);
-		dev_err(dev, "failed to retrieve clk: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(rsb->clk))
+		return dev_err_probe(dev, PTR_ERR(rsb->clk),
+				     "failed to retrieve clk\n");
 
 	rsb->rstc = devm_reset_control_get(dev, NULL);
-	if (IS_ERR(rsb->rstc)) {
-		ret = PTR_ERR(rsb->rstc);
-		dev_err(dev, "failed to retrieve reset controller: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(rsb->rstc))
+		return dev_err_probe(dev, PTR_ERR(rsb->rstc),
+				     "failed to retrieve reset controller\n");
 
 	init_completion(&rsb->complete);
 	mutex_init(&rsb->lock);
 
 	ret = devm_request_irq(dev, irq, sunxi_rsb_irq, 0, RSB_CTRL_NAME, rsb);
-	if (ret) {
-		dev_err(dev, "can't register interrupt handler irq %d: %d\n",
-			irq, ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "can't register interrupt handler irq %d\n", irq);
 
 	ret = sunxi_rsb_hw_init(rsb);
 	if (ret)
-- 
2.17.1

