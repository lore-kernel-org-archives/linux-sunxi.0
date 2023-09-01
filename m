Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C786179D8
	for <linux-sunxi@lists.linux.dev>; Fri,  1 Sep 2023 07:31:57 +0000 (UTC)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.55])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RcTgQ5b68zNmvv;
	Fri,  1 Sep 2023 15:09:54 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Fri, 1 Sep
 2023 15:13:32 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner
	<tglx@linutronix.de>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
	<jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Mans
 Rullgard <mans@mansr.com>, Maxime Ripard <mripard@kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next] clocksource/drivers/sun5i: Remove redundant dev_err() for platform_get_irq()
Date: Fri, 1 Sep 2023 15:13:28 +0800
Message-ID: <20230901071328.1322235-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected

Since commit 7723f4c5ecdb ("driver core: platform: Add an error message
to platform_get_irq*()") and commit 2043727c2882 ("driver core:
platform: Make use of the helper function dev_err_probe()"), there is
no need to call the dev_err() function directly to print a custom
message when handling an error from platform_get_irq() function as it is
going to display an appropriate error message in case of a failure.

Fixes: 7e5bac610d2f ("clocksource/drivers/sun5i: Convert to platform device driver")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/clocksource/timer-sun5i.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clocksource/timer-sun5i.c b/drivers/clocksource/timer-sun5i.c
index 69fee3540d37..0d229a9058da 100644
--- a/drivers/clocksource/timer-sun5i.c
+++ b/drivers/clocksource/timer-sun5i.c
@@ -256,10 +256,8 @@ static int sun5i_timer_probe(struct platform_device *pdev)
 	}
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(dev, "Can't get IRQ\n");
+	if (irq < 0)
 		return irq;
-	}
 
 	clk = devm_clk_get_enabled(dev, NULL);
 	if (IS_ERR(clk)) {
-- 
2.34.1

