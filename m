Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F2E28F0
	for <linux-sunxi@lists.linux.dev>; Sat, 27 Aug 2022 09:53:38 +0000 (UTC)
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.57])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MFBL23FwXznTX3;
	Sat, 27 Aug 2022 17:31:54 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 27 Aug 2022 17:34:16 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Sat, 27 Aug
 2022 17:34:16 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-sunxi@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>
CC: <mturquette@baylibre.com>, <sboyd@kernel.org>, <wens@csie.org>,
	<jernej.skrabec@gmail.com>
Subject: [PATCH -next 3/3] clk: sunxi-ng: ccu-sun9i-a80-usb: Use dev_err_probe() helper
Date: Sat, 27 Aug 2022 17:41:51 +0800
Message-ID: <20220827094151.3323450-3-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220827094151.3323450-1-yangyingliang@huawei.com>
References: <20220827094151.3323450-1-yangyingliang@huawei.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected

dev_err() can be replace with dev_err_probe() which will check if error
code is -EPROBE_DEFER.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.c b/drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.c
index 575ae4ccc65f..a0fb0da8f356 100644
--- a/drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.c
+++ b/drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.c
@@ -101,12 +101,9 @@ static int sun9i_a80_usb_clk_probe(struct platform_device *pdev)
 		return PTR_ERR(reg);
 
 	bus_clk = devm_clk_get(&pdev->dev, "bus");
-	if (IS_ERR(bus_clk)) {
-		ret = PTR_ERR(bus_clk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Couldn't get bus clk: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(bus_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(bus_clk),
+				     "Couldn't get bus clk\n");
 
 	/* The bus clock needs to be enabled for us to access the registers */
 	ret = clk_prepare_enable(bus_clk);
-- 
2.25.1

