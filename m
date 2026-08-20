Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA82623BD17
	for <linux-sunxi@lists.linux.dev>; Thu, 20 Aug 2026 07:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787210804; cv=none; b=nQxb7qreSbzDyhu52PGasvV9SUwivEWNJlakUz0P1Fm8YzyQNU9PGXqyqmdd06h1UbbI28qhQBOzF8k0wOYF+zI6vtGwY7Tyl2CDfX8xcUl8NshIGnLttEiE5JA0YKDPcbDibiwP0o7GCArYjc32Zzp958V25kySJ5yYWmRhidE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787210804; c=relaxed/simple;
	bh=syjUuMyE1FVCHZoraDkCPBZ1qJTc86g+j3kAqZUyDFk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ovYZb7XoqAcaq3qKTKyZk/jWZbAwH/5m/3Us2KjA4FeneuBLkJjpgrp4PW5hdFMoGtq22G9xh/kqgC2bPeHCsTjAQztgku5u5/EWjpowbSEqXF5B5eRrPJhhpgdd+6NHzO4QeGAGUF+D2wWYfy+1y9YkN8yJKhHxKur+o8qLgi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b1PcLD1R; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b1PcLD1R"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84faf0fa17eso1881844b3a.2
        for <linux-sunxi@lists.linux.dev>; Thu, 20 Aug 2026 00:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787210802; x=1787815602; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8FpAmuQv/0D1SendrGr4xs5zcx8uXf/Ui4UAqXK6/V0=;
        b=b1PcLD1RqxHXudOfp2yWHsDnFX6VPmPymOUBNec99LvY4UVDZf1uH7DYzsqZ+rCSc2
         81S3B9Y9ydmoO5KmS/+2EoExBfERc5tTRYHiQzYfQ7R1M5khC5AAFHQDvfcr5t24bN5H
         geraGZVYo4CweaDkOn/RgkRl4WQkAIUDCP1TjK3XYVxMItGZ8gtydkThQ1FxEfJCpzZm
         daXWt7Zhgbc3WpkILNmwalFiLEcCp8yF4F2/WkMkdkiKJ2erwyKgRcHm+MmfGWAHSrjx
         nwW1xPircRlau2sibHBQfJRuYokpoCd32c7v/CsMbvdW+uONBYDGNnMi71UiSmYzQ7Wb
         SbxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787210802; x=1787815602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8FpAmuQv/0D1SendrGr4xs5zcx8uXf/Ui4UAqXK6/V0=;
        b=A7dDuW/Ugw4CScLtc39v38/xgQyhHdhfddFY8cabRLfwNlNqFmPkHLI9KcLo01V/Zt
         rxHnK7Udo9P8CraS0v6WSQfNVgVOw+ME7MUXxOvmYu6tvMb15h527viwTpKoKzUlpd8f
         zDz154oyoNa4F9IHFsuhCW1sxlgUCO76FIn8Kgjioym8G5lgpzSzBW9wYeZgBu/RZ9gz
         VnQQhLP+E6mmhJuogdAw5bpCuaNFKTBZjHlph1mqT5uWIjYpbFaOfG7TaEry24AWpduN
         U39hqazXt78lcvBeu28XFNU1tNODxOQ5WT0nNcrR2jBQkr3S8UgFS5i2mpvqp4fLRF0C
         9R5w==
X-Forwarded-Encrypted: i=1; AHgh+RpomM0U6TS3wtRieC+60hQZo2Oig9Krsiyjk00zdwn2uBC6rMnodwYnjIfGUKY36iwC1RwcJc1Dz7j4zw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+bmVKOzI7vvsLGhag2faTTu/ZySvkEr6xUBDhly/2h8D2u2BD
	e7qOzQRts7y52OzsP7powO8i3nJbfVrai+NPOsiBoi75EBlLNC2aN04=
X-Gm-Gg: AR+sD10eon5vgavhpCriIGlKAT6zN9FB1q0g5MwBYYLV/JjevvJrUVIqgxB9Sg/fI3K
	uF69Dmgy3P2lXGcXEJ/i/MCnd+PbNYrnGqoWr/VvML+Ujftkot8MfR9fccvAmOywHtGIPL1NPgY
	HvHvIrLEEmXEuGjuKgg5VTBYIWo/D01Exm1TEIzCkUTvVapOa0Aq9E8LQqK1y8WjyrMzskCJOnR
	dzoHqKTsSzFUSGMhyyGvnZLVRNwIKWxYDQnarD3yRZQCYIzc7nXVNKrHFCF9QMFPPQF/+i9w0Vx
	Hst6CmhUY8G7aY3sAiyuiV0FoN0NL1UDQJfPGg3KeMlPnggTIhqzSOVZFP/4frppzHkgJFaGow1
	nDTQQPvmaCW06Kwg2S9ezgchPJyCfsNH3Hj2r7r0RXFbXrw1FFyNLpk8YcmrTfdbl4FxRUpt7Db
	HKE8Jl1r+3NX11yzSCavXyHV2dWLlJi7y3MBVWSF1oLpd20hxEQKPRbuM8PPXjFHUi+/L8K+ACt
	rTbOpg3ow87
X-Received: by 2002:a05:6a00:c81:b0:851:b007:2fe0 with SMTP id d2e1a72fcca58-851d3820363mr17061044b3a.1.1787210802084;
        Thu, 20 Aug 2026 00:26:42 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d33b4135sm1360621b3a.27.2026.08.20.00.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 00:26:41 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: myungjoo.ham@samsung.com
Cc: kyungmin.park@samsung.com,
	cw00.choi@samsung.com,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Triet Hoang <triet.hoang.dev@gmail.com>
Subject: [PATCH] PM / devfreq: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Thu, 20 Aug 2026 14:26:36 +0700
Message-ID: <20260820072636.2049617-1-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the deprecated SIMPLE_DEV_PM_OPS
to DEFINE_SIMPLE_DEV_PM_OPS and pm_sleep_ptr().

This lets us drop the __maybe_unused annotations from the suspend and
resume callbacks, and reduces kernel size in case CONFIG_PM or
CONFIG_PM_SLEEP is disabled.

Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
---
 drivers/devfreq/rk3399_dmc.c     | 8 ++++----
 drivers/devfreq/sun8i-a33-mbus.c | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/devfreq/rk3399_dmc.c b/drivers/devfreq/rk3399_dmc.c
index dbdce7636ca5..3ebc817fa608 100644
--- a/drivers/devfreq/rk3399_dmc.c
+++ b/drivers/devfreq/rk3399_dmc.c
@@ -243,7 +243,7 @@ static int rk3399_dmcfreq_get_cur_freq(struct device *dev, unsigned long *freq)
 	return 0;
 }
 
-static __maybe_unused int rk3399_dmcfreq_suspend(struct device *dev)
+static int rk3399_dmcfreq_suspend(struct device *dev)
 {
 	struct rk3399_dmcfreq *dmcfreq = dev_get_drvdata(dev);
 	int ret = 0;
@@ -263,7 +263,7 @@ static __maybe_unused int rk3399_dmcfreq_suspend(struct device *dev)
 	return 0;
 }
 
-static __maybe_unused int rk3399_dmcfreq_resume(struct device *dev)
+static int rk3399_dmcfreq_resume(struct device *dev)
 {
 	struct rk3399_dmcfreq *dmcfreq = dev_get_drvdata(dev);
 	int ret = 0;
@@ -282,7 +282,7 @@ static __maybe_unused int rk3399_dmcfreq_resume(struct device *dev)
 	return ret;
 }
 
-static SIMPLE_DEV_PM_OPS(rk3399_dmcfreq_pm, rk3399_dmcfreq_suspend,
+static DEFINE_SIMPLE_DEV_PM_OPS(rk3399_dmcfreq_pm, rk3399_dmcfreq_suspend,
 			 rk3399_dmcfreq_resume);
 
 static int rk3399_dmcfreq_of_props(struct rk3399_dmcfreq *data,
@@ -477,7 +477,7 @@ static struct platform_driver rk3399_dmcfreq_driver = {
 	.remove = rk3399_dmcfreq_remove,
 	.driver = {
 		.name	= "rk3399-dmc-freq",
-		.pm	= &rk3399_dmcfreq_pm,
+		.pm	= pm_sleep_ptr(&rk3399_dmcfreq_pm),
 		.of_match_table = rk3399dmc_devfreq_of_match,
 	},
 };
diff --git a/drivers/devfreq/sun8i-a33-mbus.c b/drivers/devfreq/sun8i-a33-mbus.c
index 4bd5657558d6..1636501c753e 100644
--- a/drivers/devfreq/sun8i-a33-mbus.c
+++ b/drivers/devfreq/sun8i-a33-mbus.c
@@ -312,7 +312,7 @@ static int sun8i_a33_mbus_hw_init(struct device *dev,
 	return 0;
 }
 
-static int __maybe_unused sun8i_a33_mbus_suspend(struct device *dev)
+static int sun8i_a33_mbus_suspend(struct device *dev)
 {
 	struct sun8i_a33_mbus *priv = dev_get_drvdata(dev);
 
@@ -321,7 +321,7 @@ static int __maybe_unused sun8i_a33_mbus_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused sun8i_a33_mbus_resume(struct device *dev)
+static int sun8i_a33_mbus_resume(struct device *dev)
 {
 	struct sun8i_a33_mbus *priv = dev_get_drvdata(dev);
 
@@ -470,7 +470,7 @@ static const struct of_device_id sun8i_a33_mbus_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, sun8i_a33_mbus_of_match);
 
-static SIMPLE_DEV_PM_OPS(sun8i_a33_mbus_pm_ops,
+static DEFINE_SIMPLE_DEV_PM_OPS(sun8i_a33_mbus_pm_ops,
 			 sun8i_a33_mbus_suspend, sun8i_a33_mbus_resume);
 
 static struct platform_driver sun8i_a33_mbus_driver = {
@@ -479,7 +479,7 @@ static struct platform_driver sun8i_a33_mbus_driver = {
 	.driver	= {
 		.name		= "sun8i-a33-mbus",
 		.of_match_table	= sun8i_a33_mbus_of_match,
-		.pm		= pm_ptr(&sun8i_a33_mbus_pm_ops),
+		.pm		= pm_sleep_ptr(&sun8i_a33_mbus_pm_ops),
 	},
 };
 module_platform_driver(sun8i_a33_mbus_driver);
-- 
2.53.0

