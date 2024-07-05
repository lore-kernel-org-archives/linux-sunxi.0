Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9A21487E7
	for <linux-sunxi@lists.linux.dev>; Fri,  5 Jul 2024 10:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720176754; cv=none; b=sf4kH0MNfDsOopUqVRicqEWnGcBrVkj7Y5gvBKrVd3huUuhJ8HVdGzN/sd6wEVi4SivfxHj1s+ZxAeIIsuOP0+Fugbv335OD2c+wBsvhLZX3qCCogpV6LD5gmWVMRrcB8P4S3AuYwrfx/9nC5zRhLbMIKvi8sh95gPBRCcLvYks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720176754; c=relaxed/simple;
	bh=QGBRDjKMNtYW16xiDTuPGbfVeQ8d/jHQ8QxJN+a3RL0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bynRCsJT1guGdSmIIuuES14x/QvhsxnDVxCb/shvuIL5uuSL9CEFEl3ilJqsQwPPvvReeLAZMY1RRreFI1bD66N36KZbhj1FBL6GtTrZu1wFBi55o6UngPd7Z0lb49kXZy3FPW0HI8uuIgH4vF51PNnI4mu/WCZccp/04FEAIyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kUr34NzU; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kUr34NzU"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-57cf8880f95so2042174a12.3
        for <linux-sunxi@lists.linux.dev>; Fri, 05 Jul 2024 03:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720176751; x=1720781551; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qUMoAQufaagpNr6tV8PaGVo5aWiUuvCiezV1z2Z0uUs=;
        b=kUr34NzURyjFcxkikZgaSbghAeA9hF7XtISXuyZ5+i/1oWnPFQr7mw/tM1wPKRpFxw
         m51pdNk5tn8CxjGn8WQswTC3O7/5Bvu9khS2XDIjMHEW6aQuN0FTDrUdsOYRbO3SPUIv
         p0ZktTN9GWz9DebwEian1vfWZHCphX67V2knof1fJlJx/nNIHWAM4fb/TAwCXmeCk2sX
         MU+4+OAmrJ9M1rzv48Bt60jh+RktMapM5eGLSB/LBEENCE6OipOFDHVRrqSVLxt11JqP
         A/25qd2imeYT9K/sN3AGsl+nc907q0sJ9OedGWV4iZIXcc9tGVMGhH3wQEPRMBXQC5RC
         G7ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720176751; x=1720781551;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qUMoAQufaagpNr6tV8PaGVo5aWiUuvCiezV1z2Z0uUs=;
        b=lB7zN1EMHnoBixrQwQE3ELwapkhLo/HjpSmpKsW2fbn3iQpRu7ezsVESxrh6QmIe6r
         k2fZZ338C9o9Y+PZdp25FPxQNl6KsArNvfALOAVkCCDKriLxDAPRIN3G2+ahyR89USCI
         ca0T37VZPoVGwcYH/w3D3/JPPZxtQbochpl6zEnLSo7Qvp0VEnVSr7FBdc0sO9sUD6xQ
         XSfDbHhY3QWAdOoLuGVrbo36k+gKnlzc2Bv7vDVJr7OjdeSRxQ8j1Hz5QoodBbeOm7iv
         uUiFyPhHakAzWVzXOInjs1mcX9N261Vjs0LNzIKhXLF8pZms8p43m3HU/h2nZXPWpgUV
         YMvw==
X-Forwarded-Encrypted: i=1; AJvYcCVqV+Pz/Sn2gNch9LIWf2adep6REsGQ+ZOIEG482eL8Cf3Gb+ItX4HylVtZeJbwHh0qvtEYoS1aaMzDKV72S2SGV28gIAEGgY3VMe0=
X-Gm-Message-State: AOJu0Yz3yd7VYgjRYaUAYMa8bDSG0qmVtER3S/dTZvj8B7k8ae3xHaYJ
	JgonH+jba3U0xopWT90GDJGFk2Q0Ug4uMIe720JUmuW7NQ414p24
X-Google-Smtp-Source: AGHT+IGz6P3IZ+lNYkgQEuRvSKBL2zU7f1M3XQaaJLj384xS+BDm6WQRyO/zk84MF+4SGrNS6bpf9g==
X-Received: by 2002:a05:6402:2792:b0:57c:ad11:e759 with SMTP id 4fb4d7f45d1cf-58e5c82651fmr3577891a12.28.1720176750597;
        Fri, 05 Jul 2024 03:52:30 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58cd108c84bsm3388452a12.47.2024.07.05.03.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 03:52:29 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 05 Jul 2024 12:52:27 +0200
Subject: [PATCH] soc: sunxi: sram: Constify struct regmap_config
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240705-sunxi-sram-const-regmap_config-v1-1-1b997cd65d0f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAGrQh2YC/x3NwQqDMAyA4VeRnBeIujLZq4whtY01B6skKoL47
 is7fpf/v8BYhQ3e1QXKh5gsuaB+VBAmnxOjxGJoqHnSixzank9BUz9jWLJtqJxmv/YFoySM5GI
 9DOS6NkCJrMqjnP/B53vfP9onwXZwAAAA
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720176749; l=962;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=QGBRDjKMNtYW16xiDTuPGbfVeQ8d/jHQ8QxJN+a3RL0=;
 b=r5tzq+6aAPquOFfO7J4X47CgE39TP7rvi6Y8WaiEAh+P4TeODlAZtxWdekKB0R/nk+cF8LLsL
 oWauLmKrxmtB5ukdVXaIJnRBpUQK/jhtBxcdBdXPcLoYNzsv3vRH0SO
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`sunxi_sram_regmap_config` is not modified and can be declared as const
to move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/soc/sunxi/sunxi_sram.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/sunxi/sunxi_sram.c b/drivers/soc/sunxi/sunxi_sram.c
index 71cc377b5e24..2781a091a6a6 100644
--- a/drivers/soc/sunxi/sunxi_sram.c
+++ b/drivers/soc/sunxi/sunxi_sram.c
@@ -344,7 +344,7 @@ static void sunxi_sram_unlock(void *_lock)
 	spin_unlock(lock);
 }
 
-static struct regmap_config sunxi_sram_regmap_config = {
+static const struct regmap_config sunxi_sram_regmap_config = {
 	.reg_bits       = 32,
 	.val_bits       = 32,
 	.reg_stride     = 4,

---
base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
change-id: 20240705-sunxi-sram-const-regmap_config-d05d1bb0583c

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>

