Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13EC1B1D5B
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Sep 2024 23:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727392896; cv=none; b=H1lqpDQ07S1Gckxf73A+zjqw5fAVTe/Ydot0MP98nbVMAIPKr7/eFvAG/ZlDfoVqT130s+a1HFKsRDJ17zvpyXxjqSbNPL50pYHpcrDVgYjJjfY4gmebMlv+0+eklqzH+6aZHCI5hJd7PsrdwPAoEOTc9+yHHxEVu/AzGm9A7io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727392896; c=relaxed/simple;
	bh=YvOQrDMAC/x5xAIds/zbIhc77SSn9FZnaj7kTpsmuOI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pVwWJR0PpJCWzEK0OxwPWmv4bK1RI2U9KIU+DFI6NTsCBvHRbtB6uILSWW0WXxusquI4KQfFZy6ad21VZCgB1TSi693q2q38gU/WR2Esrxxy28BeqtByVz2L9vwVDgNlyI4w5wFBHJR1cyNsGDUVzvgjOkffr694QWOm9uja99c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lEipn10i; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lEipn10i"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42cc8782869so14259385e9.2
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Sep 2024 16:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727392893; x=1727997693; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=njNW1TfRFsU+HRABWUBqLsQLOj2MxWgzdzaH2G/Qjz8=;
        b=lEipn10ioFXUXq0mNatLPfcK054JoagWXgsrgsJhYxcon6jyT15zFx2MW5cNZl2TPe
         zQN3Vh0Q27yqMy8h32/c3yYMgonLXjd2FyED0Pui7vhAWIWlRfyRtkCoRfo//j4A5Re6
         M0v4FfZ2Z6zhOiURi1dCgina9NZKpc0nahMiqSC3lAJXAneaymoZsH0te07zhjT3T75b
         muh3Yj1y32o6qapZN1mu8DB7QTM0NBrL0RI28edkQpCyjcwZPk1QXmauTNubQg/DBGaf
         wkHAuWNBX5Bj+fBgDM3SJib/Y9YPZYIuuPzlP3lcQ0l3xh+3YqFppdtSoePadgI1FoGu
         7+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727392893; x=1727997693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=njNW1TfRFsU+HRABWUBqLsQLOj2MxWgzdzaH2G/Qjz8=;
        b=gmnsuCVwiGPFYjW/+StOSrVHomp9IB3gxqXn8UlUme1spKiz2YIzrd46yjQ1s9FuqS
         L/I99Fesz1YsGV+IC5xtQ9kKDPLbCZktx4m1OkJhynt7q23tHiTYuH1BMH5hULWMIRck
         j1i0htoJlJc1iNVq2jJ+PWvoYRz78jUiUSY3EpROvJIMx8p5Hum/GpQxAYXInkB9vz6A
         IygZTnSsdJ6+dNiZUbSU21iATdoVNCY1kA4/A7axmoC7GsWvNMm/eshkTu3mmHoXUdZa
         m4Ef2ffm36k3nDDbWn9w91lphCFxfewoMbslGvAogHvBQVUXE9y9G35iWrAwxlXvRUCB
         Zj3g==
X-Forwarded-Encrypted: i=1; AJvYcCWXKYYzZ4/udoIKn4ZBYsiY37cP0q+X85VsfpIAshjpsVP+rjQmc7BzRhIuWG+FmGmiqloHMONWD6TV1Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6We6vShHgXZeGGJ6nPxiDygctlicQM2JoaQ+AlqCQkDXNYApB
	J8Gwh2crGf+yg1X54pobFW+vnkbPS+hAAD1I7/KM3T3y9G9u7ZDz
X-Google-Smtp-Source: AGHT+IFoitU4rHzuAlGaN0CepshD8zukebslAy4qEv5jClIy8HmE5FNZn/uF/6GAUB+QSUSFAl2R6w==
X-Received: by 2002:adf:f4c8:0:b0:374:b97b:c69 with SMTP id ffacd0b85a97d-37cd5b1b9damr807113f8f.48.1727392892968;
        Thu, 26 Sep 2024 16:21:32 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3989-b03c-7705-998b.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3989:b03c:7705:998b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27773c0sm50368166b.1.2024.09.26.16.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 16:21:32 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 27 Sep 2024 01:20:58 +0200
Subject: [PATCH 07/18] leds: gpio: switch to
 device_for_each_child_node_scoped()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-leds_device_for_each_child_node_scoped-v1-7-95c0614b38c8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727392874; l=1859;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=YvOQrDMAC/x5xAIds/zbIhc77SSn9FZnaj7kTpsmuOI=;
 b=F2/BmA3k318R3nNJ4o+UdX5dm9/ZS5qzvXg9eIRN46g7PjN1BIAHbn7DjaItKHdhF2qnEkj6C
 BtRfhRRoXksBEEmVczX8toVRs3aBAvQxOXiWB/l5LPYF47XYVrkWYG1
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Switch to device_for_each_child_node_scoped() to simplify the code by
removing the need for calls to fwnode_handle_put() in the error paths.

This also prevents possible memory leaks if new error paths are added
without the required call to fwnode_handle_put().

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/leds/leds-gpio.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index 4d1612d557c8..7d4488191241 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -148,7 +148,6 @@ struct gpio_leds_priv {
 
 static struct gpio_leds_priv *gpio_leds_create(struct device *dev)
 {
-	struct fwnode_handle *child;
 	struct gpio_leds_priv *priv;
 	int count, used, ret;
 
@@ -162,7 +161,7 @@ static struct gpio_leds_priv *gpio_leds_create(struct device *dev)
 	priv->num_leds = count;
 	used = 0;
 
-	device_for_each_child_node(dev, child) {
+	device_for_each_child_node_scoped(dev, child) {
 		struct gpio_led_data *led_dat = &priv->leds[used];
 		struct gpio_led led = {};
 
@@ -176,7 +175,6 @@ static struct gpio_leds_priv *gpio_leds_create(struct device *dev)
 		if (IS_ERR(led.gpiod)) {
 			dev_err_probe(dev, PTR_ERR(led.gpiod), "Failed to get GPIO '%pfw'\n",
 				      child);
-			fwnode_handle_put(child);
 			return ERR_CAST(led.gpiod);
 		}
 
@@ -192,10 +190,9 @@ static struct gpio_leds_priv *gpio_leds_create(struct device *dev)
 			led.panic_indicator = 1;
 
 		ret = create_gpio_led(&led, led_dat, dev, child, NULL);
-		if (ret < 0) {
-			fwnode_handle_put(child);
+		if (ret < 0)
 			return ERR_PTR(ret);
-		}
+
 		/* Set gpiod label to match the corresponding LED name. */
 		gpiod_set_consumer_name(led_dat->gpiod,
 					led_dat->cdev.dev->kobj.name);

-- 
2.43.0

