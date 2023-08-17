Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811C1638
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Aug 2023 02:45:40 +0000 (UTC)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RR8Tk182HzrSX7;
	Thu, 17 Aug 2023 10:44:10 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 17 Aug
 2023 10:45:30 +0800
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
Subject: [PATCH -next 05/11] mtd: rawnand: lpc32xx_slc: Use helper function devm_clk_get_enabled()
Date: Thu, 17 Aug 2023 10:45:03 +0800
Message-ID: <20230817024509.3951629-6-lizetao1@huawei.com>
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
 drivers/mtd/nand/raw/lpc32xx_slc.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/lpc32xx_slc.c b/drivers/mtd/nand/raw/lpc32xx_slc.c
index 2201264d3c37..1c5fa855b9f2 100644
--- a/drivers/mtd/nand/raw/lpc32xx_slc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_slc.c
@@ -871,15 +871,12 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	mtd->dev.parent = &pdev->dev;
 
 	/* Get NAND clock */
-	host->clk = devm_clk_get(&pdev->dev, NULL);
+	host->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(host->clk)) {
 		dev_err(&pdev->dev, "Clock failure\n");
 		res = -ENOENT;
 		goto enable_wp;
 	}
-	res = clk_prepare_enable(host->clk);
-	if (res)
-		goto enable_wp;
 
 	/* Set NAND IO addresses and command/ready functions */
 	chip->legacy.IO_ADDR_R = SLC_DATA(host->io_base);
@@ -907,13 +904,13 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 				      GFP_KERNEL);
 	if (host->data_buf == NULL) {
 		res = -ENOMEM;
-		goto unprepare_clk;
+		goto enable_wp;
 	}
 
 	res = lpc32xx_nand_dma_setup(host);
 	if (res) {
 		res = -EIO;
-		goto unprepare_clk;
+		goto enable_wp;
 	}
 
 	/* Find NAND device */
@@ -934,8 +931,6 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	nand_cleanup(chip);
 release_dma:
 	dma_release_channel(host->dma_chan);
-unprepare_clk:
-	clk_disable_unprepare(host->clk);
 enable_wp:
 	lpc32xx_wp_enable(host);
 
@@ -962,7 +957,6 @@ static void lpc32xx_nand_remove(struct platform_device *pdev)
 	tmp &= ~SLCCFG_CE_LOW;
 	writel(tmp, SLC_CTRL(host->io_base));
 
-	clk_disable_unprepare(host->clk);
 	lpc32xx_wp_enable(host);
 }
 
-- 
2.34.1

