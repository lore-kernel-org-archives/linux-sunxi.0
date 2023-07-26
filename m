Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F231FAE
	for <linux-sunxi@lists.linux.dev>; Wed, 26 Jul 2023 05:17:34 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6686a05bc66so4064042b3a.1
        for <linux-sunxi@lists.linux.dev>; Tue, 25 Jul 2023 22:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690348654; x=1690953454;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G473Rd1/aPrSLPnmj7YzjECNP8faN6IVLpdxjT2zGJU=;
        b=hgeBpx3c/oLoI+N/EnRuoPHEXWV1ZMvAHbHrNATLNtHKYSbX3NiaJ2CR47ha9Z0naJ
         JJEd80CGU2IPJBl0C5i42pl3T9qRl1+GgOc1Noy2/S1GRPxagsBdHZpUHr3ZAxmk6qmZ
         GKyOZgj8qpgD5slarsZ5etQvGcSOP3bGh1s8t+1QNIlXjFR+JrUsxIRDzFNXLQL2SV2M
         1UotnWKNUdEaNePQO9M/JBwDbK0xik/qExEL0MCHjB7HwzrBoxqhG5PigiQ8Eh5XXgkf
         JVGy/UzCYJZYhCbzpQWyr7Yp8bAoTRsUBOGmZghp/dfCX8ZW3JQDpDfU4tWz2+98BxhE
         T1fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690348654; x=1690953454;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G473Rd1/aPrSLPnmj7YzjECNP8faN6IVLpdxjT2zGJU=;
        b=CutNYUHRcXfLqL6zil6zdTsbPhEnnzp3/fsYu7UoyUpSI0hS2KPA/YhGrefrvcLOJa
         jPNX9KnL8NDAu4Gvs0y6EsPd6Gcg8FVwhEDuFx1+esk0HH26+spoOsVhPX1YlnLctnQz
         lpGgZqZfa7lRsc2sLv9aYSWLFGJTfdK9c+NotoT/hHjpPm7KyOMI7D2wryuqI7uBcOSi
         Ag4J8+mWISSYfhn4ZBoCpPc01IRk3xNekogs7RMYoucmjeBxh6qD2KRYw0LUso9N2ZB5
         UgY8DeHjlw7amC0hH5c2dB0RfplUhlovsx/4KchHed3Uie1uvBIOfFZuqcgPU0nLFtgh
         +a8g==
X-Gm-Message-State: ABy/qLYGn+Cf+8nQBa7HdRaVtDXVLuJ2BoKgrZCOWu5v9Ir6rFcz4nJV
	xWMKQq9nBN+YVzLUO+jXgfc=
X-Google-Smtp-Source: APBJJlHJEz55OoJvWUKBZQCFzqMVzKd+NR2g4A7drBfTB5ZDrCjJmV11OrtZ8JyoW5Zci1hMPLCehg==
X-Received: by 2002:a05:6a00:2e93:b0:668:99aa:3f17 with SMTP id fd19-20020a056a002e9300b0066899aa3f17mr1259727pfb.16.1690348654049;
        Tue, 25 Jul 2023 22:17:34 -0700 (PDT)
Received: from 377044c6c369.cse.ust.hk (191host097.mobilenet.cse.ust.hk. [143.89.191.97])
        by smtp.gmail.com with ESMTPSA id b7-20020aa78107000000b0066884d4efdbsm10891167pfi.12.2023.07.25.22.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 22:17:33 -0700 (PDT)
From: Chengfeng Ye <dg573847474@gmail.com>
To: shuge@allwinnertech.com,
	maxime.ripard@free-electrons.com,
	vkoul@kernel.org,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	p.zabel@pengutronix.de
Cc: dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chengfeng Ye <dg573847474@gmail.com>
Subject: [PATCH v2] dmaengine: sun6i: Fix potential deadlock on &sdev->lock
Date: Wed, 26 Jul 2023 05:17:27 +0000
Message-Id: <20230726051727.64088-1-dg573847474@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

As &sdev->lock is acquired by tasklet sun6i_dma_tasklet() executed under
softirq context, other acquisition of the same lock under process context
should disable irq, otherwise deadlock could happen if the soft irq preempt
the execution while the lock is held in process context on the same CPU.

sun6i_dma_terminate_all() and sun6i_dma_pause() callbacks acquire the same
lock without disabling irq inside the function.

Possible deadlock scenario:
sun6i_dma_pause()
    -> spin_lock(&sdev->lock);
        <tasklet softirq interruption>
        -> sun6i_dma_tasklet()
        -> spin_lock_irq(&sdev->lock) (deadlock here)

This flaw was found by an experimental static analysis tool I am developing
for irq-related deadlock.

The tentative patch fixes the potential deadlock by spin_lock_irqsave() to
disable softirq.

Changelog:
v1 - >v2
- Use spin_lock_irqsave() instead of spin_lock_bh(), since outside caller
  could already call with bh disable, in the case spin_unlock_bh() would
  unintentionally enable bh.

Signed-off-by: Chengfeng Ye <dg573847474@gmail.com>
---
 drivers/dma/sun6i-dma.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index ebfd29888b2f..30f426299703 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -866,6 +866,7 @@ static int sun6i_dma_pause(struct dma_chan *chan)
 	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
 	struct sun6i_pchan *pchan = vchan->phy;
+	unsigned long flags;
 
 	dev_dbg(chan2dev(chan), "vchan %p: pause\n", &vchan->vc);
 
@@ -873,9 +874,9 @@ static int sun6i_dma_pause(struct dma_chan *chan)
 		writel(DMA_CHAN_PAUSE_PAUSE,
 		       pchan->base + DMA_CHAN_PAUSE);
 	} else {
-		spin_lock(&sdev->lock);
+		spin_lock_irqsave(&sdev->lock, flags);
 		list_del_init(&vchan->node);
-		spin_unlock(&sdev->lock);
+		spin_unlock_irqrestore(&sdev->lock, flags);
 	}
 
 	return 0;
@@ -914,9 +915,9 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 	unsigned long flags;
 	LIST_HEAD(head);
 
-	spin_lock(&sdev->lock);
+	spin_lock_irqsave(&sdev->lock, flags);
 	list_del_init(&vchan->node);
-	spin_unlock(&sdev->lock);
+	spin_unlock_irqrestore(&sdev->lock, flags);
 
 	spin_lock_irqsave(&vchan->vc.lock, flags);
 
-- 
2.17.1

