Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8221B16426
	for <linux-sunxi@lists.linux.dev>; Fri, 18 Aug 2023 07:47:19 +0000 (UTC)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RRv4w3dvpzNmyb;
	Fri, 18 Aug 2023 15:43:44 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Fri, 18 Aug
 2023 15:47:15 +0800
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
Subject: [PATCH -next v2 10/12] mtd: rawnand: vf610_nfc: Use helper function devm_clk_get_enabled()
Date: Fri, 18 Aug 2023 15:46:40 +0800
Message-ID: <20230818074642.308166-11-lizetao1@huawei.com>
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
no longer necessary to unprepare and disable the clock explicitly, so
drop the label "err_disable_clk".

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
v1 -> v2: Modify commit message.
v1: https://lore.kernel.org/all/20230817024509.3951629-11-lizetao1@huawei.com/

 drivers/mtd/nand/raw/vf610_nfc.c | 29 +++++++++--------------------
 1 file changed, 9 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index dcdf33dbaef2..1ce9d5c2b1f7 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -834,21 +834,15 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	if (IS_ERR(nfc->regs))
 		return PTR_ERR(nfc->regs);
 
-	nfc->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(nfc->clk))
+	nfc->clk = devm_clk_get_enabled(&pdev->dev, NULL);
+	if (IS_ERR(nfc->clk)) {
+		dev_err(nfc->dev, "Unable to get and enable clock!\n");
 		return PTR_ERR(nfc->clk);
-
-	err = clk_prepare_enable(nfc->clk);
-	if (err) {
-		dev_err(nfc->dev, "Unable to enable clock!\n");
-		return err;
 	}
 
 	of_id = of_match_device(vf610_nfc_dt_ids, &pdev->dev);
-	if (!of_id) {
-		err = -ENODEV;
-		goto err_disable_clk;
-	}
+	if (!of_id)
+		return -ENODEV;
 
 	nfc->variant = (enum vf610_nfc_variant)of_id->data;
 
@@ -858,9 +852,8 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 			if (nand_get_flash_node(chip)) {
 				dev_err(nfc->dev,
 					"Only one NAND chip supported!\n");
-				err = -EINVAL;
 				of_node_put(child);
-				goto err_disable_clk;
+				return -EINVAL;
 			}
 
 			nand_set_flash_node(chip, child);
@@ -869,8 +862,7 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 
 	if (!nand_get_flash_node(chip)) {
 		dev_err(nfc->dev, "NAND chip sub-node missing!\n");
-		err = -ENODEV;
-		goto err_disable_clk;
+		return -ENODEV;
 	}
 
 	chip->options |= NAND_NO_SUBPAGE_WRITE;
@@ -880,7 +872,7 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	err = devm_request_irq(nfc->dev, irq, vf610_nfc_irq, 0, DRV_NAME, nfc);
 	if (err) {
 		dev_err(nfc->dev, "Error requesting IRQ!\n");
-		goto err_disable_clk;
+		return err;
 	}
 
 	vf610_nfc_preinit_controller(nfc);
@@ -892,7 +884,7 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	/* Scan the NAND chip */
 	err = nand_scan(chip, 1);
 	if (err)
-		goto err_disable_clk;
+		return err;
 
 	platform_set_drvdata(pdev, nfc);
 
@@ -904,8 +896,6 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 
 err_cleanup_nand:
 	nand_cleanup(chip);
-err_disable_clk:
-	clk_disable_unprepare(nfc->clk);
 	return err;
 }
 
@@ -918,7 +908,6 @@ static void vf610_nfc_remove(struct platform_device *pdev)
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
 	nand_cleanup(chip);
-	clk_disable_unprepare(nfc->clk);
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.34.1

