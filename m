Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3B1397
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Aug 2023 02:45:36 +0000 (UTC)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RR8Tm1WZ0zrSXH;
	Thu, 17 Aug 2023 10:44:12 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 17 Aug
 2023 10:45:33 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<michal.simek@amd.com>, <vz@mleia.com>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <mcoquelin.stm32@gmail.com>,
	<alexandre.torgue@foss.st.com>, <wens@csie.org>, <jernej.skrabec@gmail.com>,
	<samuel@sholland.org>, <stefan@agner.ch>, <tudor.ambarus@linaro.org>,
	<pratyush@kernel.org>, <michael@walle.cc>, <frank.li@vivo.com>
CC: <robh@kernel.org>, <martin.blumenstingl@googlemail.com>,
	<philmd@linaro.org>, <geert+renesas@glider.be>,
	<u.kleine-koenig@pengutronix.de>, <rogerq@kernel.org>,
	<paul@crapouillou.net>, <nicolas.ferre@microchip.com>,
	<yangyingliang@huawei.com>, <dmitry.torokhov@gmail.com>, <heiko@sntech.de>,
	<christophe.leroy@csgroup.eu>, <christophe.kerello@foss.st.com>,
	<jinpu.wang@ionos.com>, <lizetao1@huawei.com>,
	<linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<linux-stm32@st-md-mailman.stormreply.com>, <linux-sunxi@lists.linux.dev>
Subject: [PATCH -next 07/11] mtd: rawnand: mtk: Use helper function devm_clk_get_enabled()
Date: Thu, 17 Aug 2023 10:45:05 +0800
Message-ID: <20230817024509.3951629-8-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230817024509.3951629-1-lizetao1@huawei.com>
References: <20230817024509.3951629-1-lizetao1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected

After the commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for
prepared and enabled clocks"), it can replace the pair of functions,
devm_clk_get() and clk_prepare_enable() with a single helper function
devm_clk_get_enabled(). Moreover, the driver will keeps a clock prepared
(or enabled) during the whole lifetime of the driver, it is unnecessary to
unprepare and disable clock explicitly when remove driver or in the error
handling path. The mtk_nfc_enable_clk() is a helper function that enables
the "clk->nfi_clk" and "clk->pad_clk", it can be combined into
devm_clk_get_enabled().

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/mtd/nand/raw/mtk_nand.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
index b6eb8cb6b5e9..0d185e650aaf 100644
--- a/drivers/mtd/nand/raw/mtk_nand.c
+++ b/drivers/mtd/nand/raw/mtk_nand.c
@@ -1545,40 +1545,36 @@ static int mtk_nfc_probe(struct platform_device *pdev)
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
@@ -1586,14 +1582,11 @@ static int mtk_nfc_probe(struct platform_device *pdev)
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
 
@@ -1618,7 +1611,6 @@ static void mtk_nfc_remove(struct platform_device *pdev)
 	}
 
 	mtk_ecc_release(nfc->ecc);
-	mtk_nfc_disable_clk(&nfc->clk);
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.34.1

