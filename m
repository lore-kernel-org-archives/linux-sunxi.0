Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9C51B375C
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Sep 2024 23:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727392916; cv=none; b=hd2/adBXRfJCWRd7QmJO0RoqgV3E/FOF7Y/V8fZYMwSsl9uIUySumeYSOXJ4mJIIvOOzeoWJgUO3OkFOLDd0EELtkG2UKC74j6R2312ffSPv5egJJCfQr+gFdZVnILlAAwBx7I2zJwdYTLyJOM+V6rXW7PyNtF+PfHx8zUfyBCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727392916; c=relaxed/simple;
	bh=uZ6AU+qHxNHc+7ZSbOLvFpKS951bl9x9VeT+GuFOE+o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j7W8Sip0WlzouJa+MM/fMkMf4p/VishzspWecw2AoEDe699oId+zkghUQL5Tcz78qbml8EWERwjLyXCYrHTL6xya6A/87dVPv4xU1ss/Y+Afqc2YkdxfY+dvAhKrVn/b9V+/E1dCph23uodh7h7jPSx677649bNibKHn6eoWmbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P2L05cbB; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P2L05cbB"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5c5c3a1f474so1584779a12.0
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Sep 2024 16:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727392913; x=1727997713; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NM+8ic/Px3mQTsuCcs62/53dsl/B3jVBAf4+IMQjl4A=;
        b=P2L05cbB4DNFfX+0oL98CZMuWcHLnmWB55KH2joGnaNupSLhweGvUe/qw8w/lUq9qs
         EeRLafywmwykMN8nJTXpX0Jkz1hVQgL5TDA47zBANslRcWm6EnEp6X/ZJEpU6QO/9geF
         ZuUGzFB3EYXbinqTSd/EWchOEECsJJuQneLXvZ6NrYkIV6wJI75ZyC2ALNn0EKE4VpvK
         7AnZmjvstQGE9YT1GgL4CuzbNd9Zt4Hz+VRzY0clg5mp32GJCfU16lJjgSrs0jlwp4RA
         qIH3iAjQl2oBDvK3d63eoUa/2W2GLlLXpCLcYFt5oyltTNqrM2ZGZ7zUuCOXcfBQFZME
         O0Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727392913; x=1727997713;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NM+8ic/Px3mQTsuCcs62/53dsl/B3jVBAf4+IMQjl4A=;
        b=NeOCFdzJQ5xS3d/VDlA5Sq/mkeWB9xFGBn3RfHyDF/1GQiWUHZyAb12+NC78p3HmfF
         bFLZOAtGnyXvMXpY4rkm+Q7/rl1gs1Z84fxzEPjSsFq8QHO9HMTDRW5yt22HOrNZQVRR
         Ht8YOrd9BupOwgoCYaybYbIdjdCtAUrsodVJ6Q5V35Kpix+NVAxScqrAQ15vno1zuen1
         cVbdOR/eY9SFukMmZmVJg4IOyuv1tR2Y+Uh2GveWkolpmRm3mBsbiaG32iNXRw4UcgX+
         JavSjvCbOStYKo1Ods+EUUOXZ5lNzuGuBFUR7Lpjp4HC0zZp4I3YFHYY2lNRBnAdl3rL
         y3RA==
X-Forwarded-Encrypted: i=1; AJvYcCW6pbB2JkOMDhyJVzNjBaR9Eb0GvIH6BHiiQ7/r010Tk3FMny4Y/kJtJVB2kKRCsYPT6npUvb22Isy0cg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwG9oFVUHOjOMJZD7kJ1JAfSsTIYSWLP0cRPnlcr/e6vEd4oYgV
	WbZbF2xq8tFgWST065cZPxLzsDkNjFbdkomJ5rRhdENNPfRjL2dl
X-Google-Smtp-Source: AGHT+IEjGS5H1uM127zHsUDENMHQP4peBo2B0LKYmvOBCuq2OU03bEqMYA+oUjVvyxH/GoEWditQPw==
X-Received: by 2002:a17:907:1c0f:b0:a86:aee7:9736 with SMTP id a640c23a62f3a-a93c4ac9334mr83767066b.46.1727392912970;
        Thu, 26 Sep 2024 16:21:52 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3989-b03c-7705-998b.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3989:b03c:7705:998b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27773c0sm50368166b.1.2024.09.26.16.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 16:21:51 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 27 Sep 2024 01:21:07 +0200
Subject: [PATCH 16/18] leds: tca6507: switch to
 device_for_each_child_node_scoped()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-leds_device_for_each_child_node_scoped-v1-16-95c0614b38c8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727392874; l=1443;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=uZ6AU+qHxNHc+7ZSbOLvFpKS951bl9x9VeT+GuFOE+o=;
 b=NGlWdNHQgGpOwQAC3L9GY90Rn3MtzUIW2LrL0gjOsK+kWA98v8Pom7eibl6iKW9m1g68g/UJo
 C3/17jLgkcHBEyM4LlOU2NTx5/2Qx+Dapk5n5sfsJBSp2CMoP1wmmcy
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Switch to device_for_each_child_node_scoped() to simplify the code by
removing the need for calls to fwnode_handle_put() in the error path.

This also prevents possible memory leaks if new error paths are added
without the required call to fwnode_handle_put().

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/leds/leds-tca6507.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-tca6507.c b/drivers/leds/leds-tca6507.c
index 4f22f4224946..acbd8169723c 100644
--- a/drivers/leds/leds-tca6507.c
+++ b/drivers/leds/leds-tca6507.c
@@ -658,7 +658,6 @@ static struct tca6507_platform_data *
 tca6507_led_dt_init(struct device *dev)
 {
 	struct tca6507_platform_data *pdata;
-	struct fwnode_handle *child;
 	struct led_info *tca_leds;
 	int count;
 
@@ -671,7 +670,7 @@ tca6507_led_dt_init(struct device *dev)
 	if (!tca_leds)
 		return ERR_PTR(-ENOMEM);
 
-	device_for_each_child_node(dev, child) {
+	device_for_each_child_node_scoped(dev, child) {
 		struct led_info led;
 		u32 reg;
 		int ret;
@@ -688,10 +687,8 @@ tca6507_led_dt_init(struct device *dev)
 			led.flags |= TCA6507_MAKE_GPIO;
 
 		ret = fwnode_property_read_u32(child, "reg", &reg);
-		if (ret || reg >= NUM_LEDS) {
-			fwnode_handle_put(child);
+		if (ret || reg >= NUM_LEDS)
 			return ERR_PTR(ret ? : -EINVAL);
-		}
 
 		tca_leds[reg] = led;
 	}

-- 
2.43.0

