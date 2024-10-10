Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C0F1EC004
	for <linux-sunxi@lists.linux.dev>; Thu, 10 Oct 2024 21:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728595584; cv=none; b=UivQbCCFnljTCwa09ggLSuvBQ4gp2gXqSAtYWaLlYezNXksPLVIbRu92GDT3cYUv/ilfA38arTJIZzvc2Exkla8gJSHf8ZoncQ6v4zrNJSZjIc7Dj608L39N5K5Y88fn9Ro4/vnF4gRvECGy7U2/satsZEJ+0v4YUrfJMwhD7M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728595584; c=relaxed/simple;
	bh=4o2z0ObAz6CPUNa+/NOKjLjAT/4Z8Sf5d/THzPhhJlQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u0ocQTSzuCUQHfJHj2L5qRdA5+0igEI0HsPt0xP2cT46mC15CtfR3mlGb9xHTUeeVkQZ7TuIvkXW19eIOCNQuYTdTNF0N/cN+hgmVNgC0gNrdOQ+0/Su4BL3HWwl3ANb1jHiiBYwo9zWZaUH6lzrTd8Ghxbvgq8e3Rgs0pGMaZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=URzjhF+Z; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="URzjhF+Z"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43117ed8adbso11824535e9.2
        for <linux-sunxi@lists.linux.dev>; Thu, 10 Oct 2024 14:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728595582; x=1729200382; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0+l713dFhBMpKSXKC6Fm7N/NzG3LTu7+MrLDSBO7iRI=;
        b=URzjhF+Zz8YDVuCxtGJa4H5yt6U0gE5VzINmfQzH9KS+3xO2Rq55wdG69SWUz+57bY
         7X1Fqj+efRBs2cDnapnXWcoyWJcJAUAEoVl9/Q1vn/d3WJPm3wHU7GVdyLBCDdvCKl6Q
         OnVHUVQnxQVV2wKM6MCADPiLSPmv+WUjUg3d5WCti7dBFBqjXipesaYJ7xjkHDvQUzd5
         9ajUYHf3Ez4NLh5lcqcAzYg5aVWnbNzWuf44DVVVO2VJ/G/4cDkVvyaEk1IOKdTPfunK
         HYCBfey+ie76LUP+Q94XqgGt72l1kQY6TtExilgBymlZG5JCqkaP0BFVsMjnnb0QmpnB
         kTwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728595582; x=1729200382;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0+l713dFhBMpKSXKC6Fm7N/NzG3LTu7+MrLDSBO7iRI=;
        b=YNLar8Ocy0H94yNPhWHc3ioxwO01k86wkdPGU/tRlxukICQL8IlX5FzhcrLS+T0pK2
         95HYieNtZIkqvkpFG8JyO65v5i2VANPp/s2B2NrSn5KPnr2pHX2TayvJevRIyswtcMd8
         H1HFO7+CpHaGsaBNH3zNoDU8939M4Fk/nTctploo031D17MqI/axx6yRg3tvj1RdChwT
         uaQ0QKuwzDj4BGA8ThPGZiev70PesifCZFMipuylxlxL+fxha5PI2gorOV7p1Hkq3gFe
         /nsAyYyEW7szXprCzjTkhSYOhpTLQ51njVcu0t4Htfb31ppw8yDygJlxnQ8gBmuWIIXT
         hwGw==
X-Forwarded-Encrypted: i=1; AJvYcCWRlH0c1rONz/VdxfhC09CgqLhtIQunorM9su0mp239h0FHss7srcDJblLEaFyW8QlxKzJodC/SoMl/Vg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6SiYcQrM1UOFcKM4fMmihaFh/r+yKXFCRPRkyuqwD5s9TemEy
	/T0qyS57W/SRN95kqcg9ON7datTFVC/dXhQ675ud2SmQHoWHufoF
X-Google-Smtp-Source: AGHT+IEvJZkGPBj6pO8V1hiWxBTo3gFi3FsJ4y5Lja3Q/V2mIy4xGoBh/d2/6Gut5mAv35qY3Oj9lw==
X-Received: by 2002:a05:6000:1a8b:b0:37d:511b:aec1 with SMTP id ffacd0b85a97d-37d552adfacmr460647f8f.45.1728595581715;
        Thu, 10 Oct 2024 14:26:21 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3d08-841a-0562-b7b5.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3d08:841a:562:b7b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6a8940sm2402083f8f.6.2024.10.10.14.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 14:26:20 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 10 Oct 2024 23:26:00 +0200
Subject: [PATCH 10/10] Input: ts4800-ts - use cleanup facility for
 device_node
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-input_automate_of_node_put-v1-10-ebc62138fbf8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728595555; l=1226;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=4o2z0ObAz6CPUNa+/NOKjLjAT/4Z8Sf5d/THzPhhJlQ=;
 b=8IHDkQJt0RQQZ7gzCWiCDhKjk3wcdMT+YxA0O1TzbbCR57WziNB1Lx4QOqe5AQsAbp1tPpiZm
 2LS//T4sNttBUuMfU0lGBv8RZk6/sRz5DdGS4tJGsn+V5T2XSOKEf+C
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Use the '__free(device_node)' macro to automatically free the device
node, removing the need for explicit calls to 'of_node_put()' to
decrement its refcount.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/input/touchscreen/ts4800-ts.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/ts4800-ts.c b/drivers/input/touchscreen/ts4800-ts.c
index 6cf66aadc10e..98422d1e80d6 100644
--- a/drivers/input/touchscreen/ts4800-ts.c
+++ b/drivers/input/touchscreen/ts4800-ts.c
@@ -110,18 +110,17 @@ static int ts4800_parse_dt(struct platform_device *pdev,
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
-	struct device_node *syscon_np;
 	u32 reg, bit;
 	int error;
 
-	syscon_np = of_parse_phandle(np, "syscon", 0);
+	struct device_node *syscon_np __free(device_node) =
+		of_parse_phandle(np, "syscon", 0);
 	if (!syscon_np) {
 		dev_err(dev, "no syscon property\n");
 		return -ENODEV;
 	}
 
 	ts->regmap = syscon_node_to_regmap(syscon_np);
-	of_node_put(syscon_np);
 	if (IS_ERR(ts->regmap)) {
 		dev_err(dev, "cannot get parent's regmap\n");
 		return PTR_ERR(ts->regmap);

-- 
2.43.0

