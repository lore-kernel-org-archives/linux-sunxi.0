Received: from mxct.zte.com.cn (mxct.zte.com.cn [58.251.27.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1F6376
	for <linux-sunxi@lists.linux.dev>; Fri, 17 Feb 2023 02:45:32 +0000 (UTC)
Received: from mxde.zte.com.cn (unknown [10.35.20.165])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4PHwwR4jT6z1DxG
	for <linux-sunxi@lists.linux.dev>; Fri, 17 Feb 2023 10:38:15 +0800 (CST)
Received: from mxus.zte.com.cn (unknown [10.36.20.94])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mxde.zte.com.cn (FangMail) with ESMTPS id 4PHww318YRz54hQN
	for <linux-sunxi@lists.linux.dev>; Fri, 17 Feb 2023 10:37:55 +0800 (CST)
Received: from mxhk.zte.com.cn (unknown [192.168.250.138])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mxus.zte.com.cn (FangMail) with ESMTPS id 4PHwvv0K15z9wn6S
	for <linux-sunxi@lists.linux.dev>; Fri, 17 Feb 2023 10:37:47 +0800 (CST)
Received: from mxct.zte.com.cn (unknown [192.168.251.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4PHwvk01Z2z6FK2S
	for <linux-sunxi@lists.linux.dev>; Fri, 17 Feb 2023 10:37:38 +0800 (CST)
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4PHwvX3dZ1z501RH;
	Fri, 17 Feb 2023 10:37:28 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl2.zte.com.cn with SMTP id 31H2aap7094717;
	Fri, 17 Feb 2023 10:36:36 +0800 (+08)
	(envelope-from ye.xingchen@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid31;
	Fri, 17 Feb 2023 10:36:37 +0800 (CST)
Date: Fri, 17 Feb 2023 10:36:37 +0800 (CST)
X-Zmail-TransId: 2af963eee835157bf665
X-Mailer: Zmail v1.0
Message-ID: <202302171036375639285@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
From: <ye.xingchen@zte.com.cn>
To: <dmitry.torokhov@gmail.com>
Cc: <hdegoede@redhat.com>, <wens@csie.org>, <jernej.skrabec@gmail.com>,
        <samuel@sholland.org>, <linux-input@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
        <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIXSBJbnB1dDogc3VuNGktbHJhZGMta2V5cyAtIFVzZcKgZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlKCk=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 31H2aap7094717
X-FangMail-Miltered: at esgde01-1.novalocal with ID 63EEE882.001 by FangMail milter!
X-FangMail-Envelope: 1676601475/4PHww318YRz54hQN/63EEE882.001/10.36.20.94/[10.36.20.94]/mxus.zte.com.cn/<ye.xingchen@zte.com.cn>
X-Fangmail-Gw-Spam-Type: 0
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 63EEE896.000/4PHwwR4jT6z1DxG

From: Ye Xingchen <ye.xingchen@zte.com.cn>

Convert platform_get_resource(), devm_ioremap_resource() to a single
call to Use devm_platform_ioremap_resource(), as this is exactly
what this function does.

Signed-off-by: Ye Xingchen <ye.xingchen@zte.com.cn>
---
 drivers/input/keyboard/sun4i-lradc-keys.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/input/keyboard/sun4i-lradc-keys.c b/drivers/input/keyboard/sun4i-lradc-keys.c
index 15c15c0958b0..95d927cc8b7e 100644
--- a/drivers/input/keyboard/sun4i-lradc-keys.c
+++ b/drivers/input/keyboard/sun4i-lradc-keys.c
@@ -307,8 +307,7 @@ static int sun4i_lradc_probe(struct platform_device *pdev)

 	input_set_drvdata(lradc->input, lradc);

-	lradc->base = devm_ioremap_resource(dev,
-			      platform_get_resource(pdev, IORESOURCE_MEM, 0));
+	lradc->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(lradc->base))
 		return PTR_ERR(lradc->base);

-- 
2.25.1
