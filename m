Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC0822686F
	for <linux-sunxi@lists.linux.dev>; Thu,  6 Feb 2025 09:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738834801; cv=none; b=gCJposgfSYE77wOXNWkis85BMQTatmkzbCRhISqQdL8OPZNkRxFXenIeCLHQdnnhXNJRR/w/56WvGshH6T5COlP3ZaJxGvYGqZ6YCALmZtIflAWj5nYWgC+Q/MwnCVyvPs9+K1+hv9b2gB5Hj6O6iETByLLWh7JQcD0VwNPJ6/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738834801; c=relaxed/simple;
	bh=GlSiss/9xRV3Z/DGuoJIFrhcCv2WUb2A+bRioeMM7y8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BSTn0SzZ6xQc56M2LthUaZH8GC/M+pYusqqZrp9sqmqOPVn/N//4yYPwc4NRfa3QxriH1rVVycBxLskp7wiaxo/R4aHTA3fJf+mq43VnXWlerRQmQWVcPaAeJaM1axLhj4njh7+eUM/VjRDFsi1DN6uEsn3gHxOm5ogeYRmjkPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XOednPV9; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XOednPV9"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4361f65ca01so6494055e9.1
        for <linux-sunxi@lists.linux.dev>; Thu, 06 Feb 2025 01:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738834798; x=1739439598; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l/jkdfrZ08jX6WcmWMCx0fLw09dF088mHQgwhu4b5Bw=;
        b=XOednPV9T5JCULGdvMPoezd0++XxPE4sbqSm4PqOjzfE9ntQX7UAhtsVDhJ+gD6RY7
         9cp9TfHeJ/U1tSrj2SlCSzROgnvcSm4xHSuSZfMQNZzW8JTAyGxRqJTio9z+BTqen468
         QPKXneZaglROJYNEDg5g+h8DJc4LJJwbGrDiaX0lbHkiH2bAwqdw4QqTrIgIChVpGzv3
         oRd/JP5+g6LYyIcxPOa/kWCkcVk+TbnoXbV5SNL/L9RNEhJEiBJyZDms3BXOAC6U5Lx1
         lH5/SRMT1iG8X4JVBtoBcJMhePjx1kbaykaU9hjrwR1PYH4ELdAxSzBBKBcA83YvjbDE
         Zl9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738834798; x=1739439598;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l/jkdfrZ08jX6WcmWMCx0fLw09dF088mHQgwhu4b5Bw=;
        b=satothO7QS/VuCEqJr8vxbwnfbgIXrZfYvSKGBSsXFMwRJ9TulcRhaUZ0N+R2A6E3I
         AbvSrVd2bhkDYMKZgb7YsSh6wPVVCa80CNnbqTkjwA2ORr9I5dSYU7+9ABAp9NMblZPu
         UvXMDSwHM8km5dWE516dW0qvHdZq5h4XZkenueUAsd/ytj49rhzfBlCwCW7yIfJ0s+o1
         XtGp8B+BV106Z/NaDucgYZpF37QVE8zAGiOKMLZPTRk8scuo+lcTwjjyKmeMAN458u/H
         pl3YDS9ziwCzBCw8m1S96cO6D/xUNF5JOxTvf4aUdc6PJVY0eK/3uZK3leRcQQkaPNuc
         L1fw==
X-Forwarded-Encrypted: i=1; AJvYcCW5O80Y83+B6X7PG/K05VSrzP0F14BD+sXLrEMlptPViLpGM3g1FzWac77Mgw8MJ1pgnsbMS4Qss3ouwQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyLUF9mAaeolLamJOtIGOvrNVrtl/dtDCS82GhCgZRYpkyu4sMd
	VMCkhMiOw0/D0ep18DKvhGyIQR9D7bmthEn/3fQIPzQ/eYmUNtan
X-Gm-Gg: ASbGncuMZ9G2+3ezz8XSfB5Fk3f1r8oAnTtzJgOXrV07X5s3ScuZG2qD5zGcOLjZCL/
	p3A0GyLrOI3bYCUc+H8Wi+W3hmjehAiGH571F3Ev/q9TbVbubTBiSEdFdtQ53erXEm/8UnIc+f5
	D+VwwtcJFmTUcmy5Z/9JH9Y9gLun+1JksU5Ya1+T04hZmOLQhNLT/h22cMlkO+n6+90GUV7U5NW
	EEPtZEpfMXxyPgDO+hx/yynJuMbmM4iyN5MlxqkMXPBETWFZpOE+AUWEOe789zV7zLvZMA2cZ2P
	fy5xKzrMTYYNob+5TgcCCPBGvGGhP9wRk9Cwu9iHaxp4P6huUuvq
X-Google-Smtp-Source: AGHT+IGBzVXmnW+V09JM5cj0lj1ejZ6PtsqYBnWfyMAP4lVzXR/2TmoEhoDdYt7Jw/te+/+0sWsibw==
X-Received: by 2002:a05:600c:4754:b0:435:1a2:2633 with SMTP id 5b1f17b1804b1-4390d43da3fmr53984655e9.15.1738834797789;
        Thu, 06 Feb 2025 01:39:57 -0800 (PST)
Received: from Junction.dargent.eu (242.76.29.93.rev.sfr.net. [93.29.76.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390db10b17sm48170475e9.34.2025.02.06.01.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 01:39:57 -0800 (PST)
From: Regis Dargent <regis.dargent@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-watchdog@vger.kernel.org,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH]: watchdog: Allow watchdog to remain enabled after probe
Date: Thu,  6 Feb 2025 10:39:56 +0100
Message-Id: <20250206093956.46593-1-regis.dargent@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
The sunxi_wdt watchdog unconditionally stops the watchdog during probe (on my Allwinner H616).

What I want to achieve with this patch is to start the watchdog in the bootloader (either manually or automatically), then boot Linux.
The watchdog is about 16sec timeout maximum, while the full boot to userland lasts about 90sec, and I want the board to reset if, eg.
the rootfs cannot be mounted. So I need the watchdog to be handled by the kernel during boot (which it can do pretty well).

The thing is, the current driver stops the watchdog during probe, so it does not run during boot, and it also does not manages the "status"
field, so the kernel would know that it must handle the HW watchdog.
This avoids automatic reboot in case a problem occurs during boot (and for example handling in the bootloader).

The driver should detect if the HW watchdog is already running during probe and set its appropriate status bit to allow the kernel to handle the watchdog pings itself.
The call to sunxi_wdt_start/stop allows for proper driver and device configuration.
By default, the kernel will then ping the HW watchdog at apropriate frequency, but the user can have it stop after a time with open_timeout parameter.

 drivers/watchdog/sunxi_wdt.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/sunxi_wdt.c b/drivers/watchdog/sunxi_wdt.c
index b85354a99582..20fe7da445ea 100644
--- a/drivers/watchdog/sunxi_wdt.c
+++ b/drivers/watchdog/sunxi_wdt.c
@@ -192,6 +192,16 @@ static int sunxi_wdt_start(struct watchdog_device *wdt_dev)
 	return 0;
 }
 
+static int sunxi_wdt_enabled(struct sunxi_wdt_dev *wdt)
+{
+	u32 reg;
+	void __iomem *wdt_base = wdt->wdt_base;
+	const struct sunxi_wdt_reg *regs = wdt->wdt_regs;
+
+	reg = readl(wdt_base + regs->wdt_mode);
+	return (reg & WDT_MODE_EN);
+}
+
 static const struct watchdog_info sunxi_wdt_info = {
 	.identity	= DRV_NAME,
 	.options	= WDIOF_SETTIMEOUT |
@@ -268,6 +278,11 @@ static int sunxi_wdt_probe(struct platform_device *pdev)
 	sunxi_wdt->wdt_dev.max_timeout = WDT_MAX_TIMEOUT;
 	sunxi_wdt->wdt_dev.min_timeout = WDT_MIN_TIMEOUT;
 	sunxi_wdt->wdt_dev.parent = dev;
+	if (sunxi_wdt_enabled(sunxi_wdt)) {
+		set_bit(WDOG_HW_RUNNING, &sunxi_wdt->wdt_dev.status);
+	} else {
+		clear_bit(WDOG_HW_RUNNING, &sunxi_wdt->wdt_dev.status);
+	}
 
 	watchdog_init_timeout(&sunxi_wdt->wdt_dev, timeout, dev);
 	watchdog_set_nowayout(&sunxi_wdt->wdt_dev, nowayout);
@@ -275,7 +290,10 @@ static int sunxi_wdt_probe(struct platform_device *pdev)
 
 	watchdog_set_drvdata(&sunxi_wdt->wdt_dev, sunxi_wdt);
 
-	sunxi_wdt_stop(&sunxi_wdt->wdt_dev);
+	if (watchdog_hw_running(&sunxi_wdt->wdt_dev))
+		sunxi_wdt_start(&sunxi_wdt->wdt_dev);
+	else
+		sunxi_wdt_stop(&sunxi_wdt->wdt_dev);
 
 	watchdog_stop_on_reboot(&sunxi_wdt->wdt_dev);
 	err = devm_watchdog_register_device(dev, &sunxi_wdt->wdt_dev);
-- 
2.25.1

