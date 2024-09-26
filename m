Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD1A1B012F
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Sep 2024 23:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727392889; cv=none; b=eaMkx24cPF/Ux23S+G2/IThZYXAHayRoEQlQHA9wO9sskYk+R/SagQAyrQGVsVEqZIOCYArqt1PndMawAi566TiI9XBVw6YWM63Qxo6r6MT4oeu6kVPkxSyVncKki8JzW5qYuUfZIKOAnlekulVKLASi6l44UVgcJKw7j0/HvQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727392889; c=relaxed/simple;
	bh=d0/jBZeOQ8xCvysG4yJkfCKJi0DJ8XXoa660caQmywM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CgGk8gBxf00OW7Y0Kqt9QdEHMn/ug8fNs9e4awideoa82z94ZntrIDzgTbMavBkAaadLTZ0Z9FUGw4NeBtpTEGHd77ePj63eLVuuH4RwGThOXKVUitZ+l9R+9T+2dNG2T9j2VguUabbUJQujIX7AMUWh/JGbQqNmmtm0TeVKG7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y/Nb4m3w; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y/Nb4m3w"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5c3d20eed0bso1722323a12.0
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Sep 2024 16:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727392886; x=1727997686; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=97MJYpYNh2OXN36yrgEntTFOxNkCwTKF272jX4EBFYg=;
        b=Y/Nb4m3w6UdEk3FaSiZ6PStljDbRIc0NK8fp9agacsvYmrT+gaLKxJDAN9kzKC5nr/
         BXyNoNHCE7DwXD3CG39yltxX0p0Vv0v/6NTIV1YP/cbhFZGzTFPLJWD+X4tBg79HyDKq
         rwNou4sHvy36ds8QW5+aHds0+7Ax4KhbUATr0bVKzj7cmra0tANKYZSRc3nKSv29fusA
         onkbZvogrMlAyDH51BgAQMW0PsAxGO391ZhWYad7weWqoZzviTNZ6pbFidohYiB/l1jA
         FFqYE5sh/otJDMtVrnUVX9HhM6nyFusd3oxX6NDThkVPZoxP6cvRWFwHoHC3BrMIqvai
         vcrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727392886; x=1727997686;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=97MJYpYNh2OXN36yrgEntTFOxNkCwTKF272jX4EBFYg=;
        b=DsxG4rasaOVMjV8SacXiC3HfT4SmSjuhVeuI9rZhZs41D/Nom9f4vwoTQdTFYrA/jf
         Idt/cc7icsOzlyLDpGFD691GmlM4TDv4lxFelBapMPehv/1zJQC9MWcRHWlePtymHvcD
         eIS5UKjrdgB/17yOYSnknAa/EcvSJVdGWp3K66c+7m4GzynHwhUlkZW1zsaB3IqeJU6h
         riBCF3HfayrgQW/EhXcJjsg4a8fn7ySTeSUirPEiWxsbkeSx0rUiqNkdZ3ufXD48Oik7
         8PEHT+BAR8afMYLUyi3eM4vnKCK/vETT3h0qxPccAaysXPdAuJfies3Bjz4Svu+EahX9
         Ttqg==
X-Forwarded-Encrypted: i=1; AJvYcCW5e5jKQZVzkqyjlOUVSgHOe/FxUguw7VkTwt5zta1n1eD7DzQk+0SCm867eHxoKGepld1NX9B7p8Ophg==@lists.linux.dev
X-Gm-Message-State: AOJu0YySdCl799Q4pjbhYni+109YN57jIDgTst8i171PPgWymBLeZNJE
	eCkep7nfbp+q7C/uuP2Zs2xswxce/xJY+NazjHMpxog4MftPURRk
X-Google-Smtp-Source: AGHT+IGEbTyX4azDhptvTAbyqHSfEzTyPNNE/JgVuXwIVkiF6dJaxNfrq6Yp0EW4PANwfpfda2QaAA==
X-Received: by 2002:a17:907:d14:b0:a8a:83e9:43e2 with SMTP id a640c23a62f3a-a93c48f926amr75943566b.12.1727392886119;
        Thu, 26 Sep 2024 16:21:26 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3989-b03c-7705-998b.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3989:b03c:7705:998b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27773c0sm50368166b.1.2024.09.26.16.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 16:21:25 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 27 Sep 2024 01:20:55 +0200
Subject: [PATCH 04/18] leds: aw200xx: switch to
 device_for_each_child_node_scoped()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-leds_device_for_each_child_node_scoped-v1-4-95c0614b38c8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727392874; l=1474;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=d0/jBZeOQ8xCvysG4yJkfCKJi0DJ8XXoa660caQmywM=;
 b=tR0vcqDoOSP5Z2owKMnAB9bhX8x7lqHl3M+byu6E1aArGwC6Yf4PxLgUabwsOkMjFx/oaq0zI
 VzAnF+19OBbC8V0VBuGNYGHfa/Q/kR9spuC+zWidBB4bco6IBrAZbCS
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Switch to device_for_each_child_node_scoped() to simplify the code by
removing the need for calls to fwnode_handle_put() in the error paths.

This also prevents possible memory leaks if new error paths are added
without the required call to fwnode_handle_put().

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/leds/leds-aw200xx.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-aw200xx.c b/drivers/leds/leds-aw200xx.c
index f9d9844e0273..08cca128458c 100644
--- a/drivers/leds/leds-aw200xx.c
+++ b/drivers/leds/leds-aw200xx.c
@@ -409,7 +409,6 @@ static int aw200xx_probe_get_display_rows(struct device *dev,
 
 static int aw200xx_probe_fw(struct device *dev, struct aw200xx *chip)
 {
-	struct fwnode_handle *child;
 	u32 current_min, current_max, min_uA;
 	int ret;
 	int i;
@@ -424,7 +423,7 @@ static int aw200xx_probe_fw(struct device *dev, struct aw200xx *chip)
 	min_uA = UINT_MAX;
 	i = 0;
 
-	device_for_each_child_node(dev, child) {
+	device_for_each_child_node_scoped(dev, child) {
 		struct led_init_data init_data = {};
 		struct aw200xx_led *led;
 		u32 source, imax;
@@ -468,10 +467,8 @@ static int aw200xx_probe_fw(struct device *dev, struct aw200xx *chip)
 
 		ret = devm_led_classdev_register_ext(dev, &led->cdev,
 						     &init_data);
-		if (ret) {
-			fwnode_handle_put(child);
+		if (ret)
 			break;
-		}
 
 		i++;
 	}

-- 
2.43.0

