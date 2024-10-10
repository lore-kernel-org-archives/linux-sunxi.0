Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BAC1E2830
	for <linux-sunxi@lists.linux.dev>; Thu, 10 Oct 2024 21:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728595563; cv=none; b=PN7FYA84MCl2mzfwcrlD6SYUWpkLRmK4Bw4HVF4R3pd0s80CVSjxjru1lHvlauLBjqRbRIvjM/ycP8nWrHArB8elI2LaFO/TBXbPorUB7mzxd6iODzM9zRT31VUFLa7781XFkPTIny0GaBIMxX88aL1lPR321FU7MOTFkvpR7MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728595563; c=relaxed/simple;
	bh=t9fa1o1a5Sgyy/pkELwXsraoor0CZUbJK+3ORgewgNE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kJ1pko8TZXtgNiNxCdipun22CUcJgAGfk4g8cyTBBt9KFMybGNl3kVPstqgMYlZpVDkP3bYAWChhZ34ErK5ofoIxoKgqu/iuObUqpNa5UnN+m491X3RJ5WQW0HLP1eEqY70p+3NplLnqJQTjiEsjeHLw9iI1O9horM9kPr9mKcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DjBWS9my; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DjBWS9my"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-37d4ac91d97so940100f8f.2
        for <linux-sunxi@lists.linux.dev>; Thu, 10 Oct 2024 14:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728595560; x=1729200360; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NP8lfF3+tt2bERQMe+43qAzEv8h11+8hyUY3IsdG9dE=;
        b=DjBWS9mysJp7h+602p6SOB+waeb+EwbgMYiaPVuuduHrwigEakn47lW/4eLuv+lN5M
         sZMLc41C3XNelRdVVkBMcrb2X+v4vibvY56DjB9Z/hQtQ7sIGWpo1boSBn3HcJrEzm5c
         Qg4qtZGVxHMUagpTJyFzIK7VyLUNz6c3qNL1adgMMzwGhGsdmf5w5hepdbjZNkXKKjLA
         qVyEgNkHU58hL/sxU9UqMjcDQsOvZ9PbgdyEYSMkX6IRsYtjrUadQKPDPpZlWfhoUzNK
         LR5xy8MBeWXjan4w8gadWF4QceaHi8zjO5QNof39lo1llzt5A0pl3OHj15CFXi8UNsKz
         qbCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728595560; x=1729200360;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NP8lfF3+tt2bERQMe+43qAzEv8h11+8hyUY3IsdG9dE=;
        b=hXCov/VyxdbNyxqKAtlJbG8gqgMQlg42qFNIpxAA3GkNesJ+d27toVAoodI0A3CSJx
         uzox9Vl58p5O+ox6lRyShv/eFFtR9LzrgJxeE3zqC5I6Df+nfLBiRfr/1MKfnxxPXP22
         QSUdudgd8cyZ1rPJx5Gy3KbTqHOY0Y//rs9G2ex4Dp7Rh3AXOQZZhvcRYxsd2SkB0Dxr
         QzcuFqFnX3d4tTVvJ7DY0geRU46uignAMeXG2F7HS9AfGT4h9cuGjdwPtJH4E3JSWCQZ
         PRzVink48yTHnUjrcbZugLSt79RT95Rfk/PedEAiP8f7o3D5koqUayY5gimUYAj1dbVQ
         Mfzw==
X-Forwarded-Encrypted: i=1; AJvYcCWqr5k4KSZRNeo7PRPFSZf/75DZriKq+LEGAm0TZVINVGbUcfn2RvfaC9EerLLC5Duto2eLrsO/lcgbSQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzvMqI9jBvsQdNh83OPmEf6FSjToE+6Av7eYuTN6AfE+xirb4Ci
	+1C4CoRV7cVVj3dsGatwu1NTw7F4zKs5ZTjDPiR3aTmBqBCfMI7y
X-Google-Smtp-Source: AGHT+IE4KFtceqWgFI5Exk1ggU7gG6fN1lLUM7411oUgT6YiAdrbwe1U80pIh0+6rzapsH7z+JsyYQ==
X-Received: by 2002:adf:f585:0:b0:37c:d1ea:f1ce with SMTP id ffacd0b85a97d-37d551d53dbmr354861f8f.25.1728595560283;
        Thu, 10 Oct 2024 14:26:00 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3d08-841a-0562-b7b5.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3d08:841a:562:b7b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6a8940sm2402083f8f.6.2024.10.10.14.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 14:25:59 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 10 Oct 2024 23:25:51 +0200
Subject: [PATCH 01/10] Input: cap11xx - switch to
 for_each_child_of_node_scoped
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-input_automate_of_node_put-v1-1-ebc62138fbf8@gmail.com>
References: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
In-Reply-To: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728595555; l=1675;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=t9fa1o1a5Sgyy/pkELwXsraoor0CZUbJK+3ORgewgNE=;
 b=b31gP7WKvaxSGCe8LGxC0VFmrQkeU9+dZDzn0FUk6fhSEtR5GsZSn0RkT3Hsunh8on+1vLtSE
 bY5XwOwbB/8CemBxLFfFlFJk8eGyd/NjIzj/SvQvHebIoHP0HzSadpD
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Use the scoped variant of the macro to simplify the code and error
handling. This makes the error handling more robust by ensuring that
the child node is always freed.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/input/keyboard/cap11xx.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/input/keyboard/cap11xx.c b/drivers/input/keyboard/cap11xx.c
index b21ef9d6ff9d..0c17cbaa3d27 100644
--- a/drivers/input/keyboard/cap11xx.c
+++ b/drivers/input/keyboard/cap11xx.c
@@ -416,7 +416,7 @@ static int cap11xx_led_set(struct led_classdev *cdev,
 static int cap11xx_init_leds(struct device *dev,
 			     struct cap11xx_priv *priv, int num_leds)
 {
-	struct device_node *node = dev->of_node, *child;
+	struct device_node *node = dev->of_node;
 	struct cap11xx_led *led;
 	int cnt = of_get_child_count(node);
 	int error;
@@ -445,7 +445,7 @@ static int cap11xx_init_leds(struct device *dev,
 	if (error)
 		return error;
 
-	for_each_child_of_node(node, child) {
+	for_each_child_of_node_scoped(node, child) {
 		u32 reg;
 
 		led->cdev.name =
@@ -458,19 +458,15 @@ static int cap11xx_init_leds(struct device *dev,
 		led->cdev.brightness = LED_OFF;
 
 		error = of_property_read_u32(child, "reg", &reg);
-		if (error != 0 || reg >= num_leds) {
-			of_node_put(child);
+		if (error != 0 || reg >= num_leds)
 			return -EINVAL;
-		}
 
 		led->reg = reg;
 		led->priv = priv;
 
 		error = devm_led_classdev_register(dev, &led->cdev);
-		if (error) {
-			of_node_put(child);
+		if (error)
 			return error;
-		}
 
 		priv->num_leds++;
 		led++;

-- 
2.43.0

