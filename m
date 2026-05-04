Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577CE23C8C7
	for <linux-sunxi@lists.linux.dev>; Mon,  4 May 2026 05:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777871036; cv=none; b=Zr4layR80YozgiGtlKyl67LA6Lixa7amipY8/LegPmyNyCds9kqS0SLIXfsrkoB0yBbuzIFLBbXGcelMRf9Nh/WyHOmBZTbAq8Qyebd5khjDe/KhXbNahSlkNwBeqcaHVp617bSrNPogNK+a4VgC657qITSSGbCYCcFl/wCrTIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777871036; c=relaxed/simple;
	bh=ESOpoZ6325VLRLNq/W+ehNeMfVtaJC9EPjvW5kmH1DI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G0mBrsE+z+bvkwz1X92w5PliDTWTUDX23uzdU+uLEhzpa7hwZNfLMsKYIqVoGuXGuYii3+IoGrGwybIoP2NwhUz9NwV842472pdkRE/AKApsUCo74stOmQku8k/TlsY6Kbznb7Rkt6FyG5i9Bwd/Gw5Ad86qFkX20U9nODOSwmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eViOQ9eo; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eViOQ9eo"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-35691a231a7so2444249a91.3
        for <linux-sunxi@lists.linux.dev>; Sun, 03 May 2026 22:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777871034; x=1778475834; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BR+GQkq+OHGSaM1M1XSEfGoOR2adYsGXzd7KgnjDEDM=;
        b=eViOQ9eoL6s5NJye3zsCdI8Da+9crwbCrGk9ria3T0Q8k7BRvU73ST9HaAfKPhHQne
         RY0F/4n8S0Qg1WkPu8tL9qIKoQftxVYPSDHZca3HQU8Ri0WteSERMWotM4tRgOZZsviw
         L9Wok5ltyn90kB+zQ1kieRlM0c5FjSTjOLPPYNdsybY33hRU8Xvuynhkio/n+srrnptw
         JNPex39fsEj17+9co8VcKxiTnlRO2j08a9uzrAKTuJpQR9qTaP9dzfybqKfrK8Y82vHA
         0uH/Xk06OqQNMO7iL9dhZlTmvxUshR86112ktnVRwdKtIqGmoDeDh/eC2n0It17Lki3w
         jU9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777871034; x=1778475834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BR+GQkq+OHGSaM1M1XSEfGoOR2adYsGXzd7KgnjDEDM=;
        b=VZ0LPcvFufd60ZHJKKS1psdgIICryvbO9G/noNlQ+rjDwK3wy3W4PsRTAwR9pvIs3O
         /MHi5TmoyPNSmPPt6iRHiF5A3AvCYvrwgrae2SarO0ZyBBgsXqMqKCQtAUd4W5SdG6Xl
         Wg9M+XJvjP1yheyy8Uc7EHBOERxjCl38Q7/L3v0rIDmlxlcEQNJ7cNpdmXArFgLb5bFa
         5qB9LM4ACZLhBdinmIFFNYeg/km6DR6yNVmv9DsK+lo68FDkKVE7xLQ+h54YC148RxSb
         CCgfVuJdbCfRIj1ZoJpmxfxebpzpDYs4u63yfj5kuBJoTdqQZTqQDZFeHOegyhGpxNpN
         8yuQ==
X-Forwarded-Encrypted: i=1; AFNElJ8WAl9msA4WxpxFuSBxdM1Y0/gPmmVKjienGdDphLUvXH1upqNk7o7LRuIjARjNRKlc9BruB+ly3bt9BA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxruTMChpUKOEV5RTW7Z9QR56IW7uaOb/BNsomIollU+WQ1ED4m
	qYXjKJpH9nfKMgZl0qZRz5vAUQg6xpXn/LCOhDZGOBxXM9//cqnUuyvD
X-Gm-Gg: AeBDievlg+hLIwmfhTHwa7S9sH539zFpX27KYR+5VKmzRyrLjYWM1Q8YtsrktTdnKgg
	gcSVe7u+2sJ5y9bsOUg0OkA/XjKDh7LDS1fb4iqnUi9RQsV8+Bd2G30KHTiwV9KPX1x/GrsGO40
	avh248JOFn72vO3wqSvZ1IyTjIeu9AxfFU//sBOVXUFNUD1E3kEjJTj6N9CpqClm74k7QP3ghQ0
	PmzUo5WuiyE7Tm0Le6reAkgQwGXOKOiWMPQeE0QaE1JKbCkurf0MpGdVWyTa0t/8IHRRq7Mr/aG
	3lzOp7aFclZOq+dqwSSJYOySoNqgQK/ZTs/ou4a84IZzMiz/KWjmHB8p7T6oCS2Y9Wpt/9MrKb9
	BNJVQHT+cPF1pqO3HPfwByrk8xaVkV3Kv5WucuggqJRalmf0tyl0dX6puLjEEA6OFua6WeA3017
	Si7Q==
X-Received: by 2002:a17:90b:17d0:b0:35a:24f3:2c8e with SMTP id 98e67ed59e1d1-3650cd95ddemr8487132a91.9.1777871034512;
        Sun, 03 May 2026 22:03:54 -0700 (PDT)
Received: from archlinux ([2605:e440:15::152])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365437b50b0sm2662908a91.0.2026.05.03.22.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 22:03:54 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/5] thermal/drivers/sun8i: get calibration data from two nvmem cells
Date: Mon,  4 May 2026 13:02:43 +0800
Message-ID: <20260504050245.646078-4-iuncuim@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260504050245.646078-1-iuncuim@gmail.com>
References: <20260504050245.646078-1-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The A523 processor has calibration data in two nvmem cell. To be able to
add support, the ability to add data from two cells into one array must be
added.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 drivers/thermal/sun8i_thermal.c | 77 ++++++++++++++++++++++-----------
 1 file changed, 52 insertions(+), 25 deletions(-)

diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
index df0c26970..c4aaff8f7 100644
--- a/drivers/thermal/sun8i_thermal.c
+++ b/drivers/thermal/sun8i_thermal.c
@@ -301,43 +301,70 @@ static int sun50i_h6_ths_calibrate(struct ths_device *tmdev,
 
 static int sun8i_ths_calibrate(struct ths_device *tmdev)
 {
-	struct nvmem_cell *calcell;
+	struct nvmem_cell *calcell = NULL;
 	struct device *dev = tmdev->dev;
-	u16 *caldata;
-	size_t callen;
+	struct device_node *np = dev_of_node(dev);
+	struct property *prop;
+	const char *cellname;
+	u8 *caldata = NULL;
+	size_t callen = 0;
 	int ret = 0;
 
-	calcell = nvmem_cell_get(dev, "calibration");
-	if (IS_ERR(calcell)) {
-		if (PTR_ERR(calcell) == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-		/*
-		 * Even if the external calibration data stored in sid is
-		 * not accessible, the THS hardware can still work, although
-		 * the data won't be so accurate.
-		 *
-		 * The default value of calibration register is 0x800 for
-		 * every sensor, and the calibration value is usually 0x7xx
-		 * or 0x8xx, so they won't be away from the default value
-		 * for a lot.
-		 *
-		 * So here we do not return error if the calibration data is
-		 * not available, except the probe needs deferring.
-		 */
-		goto out;
+	of_property_for_each_string(np, "nvmem-cell-names", prop, cellname) {
+		size_t len;
+		u8 *caldatapart;
+
+		calcell = of_nvmem_cell_get(np, cellname);
+		if (IS_ERR(calcell)) {
+			if (PTR_ERR(calcell) == -EPROBE_DEFER)
+				return -EPROBE_DEFER;
+			/*
+			 * Even if the external calibration data stored in sid is
+			 * not accessible, the THS hardware can still work, although
+			 * the data won't be so accurate.
+			 *
+			 * The default value of calibration register is 0x800 for
+			 * every sensor, and the calibration value is usually 0x7xx
+			 * or 0x8xx, so they won't be away from the default value
+			 * for a lot.
+			 *
+			 * So here we do not return error if the calibration data is
+			 * not available, except the probe needs deferring.
+			 */
+			goto out;
+		}
+
+		caldatapart = nvmem_cell_read(calcell, &len);
+		nvmem_cell_put(calcell);
+		calcell = NULL;
+		if (IS_ERR(caldatapart)) {
+			ret = PTR_ERR(caldatapart);
+			goto out;
+		}
+
+		caldata = devm_krealloc(dev, caldata, callen + len, GFP_KERNEL);
+		if (!caldata) {
+			kfree(caldatapart);
+			ret = -ENOMEM;
+			goto out;
+		}
+
+		memcpy(caldata + callen, caldatapart, len);
+		callen += len;
+		kfree(caldatapart);
 	}
 
-	caldata = nvmem_cell_read(calcell, &callen);
 	if (IS_ERR(caldata)) {
 		ret = PTR_ERR(caldata);
 		goto out;
 	}
 
-	tmdev->chip->calibrate(tmdev, caldata, callen);
+	tmdev->chip->calibrate(tmdev, (u16 *)caldata, callen);
 
-	kfree(caldata);
+	devm_kfree(dev, caldata);
+	caldata = NULL;
 out:
-	if (!IS_ERR(calcell))
+	if (calcell && !IS_ERR(calcell))
 		nvmem_cell_put(calcell);
 	return ret;
 }
-- 
2.54.0

