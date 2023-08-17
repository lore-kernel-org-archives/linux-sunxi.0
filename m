Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE91396
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Aug 2023 02:45:41 +0000 (UTC)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RR8Tq4PPFz1GDc3;
	Thu, 17 Aug 2023 10:44:15 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 17 Aug
 2023 10:45:35 +0800
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
Subject: [PATCH -next 09/11] mtd: rawnand: sunxi: Use helper function devm_clk_get_enabled()
Date: Thu, 17 Aug 2023 10:45:07 +0800
Message-ID: <20230817024509.3951629-10-lizetao1@huawei.com>
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
 drivers/mtd/nand/raw/sunxi_nand.c | 29 ++++++-----------------------
 1 file changed, 6 insertions(+), 23 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 64c09eae951d..9abf38049d35 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -2094,37 +2094,26 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
-	nfc->ahb_clk = devm_clk_get(dev, "ahb");
+	nfc->ahb_clk = devm_clk_get_enabled(dev, "ahb");
 	if (IS_ERR(nfc->ahb_clk)) {
 		dev_err(dev, "failed to retrieve ahb clk\n");
 		return PTR_ERR(nfc->ahb_clk);
 	}
 
-	ret = clk_prepare_enable(nfc->ahb_clk);
-	if (ret)
-		return ret;
-
-	nfc->mod_clk = devm_clk_get(dev, "mod");
+	nfc->mod_clk = devm_clk_get_enabled(dev, "mod");
 	if (IS_ERR(nfc->mod_clk)) {
 		dev_err(dev, "failed to retrieve mod clk\n");
-		ret = PTR_ERR(nfc->mod_clk);
-		goto out_ahb_clk_unprepare;
+		return PTR_ERR(nfc->mod_clk);
 	}
 
-	ret = clk_prepare_enable(nfc->mod_clk);
-	if (ret)
-		goto out_ahb_clk_unprepare;
-
 	nfc->reset = devm_reset_control_get_optional_exclusive(dev, "ahb");
-	if (IS_ERR(nfc->reset)) {
-		ret = PTR_ERR(nfc->reset);
-		goto out_mod_clk_unprepare;
-	}
+	if (IS_ERR(nfc->reset))
+		return PTR_ERR(nfc->reset);
 
 	ret = reset_control_deassert(nfc->reset);
 	if (ret) {
 		dev_err(dev, "reset err %d\n", ret);
-		goto out_mod_clk_unprepare;
+		return ret;
 	}
 
 	nfc->caps = of_device_get_match_data(&pdev->dev);
@@ -2163,10 +2152,6 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 		dma_release_channel(nfc->dmac);
 out_ahb_reset_reassert:
 	reset_control_assert(nfc->reset);
-out_mod_clk_unprepare:
-	clk_disable_unprepare(nfc->mod_clk);
-out_ahb_clk_unprepare:
-	clk_disable_unprepare(nfc->ahb_clk);
 
 	return ret;
 }
@@ -2181,8 +2166,6 @@ static void sunxi_nfc_remove(struct platform_device *pdev)
 
 	if (nfc->dmac)
 		dma_release_channel(nfc->dmac);
-	clk_disable_unprepare(nfc->mod_clk);
-	clk_disable_unprepare(nfc->ahb_clk);
 }
 
 static const struct sunxi_nfc_caps sunxi_nfc_a10_caps = {
-- 
2.34.1

