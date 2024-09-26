Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1184B1B3729
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Sep 2024 23:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727392911; cv=none; b=mwNfkmITqJ6QcC++SCzZCe4zHbnn2nlfWOpICyCvRMAW/4o+oy/9OE9FOeGkK+3XETOGOglZFhMVCyVqudrDBunIgvaEuw4Us653q4CqwoRP8H2faIeIPSrbknYHnL/7XPxQg90RoggSKDI+X/03KdIjEpvSJhrMiIrsaFcdoak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727392911; c=relaxed/simple;
	bh=h1wO2Y5y3snunIjQvp9wEO38mWmGcGSDzqEh5GMe7fI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LpfP3BjUhaxYaCZMnE0/0bmwdqAitORPk/HIZfjO1Dms+DRN6hGrTukqUjBuGdmku5LSDhn3h8ftWW6UED+iuNBm10veSGKMnIgrIP3UD0yv3dNyLWBooddiNmpTuDjCEnoH0vnngenmla0jdegZROQ51r9HVFjYIL7izUa3D8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WfFcdEvW; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WfFcdEvW"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53659867cbdso2495509e87.3
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Sep 2024 16:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727392908; x=1727997708; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hHGLYSMhagE5fSOewtprIrN3fA4YzjKM29kt0KG+UpM=;
        b=WfFcdEvW/6Kyd0Is2jOU7y57U0WDTmwhAtrTt+osmEfn8m2v57Knfp59CGB1NZob67
         DZ32dp71NG4+NLiV78efUOQBkuUVeAmLYGPjIVu8Ja7ypVzICAG9CkfChWJpYhoecZgA
         N0XTqOj2LWfnYg+69F5otR0yqXEv4uJlKDKfBZEQ+JZz7ymxj+vRmZQR9Rl3PuFA9JEd
         VRctnqQX/XQ5fsyEKIcJ6s2dsrxHup/SDsTC9KnvQGfWMQ0lH+1Yp3u4UIKgGzUbwxOw
         PG+7oLPeO1JHDQstYRyS/85m+D+hJqlTDnYG/EHaQybjR2nCc30FC2yPm0nuD2GfsfYb
         sHeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727392908; x=1727997708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hHGLYSMhagE5fSOewtprIrN3fA4YzjKM29kt0KG+UpM=;
        b=FnTI0YKqYEog5O7Gw9w/xs6bp80Tooq9UCNrTN/VKPNZLODKsoLs5jRGmuoGB/vVSz
         FYm2Sn+wH1Zwy6VvMlAQuwqRpv4CqEhfVtbI//f7Y1rzXSC3gSsJMACcV+LPgG+tLmJ+
         jEOMlIwxaC4EqvuZmKPdYOXr33ZffpmCg52FmvHVhCEbB298m6lIxMkIzmtrV/lbZQU2
         mt6c0HXjf9uUI0N5JsMCb3FLns4JorSoXsn0twLfrd/De1QT/Eh9Yud5GDNZwkLtuI4x
         9AkufvxqAkx4wOmDLD2mwud3s/sQz/ZfHgSa34NcJ8gh3l8baEtHOQstZUab9HgpnD2t
         xpiw==
X-Forwarded-Encrypted: i=1; AJvYcCUbUTuFUQsaQmCt5ACEZxKSnY2+Vv4AOA+kgG6jAKm3gpaTh51/J6zMtSnlyKFtfrJCaTsYILBaFzwpbQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+OV/DAwHzKkVwqBskOyA2AjJ0q4p4orhmIjNVXTHysJMH7c6X
	n9WUyOS6CzA6A5dzkqbL4llVr9u5Fe4EglOlgU57veqt4ufQTejW
X-Google-Smtp-Source: AGHT+IHlD2G2E7GSRoMpuBNsI0X5mi6Ua8JvRQEFmnFC/8WxUbT+wMtBf0onF8DjiKH20jT0Ia2fqA==
X-Received: by 2002:a05:6512:3d8d:b0:52c:9877:71b7 with SMTP id 2adb3069b0e04-5389fca4475mr1025221e87.59.1727392908032;
        Thu, 26 Sep 2024 16:21:48 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3989-b03c-7705-998b.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3989:b03c:7705:998b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27773c0sm50368166b.1.2024.09.26.16.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 16:21:47 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 27 Sep 2024 01:21:05 +0200
Subject: [PATCH 14/18] leds: pwm: switch to
 device_for_each_child_node_scoped()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-leds_device_for_each_child_node_scoped-v1-14-95c0614b38c8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727392874; l=1845;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=h1wO2Y5y3snunIjQvp9wEO38mWmGcGSDzqEh5GMe7fI=;
 b=J1kuyS1rctHLvv769c4EZm6T2XBPkiw9ibZoWkMdEGXw3txrJVIYnZXZTRhRj50ABFFbr7IzF
 VoKASt4M5y0BuAGDuF4YB9A9l9nGY60szrd+yDBg2/dQb2i/6z43d4J
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
 drivers/leds/leds-pwm.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index e1b414b40353..7961dca0db2f 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -140,21 +140,18 @@ static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
 
 static int led_pwm_create_fwnode(struct device *dev, struct led_pwm_priv *priv)
 {
-	struct fwnode_handle *fwnode;
 	struct led_pwm led;
 	int ret;
 
-	device_for_each_child_node(dev, fwnode) {
+	device_for_each_child_node_scoped(dev, fwnode) {
 		memset(&led, 0, sizeof(led));
 
 		ret = fwnode_property_read_string(fwnode, "label", &led.name);
 		if (ret && is_of_node(fwnode))
 			led.name = to_of_node(fwnode)->name;
 
-		if (!led.name) {
-			ret = -EINVAL;
-			goto err_child_out;
-		}
+		if (!led.name)
+			return -EINVAL;
 
 		led.active_low = fwnode_property_read_bool(fwnode,
 							   "active-low");
@@ -165,14 +162,10 @@ static int led_pwm_create_fwnode(struct device *dev, struct led_pwm_priv *priv)
 
 		ret = led_pwm_add(dev, priv, &led, fwnode);
 		if (ret)
-			goto err_child_out;
+			return ret;
 	}
 
 	return 0;
-
-err_child_out:
-	fwnode_handle_put(fwnode);
-	return ret;
 }
 
 static int led_pwm_probe(struct platform_device *pdev)

-- 
2.43.0

