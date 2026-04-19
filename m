Received: from s106b.cyber-folks.pl (s106b.cyber-folks.pl [195.78.66.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C160D175A71;
	Sun, 19 Apr 2026 12:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.78.66.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776602844; cv=none; b=MqVdNob5nkjxSxIzpa+xnmc0GJWtWIWW5fpU6r/zByoBbQuDQEOXICab52dzlOBqM1Z0zG6fGnKPqaKm+IvXatlx8rvjCHVn+5zH4zjy4lbwnTk4q9iBxQvyBwepkTpjFj5yNW97Omin1vqWf8GmXugLNZpj9qgquel8ZtUAmMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776602844; c=relaxed/simple;
	bh=OJ+QhSMWLWGCCwyrPu33vfbAQwavyBe7HLDcBNOOCgc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a1eW37box6X7LfE4lapDiE8CXGuHEYCIo+lKIJUwsOqVMO/eG3vHP/S8LQxnlVMI5YhVIzGl8gnghKtXxd4keLgU5jv34HhuaFAxS3OLKuAV1Ws9Hy8lhnziZQdMDeQTGOSGZqjDFOodbC63xWHmubZ8w0SX8EBdgXY9OgojkNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl; spf=pass smtp.mailfrom=mmpsystems.pl; dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b=QwHv1lLx; arc=none smtp.client-ip=195.78.66.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b="QwHv1lLx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=06+ImUXYrUUSljKn80QgqJiSD3fq4wUGU+EvgQqdBj4=; b=QwHv1lLxvbAMIrUj1eolnwXz5p
	AvwVDex6TZ51y1UBow7ZE2XeBB7xJzZsZfYF0Od+OrqckZZ+O6iMRXFvFjmoxp/lyZijZXphj7aBL
	VKeew38UMPacH2svRABVzQNBte6BD/mAuxbSlpU9VmGb8cYI55ixK9XVo7pgLxnL/JQT1mi7zRwsI
	jNXx36NvYp5VsbYWwXeJdIeVT0X+Dl+3j2JXvSlnoCpxvl9TI40bFcv2P7aUnRTDoOSGaZucql/Ul
	n38EXWoRhVekh2UTxLc+do3nnI0Le4Hz0PV21i26S0WojkigkzSoG3reP2VfNPBSBw0oY0MzYmHqs
	x7pAkMRA==;
Received: from user-5-173-16-91.play-internet.pl ([5.173.16.91] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1wERYV-0000000FcTT-00S3;
	Sun, 19 Apr 2026 14:47:19 +0200
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Date: Sun, 19 Apr 2026 14:46:08 +0200
Subject: [PATCH 2/4] clocksource/drivers/sun5i: add H616 hstimer support
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260419-h616-t113s-hstimer-v1-2-1af74ebef7c5@mmpsystems.pl>
References: <20260419-h616-t113s-hstimer-v1-0-1af74ebef7c5@mmpsystems.pl>
In-Reply-To: <20260419-h616-t113s-hstimer-v1-0-1af74ebef7c5@mmpsystems.pl>
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Michal Piekos <michal.piekos@mmpsystems.pl>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776602788; l=3539;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=OJ+QhSMWLWGCCwyrPu33vfbAQwavyBe7HLDcBNOOCgc=;
 b=xvXt2nVJJ17FsNl2/O9IV1+JSNQYUETYBiaI/Cz5sXpdkwnyOmf70ixbkM2bGG4GNs+s0AoiO
 DvsRJolJ/VWDwPlyR0su4+IppMRcjzEI7S8ZCbV7EZeR/bF7JMBD1kq
X-Developer-Key: i=michal.piekos@mmpsystems.pl; a=ed25519;
 pk=Aixyx03If7ZDamiKKN0lsa+0mtA+WjIuIf2ZQVYNBqg=
X-Authenticated-Id: michal.piekos@mmpsystems.pl

H616 high speed timer differs from existing timer-sun5i by register base
offset.

Add selectable register layout structures.
Add H616 compatible string to OF match table.

Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
---
 drivers/clocksource/timer-sun5i.c | 56 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 50 insertions(+), 6 deletions(-)

diff --git a/drivers/clocksource/timer-sun5i.c b/drivers/clocksource/timer-sun5i.c
index f827d3f98f60..125abc11c3c3 100644
--- a/drivers/clocksource/timer-sun5i.c
+++ b/drivers/clocksource/timer-sun5i.c
@@ -21,18 +21,52 @@
 #define TIMER_IRQ_EN_REG		0x00
 #define TIMER_IRQ_EN(val)			BIT(val)
 #define TIMER_IRQ_ST_REG		0x04
-#define TIMER_CTL_REG(val)		(0x20 * (val) + 0x10)
 #define TIMER_CTL_ENABLE			BIT(0)
 #define TIMER_CTL_RELOAD			BIT(1)
-#define TIMER_CTL_CLK_PRES(val)			(((val) & 0x7) << 4)
 #define TIMER_CTL_ONESHOT			BIT(7)
-#define TIMER_INTVAL_LO_REG(val)	(0x20 * (val) + 0x14)
-#define TIMER_INTVAL_HI_REG(val)	(0x20 * (val) + 0x18)
-#define TIMER_CNTVAL_LO_REG(val)	(0x20 * (val) + 0x1c)
-#define TIMER_CNTVAL_HI_REG(val)	(0x20 * (val) + 0x20)
+#define TIMER_CTL_CLK_PRES(val)		(((val) & 0x7) << 4)
+#define TIMER_CTL_REG(val)		\
+	(soc_base->stride * (val) + soc_base->ctl_base)
+#define TIMER_INTVAL_LO_REG(val)	\
+	(soc_base->stride * (val) + soc_base->intval_lo_base)
+#define TIMER_INTVAL_HI_REG(val)	\
+	(soc_base->stride * (val) + soc_base->intval_hi_base)
+#define TIMER_CNTVAL_LO_REG(val)	\
+	(soc_base->stride * (val) + soc_base->cntval_lo_base)
+#define TIMER_CNTVAL_HI_REG(val)	\
+	(soc_base->stride * (val) + soc_base->cntval_hi_base)
 
 #define TIMER_SYNC_TICKS	3
 
+struct sunxi_timer_base {
+	u32 ctl_base;
+	u32 intval_lo_base;
+	u32 intval_hi_base;
+	u32 cntval_lo_base;
+	u32 cntval_hi_base;
+	u32 stride;
+};
+
+static const struct sunxi_timer_base sun5i_base = {
+	.ctl_base = 0x10,
+	.intval_lo_base = 0x14,
+	.intval_hi_base = 0x18,
+	.cntval_lo_base = 0x1c,
+	.cntval_hi_base = 0x20,
+	.stride = 0x20
+};
+
+static const struct sunxi_timer_base sun50i_base = {
+	.ctl_base = 0x20,
+	.intval_lo_base = 0x24,
+	.intval_hi_base = 0x28,
+	.cntval_lo_base = 0x2c,
+	.cntval_hi_base = 0x30,
+	.stride = 0x20
+};
+
+static const struct sunxi_timer_base *soc_base;
+
 struct sun5i_timer {
 	void __iomem		*base;
 	struct clk		*clk;
@@ -238,6 +272,7 @@ static int sun5i_setup_clockevent(struct platform_device *pdev,
 static int sun5i_timer_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct device_node *node = dev_of_node(&pdev->dev);
 	struct sun5i_timer *st;
 	struct reset_control *rstc;
 	void __iomem *timer_base;
@@ -251,6 +286,14 @@ static int sun5i_timer_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, st);
 
+	if (!node)
+		return -EINVAL;
+
+	if (of_device_is_compatible(node, "allwinner,sun50i-h616-hstimer"))
+		soc_base = &sun50i_base;
+	else
+		soc_base = &sun5i_base;
+
 	timer_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(timer_base)) {
 		dev_err(dev, "Can't map registers\n");
@@ -314,6 +357,7 @@ static void sun5i_timer_remove(struct platform_device *pdev)
 static const struct of_device_id sun5i_timer_of_match[] = {
 	{ .compatible = "allwinner,sun5i-a13-hstimer" },
 	{ .compatible = "allwinner,sun7i-a20-hstimer" },
+	{ .compatible = "allwinner,sun50i-h616-hstimer" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, sun5i_timer_of_match);

-- 
2.43.0

