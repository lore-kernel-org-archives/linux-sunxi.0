Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0A333C7
	for <linux-sunxi@lists.linux.dev>; Fri,  5 Jul 2024 06:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720159530; cv=none; b=eq51QDuWX6HuhGJf/QDlCCXMH5Y7lIZHVBrIbs+DtJ4HKLpwBVhHIZyjxoNrqpaICcn9TS3webPEvmlQJyzYQeCyPPckIkrnlBSEL3+QEq0sD4frUG+h1LsTjtKOKHeO4zj0igUnx42iBeUkVaMxjpkdnoFainql4hAkENQsy28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720159530; c=relaxed/simple;
	bh=ocWTpp4xe20M3zX37/BRgdZMFUwjybjL7mOwaBB1GT8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VMItN+jwmjV6OTsAALJf5N57iKxYyDgneemSBFD5PzF6wVBNeOxEkskx4RCsMbI4V7Slg3OVIvTgos72MAtXw4KMIX5eS4LV+fyh8gIxXw9wEE1wG9pTncnlLcgxldw3KA7urpN2wkUz9unRPaXV4+JYz4XriTrkgtxsH+Q9CD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UdQ0kBr3; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UdQ0kBr3"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-58b0dddab8cso2044303a12.0
        for <linux-sunxi@lists.linux.dev>; Thu, 04 Jul 2024 23:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720159527; x=1720764327; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CEGiUaZLdnHx0yMh5c5wWBK9rx7H+2K8obOdncrBZg8=;
        b=UdQ0kBr3srjmfgjTdCOxJOjCOcXilbH24OKLOqf2x6jx7+jFC716QnTnX3+WDmYGpQ
         OxzVDN7i1I6u7zbqKElb+2+lDJ5zfdHwNgZRrRbrBA8RBwACmi5Qk6J6hLNRsRWOKPQM
         OZoHQ9BvPkin9dSoN0rrKjgbNEhiQjNzPglYDfrJ94g4KrvdrK84VYIYkOscRc7N6FNc
         L5UIBHkQTN/s32oW5yyrMA5L1eEvvCMLan3kV9XfLgmutFN5V5dpBeTIHqYKr43ogbl3
         EMVvZhgyjDci4Foz4xFQOAbSOS/0oKn4hrjfO0CPLe9e0L4ffS5PUBqpfb4QAKwte+uF
         yfXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720159527; x=1720764327;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CEGiUaZLdnHx0yMh5c5wWBK9rx7H+2K8obOdncrBZg8=;
        b=KhpKJbUm/A+COR16wsdI/CmfuYCjWdD+w3w2nCDNS9b4+eB1Hu4Yo2PDk7Bic0enka
         wWfdjdRNSuQbuJM/C5oOD/j/gE1T2EOot5rT75Mqw8veH4d8GlGtakT/EDDl2eWcynCU
         SVjvNfBVsH1qwkPiYcHva62xhZ5cysupwXe0YH+k3cgR3DcnhNP01wiZfLydXntgl4dQ
         wLew4ZgITA49Gwrd5QR0RipmxTMhGNRRoNS3y2fkKcKFRi0mg/Cf/ExxW6o0ey8sKOtV
         z+OPfLOVniXAksMr4eOlaeQNQSn8zxWjT/NO3jRzawcSZE1HgGbA5Jn+/oTwqWjhijip
         2/Ew==
X-Forwarded-Encrypted: i=1; AJvYcCUTlMQ54INaty2Fe+8+Zg2py7r4eJFuc3nMuToGF/PceZx0WQTv740axqzqvFDkEwtV+IZha22NueYrbg1NM2gx5KXDj/JxDJsVh0g=
X-Gm-Message-State: AOJu0YzJnetFSs5MU+viefJvGRAXGp2PYcRcR4U2cXCE15nvLf0U/clC
	3x+c9j40BjnDBM0hNJA25xt2Jof2aeeveWKwGLrDAS+cfZuHnCjL8mYjQ/ft
X-Google-Smtp-Source: AGHT+IFUj5fhyTMHVVSInQGpgKofNVfDPkvLiND5Roh2i0SEAetOK+ekHpZEazZs0rz4hPCrfZivMg==
X-Received: by 2002:a05:6402:2792:b0:58d:45af:43dd with SMTP id 4fb4d7f45d1cf-58e5b4aed24mr2500973a12.36.1720159526937;
        Thu, 04 Jul 2024 23:05:26 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58f86619b5fsm521351a12.44.2024.07.04.23.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 23:05:26 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 05 Jul 2024 08:05:18 +0200
Subject: [PATCH] bus: sunxi-rsb: Constify struct regmap_bus
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240705-sunxi-rsb-bus-const-regmap_bus-v1-1-129094960ce9@gmail.com>
X-B4-Tracking: v=1; b=H4sIAB2Nh2YC/x2NwQqDMBAFf0X23IVolEJ/pUhJ0qfuoVF2tQjiv
 zf1OHOYOcigAqNHdZDiKyZzLlDfKkpTyCNY3oWpcU3r7q5j2/IurBY5bsZpzrayYvyE5fUXPgF
 t8PC1j1Qii2KQ/Ro8+/P8Aftv86VwAAAA
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720159525; l=958;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=ocWTpp4xe20M3zX37/BRgdZMFUwjybjL7mOwaBB1GT8=;
 b=2SZJutRFCj2jCTpLniijzBGhIb2SG1TuD5ER+pGGwsq+QPEHY6uSupbgFn8D7Q/4lEkl7+1mg
 swVrpaiyqrqBLskhB+0vp0txpZpckD774ZSq1SboNiIzh/OR4VJIk/b
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`regmap_sunxi_rsb` is not modified and can be declared as const to
move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/bus/sunxi-rsb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/sunxi-rsb.c b/drivers/bus/sunxi-rsb.c
index 1e29ba76615d..ac6c7e4900f4 100644
--- a/drivers/bus/sunxi-rsb.c
+++ b/drivers/bus/sunxi-rsb.c
@@ -457,7 +457,7 @@ static void regmap_sunxi_rsb_free_ctx(void *context)
 	kfree(ctx);
 }
 
-static struct regmap_bus regmap_sunxi_rsb = {
+static const struct regmap_bus regmap_sunxi_rsb = {
 	.reg_write = regmap_sunxi_rsb_reg_write,
 	.reg_read = regmap_sunxi_rsb_reg_read,
 	.free_context = regmap_sunxi_rsb_free_ctx,

---
base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
change-id: 20240705-sunxi-rsb-bus-const-regmap_bus-3cee4a3e313b

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>

