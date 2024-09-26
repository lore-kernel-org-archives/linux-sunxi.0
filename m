Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0596E1B29A7
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Sep 2024 23:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727392901; cv=none; b=CdHW4wClhl4uc03fhQ2tUJ8eKvc0bQH6YVOCKONaKp1GULlx8yLticilA+DAWL1rSnzVu+I8tSlT4TCqXkN+jqTCid09QGC5Ob57NSPelfkopldLKvcMKwVbplxBmcVAdR8AJbueVALCsc6ovkCzvqvAoQWQN5clXweDRM5tI/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727392901; c=relaxed/simple;
	bh=wVCMNpNXMBYRf/3Qo+CvGWvj1uX3gLZ/0II5tIZcKP4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LNYFIRp9esC71/19aNujp1SVlBWJeW/Zzq897F1NbEbKmcqPBiB/d1LKqPxWxpJ2tAuUaDLaX/u8a3VzKpB0Ikq+YbE3SQWnc4qb02QLzu4spxXMxHxobNBvXzCONI55E7OeYPm+pQhS+65oY+YZuJ6FasokIBFGaRt2Q2dBps4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JDA90e/b; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JDA90e/b"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5365d3f9d34so1917170e87.3
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Sep 2024 16:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727392898; x=1727997698; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SbKG8yQzAXSNKnNqMlC3vDG+SObBOdoBsMSFHrHh/gQ=;
        b=JDA90e/buUU3lh20Pq1d5FRQJsUdTiLQ+9VGYR5iTweKYHj2FiQYBngSyp+2fnNzqj
         ynGEUQMnHkVnBn64c7Q2Y4QaNN3LaZUuQwMSu7FonQkOtj22JXhe8mRjfZz6nI025J9M
         F9E8n9fph2f2hfBQZQDt+vJihYMQpSFWjv5D1fTPnbe8n404VgWZrF/k67exjQtEHWrz
         PcG06lPRhrjQLThWVF35F5K4h5OhUGspKeEFJeQxzRdfGH5lVv2/bKPH2GwXjQFhegmd
         hHn/LRuL62DoJh7CzowURa8iygDeTc1MGlWXG5A9zX8nQxC4kW6PVrHdzpJQubx3vPYr
         xD6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727392898; x=1727997698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SbKG8yQzAXSNKnNqMlC3vDG+SObBOdoBsMSFHrHh/gQ=;
        b=A2a8Jz9lqgN2BIkBn4Ws/E5eCfwecTiZwrvffR72ad3M7iQTmlnHLl/6NwyfJF/uW3
         xB9EvZt96jggRYhbLBlJ8q4PrX+HzZ3I10GcHnK3Z3akfdcoIT0/3vBz/jQL3lgNbQWk
         gAURaUkZVPrxHYm4hSgkwEp8nWom1t/Rc/Tt02grrdJqJ8mTiISPFO0PevbYAvjGT1Qo
         PHM3ajsPRywmEnQuPWGEUsccgj+qEZOOeXUfo2s/QkUOfIp2dRVwBB0uewHNAlKp25H1
         qgLqmHaybSC+8W5vR1rm8labQ6MAOJAzEfEMnt66kkV10Ny1orOuvdTEEox2bJmpl1Zc
         1kHw==
X-Forwarded-Encrypted: i=1; AJvYcCVryXe7DRC8776kiCMxB1n/qfctgWkhv6sekFdFpQCjFr2VktIrgUSovVtC4XJrN7V+kZ0ATOz3z4Cd5w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9EN24N17ZRaFL0MH1uBSnKXz/0LGm6GMmCM7uSuoqfnbgcteR
	7S78rd0A/6XQm132dUy8MLJkVvfZZaCsoF79NUOh2rOdnEgSO91e
X-Google-Smtp-Source: AGHT+IHargOBULwRmlTYho66CY6TIIKNF6jhPFgs1jxdfin7EzZ3x+Ihx+4IF9Pdg3mdG2UXbYfTUQ==
X-Received: by 2002:a05:6512:3b0e:b0:533:4477:28a2 with SMTP id 2adb3069b0e04-5389fc3bd4cmr983572e87.16.1727392898039;
        Thu, 26 Sep 2024 16:21:38 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3989-b03c-7705-998b.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3989:b03c:7705:998b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27773c0sm50368166b.1.2024.09.26.16.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 16:21:37 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 27 Sep 2024 01:21:01 +0200
Subject: [PATCH 10/18] leds: lp50xx: switch to
 device_for_each_child_node_scoped()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-leds_device_for_each_child_node_scoped-v1-10-95c0614b38c8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727392874; l=2725;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=wVCMNpNXMBYRf/3Qo+CvGWvj1uX3gLZ/0II5tIZcKP4=;
 b=gvqzp5RpDFRs+Bq7QHctcXoi4uXIDmfAqWPfacNwek7XmLGTnkrq8CcrnDg8YhcpKi7G9Dh5l
 Mj0YUm6RICjA0yWhlPqzXPpjj3PJpAdJDq6e44FbnnPGX71dsvI63Wq
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Switch to device_for_each_child_node_scoped() to simplify the code by
removing the need for calls to fwnode_handle_put() in the error paths.

This also prevents possible memory leaks if new error paths are added
without the required call to fwnode_handle_put().

After switching to the scoped variant, there is no longer need for a
jump to 'child_out', as an immediate return is possible.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/leds/leds-lp50xx.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
index 175d4b06659b..32ca45aec76c 100644
--- a/drivers/leds/leds-lp50xx.c
+++ b/drivers/leds/leds-lp50xx.c
@@ -434,7 +434,6 @@ static int lp50xx_probe_leds(struct fwnode_handle *child, struct lp50xx *priv,
 
 static int lp50xx_probe_dt(struct lp50xx *priv)
 {
-	struct fwnode_handle *child = NULL;
 	struct fwnode_handle *led_node = NULL;
 	struct led_init_data init_data = {};
 	struct led_classdev *led_cdev;
@@ -454,17 +453,17 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
 	if (IS_ERR(priv->regulator))
 		priv->regulator = NULL;
 
-	device_for_each_child_node(priv->dev, child) {
+	device_for_each_child_node_scoped(priv->dev, child) {
 		led = &priv->leds[i];
 		ret = fwnode_property_count_u32(child, "reg");
 		if (ret < 0) {
 			dev_err(priv->dev, "reg property is invalid\n");
-			goto child_out;
+			return ret;
 		}
 
 		ret = lp50xx_probe_leds(child, priv, led, ret);
 		if (ret)
-			goto child_out;
+			return ret;
 
 		init_data.fwnode = child;
 		num_colors = 0;
@@ -475,10 +474,8 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
 		 */
 		mc_led_info = devm_kcalloc(priv->dev, LP50XX_LEDS_PER_MODULE,
 					   sizeof(*mc_led_info), GFP_KERNEL);
-		if (!mc_led_info) {
-			ret = -ENOMEM;
-			goto child_out;
-		}
+		if (!mc_led_info)
+			return -ENOMEM;
 
 		fwnode_for_each_child_node(child, led_node) {
 			ret = fwnode_property_read_u32(led_node, "color",
@@ -486,7 +483,7 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
 			if (ret) {
 				fwnode_handle_put(led_node);
 				dev_err(priv->dev, "Cannot read color\n");
-				goto child_out;
+				return ret;
 			}
 
 			mc_led_info[num_colors].color_index = color_id;
@@ -504,16 +501,12 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
 						       &init_data);
 		if (ret) {
 			dev_err(priv->dev, "led register err: %d\n", ret);
-			goto child_out;
+			return ret;
 		}
 		i++;
 	}
 
 	return 0;
-
-child_out:
-	fwnode_handle_put(child);
-	return ret;
 }
 
 static int lp50xx_probe(struct i2c_client *client)

-- 
2.43.0

