Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC689E56C
	for <linux-sunxi@lists.linux.dev>; Fri, 18 Aug 2023 07:47:13 +0000 (UTC)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RRv4g6j4PztS5C;
	Fri, 18 Aug 2023 15:43:31 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Fri, 18 Aug
 2023 15:47:09 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <lizetao1@huawei.com>
CC: <alexandre.torgue@foss.st.com>, <angelogioacchino.delregno@collabora.com>,
	<christophe.kerello@foss.st.com>, <christophe.leroy@csgroup.eu>,
	<dmitry.torokhov@gmail.com>, <frank.li@vivo.com>, <geert+renesas@glider.be>,
	<heiko@sntech.de>, <jernej.skrabec@gmail.com>, <jinpu.wang@ionos.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-mtd@lists.infradead.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-sunxi@lists.linux.dev>, <martin.blumenstingl@googlemail.com>,
	<matthias.bgg@gmail.com>, <mcoquelin.stm32@gmail.com>, <michael@walle.cc>,
	<michal.simek@amd.com>, <miquel.raynal@bootlin.com>,
	<nicolas.ferre@microchip.com>, <paul@crapouillou.net>, <philmd@linaro.org>,
	<pratyush@kernel.org>, <richard@nod.at>, <robh@kernel.org>,
	<rogerq@kernel.org>, <samuel@sholland.org>, <stefan@agner.ch>,
	<tudor.ambarus@linaro.org>, <u.kleine-koenig@pengutronix.de>,
	<vigneshr@ti.com>, <vz@mleia.com>, <wens@csie.org>,
	<yangyingliang@huawei.com>
Subject: [PATCH -next v2 04/12] mtd: rawnand: intel: Use helper function devm_clk_get_enabled()
Date: Fri, 18 Aug 2023 15:46:34 +0800
Message-ID: <20230818074642.308166-5-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230818074642.308166-1-lizetao1@huawei.com>
References: <20230817024509.3951629-1-lizetao1@huawei.com>
 <20230818074642.308166-1-lizetao1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected

Since commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepared
and enabled clocks"), devm_clk_get() and clk_prepare_enable() can now be
replaced by devm_clk_get_enabled() when driver enable (and possibly
prepare) the clocks for the whole lifetime of the device. Moreover, it is
no longer necessary to unprepare and disable the clock explicitly, so drop
the label "err_disable_unprepare_clk".

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
v1 -> v2: Modify commit message.
v1: https://lore.kernel.org/all/20230817024509.3951629-5-lizetao1@huawei.com/

 drivers/mtd/nand/raw/intel-nand-controller.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/intel-nand-controller.c b/drivers/mtd/nand/raw/intel-nand-controller.c
index a9909eb08124..cb5d88f42297 100644
--- a/drivers/mtd/nand/raw/intel-nand-controller.c
+++ b/drivers/mtd/nand/raw/intel-nand-controller.c
@@ -626,16 +626,10 @@ static int ebu_nand_probe(struct platform_device *pdev)
 		goto err_of_node_put;
 	}
 
-	ebu_host->clk = devm_clk_get(dev, NULL);
+	ebu_host->clk = devm_clk_get_enabled(dev, NULL);
 	if (IS_ERR(ebu_host->clk)) {
 		ret = dev_err_probe(dev, PTR_ERR(ebu_host->clk),
-				    "failed to get clock\n");
-		goto err_of_node_put;
-	}
-
-	ret = clk_prepare_enable(ebu_host->clk);
-	if (ret) {
-		dev_err(dev, "failed to enable clock: %d\n", ret);
+				    "failed to get and enable clock\n");
 		goto err_of_node_put;
 	}
 
@@ -643,7 +637,7 @@ static int ebu_nand_probe(struct platform_device *pdev)
 	if (IS_ERR(ebu_host->dma_tx)) {
 		ret = dev_err_probe(dev, PTR_ERR(ebu_host->dma_tx),
 				    "failed to request DMA tx chan!.\n");
-		goto err_disable_unprepare_clk;
+		goto err_of_node_put;
 	}
 
 	ebu_host->dma_rx = dma_request_chan(dev, "rx");
@@ -698,8 +692,6 @@ static int ebu_nand_probe(struct platform_device *pdev)
 	nand_cleanup(&ebu_host->chip);
 err_cleanup_dma:
 	ebu_dma_cleanup(ebu_host);
-err_disable_unprepare_clk:
-	clk_disable_unprepare(ebu_host->clk);
 err_of_node_put:
 	of_node_put(chip_np);
 
@@ -716,7 +708,6 @@ static void ebu_nand_remove(struct platform_device *pdev)
 	nand_cleanup(&ebu_host->chip);
 	ebu_nand_disable(&ebu_host->chip);
 	ebu_dma_cleanup(ebu_host);
-	clk_disable_unprepare(ebu_host->clk);
 }
 
 static const struct of_device_id ebu_nand_match[] = {
-- 
2.34.1

