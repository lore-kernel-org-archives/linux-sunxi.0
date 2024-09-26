Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79011B29C7
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Sep 2024 23:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727392903; cv=none; b=Qm5GS54zVO3CmZbz7DBkDMdt+LIVhNEW/wMzOon0bp72aYF0RMk2ZZBru7DLJwQazBTDeGxdV1y04TkknWLQm9iXbB07zCSGgvXUSl9T0hQz7WI5sCL2jscwL511y0iYWDC4Y5+r57UvsC9Z6d34gXeofRtpSYkZ/loRP4SGoZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727392903; c=relaxed/simple;
	bh=GGAv58INZAAcONt61Bpt35Ntgip4w7Gu6UUVWWUtppE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V4lPHeqkspIfKvfiZvqqdeFzb8414DhXtrXcNMpPJMI7WHEo95AEVgmsNCTFvvv4JS9GDVfIr6qsOEPXgYUxgK/jXhBPdXpKgQ+dVJW/NBiu1iTXxOngI+z+G8Gl7WRFDfDi7sB6ibDmlRobmLXveSGavb9uGCGDElQNeObuNug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OmgHOeRV; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OmgHOeRV"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-378c16a4d3eso1502520f8f.1
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Sep 2024 16:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727392900; x=1727997700; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QsOsZwrJIVejL5A3KYmk/iH+gmiGbQUrbC+6txQSDz8=;
        b=OmgHOeRVlpenjzA4aa7PCfUczVRpsiNDIQ5OUAspTC3WThoPW1+RO2CXgtrKHzKKZ/
         xpD0B/+u7XAbs+VA+EIk4wekSPvuC3PUcIFO+jB7TfD1QD1qtcrw29vdAsP8vGuFscbp
         fdGjWN1SJwq7/R89EaEVIWUELuKeITkNu1nBGBSSgrL3fSWmnL8h5AtScu7RTU7PGU77
         ZiaEyLbN9kuBSvKtraKxaEt9IJABs+fw9GTyLCJRkhJyncSfmoJQShGYf/X0ByfujlQ2
         no45XnZA3wJwYbEyH12R094kPiPQgvGR96VChuB28BdUWN9djFF86sNmYOC660OgtOBF
         qmRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727392900; x=1727997700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QsOsZwrJIVejL5A3KYmk/iH+gmiGbQUrbC+6txQSDz8=;
        b=Pkl/RtFTmAtiIKv85NWHja+/iiW3tZKI+6XFVV/RHzZEGgxMQR5gBYRAaMO4VkgL0c
         4zI8Vm45UwsDhah6UgdFq3qumRCnk1tkyX2wYk7M2QA4aAXaOs0KtvF0+KPvvVw33i4R
         LVDJv/jr2w4CqJQAoQNKNcWBhPGX2d65jPcOmVPoHGRLFH0aQ+I1xGIcSh18rHH3ydU7
         L/FRO2d+W5/lsfNjUlsm7Wf/SSDlYyIcbIjdfWvFU3v7WCjOIsZb6prxlHMcUawMzWsF
         JsZCf8NNWwDnT3xuR9iCoI6XBQNh/+fhyi5o6oZ3JaPzwwzXWWvVjA73wCYlEovXoKO2
         iJkQ==
X-Forwarded-Encrypted: i=1; AJvYcCX24Nldg6/5SflI+nTcX3MLUo6X8loUWqigbqTFn67NaZuJzs1cx3zJ6YSUkBiM0Ksgz/SraJCz0SU+dQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyXIluLd/x7broLhS3I/44m22DyMt0hG3m5fNagf/DmoSGGAaKu
	YZ+LBDGDTIQZ2YkvlRqDfvUx9uOmnw9VSefsZfEXjsy/n2ny4aln
X-Google-Smtp-Source: AGHT+IFUS8qz9IpKL5ZcAZ8OyFyLvVNgici/BBziOfQFbnEaYTDdxY4F9CAtftsOOYRvJ/CoOPKo9w==
X-Received: by 2002:a5d:574b:0:b0:37c:cf1a:b2a8 with SMTP id ffacd0b85a97d-37cd59def87mr961455f8f.0.1727392899862;
        Thu, 26 Sep 2024 16:21:39 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3989-b03c-7705-998b.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3989:b03c:7705:998b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27773c0sm50368166b.1.2024.09.26.16.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 16:21:39 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 27 Sep 2024 01:21:02 +0200
Subject: [PATCH 11/18] leds: max77650: switch to
 device_for_each_child_node_scoped()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-leds_device_for_each_child_node_scoped-v1-11-95c0614b38c8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727392874; l=2297;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=GGAv58INZAAcONt61Bpt35Ntgip4w7Gu6UUVWWUtppE=;
 b=8bF3DQ/2DWcbOXH4dFor2UErTpk8gkcWEtJam43Nw0mF8/Zn9foJ+D7oYX405KrNhZyrd0vzr
 F5Z7Ns6Yd7HCiI8Ke73l2dScfUxJ1IBnD7u7ujtB4pnx6fEvO1lSltl
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Switch to device_for_each_child_node_scoped() to simplify the code by
removing the need for calls to fwnode_handle_put() in the error paths.

This also prevents possible memory leaks if new error paths are added
without the required call to fwnode_handle_put().

After switching to the scoped variant, there is no longer need for a
jump to 'err_node_out', as an immediate return is possible.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/leds/leds-max77650.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/leds/leds-max77650.c b/drivers/leds/leds-max77650.c
index 1eeac56b0014..f8c47078a3bb 100644
--- a/drivers/leds/leds-max77650.c
+++ b/drivers/leds/leds-max77650.c
@@ -62,7 +62,6 @@ static int max77650_led_brightness_set(struct led_classdev *cdev,
 
 static int max77650_led_probe(struct platform_device *pdev)
 {
-	struct fwnode_handle *child;
 	struct max77650_led *leds, *led;
 	struct device *dev;
 	struct regmap *map;
@@ -84,14 +83,12 @@ static int max77650_led_probe(struct platform_device *pdev)
 	if (!num_leds || num_leds > MAX77650_LED_NUM_LEDS)
 		return -ENODEV;
 
-	device_for_each_child_node(dev, child) {
+	device_for_each_child_node_scoped(dev, child) {
 		struct led_init_data init_data = {};
 
 		rv = fwnode_property_read_u32(child, "reg", &reg);
-		if (rv || reg >= MAX77650_LED_NUM_LEDS) {
-			rv = -EINVAL;
-			goto err_node_put;
-		}
+		if (rv || reg >= MAX77650_LED_NUM_LEDS)
+			return -EINVAL;
 
 		led = &leds[reg];
 		led->map = map;
@@ -108,23 +105,20 @@ static int max77650_led_probe(struct platform_device *pdev)
 		rv = devm_led_classdev_register_ext(dev, &led->cdev,
 						    &init_data);
 		if (rv)
-			goto err_node_put;
+			return rv;
 
 		rv = regmap_write(map, led->regA, MAX77650_LED_A_DEFAULT);
 		if (rv)
-			goto err_node_put;
+			return rv;
 
 		rv = regmap_write(map, led->regB, MAX77650_LED_B_DEFAULT);
 		if (rv)
-			goto err_node_put;
+			return rv;
 	}
 
 	return regmap_write(map,
 			    MAX77650_REG_CNFG_LED_TOP,
 			    MAX77650_LED_TOP_DEFAULT);
-err_node_put:
-	fwnode_handle_put(child);
-	return rv;
 }
 
 static const struct of_device_id max77650_led_of_match[] = {

-- 
2.43.0

