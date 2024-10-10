Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D61B1EABA8
	for <linux-sunxi@lists.linux.dev>; Thu, 10 Oct 2024 21:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728595578; cv=none; b=ptQ5E3DX87OGpoztz4pXmRBHC4YrwfT0q4XlifeFZ03Rxw3jx1Tza66zwzGw+Hig75n7aEVBYNYcxI26x0xGa3hKnAfFukhGsNOo8G/kx/NZfQHHyNNucsFfcmKH8/Kx10eZkG7VB9O8H3VrsdTGeUs1cFvDjpuXibBe30nuPzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728595578; c=relaxed/simple;
	bh=TCHsuzKnwrSzC8ELBgoH5r2aJODW1HU03jHewVR1CdI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mJE4VLJkVE2shWEhxH6xu/ACaFMHJNALxkoio9a6T0nufPQWEUj631NGjyx7uAadbXoIz29g7plACEz5BvkD21iB/KqwbAzUgdr9aaYwh5MscsJh/QMX2SsRFNye4JC1Vp4mkcrtOGGsQlpJOXuZoyDK+v8S2c9E4RlH+F1O+vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d6CjFYgW; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d6CjFYgW"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37d375ecc5eso884411f8f.3
        for <linux-sunxi@lists.linux.dev>; Thu, 10 Oct 2024 14:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728595575; x=1729200375; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vDpMMaqPXUoFVzi9A3PDhKb1T42MjqvUb4kdLnoWycw=;
        b=d6CjFYgWwXBYotBjOmP7mQLAaMW8yIT5fjGKDWQfap/2dd98peL6uZ1DuCdP0Cn9qM
         9rLYMNCMOjK13jygfRaN1F6/qfg4myNhyHiXpPUGb9EKXL6ZcBhLYOojQp39UTbsFtX2
         I0yIHO6gem4Rq8zD6rQP653WF6z7AHb+tTesqjRXyG78fGrjFY2y5RXcaCcdv79KVxBk
         CeM0FKox5t6Mrcs3/AzY2xINdUd3HmfiGrvgf4X4anBXtOH9KVUFzyjOBA1OekZ2/+f8
         NVctWYB/YItU7YFEg8LO1tsvh+vUwc7pr71P1tOVrIPzrkZYtIF/OqEONKQPt8CCO5LZ
         ZbLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728595575; x=1729200375;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vDpMMaqPXUoFVzi9A3PDhKb1T42MjqvUb4kdLnoWycw=;
        b=grjGSiZlqpL+WN7wULodgd/7W0m5u0vuFZj4+VayI/7cJGUJiIlGAutIaT4oTwk7fx
         /lips6qaolhkTrrRZJrI5GORXabwK5300io+dHjHbG+xDgO4qpUTfeT5MefR8mA0Uuhi
         rR1feWiORCkrE3kL1kQhpSMnFGE2Ng1wAW+PLimUfulM+Pymsd4JxZDrj5gIygBm84KR
         6cw3EMY4bGdEs1V7Qh9GULuajqasLyCUD+OEVM5BH3AAvuYOdqKTrfgJVbXjgZNTMvR0
         Vc7U46PCE82vpZR/RXTZGS03E0e3blGDLxZP5D0cfBpLv65InmDmYDl7vU7BeWeG1OFM
         INoA==
X-Forwarded-Encrypted: i=1; AJvYcCVTFBq4LMJYLiHqZJKXx2CglAhVkR2/lQskkWGO07JXBY2fnlpuJeqNYa9EE3R07FKzHS1fBarBk6wLBA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyWHvdoxraKX2BV8brw8/oL2XCZ7ZPMF9fRYf4zHaZiDIweU753
	LO+o1/kXAcRSUgjPMlmoY0YHqvQmKFtr7z8M9fbjYXUUWiEvdqLz
X-Google-Smtp-Source: AGHT+IHdMahvsk2hiPcLQLFTajRterRsAVRoLlPSao00sFi2GHvdnhGLq5Smgs1qAUipDrz8egxq6w==
X-Received: by 2002:a05:6000:1203:b0:37d:4e03:635c with SMTP id ffacd0b85a97d-37d551d512emr359593f8f.21.1728595574599;
        Thu, 10 Oct 2024 14:26:14 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3d08-841a-0562-b7b5.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3d08:841a:562:b7b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6a8940sm2402083f8f.6.2024.10.10.14.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 14:26:13 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 10 Oct 2024 23:25:57 +0200
Subject: [PATCH 07/10] Input: 88pm860x - use cleanup facility for
 device_node
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-input_automate_of_node_put-v1-7-ebc62138fbf8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728595555; l=2328;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=TCHsuzKnwrSzC8ELBgoH5r2aJODW1HU03jHewVR1CdI=;
 b=xHiUPq+0uEXEYbsSevTTOS03OD5A3ZbaOvxx2BJWcX2dzwkxmfC/OCrEYTRrgYVjPrjRoPxHD
 FE5yXQzgkTbBtgRrI9dLa6stp5BoMUgaC+F6ClAuNoxJm5fgiV8x+tC
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Use the '__free(device_node)' macro to simplify the code and error
handling. This makes the code more robust by ensuring that the device
node is always freed.

Drop the first assignment to 'pdev->dev.parent->of_node', as it was only
a shortcut, and tie 'np' to its usage as a child node.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/input/touchscreen/88pm860x-ts.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/input/touchscreen/88pm860x-ts.c b/drivers/input/touchscreen/88pm860x-ts.c
index 81a3ea4b9a3d..0468ce2b216f 100644
--- a/drivers/input/touchscreen/88pm860x-ts.c
+++ b/drivers/input/touchscreen/88pm860x-ts.c
@@ -117,13 +117,14 @@ static int pm860x_touch_dt_init(struct platform_device *pdev,
 					  struct pm860x_chip *chip,
 					  int *res_x)
 {
-	struct device_node *np = pdev->dev.parent->of_node;
 	struct i2c_client *i2c = (chip->id == CHIP_PM8607) ? chip->client \
 				 : chip->companion;
 	int data, n, ret;
-	if (!np)
+	if (!pdev->dev.parent->of_node)
 		return -ENODEV;
-	np = of_get_child_by_name(np, "touch");
+
+	struct device_node *np __free(device_node) =
+		of_get_child_by_name(pdev->dev.parent->of_node, "touch");
 	if (!np) {
 		dev_err(&pdev->dev, "Can't find touch node\n");
 		return -EINVAL;
@@ -141,13 +142,13 @@ static int pm860x_touch_dt_init(struct platform_device *pdev,
 	if (data) {
 		ret = pm860x_reg_write(i2c, PM8607_GPADC_MISC1, data);
 		if (ret < 0)
-			goto err_put_node;
+			return -EINVAL;
 	}
 	/* set tsi prebias time */
 	if (!of_property_read_u32(np, "marvell,88pm860x-tsi-prebias", &data)) {
 		ret = pm860x_reg_write(i2c, PM8607_TSI_PREBIAS, data);
 		if (ret < 0)
-			goto err_put_node;
+			return -EINVAL;
 	}
 	/* set prebias & prechg time of pen detect */
 	data = 0;
@@ -158,18 +159,11 @@ static int pm860x_touch_dt_init(struct platform_device *pdev,
 	if (data) {
 		ret = pm860x_reg_write(i2c, PM8607_PD_PREBIAS, data);
 		if (ret < 0)
-			goto err_put_node;
+			return -EINVAL;
 	}
 	of_property_read_u32(np, "marvell,88pm860x-resistor-X", res_x);
 
-	of_node_put(np);
-
 	return 0;
-
-err_put_node:
-	of_node_put(np);
-
-	return -EINVAL;
 }
 #else
 #define pm860x_touch_dt_init(x, y, z)	(-1)

-- 
2.43.0

