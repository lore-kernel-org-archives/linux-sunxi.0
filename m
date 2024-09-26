Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7191B3B29
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Sep 2024 23:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727392920; cv=none; b=PxB4lxExwdsWbRnethHRyUM04ssUkg3itt/xOltmNth5KNYp8HxQAe1BwTH32xGNPDXweOPxN0Qe6k3KvRmucXblbBQ3agRk9HeYPdDGDq9pDPPs3fqIW2XwOaSybaX+HeT0bbfHd/+WmjPG0X7qHPmXwKJS+1P3pFAa6fxAieA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727392920; c=relaxed/simple;
	bh=PSVqt2hzPQNutXFJ1ySerbu1QMLwioqVyiO4z6jxrQ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r3CD6ZPVDhtPCwG9sefp6teC6+k2L7tVWqj+zwEI/qD6WRhcLzUs+2Q0wXscjqkVzti3bZS4FJ9AJ34t0mtUAfGXgITQUmMSpqFepjlSaRHJfBbwvorWxtMwRFwh+YdGiTGfphkngjiaQ46wKXkoUbni7d69fbQ2tOWmCZn44Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nnVLrtiF; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nnVLrtiF"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a83562f9be9so137032566b.0
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Sep 2024 16:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727392917; x=1727997717; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gsf1H9vGvMDgxqrrd3JfvSIa5200NszB5Zt97OWrjd0=;
        b=nnVLrtiFgPRaqzS01ZR8W3gHWTj9uYNmJtWKD/98OfhL6xHuhRMds9yCVlxGInMXjo
         Jcy3Y9ELnvlbZ0bg+MIBxSqRwrQ8x531Lo1AtU9Lm6Zd/h7shJqiDm1YtN+YoMfuI/zi
         DULYBUgYqX/UcLqNTDI1BdQlrBI86AurBvSLCuBbMgOPuLvxa7zUq/y8BTfRDm2mvKzU
         rIeriSZ5rNzWLPQLucMFCo+wYTlJm39p4VBmMM3B/cbPigAreLORiI0yhsqfqzPUmFmN
         U6vz4cbsq/cUVbzhLrTHM/JBFK40YhXoXBq0RsJwwf7HFTlM1UedFV1j08w/iD1vp0JB
         nRJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727392917; x=1727997717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gsf1H9vGvMDgxqrrd3JfvSIa5200NszB5Zt97OWrjd0=;
        b=ceWF8eY6FZc1E6k4IryrkZcYubER9cyISPIgVbgjrHsBZiFkMUdbXZ6J0SCwBCeqLV
         SzgPxmvH83j16UyKmWf9QE/UOr32FE9MsZtwlcFwQ9o/nvqPFPTPwnUEnhWTITQHWdVe
         MCGJvlJKfmo2U86ynW+q2fpdilcfibrZOXrDhSvlwHeqP3G3jcOxwlrbdoK6fNFasqXP
         cpzHl5TsT05QHz9qj32ELmwqqhvzcufIdqhFUkHZ+LaZTk1+SxCAba0i8EpZl6wBbIKC
         jF+7tyIrcgjtb1QXVvr2K+31COFTlOMyo/j0IFSrwJEIApX7yZqjG5fILt6pQQ7ogdU/
         geSA==
X-Forwarded-Encrypted: i=1; AJvYcCW/gw8D5qdivRvmtTSquSyV0UiiV41fNsmcWpq332OwKGN4S3nTejKDqOh41indTYD2q753wMDKQhhhrA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzulsrYd7xnBAjDrO306qo/o4UIf1H43XrZ3mfnl0NUU0FH0epP
	23WlPh+JHsMRR00ABwRU+WaOHcQz3hBmT130viNCJj5bEUh2PcCC
X-Google-Smtp-Source: AGHT+IFFYGWgxNe3W6HVZ9vKaXN55rWL1eirSET5THcsDSbxqgt+Ehox2JsTuD01KAWPP5hH/gwWVw==
X-Received: by 2002:a17:907:320d:b0:a8d:128a:cc23 with SMTP id a640c23a62f3a-a93c4c2d809mr96338766b.59.1727392917484;
        Thu, 26 Sep 2024 16:21:57 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3989-b03c-7705-998b.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3989:b03c:7705:998b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27773c0sm50368166b.1.2024.09.26.16.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 16:21:57 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 27 Sep 2024 01:21:09 +0200
Subject: [PATCH 18/18] leds: rgb: mt6370: switch to
 device_for_each_child_node_scoped()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-leds_device_for_each_child_node_scoped-v1-18-95c0614b38c8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727392874; l=3209;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=PSVqt2hzPQNutXFJ1ySerbu1QMLwioqVyiO4z6jxrQ8=;
 b=CwV0EpzUvZAO2Xr3Lvw35f2AWkJgxILgyeJ44eQr3MbK8h5/RqojjHPTG/zr0owvVEhgiQYxU
 1I/cZWn0KknD6O57SSfoyl0TPR+QYf61STH2RPg5oIKED+kOJG42L2i
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Switch to device_for_each_child_node_scoped() to simplify the code by
removing the need for calls to fwnode_handle_put() in the error paths.

This also prevents possible memory leaks if new error paths are added
without the required call to fwnode_handle_put().

After switching to the scoped variant, there is no longer need for a
jump to 'fwnode_release', as an immediate return is possible. Given that
the loop is called in the probe function, and it already uses
dev_err_probe(), the common "dev_err() + return" has been updated as
well.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/leds/rgb/leds-mt6370-rgb.c | 37 +++++++++++--------------------------
 1 file changed, 11 insertions(+), 26 deletions(-)

diff --git a/drivers/leds/rgb/leds-mt6370-rgb.c b/drivers/leds/rgb/leds-mt6370-rgb.c
index 359ef00498b4..fe76e8e27f9c 100644
--- a/drivers/leds/rgb/leds-mt6370-rgb.c
+++ b/drivers/leds/rgb/leds-mt6370-rgb.c
@@ -905,7 +905,6 @@ static int mt6370_leds_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mt6370_priv *priv;
-	struct fwnode_handle *child;
 	size_t count;
 	unsigned int i = 0;
 	int ret;
@@ -936,37 +935,27 @@ static int mt6370_leds_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to allocate regmap field\n");
 
-	device_for_each_child_node(dev, child) {
+	device_for_each_child_node_scoped(dev, child) {
 		struct mt6370_led *led = priv->leds + i++;
 		struct led_init_data init_data = { .fwnode = child };
 		u32 reg, color;
 
 		ret = fwnode_property_read_u32(child, "reg", &reg);
-		if (ret) {
-			dev_err(dev, "Failed to parse reg property\n");
-			goto fwnode_release;
-		}
+		if (ret)
+			dev_err_probe(dev, ret, "Failed to parse reg property\n");
 
-		if (reg >= MT6370_MAX_LEDS) {
-			ret = -EINVAL;
-			dev_err(dev, "Error reg property number\n");
-			goto fwnode_release;
-		}
+		if (reg >= MT6370_MAX_LEDS)
+			return dev_err_probe(dev, -EINVAL, "Error reg property number\n");
 
 		ret = fwnode_property_read_u32(child, "color", &color);
-		if (ret) {
-			dev_err(dev, "Failed to parse color property\n");
-			goto fwnode_release;
-		}
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to parse color property\n");
 
 		if (color == LED_COLOR_ID_RGB || color == LED_COLOR_ID_MULTI)
 			reg = MT6370_VIRTUAL_MULTICOLOR;
 
-		if (priv->leds_active & BIT(reg)) {
-			ret = -EINVAL;
-			dev_err(dev, "Duplicate reg property\n");
-			goto fwnode_release;
-		}
+		if (priv->leds_active & BIT(reg))
+			return dev_err_probe(dev, -EINVAL, "Duplicate reg property\n");
 
 		priv->leds_active |= BIT(reg);
 
@@ -975,18 +964,14 @@ static int mt6370_leds_probe(struct platform_device *pdev)
 
 		ret = mt6370_init_led_properties(dev, led, &init_data);
 		if (ret)
-			goto fwnode_release;
+			return ret;
 
 		ret = mt6370_led_register(dev, led, &init_data);
 		if (ret)
-			goto fwnode_release;
+			return ret;
 	}
 
 	return 0;
-
-fwnode_release:
-	fwnode_handle_put(child);
-	return ret;
 }
 
 static const struct of_device_id mt6370_rgbled_device_table[] = {

-- 
2.43.0

