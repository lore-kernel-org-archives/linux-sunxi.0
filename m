Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E435916426
	for <linux-sunxi@lists.linux.dev>; Fri, 18 Aug 2023 07:47:16 +0000 (UTC)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RRv4m1MBPzNmml;
	Fri, 18 Aug 2023 15:43:36 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Fri, 18 Aug
 2023 15:47:07 +0800
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
Subject: [PATCH -next v2 02/12] mtd: rawnand: arasan: Use helper function devm_clk_get_enabled()
Date: Fri, 18 Aug 2023 15:46:32 +0800
Message-ID: <20230818074642.308166-3-lizetao1@huawei.com>
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
the label "disable_bus_clk" and "disable_controller_clk".

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
v1 -> v2: Modify commit message.
v1: https://lore.kernel.org/all/20230817024509.3951629-3-lizetao1@huawei.com/

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

