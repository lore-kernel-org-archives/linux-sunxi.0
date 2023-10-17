Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11A441E5F
	for <linux-sunxi@lists.linux.dev>; Tue, 17 Oct 2023 12:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T3pI2+lj"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6b201a93c9cso3337392b3a.0
        for <linux-sunxi@lists.linux.dev>; Tue, 17 Oct 2023 05:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697545673; x=1698150473; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oIvH93b/sWVIbaT25hdzz+hqN4HWpQnfh8o78oWByr4=;
        b=T3pI2+ljfPHz/Kx5BhLMgmxPsNlqyZxiurRugzIrSppuIHy70/dICqDWeLYOmaFZiy
         F/bpbSQQD4Hmry4Jx2U9Ttgr9ZgP7BIo+sOhi9vAmejVHvh+tm9SIfOucVFH4RmbPcZ9
         TbVnKWbeBy9cM+6ANQ64ZMh+p5qbC9TPbryu1JKla85qK/BnO2RQ0eQy13LRUU0ZBSlw
         uWXVxvt+L6W0vpN3WElCShzVYBm8kw0Y14LFtiqy6J8ytkvmBxBrhOV87luc7qhUHpWd
         JZ2huEEJM2TW3Trqys0ac72yJGCFQBpzRozgby966znnzAzJKjKPa7vmnKo06tLxgNea
         TCLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697545673; x=1698150473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oIvH93b/sWVIbaT25hdzz+hqN4HWpQnfh8o78oWByr4=;
        b=EiAamAlqokv+HTRMWJdG3ZKbpeyCZOTNbE0wjJeGG/+8Qo0gjfcLe866TPdaNNWz3g
         N6Ed4o+zgJghjXq/d/gsk0dh3L/k8vm6FE31+/Vv/PIPCYCSDAKSKx/eXDuJCEM7eiFq
         /+GaMOjNDrR1G/1LNEnR+6Gnbich5kvxFI7IuFgoM+qjManmjby7e9wBcxb9upc43+xB
         CLc0pp9JBQb3+qLxct42PRZqYIPrpFNy4pSWMpaPNOjyHXcC9bSBpluSM7n1x+Lbu9pz
         HAS19mwdvcue6D3Yx2g5+IVRQMQF+Mmi5M5wmvtEySoXm7yNJmyx/b/rFr+nBZ/tiaVc
         y+iw==
X-Gm-Message-State: AOJu0Yzf+bnY3OajayP7KNW80NfoSfuwvlOcs3CHeAh8nTPbHDxHyvaY
	Hrs8EGEAcqKggPnYPpsrtXg=
X-Google-Smtp-Source: AGHT+IFSw8FIVjPWtqi/0et1umJtbVLACgN66JMBmJenEXVUlttevscGPjWw9ZWjgpb3vwv9ZAN8/Q==
X-Received: by 2002:a05:6a21:1a5:b0:154:d3ac:2076 with SMTP id le37-20020a056a2101a500b00154d3ac2076mr2166222pzb.40.1697545672936;
        Tue, 17 Oct 2023 05:27:52 -0700 (PDT)
Received: from kelvin-System-Product-Name.lan ([112.45.97.252])
        by smtp.gmail.com with ESMTPSA id l18-20020a170902d35200b001c9d235b3a0sm1406193plk.7.2023.10.17.05.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 05:27:52 -0700 (PDT)
From: Keguang Zhang <keguang.zhang@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Keguang Zhang <keguang.zhang@gmail.com>
Subject: [PATCH] irqchip: Drop the custom fixes for the same irq_chip name
Date: Tue, 17 Oct 2023 20:27:18 +0800
Message-Id: <20231017122718.5062-1-keguang.zhang@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 021a8ca2ba23 ("genirq/generic-chip: Fix the irq_chip name
for /proc/interrupts "), the chip name of all chip types are set to the
same name by irq_init_generic_chip() now. Those custom fixes for
the same irq_chip name are no longer needed.
So drop them.

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

base-commit: 4d0515b235dec789578d135a5db586b25c5870cb
-- 
2.39.2

