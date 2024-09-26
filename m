Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4511B1D71
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Sep 2024 23:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727392898; cv=none; b=hvlqqiSMbierP621XYlCLSQD+KKA3V4gypYZjeLlHM1gLz+mwgU3wXwrbUPh5Vkg+/VGPp0dovT0+Mgg2w69QPy6uMoCI0RGIZkr0Ke/DKjirKF4WxXuY+JSgVi26xSdhp1qit1WRnq4DzWexSvJhm4gEs7avXd8rFcfjQOXxgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727392898; c=relaxed/simple;
	bh=v0iYfIBPWrhBeMk5GmLZkiz62OQVqii6tL7xBG0nuYo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hq00gFDN30PCWikqSE5f6S9TjW8Tvc9Jag+O5nrHQDZYZZOhA2I03XC+ORObWKOwpXz6oDCbCKZDISwo8Lydab39g5ByaZ4QkwfQtiazHoeNiFSGQSfq4XEKEHId8xIbG1geIdkcJUWK6xYRl9jHgP0IPGGDau/ltI7hGtrKWUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QrYVsNgo; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QrYVsNgo"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a8d2b4a5bf1so181255366b.2
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Sep 2024 16:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727392895; x=1727997695; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9z03eGnj6iGqYzDELmW5r9JfCTcrG6sf4eOCgWvySkE=;
        b=QrYVsNgoDCOheU2NFCjrgwRz48gSUR36BRqC4Nn8WF8kWjokKQhe52wlJfT73MDtG6
         ooXjSFQzVjneJMVSkfyb3cvA2+cAt7yHteuvnvue5WJF3JjN6sUIJfvBL+N7BTHWK1yy
         c+zlGds5XwgLPxRXlcmaVKHhsB+DP0McDp1dKUhTHprXt4PV5zAAHVILQgAM0vBnJsdo
         gTaE+ZIfID/plQ03B5/AOyCpceMTXqpQp3KgfvtCGVvusnhqpMwp0zRQsL17SHWj3bCS
         cgO+BdnYMLtOquRBEzpWljE7T0XAGZmN9s7b9NsWJHXCHFS+xm67VtNTW6njCjk4gWi7
         U6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727392895; x=1727997695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9z03eGnj6iGqYzDELmW5r9JfCTcrG6sf4eOCgWvySkE=;
        b=eHbCHUEViLiEsclJMg3Gj3zM1LAAwdkI+nLCu6fMnK3WlWw/5N3l0mvA+cf+r4lxPO
         7Zr0Maj2bovLgINo6W6oaxYntzKxECvEIgcMu2P1QZWKV754fUXuqWv/nrrE52FV7/p+
         gWdpB4Y0NqZRSnv7DYO8arv87KpEtRm3ROSztnIgl0Ti1K6oA8znIbZUugc9rgLzzM+B
         JDCHlVcGucm6hLWIEEWoUVoeNEFeXMPbU/LDCieTer4cOfMeGCAoE10bsNaQSAMfAIcT
         iCp7m/3B8Qxe0casm8+CEQSZaKDQjLWETUgvmwLn65xz5ALGP8bmYLzXOi5TBZZF0Qus
         eX8w==
X-Forwarded-Encrypted: i=1; AJvYcCUL5n/zvqD5gfYLj7U2tVLh8MENKbWKC1bTha9l67FeDvUUZNbHQwi1XeXiw5r4nF2vptHSY7Ojf9deGw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzJETnpcSP0YH3iSfYQzWt6fjghycxrLt8foVgG035FxAieDfQF
	BUDMhIbcSf5ZhpT3781RN/xAbzG/QClkbmjjMI+T8KxqtG5IYsFJ
X-Google-Smtp-Source: AGHT+IHzRwIU6UAzlavm/QZ6zyKdlkN5H8May0eKhpEiWtxIy3j8Q0eikPpKvoRwQ2Ar8Be+Bn0Hew==
X-Received: by 2002:a17:906:4787:b0:a8b:154b:7643 with SMTP id a640c23a62f3a-a93c492a5dcmr98770966b.28.1727392894740;
        Thu, 26 Sep 2024 16:21:34 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3989-b03c-7705-998b.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3989:b03c:7705:998b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27773c0sm50368166b.1.2024.09.26.16.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 16:21:34 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 27 Sep 2024 01:20:59 +0200
Subject: [PATCH 08/18] leds: lm3532: switch to
 device_for_each_child_node_scoped()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-leds_device_for_each_child_node_scoped-v1-8-95c0614b38c8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727392874; l=2745;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=v0iYfIBPWrhBeMk5GmLZkiz62OQVqii6tL7xBG0nuYo=;
 b=vv0qMx18gJDO2AXmo395Dj+OG11mPwp0TR26/SNLfM9jrHi1Va8TeNdbSx8stlq/n+ILIf4c3
 gYOYGMQVm0qArDwfN4d+6vbuDJ3QihySKHfjHS8w1myjgZBJRpxCUpZ
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
 drivers/leds/leds-lm3532.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/leds/leds-lm3532.c b/drivers/leds/leds-lm3532.c
index 54b5650877f7..24dc8ad27bb3 100644
--- a/drivers/leds/leds-lm3532.c
+++ b/drivers/leds/leds-lm3532.c
@@ -551,7 +551,6 @@ static void gpio_set_low_action(void *data)
 
 static int lm3532_parse_node(struct lm3532_data *priv)
 {
-	struct fwnode_handle *child = NULL;
 	struct lm3532_led *led;
 	int control_bank;
 	u32 ramp_time;
@@ -587,7 +586,7 @@ static int lm3532_parse_node(struct lm3532_data *priv)
 	else
 		priv->runtime_ramp_down = lm3532_get_ramp_index(ramp_time);
 
-	device_for_each_child_node(priv->dev, child) {
+	device_for_each_child_node_scoped(priv->dev, child) {
 		struct led_init_data idata = {
 			.fwnode = child,
 			.default_label = ":",
@@ -599,7 +598,7 @@ static int lm3532_parse_node(struct lm3532_data *priv)
 		ret = fwnode_property_read_u32(child, "reg", &control_bank);
 		if (ret) {
 			dev_err(&priv->client->dev, "reg property missing\n");
-			goto child_out;
+			return ret;
 		}
 
 		if (control_bank > LM3532_CONTROL_C) {
@@ -613,7 +612,7 @@ static int lm3532_parse_node(struct lm3532_data *priv)
 					       &led->mode);
 		if (ret) {
 			dev_err(&priv->client->dev, "ti,led-mode property missing\n");
-			goto child_out;
+			return ret;
 		}
 
 		if (fwnode_property_present(child, "led-max-microamp") &&
@@ -647,7 +646,7 @@ static int lm3532_parse_node(struct lm3532_data *priv)
 						    led->num_leds);
 		if (ret) {
 			dev_err(&priv->client->dev, "led-sources property missing\n");
-			goto child_out;
+			return ret;
 		}
 
 		led->priv = priv;
@@ -657,23 +656,20 @@ static int lm3532_parse_node(struct lm3532_data *priv)
 		if (ret) {
 			dev_err(&priv->client->dev, "led register err: %d\n",
 				ret);
-			goto child_out;
+			return ret;
 		}
 
 		ret = lm3532_init_registers(led);
 		if (ret) {
 			dev_err(&priv->client->dev, "register init err: %d\n",
 				ret);
-			goto child_out;
+			return ret;
 		}
 
 		i++;
 	}
-	return 0;
 
-child_out:
-	fwnode_handle_put(child);
-	return ret;
+	return 0;
 }
 
 static int lm3532_probe(struct i2c_client *client)

-- 
2.43.0

