Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DD53C1403
	for <linux-sunxi@lists.linux.dev>; Mon, 27 Jul 2026 19:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785181334; cv=none; b=VLM4G+xJOlN+I3DFi83Gvq6xOYeGSx8sktcVU5vstFk185vRoizEG0dgh2a88sCY+Nf0Ds/IUA9naEQL1nT6+IHuNQvSY4VWQX1putfTYSkdkVyYuCtg4aTYxXnmgZy2KSAPfcoor2YZcbAUmKvM7pvyNgEiqLGNJs+z/JbeHus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785181334; c=relaxed/simple;
	bh=MKS/sBRev8jNfgKABI4CtILB5FqYVqpdhuw+INuhcWo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XRDC/LmomA4b+yLrURM2HRhRVpQs1oe0/DUl4hCo2sTrzDWaCBciTTa6Uc58X+IPH22etVaankC/WA7IJJ9K/IjXtLu88fZejuTKoGekp8+XxX8g2T9PwFrsLIdij8r3jUj6YNgOe0E80RRw/oFeE8M/Em3mxtotTRBqNuxrGig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=loi3xOHA; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="loi3xOHA"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-92ed3993c1eso176073985a.1
        for <linux-sunxi@lists.linux.dev>; Mon, 27 Jul 2026 12:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785181332; x=1785786132; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ikqwbkqF0vWWk5NitpyxsfTFJUUcd2sIYvu6B+uZKIw=;
        b=loi3xOHApDv5PcNBvnKu77fM+YPv47mKIXq50DxP7z0UKpyocX2nlw4YcWey5djhHr
         nn3vEaYZDb1LfnxwvXILzIJBGyKJJAfp+ViOF0SYeTjEwiyYJA6ENl0VZxRv8B5VgdD7
         Pc4y1LuxBzf+yploM91XZzwc1fl0tmm0FuutM8Xvn1oS4anHCfobVEBAiDUYiD5D4gWe
         HCWUoPoGmyAOAMA2dRZopFbk5VyVtqDNkIWjQAeoI5WaD1m8DT+NFyjAknUKPvr7JbWR
         bpEW0hTb7IELLyH+bH0+t7l7Mi331BUtKNjIFqCgfwyKKpzaVKOh3nz/fD7V7feTMASm
         5vgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785181332; x=1785786132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ikqwbkqF0vWWk5NitpyxsfTFJUUcd2sIYvu6B+uZKIw=;
        b=BknA+Nhpus06mQ6iCcLLWgfuVRLz8tEdovDx7JG6nGB+A9Gl+2UAAA2ueAOGPLDDkV
         4uVceY94rzVual41Tslspsl3jZNqfzqXpLV3Ft1MGqNnPrHShDYapeBsvd9xpcjtnVr3
         1xn4UQZGLgxC/qV7ITwxYfPVD7lP0Cu3yDPAroQjpBYZq9AgvPyf4ZsshirK8aoq6DUD
         aMleyp7fid8CIjmLGDt0lpnkqYH4gl1QRfNYJ+3yxxLcQgbRN9kwXavB/2/mAwEmZPpO
         imDOEKvVgFl844U+z+YfssVSRGlL+VK7p5n4hoNx6IGOz3SGZkdXCdW4PxUMDxJF51lj
         DOxQ==
X-Gm-Message-State: AOJu0Yx0oKHayD8r2W/vrYxgYQR9WPdepOQWR30/RvAvjQu7mzxAP9Ih
	O4aflEdGIln5lK0qhaoffHip/WxRHTPtOFM3z7sKfiiBh+nGaivc3XIqijnUyw==
X-Gm-Gg: AR+sD13qyJnw2VbTZ5/WVk49heaf5yhb2ZYl9Xn+v3sTO8LX+VEyjFyZEWF/LISkZWw
	sotPtGc9ORG5ZEjM/vbHEWfAOEV7cEnodk1IaKSz931XUmEECTW85U6qUjx001XJsS5FjOpqpHH
	6QTGnMkG6cAeeoU/WpWVLcqTarYLV5sfHHB1ve0NJHX0Ec6C6ZpWOzggpsq9Tlt1f2mYZTbsO3U
	3TmlOr1/4PgHql2O28WETeegCHW1o9pPjXEkrgo1Rn0xXzIdEJwvwBMWpB+MuaUdMA8V5eYCWUo
	qJm+eOyZn8cBvxDLnzWRTyf2gOev1YtLg+Ej0lQcfcfBzaFZez95t24+T1m8U16Waa1Tpg0dJ9l
	55HuX7BJTdIL9tFOLORVdAZ2Nf/HjcfnN/pAdNoTDrv5c5gJ3+NW2jByfPLi+coa7YloS6o5NIF
	YARLMj3iOlQxzrUhjSuFQjh8aJEMdCwwr0ye7n5Evc71MEHPMNg7bSrWviNr285GllUcADd6bRP
	GIk/hQGkSc7cUWn+noMW65gXYnXwr0L3siaR2hDqgJHsNaWviUP0xo=
X-Received: by 2002:a05:620a:a197:20b0:92e:6dc0:7b13 with SMTP id af79cd13be357-932df6ea2cemr755870585a.53.1785181331671;
        Mon, 27 Jul 2026 12:42:11 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-932de66b2b4sm681276485a.41.2026.07.27.12.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 12:42:11 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-kernel@vger.kernel.org (open list:MAILBOX API),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi SoC support)
Subject: [PATCH] mailbox: sun6i: modernize probe and convert to fully managed
Date: Mon, 27 Jul 2026 12:42:08 -0700
Message-ID: <20260727194208.10082-1-rosenp@gmail.com>
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

Assisted-by: Opencode:Big-Pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/mailbox/sun6i-msgbox.c | 62 ++++++++++------------------------
 1 file changed, 18 insertions(+), 44 deletions(-)

diff --git a/drivers/mailbox/sun6i-msgbox.c b/drivers/mailbox/sun6i-msgbox.c
index 6ba6920f4645..28d8636afad2 100644
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
+	return devm_mbox_controller_register(&mbox->controller);
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

