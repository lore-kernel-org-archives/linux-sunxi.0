Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2D310A35
	for <linux-sunxi@lists.linux.dev>; Sun, 21 Apr 2024 18:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.25.134.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713725137; cv=none; b=o2zqoM9Gp6y0EVInTQ+kc8i50Dud0+gYSie2fCQmFHnryyXrPQ+VRijywEPkjhYmnO3MSNl6uY88wXIK3yyRYWFKiR/6fzYgGZL209SU9J1BUyTKdg32yI+zuRTyB9+u9Z74GB8lJRfbG4fyrWTgSB9/nSqYP/ghX7nxKBgqILY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713725137; c=relaxed/simple;
	bh=uwuQxXfc3+VpnllN8xxeGxr+2TTZclCSi/3gmfaTrms=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IMYB0NnmVbiwhiOsVDSrcXzqlUG1EEB1vz9b2cWUU0n+uXS+fj0KPl8RQTvLsYtVUgQ/aBKnRAOgFSFOk8Pfkrj9cYbaLPBUre+6qaBue2hx7m/ig2bM1DMu6ADg7kb/qZyPXBo8Z1bDVeIvCB1jrdw+iECTzczh0cQbR1WgXk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de; spf=pass smtp.mailfrom=t-online.de; arc=none smtp.client-ip=194.25.134.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=t-online.de
Received: from fwd82.aul.t-online.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout02.t-online.de (Postfix) with SMTP id E10DB2BE50;
	Sun, 21 Apr 2024 20:37:21 +0200 (CEST)
Received: from dino2.dhome ([77.47.123.226]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ryc41-3gruld0; Sun, 21 Apr 2024 20:37:21 +0200
From: Alois Fertl <a.fertl@t-online.de>
To: a.zummo@towertech.it
Cc: alexandre.belloni@bootlin.com,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-rtc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	a.fertl@t-online.de
Subject: [PATCH v2 1/1] drivers/rtc: rtc-sun6i: AutoCal Internal OSC Clock
Date: Sun, 21 Apr 2024 20:36:33 +0200
Message-Id: <20240421183633.117326-1-a.fertl@t-online.de>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1713724641-697A1D74-E65BC247/0/0 CLEAN NORMAL
X-TOI-MSGID: 9465a6aa-8077-4264-8533-ee6f1a1eb176

I have a M98-8K PLUS Magcubic TV-Box based on the Allwinner H618 SOC.
On board is a Sp6330 wifi/bt module that requires a 32kHz clock to
operate correctly. Without this change the clock from the SOC is
~29kHz and BT module does not start up. The patch enables the Internal
OSC Clock Auto Calibration of the H616/H618 which than provides the
necessary 32kHz and the BT module initializes successfully.
Add a flag and set it for H6 AND H616. The H618 is the same as H616
regarding rtc.

v1->v2
- add flag and activate for H6 AND H616

Signed-off-by: Alois Fertl <a.fertl@t-online.de>
---
 drivers/rtc/rtc-sun6i.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
index e0b85a0d5645..5d0c917b2099 100644
--- a/drivers/rtc/rtc-sun6i.c
+++ b/drivers/rtc/rtc-sun6i.c
@@ -42,6 +42,11 @@
 
 #define SUN6I_LOSC_CLK_PRESCAL			0x0008
 
+#define SUN6I_LOSC_CLK_AUTO_CAL			0x000c
+#define SUN6I_LOSC_CLK_AUTO_CAL_16MS		BIT(2)
+#define SUN6I_LOSC_CLK_AUTO_CAL_EANABLE		BIT(1)
+#define SUN6I_LOSC_CLK_AUTO_CAL_SEL_CAL		BIT(0)
+
 /* RTC */
 #define SUN6I_RTC_YMD				0x0010
 #define SUN6I_RTC_HMS				0x0014
@@ -126,7 +131,6 @@
  *     registers (R40, H6)
  *   - SYS power domain controls (R40)
  *   - DCXO controls (H6)
- *   - RC oscillator calibration (H6)
  *
  * These functions are not covered by this driver.
  */
@@ -138,6 +142,7 @@ struct sun6i_rtc_clk_data {
 	unsigned int has_losc_en : 1;
 	unsigned int has_auto_swt : 1;
 	unsigned int no_ext_losc : 1;
+	unsigned int has_auto_cal : 1;
 };
 
 #define RTC_LINEAR_DAY	BIT(0)
@@ -268,6 +273,13 @@ static void __init sun6i_rtc_clk_init(struct device_node *node,
 	}
 	writel(reg, rtc->base + SUN6I_LOSC_CTRL);
 
+	if (rtc->data->has_auto_cal) {
+		/* Enable internal OSC clock auto calibration */
+		reg = (SUN6I_LOSC_CLK_AUTO_CAL_16MS | SUN6I_LOSC_CLK_AUTO_CAL_EANABLE |
+				SUN6I_LOSC_CLK_AUTO_CAL_SEL_CAL);
+		writel(reg, rtc->base + SUN6I_LOSC_CLK_AUTO_CAL);
+	}
+
 	/* Yes, I know, this is ugly. */
 	sun6i_rtc = rtc;
 
@@ -380,6 +392,7 @@ static const struct sun6i_rtc_clk_data sun50i_h6_rtc_data = {
 	.has_out_clk = 1,
 	.has_losc_en = 1,
 	.has_auto_swt = 1,
+	.has_auto_cal = 1,
 };
 
 static void __init sun50i_h6_rtc_clk_init(struct device_node *node)
@@ -395,6 +408,7 @@ static const struct sun6i_rtc_clk_data sun50i_h616_rtc_data = {
 	.has_prescaler = 1,
 	.has_out_clk = 1,
 	.no_ext_losc = 1,
+	.has_auto_cal = 1,
 };
 
 static void __init sun50i_h616_rtc_clk_init(struct device_node *node)
-- 
2.39.2

