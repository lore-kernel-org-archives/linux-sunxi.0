Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62C729CA
	for <linux-sunxi@lists.linux.dev>; Thu, 10 Jun 2021 02:06:47 +0000 (UTC)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.57])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4G0nLH2ms2z6tt7;
	Thu, 10 Jun 2021 10:02:47 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 10 Jun 2021 10:06:39 +0800
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 dggpemm500006.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 10 Jun 2021 10:06:39 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd
	<linux-mtd@lists.infradead.org>, Maxime Ripard <mripard@kernel.org>, "Chen-Yu
 Tsai" <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-sunxi
	<linux-sunxi@lists.linux.dev>
CC: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 1/1] mtd: rawnand: sunxi: remove unnecessary oom message
Date: Thu, 10 Jun 2021 10:06:20 +0800
Message-ID: <20210610020620.14970-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.177.72]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500006.china.huawei.com (7.185.36.236)
X-CFilter-Loop: Reflected

Fixes scripts/checkpatch.pl warning:
WARNING: Possible unnecessary 'out of memory' message

Remove it can help us save a bit of memory.

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 923a9e236fcf62c..ea953e31933ebba 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1972,10 +1972,8 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 
 	sunxi_nand = devm_kzalloc(dev, struct_size(sunxi_nand, sels, nsels),
 				  GFP_KERNEL);
-	if (!sunxi_nand) {
-		dev_err(dev, "could not allocate chip\n");
+	if (!sunxi_nand)
 		return -ENOMEM;
-	}
 
 	sunxi_nand->nsels = nsels;
 
-- 
2.26.0.106.g9fadedd


