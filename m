Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972881BF2B
	for <linux-sunxi@lists.linux.dev>; Sat,  7 Sep 2024 03:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725678095; cv=none; b=ZtluMhJwibKZTt27TcXUm4HdWGkhfnVoyBRonvyzXoMI03BxLvUk+e7ejHf+U7OA0nvl9nrsjPTEYOHC5TOJYBka5/izl9reOTkNOZMjREXss9fkbNL+fSVk1Nym4MtSVutJCVx+dq7XbinOTEGhEEQIB7aS7VNHo3iokHDGd3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725678095; c=relaxed/simple;
	bh=QTU7fufNN1BaBlcJYY1qHswGUbgAx/DUxgQa8eGoits=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SIhZn4qTj2eRZ3FUv2KTVAtMr1Dy/AEQeUWRp4MvmaLnbdXSkUPbxnV68MoNgBvDCgg+LvkFnOuhekO7557OQOnZvtDIeVM2IWxu/ZywieiDYJVKH+3pjPfTqzxbHpv1KBKLKSbW4rR8oN6VINWSWGLYZ3sfb+XsZn8lQaIc6Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4X0yRL2ZlSz20nY1;
	Sat,  7 Sep 2024 10:56:30 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id 5BFA91A0188;
	Sat,  7 Sep 2024 11:01:30 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Sat, 7 Sep
 2024 11:01:29 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <mchehab@kernel.org>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <wens@csie.org>,
	<jernej.skrabec@gmail.com>, <samuel@sholland.org>, <heiko@sntech.de>,
	<yisen.zhuang@huawei.com>, <salil.mehta@huawei.com>, <hauke@hauke-m.de>,
	<alexandre.torgue@foss.st.com>, <joabreu@synopsys.com>,
	<mcoquelin.stm32@gmail.com>, <wellslutw@gmail.com>,
	<radhey.shyam.pandey@amd.com>, <michal.simek@amd.com>, <hdegoede@redhat.com>,
	<ilpo.jarvinen@linux.intel.com>, <lizetao1@huawei.com>,
	<ruanjinjie@huawei.com>, <hverkuil-cisco@xs4all.nl>,
	<u.kleine-koenig@pengutronix.de>, <jacky_chou@aspeedtech.com>,
	<jacob.e.keller@intel.com>
CC: <linux-media@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
	<linux-rockchip@lists.infradead.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<platform-driver-x86@vger.kernel.org>
Subject: [PATCH net-next v2 10/10] net: xilinx: axienet: Convert using devm_clk_get_optional_enabled() in axienet_probe()
Date: Sat, 7 Sep 2024 11:10:09 +0800
Message-ID: <20240907031009.3591057-12-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240907031009.3591057-1-lizetao1@huawei.com>
References: <20240907031009.3591057-1-lizetao1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemd500012.china.huawei.com (7.221.188.25)

Use devm_clk_get_optional_enabled() instead of devm_clk_get_optional() +
clk_prepare_enable(), which can make the clk consistent with the device
life cycle and reduce the risk of unreleased clk resources. Since the
device framework has automatically released the clk resource, there is
no need to execute clk_disable_unprepare(clk) on the error path.

Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 374dff70ef0d..87c5dcec2325 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -2592,22 +2592,17 @@ static int axienet_probe(struct platform_device *pdev)
 	seqcount_mutex_init(&lp->hw_stats_seqcount, &lp->stats_lock);
 	INIT_DEFERRABLE_WORK(&lp->stats_work, axienet_refresh_stats);
 
-	lp->axi_clk = devm_clk_get_optional(&pdev->dev, "s_axi_lite_clk");
-	if (!lp->axi_clk) {
+	lp->axi_clk = devm_clk_get_optional_enabled(&pdev->dev, "s_axi_lite_clk");
+	if (!lp->axi_clk)
 		/* For backward compatibility, if named AXI clock is not present,
 		 * treat the first clock specified as the AXI clock.
 		 */
-		lp->axi_clk = devm_clk_get_optional(&pdev->dev, NULL);
-	}
+		lp->axi_clk = devm_clk_get_optional_enabled(&pdev->dev, NULL);
+
 	if (IS_ERR(lp->axi_clk)) {
 		ret = PTR_ERR(lp->axi_clk);
 		goto free_netdev;
 	}
-	ret = clk_prepare_enable(lp->axi_clk);
-	if (ret) {
-		dev_err(&pdev->dev, "Unable to enable AXI clock: %d\n", ret);
-		goto free_netdev;
-	}
 
 	lp->misc_clks[0].id = "axis_clk";
 	lp->misc_clks[1].id = "ref_clk";
@@ -2923,7 +2918,6 @@ static int axienet_probe(struct platform_device *pdev)
 		axienet_mdio_teardown(lp);
 cleanup_clk:
 	clk_bulk_disable_unprepare(XAE_NUM_MISC_CLOCKS, lp->misc_clks);
-	clk_disable_unprepare(lp->axi_clk);
 
 free_netdev:
 	free_netdev(ndev);
@@ -2947,7 +2941,6 @@ static void axienet_remove(struct platform_device *pdev)
 	axienet_mdio_teardown(lp);
 
 	clk_bulk_disable_unprepare(XAE_NUM_MISC_CLOCKS, lp->misc_clks);
-	clk_disable_unprepare(lp->axi_clk);
 
 	free_netdev(ndev);
 }
-- 
2.34.1

