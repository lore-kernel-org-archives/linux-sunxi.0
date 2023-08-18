Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B1D156DA
	for <linux-sunxi@lists.linux.dev>; Fri, 18 Aug 2023 07:47:21 +0000 (UTC)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.57])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RRv7R3zzrzkX6J;
	Fri, 18 Aug 2023 15:45:55 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Fri, 18 Aug
 2023 15:47:17 +0800
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
Subject: [PATCH -next v2 12/12] mtd: rawnand: orion: Use helper function devm_clk_get_optional_enabled()
Date: Fri, 18 Aug 2023 15:46:42 +0800
Message-ID: <20230818074642.308166-13-lizetao1@huawei.com>
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
and enabled clocks"), devm_clk_get_optional() and clk_prepare_enable() can
now be replaced by devm_clk_get_optional_enabled() when driver enable
(and possibly prepare) the clocks for the whole lifetime of the device.
Moreover, it is no longer necessary to unprepare and disable the clock
explicitly, so drop the label "no_dev".

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
v1 -> v2: This is a new patch.

 drivers/mtd/nand/raw/orion_nand.c | 22 ++++------------------
 1 file changed, 4 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/nand/raw/orion_nand.c b/drivers/mtd/nand/raw/orion_nand.c
index 7e0313889b50..2951d81614fd 100644
--- a/drivers/mtd/nand/raw/orion_nand.c
+++ b/drivers/mtd/nand/raw/orion_nand.c
@@ -169,16 +169,10 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, info);
 
 	/* Not all platforms can gate the clock, so it is optional. */
-	info->clk = devm_clk_get_optional(&pdev->dev, NULL);
+	info->clk = devm_clk_get_optional_enabled(&pdev->dev, NULL);
 	if (IS_ERR(info->clk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(info->clk),
-				     "failed to get clock!\n");
-
-	ret = clk_prepare_enable(info->clk);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to prepare clock!\n");
-		return ret;
-	}
+				     "failed to get and enable clock!\n");
 
 	/*
 	 * This driver assumes that the default ECC engine should be TYPE_SOFT.
@@ -189,19 +183,13 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 
 	ret = nand_scan(nc, 1);
 	if (ret)
-		goto no_dev;
+		return ret;
 
 	mtd->name = "orion_nand";
 	ret = mtd_device_register(mtd, board->parts, board->nr_parts);
-	if (ret) {
+	if (ret)
 		nand_cleanup(nc);
-		goto no_dev;
-	}
-
-	return 0;
 
-no_dev:
-	clk_disable_unprepare(info->clk);
 	return ret;
 }
 
@@ -215,8 +203,6 @@ static void orion_nand_remove(struct platform_device *pdev)
 	WARN_ON(ret);
 
 	nand_cleanup(chip);
-
-	clk_disable_unprepare(info->clk);
 }
 
 #ifdef CONFIG_OF
-- 
2.34.1

