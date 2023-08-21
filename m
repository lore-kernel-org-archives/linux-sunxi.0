Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573B6EA1
	for <linux-sunxi@lists.linux.dev>; Mon, 21 Aug 2023 03:18:07 +0000 (UTC)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RTd1H16KRzrSDK;
	Mon, 21 Aug 2023 11:16:35 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Mon, 21 Aug
 2023 11:18:00 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <miquel.raynal@bootlin.com>
CC: <alexandre.torgue@foss.st.com>, <angelogioacchino.delregno@collabora.com>,
	<christophe.kerello@foss.st.com>, <christophe.leroy@csgroup.eu>,
	<dmitry.torokhov@gmail.com>, <frank.li@vivo.com>, <geert+renesas@glider.be>,
	<heiko@sntech.de>, <jernej.skrabec@gmail.com>, <jinpu.wang@ionos.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-mtd@lists.infradead.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-sunxi@lists.linux.dev>, <lizetao1@huawei.com>,
	<martin.blumenstingl@googlemail.com>, <matthias.bgg@gmail.com>,
	<mcoquelin.stm32@gmail.com>, <michael@walle.cc>, <michal.simek@amd.com>,
	<paul@crapouillou.net>, <philmd@linaro.org>, <pratyush@kernel.org>,
	<richard@nod.at>, <robh@kernel.org>, <rogerq@kernel.org>,
	<samuel@sholland.org>, <stefan@agner.ch>, <tudor.ambarus@linaro.org>,
	<u.kleine-koenig@pengutronix.de>, <vigneshr@ti.com>, <vz@mleia.com>,
	<wens@csie.org>, <yangyingliang@huawei.com>
Subject: [PATCH -next v3 07/12] mtd: rawnand: mtk: Use helper function devm_clk_get_enabled()
Date: Mon, 21 Aug 2023 11:17:32 +0800
Message-ID: <20230821031737.1973183-8-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230821031737.1973183-1-lizetao1@huawei.com>
References: <20230818101004.4f2cd343@xps-13>
 <20230821031737.1973183-1-lizetao1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected

Since commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepared
and enabled clocks"), devm_clk_get() and clk_prepare_enable() can now be
replaced by devm_clk_get_enabled() when driver enables (and possibly
prepares) the clocks for the whole lifetime of the device. Moreover, it is
no longer necessary to unprepare and disable the clocks explicitly, so drop
the label "clk_disable". And both mtk_nfc_enable_clk() and
mtk_nfc_disable_clk() now have a single user, which is the resume or
suspend callback, so drop this two helper function and just move related
operations in the resume or suspend function.

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
v2 -> v3: Modify the syntax error in the commit message.
v2; https://lore.kernel.org/all/20230818074642.308166-8-lizetao1@huawei.com/
v1 -> v2: Modify commit message and drop two helper functions
mtk_nfc_enable_clk() and mtk_nfc_disable_clk().
v1: https://lore.kernel.org/all/20230817024509.3951629-8-lizetao1@huawei.com/

 drivers/mtd/nand/raw/mtk_nand.c | 62 ++++++++++-----------------------
 1 file changed, 19 insertions(+), 43 deletions(-)

diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
index b6eb8cb6b5e9..29c8bddde67f 100644
--- a/drivers/mtd/nand/raw/mtk_nand.c
+++ b/drivers/mtd/nand/raw/mtk_nand.c
@@ -1118,32 +1118,6 @@ static irqreturn_t mtk_nfc_irq(int irq, void *id)
 	return IRQ_HANDLED;
 }
 
-static int mtk_nfc_enable_clk(struct device *dev, struct mtk_nfc_clk *clk)
-{
-	int ret;
-
-	ret = clk_prepare_enable(clk->nfi_clk);
-	if (ret) {
-		dev_err(dev, "failed to enable nfi clk\n");
-		return ret;
-	}
-
-	ret = clk_prepare_enable(clk->pad_clk);
-	if (ret) {
-		dev_err(dev, "failed to enable pad clk\n");
-		clk_disable_unprepare(clk->nfi_clk);
-		return ret;
-	}
-
-	return 0;
-}
-
-static void mtk_nfc_disable_clk(struct mtk_nfc_clk *clk)
-{
-	clk_disable_unprepare(clk->nfi_clk);
-	clk_disable_unprepare(clk->pad_clk);
-}
-
 static int mtk_nfc_ooblayout_free(struct mtd_info *mtd, int section,
 				  struct mtd_oob_region *oob_region)
 {
@@ -1545,40 +1519,36 @@ static int mtk_nfc_probe(struct platform_device *pdev)
 		goto release_ecc;
 	}
 
-	nfc->clk.nfi_clk = devm_clk_get(dev, "nfi_clk");
+	nfc->clk.nfi_clk = devm_clk_get_enabled(dev, "nfi_clk");
 	if (IS_ERR(nfc->clk.nfi_clk)) {
 		dev_err(dev, "no clk\n");
 		ret = PTR_ERR(nfc->clk.nfi_clk);
 		goto release_ecc;
 	}
 
-	nfc->clk.pad_clk = devm_clk_get(dev, "pad_clk");
+	nfc->clk.pad_clk = devm_clk_get_enabled(dev, "pad_clk");
 	if (IS_ERR(nfc->clk.pad_clk)) {
 		dev_err(dev, "no pad clk\n");
 		ret = PTR_ERR(nfc->clk.pad_clk);
 		goto release_ecc;
 	}
 
-	ret = mtk_nfc_enable_clk(dev, &nfc->clk);
-	if (ret)
-		goto release_ecc;
-
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
 		ret = -EINVAL;
-		goto clk_disable;
+		goto release_ecc;
 	}
 
 	ret = devm_request_irq(dev, irq, mtk_nfc_irq, 0x0, "mtk-nand", nfc);
 	if (ret) {
 		dev_err(dev, "failed to request nfi irq\n");
-		goto clk_disable;
+		goto release_ecc;
 	}
 
 	ret = dma_set_mask(dev, DMA_BIT_MASK(32));
 	if (ret) {
 		dev_err(dev, "failed to set dma mask\n");
-		goto clk_disable;
+		goto release_ecc;
 	}
 
 	platform_set_drvdata(pdev, nfc);
@@ -1586,14 +1556,11 @@ static int mtk_nfc_probe(struct platform_device *pdev)
 	ret = mtk_nfc_nand_chips_init(dev, nfc);
 	if (ret) {
 		dev_err(dev, "failed to init nand chips\n");
-		goto clk_disable;
+		goto release_ecc;
 	}
 
 	return 0;
 
-clk_disable:
-	mtk_nfc_disable_clk(&nfc->clk);
-
 release_ecc:
 	mtk_ecc_release(nfc->ecc);
 
@@ -1618,7 +1585,6 @@ static void mtk_nfc_remove(struct platform_device *pdev)
 	}
 
 	mtk_ecc_release(nfc->ecc);
-	mtk_nfc_disable_clk(&nfc->clk);
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -1626,7 +1592,8 @@ static int mtk_nfc_suspend(struct device *dev)
 {
 	struct mtk_nfc *nfc = dev_get_drvdata(dev);
 
-	mtk_nfc_disable_clk(&nfc->clk);
+	clk_disable_unprepare(nfc->clk.nfi_clk);
+	clk_disable_unprepare(nfc->clk.pad_clk);
 
 	return 0;
 }
@@ -1641,9 +1608,18 @@ static int mtk_nfc_resume(struct device *dev)
 
 	udelay(200);
 
-	ret = mtk_nfc_enable_clk(dev, &nfc->clk);
-	if (ret)
+	ret = clk_prepare_enable(nfc->clk.nfi_clk);
+	if (ret) {
+		dev_err(dev, "failed to enable nfi clk\n");
 		return ret;
+	}
+
+	ret = clk_prepare_enable(nfc->clk.pad_clk);
+	if (ret) {
+		dev_err(dev, "failed to enable pad clk\n");
+		clk_disable_unprepare(nfc->clk.nfi_clk);
+		return ret;
+	}
 
 	/* reset NAND chip if VCC was powered off */
 	list_for_each_entry(chip, &nfc->chips, node) {
-- 
2.34.1

