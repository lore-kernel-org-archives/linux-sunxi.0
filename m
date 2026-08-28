Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7086439B94C
	for <linux-sunxi@lists.linux.dev>; Fri, 28 Aug 2026 04:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787892198; cv=none; b=hVCuK1kOU+8OM+ItF1+ESRcIoYC785gdckQqDOCikFR7vVkMwFQSL7FxUdazG4bISU3cFk9JKeF53T8QccswsLRpvaIJ7pBBrz1ioC/CJsMX2kBCIGiIPyBgc9YdyFm5xnFbCaN7hhail50u9fmteQYzqwujQ+qzzQWOMpNvpi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787892198; c=relaxed/simple;
	bh=HmYQGD+I5nP9MGSMp6rCzVD0nnlHV9eD1YAEeFkbNCQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=I3g5oNXcBa4x1t6kZO6AXI6C8f12PHCc3ULkS8sX2DwLCI+iLBop1uWa2vMe4MtiBWHxAFMYLbCogTDMBzmHXwfK8Afhf5LNpHsp9NgzkWePHtgQk5H0aEzG9MfOP/ayde1OPA5NeZmDg6rnNYGpl2/UCFym5SzavQn3WupLEjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CM+XM0En; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CM+XM0En"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-45eb688c891so178801fac.2
        for <linux-sunxi@lists.linux.dev>; Thu, 27 Aug 2026 21:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787892195; x=1788496995; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xvo929vZe40Bej4+5nG1zx+7ENE5vhyPaIbe1OuxRao=;
        b=CM+XM0EnMGjdNnPxIxjmOKjbX4xdTw2e1h96WF1vaGMAFNOIF+/Z8qORRYRCv8mLND
         w1W8ol1Ba217vVRM/skQQTOwbMOGFiHbKe8l2mE+SWkqfMUkQuzEyUTzFDhZuFBX9gK1
         +esMiK/mbEEOC2YwFlK8p1qzPA+jAOmT8l6UcjIVXTmhbDrfPGixwYiiKGZaP1YmR0qI
         o2FxAyqSdpwLfGBXRY5k0kl05hu1RQrRmC2XVWeyof0zz1EsjR//k6lurIM2jBpaycRO
         A5/Z5r5yGJyFJJJJzppe1v7aiaBxs/vOg6pyuyIdw32rv0PDFiUTjazQeG70mF6Rv2bs
         gS/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787892195; x=1788496995;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xvo929vZe40Bej4+5nG1zx+7ENE5vhyPaIbe1OuxRao=;
        b=qTzG3p06cvFf3nuFdtRuxVSChT6ykHuHi7cfsjEu3F9/636m2OnymQ5Kth8Vwck853
         pHTwq6epcJtLA7MXuTvQXtybhHpbYWRpSi7cR6Py8arAlmLPIIbhq7G8cJ4uvduSZIaQ
         Vtzd2SGlEAEDUAR7y/M89rJl38/C0j66hV1tZrjJoHBrYhQL8TWN2mIxJMPg/VW3jHCt
         XRtE54Juy1gtFcgAmpf99rMN8rOTBwQcp3ELW2H6ODR3/14Kxk4ZggzUf8DC4vlml5E+
         eax/4JPLpLHHtHnPtJtLhwjRBPviPZ4FQXTVX1JovDoJ7UZU4A4TWUUFHUSwBtD9N2FA
         FdNQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqryf77ocfHXK43fJpT3uBr1rJuf2TjWhphEc6/9/DIc+BkPIchCWD3ZdYg2QwJzdn0xGxB548pwYoNZQ==@lists.linux.dev
X-Gm-Message-State: AFuF++nl7JBmI7prvORNOlX/i4wRtJhg72cCah73bzMav+VLkSnUlp0P
	efPw+hl95Mt/eDZkrNh3/B4zXYrOyMb0eAtsl4a654NZyxqCCMNx+q6o
X-Gm-Gg: AR+sD12t+0QGfdZOsb4BVW1fW1D6xGdO7EyVP0qILSfQ+Ckt1dnT/fZyXg/SZdVlWGr
	qAtZt1IXZ1rTbQs2MPPIeyoaY/F4tfg3s1Pc4irFvnOhyNFL+8/bLlD40gRxdD7D6HvHWs9SUuP
	0A2CqY19lAcenqF7ZCkwy+4+ULKoLuN3OrALku7km8eS3nv+3Lbm8ZqrD2H++Ib9CrT/CTcxB0x
	3MFqK8Ul+fJCb33pmyuYWimIedJ5UiQPoYY88q6Hv6u1tC2Hqa6l7qbjOzPXRcRDSCERbJnRc/5
	KTrBhVferxLeetlogqxIv+RtSMalUs4wWzvbkYx3a/I86Luiri2pac65YRDY/XKtoFbKg3xULNK
	2ncXaPRmHIFedjR7TTYsvwKgmbaW7jqokiSqnv0B6xqc2/KvwryVFsnB5lXxM69zbF8Ss9tzbaD
	QqqDx2lH5FTF9jQEEs+mzDtfkmzmqKshkWJgPlEs/NeiyvMA8pLO4owcDJbooxDTJpxcXY6y+1Z
	Um84cUufjncXN7FUMrgoNcPTtP3/2dZKu85+3jgJtrw4cW+bdYjm7xO0NEim/n46f5cHDLW6ADp
	3G0TASKKp1sTfTCpz9+fql7yyCkFg0vOqF+/+HiMHE0ACBl0UTnn4LaiUFlC6XdIpr+7ZRheNkv
	ueexFSYuIr7/yChbKneE=
X-Received: by 2002:a05:6871:a516:b0:44c:d6f0:7f70 with SMTP id 586e51a60fabf-468377989e0mr4945563fac.17.1787892195218;
        Thu, 27 Aug 2026 21:43:15 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-468a2fedbcasm497632fac.2.2026.08.27.21.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 21:43:14 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 27 Aug 2026 22:42:31 -0600
Subject: [PATCH v2] watchdog: sunxi_wdt: preserve boot-enabled watchdog
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-submit-sunxi-wdt-boot-enabled-v1-v2-1-610d37dccc97@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOQQ6CMBBFr0K6dgytiMWV9zAsaDvAGGhNWxFDu
 LsFT2Ayyc9Lft6fhQX0hIFds4V5nCiQswnEIWO6b2yHQCYxE7kocykuEF5qpJjCzgRvE0E5FwF
 towY0MHGoCm1KhVKejWBJ8/TY0rxP3OsfJ8cDddy8W6OnEJ3/7D9MfOv9MZeOg+FlW50KrWVe3
 bqxoeGo3cjqdV2/S14P++IAAAA=
X-Change-ID: 20260827-submit-sunxi-wdt-boot-enabled-v1-94cd6be885d2
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Carlo Caione <carlo.caione@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: Wim Van Sebroeck <wim@iguana.be>, linux-watchdog@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

sunxi_wdt_probe() unconditionally stops the watchdog even when firmware
left it running. This opens an unprotected interval during boot and
prevents CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED from taking over the active
watchdog.

Detect an enabled watchdog and decode its programmed interval. Preserve
representable timeouts, and round the 0.5-second interval up to the
minimum representable one-second timeout. Use the configured timeout for
reserved interval encodings. Set the Linux reset mode and ping the
watchdog without clearing its enable bit, then mark it hardware-running
before registration so the watchdog core services it until userspace
takes control. Leave disabled watchdogs untouched.

Fixes: d00680ed0026 ("watchdog: sunxi: New watchdog driver for Allwinner A10/A13")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - Use one second for the boot-enabled 0.5-second interval instead of
    falling back to the configured timeout.  (suggested by Guenter Roeck)
  - Leave an already-disabled watchdog untouched.  (suggested by Guenter Roeck)
---
 drivers/watchdog/sunxi_wdt.c | 45 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/sunxi_wdt.c b/drivers/watchdog/sunxi_wdt.c
index b6c761acc3de..3db34524ed13 100644
--- a/drivers/watchdog/sunxi_wdt.c
+++ b/drivers/watchdog/sunxi_wdt.c
@@ -128,6 +128,38 @@ static int sunxi_wdt_ping(struct watchdog_device *wdt_dev)
 	return 0;
 }
 
+static bool sunxi_wdt_is_running(struct watchdog_device *wdt_dev)
+{
+	struct sunxi_wdt_dev *sunxi_wdt = watchdog_get_drvdata(wdt_dev);
+	const struct sunxi_wdt_reg *regs = sunxi_wdt->wdt_regs;
+
+	return readl(sunxi_wdt->wdt_base + regs->wdt_mode) & WDT_MODE_EN;
+}
+
+static unsigned int sunxi_wdt_get_timeout(struct watchdog_device *wdt_dev)
+{
+	struct sunxi_wdt_dev *sunxi_wdt = watchdog_get_drvdata(wdt_dev);
+	const struct sunxi_wdt_reg *regs = sunxi_wdt->wdt_regs;
+	unsigned int timeout;
+	u32 interval;
+
+	interval = readl(sunxi_wdt->wdt_base + regs->wdt_mode);
+	interval >>= regs->wdt_timeout_shift;
+	interval &= WDT_TIMEOUT_MASK;
+	/* Round the 0.5-second interval up to the minimum representable timeout. */
+	if (!interval)
+		return WDT_MIN_TIMEOUT;
+
+	for (timeout = WDT_MIN_TIMEOUT;
+	     timeout < ARRAY_SIZE(wdt_timeout_map); timeout++) {
+		if (wdt_timeout_map[timeout] == interval)
+			return timeout;
+	}
+
+	/* Reserved interval encoding. */
+	return 0;
+}
+
 static int sunxi_wdt_set_timeout(struct watchdog_device *wdt_dev,
 		unsigned int timeout)
 {
@@ -259,6 +291,7 @@ static int sunxi_wdt_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct sunxi_wdt_dev *sunxi_wdt;
+	unsigned int running_timeout;
 	int err;
 
 	sunxi_wdt = devm_kzalloc(dev, sizeof(*sunxi_wdt), GFP_KERNEL);
@@ -286,7 +319,17 @@ static int sunxi_wdt_probe(struct platform_device *pdev)
 
 	watchdog_set_drvdata(&sunxi_wdt->wdt_dev, sunxi_wdt);
 
-	sunxi_wdt_stop(&sunxi_wdt->wdt_dev);
+	if (sunxi_wdt_is_running(&sunxi_wdt->wdt_dev)) {
+		running_timeout = sunxi_wdt_get_timeout(&sunxi_wdt->wdt_dev);
+		if (running_timeout)
+			sunxi_wdt->wdt_dev.timeout = running_timeout;
+
+		err = sunxi_wdt_start(&sunxi_wdt->wdt_dev);
+		if (err)
+			return err;
+
+		set_bit(WDOG_HW_RUNNING, &sunxi_wdt->wdt_dev.status);
+	}
 
 	watchdog_stop_on_reboot(&sunxi_wdt->wdt_dev);
 	err = devm_watchdog_register_device(dev, &sunxi_wdt->wdt_dev);

---
base-commit: 1b78070aaef63512688aebfbc82365ef9d6660f1
change-id: 20260827-submit-sunxi-wdt-boot-enabled-v1-94cd6be885d2

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

