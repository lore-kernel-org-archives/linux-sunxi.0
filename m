Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826CD389
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Aug 2023 02:45:41 +0000 (UTC)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RR8RL6pvVzNn0V;
	Thu, 17 Aug 2023 10:42:06 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 17 Aug
 2023 10:45:37 +0800
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
Subject: [PATCH -next 11/11] mtd: spi-nor: Use helper function devm_clk_get_enabled()
Date: Thu, 17 Aug 2023 10:45:09 +0800
Message-ID: <20230817024509.3951629-12-lizetao1@huawei.com>
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
 drivers/mtd/spi-nor/controllers/nxp-spifi.c | 33 ++++-----------------
 1 file changed, 6 insertions(+), 27 deletions(-)

diff --git a/drivers/mtd/spi-nor/controllers/nxp-spifi.c b/drivers/mtd/spi-nor/controllers/nxp-spifi.c
index 337e83bf3362..5d8f47ab146f 100644
--- a/drivers/mtd/spi-nor/controllers/nxp-spifi.c
+++ b/drivers/mtd/spi-nor/controllers/nxp-spifi.c
@@ -394,30 +394,18 @@ static int nxp_spifi_probe(struct platform_device *pdev)
 	if (IS_ERR(spifi->flash_base))
 		return PTR_ERR(spifi->flash_base);
 
-	spifi->clk_spifi = devm_clk_get(&pdev->dev, "spifi");
+	spifi->clk_spifi = devm_clk_get_enabled(&pdev->dev, "spifi");
 	if (IS_ERR(spifi->clk_spifi)) {
-		dev_err(&pdev->dev, "spifi clock not found\n");
+		dev_err(&pdev->dev, "spifi clock not found or unable to enable\n");
 		return PTR_ERR(spifi->clk_spifi);
 	}
 
-	spifi->clk_reg = devm_clk_get(&pdev->dev, "reg");
+	spifi->clk_reg = devm_clk_get_enabled(&pdev->dev, "reg");
 	if (IS_ERR(spifi->clk_reg)) {
-		dev_err(&pdev->dev, "reg clock not found\n");
+		dev_err(&pdev->dev, "reg clock not found or unable to enable\n");
 		return PTR_ERR(spifi->clk_reg);
 	}
 
-	ret = clk_prepare_enable(spifi->clk_reg);
-	if (ret) {
-		dev_err(&pdev->dev, "unable to enable reg clock\n");
-		return ret;
-	}
-
-	ret = clk_prepare_enable(spifi->clk_spifi);
-	if (ret) {
-		dev_err(&pdev->dev, "unable to enable spifi clock\n");
-		goto dis_clk_reg;
-	}
-
 	spifi->dev = &pdev->dev;
 	platform_set_drvdata(pdev, spifi);
 
@@ -430,24 +418,17 @@ static int nxp_spifi_probe(struct platform_device *pdev)
 	flash_np = of_get_next_available_child(pdev->dev.of_node, NULL);
 	if (!flash_np) {
 		dev_err(&pdev->dev, "no SPI flash device to configure\n");
-		ret = -ENODEV;
-		goto dis_clks;
+		return -ENODEV;
 	}
 
 	ret = nxp_spifi_setup_flash(spifi, flash_np);
 	of_node_put(flash_np);
 	if (ret) {
 		dev_err(&pdev->dev, "unable to setup flash chip\n");
-		goto dis_clks;
+		return ret;
 	}
 
 	return 0;
-
-dis_clks:
-	clk_disable_unprepare(spifi->clk_spifi);
-dis_clk_reg:
-	clk_disable_unprepare(spifi->clk_reg);
-	return ret;
 }
 
 static int nxp_spifi_remove(struct platform_device *pdev)
@@ -455,8 +436,6 @@ static int nxp_spifi_remove(struct platform_device *pdev)
 	struct nxp_spifi *spifi = platform_get_drvdata(pdev);
 
 	mtd_device_unregister(&spifi->nor.mtd);
-	clk_disable_unprepare(spifi->clk_spifi);
-	clk_disable_unprepare(spifi->clk_reg);
 
 	return 0;
 }
-- 
2.34.1

