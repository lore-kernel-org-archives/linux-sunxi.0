Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB759156DA
	for <linux-sunxi@lists.linux.dev>; Fri, 18 Aug 2023 07:47:15 +0000 (UTC)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RRv7K2VNgzkX73;
	Fri, 18 Aug 2023 15:45:49 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Fri, 18 Aug
 2023 15:47:11 +0800
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
Subject: [PATCH -next v2 06/12] mtd: rawnand: mpc5121: Use helper function devm_clk_get_enabled()
Date: Fri, 18 Aug 2023 15:46:36 +0800
Message-ID: <20230818074642.308166-7-lizetao1@huawei.com>
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
no longer necessary to unprepare and disable the clock explicitly.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
v1 -> v2: Modify commit message.
v1: https://lore.kernel.org/all/20230817024509.3951629-7-lizetao1@huawei.com/

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

