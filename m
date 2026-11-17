Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794912084;
	b=SbHvqGyUvEvmaYyZAnvoJOv3ChVMH5JWb5xKWjnrX6iHfMHtzmEFHJYKo3KOZG2YPH2h
	 /VqrjVWDRBjGIN6IqThVJaBNFdGN6LQ6ItO8m4T02RAFa9FJ8H/lFzWVijFQVI9IhigQv
	 hK9ESMM8ztpLQUXoktQH8eTLb0OoHyzxmtmagY+VkZDfo5fYBAbDTqb24iy3CyGwl2tV8
	 LERjERGbjb52a2RLYZ4fefOhEgq+VOum8In1DDK7tFYIzE9YrhMlIhHqmdqrI8aovja+1
	 8l163uScE1s0NnJ9yGrn+7w77nZkl8igSFpbzCOMXXjq17Dx9s7KVZfHEQgek3aZjuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794912084;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=lxBxby7GseHNWvedWcEPx/DCd8dfkDUfv43EA41t7es=;
	b=MxO0ti90Vx6UQSepMUiqEw3IXEvP+i4Ftn6sTAAGPMZbqdM8iGMqiyKA1nDDUpI+fRN9
	 9Xkzm7n4K5/srguezchKTd/+2rQpreeXfHTgRiv4bTxCTsf2f5VqFPN/OtPdwN4gaNPkC
	 RXSNjaeOpPivLp+bKnRK5adEztIMJJa1/OkQz+6j6K4X3xIwTdj/ZRa46yrS+Yp9T+RrJ
	 ID9SmHDT+C9jO+raeHF1vwfupHVFuqLY5f9jlRNTqJjfuEzuv9Mv2YaqnylXkOQYqLVXg
	 kTuNzoKT8BQ8Mr+h7Eopuw/oi1QsBUL1fMS+ADFlGjoVuzRmVkI/IOO7M73/raVqoSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=XV0DBogJ;
	arc=none smtp.remote-ip=220.197.31.4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401BE606A31C
	for <linux-sunxi@lists.linux.dev>; Tue, 17 Nov 2026 10:41:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 401BE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=XV0DBogJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=lx
	Bxby7GseHNWvedWcEPx/DCd8dfkDUfv43EA41t7es=; b=XV0DBogJJkLCFAc4R4
	baUwq55sXiYrdA9/rIY0qdrPqVFzyA8zoB4gSnTYD6lQj4Mbs91rIqr1K0FWhdPi
	m0ENP8OMve3DAiKn+G6aMGtc7dWw+P6uXXpkJnuMRojKzcNxSxqx7d4Cl5CP9WqY
	AybVtfQJJoqv6/3X/YmGXVpu0=
Received: from SYPC (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wDnD0FBL_xq7NVVIQ--.56040S2;
	Tue, 17 Nov 2026 18:41:06 +0800 (CST)
From: Yang Siyuan <hsyysy@163.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] watchdog: sunxi_wdt: stop the watchdog across system suspend
Date: Tue, 17 Nov 2026 18:40:54 +0800
Message-ID: <20261117104054.17381-1-hsyysy@163.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261117092036.12192-1-hsyysy@163.com>
References: <20261117092036.12192-1-hsyysy@163.com>
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
X-CM-TRANSID:_____wDnD0FBL_xq7NVVIQ--.56040S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCr1rury5ZF1ktF1UXryxXwb_yoW5Zw4fpF
	4Yya4F9rW0qr4avr4ayw1DAF1rC34vg34UAryxG34fA3Z8Gr1rG3W0qryjywsxGrWrGF1r
	CF1Ut3yxCayq9a7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jImhrUUUUU=
X-CM-SenderInfo: 5kv152r16rljoofrz/xtbC7QK16Wr8L0LQSwAA3T

The H616 watchdog has a maximum timeout of 16 seconds.  systemd keeps
/dev/watchdog0 open with RuntimeWatchdogSec=16s, but during system
suspend all userspace is frozen and the watchdog core does not stop the
hardware.  A suspend longer than the timeout therefore resets the board
before it can resume.

Add system sleep PM ops to stop the watchdog before suspend and restart
it after resume if it was running.  The driver did not store its private
data in the platform device, so add platform_set_drvdata() for the PM
callbacks.

Use DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr() so the callbacks are
still referenced when CONFIG_PM_SLEEP is disabled, and use
watchdog_hw_running() instead of a private flag to decide whether the
hardware needs to be stopped and restarted.

Tested on an Anbernic RG35XX-SP: a 30-second s2idle suspend resumes
without the 16-second watchdog reset, and /dev/watchdog0 keeps working
afterwards.

Signed-off-by: Yang Siyuan <hsyysy@163.com>
---
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

