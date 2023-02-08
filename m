Received: from mxct.zte.com.cn (mxct.zte.com.cn [58.251.27.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021402109
	for <linux-sunxi@lists.linux.dev>; Wed,  8 Feb 2023 09:37:41 +0000 (UTC)
Received: from mxde.zte.com.cn (unknown [10.35.20.121])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4PBZfW31m1z1Dwh
	for <linux-sunxi@lists.linux.dev>; Wed,  8 Feb 2023 17:37:39 +0800 (CST)
Received: from mxus.zte.com.cn (unknown [10.36.20.194])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mxde.zte.com.cn (FangMail) with ESMTPS id 4PBZf25ln0zBRK7d
	for <linux-sunxi@lists.linux.dev>; Wed,  8 Feb 2023 17:37:14 +0800 (CST)
Received: from mxhk.zte.com.cn (unknown [192.168.250.138])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mxus.zte.com.cn (FangMail) with ESMTPS id 4PBZdt5Bgxz52XGL
	for <linux-sunxi@lists.linux.dev>; Wed,  8 Feb 2023 17:37:06 +0800 (CST)
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4PBZdh6Drnz4xVnD;
	Wed,  8 Feb 2023 17:36:56 +0800 (CST)
Received: from xaxapp03.zte.com.cn ([10.88.97.17])
	by mse-fl2.zte.com.cn with SMTP id 3189alMZ098566;
	Wed, 8 Feb 2023 17:36:47 +0800 (+08)
	(envelope-from ye.xingchen@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid31;
	Wed, 8 Feb 2023 17:36:50 +0800 (CST)
Date: Wed, 8 Feb 2023 17:36:50 +0800 (CST)
X-Zmail-TransId: 2af963e36d32ffffffff83573948
X-Mailer: Zmail v1.0
Message-ID: <202302081736500534579@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
From: <ye.xingchen@zte.com.cn>
To: <lee@kernel.org>
Cc: <wens@csie.org>, <jernej.skrabec@gmail.com>, <samuel@sholland.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
        <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIXSBtZmQ6IHN1bjRpLWdwYWRjOiB1c2XCoGRldm1fcGxhdGZvcm1fZ2V0X2FuZF9pb3JlbWFwX3Jlc291cmNlKCk=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 3189alMZ098566
X-FangMail-Miltered: at esgde01-2.novalocal with ID 63E36D4A.000 by FangMail milter!
X-FangMail-Envelope: 1675849034/4PBZf25ln0zBRK7d/63E36D4A.000/10.36.20.194/[10.36.20.194]/mxus.zte.com.cn/<ye.xingchen@zte.com.cn>
X-Fangmail-Gw-Spam-Type: 0
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 63E36D62.000/4PBZfW31m1z1Dwh

From: Ye Xingchen <ye.xingchen@zte.com.cn>

Convert platform_get_resource(), devm_ioremap_resource() to a single
call to devm_platform_get_and_ioremap_resource(), as this is exactly
what this function does.

Signed-off-by: Ye Xingchen <ye.xingchen@zte.com.cn>
---
 drivers/mfd/sun4i-gpadc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mfd/sun4i-gpadc.c b/drivers/mfd/sun4i-gpadc.c
index edc180d83a4b..d1cbea27b136 100644
--- a/drivers/mfd/sun4i-gpadc.c
+++ b/drivers/mfd/sun4i-gpadc.c
@@ -93,7 +93,6 @@ MODULE_DEVICE_TABLE(of, sun4i_gpadc_of_match);
 static int sun4i_gpadc_probe(struct platform_device *pdev)
 {
 	struct sun4i_gpadc_dev *dev;
-	struct resource *mem;
 	const struct of_device_id *of_id;
 	const struct mfd_cell *cells;
 	unsigned int irq, size;
@@ -124,8 +123,7 @@ static int sun4i_gpadc_probe(struct platform_device *pdev)
 	if (!dev)
 		return -ENOMEM;

-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	dev->base = devm_ioremap_resource(&pdev->dev, mem);
+	dev->base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
 	if (IS_ERR(dev->base))
 		return PTR_ERR(dev->base);

-- 
2.25.1
