Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0DC227BAD
	for <linux-sunxi@lists.linux.dev>; Fri, 14 Feb 2025 11:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739532265; cv=none; b=NpRKMpq3Po9MkNyuw6ja0TPzmUUSTLyPFD022DDWJ1TKbu4C2XDIPV9irT1H8nCRhkZldSo5mu/ndSmbCGo4gvoHcUxFxCuOpkvPp+Mf80gUChHY78G3IS/PN0H6VQVoRa6vCOJJUiGuL/wIanKMkTLy95+tHs3B0Se9LuH7EWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739532265; c=relaxed/simple;
	bh=xoPfeGaMeAnbYc4D9oVEv8b6qS8ajimo6pf9kVPokbY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FxlivUKbnj2+a40b9e9LwtNBOlF4BgZCTSFpCWrTmi+i7GkvjZQvOLYcxFZ+CcdaSNMKqBkYg5nsUbqngfEs6F4NNjnwlPKlVnGrBdKqWCL8kSsZhkUapQ6t5ycekjHuVyP2/Ms7RfFgjP57cpxzaaiKz0A+39lB/fETDz1Bl7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K8hRBx0D; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K8hRBx0D"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5de4a8b4f86so2773867a12.2
        for <linux-sunxi@lists.linux.dev>; Fri, 14 Feb 2025 03:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739532262; x=1740137062; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6u3ojM9oHoVngZ+zSXriBOwUU5fx5CwXrZHQTSmA34Q=;
        b=K8hRBx0DW0CJ2GXQEXb5uxnyPRA520YXr6K1t6MFLANoYxIaeXQuOhBmd4/sCu+NKS
         lm74rbzuzd3UG208JtfULN08BxBqjj4o/qev/S/TDHexIY/0AT0XIJcqupLYOQx9ygkk
         eR3PdoGkY7fSPcQiMiiKT9EIJ/CRE1zPgQ1idyRnHuGDyOhnHzdhWW3kjr6c1dntKsME
         aQxKO9Xb4G3+A4Hb1t7gljEbReDbsUaT7jYsMTBkXbhaVidmmH9bfinNDeumVhGYUpy8
         ca6hwv+eaTTH9UgfQDzRWZOu/Ke+ZAuVatkLBnQ9M7ZBBleiemDleldwoVEIJRZEDWKK
         HYbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739532262; x=1740137062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6u3ojM9oHoVngZ+zSXriBOwUU5fx5CwXrZHQTSmA34Q=;
        b=nCZV4AR1xTYb0pHmjMqRWC5xcssCOxgOCWcab5a9mWUxCEHCyicd9sXSF+cyE7mQxQ
         +56gsumvZJdhvt7KKK/yEV6RtNKRhkaiE9gLgFhttqhnvxm0vg4LiKQyrgq9y4O4GsC1
         qKTzcZoyaN7MOJ+h3G+ynFxtV8GmGrzSFQ9kf+Z3YMgN3BkYO+5MPRvZjZ4UHC8GBFzd
         TD94ulfIXmSaA0VfpzdThoxMDrY9hln/5lLNyz3xaJnWE/ZjOzyO9FZf3+CQAk+SulTc
         ZFmZxOPTWMS3kXWOvkfCC8zkyJUGCIiwwwl3RCR26Wm9LU//ZH9LH0ju6cIN08P4KYqb
         Hgcg==
X-Forwarded-Encrypted: i=1; AJvYcCWfKBaFRUm/RbK5xMdPiHkXufLOrnEqfOG0kGDEY2EK9wCZbBrMgoklw20HzsTH/QgRfW6fLn/AGMp1ZQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzuI1XW/l5sY7zyrEkIQXjVAwRQWSzVlF93QsESSz8747+AeiqG
	bIJ5jHFP9Vipqao1F+Vb6TYNQSdiY1IAB+1tPM4q79NKphqK4gg+kPINTb4n
X-Gm-Gg: ASbGncufpoHwQ0JKxn7WkpHqMJ1UGPkvtaAUV8WbCaLq8krxWJC/NkKisXxnOHloMms
	pj+Qf7mR1gJshNdF2zwkM3P0i6IlR7Pv1xbdPWzrO/Oli+5m42889xMquUben8cfjEBlZB62Qzu
	uVrFHVcA7BlS9wsN23H0EMEgbUAjr07OyTyQXawKCtmDELTDxndkhtzQhMzzCZs8biY7M8FpZXM
	+09qsJghdgoWoxsABSmM0F47YVFyLpqWuGYvuo77Mg6WZyG6wQ+u2mC1tf4jKb/nwyvvkEE+H04
	vs8tbROioJncFWtnf14zJJ3sJcGXyOcWgi2HXVMRqhmJslUPBNx3
X-Google-Smtp-Source: AGHT+IFpCUYSVYlZScFUUmsS8KG3/PYr/ve7XBNh3XUSHixfrU5ppZNMRkZVtyg8SPqunh8IFSJGsg==
X-Received: by 2002:a17:906:3283:b0:aba:a81c:f972 with SMTP id a640c23a62f3a-abaa81cfcbamr61349666b.17.1739532261556;
        Fri, 14 Feb 2025 03:24:21 -0800 (PST)
Received: from Junction.dargent.eu (242.76.29.93.rev.sfr.net. [93.29.76.242])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba532594a0sm329434266b.68.2025.02.14.03.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 03:24:21 -0800 (PST)
From: Regis Dargent <regis.dargent@gmail.com>
To: 
Cc: Regis Dargent <regis.dargent@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] watchdog: sunxi_wdt: Allow watchdog to remain enabled after probe
Date: Fri, 14 Feb 2025 12:22:54 +0100
Message-Id: <20250214112255.97099-2-regis.dargent@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250214112255.97099-1-regis.dargent@gmail.com>
References: <CAGb2v67tmzGfcFPchjzfSima-sT_u7viYd1UDGB9r6ZeJEgdyg@mail.gmail.com>
 <20250214112255.97099-1-regis.dargent@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the watchdog is already running during probe, let it run on, read its
configured timeout, and set its status so that it is correctly handled by the
kernel.

Signed-off-by: Regis Dargent <regis.dargent@gmail.com>
---
 drivers/watchdog/sunxi_wdt.c | 48 +++++++++++++++++++++++++++++++++---
 1 file changed, 45 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/sunxi_wdt.c b/drivers/watchdog/sunxi_wdt.c
index b85354a99582..0094bcd063c5 100644
--- a/drivers/watchdog/sunxi_wdt.c
+++ b/drivers/watchdog/sunxi_wdt.c
@@ -140,6 +140,7 @@ static int sunxi_wdt_set_timeout(struct watchdog_device *wdt_dev,
 		timeout++;
 
 	sunxi_wdt->wdt_dev.timeout = timeout;
+	sunxi_wdt->wdt_dev.max_hw_heartbeat_ms = 0;
 
 	reg = readl(wdt_base + regs->wdt_mode);
 	reg &= ~(WDT_TIMEOUT_MASK << regs->wdt_timeout_shift);
@@ -152,6 +153,32 @@ static int sunxi_wdt_set_timeout(struct watchdog_device *wdt_dev,
 	return 0;
 }
 
+static int sunxi_wdt_read_timeout(struct watchdog_device *wdt_dev)
+{
+	struct sunxi_wdt_dev *sunxi_wdt = watchdog_get_drvdata(wdt_dev);
+	void __iomem *wdt_base = sunxi_wdt->wdt_base;
+	const struct sunxi_wdt_reg *regs = sunxi_wdt->wdt_regs;
+	int i;
+	u32 reg;
+
+	reg = readl(wdt_base + regs->wdt_mode);
+	reg >>= regs->wdt_timeout_shift;
+	reg &= WDT_TIMEOUT_MASK;
+
+	/* Start at 0 which actually means 0.5s */
+	for (i = 0; ((i < WDT_MAX_TIMEOUT) && (wdt_timeout_map[i] != reg)); i++)
+		;
+	if (i == 0) {
+		wdt_dev->timeout = 1;
+		wdt_dev->max_hw_heartbeat_ms = 500;
+	} else {
+		wdt_dev->timeout = i;
+		wdt_dev->max_hw_heartbeat_ms = 0;
+	}
+
+	return 0;
+}
+
 static int sunxi_wdt_stop(struct watchdog_device *wdt_dev)
 {
 	struct sunxi_wdt_dev *sunxi_wdt = watchdog_get_drvdata(wdt_dev);
@@ -192,11 +219,22 @@ static int sunxi_wdt_start(struct watchdog_device *wdt_dev)
 	return 0;
 }
 
+static bool sunxi_wdt_enabled(struct sunxi_wdt_dev *wdt)
+{
+	u32 reg;
+	void __iomem *wdt_base = wdt->wdt_base;
+	const struct sunxi_wdt_reg *regs = wdt->wdt_regs;
+
+	reg = readl(wdt_base + regs->wdt_mode);
+	return !!(reg & WDT_MODE_EN);
+}
+
 static const struct watchdog_info sunxi_wdt_info = {
 	.identity	= DRV_NAME,
 	.options	= WDIOF_SETTIMEOUT |
 			  WDIOF_KEEPALIVEPING |
-			  WDIOF_MAGICCLOSE,
+			  WDIOF_MAGICCLOSE |
+			  WDIOF_SETTIMEOUT,
 };
 
 static const struct watchdog_ops sunxi_wdt_ops = {
@@ -275,8 +313,12 @@ static int sunxi_wdt_probe(struct platform_device *pdev)
 
 	watchdog_set_drvdata(&sunxi_wdt->wdt_dev, sunxi_wdt);
 
-	sunxi_wdt_stop(&sunxi_wdt->wdt_dev);
-
+	if (sunxi_wdt_enabled(sunxi_wdt)) {
+		sunxi_wdt_read_timeout(&sunxi_wdt->wdt_dev);
+		set_bit(WDOG_HW_RUNNING, &sunxi_wdt->wdt_dev.status);
+	} else {
+		sunxi_wdt_stop(&sunxi_wdt->wdt_dev);
+	}
 	watchdog_stop_on_reboot(&sunxi_wdt->wdt_dev);
 	err = devm_watchdog_register_device(dev, &sunxi_wdt->wdt_dev);
 	if (unlikely(err))
-- 
2.25.1

