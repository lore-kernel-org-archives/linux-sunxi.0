Received: from out199-15.us.a.mail.aliyun.com (out199-15.us.a.mail.aliyun.com [47.90.199.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4FB15A0
	for <linux-sunxi@lists.linux.dev>; Thu, 31 Aug 2023 04:19:52 +0000 (UTC)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046050;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=9;SR=0;TI=SMTPD_---0Vqwo882_1693455255;
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0Vqwo882_1693455255)
          by smtp.aliyun-inc.com;
          Thu, 31 Aug 2023 12:14:16 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: jernej.skrabec@gmail.com,
	samuel@sholland.org,
	wens@csie.org
Cc: daniel.lezcano@linaro.org,
	tglx@linutronix.de,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH -next] clocksource/drivers/sun5i: Remove surplus dev_err() when using platform_get_irq()
Date: Thu, 31 Aug 2023 12:14:14 +0800
Message-Id: <20230831041414.66434-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no need to call the dev_err() function directly to print a
custom message when handling an error from either the platform_get_irq()
or platform_get_irq_byname() functions as both are going to display an
appropriate error message in case of a failure.

./drivers/clocksource/timer-sun5i.c:260:2-9: line 260 is redundant because platform_get_irq() already prints an error

Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
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
2.20.1.7.g153144c

