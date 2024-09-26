Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382F91B1510
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Sep 2024 23:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727392892; cv=none; b=VnuNtiR1wwCzy8K5yQ8f7mJcD1mARsjKLNhHlMnd09cPUzBaKwi6qR9k1NqCA/LK2bqk15EskFL6uFM1ndKLahf1rwV3PHGWGaEFTkjtQVs5aaYtLIG1Qg+K//mbYGM34vgQDOSsFvQSPprhz5KrFL7gzeOthZ2rr5YV4Q6/uGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727392892; c=relaxed/simple;
	bh=ReP7Qr/J0AJ2qUDKb/L8HtY4TnwQiLgJ9A1DOQKpN7I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DDAJ+74NWCZE0R/vnwrWMHe+bDfqtvWaVKEe4oG/L9IcW7eskeJAib6F72ZRdWmxP2NsPvb1meIgzrQfuL22fNP4LJBLPSVbqi963MfUuaXV6+n1YLWcCWDEQsgrD3l716XN+9H0RY5HEl3bd0Fyg8evZucm3/891jJOM8jR0AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HdlcpYf5; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HdlcpYf5"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5c42f406e29so1905638a12.2
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Sep 2024 16:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727392890; x=1727997690; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RKtvZEPDH+fIZPKBCRGZ7MZSFbm8PGwqKLmwiboGd/E=;
        b=HdlcpYf5gCQGShZ3RlHJ0PP4/O1qv4z4jskLaRKiCL+Ocf0SEV6uO5QWBdLt4ltitg
         HTzw+wAOK+KpBpmxhCKAGiDuDMHe2iMbXwS67tqGXZypO/lpvTaU3BQVN5dJ717oKszt
         ozv1MmrCOuc3YjwOvY5hpWko4n5toxE7stCJnyvBWMUiuvWQREA1XimpUZif9GE1FZlc
         zKwU0eVGiNmvmH8Be2lQVKJGSgxzuk8oki/i6lNoc5Oty/vJd4iQ98qxOQvQWwuZORqV
         raS7r9HKEnsmH9R0ylTOkvF6l7TDXRKdmhgM4CvzUGnWiFabjK7IjVYguT3bwNOmT97w
         Y0Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727392890; x=1727997690;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RKtvZEPDH+fIZPKBCRGZ7MZSFbm8PGwqKLmwiboGd/E=;
        b=Pwkx/1LqH+sYlGCxQFXczt2kCFIeGpxNAxI5denpG6IeaD6ywCF3IaFXmaOdwg3Rl5
         AVCCkWQHoLBeLHF6XKdkVN/pGUYDRbbpOKwbjDkwFmdCyAyP3klDdNdu+WBotmMpTqli
         5u10/BUK688s6GrsMW+98G7a96aSJpF/+bGqFLj5Yt0m8MYMMqCA+17q6wh5pQkDhUkv
         ZNpI9W3TctE++ZQY0WrdA8WIc45LYJiD88V1di9XZBNRhNIvxuHh39hiVbGehiWBlcyI
         wRrmgwqVepzQBqBQOwI3qeQdMfC12jyYTCZR2C75G7ffFPOT6FI5MC6rurPMpPidZkJp
         zBEA==
X-Forwarded-Encrypted: i=1; AJvYcCXP8Z+c9x795bGHi5KLw7RBsjo10d0P37lFBz+PyLzosyCB+vmN7DDddUuBFGq8Yhx8O7+Z2cbbDVMZ1A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8flzsMYlUNBhZj/iVXNEWrQ4uhZx5DioSKChHYe68zSqD1i8F
	GQaJ6MR9vM0GJVVCB45s0tjlvTPlfH4ryhOm54nHh8cTK1WiKrTH
X-Google-Smtp-Source: AGHT+IHjxclqmwCts53ey2Mkw8lOf7cm6f6r/L5Uli3GTjR48O81vxvj6U2y1w0YBmydxDpTTVPPDQ==
X-Received: by 2002:a17:907:6ea4:b0:a8d:555f:eed1 with SMTP id a640c23a62f3a-a93c4946d94mr84366166b.31.1727392889478;
        Thu, 26 Sep 2024 16:21:29 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3989-b03c-7705-998b.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3989:b03c:7705:998b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27773c0sm50368166b.1.2024.09.26.16.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 16:21:28 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 27 Sep 2024 01:20:56 +0200
Subject: [PATCH 05/18] leds: cr0014114: switch to
 device_for_each_child_node_scoped()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-leds_device_for_each_child_node_scoped-v1-5-95c0614b38c8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727392874; l=1242;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=ReP7Qr/J0AJ2qUDKb/L8HtY4TnwQiLgJ9A1DOQKpN7I=;
 b=jAh+BzDwMT0vn09JLTdN0MvzxhKKOiSKKW8O/GHNIet44fgm7ZR14Rvbw3/y5IEMMN9dMTqL7
 Q05KmODqeDkDJyq7FeIhBaMWdt9zpVsDxf2x/EqmSbBsNmsdTzpoi0R
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Switch to device_for_each_child_node_scoped() to simplify the code by
removing the need for calls to fwnode_handle_put() in the error paths.

This also prevents possible memory leaks if new error paths are added
without the required call to fwnode_handle_put().

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/leds/leds-cr0014114.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/leds/leds-cr0014114.c b/drivers/leds/leds-cr0014114.c
index c9914fc51f20..7e51c374edd4 100644
--- a/drivers/leds/leds-cr0014114.c
+++ b/drivers/leds/leds-cr0014114.c
@@ -181,11 +181,10 @@ static int cr0014114_probe_dt(struct cr0014114 *priv)
 {
 	size_t			i = 0;
 	struct cr0014114_led	*led;
-	struct fwnode_handle	*child;
 	struct led_init_data	init_data = {};
 	int			ret;
 
-	device_for_each_child_node(priv->dev, child) {
+	device_for_each_child_node_scoped(priv->dev, child) {
 		led = &priv->leds[i];
 
 		led->priv			  = priv;
@@ -201,7 +200,6 @@ static int cr0014114_probe_dt(struct cr0014114 *priv)
 		if (ret) {
 			dev_err(priv->dev,
 				"failed to register LED device, err %d", ret);
-			fwnode_handle_put(child);
 			return ret;
 		}
 

-- 
2.43.0

