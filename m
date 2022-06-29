Received: from mail.nfschina.com (unknown [124.16.136.209])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA1B236F
	for <linux-sunxi@lists.linux.dev>; Wed, 29 Jun 2022 06:32:43 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
	by mail.nfschina.com (Postfix) with ESMTP id 8BAA21E80D11;
	Wed, 29 Jun 2022 14:26:01 +0800 (CST)
X-Virus-Scanned: amavisd-new at test.com
Received: from mail.nfschina.com ([127.0.0.1])
	by localhost (mail.nfschina.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XFCoZU6XrfkK; Wed, 29 Jun 2022 14:25:58 +0800 (CST)
Received: from localhost.localdomain (unknown [219.141.250.2])
	(Authenticated sender: zhoujie@nfschina.com)
	by mail.nfschina.com (Postfix) with ESMTPA id C2A681E80CDC;
	Wed, 29 Jun 2022 14:25:58 +0800 (CST)
From: Zhou jie <zhoujie@nfschina.com>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	kernel@nfschina.com,
	Zhou jie <zhoujie@nfschina.com>
Subject: [PATCH] drivers: remove unnecessary (void*) conversions.
Date: Wed, 29 Jun 2022 14:26:58 +0800
Message-Id: <20220629062658.56466-1-zhoujie@nfschina.com>
X-Mailer: git-send-email 2.18.2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

remove unnecessary void* type casting.

Signed-off-by: Zhou jie <zhoujie@nfschina.com>
---
 drivers/clocksource/timer-sun4i.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-sun4i.c b/drivers/clocksource/timer-sun4i.c
index 0ba8155b8287..6fe71f95e2c2 100644
--- a/drivers/clocksource/timer-sun4i.c
+++ b/drivers/clocksource/timer-sun4i.c
@@ -131,7 +131,7 @@ static void sun4i_timer_clear_interrupt(void __iomem *base)
 
 static irqreturn_t sun4i_timer_interrupt(int irq, void *dev_id)
 {
-	struct clock_event_device *evt = (struct clock_event_device *)dev_id;
+	struct clock_event_device *evt = dev_id;
 	struct timer_of *to = to_timer_of(evt);
 
 	sun4i_timer_clear_interrupt(timer_of_base(to));
-- 
2.18.2

