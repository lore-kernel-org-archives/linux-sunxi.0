Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30088366566
	for <linux-sunxi@lists.linux.dev>; Sat, 31 Jan 2026 18:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769884148; cv=none; b=HqRY/BRgn5nwtwcJ1HHAeDAENmweKIT7egQvqK+LupN7v88vasL68cxEOdlTVt3yUG2mmol/DiqFYDB+nq5K3bMB3O4Z5UWXtgJagmFWRwig70Nlh6a81wc3Do4t1/1PjmHvxoCapDUJ/QcMChkD7eRVfEBL/8TPuBOYjVif59w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769884148; c=relaxed/simple;
	bh=2cNAKnSczqFDvan9SEiFwFwLVMyWwTUFffTK66ZOIns=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=D+nhbzGPpwcYxBnwNW2IuES/yAT35D5s6moph3GVypfdWswB9iWIIZkedH2VdpEw05TSz/D61ns8fQOEBMM7BTsMSYQZmzsWcztoEFm4Fdu1CCCTWoequZwAa6ssFNURxHhTCJbSDu83cYBmRCSLtaHfnmNn6T1ckIym/4/vcCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BurHqzzm; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BurHqzzm"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-81e9d0cd082so2539912b3a.0
        for <linux-sunxi@lists.linux.dev>; Sat, 31 Jan 2026 10:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769884146; x=1770488946; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qGPmhqBLmrhjnKRU3GP4xDYGE4lQQrm3+UpM5b+lZCM=;
        b=BurHqzzmvkufeFUPanRDWbbSfwaO9PHJdTBLEMBs7S1xX71kE4QGCw2WeJ2sPi2NhP
         cBEy+knOO1fnXWQmnQQwYjHViJFG4V5iIXh4eleDGvg+OJK0iiFPosZ6R+Cb0JO2LyV5
         Qjrsgreg2TahpNWiHPTYT/4ql3JvvPfgpV15JpCd/Nap7IfuZyn14nGJBGbT8JfwPAUj
         63ILO3ZX1dpyiLI+5S23Mf73rAxOYiElUpRw5IFJMjdtruBC5pR8sWrIan5WEit/L0R/
         5DnNMzaTNtmhHlp/bboh5K2cnKJucrZuMTHaMWg2QhZsBO1R3C0awvlbaSfEs76oTiAo
         VK6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769884146; x=1770488946;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qGPmhqBLmrhjnKRU3GP4xDYGE4lQQrm3+UpM5b+lZCM=;
        b=eC2prRWH0RL4TSGXwlMLvBzI9boS29Vd4jp6ln3GP9+XGz83CzbRfuBRqw4ngvSEyJ
         SMCsvxNeEkjP/P28aOLfZ40AHF7tK84Hy3cUe413x4HOHcdiyNtQcQIkWwsRXEXT8PLt
         jXGErM6oVnO7ayhATgAo1ormI8tJbe5SjvMrZMc0QAqG2iDCw7SzVbTFkLKcZhZ3xgei
         gSafUDabeScj3mTk6NNXqR3/KlgQrtk5q5jd4I1Zho63dTcFxBRc4UqPe4fwTb9Ek/QS
         OOwU7qDpXgaLEAlxkSjCO+We6G0Lck+NTZilMUYyY/UTqVKM6J5/XMkYgpmtMeuYhkyK
         JApQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQhsJNtQOUfF2SOVQeQsRQ7S3N/MHycVg3u2bGOwdPWTd6xDM8ES3CnJag4jB2PqrMSpNln+7+laycrw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzIOuU+wHcb/bf+X5G2QiOn357bkwMxlppb5I/1DZ0OpW/lqEOP
	Z5FocqtNIKRUlh+mJWOBEGYBSQTDZ8EKIwid5OOQ/WxP12ZmxuiVvQFhSznTfMyI
X-Gm-Gg: AZuq6aKNCdRRliMP55UuT9k5cicbzHBYYadLQC2pApIG50nwEqfgg77pO0HUV3H0yjm
	9wxkrUNuWcyRAAlclZMSZzHPyPXhmTb9qHnbgpEf7MwDdQBo27pPRrMFxWc7aH0MskRXetGDOZI
	7x9BcBf7m5wjHawfAOfFsutiAq1oMFDzkQfB5/oAy7URxZCBcL+olSVq+lzR/ugtR5nCnpbPr2o
	mVpSZzHm2fv/pb/d2kpcqYo1ir0VXYBNTkIdgk1eJfhEBpECoGv2bDm3Qu+sfQid2gO1zgoFW+I
	M8jPw9EZlLmYcqiSJzVmPlX6p8O6HGTp/+vhxWLLW8d7Y8IekruLWP52llSlLr0onO9kpXZ97nE
	xwqGcQcsAhta7h9f7vGD6T55bzLC9mNvCp9bno+ytzqB86VF08DZFCOq3w0idb/BSAQzzdN1mpQ
	pfhzyWqWk=
X-Received: by 2002:a05:6a00:139d:b0:81f:3b74:5812 with SMTP id d2e1a72fcca58-823ab6770fcmr6413801b3a.31.1769884146110;
        Sat, 31 Jan 2026 10:29:06 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9008:ba52::3a87])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379c24083sm11433930b3a.55.2026.01.31.10.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 10:29:05 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sun, 01 Feb 2026 02:29:00 +0800
Subject: [PATCH] i2c: sun6i-p2wi: Fix device node reference leak in
 p2wi_probe()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260201-p2wi-v1-1-e0ec9cda82b3@gmail.com>
X-B4-Tracking: v=1; b=H4sIAOtJfmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIwND3QKj8kzdRENLy+SUtFQzy1QDJaDSgqLUtMwKsDHRsbW1AJIZ6Cx
 WAAAA
X-Change-ID: 20260201-p2wi-a199cdfe69e0
To: Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Wolfram Sang <wsa@kernel.org>, Boris Brezillon <bbrezillon@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769884141; l=1471;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=2cNAKnSczqFDvan9SEiFwFwLVMyWwTUFffTK66ZOIns=;
 b=yXCZwSuCzXzxPIwefJT/i/DC8MOkG6SO8j6MIGT4Msk92UzkC5uL4vvVgUv/M5Lw9apjSMJvh
 Q4ldLZdPsbsCiD3ZYP0udu9iKzAZUEIv/SV70Nhl5JD+qqF3qZdZuTA
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

Use the __free(device_node) scoped variable to automatically release
the device node reference, preventing a device node reference leak.

Fixes: 3e833490fae5 ("i2c: sunxi: add P2WI (Push/Pull 2 Wire Interface) controller support")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/i2c/busses/i2c-sun6i-p2wi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sun6i-p2wi.c b/drivers/i2c/busses/i2c-sun6i-p2wi.c
index fb5280b8cf7f..652b37b57159 100644
--- a/drivers/i2c/busses/i2c-sun6i-p2wi.c
+++ b/drivers/i2c/busses/i2c-sun6i-p2wi.c
@@ -184,7 +184,6 @@ static int p2wi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
-	struct device_node *childnp;
 	unsigned long parent_clk_freq;
 	u32 clk_freq = I2C_MAX_STANDARD_MODE_FREQ;
 	struct p2wi *p2wi;
@@ -223,7 +222,8 @@ static int p2wi_probe(struct platform_device *pdev)
 	 * In this case the target_addr is set to -1 and won't be checked when
 	 * launching a P2WI transfer.
 	 */
-	childnp = of_get_next_available_child(np, NULL);
+	struct device_node *childnp __free(device_node) =
+		of_get_next_available_child(np, NULL);
 	if (childnp) {
 		ret = of_property_read_u32(childnp, "reg", &target_addr);
 		if (ret) {

---
base-commit: 33a647c659ffa5bdb94abc345c8c86768ff96215
change-id: 20260201-p2wi-a199cdfe69e0

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>

