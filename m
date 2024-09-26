Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6581B1416
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Sep 2024 23:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727392888; cv=none; b=UPvZlO3mVX2eymn5p6I/Yq9mV1HeQyfFiHL3rjxWStN/nl8Te2Qq4jV+94TUhXunnmUH4DYTYiDGLZRx/K+1tcV9RMHlKexDXxZwv1lfjOC31KQY3CXWM/6mp2eXRAelvV4QT21xvN5QW6Ighjs5OXrfYcz99lVMrFN1f9gfZrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727392888; c=relaxed/simple;
	bh=wZ6akrPJfNHUSfXIEENEHvfLrdMCasbCDwbd/LiltB0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nSQ/EUYNljMs2Q34J8RGhyWC73ac9L5N1IE2M/RXkfRXUgyj+MA84CcX5UAZyG5qmdOCcJyN2KaCyqTOBPu5dO6D1azgw8FIpM1Mbn292j5xDOrC3iTtrXfN0CkwPddCuopOuPeO32JW3+1+vY5AQSovTmEEC9of/7asYHoqjPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l4+KT6/G; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l4+KT6/G"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a90188ae58eso183398466b.1
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Sep 2024 16:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727392884; x=1727997684; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HNd4acINmmNerLNUmXoF50X4J1ylsjRdPZ4qMlEZiVs=;
        b=l4+KT6/GQzgMqzdlT06UcjqXpxnRqpJUiFIt33ayhnYTfUkCy84FObeTeQQbET3Zj6
         SKQuh46CVxtlnbUpZTQh7Ux5xXEM4X6T0WzH5q/BSTXNl3TpE3SCV/OQm/uux6KaaXB8
         FRJ9a+EhXgSlpfYQvOEhlJcRHlio6IOVk/EmURSyiLgFWfR+0vLOQfIIuxmrl0xGBuYg
         oApFOZEZdJov8TWNMK2zFG6xiMq+ysUTqrwxQNCxgvFDibrm0NhoTsEBWj+Wsactlh6k
         bS5pbB6sp/Xd4friVrfCu5VpisbWVND5/DnM1/Sms3fPEVm12bXsyI/XQYncdL6r8Qbh
         JMpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727392884; x=1727997684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HNd4acINmmNerLNUmXoF50X4J1ylsjRdPZ4qMlEZiVs=;
        b=Y7uW37vOytxR7+vccPLuy9QEs2TqLrTfzuuAhU0ZhUaSiKEFrozUxbG4OXNbRGYcOY
         BAvPBQf4alfOtOIXNbEnDtM2+BcY+EVrkLWf92xvbWG2HkV5BtBg2Eo3bRxuR9XlWSs+
         HHPsvD9DsoqDcWHWQhSi42CikAZGmCkXmnPgSDvoCAYe653Hpl21yuQ8r79aF7Wh6iNe
         3gsWCooPXyGnFhtMaxVUM2iWwX25qaflxYEcscv37OgRbyZjByXZ1fjvNnuK5AZt5bSd
         ht5GqivSFc//Rj0PMNZ75Xv800LNCQmc2a6I5Mrblb+zOOsCgiEgahO49x4+m98H64QA
         cWKg==
X-Forwarded-Encrypted: i=1; AJvYcCVef1jT7F0WgQNOYAhxnwwxXmIyHRSYFU+pzvKl/8aA6R7kDNH8MmHyjKdkRPZlHZa3Mo+EsPmKgVdOsA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzH4xmjoAI98bNJ8t7ewamUIAlRYf9M51Ai1lIErBUG5cEu5hJ5
	rw76I9vJ+oEtxNVQ7Bhu7hQqZIVt7Nt13lkAcZpgtmQmoECaPiqS
X-Google-Smtp-Source: AGHT+IEaJkjaI1Z6tqe57O4cY/kSpV7TlwQqKprn1eIz034AUHy+NubnWwLak/p5Xh3t4FDbODMYtg==
X-Received: by 2002:a17:907:96a7:b0:a8a:3f78:7b7b with SMTP id a640c23a62f3a-a93c4916e6cmr73897666b.14.1727392884471;
        Thu, 26 Sep 2024 16:21:24 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3989-b03c-7705-998b.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3989:b03c:7705:998b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27773c0sm50368166b.1.2024.09.26.16.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 16:21:24 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 27 Sep 2024 01:20:54 +0200
Subject: [PATCH 03/18] leds: flash: leds-qcom-flash: switch to
 device_for_each_child_node_scoped()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-leds_device_for_each_child_node_scoped-v1-3-95c0614b38c8@gmail.com>
References: <20240927-leds_device_for_each_child_node_scoped-v1-0-95c0614b38c8@gmail.com>
In-Reply-To: <20240927-leds_device_for_each_child_node_scoped-v1-0-95c0614b38c8@gmail.com>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Gene Chen <gene_chen@richtek.com>, 
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727392874; l=1584;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=wZ6akrPJfNHUSfXIEENEHvfLrdMCasbCDwbd/LiltB0=;
 b=51y1SjR6ulBD3qqgS2qUF2cR+3GmbQoLP5twgUKAKBCLM1UNA7NMBuE8fYTAvAWvhCwVEKFCh
 S+CcP+wu+pwAJEAW1NzXp4grrO/7Uy2C/nu/OWMtTu//R6mCOAKLHae
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Switch to device_for_each_child_node_scoped() to simplify the code by
removing the need for calls to fwnode_handle_put() in the error paths.

This also prevents possible memory leaks if new error paths are added
without the required call to fwnode_handle_put().

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/leds/flash/leds-qcom-flash.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/leds/flash/leds-qcom-flash.c b/drivers/leds/flash/leds-qcom-flash.c
index 41ce034f700e..ab848c5acd2d 100644
--- a/drivers/leds/flash/leds-qcom-flash.c
+++ b/drivers/leds/flash/leds-qcom-flash.c
@@ -812,7 +812,6 @@ static int qcom_flash_led_probe(struct platform_device *pdev)
 {
 	struct qcom_flash_data *flash_data;
 	struct qcom_flash_led *led;
-	struct fwnode_handle *child;
 	struct device *dev = &pdev->dev;
 	struct regmap *regmap;
 	struct reg_field *regs;
@@ -896,7 +895,7 @@ static int qcom_flash_led_probe(struct platform_device *pdev)
 	if (!flash_data->v4l2_flash)
 		return -ENOMEM;
 
-	device_for_each_child_node(dev, child) {
+	device_for_each_child_node_scoped(dev, child) {
 		led = devm_kzalloc(dev, sizeof(*led), GFP_KERNEL);
 		if (!led) {
 			rc = -ENOMEM;
@@ -914,7 +913,6 @@ static int qcom_flash_led_probe(struct platform_device *pdev)
 	return 0;
 
 release:
-	fwnode_handle_put(child);
 	while (flash_data->v4l2_flash[flash_data->leds_count] && flash_data->leds_count)
 		v4l2_flash_release(flash_data->v4l2_flash[flash_data->leds_count--]);
 	return rc;

-- 
2.43.0

