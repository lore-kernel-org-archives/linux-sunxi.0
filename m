Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794957529;
	b=JiTOSWV1xzXalh32Fdx6fLtGSY/0M1DQOGm0tRU16yjgibMqqit2n+7AvefudDEqvpBm
	 MUmrmh0nQ9OM6z4dXGLbM4O/PFTILaFleWT0BmkRichnqV6c38oPztJV32Crj6YfrxO0c
	 6lLbYfsBqOXRAvJy1rIkvEpKe4vmMW1iJpALoewDfuPFB+fJOh2KB2P3J8/QMp4Fx9uKg
	 g624H1YfLxJ8z/GzfNOpVSPidzTozY7KQIm5p+p9tiw/dohb0h+Vx7KdJZcmKWk/UbjCv
	 2yPPeD4PTuiIY8hcudsCp74VNba92EsufQoUYjYZZbhllyyzUvqTjEsnx5CfZjmrokA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794957529;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=taHVdrxL2EsPRjmw6qawffXd/pZALm22RNDv0mO72y4=;
	b=MKno49t05ORB4JPlvYt8MqyVIdMLdtn1rQr2+yqEF0C55V7OPWr2xwtKk0YTKxScVD+/
	 55iytGFWwXEHuoxVbFPB/xwGhH4RJ3+/RyqFH/ClSmzlSfbxLC8rR36Ht95VCtgxxSXED
	 Ntv9QzwE3TokBzOCpudUUY8msDGbE1nACe52misVc/fCWiXajleVeZ6OQ9IX8FyYWarCu
	 0QViFk/N2MvC64FLyStlFIY9XDHQJEygB/vY8xeGGE86sjUEgl3YiTtAPA319xTeVgcnR
	 m/ZTbnaJffHq4konMCQRn/LfUZw14ha/AU7ZR1ElDmyGZqFfa4EeGE0HwnLRyMDUCtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="H4/lTNlP";
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0475C606A32A
	for <linux-sunxi@lists.linux.dev>; Tue, 17 Nov 2026 23:18:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0475C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=H4/lTNlP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=ta
	HVdrxL2EsPRjmw6qawffXd/pZALm22RNDv0mO72y4=; b=H4/lTNlPJkqWGJAb8H
	JUjTZyrheqOowE8EJNYMsGNJIw67TO7fe8WTJWsjSJEJ7DMkLf7Ys/jS0mih1uBK
	ht4JKHIpZH/UpVQeYawMgEud/Gw115AqeGxJH4aC4IcaZPsnzwhtuQzt8c27R8hP
	RUWPwtZH2LCKHcjkHBldYa7l4=
Received: from SYPC (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgCHdTzL4PxqjZGTGg--.50564S2;
	Wed, 18 Nov 2026 07:18:35 +0800 (CST)
From: Yang Siyuan <hsyysy@163.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] watchdog: sunxi_wdt: stop the watchdog across system suspend
Date: Wed, 18 Nov 2026 07:18:19 +0800
Message-ID: <20261117231819.264381-1-hsyysy@163.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <202611172344.RbQl66xu-lkp@intel.com>
References: <202611172344.RbQl66xu-lkp@intel.com>
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
X-CM-TRANSID:PigvCgCHdTzL4PxqjZGTGg--.50564S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCr1rury5ZF1ktF1UWw13CFg_yoWrJrW3pF
	45Aa4Y9rW0qr4avr4aywnrAFn5CwnYg34UAryxG34rX3Z8Gr1rGF1Iqryjy39xGrWrGF1r
	CF1Ut3yfGayq9a7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jso7tUUUUU=
X-CM-SenderInfo: 5kv152r16rljoofrz/xtbC7gxFeWr84MwGWwAA35

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
Changes in v3:
- Mark the PM callbacks __maybe_unused.  With CONFIG_PM_SLEEP=n the
  pm_sleep_ptr() references expand to NULL, so both callbacks were unused
  and a W=1 build warned about them.  Reported by the kernel test robot:
  https://lore.kernel.org/oe-kbuild-all/202611172344.RbQl66xu-lkp@intel.com/
- Reword the v2 changelog entry: pm_sleep_ptr() alone does not keep the
  callbacks referenced when CONFIG_PM_SLEEP is disabled.

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
+static int __maybe_unused sunxi_wdt_suspend(struct device *dev)
+{
+	struct sunxi_wdt_dev *sunxi_wdt = dev_get_drvdata(dev);
+
+	if (watchdog_hw_running(&sunxi_wdt->wdt_dev))
+		sunxi_wdt_stop(&sunxi_wdt->wdt_dev);
+
+	return 0;
+}
+
+static int __maybe_unused sunxi_wdt_resume(struct device *dev)
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

