Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8752320F
	for <linux-sunxi@lists.linux.dev>; Thu, 20 Oct 2022 12:35:54 +0000 (UTC)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.57])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MtRln2dVVzmVF7;
	Thu, 20 Oct 2022 20:31:01 +0800 (CST)
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 20 Oct 2022 20:35:39 +0800
Received: from huawei.com (10.90.53.225) by kwepemm600014.china.huawei.com
 (7.193.23.54) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 20 Oct
 2022 20:35:39 +0800
From: Zhang Qilong <zhangqilong3@huawei.com>
To: <jic23@kernel.org>, <lars@metafoo.de>, <wens@csie.org>,
	<jernej.skrabec@gmail.com>, <samuel@sholland.org>
CC: <linux-iio@vger.kernel.org>, <linux-sunxi@lists.linux.dev>
Subject: [PATCH v2 1/2] iio: adc: sun4i-gpadc-iio: Fix PM disable depth imbalance in sun4i_gpadc_probe()
Date: Thu, 20 Oct 2022 20:40:44 +0800
Message-ID: <20221020124045.77678-2-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
In-Reply-To: <20221020124045.77678-1-zhangqilong3@huawei.com>
References: <20221020124045.77678-1-zhangqilong3@huawei.com>
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

The pm_runtime_enable will increase power disable depth.
Thus a pairing decrement is needed on the error handling
path to keep it balanced according to context. In addtion,
the iio_map_array path has potentially been called.

We fix it by gotoing err_map when thermal_zone register
failed.

Fixes: b0a242894f11 ("iio: adc: sun4i-gpadc-iio: register in the thermal after registering in pm")
Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
v2:
- revert iio_map_array if it's necessary when thermal_zone
  register failed.
---
 drivers/iio/adc/sun4i-gpadc-iio.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/sun4i-gpadc-iio.c b/drivers/iio/adc/sun4i-gpadc-iio.c
index a6ade70dedf8..d2535dd28af8 100644
--- a/drivers/iio/adc/sun4i-gpadc-iio.c
+++ b/drivers/iio/adc/sun4i-gpadc-iio.c
@@ -648,7 +648,8 @@ static int sun4i_gpadc_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev,
 				"could not register thermal sensor: %ld\n",
 				PTR_ERR(info->tzd));
-			return PTR_ERR(info->tzd);
+			ret = PTR_ERR(info->tzd);
+			goto err_map;
 		}
 	}
 
-- 
2.25.1

