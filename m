Received: from mail.nfschina.com (unknown [124.16.136.209])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 646577B
	for <linux-sunxi@lists.linux.dev>; Wed, 20 Jul 2022 02:11:47 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
	by mail.nfschina.com (Postfix) with ESMTP id 75C8A1E80D46;
	Wed, 20 Jul 2022 10:03:28 +0800 (CST)
X-Virus-Scanned: amavisd-new at test.com
Received: from mail.nfschina.com ([127.0.0.1])
	by localhost (mail.nfschina.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6nnFMm1IVyhs; Wed, 20 Jul 2022 10:03:25 +0800 (CST)
Received: from localhost.localdomain.localdomain (unknown [219.141.250.2])
	(Authenticated sender: xupengfei@nfschina.com)
	by mail.nfschina.com (Postfix) with ESMTPA id AEB0F1E80C80;
	Wed, 20 Jul 2022 10:03:25 +0800 (CST)
From: XU pengfei <xupengfei@nfschina.com>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	XU pengfei <xupengfei@nfschina.com>
Subject: [PATCH 1/1] clocksource/drivers/sun4i: remove unnecessary (void*) conversions
Date: Wed, 20 Jul 2022 10:07:35 +0800
Message-Id: <20220720020735.3771-1-xupengfei@nfschina.com>
X-Mailer: git-send-email 2.18.2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

remove unnecessary void* type casting.

Signed-off-by: XU pengfei <xupengfei@nfschina.com>
---
 drivers/clocksource/timer-sun4i.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-sun4i.c b/drivers/clocksource/timer-sun4i.c
index bb6ea6c19829..94dc6e42e983 100644
--- a/drivers/clocksource/timer-sun4i.c
+++ b/drivers/clocksource/timer-sun4i.c
@@ -128,7 +128,7 @@ static void sun4i_timer_clear_interrupt(void __iomem *base)
 
 static irqreturn_t sun4i_timer_interrupt(int irq, void *dev_id)
 {
-	struct clock_event_device *evt = (struct clock_event_device *)dev_id;
+	struct clock_event_device *evt = dev_id;
 	struct timer_of *to = to_timer_of(evt);
 
 	sun4i_timer_clear_interrupt(timer_of_base(to));
-- 
2.18.2

