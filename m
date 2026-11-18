Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794963081;
	b=jmWnXO+IkyWGjg08IWyCVpUnW3iC5L1ckRISDUTnpBAjPZcYdUDDA4hAjusITl/DKcNu
	 hZTOzABMU3Xny8lsr7AivRFOV7UTm7T6FK6TWBDcW7jhkCcVQVEvRugg5nTJl0QNO9lV/
	 ZBB0UZzKeMi8lzH4mxVZtMqpJwDuEejMWM1wZT6gnVZkzTy7Hi+IshP64F6FCy+4huAIx
	 Mo+Gif8fI+vPReaKK1/9pwntm3M6bN4jARkLMWByo7jvZz+piBBfIgYPL+dbDSCKCS9iY
	 fs/15pIGEP2gcRJp9cESxDH0Pq+tjHS9ji0lGPbpi8mCTR8jcYGucmaT5Z85MEr6ZTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794963081;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=E+RsS1tq+kLfqFUPfdWPYkZYK/Z9niwBH23LyHoXUfs=;
	b=EoFJflN/daf0vIgWX34rgS3B+klzMsurjv28pK+HnFIAGP5fBgVyRW28RdROYqwA5tk9
	 O/w0ihQd22uya+rejdXsQ0QEQt0s/88xocdxkV1elubsAWUXhqY9MiWD5qYgLHg786Gaa
	 fFSg1oDoSyfd/QQ5KJVSM9KxZR1Cw5OtUkwLalKi1qgAAG0ckdW2TOdxSG6jOLOx4+38A
	 8Ux73sIdI8XRJ+GSnoRxu+rU9MZJlWd9Qf1TBIveJ/UfvV1AePotlptJeItr2IHt2N+5N
	 0amFCsazW6Bwv+r8JCKclmSQvTeYeeiybZOfunKxbsvjeV01aMyfI8jbH+n1UPTjp3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="bG+Ue8f/";
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C72606A31C
	for <linux-sunxi@lists.linux.dev>; Wed, 18 Nov 2026 00:51:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7C72606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=bG+Ue8f/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=E+
	RsS1tq+kLfqFUPfdWPYkZYK/Z9niwBH23LyHoXUfs=; b=bG+Ue8f/UZ5gtZAA+S
	Cfs1vGehNw0RAcWGiRrj0YkI3g4WPMgDuC44WvS4aFS+swNndP7XBUxl0N2m8fln
	CeP8a5WqncCJDI+hrMhqhK+dr0ugt0/PVQOgWmcHzzQTMXt+ETvqFzJgmfol3sxy
	pAtwybU1J3AVMga+Yh7MMQavU=
Received: from SYPC (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgBHsYd49vxqwTllGg--.46287S2;
	Wed, 18 Nov 2026 08:51:05 +0800 (CST)
From: Yang Siyuan <hsyysy@163.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] watchdog: sunxi_wdt: stop the watchdog across system suspend
Date: Wed, 18 Nov 2026 08:50:48 +0800
Message-ID: <20261118005048.385059-1-hsyysy@163.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <ece4aa08-fb86-4f76-b4b8-a9351a71df14@roeck-us.net>
References: <ece4aa08-fb86-4f76-b4b8-a9351a71df14@roeck-us.net>
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
X-CM-TRANSID:PygvCgBHsYd49vxqwTllGg--.46287S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCr1rury5ZF1ktF1UXF1UZFb_yoWrGr43pF
	4Yya4FkrW0qr4avr4aywnrAFn5G3ZYg34UAryxG34fA3Z8Gr1rGFy0qr1UAwsxGrWrGF1r
	uF1Ut3yxGayq9a7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jVYLkUUUUU=
X-CM-SenderInfo: 5kv152r16rljoofrz/xtbC7Rm16Wr89nkdMgAA3e

The H616 watchdog has a maximum timeout of 16 seconds.  systemd keeps
/dev/watchdog0 open with RuntimeWatchdogSec=16s, but during system
suspend all userspace is frozen and the watchdog core does not stop the
hardware.  A suspend longer than the timeout therefore resets the board
before it can resume.

Add system sleep PM ops to stop the watchdog before suspend and restart
it after resume if it was running.  The driver did not store its private
data in the platform device, so add platform_set_drvdata() for the PM
callbacks.

Use DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr(), and use
watchdog_hw_running() instead of a private flag to decide whether the
hardware needs to be stopped and restarted.

Tested on an Anbernic RG35XX-SP: a 30-second s2idle suspend resumes
without the 16-second watchdog reset, and /dev/watchdog0 keeps working
afterwards.

Signed-off-by: Yang Siyuan <hsyysy@163.com>
---
Changes in v4:
- Drop __maybe_unused again.  The W=1 report was against v1, which used
  SET_SYSTEM_SLEEP_PM_OPS(); that macro expands to nothing when
  CONFIG_PM_SLEEP=n, so the callbacks were unused.  v2 already replaced it
  with DEFINE_SIMPLE_DEV_PM_OPS(), whose SYSTEM_SLEEP_PM_OPS() takes the
  callback addresses through pm_sleep_ptr() even with CONFIG_PM_SLEEP=n,
  so the functions are never unused.  The v3 change is reverted in v4.

Changes in v3:
- Mark the PM callbacks __maybe_unused, in response to a W=1 report that
  turned out to be against v1.  Reverted in v4.

Changes in v2:
- Use DEFINE_SIMPLE_DEV_PM_OPS()/pm_sleep_ptr() to avoid unused-function
  warnings with CONFIG_PM_SLEEP=n.
- Use watchdog_hw_running() instead of tracking running_at_suspend.
- Drop the inaccurate ping-worker reference from the comment.

 drivers/watchdog/sunxi_wdt.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/watchdog/sunxi_wdt.c b/drivers/watchdog/sunxi_wdt.c
index a6500eb..3fdc7bf 100644
--- a/drivers/watchdog/sunxi_wdt.c
+++ b/drivers/watchdog/sunxi_wdt.c
@@ -225,6 +225,35 @@ static int sunxi_wdt_start(struct watchdog_device *wdt_dev)
 	return 0;
 }
 
+/*
+ * The hardware watchdog has a maximum timeout of 16 seconds.  A system
+ * suspend easily lasts longer than that, and the watchdog core does not
+ * stop the hardware during system sleep.  Stop the watchdog explicitly
+ * while suspended and re-arm it on resume if it was running.
+ */
+static int sunxi_wdt_suspend(struct device *dev)
+{
+	struct sunxi_wdt_dev *sunxi_wdt = dev_get_drvdata(dev);
+
+	if (watchdog_hw_running(&sunxi_wdt->wdt_dev))
+		sunxi_wdt_stop(&sunxi_wdt->wdt_dev);
+
+	return 0;
+}
+
+static int sunxi_wdt_resume(struct device *dev)
+{
+	struct sunxi_wdt_dev *sunxi_wdt = dev_get_drvdata(dev);
+
+	if (watchdog_hw_running(&sunxi_wdt->wdt_dev))
+		sunxi_wdt_start(&sunxi_wdt->wdt_dev);
+
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(sunxi_wdt_pm_ops,
+				sunxi_wdt_suspend, sunxi_wdt_resume);
+
 static const struct watchdog_info sunxi_wdt_info = {
 	.identity	= DRV_NAME,
 	.options	= WDIOF_SETTIMEOUT |
@@ -307,6 +336,8 @@ static int sunxi_wdt_probe(struct platform_device *pdev)
 	if (IS_ERR(sunxi_wdt->wdt_base))
 		return PTR_ERR(sunxi_wdt->wdt_base);
 
+	platform_set_drvdata(pdev, sunxi_wdt);
+
 	sunxi_wdt->wdt_dev.info = &sunxi_wdt_info;
 	sunxi_wdt->wdt_dev.ops = &sunxi_wdt_ops;
 	sunxi_wdt->wdt_dev.timeout = WDT_MAX_TIMEOUT;
@@ -348,6 +379,7 @@ static struct platform_driver sunxi_wdt_driver = {
 	.driver		= {
 		.name		= DRV_NAME,
 		.of_match_table	= sunxi_wdt_dt_ids,
+		.pm		= pm_sleep_ptr(&sunxi_wdt_pm_ops),
 	},
 };
 

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.56.1

