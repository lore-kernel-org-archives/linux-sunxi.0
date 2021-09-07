Received: from baidu.com (mx20.baidu.com [111.202.115.85])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 210C472
	for <linux-sunxi@lists.linux.dev>; Tue,  7 Sep 2021 07:42:14 +0000 (UTC)
Received: from BC-Mail-Ex28.internal.baidu.com (unknown [172.31.51.22])
	by Forcepoint Email with ESMTPS id 6BC6E84BD3E1C14A2EE7;
	Tue,  7 Sep 2021 15:42:07 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex28.internal.baidu.com (172.31.51.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 7 Sep 2021 15:42:07 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Tue, 7 Sep 2021 15:42:06 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <caihuoqing@baidu.com>
CC: Jassi Brar <jassisinghbrar@gmail.com>, Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>
Subject: [PATCH] mailbox: sun6i: Make use of the helper function devm_platform_ioremap_resource()
Date: Tue, 7 Sep 2021 15:42:00 +0800
Message-ID: <20210907074201.2553-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BJHW-Mail-Ex09.internal.baidu.com (10.127.64.32) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)

Use the devm_platform_ioremap_resource() helper instead of
calling platform_get_resource() and devm_ioremap_resource()
separately

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/mailbox/sun6i-msgbox.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/mailbox/sun6i-msgbox.c b/drivers/mailbox/sun6i-msgbox.c
index ccecf2e5941d..7f8d931042d3 100644
--- a/drivers/mailbox/sun6i-msgbox.c
+++ b/drivers/mailbox/sun6i-msgbox.c
@@ -197,7 +197,6 @@ static int sun6i_msgbox_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct mbox_chan *chans;
 	struct reset_control *reset;
-	struct resource *res;
 	struct sun6i_msgbox *mbox;
 	int i, ret;
 
@@ -246,13 +245,7 @@ static int sun6i_msgbox_probe(struct platform_device *pdev)
 		goto err_disable_unprepare;
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		ret = -ENODEV;
-		goto err_disable_unprepare;
-	}
-
-	mbox->regs = devm_ioremap_resource(&pdev->dev, res);
+	mbox->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(mbox->regs)) {
 		ret = PTR_ERR(mbox->regs);
 		dev_err(dev, "Failed to map MMIO resource: %d\n", ret);
-- 
2.25.1

