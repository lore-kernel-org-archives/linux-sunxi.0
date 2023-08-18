Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697E0156DA
	for <linux-sunxi@lists.linux.dev>; Fri, 18 Aug 2023 07:47:18 +0000 (UTC)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RRv4n19r9ztS5X;
	Fri, 18 Aug 2023 15:43:37 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Fri, 18 Aug
 2023 15:47:14 +0800
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
Subject: [PATCH -next v2 09/12] mtd: rawnand: sunxi: Use helper function devm_clk_get_enabled()
Date: Fri, 18 Aug 2023 15:46:39 +0800
Message-ID: <20230818074642.308166-10-lizetao1@huawei.com>
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
the label "out_mod_clk_unprepare" and "out_ahb_clk_unprepare".

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
v1 -> v2: Modify commit message.
v1: https://lore.kernel.org/all/20230817024509.3951629-10-lizetao1@huawei.com/

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

