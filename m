Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2081B1D4B
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Sep 2024 23:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727392894; cv=none; b=Nz68Zwjc+oBOhCO5Nq52a4L960sHMiJrXy/2Eo4aGEgmAzqHCE6QZABkPL8arWrZJIg+ecOXLqS99aXDdo0rN5+W7od+sHc1YycNBS65l5kINX5RyAZhBcUsA6sdZ2rkngv8xOyOgwHjlCGJPOuYqzzagrqScZiXz2j8/J/lJR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727392894; c=relaxed/simple;
	bh=V8haQmgnRaMTwlG5K1E7vGaVHwPa1IZaQXMfy8Pe7ck=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=poNoupFvMEXL8RrzVyPyg0B4UwkMyydW8Vh4kyeFO6ASHvhhUM+QM1oE/ge+XcjmsSUt+qkxpcKB/NfkvcV4IvSuSF1MlHgGM0xy6Pq5ZJAkqwAsvLHo7xLrCL2ajr4Q6I40yCUaCUrkJMxTNKOufMwMjM7eg/fvAX8BT5gjzc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BnXIATjy; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BnXIATjy"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a910860e4dcso215217966b.3
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Sep 2024 16:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727392891; x=1727997691; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SJpECgac0QWqDyY0V1N/RenFz/N/de4tQaF+Hl64Xww=;
        b=BnXIATjy8Dfgv2eBTuAt14joKbhyJ+enAMhukuVkRMAzD1kqkNHw9tNu+qQIvgF3Zd
         kPAwThiZE85mTJS41sLiDIlVAhNHN+eH81txbCQSbHtkcez8Po+NJ/Vn+s1ZZm0MlN8c
         kKIeSYBwstnfmcvl0OqBLc8Jhk9ZKWHS9QKM/jQY3UGw+EAf/JGlySeZNIVgAIpomBA5
         pFsGCcm5eOGw38lbvAC6MWWYTB+pKERLld0S7nAoNl3tLSNcJ60+yBsPIYb07hoqHqTK
         xew70iu5/T2iuv/ZgUpOGFtMYM82UfD0uQVd590/s7p3SD9orUyuGuFfKnkun0D/1k8O
         DuEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727392891; x=1727997691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SJpECgac0QWqDyY0V1N/RenFz/N/de4tQaF+Hl64Xww=;
        b=vNkbDwFUz4eXWS13gYPy8BptaCGwLfq5G/+Qj0H8YHqnAPxZ6hD1hilS26MMuJKTeC
         bgzfQobn53cSrdIwihsDilIdOsgg4K1E29hbApI2ClqemtXaHZAX4Nv1Etax4+aXSloX
         NQZEbmv/527xeTL7PjoKZblEtofIt5DzSwM7I0nXXHIAwvaZPPs9stb8auLi2HqB8jy6
         ayA2s9bwcwdfU1jcI/6Kn5alfnbaXdYrQU64nwkG1hPj0rUi9EadHCphC3O5yhCVGYUR
         Ujt0z7M/0u1pm2Hor1QwlSQW+/LfLPCnP/7NhDNNPX5esBky46JW4ZgkY7gaLOVS38Dn
         tdzw==
X-Forwarded-Encrypted: i=1; AJvYcCUEVG+TYKcTW/KQ/wG4Ohn/PtBRzM1fgX6BqMusw7zPMEP+BA2p48o0MA9gE1m32P6zIjLZwx4g+KTsTA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzzCck8FX2VPPqaMFYL+kNYnMqLrvC6iOCiIwIRaOFfJiMZRe6C
	sBENrjKs9sHPw+bjjBhpgmw2llkehzdDqW9/lFCXmA/RH/19Ucbu
X-Google-Smtp-Source: AGHT+IGSWoR1fCEWrIDtr8bTLXKGUTs29eDV3zKtmwo1hMD14zDFeQuF3IPtFA71mpm1QVUnbVuMZA==
X-Received: by 2002:a17:907:2681:b0:a7a:ab8a:38f with SMTP id a640c23a62f3a-a93c4a67dcamr84483466b.41.1727392891222;
        Thu, 26 Sep 2024 16:21:31 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3989-b03c-7705-998b.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3989:b03c:7705:998b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27773c0sm50368166b.1.2024.09.26.16.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 16:21:30 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 27 Sep 2024 01:20:57 +0200
Subject: [PATCH 06/18] leds: el15203000: switch to
 device_for_each_child_node_scoped()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-leds_device_for_each_child_node_scoped-v1-6-95c0614b38c8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727392874; l=1939;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=V8haQmgnRaMTwlG5K1E7vGaVHwPa1IZaQXMfy8Pe7ck=;
 b=sTqeCbZp2AB1Bc5Bt7/iASwDkXreNOXxX6b+ivRKl7l5AcLYxvapJeVNieVkPiZPuXREO5n0U
 8lb5CaGQyzlD8lCR4pv1xcQkTYZrQwZmlV1zDdjGoSHCfLUUuJ9Nwts
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Switch to device_for_each_child_node_scoped() to simplify the code by
removing the need for calls to fwnode_handle_put() in the error paths.

This also prevents possible memory leaks if new error paths are added
without the required call to fwnode_handle_put().

After switching to the scoped variant, there is no longer need for a
jump to 'err_child_out', as an immediate return is possible.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/leds/leds-el15203000.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/leds/leds-el15203000.c b/drivers/leds/leds-el15203000.c
index d40194a3029f..e26d1654bd0d 100644
--- a/drivers/leds/leds-el15203000.c
+++ b/drivers/leds/leds-el15203000.c
@@ -237,22 +237,20 @@ static int el15203000_pattern_clear(struct led_classdev *ldev)
 static int el15203000_probe_dt(struct el15203000 *priv)
 {
 	struct el15203000_led	*led = priv->leds;
-	struct fwnode_handle	*child;
 	int			ret;
 
-	device_for_each_child_node(priv->dev, child) {
+	device_for_each_child_node_scoped(priv->dev, child) {
 		struct led_init_data init_data = {};
 
 		ret = fwnode_property_read_u32(child, "reg", &led->reg);
 		if (ret) {
 			dev_err(priv->dev, "LED without ID number");
-			goto err_child_out;
+			return ret;
 		}
 
 		if (led->reg > U8_MAX) {
 			dev_err(priv->dev, "LED value %d is invalid", led->reg);
-			ret = -EINVAL;
-			goto err_child_out;
+			return -EINVAL;
 		}
 
 		led->priv			  = priv;
@@ -274,17 +272,13 @@ static int el15203000_probe_dt(struct el15203000 *priv)
 			dev_err(priv->dev,
 				"failed to register LED device %s, err %d",
 				led->ldev.name, ret);
-			goto err_child_out;
+			return ret;
 		}
 
 		led++;
 	}
 
 	return 0;
-
-err_child_out:
-	fwnode_handle_put(child);
-	return ret;
 }
 
 static int el15203000_probe(struct spi_device *spi)

-- 
2.43.0

