Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9591316428
	for <linux-sunxi@lists.linux.dev>; Fri, 18 Aug 2023 07:47:17 +0000 (UTC)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RRv6V3bYMzVkJ0;
	Fri, 18 Aug 2023 15:45:06 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Fri, 18 Aug
 2023 15:47:13 +0800
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
Subject: [PATCH -next v2 08/12] mtd: rawnand: stm32_fmc2: Use helper function devm_clk_get_enabled()
Date: Fri, 18 Aug 2023 15:46:38 +0800
Message-ID: <20230818074642.308166-9-lizetao1@huawei.com>
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
drop the label "err_clk_disable".

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
v1 -> v2: Modify commit message.
v1: https://lore.kernel.org/all/20230817024509.3951629-9-lizetao1@huawei.com/

 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index 2f9e43f64dd7..88811139aaf5 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -1951,21 +1951,17 @@ static int stm32_fmc2_nfc_probe(struct platform_device *pdev)
 
 	init_completion(&nfc->complete);
 
-	nfc->clk = devm_clk_get(nfc->cdev, NULL);
-	if (IS_ERR(nfc->clk))
+	nfc->clk = devm_clk_get_enabled(nfc->cdev, NULL);
+	if (IS_ERR(nfc->clk)) {
+		dev_err(dev, "can not get and enable the clock\n");
 		return PTR_ERR(nfc->clk);
-
-	ret = clk_prepare_enable(nfc->clk);
-	if (ret) {
-		dev_err(dev, "can not enable the clock\n");
-		return ret;
 	}
 
 	rstc = devm_reset_control_get(dev, NULL);
 	if (IS_ERR(rstc)) {
 		ret = PTR_ERR(rstc);
 		if (ret == -EPROBE_DEFER)
-			goto err_clk_disable;
+			return ret;
 	} else {
 		reset_control_assert(rstc);
 		reset_control_deassert(rstc);
@@ -2018,9 +2014,6 @@ static int stm32_fmc2_nfc_probe(struct platform_device *pdev)
 	sg_free_table(&nfc->dma_data_sg);
 	sg_free_table(&nfc->dma_ecc_sg);
 
-err_clk_disable:
-	clk_disable_unprepare(nfc->clk);
-
 	return ret;
 }
 
@@ -2045,8 +2038,6 @@ static void stm32_fmc2_nfc_remove(struct platform_device *pdev)
 	sg_free_table(&nfc->dma_data_sg);
 	sg_free_table(&nfc->dma_ecc_sg);
 
-	clk_disable_unprepare(nfc->clk);
-
 	stm32_fmc2_nfc_wp_enable(nand);
 }
 
-- 
2.34.1

