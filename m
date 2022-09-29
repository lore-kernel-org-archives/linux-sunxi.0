Received: from out30-54.freemail.mail.aliyun.com (out30-54.freemail.mail.aliyun.com [115.124.30.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CAA10E8
	for <linux-sunxi@lists.linux.dev>; Thu, 29 Sep 2022 05:55:43 +0000 (UTC)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046060;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0VQyR3bJ_1664430004;
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0VQyR3bJ_1664430004)
          by smtp.aliyun-inc.com;
          Thu, 29 Sep 2022 13:40:05 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: yong.deng@magewell.com
Cc: mchehab@kernel.org,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yang Li <yang.lee@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] media: sun6i-csi: Remove unnecessary print function dev_err()
Date: Thu, 29 Sep 2022 13:40:03 +0800
Message-Id: <20220929054003.37487-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The print function dev_err() is redundant because platform_get_irq()
already prints an error.

Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=2314
Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
index 8b99c17e8403..9119f5e0e05e 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
@@ -913,7 +913,6 @@ static int sun6i_csi_resources_setup(struct sun6i_csi_device *csi_dev,
 
 	irq = platform_get_irq(platform_dev, 0);
 	if (irq < 0) {
-		dev_err(dev, "failed to get interrupt\n");
 		ret = -ENXIO;
 		goto error_clock_rate_exclusive;
 	}
-- 
2.20.1.7.g153144c

