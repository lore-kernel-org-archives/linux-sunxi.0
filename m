Received: from mail.archlinux.org (mail.archlinux.org [95.216.189.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9A92AE7A
	for <linux-sunxi@lists.linux.dev>; Wed, 24 Jun 2026 22:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.216.189.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782338706; cv=none; b=T9mLn6BCjh9v1Tq3cAjpVSq3riKVMetecn8aIwh+sjGi6K0di2AuGrYgIbutyTv349LCmYp7aIc2O2WPpniS0yj+rk71t/ZNr+iDK2fp5KWWDdrB6iPA9qLPdueQWuQkdsy3kkXANj53MmvPEKQfDeuA1MLJiTwPZcPyz1flh3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782338706; c=relaxed/simple;
	bh=DzsGDJlo0P6UfxfIIVwaI4Ge4r3irh7jrVqwbjP2kbE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ICp9L1DQimt/u7xBJ+YYFA2A1Us0ZXaOTGIE/pmQVhUF+g+G6PbUqjfIEu/cXD8FQCbvZtymOJinJ+on1wzBHbVFp4t3AS8PZLCCc0GO7YbYEllEFix0SffAu6HHj2N2jK2DSKV+jaLn+8DH95nMeAQkDeVRX1EJdCVRK4/I3SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=archlinux.org; spf=pass smtp.mailfrom=archlinux.org; dkim=pass (4096-bit key) header.d=archlinux.org header.i=@archlinux.org header.b=G0Wxt0r2; dkim=permerror (0-bit key) header.d=archlinux.org header.i=@archlinux.org header.b=rHA48A4i; arc=none smtp.client-ip=95.216.189.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=archlinux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=archlinux.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=archlinux.org header.i=@archlinux.org header.b="G0Wxt0r2";
	dkim=permerror (0-bit key) header.d=archlinux.org header.i=@archlinux.org header.b="rHA48A4i"
From: Felix Yan <felixonmars@archlinux.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=archlinux.org;
	s=dkim-rsa; t=1782338701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CRHXdpLz3bOfMCjFuHufEqTdHRjLCSuPmqyaKfN5Y1s=;
	b=G0Wxt0r20645tYPp6uRdYV4qaOMahAPpt9HIEZEhBJUZ9LvB0FRD4Nv7314wJIPfugc7Rf
	tFNq6CPbfDbHkjRjlPBeOTgzl/RF/toPHCNmRuNpRK5bc4+dLqA+i3Sa+LD8vuj6F50xJz
	KxHRme9PoF/TNfHzHYSJwaDjHSBTorQFY6txaMUiNd44grAIEIi32QqhL8Q8kA7yMVOUe1
	QCdvInGQwnzKT53O6Up7CdMkhIvcTNXxoxMGAdOebFw9NAzWrcjO+0Y07WIkEt5QHLowV/
	EUOZIWcXgdIDUYyvvtj1qxjwzEkBTIkTEshM4FxV5LrQ4qXoiOzIXvW9n0CK70SRcH6iRM
	5e44m1drrrfIOPjiX0XH1HSn1OV3V+EZpIhMW/bjqQPcVpTnSyeXYKqrdGEFijVV+Se2EC
	BvK/4ewxXjp0+yFE0VKd+nt4JEwRTwIY3FWFi7+egV80xo1+2bLUQ5qc+WoeGxSoOfT7pF
	xthcPBheysDSoRCc/xMYBtzuSV1013HjhQA6eI4kyKP++nGvZJByScfOXs4J/EzLagyWHG
	KuTSDY/GLnu8BHjF6a/57aVuKAllVv2H4EkdNlvp7qe58Neob0jB58xgbStpx6O9Kka3M0
	jzAWsSGnIaV4y2D+HsdEzRrMP/DT80ZGQ5LQS/rfVxxslJVuwrHjE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=archlinux.org;
	s=dkim-ed25519; t=1782338701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CRHXdpLz3bOfMCjFuHufEqTdHRjLCSuPmqyaKfN5Y1s=;
	b=rHA48A4ipOYEPx6vlpsau0zfNunJTQvt1uNml7YWW3bqQlSRwEr/AuO9AlLUWNVGXnt++S
	P0IvDvf1UQDBKKAA==
Authentication-Results: mail.archlinux.org;
	auth=pass smtp.auth=felixonmars smtp.mailfrom=felixonmars@archlinux.org
To: daniel.lezcano@kernel.org,
	tglx@kernel.org
Cc: wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	indrek.kruusa@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Felix Yan <felixonmars@archlinux.org>,
	stable@vger.kernel.org
Subject: [PATCH] clocksource/drivers/timer-sun4i: Advertise a real minimum delta
Date: Thu, 25 Jun 2026 06:04:34 +0800
Message-ID: <20260624220434.4183732-1-felixonmars@archlinux.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <CA+fTLhgLmTY+exGujKf8OYYQvcEW5X5NJ_5sLq2AYL6zER2c0A@mail.gmail.com>
References: <CA+fTLhgLmTY+exGujKf8OYYQvcEW5X5NJ_5sLq2AYL6zER2c0A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sun4i_clkevt_next_event() compensates for the timer stop/start
synchronization delay by programming evt - TIMER_SYNC_TICKS into the
hardware interval register. The clockevent device currently advertises
TIMER_SYNC_TICKS as min_delta_ticks, so the clockevents core is allowed
to call set_next_event() with evt == TIMER_SYNC_TICKS.

That programs a zero-tick interval. With oneshot/highres/nohz timer
operation this can leave the next event stuck, which was observed as a
boot hang on Allwinner D1 after the clockevents core started reusing
forced minimum-delta events.

Advertise one extra tick instead, so the smallest event accepted by the
core still programs at least one hardware tick after the synchronization
compensation.

Fixes: 12e1480bcb49 ("clocksource: sun4i: Report the minimum tick that we can program")
Cc: stable@vger.kernel.org
Reported-by: Indrek Kruusa <indrek.kruusa@gmail.com>
Closes: https://lore.kernel.org/linux-riscv/CA+fTLhgLmTY+exGujKf8OYYQvcEW5X5NJ_5sLq2AYL6zER2c0A@mail.gmail.com/
Assisted-by: Codex:gpt-5.5
Signed-off-by: Felix Yan <felixonmars@archlinux.org>
---
 drivers/clocksource/timer-sun4i.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-sun4i.c b/drivers/clocksource/timer-sun4i.c
index 7bdcc60ad43c..c2d04ab7cf2d 100644
--- a/drivers/clocksource/timer-sun4i.c
+++ b/drivers/clocksource/timer-sun4i.c
@@ -208,7 +208,7 @@ static int __init sun4i_timer_init(struct device_node *node)
 	sun4i_timer_clear_interrupt(timer_of_base(&to));
 
 	clockevents_config_and_register(&to.clkevt, timer_of_rate(&to),
-					TIMER_SYNC_TICKS, 0xffffffff);
+					TIMER_SYNC_TICKS + 1, 0xffffffff);
 
 	/* Enable timer0 interrupt */
 	val = readl(timer_of_base(&to) + TIMER_IRQ_EN_REG);
-- 
2.54.0

