Received: from mxct.zte.com.cn (mxct.zte.com.cn [58.251.27.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240B0809
	for <linux-sunxi@lists.linux.dev>; Fri, 11 Nov 2022 08:50:24 +0000 (UTC)
Received: from mxde.zte.com.cn (unknown [10.35.20.121])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4N7sf80GFNz1DyN
	for <linux-sunxi@lists.linux.dev>; Fri, 11 Nov 2022 16:42:40 +0800 (CST)
Received: from mxus.zte.com.cn (unknown [10.207.168.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mxde.zte.com.cn (FangMail) with ESMTPS id 4N7sdm3vn0z9vSpQ
	for <linux-sunxi@lists.linux.dev>; Fri, 11 Nov 2022 16:42:20 +0800 (CST)
Received: from mxhk.zte.com.cn (unknown [192.168.250.138])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mxus.zte.com.cn (FangMail) with ESMTPS id 4N7sdc36V0zdmYkm
	for <linux-sunxi@lists.linux.dev>; Fri, 11 Nov 2022 16:42:12 +0800 (CST)
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4N7sdR1xqfz5PkGl;
	Fri, 11 Nov 2022 16:42:03 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.40.50])
	by mse-fl2.zte.com.cn with SMTP id 2AB8fntW013165;
	Fri, 11 Nov 2022 16:41:49 +0800 (+08)
	(envelope-from ye.xingchen@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid31;
	Fri, 11 Nov 2022 16:41:51 +0800 (CST)
Date: Fri, 11 Nov 2022 16:41:51 +0800 (CST)
X-Zmail-TransId: 2afa636e0acfffffffffc94e740f
X-Mailer: Zmail v1.0
Message-ID: <202211111641514826535@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
From: <ye.xingchen@zte.com.cn>
To: <fengzheng923@gmail.com>
Cc: <lgirdwood@gmail.com>, <broonie@kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
        <linux-kernel@vger.kernel.org>, <chi.minghao@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSBBU29DOiBzdW54aTogdXNlIGRldm1fcGxhdGZvcm1fZ2V0X2FuZF9pb3JlbWFwX3Jlc291cmNlKCk=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 2AB8fntW013165
X-Fangmail-Gw-Spam-Type: 0
X-FangMail-Miltered: at cgslv5.04-192.168.251.14.novalocal with ID 636E0AFE.000 by FangMail milter!
X-FangMail-Envelope: 1668156160/4N7sf80GFNz1DyN/636E0AFE.000/10.35.20.121/[10.35.20.121]/mxde.zte.com.cn/<ye.xingchen@zte.com.cn>
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 636E0AFE.000/4N7sf80GFNz1DyN

From: Minghao Chi <chi.minghao@zte.com.cn>

Convert platform_get_resource(), devm_ioremap_resource() to a single
call to devm_platform_get_and_ioremap_resource(), as this is exactly
what this function does.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
 sound/soc/sunxi/sun50i-dmic.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/sunxi/sun50i-dmic.c b/sound/soc/sunxi/sun50i-dmic.c
index 62509cb02995..069c993acb31 100644
--- a/sound/soc/sunxi/sun50i-dmic.c
+++ b/sound/soc/sunxi/sun50i-dmic.c
@@ -317,8 +317,7 @@ static int sun50i_dmic_probe(struct platform_device *pdev)
 		return -ENOMEM;

 	/* Get the addresses */
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(&pdev->dev, res);
+	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(base))
 		return dev_err_probe(&pdev->dev, PTR_ERR(base),
 				     "get resource failed.\n");
-- 
2.25.1
