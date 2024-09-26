Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549441B2ED3
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Sep 2024 23:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727392905; cv=none; b=fUVTqUVI9L0wneHypH1wCbRZF/bGx0+tYStgyQpWaSmVgy1TlWxJyd2RPaUA2G0BjJfK7MGA5g6059ptuFEjU++VH52eZAP95mBv5gudBDzaaqnZPTTDwWqp7oCxhzcQWgodLY95ixxVgDfKZTloONyTyEpvdK1+0D+BBCZfR9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727392905; c=relaxed/simple;
	bh=Jz/4B/tgbBWqjdHctAGZYjiz0MxFy7WzJiMpp8ER/SE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pdl6t8EpIsS2VFBTMc5F7UcQ1h52DPKJYyaJW03vPtrDpo0TeLjnRZOiRVWHQxKwzHTw6ANA3i4awtR1PGbidrLAnbnAEe7WRwe69iG5uXfYL/t+eZNv160kR8X3QmEBFismJvRuopAqsRjeO1MjmxdPQI3fJXtsSrOXnD90c7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I/e13SNf; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I/e13SNf"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a910860e4dcso215233466b.3
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Sep 2024 16:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727392903; x=1727997703; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m7h6S8dVKu0rivFQ344WPkvtRjYXL2xD9tqPuM/hQA0=;
        b=I/e13SNfbDeJhhdw7T8+Z1UOQP1mRoNZEL7kPK5sqyLyLakIfQTIsu+Q6ywUmIfrBc
         qjvF4OPvN46MqnDTpJOX2ALubVRQSV0TmjIJRHsG8eHhwWFKjU3kxTi43L+ODnwjQ703
         UsP1oivrIDC3NiDl3MyCtMxW+99L4yjh/Fk33FkUemOymihkbYoA/gKUHPzU9dPawG0A
         kSuckJDjWrt2Jhnn478D0x3neZLQrFxTmhmu1KT1Azi7PCKZv2L3WEKgKe9bCtq+MnRa
         n3h+sN5UyyMU2OdiT6ierU23Y1enYb6H6625JEJ+iPieLAK7QLhZX5QGzIUiX1d+ctv2
         RyPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727392903; x=1727997703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m7h6S8dVKu0rivFQ344WPkvtRjYXL2xD9tqPuM/hQA0=;
        b=jgoGWHnGAv0l1O0M4bHWn9wRueX/Vgjxp1XR4+SBAcS0J4Vx1PniQ/GY9C/Wf9ztTa
         eGYOMNoFWzt2RU18r2Zs76X0a0V7NUtk/9sM6aNUQhxiOR2uA/PUfUsSKMZ6e7lMUwPz
         6IgicNlHzyk9HYXNM9CdeYLX1kQGPjBYFwYDcsdo9Yg1+1NKDRrxP13/ZB3S3jqtFnTp
         5rLRDnzYySw+BvcW++w78ON6G0MI0H2Y+011N3z/ClZNcS1peylaB7eWwNNnFrXxhgrz
         arW1CmbB9CtVp2CwPNr/yvB2wAVRJkykiXLiD8hzCw4pbPZ2QL9efuuLy+5oGBK1UbFs
         IrUw==
X-Forwarded-Encrypted: i=1; AJvYcCU18Ew0urhpm+PGI6puy7rQcEjS2pRiu2vP0mwtW09RN0pO0IJv9+uEEUpxt3VEHUQQHh0bU4drIvKTOQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwcXPsTNVWOd71+4ORT6WhwZDGuwY+K/ZpvJyqyewH+++VfnJux
	a5KwCfUpzlJL6J8FsGefkGOWK0l3elqj5HhIhApTCcTCd2aJP9z3
X-Google-Smtp-Source: AGHT+IGvoYtTRlxo+ZCSr+7IZ7oL03DwfddA8kVTy/0vVLsrqZIZv4yAr3ANwPUYnXfyhoxnViIYyQ==
X-Received: by 2002:a17:907:3fa2:b0:a8d:29b7:ecfd with SMTP id a640c23a62f3a-a93c4aab828mr100357366b.54.1727392902592;
        Thu, 26 Sep 2024 16:21:42 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3989-b03c-7705-998b.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3989:b03c:7705:998b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27773c0sm50368166b.1.2024.09.26.16.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 16:21:41 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 27 Sep 2024 01:21:03 +0200
Subject: [PATCH 12/18] leds: ns2: switch to
 device_for_each_child_node_scoped()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-leds_device_for_each_child_node_scoped-v1-12-95c0614b38c8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727392874; l=1248;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=Jz/4B/tgbBWqjdHctAGZYjiz0MxFy7WzJiMpp8ER/SE=;
 b=qKqtyfzAGtYGnjb8UqcfA9/S/SX/eIKdm4rVtvNbSdblTDBXwzHMlUAHLJLiyKXWonL5oGDQU
 78Jcr4LvBg5AaqQMyyw/4oVbokWmBpUiGyTqttgSpH73fYZpZIVLpnW
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Switch to device_for_each_child_node_scoped() to simplify the code by
removing the need for calls to fwnode_handle_put() in the error path.

This also prevents possible memory leaks if new error paths are added
without the required call to fwnode_handle_put().

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/leds/leds-ns2.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-ns2.c b/drivers/leds/leds-ns2.c
index f3010c472bbd..4c6f04a5bd87 100644
--- a/drivers/leds/leds-ns2.c
+++ b/drivers/leds/leds-ns2.c
@@ -238,7 +238,6 @@ static int ns2_led_register(struct device *dev, struct fwnode_handle *node,
 static int ns2_led_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct fwnode_handle *child;
 	struct ns2_led *leds;
 	int count;
 	int ret;
@@ -251,12 +250,10 @@ static int ns2_led_probe(struct platform_device *pdev)
 	if (!leds)
 		return -ENOMEM;
 
-	device_for_each_child_node(dev, child) {
+	device_for_each_child_node_scoped(dev, child) {
 		ret = ns2_led_register(dev, child, leds++);
-		if (ret) {
-			fwnode_handle_put(child);
+		if (ret)
 			return ret;
-		}
 	}
 
 	return 0;

-- 
2.43.0

