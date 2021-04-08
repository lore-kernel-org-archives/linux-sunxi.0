Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEB96D0E
	for <linux-sunxi@lists.linux.dev>; Thu,  8 Apr 2021 13:36:45 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FGMgL5xYXz9wbq;
	Thu,  8 Apr 2021 21:34:22 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.175) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Thu, 8 Apr 2021 21:36:26 +0800
From: Lu Jialin <lujialin4@huawei.com>
To: <lujialin4@huawei.com>, Jernej Skrabec <jernej.skrabec@siol.net>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <kernel-janitors@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH -next] media: sun8i: Fix PM reference leak in deinterlace_start_streaming()
Date: Thu, 8 Apr 2021 21:36:30 +0800
Message-ID: <20210408133630.56299-1-lujialin4@huawei.com>
X-Mailer: git-send-email 2.17.1
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.174.175]
X-CFilter-Loop: Reflected


pm_runtime_get_sync will increment pm usage counter even it failed.
Forgetting to putting operation will result in reference leak here.
Fix it by replacing it with pm_runtime_resume_and_get to keep usage
counter balanced.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Lu Jialin <lujialin4@huawei.com>
---
 drivers/media/platform/sunxi/sun8i-di/sun8i-di.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
index ed863bf5ea80..671e4a928993 100644
--- a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
+++ b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
@@ -589,7 +589,7 @@ static int deinterlace_start_streaming(struct vb2_queue *vq, unsigned int count)
 	int ret;
 
 	if (V4L2_TYPE_IS_OUTPUT(vq->type)) {
-		ret = pm_runtime_get_sync(dev);
+		ret = pm_runtime_resume_and_get(dev);
 		if (ret < 0) {
 			dev_err(dev, "Failed to enable module\n");
 

