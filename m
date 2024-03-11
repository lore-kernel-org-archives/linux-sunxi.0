Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13EF3B2A1
	for <linux-sunxi@lists.linux.dev>; Mon, 11 Mar 2024 11:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710158045; cv=none; b=LSXM8ZE8VgUblYBOa5rxnpizA7teiaRQ2kQa2dXSfo2v5JkKU27zzv1qFN32GbbC78UpC40lv5S0RiHf4Mk53T7UjBJoZpmeh6CAM24dYeLltRuPrAMriCjzHwJ7x9UO8UtA1YOgORpIHdp1XdKUrZYBaE0AmJ/KvuZVrZM/fyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710158045; c=relaxed/simple;
	bh=PVtpCKCkBtvEJIf9crFa+TlWcqX/82F7MF/jC7ddjwM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dzN6nLWDWelyC4DfsQ/ltxp/fzWi5T2/HV0ai6QVz66nZRAv9ksfDBd826o5BpDKS83wUfkDLcJMuC1UevHLiMX7bD3UNGGvvGL0dvdqwgjdAThoLhf3+4zGT6VGGzxGl7S3/0DIDlwBbpoLFgD1sF8FOiLeVmJCJJMgKuj8D58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GsAU+tJO; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GsAU+tJO"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1dd916ad172so7882685ad.2
        for <linux-sunxi@lists.linux.dev>; Mon, 11 Mar 2024 04:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710158043; x=1710762843; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UPNazQlGmkQf9hVivO3Ny38z32q6y/PMgomiFB9Ohpo=;
        b=GsAU+tJOUY0zS5yY6kJaXHmfTrbz2mr61ZyaSg0UFyN6Kx1ljppT3kj2eDPRTWWiBD
         pph8C0F4ztv2mZnh0arYpKpGdMWShDJFyXbD39iLoMQwH4PzcTzYAi/9h2PgEw5E620p
         CRVCtd3VBpAV1Ry5DPbDG0QnDl0Ieawj5q+UrxYee5Y+QTS5G7mYqs2xxnqQu7h7/w/X
         fKBPd8peJTROphSVuMLXVVxYTG1NXMm6eJc+s8X+PRUQQhctYEl6xZehEUaGyEunwBmt
         5P+y2ULbEjfQNMEWfXuvvpOgSe3uJf1vcpI3eqqiP9Q2qusL0h2j8gfAu6k+nxb9r8Ey
         +png==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710158043; x=1710762843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UPNazQlGmkQf9hVivO3Ny38z32q6y/PMgomiFB9Ohpo=;
        b=b7R0F6RV7NO3VEJ8fZYdaFJo/foSG7Ml8ArQKE6JG4ow+ir6j/Rce163gignHLT5i1
         8/0tnfhWnm3IzD4njarU82L7Dtgh9Hw1zlh9eZtjNFolZItFAdUAYaRQky3H3h6LBl6Z
         5EmPJNwG96fOOv+tFAajkvFQopl2uMZEpU8MfbmW+9p7/dg4SytCn+GhOfkZ5r++8MfJ
         SkqaZgvZem1aRHqO8g5vA0tZ/XZK0NuUNDOXBriZocXnKO2h2UgPgZvwYA8ntb4rBNEy
         i5kxoPKpQivVdsuNekenCRe+kVDa3WkoASQBqxpejuISr67uqr3tbHWJ3JG4TOGlqXBZ
         iQLg==
X-Forwarded-Encrypted: i=1; AJvYcCVdm9KTD2Ajy1PyVOy0+yc634GuGJ2XSUfjvgPZ2viiqU3OiSFjfaBVTz3N8ingiFKuuh7/GTS4bMKV6n0gW4Pbs2O0lrW1xjsYFKE=
X-Gm-Message-State: AOJu0YxHaIBBcYWkrZkdhoI9Zbrr0yiVcqKzgnRgkZS3iw0yeEy5nP7Q
	cF2LmnDrA2dXSUVEJsHEGwmpjaLSHs1Wc3FUjwKfRCpFR6B7c7XC
X-Google-Smtp-Source: AGHT+IEaq9G5ibgjW5cuECRa2zEfUpHa4myqNxMYTPShI90FZx5rwodmCZG0vXfcmR9ZorJexVL7ew==
X-Received: by 2002:a17:902:ec87:b0:1dd:96de:83c3 with SMTP id x7-20020a170902ec8700b001dd96de83c3mr4092124plg.11.1710158043030;
        Mon, 11 Mar 2024 04:54:03 -0700 (PDT)
Received: from kelvin-ThinkPad-L14-Gen-1.lan ([203.145.41.11])
        by smtp.gmail.com with ESMTPSA id x8-20020a170902a38800b001dd6958833esm4627682pla.242.2024.03.11.04.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 04:54:02 -0700 (PDT)
From: Keguang Zhang <keguang.zhang@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Keguang Zhang <keguang.zhang@gmail.com>
Subject: [PATCH RESEND] irqchip: Drop the custom fixes for the same irq_chip name
Date: Mon, 11 Mar 2024 19:53:44 +0800
Message-Id: <20240311115344.72567-1-keguang.zhang@gmail.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 021a8ca2ba23 ("genirq/generic-chip: Fix the irq_chip name
for /proc/interrupts"), the chip name of all chip types are set to the
same name by irq_init_generic_chip() now. Those custom fixes for
the same irq_chip name are no longer needed.
So drop them.

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
---
 drivers/irqchip/irq-sunxi-nmi.c | 1 -
 drivers/irqchip/irq-tb10x.c     | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/irqchip/irq-sunxi-nmi.c b/drivers/irqchip/irq-sunxi-nmi.c
index e760b1278143..bb92fd85e975 100644
--- a/drivers/irqchip/irq-sunxi-nmi.c
+++ b/drivers/irqchip/irq-sunxi-nmi.c
@@ -192,7 +192,6 @@ static int __init sunxi_sc_nmi_irq_init(struct device_node *node,
 	gc->chip_types[0].regs.type		= reg_offs->ctrl;
 
 	gc->chip_types[1].type			= IRQ_TYPE_EDGE_BOTH;
-	gc->chip_types[1].chip.name		= gc->chip_types[0].chip.name;
 	gc->chip_types[1].chip.irq_ack		= irq_gc_ack_set_bit;
 	gc->chip_types[1].chip.irq_mask		= irq_gc_mask_clr_bit;
 	gc->chip_types[1].chip.irq_unmask	= irq_gc_mask_set_bit;
diff --git a/drivers/irqchip/irq-tb10x.c b/drivers/irqchip/irq-tb10x.c
index 680586354d12..d59bfbe8c6d0 100644
--- a/drivers/irqchip/irq-tb10x.c
+++ b/drivers/irqchip/irq-tb10x.c
@@ -150,7 +150,6 @@ static int __init of_tb10x_init_irq(struct device_node *ictl,
 	gc->chip_types[0].regs.mask          = AB_IRQCTL_INT_ENABLE;
 
 	gc->chip_types[1].type               = IRQ_TYPE_EDGE_BOTH;
-	gc->chip_types[1].chip.name          = gc->chip_types[0].chip.name;
 	gc->chip_types[1].chip.irq_ack       = irq_gc_ack_set_bit;
 	gc->chip_types[1].chip.irq_mask      = irq_gc_mask_clr_bit;
 	gc->chip_types[1].chip.irq_unmask    = irq_gc_mask_set_bit;

base-commit: 8ffc8b1bbd505e27e2c8439d326b6059c906c9dd
-- 
2.40.1

