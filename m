Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7B01B3B03
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Sep 2024 23:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727392918; cv=none; b=g0l5kH9TZRZOVfzxgtAxdTGne6rxDBR/irk1f5ocM6j5ZI19ePymSn6B7bFjib4xt6JtZ0qZ5gaDQ/t+3Q2QrSmVnFA0GIZIeS7LozK981M6zaTEp9uUYY5ldp0I5YKynCwI1ayivLpVStLHOizIZXQcwU99QQffvaRWtTOKHv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727392918; c=relaxed/simple;
	bh=Upol74WYOlhW6c4peUbPQECrXBC2IELBkPGR+0SYZwE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rBdCz6oTriq3SA72H0uCXOtczQc0AxCCiHFkDgFvN2rbH+N40Pa+qAdoL3fX50in0GKx7623ZMp3/AVg0/n8LYLSszbufBMyLw1NIJLgEX40cquh2Y5CRcArsQOykjRe15/6xlb46sZjXx6dF9PXDlJRmSy7RHDbfz0iBjxXpnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gKKheJSg; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gKKheJSg"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a8d4093722bso207942766b.0
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Sep 2024 16:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727392916; x=1727997716; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WkHqvkI/1/i2Yqceu5g2GJiVANgvtprMciXZ8BQ+brY=;
        b=gKKheJSgGpooGTJvm2Iyj8ok8kkh38h82h7e6giY4w+R+2PpFCIkANU3CajDYoOmC9
         +GxN0C4h85efZrDSVW0op+FiE8cKH/kG+Pz1IBMWvi5NurzHaYyBAqTJeUONzCKl3Vyi
         Nu3D5hOUpfMZxmDpbdaAn8BT9zcZ4L72Mj1jDtLilFp/+EvkSPEzhEeEdqvw9xChTcda
         nTUYStygt1MAValBzHozSB/qJn6bKajDywEB1hbHWmZyxu4nYHJ/PqdEB0OIw355gaMY
         0j41+8znt+A3ACpP/0PWWk6Qu5/5DBcN4CmPKut2gVNifQCX9mw1iylPypX02LhRqSk8
         Kmcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727392916; x=1727997716;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WkHqvkI/1/i2Yqceu5g2GJiVANgvtprMciXZ8BQ+brY=;
        b=rCa2NUMqsvJzWwZQaiGsSoQmo2jWSA1gImlE/A0YNycwNzIHBT/eDNYMyEqrN3yAhV
         0RDOaHIPPEssEbrmblOPk6H9wDBPmaSnzNBUFy1AYVAFzrAox1Fi6jgf5Iq52mkIoM9g
         t1cIUp76olrmjUpUDg4J3m0Jb7cIpbsW+QIC6IJd/F5HJegLjNvDSlE6GlvcNNvsKlp0
         ijgr/Y1FnodzFQOiTXS+wvN3hZ6WTvQ1crNh6GQ4ha2BVIP1rYxYixTWQTtADICCC1tU
         0hv+HzSHC0t+SN9Qc4tPa3xsnFPoQg6JhiW1zbcAP88BIv3mbVPpXub6Oby5QPvBcpO1
         QgGw==
X-Forwarded-Encrypted: i=1; AJvYcCVqs8kY29qLxreYdPKWgrFg8oc1CMx7uNDaEDROvBra6iNt/3c74Cr2khWRLO3VnzzIB2WuWOmPejAg/w==@lists.linux.dev
X-Gm-Message-State: AOJu0YxnfJXPBAjoev2LMvungjm+wH4H1QLR7iyxZlt1ycSs7XXuh55M
	XSmueTsfZ++92v7wOD6LVCqnCrR1qnjKWMJKwPK3LlHB4laCiuPvG959CmWA
X-Google-Smtp-Source: AGHT+IHu7GUf4pEGuh3ajW4RTtn5QFJeznBoUNPfpuLLhiJAhuYOKyTqQymBYsqixg5g1+2YdfLoVw==
X-Received: by 2002:a17:907:7b91:b0:a86:c825:7678 with SMTP id a640c23a62f3a-a93c4a98df0mr96575666b.64.1727392915679;
        Thu, 26 Sep 2024 16:21:55 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3989-b03c-7705-998b.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3989:b03c:7705:998b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27773c0sm50368166b.1.2024.09.26.16.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 16:21:54 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 27 Sep 2024 01:21:08 +0200
Subject: [PATCH 17/18] leds: rgb: ktd202x: switch to
 device_for_each_child_node_scoped()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-leds_device_for_each_child_node_scoped-v1-17-95c0614b38c8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727392874; l=1313;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=Upol74WYOlhW6c4peUbPQECrXBC2IELBkPGR+0SYZwE=;
 b=f5ds5pKXTIF+B1jMaYwlb8PPJAHi7VfKk6RXlM18dKn8C3IQVGT8JccELHUU4Z+ooOWcfqKQS
 27cVaVRUn+uAh7+rCzd53VFlBKfzGLxtf5g5DJWnaFLJwjdJFD+8kOV
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Switch to device_for_each_child_node_scoped() to simplify the code by
removing the need for calls to fwnode_handle_put() in the error path.

This also prevents possible memory leaks if new error paths are added
without the required call to fwnode_handle_put().

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/leds/rgb/leds-ktd202x.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/rgb/leds-ktd202x.c b/drivers/leds/rgb/leds-ktd202x.c
index d5c442163c46..04e62faa3a00 100644
--- a/drivers/leds/rgb/leds-ktd202x.c
+++ b/drivers/leds/rgb/leds-ktd202x.c
@@ -495,7 +495,6 @@ static int ktd202x_add_led(struct ktd202x *chip, struct fwnode_handle *fwnode, u
 
 static int ktd202x_probe_fw(struct ktd202x *chip)
 {
-	struct fwnode_handle *child;
 	struct device *dev = chip->dev;
 	int count;
 	int i = 0;
@@ -509,13 +508,12 @@ static int ktd202x_probe_fw(struct ktd202x *chip)
 	/* Allow the device to execute the complete reset */
 	usleep_range(200, 300);
 
-	device_for_each_child_node(dev, child) {
+	device_for_each_child_node_scoped(dev, child) {
 		int ret = ktd202x_add_led(chip, child, i);
 
-		if (ret) {
-			fwnode_handle_put(child);
+		if (ret)
 			return ret;
-		}
+
 		i++;
 	}
 

-- 
2.43.0

