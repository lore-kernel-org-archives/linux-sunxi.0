Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DAD26E637
	for <linux-sunxi@lists.linux.dev>; Tue, 25 Feb 2025 14:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740494221; cv=none; b=TBqWSCisZ6jY7vl6X0H30uqzt7aAuTitSus2rcjVF7kOD02wvkCGX66kwzTIhnQ2FLUZL4WK5EkxoOKs6gvsADi4PjRZB9JjBG/sYbrOFgYhTZjRLQzC5iX4lo9+ieJTx/s7DmD9Fqv9MnBnFWlTEV3KQCiISZJRNVrg0sqshpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740494221; c=relaxed/simple;
	bh=oxUNXWyrdbfw0HhvZKnTRghHV9qRgTedjCmOgTIoAls=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=vAnIKoM/eJ3i3gjWgWvmoHa/osaEqRDyBV8ab8dYqn6Go1/0fNPk2fjiH50YNCbX0Kv8aAFgoklC5bSQL7sgdUo8iYjU7fx7pRTK5q6C2gAV8WfmfqpwprvhEPfxHqX5roCeqXnbEF72sTCvPw7A3+UFxhFsjKUN//qRijizuoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A+lMehHy; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A+lMehHy"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-439946a49e1so36139115e9.0
        for <linux-sunxi@lists.linux.dev>; Tue, 25 Feb 2025 06:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740494217; x=1741099017; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l/sg7omSvJw4OhSWVma2ygvtz/i44Mb1jIOoIOn0G+U=;
        b=A+lMehHy/CoTfgIC+O8L+DC/pHKHzyg/CYE1eOPAGtva8+83MQ8v0vPcX29SAjIkAR
         FJ8DizBrUDKkLX+w1QiXpdIv9Kt0CNiujoH2+gEYFaVSMxxzlj/qpELRg7WGTqgl2fjs
         t9jHqAXOoJtQ1nk5L9IcZJTHfgTSJtLWwuoj7JZj/uUkhoP0xkrOCa+VMG/GFXrza2w4
         7iBEDnBoi4qZBW7FiAYcQ5L46w6p/1wQx52BkpBIxXBqegpMXqrDF6kBatRC3624pmiR
         5XFqNJ3JeydcApQoGpH6QGEncKPEOOLqiKrpN2an7fqLYM4moom48g6WN5mlfiNKZ6kJ
         ssCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740494217; x=1741099017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l/sg7omSvJw4OhSWVma2ygvtz/i44Mb1jIOoIOn0G+U=;
        b=s0t+VRYBvUsb6J5xy7rvdEtTpt/tR/TdXppwtWtRqAq7RCxL03phHlm63xjL4LN8QK
         omRSfgQcsJ+0JSWDIGz0GeY/pgh/4oSorELviCAKOsZ37Trqh8As8mJIfQsHKTej+sWL
         If23AF8Et3ltu+Nv+vNx4/uO5/7AG6UicpmP53UCzOj0wTcL9Cho0oRpZkJZCkiKY18d
         eT5kKMo8zSHU1EFqr2GvtHDYV4w6VMernQDRqllFxmRw1tgh3ju4ZL2PrujFYN4edKNY
         0yw5zhHKTsY6EqvaF4xs01mxiexwuubU4GiKLRBi00Ad+mD8Z0mHi6CMK934YoIArxLG
         Akrw==
X-Forwarded-Encrypted: i=1; AJvYcCVLMfFHtnQj8+ihNPpBOkrJ1dgs688SBaYbdtvaZQCoe6BP2NIviw8I94UZ/qTFzqO/Ju8f4BMEW3sRrQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwZ0nxgZBtnlTBa0CegN0jAw7nwFi77UDN0rGn/xgdujFdD/ShM
	xGcWIMzb4ren/2+WqTUcM7uDsuIKvDLK8QihJs3kNtzg2oc2r8ub
X-Gm-Gg: ASbGncunnNI1439FblYmBequnId5sLVPtMsArK39qi9QwvsztPMEKfSL+6w3zrZZ485
	2rmh3DwLIMZCAdm0T7JGJShi9DHWjkSbVy/5AplpAzc6D/kd1/YY5+mOnyKZy0XHjBpDFXAzqLA
	Jzb0tRD7f6sEXR+FvQiCJTQnn/fC8JFkRjbu+V2W5uuveB2kXb5vJgTES/VF/LiAS/QDJ4gY8DY
	uvBphZTfsCjymDveyBY15MybYeK535xfsNiVgM861MNCqvX2h54KfPxXNkcvFYiMWDg0xUfw84L
	eREGOi4AEVDj+GQ5/OpvhIdhhEo6ZKEFL8foLCa3lzMpf3h/g3zwWh8eh0bvVi0=
X-Google-Smtp-Source: AGHT+IFPeiOcFGyA9KgALMCP8R9zH2itjkDt9MTElBJ+IdcbxwJLf0w1wOrioUPVxCe8w88V34Lxxg==
X-Received: by 2002:a05:600c:3b1e:b0:439:9698:d703 with SMTP id 5b1f17b1804b1-439ae212960mr145877145e9.23.1740494217035;
        Tue, 25 Feb 2025 06:36:57 -0800 (PST)
Received: from Junction.dargent.eu (242.76.29.93.rev.sfr.net. [93.29.76.242])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd8829cesm2474493f8f.49.2025.02.25.06.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 06:36:56 -0800 (PST)
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
Subject: [PATCH v3] watchdog: sunxi_wdt: Allow watchdog to remain enabled after probe
Date: Tue, 25 Feb 2025 15:36:38 +0100
Message-Id: <20250225143638.1989755-2-regis.dargent@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250225143638.1989755-1-regis.dargent@gmail.com>
References: <20250225143638.1989755-1-regis.dargent@gmail.com>
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

--

Changelog v1..v2:
- add sunxi_wdt_read_timeout function
- add signed-off-by tag

Changelog v2..v3:
- WDIOF_SETTIMEOUT was set twice, and other code cleanup
---
 drivers/watchdog/sunxi_wdt.c | 45 ++++++++++++++++++++++++++++++++++--
 1 file changed, 43 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/sunxi_wdt.c b/drivers/watchdog/sunxi_wdt.c
index b85354a99582..d509dbcb77ce 100644
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
+	for (i = 0; (i < WDT_MAX_TIMEOUT) && (wdt_timeout_map[i] != reg); i++)
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
@@ -192,6 +219,16 @@ static int sunxi_wdt_start(struct watchdog_device *wdt_dev)
 	return 0;
 }
 
+static bool sunxi_wdt_enabled(struct sunxi_wdt_dev *wdt)
+{
+	void __iomem *wdt_base = wdt->wdt_base;
+	const struct sunxi_wdt_reg *regs = wdt->wdt_regs;
+	u32 reg;
+
+	reg = readl(wdt_base + regs->wdt_mode);
+	return !!(reg & WDT_MODE_EN);
+}
+
 static const struct watchdog_info sunxi_wdt_info = {
 	.identity	= DRV_NAME,
 	.options	= WDIOF_SETTIMEOUT |
@@ -275,8 +312,12 @@ static int sunxi_wdt_probe(struct platform_device *pdev)
 
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

