Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4F436A
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Aug 2023 02:45:35 +0000 (UTC)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RR8St45rwzVkSF;
	Thu, 17 Aug 2023 10:43:26 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 17 Aug
 2023 10:45:31 +0800
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
Subject: [PATCH -next 06/11] mtd: rawnand: mpc5121: Use helper function devm_clk_get_enabled()
Date: Thu, 17 Aug 2023 10:45:04 +0800
Message-ID: <20230817024509.3951629-7-lizetao1@huawei.com>
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
 drivers/mtd/nand/raw/mpc5121_nfc.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/mpc5121_nfc.c b/drivers/mtd/nand/raw/mpc5121_nfc.c
index 6e8e790f84e7..215610f808f1 100644
--- a/drivers/mtd/nand/raw/mpc5121_nfc.c
+++ b/drivers/mtd/nand/raw/mpc5121_nfc.c
@@ -595,8 +595,6 @@ static void mpc5121_nfc_free(struct device *dev, struct mtd_info *mtd)
 	struct nand_chip *chip = mtd_to_nand(mtd);
 	struct mpc5121_nfc_prv *prv = nand_get_controller_data(chip);
 
-	clk_disable_unprepare(prv->clk);
-
 	if (prv->csreg)
 		iounmap(prv->csreg);
 }
@@ -717,17 +715,12 @@ static int mpc5121_nfc_probe(struct platform_device *op)
 	}
 
 	/* Enable NFC clock */
-	clk = devm_clk_get(dev, "ipg");
+	clk = devm_clk_get_enabled(dev, "ipg");
 	if (IS_ERR(clk)) {
-		dev_err(dev, "Unable to acquire NFC clock!\n");
+		dev_err(dev, "Unable to acquire and enable NFC clock!\n");
 		retval = PTR_ERR(clk);
 		goto error;
 	}
-	retval = clk_prepare_enable(clk);
-	if (retval) {
-		dev_err(dev, "Unable to enable NFC clock!\n");
-		goto error;
-	}
 	prv->clk = clk;
 
 	/* Reset NAND Flash controller */
-- 
2.34.1

