Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B987B1EABD6
	for <linux-sunxi@lists.linux.dev>; Thu, 10 Oct 2024 21:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728595580; cv=none; b=DWKAZPsx1AtrOIuoxlGNs4Jpo3f0C9csyrxSrXbAVQKVRSNCXYpoKw9PQNcJEq1wEgrjFsBnK6OZrV91FJtThfZTJNiPoFOdEizo5MtECocFyq4IehF9ueh25H9KS2OZ20IfoKEbyTfuksHo58ZBQUUqBlPSyWicQEPGYoCrjfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728595580; c=relaxed/simple;
	bh=osj1On2Z4WQ2i4hQXIWGqEGjGF6nBC2nMsxNyB0VvTE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ldNowmxAqpYNmB9mE+PQBq0h/x0y7TvHiVSyYuJsC821HRffc3hun/GZ6S3mv8C8gn58hDq0Nkp+Pl3BpJspsf2BAk31F8CQSc5ykI0+lO19yqIVpMsFnT4fhY0ghl9SZJ4QypMQCdW1dW4DjT5yHTJN5XBVsKuxjCdH8myC8ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UWvJmx/y; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UWvJmx/y"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-37ce9644daaso884637f8f.3
        for <linux-sunxi@lists.linux.dev>; Thu, 10 Oct 2024 14:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728595577; x=1729200377; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fUDTsje5EfzdoMuNeif+3YwfWRAgSWK+tp+b+is46Rk=;
        b=UWvJmx/yA0uKD7I5UolaZiH0wNf80xQmiN5T0CGlq74KCv6S0RDD8hvtDXoPvXmo3P
         ityK96HlSH0KD/ywbNE2Qjo9WzDtI6zk81T0rWHjMsZhc4tme1lHl8Q4OM1RDoxSVjvq
         hp1SP0KLBC9Dyio5B9I9rioMqu/svNPOPgpTo2JOVX07MYWw1LjaBVsowvK5qtGcI4ZG
         tAog2xK+UrBudvNCARUbprWnbGV0ZWxfY25QVjBxkHlJL/0qx9yykfzzMRTQabAE/SeF
         WxCGnd0YBY7K8jPoUhJHB7ipYm4D2jmhobo85WHiR+b1LX2DximP8lbqhovIx1CPtp90
         5pRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728595577; x=1729200377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fUDTsje5EfzdoMuNeif+3YwfWRAgSWK+tp+b+is46Rk=;
        b=sQ5N0f4P0TAiMajvPD+8VcyCM0X/zMhHO4Zu/Y48r41LzNFeQj0p0llsWCqDUBIlqI
         HFQIPngMcuo7NHbP9Xvi/NX+KKnjK6QpgZNcLDouDupqqB8yzdbLCI4O5pKrYM9AvsZG
         9pVTIeMh2L1vBOiMC0PKsyYc8VRLSp54ac/EhkIAPiayVxPq3+8ukGfTR1qQrbLD78W3
         C894ZiDDb7AfTF41NsqNHkuHxRtCjn/zF0nClpoAHOZuN0g+eaRz86YH5xaW5u0L0qUx
         QyjSj9R8CXMiw82uILM6FT+ephbigpeFfGMKjcaQ04QmOYvFVxsDHuYqypYOGBTUkN6w
         XUHA==
X-Forwarded-Encrypted: i=1; AJvYcCVE/CAa5cfAdUWE7GhD5V5udJlZevnwE8buR2JQIHcMX3u1bqUNLFTGs5hHsz9oI7/BlC8QjD4BOjm+Jg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+C0LY6llqR2ofBzjlKK/NE/uP8y0bsLr/Gh0f9x4Uo7hI5Sge
	2clYSnJWU87PauhDSD5n2X4UMKRcwKvmAj5htGu7sNUHOEI/IgBu
X-Google-Smtp-Source: AGHT+IErfYIIobd2OyStqSYzXYY8mQXAN1McuuX/JaESc8XSKGTQGWz4nicjCFOz7wSr2wv2o2OOOQ==
X-Received: by 2002:a5d:6645:0:b0:37d:4e03:ff86 with SMTP id ffacd0b85a97d-37d55313314mr307553f8f.49.1728595576937;
        Thu, 10 Oct 2024 14:26:16 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3d08-841a-0562-b7b5.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3d08:841a:562:b7b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6a8940sm2402083f8f.6.2024.10.10.14.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 14:26:16 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 10 Oct 2024 23:25:58 +0200
Subject: [PATCH 08/10] Input: i8042 - use cleanup facility for device_node
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-input_automate_of_node_put-v1-8-ebc62138fbf8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728595555; l=1046;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=osj1On2Z4WQ2i4hQXIWGqEGjGF6nBC2nMsxNyB0VvTE=;
 b=jnKPKqCaHxm+V0jnKxBl/3/ALs7b4E092gZ+6qqIEjdd4p92lVndVLYBkmFyIyZ+Riv1vvWHl
 EyNknbnL/FjAys5GQDIwfXUWt02P6ak3U6BA9XJn0TyCcEaSZ5CS/sI
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Use the '__free(device_node)' macro to automatically free the device
node, removing the need for explicit calls to 'of_node_put()' to
decrement its refcount.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/input/serio/i8042-sparcio.h | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/input/serio/i8042-sparcio.h b/drivers/input/serio/i8042-sparcio.h
index c2fda54dc384..8f38b6f4ae77 100644
--- a/drivers/input/serio/i8042-sparcio.h
+++ b/drivers/input/serio/i8042-sparcio.h
@@ -106,17 +106,13 @@ static struct platform_driver sparc_i8042_driver = {
 
 static bool i8042_is_mr_coffee(void)
 {
-	struct device_node *root;
+	struct device_node *root __free(device_node) = of_find_node_by_path("/");
 	const char *name;
 	bool is_mr_coffee;
 
-	root = of_find_node_by_path("/");
-
 	name = of_get_property(root, "name", NULL);
 	is_mr_coffee = name && !strcmp(name, "SUNW,JavaStation-1");
 
-	of_node_put(root);
-
 	return is_mr_coffee;
 }
 

-- 
2.43.0

