Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89BA3AA195
	for <linux-sunxi@lists.linux.dev>; Sat, 25 Jul 2026 11:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.181.215.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784979231; cv=none; b=JxXB9E8gh3Gjw13T9imBN0v1e0RK2I6NLWNoA2l/LDb2nCVHJ8eLHz//hMQ1rnPmy8MVOmxqsMfm6FENPZvXCv9NqVdguh0gNAqTcPy+YvnMcnBv8mIg4HSI0y2Wd7A6nl0c9nvLdYj3/7zsCrerrcHkb9X8L5FByRZkZQakIdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784979231; c=relaxed/simple;
	bh=+cmBvCWySQzLhKfWmPtp9rjSjfEJGBKKXbEo16iheG8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fgK6R2TPbW+3NYjzHNAawhqgu+0JNs4aC6eZTJb3CVws5H8kp7Ilil1AQw7jMt5EG8fBFB89yijvXSvwXZ/K4fpz9rfxzoC7T3j+rV+9I/EUlK8HcEktBtcyER5W4f7rk1znbu7t3ap3tL7HTYJ11hoc9QzZklhtHcNxuqd4Ym4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xff.cz; spf=pass smtp.mailfrom=xff.cz; dkim=pass (1024-bit key) header.d=xff.cz header.i=@xff.cz header.b=U2Y1AvV7; arc=none smtp.client-ip=195.181.215.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xff.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xff.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xff.cz header.i=@xff.cz header.b="U2Y1AvV7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
	t=1784979227; bh=+cmBvCWySQzLhKfWmPtp9rjSjfEJGBKKXbEo16iheG8=;
	h=From:To:Cc:Subject:Date:From;
	b=U2Y1AvV7YbCbbUt+dVubN2FyLQA95eRZFQ2bdWiY0KNB5ATJVio+r/M5w75IWAmSJ
	 ISnLZ/6ld0vqzaKoEuGX5j8Qn+oFToq4mqsBKXrZzt8M3rM5i83C8NbWslZ/aZ0Elv
	 ziO13yN44xDomfyUuLiPFzAb0iFNmjT2VgnoEuZ8=
From: =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megi@xff.cz>
To: linux-sunxi@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Ondrej Jirman <megi@xff.cz>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi SoC support)
Subject: [PATCH] clocksource/drivers/sun4i: Wait for pending reload before CTRL write
Date: Sat, 25 Jul 2026 13:33:38 +0200
Message-ID: <20260725113341.2250687-1-megi@xff.cz>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ondrej Jirman <megi@xff.cz>

The A13 manual says of TMR0_RELOAD: "After the bit is set, it can not be
written again before it's cleared automatically."  Both time_stop() and
time_start() read-modify-write the control register, so a reload still in
flight gets rewritten and the write can be dropped, leaving the timer
unarmed.  In oneshot mode this happens on every tick, and the tick
eventually stops for good.

Wait for the reload to clear first.  All control register updates go
through sun4i_clkevt_time_stop().

Without this my Allwinner A13 based Pocketbook Touch Lux 3 stops
scheduling processes during boot or within a few seconds of executing
userspace. Only sysrq+t over serial port works at this stage, which is
how I discovered the root cause.

Fixes: 7e14183469d8 ("clocksource: sun4i: Fix bug when switching from periodic to oneshot modes")
Signed-off-by: Ondrej Jirman <megi@xff.cz>
---
BTW, similar issue will likely be also in timer-sun5i.c but I don't have any
device that would exercise it. And it's possible that this triggers more easily
with CONFIG_HZ=1000 which I use.

 drivers/clocksource/timer-sun4i.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-sun4i.c b/drivers/clocksource/timer-sun4i.c
index 7bdcc60ad43c..2e7457f671c4 100644
--- a/drivers/clocksource/timer-sun4i.c
+++ b/drivers/clocksource/timer-sun4i.c
@@ -39,6 +39,9 @@
 
 #define TIMER_SYNC_TICKS	3
 
+/* The reload bit clears a couple of source clock cycles after it is set. */
+#define TIMER_RELOAD_MAX_POLL	100
+
 /*
  * When we disable a timer, we need to wait at least for 2 cycles of
  * the timer source clock. We will use for that the clocksource timer
@@ -53,9 +56,30 @@ static void sun4i_clkevt_sync(void __iomem *base)
 		cpu_relax();
 }
 
+/*
+ * The control register must not be written while a reload is still in
+ * flight, or the write can be dropped.
+ */
+static int sun4i_clkevt_wait_reload(void __iomem *base, u8 timer)
+{
+	int i;
+
+	for (i = 0; i < TIMER_RELOAD_MAX_POLL; i++) {
+		if (!(readl(base + TIMER_CTL_REG(timer)) & TIMER_CTL_RELOAD))
+			return 0;
+		cpu_relax();
+	}
+
+	return -ETIME;
+}
+
 static void sun4i_clkevt_time_stop(void __iomem *base, u8 timer)
 {
-	u32 val = readl(base + TIMER_CTL_REG(timer));
+	u32 val;
+
+	sun4i_clkevt_wait_reload(base, timer);
+
+	val = readl(base + TIMER_CTL_REG(timer));
 	writel(val & ~TIMER_CTL_ENABLE, base + TIMER_CTL_REG(timer));
 	sun4i_clkevt_sync(base);
 }
-- 
2.54.0

