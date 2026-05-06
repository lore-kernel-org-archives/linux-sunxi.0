Received: from s106b.cyber-folks.pl (s106b.cyber-folks.pl [195.78.66.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7958481AB1;
	Wed,  6 May 2026 15:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.78.66.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778080261; cv=none; b=HE7zSCDxYbO952rbv5XYu5PB8O/HFbhw3qCs5RAzPy5GUtGH3yAdKm6gLIJson9bX+lL4/4XszKVCzCnvvFBtaPTZAQR3H+C2sqMS11R+jJyoD1sDNVXoshG3tmZIrl241lMbDSYDVN50elkl3RqLANQgKFQjYVP734NkvlNAFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778080261; c=relaxed/simple;
	bh=1L3rHOJVuAnpxzydteKfdfNTRtbJkFSx+Yr9EHtcqh8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gGMUTV+gh2qpGpMzO/WEEIDUmZxfonaBsV80l00YiFQrgcknLm4JeYyGV0hrq8GRAU7uldMUzERQ/BR933Q8+5a2swtQ4P0BxwWdeItwrJS3OO9f90q/GcfCOww8weyPzk9S3cBWQU2BRsUXC+sscN7Co9IGy/fb44DDKrXBlcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl; spf=pass smtp.mailfrom=mmpsystems.pl; dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b=HNxCjowt; arc=none smtp.client-ip=195.78.66.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b="HNxCjowt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0lyxdy796hLpUJj9EnQoEnVMUSThmvftMavjmWl7Rps=; b=HNxCjowtS+jyOLnrkhoLKyn2RQ
	QSeYES65TDO9yCZRCONAUZfE7SVgozgIxVdQ4FbohpTsb7NncTr+KshRz87IAPf6VXykUV/zyA/S4
	QPdyPT5hafOJqgvhJX0YQvG2sZfLv+1hVViZx6+gd1mh/K3qI8+vWUX1Bli0C9/vxmmkQa1+vWRjd
	Y+WHFnq5twV74kw65ETzSo3vzgJG/KsUICQSPk3jmSNNXP5bt1CCpbYc+6KeXvY9yNsFJw3sV4pu0
	PKKOdKNT13d7BHXqzXyVcSJS2COk1tp0j084ONyyibYnXfCZgojemCOsL509AkEPfIW0QydHd/9qa
	AZHm3/UA==;
Received: from user-188-33-36-99.play-internet.pl ([188.33.36.99] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1wKdtj-00000003auJ-2TuZ;
	Wed, 06 May 2026 17:10:51 +0200
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Date: Wed, 06 May 2026 17:10:27 +0200
Subject: [PATCH v4 2/4] clocksource/drivers/sun5i: add D1 hstimer support
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-h616-t113s-hstimer-v4-2-591d425863d6@mmpsystems.pl>
References: <20260506-h616-t113s-hstimer-v4-0-591d425863d6@mmpsystems.pl>
In-Reply-To: <20260506-h616-t113s-hstimer-v4-0-591d425863d6@mmpsystems.pl>
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: Michal Piekos <michal.piekos@mmpsystems.pl>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Andre Przywara <andre.przywara@arm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778080247; l=6812;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=1L3rHOJVuAnpxzydteKfdfNTRtbJkFSx+Yr9EHtcqh8=;
 b=ThUGr/fA0GKCDHpJqpH/f1YPTRX2yF7Uy9hkseuGoDdPfl5DZh92BRjIJe9v2O/wQPNOguRfM
 aqw/LyAuenpD7pCkXLjpO4mtPPK1HZFNykQ693ptZxSD1KFmcb4XqqV
X-Developer-Key: i=michal.piekos@mmpsystems.pl; a=ed25519;
 pk=Aixyx03If7ZDamiKKN0lsa+0mtA+WjIuIf2ZQVYNBqg=
X-Authenticated-Id: michal.piekos@mmpsystems.pl

D1 high speed timer differs from existing timer-sun5i by register base
offset.

Add sunxi quirks to handle D1 specific offset.
Add D1 compatible string to OF match table.

Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
---
 drivers/clocksource/timer-sun5i.c | 84 ++++++++++++++++++++++++++++++---------
 1 file changed, 65 insertions(+), 19 deletions(-)

diff --git a/drivers/clocksource/timer-sun5i.c b/drivers/clocksource/timer-sun5i.c
index f827d3f98f60..517c048a4870 100644
--- a/drivers/clocksource/timer-sun5i.c
+++ b/drivers/clocksource/timer-sun5i.c
@@ -18,21 +18,30 @@
 #include <linux/slab.h>
 #include <linux/platform_device.h>
 
-#define TIMER_IRQ_EN_REG		0x00
+#define TIMER_IRQ_EN_REG			0x00
 #define TIMER_IRQ_EN(val)			BIT(val)
-#define TIMER_IRQ_ST_REG		0x04
-#define TIMER_CTL_REG(val)		(0x20 * (val) + 0x10)
+#define TIMER_IRQ_ST_REG			0x04
+#define TIMER_CTL_REG(val, offset)		(0x20 * (val) + 0x10 + (offset))
 #define TIMER_CTL_ENABLE			BIT(0)
 #define TIMER_CTL_RELOAD			BIT(1)
 #define TIMER_CTL_CLK_PRES(val)			(((val) & 0x7) << 4)
 #define TIMER_CTL_ONESHOT			BIT(7)
-#define TIMER_INTVAL_LO_REG(val)	(0x20 * (val) + 0x14)
-#define TIMER_INTVAL_HI_REG(val)	(0x20 * (val) + 0x18)
-#define TIMER_CNTVAL_LO_REG(val)	(0x20 * (val) + 0x1c)
-#define TIMER_CNTVAL_HI_REG(val)	(0x20 * (val) + 0x20)
+#define TIMER_INTVAL_LO_REG(val, offset)	(0x20 * (val) + 0x14 + (offset))
+#define TIMER_INTVAL_HI_REG(val, offset)	(0x20 * (val) + 0x18 + (offset))
+#define TIMER_CNTVAL_LO_REG(val, offset)	(0x20 * (val) + 0x1c + (offset))
+#define TIMER_CNTVAL_HI_REG(val, offset)	(0x20 * (val) + 0x20 + (offset))
 
 #define TIMER_SYNC_TICKS	3
 
+/**
+ * struct sunxi_timer_quirks - Differences between SoC variants.
+ *
+ * @from_ctl_base_offset: offset applied from ctl register onwards
+ */
+struct sunxi_timer_quirks {
+	u32 from_ctl_base_offset;
+};
+
 struct sun5i_timer {
 	void __iomem		*base;
 	struct clk		*clk;
@@ -40,6 +49,7 @@ struct sun5i_timer {
 	u32			ticks_per_jiffy;
 	struct clocksource	clksrc;
 	struct clock_event_device	clkevt;
+	const struct sunxi_timer_quirks *quirks;
 };
 
 #define nb_to_sun5i_timer(x) \
@@ -57,28 +67,36 @@ struct sun5i_timer {
  */
 static void sun5i_clkevt_sync(struct sun5i_timer *ce)
 {
-	u32 old = readl(ce->base + TIMER_CNTVAL_LO_REG(1));
+	u32 offset = ce->quirks->from_ctl_base_offset;
+	u32 old = readl(ce->base + TIMER_CNTVAL_LO_REG(1, offset));
 
-	while ((old - readl(ce->base + TIMER_CNTVAL_LO_REG(1))) < TIMER_SYNC_TICKS)
+	while ((old - readl(ce->base + TIMER_CNTVAL_LO_REG(1, offset))) <
+	       TIMER_SYNC_TICKS)
 		cpu_relax();
 }
 
 static void sun5i_clkevt_time_stop(struct sun5i_timer *ce, u8 timer)
 {
-	u32 val = readl(ce->base + TIMER_CTL_REG(timer));
-	writel(val & ~TIMER_CTL_ENABLE, ce->base + TIMER_CTL_REG(timer));
+	u32 offset = ce->quirks->from_ctl_base_offset;
+	u32 val = readl(ce->base + TIMER_CTL_REG(timer, offset));
+
+	writel(val & ~TIMER_CTL_ENABLE,
+	       ce->base + TIMER_CTL_REG(timer, offset));
 
 	sun5i_clkevt_sync(ce);
 }
 
 static void sun5i_clkevt_time_setup(struct sun5i_timer *ce, u8 timer, u32 delay)
 {
-	writel(delay, ce->base + TIMER_INTVAL_LO_REG(timer));
+	u32 offset = ce->quirks->from_ctl_base_offset;
+
+	writel(delay, ce->base + TIMER_INTVAL_LO_REG(timer, offset));
 }
 
 static void sun5i_clkevt_time_start(struct sun5i_timer *ce, u8 timer, bool periodic)
 {
-	u32 val = readl(ce->base + TIMER_CTL_REG(timer));
+	u32 offset = ce->quirks->from_ctl_base_offset;
+	u32 val = readl(ce->base + TIMER_CTL_REG(timer, offset));
 
 	if (periodic)
 		val &= ~TIMER_CTL_ONESHOT;
@@ -86,7 +104,7 @@ static void sun5i_clkevt_time_start(struct sun5i_timer *ce, u8 timer, bool perio
 		val |= TIMER_CTL_ONESHOT;
 
 	writel(val | TIMER_CTL_ENABLE | TIMER_CTL_RELOAD,
-	       ce->base + TIMER_CTL_REG(timer));
+	       ce->base + TIMER_CTL_REG(timer, offset));
 }
 
 static int sun5i_clkevt_shutdown(struct clock_event_device *clkevt)
@@ -141,8 +159,9 @@ static irqreturn_t sun5i_timer_interrupt(int irq, void *dev_id)
 static u64 sun5i_clksrc_read(struct clocksource *clksrc)
 {
 	struct sun5i_timer *cs = clksrc_to_sun5i_timer(clksrc);
+	u32 offset = cs->quirks->from_ctl_base_offset;
 
-	return ~readl(cs->base + TIMER_CNTVAL_LO_REG(1));
+	return ~readl(cs->base + TIMER_CNTVAL_LO_REG(1, offset));
 }
 
 static int sun5i_rate_cb(struct notifier_block *nb,
@@ -173,12 +192,13 @@ static int sun5i_setup_clocksource(struct platform_device *pdev,
 				   unsigned long rate)
 {
 	struct sun5i_timer *cs = platform_get_drvdata(pdev);
+	u32 offset = cs->quirks->from_ctl_base_offset;
 	void __iomem *base = cs->base;
 	int ret;
 
-	writel(~0, base + TIMER_INTVAL_LO_REG(1));
+	writel(~0, base + TIMER_INTVAL_LO_REG(1, offset));
 	writel(TIMER_CTL_ENABLE | TIMER_CTL_RELOAD,
-	       base + TIMER_CTL_REG(1));
+	       base + TIMER_CTL_REG(1, offset));
 
 	cs->clksrc.name = pdev->dev.of_node->name;
 	cs->clksrc.rating = 340;
@@ -237,6 +257,7 @@ static int sun5i_setup_clockevent(struct platform_device *pdev,
 
 static int sun5i_timer_probe(struct platform_device *pdev)
 {
+	const struct sunxi_timer_quirks *quirks;
 	struct device *dev = &pdev->dev;
 	struct sun5i_timer *st;
 	struct reset_control *rstc;
@@ -273,11 +294,18 @@ static int sun5i_timer_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	quirks = of_device_get_match_data(&pdev->dev);
+	if (!quirks) {
+		dev_err(&pdev->dev, "Failed to determine the quirks to use\n");
+		return -ENODEV;
+	}
+
 	st->base = timer_base;
 	st->ticks_per_jiffy = DIV_ROUND_UP(rate, HZ);
 	st->clk = clk;
 	st->clk_rate_cb.notifier_call = sun5i_rate_cb;
 	st->clk_rate_cb.next = NULL;
+	st->quirks = quirks;
 
 	ret = devm_clk_notifier_register(dev, clk, &st->clk_rate_cb);
 	if (ret) {
@@ -311,9 +339,27 @@ static void sun5i_timer_remove(struct platform_device *pdev)
 	clocksource_unregister(&st->clksrc);
 }
 
+static const struct sunxi_timer_quirks sun5i_sun7i_hstimer_quirks = {
+	.from_ctl_base_offset = 0x0,
+};
+
+static const struct sunxi_timer_quirks sun20i_d1_hstimer_quirks = {
+	.from_ctl_base_offset = 0x10,
+};
+
 static const struct of_device_id sun5i_timer_of_match[] = {
-	{ .compatible = "allwinner,sun5i-a13-hstimer" },
-	{ .compatible = "allwinner,sun7i-a20-hstimer" },
+	{
+		.compatible = "allwinner,sun5i-a13-hstimer",
+		.data = &sun5i_sun7i_hstimer_quirks,
+	},
+	{
+		.compatible = "allwinner,sun7i-a20-hstimer",
+		.data = &sun5i_sun7i_hstimer_quirks,
+	},
+	{
+		.compatible = "allwinner,sun20i-d1-hstimer",
+		.data = &sun20i_d1_hstimer_quirks,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, sun5i_timer_of_match);

-- 
2.43.0

