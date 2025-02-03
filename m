Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8384F20E31E
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Feb 2025 17:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738603200; cv=none; b=OjZQXEBqmsQ6YOr/zCaQFXJeHTt4pigbXfBVuGvDl8xiGuooo+3HBd5CUSNJ/PpUTxIpKjE99wORylz3sWzxUKHHNAGEydn4TM3vAId9rZqCsyVoFQhE+EF2vlQd7By4oOoMCgItD0jxbi6tkKdIczuwueszgRKw4TNp2AygL1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738603200; c=relaxed/simple;
	bh=GRkT0ebnQauIZqk7ybUUtMBvjGqUJmcRDaTiU/abV/8=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=H/v7wvuRyAxbcRp+UBkS5gHDQyYmKCeK4i9ePyL8QXK70KXSa7Drx1KT//zu7hNSIl9gty5rsDab6sh82IwusnEvIUlh4WlaX7PJC+9zxlRgtYKF/ivWJbKMTRaRFb3AFFhfrr3PRQs/q1i+DTLE+6zZZa6y3w0bQARXx9cHlLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gXUE7gmY; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gXUE7gmY"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4361dc6322fso32219595e9.3
        for <linux-sunxi@lists.linux.dev>; Mon, 03 Feb 2025 09:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738603197; x=1739207997; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=9WxGOHRnq/ps2wESADaqRWhxee6Ff6gxtmLSlui0suw=;
        b=gXUE7gmYb+OzMn/7uTJdWVpNT6QGlQeWS22Pgws2CKW5EWXoeI1j4TKAAdLelW1Rd0
         eb5mQgO9H+1SMvH+snCkhOEClXdseVNpA2o2FQ+zeqD1TPSEofN70CtVd2ZJnqAbyC5v
         k0U7WrcEphudUaBIExzmMrm/bdsaANw8VqIHzW1J7CDFhJA1+wVVPCEZm4LrTVixPGCr
         s8GqT6N7KFNnPVA5z1SQejIfU52ZBXuVbPz/QXTmO3GgVFeQHwmPt5M4jW26RIKcF92/
         Qf8oon4k3IQzr4p7fWU4Hn8o9n/YXWMWke62Yt/zH68FJQQINDTg5WO4y+/8aHPmhnw8
         NuMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738603197; x=1739207997;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9WxGOHRnq/ps2wESADaqRWhxee6Ff6gxtmLSlui0suw=;
        b=jqnnWRiXiGYKEN9736zY1P1ktdzcAdMYkg4GnZvpaCLjXMzIPR+1LHZ4tvavy6zAQu
         IVAvSxVX1Kk4jDLWL1K9qLNUXOy1M8Ip5UCvrFYt5zIC8iNOLJxBy47poqo/ujKd6POc
         bCqgpBzBm0Up0zSpetlvRsQOcCwsOwMKslXt60guKKpwJT7iRL2VPTRUdJH8vgOIds5d
         4tmXc55LiQMe6Lm3t2iWgBYFDr1XeMMYuPJHyqMgRr5N4tFw3WH+C3GgyfYaqKvVk0wo
         r2hLgr1Sh3zEkdOf4C74E1FGP4mWkjKc5EwfMrv4Awwf9zCDw0uF8uOz09xais/urL8H
         jZLA==
X-Gm-Message-State: AOJu0YwhaoVJVAX+nSXTp9gfBsxmuVg6q3R4i3aQP7DRF13tCd1WnhI4
	IX56q+ntBf0C/RYfgvjNIJUfb1NqdpTMm7CY46zYtDvzb9zHzrf/yNq0/g==
X-Gm-Gg: ASbGnctvmTY8Sc9Jnk5S0G13bW6SfNX/+Tdq8kiBuXAs/bVwdDCQ6u6dwdj32blWRCE
	dDIds/MzJ58u9XOEu7Wcxq+dFFYMN+WSw91/nPaMVb4XE0brndRfsT4f4BEIzf3nZYseF9OFMPu
	z89pRPCOWk/0Z+zBoO9YTJFYN69m2cOzuQEw0E56V/7rQdgEcy4R6nLSzd7Owa6DkX5APyibPTj
	ywmX08lDQL9B4+R+S7Zg2U8GM+9jce4tHiCnA5NOTljg8yRI3+V4gmP20WPNlmMH00+5P0e1/i2
	Il3rbHvOa1InNsB4ccxxsIf0R7HbmlgQGw/Q2ztv1/tOiTv2233v
X-Google-Smtp-Source: AGHT+IEGMgIbGbNpmCl6+TEO4Kt1JX0ZgmjmmGGVRH2VrMLGCziBVWzwFISfDO54jLN/tYvVv1vXAA==
X-Received: by 2002:a05:600c:1c88:b0:436:1be4:c9b4 with SMTP id 5b1f17b1804b1-438dc428ad1mr173312805e9.27.1738603196617;
        Mon, 03 Feb 2025 09:19:56 -0800 (PST)
Received: from Junction.dargent.eu (242.76.29.93.rev.sfr.net. [93.29.76.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc2e384sm202401955e9.19.2025.02.03.09.19.56
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 09:19:56 -0800 (PST)
From: Regis Dargent <regis.dargent@gmail.com>
To: linux-sunxi@lists.linux.dev
Subject: [PATCH]: watchdog: Allow watchdog to remain enabled after probe
Date: Mon,  3 Feb 2025 18:19:55 +0100
Message-Id: <20250203171955.5858-1-regis.dargent@gmail.com>
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

