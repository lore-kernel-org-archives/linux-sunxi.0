Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD67E2F21
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Sep 2022 14:58:44 +0000 (UTC)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Mbm6Y10LSzHpb6;
	Mon, 26 Sep 2022 22:56:21 +0800 (CST)
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 26 Sep 2022 22:58:36 +0800
Received: from huawei.com (10.90.53.225) by kwepemm600014.china.huawei.com
 (7.193.23.54) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 26 Sep
 2022 22:58:35 +0800
From: Zhang Qilong <zhangqilong3@huawei.com>
To: <jic23@kernel.org>, <lars@metafoo.de>, <wens@csie.org>,
	<jernej.skrabec@gmail.com>, <samuel@sholland.org>
CC: <linux-iio@vger.kernel.org>, <linux-sunxi@lists.linux.dev>
Subject: [PATCH -next] iio: adc: sun4i-gpadc-iio: fix PM disable depth imbalance in sun4i_gpadc_probe
Date: Mon, 26 Sep 2022 23:02:06 +0800
Message-ID: <20220926150206.133549-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.225]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600014.china.huawei.com (7.193.23.54)
X-CFilter-Loop: Reflected

The pm_runtime_enable will increase power disable depth. Thus
a pairing decrement is needed on the error handling path to
keep it balanced according to context.

Fixes:b0a242894f11d ("iio: adc: sun4i-gpadc-iio: register in the thermal after registering in pm")
Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 drivers/iio/adc/sun4i-gpadc-iio.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/sun4i-gpadc-iio.c b/drivers/iio/adc/sun4i-gpadc-iio.c
index a6ade70dedf8..ec0b09878d54 100644
--- a/drivers/iio/adc/sun4i-gpadc-iio.c
+++ b/drivers/iio/adc/sun4i-gpadc-iio.c
@@ -648,7 +648,8 @@ static int sun4i_gpadc_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev,
 				"could not register thermal sensor: %ld\n",
 				PTR_ERR(info->tzd));
-			return PTR_ERR(info->tzd);
+			ret = PTR_ERR(info->tzd);
+			goto err_pm;
 		}
 	}
 
@@ -663,7 +664,7 @@ static int sun4i_gpadc_probe(struct platform_device *pdev)
 err_map:
 	if (!info->no_irq && IS_ENABLED(CONFIG_THERMAL_OF))
 		iio_map_array_unregister(indio_dev);
-
+err_pm:
 	pm_runtime_put(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 
-- 
2.25.1

