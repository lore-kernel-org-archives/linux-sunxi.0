Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794907261;
	b=ye2Zip7Bfi/saxR2HrKAJCmJxLQHMrbvbjw90jQ4rQCprhukV22XAJP9wlUYQCdpoEaY
	 gQQ/2//r9Ie0Zv92cOHx2Eae3S6YEGLvepaiXuNnnrQ2hU0ibJii8eXkwbnaORx+g+Alh
	 i1VvL/q6SBZUY0QLqQR4DQRxEGqs5cnD0E8UZJwP2lxfYuG3VDjaFWkiVB4ug+fV0Nt0b
	 koSif52/4nNmd7AaaMJic9BK2Dt3CA6ETDYJrNgMmFaO3vQ5wuEHN9kevLXWBG/02tgYu
	 HDXOfbPrlWmUdVkAyp+izv/R2Jxezv7Q1jM1bHQsVu2kYyxOlkTlSjq+CTHQJCrywyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794907261;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=JnmMVbIw83ezki5KT6mW7oV1wFkBAGupagQ9VIbFe4Y=;
	b=SvDKSCnwfbTKxMpxop5CZpc+xN1v9Ovyskqxj2Wd7zkMSicIMXQoJjvP6haN+KRS8Oz0
	 +AMoLdM4bjgO11ioaqAx2qINIZVdEjL93Qd6tS2zbp7jOKuoS2Qy4v8iuWwhVB+CCZ/gd
	 19KFuJJHHaUx08rIzOb3KMC2RKgeI7tRH7K66Fj0x5ySOK3C/H68TlXhT5SkpNy+cXRu9
	 D+QUCmyCEp9KpYlXOKe+lUK02O/TGE1S5QZe+3goOffjwC/JYm4Bh+Q+/NJEa/TicwT5S
	 WUmowHKg/4auCzhWHmKcKMAgrgh7W5ZgnlohGbIowbfCkEdw4px2G8ZhGsvtdNT66Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=QR5YYnp4;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55041606A337
	for <linux-sunxi@lists.linux.dev>; Tue, 17 Nov 2026 09:20:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55041606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=QR5YYnp4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Jn
	mMVbIw83ezki5KT6mW7oV1wFkBAGupagQ9VIbFe4Y=; b=QR5YYnp4TeJxrlToAy
	ZbcwPUfpR2BPI1UsWO121vDgVUCcMvXmPHpxwRlru4KIAdEAVmgx2I0K+RcMF88T
	gU6SS5Hl+yAVuN7bZIUM2HuQCZCJRP8LLPjwTC69LpqLGKSlt4EAekQl6Ev2b24s
	ryGBc4joDFXey0/dQGyCUW2hI=
Received: from SYPC (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3_3ZvHPxqa8ngIA--.50000S2;
	Tue, 17 Nov 2026 17:20:48 +0800 (CST)
From: Yang Siyuan <hsyysy@163.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] watchdog: sunxi_wdt: stop the watchdog across system suspend
Date: Tue, 17 Nov 2026 17:20:36 +0800
Message-ID: <20261117092036.12192-1-hsyysy@163.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3_3ZvHPxqa8ngIA--.50000S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCr1ruryrGFyUZF4Dtr43Jrb_yoW5AFWUpF
	4Yya4FkrWjqr4avr43Aw1DAF1rG34vgrW7AryxG34fA3Z8Gr1rGF18tryjy3ZxGFyrGF1r
	GF1jq3yxGayj9a7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jI_M3UUUUU=
X-CM-SenderInfo: 5kv152r16rljoofrz/xtbC7RD8MWr8HHBv5QAA3A

The H616 watchdog has a maximum timeout of 16 seconds.  systemd keeps
/dev/watchdog0 open with RuntimeWatchdogSec=16s, but during system
suspend all userspace is frozen and the watchdog core only cancels its
ping worker; it does not stop the hardware.  A suspend longer than the
timeout therefore resets the board before it can resume.

Add system sleep PM ops to stop the watchdog before suspend and restart
it after resume if it was running.  The driver did not store its private
data in the platform device, so add platform_set_drvdata() for the PM
callbacks.

Tested on an Anbernic RG35XX-SP: a 30-second s2idle suspend resumes
without the 16-second watchdog reset, and /dev/watchdog0 keeps working
afterwards.

Signed-off-by: Yang Siyuan <hsyysy@163.com>
---
 drivers/watchdog/sunxi_wdt.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/watchdog/sunxi_wdt.c b/drivers/watchdog/sunxi_wdt.c
index a6500eb..23b50cb 100644
--- a/drivers/watchdog/sunxi_wdt.c
+++ b/drivers/watchdog/sunxi_wdt.c
@@ -55,6 +55,7 @@ struct sunxi_wdt_dev {
 	struct watchdog_device wdt_dev;
 	void __iomem *wdt_base;
 	const struct sunxi_wdt_reg *wdt_regs;
+	bool running_at_suspend;
 };
 
 /*
@@ -225,6 +226,36 @@ static int sunxi_wdt_start(struct watchdog_device *wdt_dev)
 	return 0;
 }
 
+/*
+ * The hardware watchdog has a maximum timeout of 16 seconds.  A system
+ * suspend easily lasts longer than that, and the watchdog core only cancels
+ * its ping worker during suspend; it does not stop the timer.  Stop the
+ * watchdog explicitly while suspended and re-arm it on resume.
+ */
+static int sunxi_wdt_suspend(struct device *dev)
+{
+	struct sunxi_wdt_dev *sunxi_wdt = dev_get_drvdata(dev);
+
+	sunxi_wdt->running_at_suspend = sunxi_wdt_is_running(&sunxi_wdt->wdt_dev);
+	sunxi_wdt_stop(&sunxi_wdt->wdt_dev);
+
+	return 0;
+}
+
+static int sunxi_wdt_resume(struct device *dev)
+{
+	struct sunxi_wdt_dev *sunxi_wdt = dev_get_drvdata(dev);
+
+	if (sunxi_wdt->running_at_suspend)
+		sunxi_wdt_start(&sunxi_wdt->wdt_dev);
+
+	return 0;
+}
+
+static const struct dev_pm_ops sunxi_wdt_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(sunxi_wdt_suspend, sunxi_wdt_resume)
+};
+
 static const struct watchdog_info sunxi_wdt_info = {
 	.identity	= DRV_NAME,
 	.options	= WDIOF_SETTIMEOUT |
@@ -307,6 +338,8 @@ static int sunxi_wdt_probe(struct platform_device *pdev)
 	if (IS_ERR(sunxi_wdt->wdt_base))
 		return PTR_ERR(sunxi_wdt->wdt_base);
 
+	platform_set_drvdata(pdev, sunxi_wdt);
+
 	sunxi_wdt->wdt_dev.info = &sunxi_wdt_info;
 	sunxi_wdt->wdt_dev.ops = &sunxi_wdt_ops;
 	sunxi_wdt->wdt_dev.timeout = WDT_MAX_TIMEOUT;
@@ -348,6 +381,7 @@ static struct platform_driver sunxi_wdt_driver = {
 	.driver		= {
 		.name		= DRV_NAME,
 		.of_match_table	= sunxi_wdt_dt_ids,
+		.pm		= &sunxi_wdt_pm_ops,
 	},
 };
 

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.56.1

