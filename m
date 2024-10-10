Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192AB1E884E
	for <linux-sunxi@lists.linux.dev>; Thu, 10 Oct 2024 21:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728595573; cv=none; b=Xtoh3wk712NUtabJPzXglXzQ63ID0n13M9UgVEH+KyYDagmJ7rGG+ISsonYbbP8GZ1HEJ+IQ+6RxNkNcUIkaKj9EVtVbznDP3zytAvplKfHC5ZHP6WqaeXQ1loUpEtjI0GQUH7FlONp4fplUZrzCWI5+wBrBaJ87dg7BWWW3Nyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728595573; c=relaxed/simple;
	bh=8XjuIi1Czg4gxADzAUScoPXbznvngqAftxkGhXUC4pg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gybezu8c3SPn1EJZzJk9dSW2FJ5WIX8oF0YTAsE+yXw0HZ5/rheum4XV7CXImrBIzhOipgFhG0fFAr9jm2Paic1QCyzZruqFxqd7Y8r4pCSCo/DSrlZLyqGYb0r9UaVPvrs5Loe+kot30sYBOYZ6HhSwu/Az9bSPKW9WO/+Z5fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V+YVS6Ce; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V+YVS6Ce"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-37d55f0cf85so80168f8f.3
        for <linux-sunxi@lists.linux.dev>; Thu, 10 Oct 2024 14:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728595570; x=1729200370; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gv2lnH1bFL+wtFjxRgBI14o1ODjTXUiEC0mw6OfkCr4=;
        b=V+YVS6CeGcZlL7wPB5mVgru7TQsDsUW16pkyQdy40c/J6/Tk1dehj74FWPCLCijRXx
         jnPSeLvodOR8U3Gqx1xBUAEmUbLGgS7NQGaSAGZAlCrj/b1cLIF8vcTsNF1V6h/+A3NU
         D7RgUELSE/QaeAbrTjQczkEDo3vrPd1m/J9PE/Pt1yfFtI4iIuU3dT3VyAgorg6GeoYR
         9wT2Rue93vL/KR2l1nyR7lvDCALCmWePefZAmmu9q9Fy4sXGdFXiVL92/S6y681awres
         3T4O+zG+5irx2+CvuUHj9gZZBm3pENE0zANhCP9KojeL8qeTbvl0Qm3oLmDkqzut/Nw+
         j4bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728595570; x=1729200370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gv2lnH1bFL+wtFjxRgBI14o1ODjTXUiEC0mw6OfkCr4=;
        b=CkDE9qgnWsi7SNERLnBR9sxflRl0kfikFSBa/dsIo9HCcCcMwAu1yz+CV/jp4hC0gx
         puUxTi1AsWtciIUOlFK4IZ9UCoQL8n4dmqVXrwEzmRzCBh8p/EZx+7Z7Vw0JLwz+sv4V
         bFoOXsSOnha3S4cQMkQAANtzV5WU2esXHDcqgtPcBROTC4elUN8UbBbyPvE29iVMfnae
         S7qUZdd4kJY9lzISZyNlXxTLi34peTlOnsJhO7m5rNm7A8JBu24hdkZ5h+36LzoJnO68
         SPCFxGV25grC+jxbFiidBB2pbHP2k9rCZ5o+cPtCBBOwV6gX+jUs5nUtv5fyEWrJNPgK
         sWWg==
X-Forwarded-Encrypted: i=1; AJvYcCXvT62joD4us7IXn0LVhoL6PDHZ05sYS8CRngZL6/K68vdzGtfn7FbDQeMGcjV6K72483oWWK/CS9/4jA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzvfrthg1eUSdLUFQxti8A2FyeHi9lcIp3riazeTN23XRKnziXQ
	Z4u0IISUspYoJ0UKYAmE9juJYf0YrWBRPLfdnqBNXEMx34unxVI4
X-Google-Smtp-Source: AGHT+IHrNABpkE9MoIs4OHjPtix9N5xn9oz/4v1rJOCBX1LbPoC+c+XJfnpTq5HfizfEkADdbQPIpw==
X-Received: by 2002:a05:6000:1092:b0:375:c4c7:c7ac with SMTP id ffacd0b85a97d-37d552cb121mr309436f8f.49.1728595570453;
        Thu, 10 Oct 2024 14:26:10 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3d08-841a-0562-b7b5.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3d08:841a:562:b7b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6a8940sm2402083f8f.6.2024.10.10.14.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 14:26:08 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 10 Oct 2024 23:25:55 +0200
Subject: [PATCH 05/10] Input: twl4030-vibra - use cleanup facility for
 device_node
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-input_automate_of_node_put-v1-5-ebc62138fbf8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728595555; l=1014;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=8XjuIi1Czg4gxADzAUScoPXbznvngqAftxkGhXUC4pg=;
 b=/4+JFcJpLeL4D0LEVXjbes3plish7dWoFirHhI5dayVbYW4PEtxEp0kTrBT1nHE4UHbh0m0sS
 RPzjoyarLQcDfkWazC5yuILBtuqtMJaAHXEwwvzs+7J+Ee6KQ/9rewD
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Use the '__free(device_node)' macro to simplify the code by
automatically freeing the device node.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/input/misc/twl4030-vibra.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/input/misc/twl4030-vibra.c b/drivers/input/misc/twl4030-vibra.c
index 101548b35ee3..b8ec5c7c5bce 100644
--- a/drivers/input/misc/twl4030-vibra.c
+++ b/drivers/input/misc/twl4030-vibra.c
@@ -165,15 +165,10 @@ static DEFINE_SIMPLE_DEV_PM_OPS(twl4030_vibra_pm_ops,
 
 static bool twl4030_vibra_check_coexist(struct device_node *parent)
 {
-	struct device_node *node;
+	struct device_node *node __free(device_node) =
+		of_get_child_by_name(parent, "codec");
 
-	node = of_get_child_by_name(parent, "codec");
-	if (node) {
-		of_node_put(node);
-		return true;
-	}
-
-	return false;
+	return node ? true : false;
 }
 
 static int twl4030_vibra_probe(struct platform_device *pdev)

-- 
2.43.0

