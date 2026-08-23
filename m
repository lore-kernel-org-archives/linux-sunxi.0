Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C54493634
	for <linux-sunxi@lists.linux.dev>; Sun, 23 Aug 2026 04:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787460921; cv=none; b=AuwusD0P+8ZWKhu4/pu0553MZiWH8uGNde1SQ/p9gvqGxbdt0CxmebJPypgYpmAiMTkggtGgOjFmuAGfTVUDNueqE5XQ+56fMTJOYnpyHpH7PczpwAyz5IymyyZNpnmaPbvvYYowOe/pFwxPQkd6w+81jJnjUyyw1LBSUyZ0NhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787460921; c=relaxed/simple;
	bh=aIgkHWhYhhwcpek27lDgix0waiIhg+JgS6WisuXNaS4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F13qFP729/Eph+TV1lvkJSNiNjwDwD8skhcd4Oqv/NWUDvHc9K4Q2kuI+GS86peiEJPyszViy2XSZkuUQGxZO+Jw79FE7mLJrFirBy1znMusn0arO3IxHQJTTyMlFc9kQYdKH2nMm7c4RR1eOJ2Har61MrRPD23qmtfGCgvAmDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cA8HixDH; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cA8HixDH"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-84f3ab8750cso1647821b3a.0
        for <linux-sunxi@lists.linux.dev>; Sat, 22 Aug 2026 21:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787460919; x=1788065719; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HQ9qMQKQa63apilSf8yoPY9mOe/vuD05hJ9auBWKPfI=;
        b=cA8HixDHproImL54L9fk74L7L9BCzcd6FpkrD/0Kwpg2NOenMCprKe/INXYkgFK0bJ
         m5piA3PjKDxbdxMacxQV1g3r4ze9Dr3/BGGiYhlSZKUJiXZxvx3VrAVnbsqWJmvBvhN7
         lVPrZuIkS8cc9tzqhOEuYubXDnWAtXPKPKq4Zt21tPsBUG9/9Mq0pac0c63FYzZbTXxm
         Jo5wGlzkCrhOWpGU259KjaVhH5O8JZk7n5S/lpQ2Z98t0eiAOxu8ru26o4e/APMB0nUT
         HmAi3giL2YjwpnpKGRg+AGsws1FtrgVvSrsVRIRRjteauBvpr5/ohtBix0Zid0m4j7UY
         oSXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787460919; x=1788065719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HQ9qMQKQa63apilSf8yoPY9mOe/vuD05hJ9auBWKPfI=;
        b=caScxS66zhcM9/sD1jfaAHiNerECDym5w97fslYqnZf5z2i1ZDn7ex27tETziTmtBg
         A6WUoYXquGCB7om6hLALQ/X3iCLWE0tOa8BVWdqL6W8yQFBGIag9RqtiAoBWZaClM2Sl
         fmLd9ZmF2tdP1OVqJ85sU3hRo2WeRgj2vx61Cu95sMr0m+veYPYBMKNsVEdT386yw/8q
         5qqOntbXbH08M2W904xH47hbXGXouEDgbLM+2w31wkxXpeL9WSybPXfYHw+iuTBWh1Db
         oma3ftCg3fig93cKjWyfbp7KtqDLo1J+R1yl93Ew9JuTr+M7PsP1L5XVR966/tnWBMsl
         rXTg==
X-Gm-Message-State: AFuF++kqWsGg1Nt3yooummK8hCEXnMUUf6eMm+uhCY+jCHpsJI3a4ySg
	weaqdsD1iXPIoWlRfkBWQbtrvvxtYJQ0k+plua+0jdDPfmxrt0O8xbm8Qc2SwA==
X-Gm-Gg: AR+sD13V7pMnrEl1jNKzU7gfR0sI9wz4zPLQDFEN6LBYTzXjAuH6qf+GieOW2+5B7rT
	oYnjrfOZR5J/vAeQMtOHcSFfyKKI4Dfm1qmqPGxQlYFcnTfh63fzt/R3skn3kO8bTFmhybWlT7+
	lIxpbWeOZAUeW8IRUrjS1vb2YixpIQrFkjkcsCkmPaCldHguQns1JJGL3SPasi4ZxzBZmlje7pv
	mZpUbE4G19eHpnMM0wnq7Hh5UlgPrFC545+CmcaY6elJhyBIaET3E+q1ojH4VetP8s0yqvlfTh5
	ujbdL8/DKAgLJ4hSV1Hzgvw6z19VmsGvGykDIS2AoDu5W7WLsVQpkw55xwRD1ErMWjyC033TrJm
	de9WASf63ex6M3h9+c0VmA7UCBhFDaaiuzxBNXp/hiI3MSIq3GoH/b7EEtCFzCR3qX4q+ievvvX
	dGNRmhmPpgdzBCBxSOzq7IRS8fE9C47RAA8f8Q2/UQQoXcJ2k728RQrLaNBn+LHK/U6ataizyQZ
	BpkjAV+SkvD8wwAOk/wPBHh7mIqvTnEM4W46lx8KscPDA3dv6jl2Mt6HFzrqP9ES2cDfHsp68BL
	YGop2JgVO+6dSaWTtfX0RsHnnU7PkA/8l5kSaA==
X-Received: by 2002:a05:6300:278a:20b0:3cd:51ff:1b14 with SMTP id adf61e73a8af0-3cd51ff1dd5mr7969272637.4.1787460919067;
        Sat, 22 Aug 2026 21:55:19 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc199e4b1e1sm120957a12.21.2026.08.22.21.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 21:55:17 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-kernel@vger.kernel.org (open list:MAILBOX API),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi SoC support)
Subject: [PATCHv3] mailbox: sun6i: modernize probe and convert to fully managed
Date: Sat, 22 Aug 2026 21:55:15 -0700
Message-ID: <20260823045515.15315-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace irq_of_parse_and_map() with platform_get_irq() and move both
IRQ and MMIO resource acquisition to the top of probe, before any
allocations, for early error exit.

Switch from devm_clk_get() + clk_prepare_enable() to
devm_clk_get_enabled(), which combines both operations and registers
devres callbacks for automatic disable/unprepare on unbind. This
eliminates the manual err_disable_unprepare error path and the
remove callback entirely.

Use devm_mbox_controller_register() for devres-managed controller
registration, and drop the remove callback and platform_set_drvdata()
which are no longer needed.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v3: use dev_err_probe
 v2: fix compilation
 drivers/mailbox/sun6i-msgbox.c | 78 ++++++++++------------------------
 1 file changed, 22 insertions(+), 56 deletions(-)

diff --git a/drivers/mailbox/sun6i-msgbox.c b/drivers/mailbox/sun6i-msgbox.c
index 6ba6920f4645..da68bad1d916 100644
--- a/drivers/mailbox/sun6i-msgbox.c
+++ b/drivers/mailbox/sun6i-msgbox.c
@@ -198,7 +198,17 @@ static int sun6i_msgbox_probe(struct platform_device *pdev)
 	struct mbox_chan *chans;
 	struct reset_control *reset;
 	struct sun6i_msgbox *mbox;
+	void __iomem *regs;
 	int i, ret;
+	int irq;
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
 
 	mbox = devm_kzalloc(dev, sizeof(*mbox), GFP_KERNEL);
 	if (!mbox)
@@ -211,25 +221,13 @@ static int sun6i_msgbox_probe(struct platform_device *pdev)
 	for (i = 0; i < NUM_CHANS; ++i)
 		chans[i].con_priv = mbox;
 
-	mbox->clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(mbox->clk)) {
-		ret = PTR_ERR(mbox->clk);
-		dev_err(dev, "Failed to get clock: %d\n", ret);
-		return ret;
-	}
-
-	ret = clk_prepare_enable(mbox->clk);
-	if (ret) {
-		dev_err(dev, "Failed to enable clock: %d\n", ret);
-		return ret;
-	}
+	mbox->clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(mbox->clk))
+		return dev_err_probe(dev, PTR_ERR(mbox->clk), "Failed to get clock\n");
 
 	reset = devm_reset_control_get_exclusive(dev, NULL);
-	if (IS_ERR(reset)) {
-		ret = PTR_ERR(reset);
-		dev_err(dev, "Failed to get reset control: %d\n", ret);
-		goto err_disable_unprepare;
-	}
+	if (IS_ERR(reset))
+		return dev_err_probe(dev, PTR_ERR(reset), "Failed to get reset control\n");
 
 	/*
 	 * NOTE: We rely on platform firmware to preconfigure the channel
@@ -240,27 +238,17 @@ static int sun6i_msgbox_probe(struct platform_device *pdev)
 	 * when removing the device.
 	 */
 	ret = reset_control_deassert(reset);
-	if (ret) {
-		dev_err(dev, "Failed to deassert reset: %d\n", ret);
-		goto err_disable_unprepare;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to deassert reset\n");
 
-	mbox->regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(mbox->regs)) {
-		ret = PTR_ERR(mbox->regs);
-		dev_err(dev, "Failed to map MMIO resource: %d\n", ret);
-		goto err_disable_unprepare;
-	}
+	mbox->regs = regs;
 
 	/* Disable all IRQs for this end of the msgbox. */
 	writel(0, mbox->regs + LOCAL_IRQ_EN_REG);
 
-	ret = devm_request_irq(dev, irq_of_parse_and_map(dev->of_node, 0),
-			       sun6i_msgbox_irq, 0, dev_name(dev), mbox);
-	if (ret) {
-		dev_err(dev, "Failed to register IRQ handler: %d\n", ret);
-		goto err_disable_unprepare;
-	}
+	ret = devm_request_irq(dev, irq, sun6i_msgbox_irq, 0, dev_name(dev), mbox);
+	if (ret)
+		return ret;
 
 	mbox->controller.dev           = dev;
 	mbox->controller.ops           = &sun6i_msgbox_chan_ops;
@@ -271,29 +259,8 @@ static int sun6i_msgbox_probe(struct platform_device *pdev)
 	mbox->controller.txpoll_period = 5;
 
 	spin_lock_init(&mbox->lock);
-	platform_set_drvdata(pdev, mbox);
-
-	ret = mbox_controller_register(&mbox->controller);
-	if (ret) {
-		dev_err(dev, "Failed to register controller: %d\n", ret);
-		goto err_disable_unprepare;
-	}
-
-	return 0;
-
-err_disable_unprepare:
-	clk_disable_unprepare(mbox->clk);
-
-	return ret;
-}
-
-static void sun6i_msgbox_remove(struct platform_device *pdev)
-{
-	struct sun6i_msgbox *mbox = platform_get_drvdata(pdev);
 
-	mbox_controller_unregister(&mbox->controller);
-	/* See the comment in sun6i_msgbox_probe about the reset line. */
-	clk_disable_unprepare(mbox->clk);
+	return devm_mbox_controller_register(dev, &mbox->controller);
 }
 
 static const struct of_device_id sun6i_msgbox_of_match[] = {
@@ -308,7 +275,6 @@ static struct platform_driver sun6i_msgbox_driver = {
 		.of_match_table = sun6i_msgbox_of_match,
 	},
 	.probe = sun6i_msgbox_probe,
-	.remove = sun6i_msgbox_remove,
 };
 module_platform_driver(sun6i_msgbox_driver);
 
-- 
2.55.0

