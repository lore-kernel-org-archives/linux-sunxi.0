Received: from baidu.com (mx20.baidu.com [111.202.115.85])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E36A3FC2
	for <linux-sunxi@lists.linux.dev>; Wed,  1 Sep 2021 06:11:04 +0000 (UTC)
Received: from BC-Mail-Ex23.internal.baidu.com (unknown [172.31.51.17])
	by Forcepoint Email with ESMTPS id 7219324BE1E108A4E051;
	Wed,  1 Sep 2021 13:55:09 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex23.internal.baidu.com (172.31.51.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Wed, 1 Sep 2021 13:55:08 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Wed, 1 Sep 2021 13:55:08 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <caihuoqing@baidu.com>
CC: Sean Young <sean@mess.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, <linux-media@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] media: rc: sunxi-cir: Make use of the helper function devm_platform_ioremap_resource()
Date: Wed, 1 Sep 2021 13:55:02 +0800
Message-ID: <20210901055503.7229-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BJHW-Mail-Ex11.internal.baidu.com (10.127.64.34) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)

Use the devm_platform_ioremap_resource() helper instead of
calling platform_get_resource() and devm_ioremap_resource()
separately

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/media/rc/sunxi-cir.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
index 168e1d2c876a..391a591c1b75 100644
--- a/drivers/media/rc/sunxi-cir.c
+++ b/drivers/media/rc/sunxi-cir.c
@@ -255,7 +255,6 @@ static int sunxi_ir_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *dn = dev->of_node;
 	const struct sunxi_ir_quirks *quirks;
-	struct resource *res;
 	struct sunxi_ir *ir;
 	u32 b_clk_freq = SUNXI_IR_BASE_CLK;
 
@@ -301,8 +300,7 @@ static int sunxi_ir_probe(struct platform_device *pdev)
 	dev_dbg(dev, "set base clock frequency to %d Hz.\n", b_clk_freq);
 
 	/* IO */
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	ir->base = devm_ioremap_resource(dev, res);
+	ir->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(ir->base)) {
 		return PTR_ERR(ir->base);
 	}
-- 
2.25.1

