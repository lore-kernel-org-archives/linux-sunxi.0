Received: from mail.nfschina.com (mail.nfschina.com [124.16.136.209])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10BD2EA3
	for <linux-sunxi@lists.linux.dev>; Wed, 27 Jul 2022 08:38:03 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
	by mail.nfschina.com (Postfix) with ESMTP id 79F3C1E80D54;
	Wed, 27 Jul 2022 16:38:06 +0800 (CST)
X-Virus-Scanned: amavisd-new at test.com
Received: from mail.nfschina.com ([127.0.0.1])
	by localhost (mail.nfschina.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N2UwmunMFWYb; Wed, 27 Jul 2022 16:38:03 +0800 (CST)
Received: from localhost.localdomain (unknown [219.141.250.2])
	(Authenticated sender: zeming@nfschina.com)
	by mail.nfschina.com (Postfix) with ESMTPA id 62C1D1E80D05;
	Wed, 27 Jul 2022 16:38:03 +0800 (CST)
From: Li zeming <zeming@nfschina.com>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Li zeming <zeming@nfschina.com>
Subject: [PATCH] clocksource/drivers/sun5i: Remove unnecessary (void*) conversions
Date: Wed, 27 Jul 2022 16:37:51 +0800
Message-Id: <20220727083751.5540-1-zeming@nfschina.com>
X-Mailer: git-send-email 2.18.2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Remove unnecessary void* type castings.

Signed-off-by: Li zeming <zeming@nfschina.com>
---
 drivers/clocksource/timer-sun5i.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-sun5i.c b/drivers/clocksource/timer-sun5i.c
index 85900f7fc69f..7d5fa9069906 100644
--- a/drivers/clocksource/timer-sun5i.c
+++ b/drivers/clocksource/timer-sun5i.c
@@ -142,7 +142,7 @@ static int sun5i_clkevt_next_event(unsigned long evt,
 
 static irqreturn_t sun5i_timer_interrupt(int irq, void *dev_id)
 {
-	struct sun5i_timer_clkevt *ce = (struct sun5i_timer_clkevt *)dev_id;
+	struct sun5i_timer_clkevt *ce = dev_id;
 
 	writel(0x1, ce->timer.base + TIMER_IRQ_ST_REG);
 	ce->clkevt.event_handler(&ce->clkevt);
-- 
2.18.2

