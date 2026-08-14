Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2BE2E7390
	for <linux-sunxi@lists.linux.dev>; Fri, 14 Aug 2026 20:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786740958; cv=none; b=ZH4FieoMuiqhM5eZHez39gDnRM6TyNs+DYPeE9R3JDPNAGg8F+nK9E0+by8dOvkumR5D82hWimMnFVYW0rbsUIG9dDnoci3xrqZ3NjJ/uR5aprhIe47ucdxe5r1LALSxu2fqfDsAJhINVe2h1WJ0CJtTuBMcdzzSiUWGta/xP4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786740958; c=relaxed/simple;
	bh=NUe+5o3sircrOdyQUEMvfJqplkZG2BM5b2wmeSmf9ck=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VxH8ldMuCKiYzXGTgH4lWtUNhF/mefVyK0N39BrMZ37xW5y4yPj3uaCavQHIZSO0UDV064qP1uUSY/UV/Waqsul1WlHAhjZR8kWJUXGQZg9hvfgX/S302WRlr7CgXI4pGj8PoDHRnMaUfyVNDTM99lJIvxp/Ak5ocbKoC7xZiOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i0PstPM/; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i0PstPM/"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-381b831d535so2303005a91.0
        for <linux-sunxi@lists.linux.dev>; Fri, 14 Aug 2026 13:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786740956; x=1787345756; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r5Y6mvwj3GDfaz1b69DVL8jE0Eg17I3eO1sqFwFDyY0=;
        b=i0PstPM/V0XaNr86LPp9reNJ5ft/Ih2eKoJy5v45j3Rz1N2d4oNz++hS6xYyv7E+lR
         zEsKMSlp18DNcIxmGCyRl+uKO1/F+De7ADPIBrFecqLedyp/oAZmHT3j5x0EKmiMDf/x
         yAQ89FGGawsbWRYeRomYD1X0Hi+jhG12Xm1HsIShkx0r7q0zowAgBTocuYi8dRsKg2x5
         HkhQT0ov7ha9W2O/+bPpNWBZKH6QeSNeZeNOccbnlD3psGqXTx0ZmWBophJ7Qtq7PnFZ
         /Ktnq/ZHLx5tEFHzVjA9ILSUQl8Oa9HyaTlKAUGhCicDTz5cD3SQVYIzgpuwWgHOeMl1
         wqFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786740956; x=1787345756;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r5Y6mvwj3GDfaz1b69DVL8jE0Eg17I3eO1sqFwFDyY0=;
        b=N9ZjKUylp14YV3bNBcNSLGz+p4veTeB4uiHfxt/+Cb/ssV/6h91QN1GAotkOJW5KRo
         9LyCz0nZ70r9DJppcrAA1eX9dLtebaGJJATqL1QL7r38ooNOuq9Xw6g3y9yMXblhhM2U
         pnJ5BKOPWZUpKnboS1rpc6b3FHU5+EYu+01d1ZpZpt4iFnKPFw7h0Q7H2+57yJpAbk2o
         8KSHn8TuYS8vmtk01tb1kSeGsoEKhCtQqTr69VWrLzdMfFhv1JtoFktpnqDjqpH+DESV
         rfDXdaCpITwNx6cShMPVreoCgyEtorWCQ5A/fychVL56ypP7xotnnivRnYwXKM0R7uzi
         T+Sg==
X-Gm-Message-State: AOJu0Yzf33ywx4QuAshB079JfXLoQ1plCC9ruI0pnKY/vV/mn6yNqV8/
	cORQE2wpdsVC/i7HSQhnSpVsosnq9uMwl96hRGJ/cDkYRd6ZOnUlvBMt+z0t1A==
X-Gm-Gg: AR+sD1069ZBAzaov6ddbZSzG13eaCKPYZqcEoVeTyBhTcPIhkiLMA0C1JURKLc/4vWr
	1pWhjWtqE7Vm0eWWF6N2+1NgrM2ZfA/3+HkmSXcYZUxLTIdjTvYm53rDBweHZ3xFi617wF5uDoe
	D+7FdDMBy9am6NlCD0sEHvtk+7YuOV2wlgUE+GVoD8oe9v5Ngumsrw9RwfdgRo62EiKT72P/UIK
	DKY/2Dnfz4ADBHALk+uQqcQODoL4mNOqbBA5q9NNovD14hBBDd5JyMxx2VKt51dwPqqin8kg0Fm
	uPMPV0i2HKkVLpuwYBUQHjVVFdR8X51OFI5pAg+H1SOGsH2pnGrPqMAYEs60XTZrk2eN0dfqb47
	PfWcRRVfFIMCQGWoeFhhE36qNz1ZzAsWK24iG+3T+9vLDb7iNQssSzBdWaAyaw7qnYe/MoeFw6q
	1eSXy2trxqO53vaMldWfjKWSwenmJi6Zjf4e6YvhxEhN0PaXT8nSGL+hDRa9o4bFoehjnjEQqim
	JAKp9tXFUJOYU+MuS7+SdXtx9Ris1TsP8rdpgIgWQb7r4zbtxf+Lm2ZpcpV+OBNZ+R35/Vh+G76
	q9eJI5wz/9sNhe+ek96KrGdnnewtT8PJZXAusU4qJgnYKsNK
X-Received: by 2002:a17:90b:4405:b0:381:792d:f993 with SMTP id 98e67ed59e1d1-3933b8c4cf1mr8467756a91.17.1786740956014;
        Fri, 14 Aug 2026 13:55:56 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-394ea96c7fcsm4107294a91.3.2026.08.14.13.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 13:55:55 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-kernel@vger.kernel.org (open list:MAILBOX API),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi SoC support)
Subject: [PATCHv2] mailbox: sun6i: modernize probe and convert to fully managed
Date: Fri, 14 Aug 2026 13:55:53 -0700
Message-ID: <20260814205553.39894-1-rosenp@gmail.com>
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
 v2: fix compilation
 drivers/mailbox/sun6i-msgbox.c | 62 ++++++++++------------------------
 1 file changed, 18 insertions(+), 44 deletions(-)

diff --git a/drivers/mailbox/sun6i-msgbox.c b/drivers/mailbox/sun6i-msgbox.c
index 6ba6920f4645..3b838f6c837a 100644
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
@@ -211,24 +221,18 @@ static int sun6i_msgbox_probe(struct platform_device *pdev)
 	for (i = 0; i < NUM_CHANS; ++i)
 		chans[i].con_priv = mbox;
 
-	mbox->clk = devm_clk_get(dev, NULL);
+	mbox->clk = devm_clk_get_enabled(dev, NULL);
 	if (IS_ERR(mbox->clk)) {
 		ret = PTR_ERR(mbox->clk);
 		dev_err(dev, "Failed to get clock: %d\n", ret);
 		return ret;
 	}
 
-	ret = clk_prepare_enable(mbox->clk);
-	if (ret) {
-		dev_err(dev, "Failed to enable clock: %d\n", ret);
-		return ret;
-	}
-
 	reset = devm_reset_control_get_exclusive(dev, NULL);
 	if (IS_ERR(reset)) {
 		ret = PTR_ERR(reset);
 		dev_err(dev, "Failed to get reset control: %d\n", ret);
-		goto err_disable_unprepare;
+		return ret;
 	}
 
 	/*
@@ -242,25 +246,17 @@ static int sun6i_msgbox_probe(struct platform_device *pdev)
 	ret = reset_control_deassert(reset);
 	if (ret) {
 		dev_err(dev, "Failed to deassert reset: %d\n", ret);
-		goto err_disable_unprepare;
+		return ret;
 	}
 
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
@@ -271,29 +267,8 @@ static int sun6i_msgbox_probe(struct platform_device *pdev)
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
@@ -308,7 +283,6 @@ static struct platform_driver sun6i_msgbox_driver = {
 		.of_match_table = sun6i_msgbox_of_match,
 	},
 	.probe = sun6i_msgbox_probe,
-	.remove = sun6i_msgbox_remove,
 };
 module_platform_driver(sun6i_msgbox_driver);
 
-- 
2.55.0

