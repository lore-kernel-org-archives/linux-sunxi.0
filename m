Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC85A639
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Aug 2023 02:45:37 +0000 (UTC)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RR8Sp01SMzVkS3;
	Thu, 17 Aug 2023 10:43:21 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 17 Aug
 2023 10:45:27 +0800
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
Subject: [PATCH -next 02/11] mtd: rawnand: arasan: Use helper function devm_clk_get_enabled()
Date: Thu, 17 Aug 2023 10:45:00 +0800
Message-ID: <20230817024509.3951629-3-lizetao1@huawei.com>
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
handling path.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/mtd/nand/raw/arasan-nand-controller.c | 29 ++++---------------
 1 file changed, 5 insertions(+), 24 deletions(-)

diff --git a/drivers/mtd/nand/raw/arasan-nand-controller.c b/drivers/mtd/nand/raw/arasan-nand-controller.c
index 906eef70cb6d..4621ec549cc7 100644
--- a/drivers/mtd/nand/raw/arasan-nand-controller.c
+++ b/drivers/mtd/nand/raw/arasan-nand-controller.c
@@ -1440,45 +1440,29 @@ static int anfc_probe(struct platform_device *pdev)
 
 	anfc_reset(nfc);
 
-	nfc->controller_clk = devm_clk_get(&pdev->dev, "controller");
+	nfc->controller_clk = devm_clk_get_enabled(&pdev->dev, "controller");
 	if (IS_ERR(nfc->controller_clk))
 		return PTR_ERR(nfc->controller_clk);
 
-	nfc->bus_clk = devm_clk_get(&pdev->dev, "bus");
+	nfc->bus_clk = devm_clk_get_enabled(&pdev->dev, "bus");
 	if (IS_ERR(nfc->bus_clk))
 		return PTR_ERR(nfc->bus_clk);
 
-	ret = clk_prepare_enable(nfc->controller_clk);
-	if (ret)
-		return ret;
-
-	ret = clk_prepare_enable(nfc->bus_clk);
-	if (ret)
-		goto disable_controller_clk;
-
 	ret = dma_set_mask(&pdev->dev, DMA_BIT_MASK(64));
 	if (ret)
-		goto disable_bus_clk;
+		return ret;
 
 	ret = anfc_parse_cs(nfc);
 	if (ret)
-		goto disable_bus_clk;
+		return ret;
 
 	ret = anfc_chips_init(nfc);
 	if (ret)
-		goto disable_bus_clk;
+		return ret;
 
 	platform_set_drvdata(pdev, nfc);
 
 	return 0;
-
-disable_bus_clk:
-	clk_disable_unprepare(nfc->bus_clk);
-
-disable_controller_clk:
-	clk_disable_unprepare(nfc->controller_clk);
-
-	return ret;
 }
 
 static void anfc_remove(struct platform_device *pdev)
@@ -1486,9 +1470,6 @@ static void anfc_remove(struct platform_device *pdev)
 	struct arasan_nfc *nfc = platform_get_drvdata(pdev);
 
 	anfc_chips_cleanup(nfc);
-
-	clk_disable_unprepare(nfc->bus_clk);
-	clk_disable_unprepare(nfc->controller_clk);
 }
 
 static const struct of_device_id anfc_ids[] = {
-- 
2.34.1

