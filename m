Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E131115B96C
	for <linux-sunxi@lists.linux.dev>; Fri, 31 May 2024 14:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717164743; cv=none; b=YkUUUBzLUa4hN+z/3Ez9jKlScsBL/99ffu+/AI1hU/TRY3LA8AFAS1WIdT+D/WvFLgDvwijcwRa+wDkEU64dmH3Lv7JtpDKIdq2U2oy+T2A4MIXBPVlL87+H1jfRKhhG/o6vZxrJJvFXLbOmf2qlIXu/P54k1zhCRGBRqLLJeRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717164743; c=relaxed/simple;
	bh=IHqJ+gtCt73wUC3F7SosO9077s2HWzZcUsKHQ3ldAsg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MgW4dF4aLupvJaaxpZEKssnVd0GuzYhlGT883wt2G6AIVwD8vsosDYqnQa4oIEoFzICdkIHJAPCU8BO6c7oNKmuHW1EICY7cDo7ESV5OXHVe2S55BIawesxYGRAl1Enw/ljZBmfcAcyzVbmLPEl9BQxXlfv3Lp8N0Quq2Ti3v7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D2fZnZFW; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D2fZnZFW"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6f8ec7e054dso1580287b3a.2
        for <linux-sunxi@lists.linux.dev>; Fri, 31 May 2024 07:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717164741; x=1717769541; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6wTHZBEFwXJhWoEDkPDRuoh0St8wlNAfA/2opNNZCGE=;
        b=D2fZnZFW1AFI+5Mnm+XN+0Md2q48mgnfwwMgUbnBedE/CYJQPQJJ8/98EDxe3t/++a
         /Fj2KJPs6oDgLTuh/2Rul9wpyaZoQUSAfcnps+XiuAbFUpf9aiJP+01aPx+mFsckJ4P5
         PIAqPrKQQHz59sUadF6mue0w8Ww9DHMXosRhEqEUnmwsNksXkD+Ks84K0rdDElOmTYJE
         FX+HAlKaNYwUmveigWbSt97uGA0qmbP/gXk/ES7iQl1Ui7WeHmVE2LcnRVDqUbyaIMUK
         8diyFhxoTBWmu4qMnu1rBPS+/dr0vGubMlGxJEVYwFe/NqKV4MzTswZJl01EP7nZ1LDc
         +tlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717164741; x=1717769541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6wTHZBEFwXJhWoEDkPDRuoh0St8wlNAfA/2opNNZCGE=;
        b=t6jBom2bF1t6z8htkkUB55euvQbvn/gZdKLK5R5Cjd1MKPp05QaOGyBO169cl/drCF
         O+9BFqQ9HAM95B92/kkhpPT8njGodSoF4kxCqkuABdogXRFPukib9RRwuTxRfCNFmstC
         4dvy89XOtynge2RCLq4LfFj9sMFAFRC2jdzoXb8GYQderWLsp7tSlAsb8Z1hg+/lmKca
         bOhUVUZLydOJ80KKctbeUnZo47Q6FwVRvuiooDjGMZuLVhKEGmxqCNqdV3sMBwox6XKJ
         Wsupq0+c6qwsnP/5TEPPfM3dJoHewyOvDc28ENukxf4rXu87yf+A2LLytuIfhQHKO8/9
         JytQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZDk9ZTIZOBPe3Xr50jWZZRPcsKBQCaK7AV4RXdJZZ2a5Cyd5oLl/5C9jD2kmnnpHL+/Gu72Qgkusu45uPRHhuMroQb7RY4shjD4A=
X-Gm-Message-State: AOJu0YyUzP0iTuZ+l9QuekBqSTJc9lbH1a2NTZeFuEQKOexobtNZKa0b
	ERrCvzXrUItD8TcxGG00NQJjCi3RFbXal6aU/rkv7x2xlXw62lZr
X-Google-Smtp-Source: AGHT+IGoJr0t15MSyl5iBphGcVZieynY1XhJgQ2y4dhBK/dl/1tYzaCMu+V5iPs17tOhEXXS6/u+gw==
X-Received: by 2002:a05:6a20:6a25:b0:1ad:7e4d:2ea2 with SMTP id adf61e73a8af0-1b26f0ec300mr2694125637.4.1717164741148;
        Fri, 31 May 2024 07:12:21 -0700 (PDT)
Received: from noel.flets-west.jp ([2405:6586:4480:a10:167:9818:d778:5c14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70242b057besm1418103b3a.162.2024.05.31.07.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 07:12:20 -0700 (PDT)
From: Hironori KIKUCHI <kikuchan98@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Hironori KIKUCHI <kikuchan98@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Aleksandr Shubin <privatesub2@gmail.com>,
	Cheo Fusi <fusibrandon13@gmail.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 1/5] pwm: sun20i: Use devm_pwmchip_alloc() helper
Date: Fri, 31 May 2024 23:11:33 +0900
Message-ID: <20240531141152.327592-2-kikuchan98@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240531141152.327592-1-kikuchan98@gmail.com>
References: <20240531141152.327592-1-kikuchan98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes a compile error by using the devm_pwmchip_alloc() helper
function along the way.

Signed-off-by: Hironori KIKUCHI <kikuchan98@gmail.com>
---
 drivers/pwm/pwm-sun20i.c | 45 ++++++++++++++++++++++------------------
 1 file changed, 25 insertions(+), 20 deletions(-)

diff --git a/drivers/pwm/pwm-sun20i.c b/drivers/pwm/pwm-sun20i.c
index 3e3b5b138b3..93782023af6 100644
--- a/drivers/pwm/pwm-sun20i.c
+++ b/drivers/pwm/pwm-sun20i.c
@@ -102,7 +102,7 @@ struct sun20i_pwm_chip {
 
 static inline struct sun20i_pwm_chip *to_sun20i_pwm_chip(struct pwm_chip *chip)
 {
-	return container_of(chip, struct sun20i_pwm_chip, chip);
+	return pwmchip_get_drvdata(chip);
 }
 
 static inline u32 sun20i_pwm_readl(struct sun20i_pwm_chip *chip,
@@ -308,12 +308,31 @@ static void sun20i_pwm_reset_ctrl_release(void *data)
 
 static int sun20i_pwm_probe(struct platform_device *pdev)
 {
+	struct pwm_chip *chip;
 	struct sun20i_pwm_chip *sun20i_chip;
+	const struct sun20i_pwm_data *data;
+	u32 npwm;
 	int ret;
 
-	sun20i_chip = devm_kzalloc(&pdev->dev, sizeof(*sun20i_chip), GFP_KERNEL);
-	if (!sun20i_chip)
-		return -ENOMEM;
+	data = of_device_get_match_data(&pdev->dev);
+	if (!data)
+		return -ENODEV;
+
+	ret = of_property_read_u32(pdev->dev.of_node, "allwinner,pwm-channels", &npwm);
+	if (ret)
+		npwm = 8;
+
+	if (npwm > 16) {
+		dev_info(&pdev->dev, "Limiting number of PWM lines from %u to 16", npwm);
+		npwm = 16;
+	}
+
+	chip = devm_pwmchip_alloc(&pdev->dev, npwm, sizeof(*sun20i_chip));
+	if (IS_ERR(chip))
+		return PTR_ERR(chip);
+	sun20i_chip = to_sun20i_pwm_chip(chip);
+
+	sun20i_chip->data = data;
 
 	sun20i_chip->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(sun20i_chip->base))
@@ -339,17 +358,6 @@ static int sun20i_pwm_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(sun20i_chip->rst),
 				     "failed to get bus reset\n");
 
-	ret = of_property_read_u32(pdev->dev.of_node, "allwinner,pwm-channels",
-				   &sun20i_chip->chip.npwm);
-	if (ret)
-		sun20i_chip->chip.npwm = 8;
-
-	if (sun20i_chip->chip.npwm > 16) {
-		dev_info(&pdev->dev, "Limiting number of PWM lines from %u to 16",
-			 sun20i_chip->chip.npwm);
-		sun20i_chip->chip.npwm = 16;
-	}
-
 	/* Deassert reset */
 	ret = reset_control_deassert(sun20i_chip->rst);
 	if (ret)
@@ -359,17 +367,14 @@ static int sun20i_pwm_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	sun20i_chip->chip.dev = &pdev->dev;
-	sun20i_chip->chip.ops = &sun20i_pwm_ops;
+	chip->ops = &sun20i_pwm_ops;
 
 	mutex_init(&sun20i_chip->mutex);
 
-	ret = devm_pwmchip_add(&pdev->dev, &sun20i_chip->chip);
+	ret = devm_pwmchip_add(&pdev->dev, chip);
 	if (ret < 0)
 		return dev_err_probe(&pdev->dev, ret, "failed to add PWM chip\n");
 
-	platform_set_drvdata(pdev, sun20i_chip);
-
 	return 0;
 }
 
-- 
2.45.1

