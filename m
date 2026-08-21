Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745D02EEE61
	for <linux-sunxi@lists.linux.dev>; Fri, 21 Aug 2026 07:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787296548; cv=none; b=c2ACECZA34jwmj5zYVbThRV2727NEY4v9yJ7UuHV+grkNDXafOxF5Z9XiKy9hyMhBuHvZrp4CKTvsChfAq+pAYtfrdYOgMIQipCO6yGDkmIBmjTrQQaV+ygnx0ZO1j0ckSJkbRI4zHwfszdsuMEGIKgi9H8roYJZc7XdCGtGl6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787296548; c=relaxed/simple;
	bh=zwqKtimarOKIQOKNb2cLRFiqzKqX3Yzbc4o9OiUepYA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iOzDSaauHTVjuiSBTvZNSwImL1seoRmeMd9i8Szp9jTT1uaYnOFVhUS1qvvWZaje9Cf5wRYfQjsNWgrL33l3XMfVl3iLdjxXJAIv4uUYP/3ylEL2oJ9pId6bkKvYSkwxI17yEKijtP1cWBuQkz5JCbr8QOLy4zo6bP37h7pIEHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WBTp8wzI; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WBTp8wzI"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-382ef647e20so664242a91.1
        for <linux-sunxi@lists.linux.dev>; Fri, 21 Aug 2026 00:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787296546; x=1787901346; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9Y/Hk1ij4iIeeDeCgZ2taRMrjGJza1klMebG4Wvu7x0=;
        b=WBTp8wzIVGNucqduP1pbDHLiWFjSUEjCEv9gZRIsvEf/Di7gw9X8/3fLQ9zm27qYWC
         E8UMKXoYsu0CwywQcxx4seoxR8pxlDvXXAw+B01WOljcGr4FivIO0se66g6CrQ+jgMvm
         OtB5ELCOh6uuPf5NHA/xKAqXKygvjIqN5vE3Zf3opfbvUCnl2J0EulnP0dtFjWorPV+M
         agmGX0ZRQrvv8hZHHirqGiV2HEzd1sSR/YmdDwMLe1Dhi2uQ7meo3fByvrKlTZO2U0r2
         wpETMcWzBlDYr2jh1GQLyOHAyQosVD/+duQfuqIjrn2zJKUx9Vb3t+Otj1Dceo7JyBtf
         gTgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787296546; x=1787901346;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Y/Hk1ij4iIeeDeCgZ2taRMrjGJza1klMebG4Wvu7x0=;
        b=HBq08jQeJKSWtNd/ltqjm8XHz3B6n+3ORt5NB5KS9STQMQlg0PqzQ+VC0gfFbQUkHe
         blbI07uGRtNrJwbeoAUm32kFK3W3B+gxIhRavZMFgADNJoqY7epVHR7kpGamg30hi9fk
         qB0ETfvCcC9WSbAm/EtMstnPhQULwnh+bBMsaVBvspDwu3KRfUFaXnQp2Z/zitvW8MFO
         sOC1Awqfgv32Yqb0q5BJGKzFwHKL19pr5lfKgtNs8zIMwPn+W0H4ErxJ+xAMGIPG7jZV
         hKje+u6oH0BaJ1KTwWqUthhDa3ZRcNyPC3UqVvjyQxNtXm/R3mpj0lxNYANegO8V9aEU
         y6qw==
X-Forwarded-Encrypted: i=1; AHgh+RpQlUuDY5JS3xQkseYDScZFWP+M0bcu1QYqKn8ioq2apIVuHIKll6v9GY7+q47s6bTFFWVVHTiwMeO2CQ==@lists.linux.dev
X-Gm-Message-State: AFuF++lSOCeLiM8P7bod4HDRFWwB+GIBy5wCoLYesj5EELSGyD4cbm4v
	HAUH0kq4AD6lIztRt6tGSOKFSKV9AuggNXXLzoksG6Yg5lkYLm0U+7o=
X-Gm-Gg: AR+sD13io9izMRY6wMgyyRVWh09DfqITKaiZJa0KNJXHkFRP+MR/L/i7TKJ6Sitp1Wb
	FPReya0JaFx/LPrjOgslwKH9nDoTy9ll8sAWHpVGub2uOHmAlnuzGK53tmXAvoKxZRTZ/jYDCNn
	7JP4LGu3bvTIm8J2vaBU5/njiWYKkWlrlRtdwge479B0SKrYXJ9UcLI8IufEgjY1N1pin9ZXeCO
	aZxG5O9z8MGsq+91Xr0NPT5P+gL81ajrTmxZ6eBZIPVPVMoyGS0uT8hyv6vwbd5A0v2FJ2DlR5t
	Iw1wfrTg1R6zy2R+zRpUoQjZi0GJzJsiIiqxW+J2dc4sSduB9eCfOn4dGhSh0KZ+PA0ijJSmnoY
	3VXOHpN6WPk+9Bmk5b/uogD5/gwpf8+Wrv+5U9pojCKmIoHcGPCaeGCHG5Rv3mgNAjU/Xon45rH
	wfr1N0/qnc/+ogC4j7U5dV5PqKvdNnh26VbhBbTiNZ379xoLg1wVQfC9GmRwaUv07PHFIzJSV07
	I1xcoerZH85Jw==
X-Received: by 2002:a17:90a:da87:b0:38e:2860:253f with SMTP id 98e67ed59e1d1-395c3731c29mr8394315a91.12.1787296545832;
        Fri, 21 Aug 2026 00:15:45 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c4c194d2sm1951676a91.15.2026.08.21.00.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 00:15:45 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: sean@mess.org
Cc: mchehab@kernel.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Triet Hoang <triet.hoang.dev@gmail.com>
Subject: [PATCH] media: rc: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Fri, 21 Aug 2026 14:15:33 +0700
Message-ID: <20260821071533.215821-1-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the deprecated SIMPLE_DEV_PM_OPS
to DEFINE_SIMPLE_DEV_PM_OPS
and pm_sleep_ptr().

This lets us drop the __maybe_unused annotations
from its suspend and resume callbacks,
also reduces kernel size in case CONFIG_PM or
CONFIG_PM_SLEEP is disabled.

Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
---
 drivers/media/rc/meson-ir.c  | 6 +++---
 drivers/media/rc/sunxi-cir.c | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/rc/meson-ir.c b/drivers/media/rc/meson-ir.c
index 272ebb0d97c8..795b38ca864a 100644
--- a/drivers/media/rc/meson-ir.c
+++ b/drivers/media/rc/meson-ir.c
@@ -567,7 +567,7 @@ static void meson_ir_shutdown(struct platform_device *pdev)
 	spin_unlock_irqrestore(&ir->lock, flags);
 }
 
-static __maybe_unused int meson_ir_resume(struct device *dev)
+static int meson_ir_resume(struct device *dev)
 {
 	struct meson_ir *ir = dev_get_drvdata(dev);
 
@@ -579,7 +579,7 @@ static __maybe_unused int meson_ir_resume(struct device *dev)
 	return 0;
 }
 
-static __maybe_unused int meson_ir_suspend(struct device *dev)
+static int meson_ir_suspend(struct device *dev)
 {
 	struct meson_ir *ir = dev_get_drvdata(dev);
 	unsigned long flags;
@@ -591,7 +591,7 @@ static __maybe_unused int meson_ir_suspend(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(meson_ir_pm_ops, meson_ir_suspend, meson_ir_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(meson_ir_pm_ops, meson_ir_suspend, meson_ir_resume);
 
 static const struct meson_ir_param meson6_ir_param = {
 	.support_hw_decoder = false,
diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
index 28e840a7e5b8..7fd48c510143 100644
--- a/drivers/media/rc/sunxi-cir.c
+++ b/drivers/media/rc/sunxi-cir.c
@@ -236,19 +236,19 @@ static void sunxi_ir_hw_exit(struct device *dev)
 	reset_control_assert(ir->rst);
 }
 
-static int __maybe_unused sunxi_ir_suspend(struct device *dev)
+static int sunxi_ir_suspend(struct device *dev)
 {
 	sunxi_ir_hw_exit(dev);
 
 	return 0;
 }
 
-static int __maybe_unused sunxi_ir_resume(struct device *dev)
+static int sunxi_ir_resume(struct device *dev)
 {
 	return sunxi_ir_hw_init(dev);
 }
 
-static SIMPLE_DEV_PM_OPS(sunxi_ir_pm_ops, sunxi_ir_suspend, sunxi_ir_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(sunxi_ir_pm_ops, sunxi_ir_suspend, sunxi_ir_resume);
 
 static int sunxi_ir_probe(struct platform_device *pdev)
 {
@@ -422,7 +422,7 @@ static struct platform_driver sunxi_ir_driver = {
 	.driver = {
 		.name = SUNXI_IR_DEV,
 		.of_match_table = sunxi_ir_match,
-		.pm = &sunxi_ir_pm_ops,
+		.pm = pm_sleep_ptr(&sunxi_ir_pm_ops),
 	},
 };
 
-- 
2.53.0

