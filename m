Received: from mail-pj2-f0.google.com (mail-pj2-f0.google.com [74.125.227.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AA131E85B
	for <linux-sunxi@lists.linux.dev>; Sat, 26 Sep 2026 17:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790442659; cv=none; b=AJ4k8tw16TN0hfx7ljt+tOAe0EOQfv711iO66MIz/QIF+QHhN+NcvqasdVhHJqs4ybZNDq2UOV8vtRlScY0Ope1VW5VgEB5S4vEVpNkAajLsma6a89pTdrIYj0AVy3ro0YCtgUocLPFRMxe2sgGiFVPQW1Bfpk80vryzhPHRLus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790442659; c=relaxed/simple;
	bh=1Ijmd4NtwbrxYG0QbmrAlqjExMAyCe44/2dJ1XZKKMU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jQx9RAMejhMiaDcXfsQ9FZPdgmT7cD1FmYu0yc0EkrehCegeUvumu6dBjDhvu349b8ZB9aj0VCVmqVOFvG5yHOA9NnRZvBmZ/8DFbqxTNvNrP6BbXVp6331TMnrVyHvDPK1Gb5XgqxQ0506uNDi0dr9oN61aEUHDI5kaInKu7G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=embeddedlinux.blog; spf=pass smtp.mailfrom=embeddedlinux.blog; dkim=pass (2048-bit key) header.d=embeddedlinux.blog header.i=@embeddedlinux.blog header.b=oQZxIi9l; arc=none smtp.client-ip=74.125.227.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=embeddedlinux.blog
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedlinux.blog
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=embeddedlinux.blog header.i=@embeddedlinux.blog header.b="oQZxIi9l"
Received: by mail-pj2-f0.google.com with SMTP id 98e67ed59e1d1-39e0e245eadso689034a91.0
        for <linux-sunxi@lists.linux.dev>; Sat, 26 Sep 2026 10:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=embeddedlinux.blog; s=google; t=1790442657; x=1791047457; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F0/79LdVzvZe+TAFF8pS9QgkNB/YVyvKTl0/c5RoqxI=;
        b=oQZxIi9l135IgaS1LYEjXbT9Qihi5CKrT0oByObZuPk83gAPr8sMTp1wegzPntG4u5
         QEmGBov41sBLxhmD6U+9pjUDsXklvEAF8+dNZEAJU7TnQG6i+epvmPjMUCc9I+QyTBqd
         OUNT+kGuxb48uvx8l4IH3AnT6Dyihx25Ai+UvXtNG+pcB0UG+5sfcNwnY/S6JLma9wgp
         g8EsgbSqiC/Tnbz0op7uvjqpH2sXJQUMA2k13a0NymlBuKyMh+Fke4Uk1Xb2agMettjQ
         zvKr3Tb4cNtS8pL7Tw6PHA7pB4KihUJa7g2hnKy3ddYrgDrRuQBoBO5noPSj1lciU2rF
         K2Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790442657; x=1791047457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F0/79LdVzvZe+TAFF8pS9QgkNB/YVyvKTl0/c5RoqxI=;
        b=aG/Ob3HR/dUMVWdbnOjK2wb6YKrw57oN1yHBqQe80TxqLd7o1/vRW8rjMos0GNdCso
         EZ8ZUkIHvjwE+zthUbmSnTk+WYnVJuDkJqu2KdsW3NG3fZQq6dNEmsgcAm3gOhj7ggau
         NQHgvoGZGLIocpUrP39A14X2q/mDkPP6dCRS6D5vumZKoHB6Toa2+HHb4haWbsBhYxoc
         oH1fQGfRmAA6JjHU7QItA1J28QUKOj5FxaemDnqo8JQ4g54mN2zjGR3KGWtyBbCDhVP7
         u3K115AW4Ocsn//NoS9ICB0KLL8LUuJui0v3xpdI7/iIyRXdaUH4tVvypJWwqYTmFfId
         ZZyQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2KdwarsRkTmWAvaquP0KZC5pIy8ousAtT/lbejqvzTZKw/tqcEnBdKIOEILmx9uAoZeC2uIdMn5DWyg==@lists.linux.dev
X-Gm-Message-State: AFq9FYIIh53rSefKGl1eytduCb9C2K/330tbdLZAteP8oFHRYqnRE942
	ETJ2ukr3WKJj2P5IFuSQGpvihpbvl9vu7gG+RBQ7r0DZ+TMR25xEuftSaCHbfU03gq2u
X-Gm-Gg: AYBFou0mjLo/rut2J9ESxYEsFzSFkzDSHn23zyARVPqPKFZLG9K5yzPm85jCOPU/7S4
	saRRosz40KOry5CZgvg88cmQZzbEGLLaxIknh/Nlrp/c8F5Yzsur3gaCYTSPDlsQ0JRrGfs8tmW
	8b8YCmcs97yDkgX2XJCAq5iR83tQSwGGMalHjDVp4t+uX/ZIBzVBc7uPYzyFvuaEFM4ELKmZjQ3
	1uehOZLeUpnPAxAZ4iW1cCm83l8xVKehG2gT8M1Mc0XAy6eccgTB6vZKPWpQaZL888/l7z5vFnK
	Zfgca1X6nTWZpEjLa33YrwmgBhv9OXgnMCGv26ViGuoBGsNvPkHo2XP9AA/ByTl1KgwZyxSoAwp
	zqVogyAtOtVxsC+PZmJ/DOWVrIFUB4NEvbgB2DytYqNvM6XyhQu0T6oOpsEbYH8eQELGZQzG1Bm
	DgmKg4dllGne12sCmNpNGyQqrelUDWet6J4Y/deL3xxMXiIz7KwjNlsZymnWiBrLggag==
X-Received: by 2002:a17:90b:4c42:b0:39e:4c80:f680 with SMTP id 98e67ed59e1d1-3a098bb66d1mr8321977a91.31.1790442656808;
        Sat, 26 Sep 2026 10:10:56 -0700 (PDT)
Received: from ltu.. ([171.245.4.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976c7435sm17467136a91.11.2026.09.26.10.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 10:10:55 -0700 (PDT)
From: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Chengfeng Ye <dg573847474@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	tien.nguyenminh@embeddedlinux.blog,
	stable@vger.kernel.org
Subject: [PATCH v3] dmaengine: sun6i: Fix potential deadlock on &sdev->lock
Date: Sun, 27 Sep 2026 00:10:49 +0700
Message-Id: <20260926171049.841335-1-tien.nguyenminh@embeddedlinux.blog>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chengfeng Ye <dg573847474@gmail.com>

As &sdev->lock is taken by the tasklet sun6i_dma_tasklet() in softirq
context, other users of the lock in process context should disable
interrupts, otherwise the tasklet can preempt a holder of the lock on
the same CPU and deadlock. sun6i_dma_terminate_all() and
sun6i_dma_pause() take it without disabling interrupts.

This was found by an experimental static analysis tool for irq-related
deadlocks. Lockdep reports it too on an Allwinner T113, where the lock
is also taken inside the HARDIRQ-safe vc->lock:

  [  299.389380] WARNING: possible irq lock inversion dependency detected
  [  299.411196] c7109568 (&sdc->lock){+.-.}-{3:3}, at: sun6i_dma_terminate_all+0x40/0x2c4
  [  299.419137] but this lock was taken by another, HARDIRQ-safe lock in the past:
  [  299.426398]  (&vc->lock){-.-.}-{3:3}

Use spin_lock_irqsave() in both places, as
sun6i_dma_free_chan_resources() already does.

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Cc: stable@vger.kernel.org
Signed-off-by: Chengfeng Ye <dg573847474@gmail.com>
[tien: rebased, added the lockdep report from a T113, Fixes and Cc stable]
Signed-off-by: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
---
I ran into this on a MangoPi MQ-Dual (Allwinner T113-S3): with lockdep
on, stopping dmatest set off the report above in
sun6i_dma_terminate_all(), and a small test module set it off in
sun6i_dma_pause(). While looking for a fix I found Chengfeng's v2 from
2023. It never got a review and no longer applies, so I rebased it on
dmaengine next and added the lockdep report, a Fixes tag and Cc stable.
Chengfeng, I hope you don't mind me picking it up.

With it, lockdep stays quiet on both paths on 7.3-rc4, and dmatest on
four channels passes while another channel is paused, resumed and
terminated in a loop.

v2: https://lore.kernel.org/20230726051727.64088-1-dg573847474@gmail.com

 drivers/dma/sun6i-dma.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 5ad9d01cf..aee32363c 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -887,6 +887,7 @@ static int sun6i_dma_pause(struct dma_chan *chan)
 	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
 	struct sun6i_pchan *pchan = vchan->phy;
+	unsigned long flags;
 
 	dev_dbg(dmaengine_chan_dev(chan), "vchan %p: pause\n", &vchan->vc);
 
@@ -894,9 +895,9 @@ static int sun6i_dma_pause(struct dma_chan *chan)
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
@@ -935,9 +936,9 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 	unsigned long flags;
 	LIST_HEAD(head);
 
-	spin_lock(&sdev->lock);
+	spin_lock_irqsave(&sdev->lock, flags);
 	list_del_init(&vchan->node);
-	spin_unlock(&sdev->lock);
+	spin_unlock_irqrestore(&sdev->lock, flags);
 
 	spin_lock_irqsave(&vchan->vc.lock, flags);
 

base-commit: 0a8dda0a15d3926422d286567f945a05328a4ac6
-- 
2.34.1

