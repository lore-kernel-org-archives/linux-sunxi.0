Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5F01ACECA
	for <linux-sunxi@lists.linux.dev>; Sun, 12 Jan 2025 12:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736685250; cv=none; b=VN4tO39COLM2Y6Q1zslTpXvVFAIDK3bfueic2jCUnJtA5cw1keMVPdVelqg1w/ekeWAISFDyapxj220xv2bqg/Eca9pu/cCGklpQcKuli6wWLYY8Ccy32b/pzoOkbjBZby2apKAH0MAUlyjq5ZhbnQUoplGg3ag7WT+NhEMr23c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736685250; c=relaxed/simple;
	bh=6HB0g4DsD2dVydZSH1Wy1INSDIKWWoonHGLke/ju22o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rkliw/0DwQ87v0RTpYuo0XxxrqhbeptX0i0q3lyFMlm8wzewxnUMgmS+N03rVvF+kheTaIhS/7gXzXtQBo9w3rl+j8ZwnBSmPpaHnn/wjURSO4BBpr1nNHZ7YcrBYt83j8Ag9Oz+ZV2JrTzb8cyTLIU0+7m45bfAc2fUghNCXkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZUkLAcbp; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZUkLAcbp"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ab2aea81cd8so504673866b.2
        for <linux-sunxi@lists.linux.dev>; Sun, 12 Jan 2025 04:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736685247; x=1737290047; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZuUaCOd0CHv8OPDDzk4Qc7PUxSYAYuaG0jg5TgqLAc4=;
        b=ZUkLAcbp1gb3T6UGxpzJgSvks3iQMztjSHYpQwPFnQhP0keyQ1WHZZ+sk7Hrk3MXTM
         t8EdIBPJPtk9r/DPaG1Ntlo166NWnKNW6oTBc65WmNITp3tFyHysch3+06MmqTALL7zG
         1H9lvun6QOROb0m/tPOqRpl+5uMjgJmx8H/7/y/Oqn6oQE3uANUepdSvkrmzj5nHeOGP
         Qb9MjB1TPYJ4HlhL24we9qzw/fj+rtPld3LZOkVQBqaWcftz839TrYHrEJ7bHivevIS0
         7I1oNX7a4FAsTFUr7sKTBnK3xqO2BjdrAcJ7j02dpebScRUF+bXNQhlou2Xo90CxiyWi
         1Dpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736685247; x=1737290047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZuUaCOd0CHv8OPDDzk4Qc7PUxSYAYuaG0jg5TgqLAc4=;
        b=Ha4qDmfe70gK5e7tub6gdzw1rcjwTMwqqxFbeoHvIjVgBUFMOrmOseTL8G/HkMNUQp
         n8xb9qgbiRCJWI6XbowaVO3ZbiFBPW7E5Afs6QCnoaWnmZdl4Wnlas6YNlclJ16zAT4u
         hafetwQJZHcM3zuZ32Veo55mqjTFY+xQemd3e+WqEe0elwtw9+KBZft/0/GpmMhc3zZq
         f/QDIxpqckbn7DSB8mNX/uTfimTpfByrS+SQXrm012GW+ex1G+VjXv2lGhLhit2EcCc2
         UPhDgfBO5KtcdxyU3Q7Ypbyikb0+uKjNkEyfyTRvzrB3Oya/nboLvg6p8BErRgChIZuO
         wV0w==
X-Forwarded-Encrypted: i=1; AJvYcCVa2qW4V/dv0zCdTVc5ZXgsjGTsTyXmPbzsa60AVdUOJ8DJGNVjBXbeTZmzuB3du1DreawSMoO5al+4ag==@lists.linux.dev
X-Gm-Message-State: AOJu0YytuHbi0nuAIbkexNHkK9KhOG+/bTDdLpWDLc970P3BsGdCjVzr
	YAlzTufteSNzF4WCkE7SUPg39cs/2SiEKoMf6xGoh3q+PRDx2vTV
X-Gm-Gg: ASbGncte/IMSlprsB/s54aXBxr0OTxt6w9/K1kdA2oDppn1llytqfs5LAd24GVdyghT
	gJvaKlfcJxDxw7wSlBrfzHTsyuYWy8jUyJ8Rf10oVKu+GjUnv1hhbzPIflX+jXlxcLEavHT4dTQ
	Ju72r6l0/PU+medqjSK60mSRjXyXXWtTMdSiJHlx5ud+v4O3NZHtw4CRSSEcVQc7SWgjp1SuwFs
	poEt/qqhTzarL6cDqadqjkMeHp7ON0vha5/R91GZS6OjgCbdH0C16KQpJkfT5HXMtWa+Ik/uI/G
	e3OQ2G2v+qB6xAJH3NleH4oUAkTR2r9Bmdcs1MJ2iAc=
X-Google-Smtp-Source: AGHT+IEgimICm5S4YoCABdNXTi31TKxcYwTAsjDlcsVhxwDErJSK3jk8m25wG7zrTUqLVorH3tNhbQ==
X-Received: by 2002:a17:907:9622:b0:aa6:acbb:3653 with SMTP id a640c23a62f3a-ab2ab66d653mr1638626266b.12.1736685247017;
        Sun, 12 Jan 2025 04:34:07 -0800 (PST)
Received: from localhost.localdomain (146.10-240-81.adsl-dyn.isp.belgacom.be. [81.240.10.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c95b20b1sm365767166b.157.2025.01.12.04.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 04:34:06 -0800 (PST)
From: Philippe Simons <simons.philippe@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-kernel@vger.kernel.org (open list:IRQCHIP DRIVERS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi SoC support),
	linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi SoC support)
Cc: Philippe Simons <simons.philippe@gmail.com>
Subject: [PATCH v2] irqchip/sunxi-nmi: add missing flag
Date: Sun, 12 Jan 2025 13:34:02 +0100
Message-ID: <20250112123402.388520-1-simons.philippe@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some boards with Allwinner SoCs connect the PMIC's IRQ pin to the SoC's
NMI pin instead of a normal GPIO. Since the power key is connected
to the PMIC, and people expect to wake up a suspended system via
this key, the NMI IRQ controller must stay alive when the
system goes into suspend.

Add the flag to prevent the sunxi NMI controller from going to sleep,
so that the power key can wake up those systems.

Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
---
 drivers/irqchip/irq-sunxi-nmi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-sunxi-nmi.c b/drivers/irqchip/irq-sunxi-nmi.c
index bb92fd85e..8dda0a85e 100644
--- a/drivers/irqchip/irq-sunxi-nmi.c
+++ b/drivers/irqchip/irq-sunxi-nmi.c
@@ -186,7 +186,9 @@ static int __init sunxi_sc_nmi_irq_init(struct device_node *node,
 	gc->chip_types[0].chip.irq_unmask	= irq_gc_mask_set_bit;
 	gc->chip_types[0].chip.irq_eoi		= irq_gc_ack_set_bit;
 	gc->chip_types[0].chip.irq_set_type	= sunxi_sc_nmi_set_type;
-	gc->chip_types[0].chip.flags		= IRQCHIP_EOI_THREADED | IRQCHIP_EOI_IF_HANDLED;
+	gc->chip_types[0].chip.flags		= IRQCHIP_EOI_THREADED |
+											IRQCHIP_EOI_IF_HANDLED |
+											IRQCHIP_SKIP_SET_WAKE;
 	gc->chip_types[0].regs.ack		= reg_offs->pend;
 	gc->chip_types[0].regs.mask		= reg_offs->enable;
 	gc->chip_types[0].regs.type		= reg_offs->ctrl;
-- 
2.47.1

