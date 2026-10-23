Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792798727;
	b=y59dKX4lKlCkjMdarZ91JXYuZzfpMiLJLchiErv3fUfFRHag3Gq+Rksle1SzyOhiQsYZ
	 tHqWa868trJ5Ndt5oNBhfVfBMPQGDAoD/ETEZwG30NsHd9N34oEqC7nkfljPIluwgpl2H
	 +Ay0p5rsaot46g1gJ4VfghGeTrqdS1c2KKzjLp/xl1oClnZdYf5W2j2KzAxsoOsu2lGsG
	 /J1uz0PL2/wZRAOZtCm9DFOMTrsiDxX0Fd2kY5UVBDCMt5mBgzWVqcbUK6etK+T2KDZ20
	 eerZ2ASyqMjSCtgbeylAG4F6eK9/m36hAJrxbtO3m03BIFedEBPghgANoH4Lq0NBaPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792798727;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=R5FazDKhThxOYInKBUow6UStlAet68U4bSmH8n3hkL8=;
	b=Qtl83rvDTXoEKfG5bi7JdEjeKWXvFPtiZIH1EH1Owy5qSWibimjwswpb7eazln8B85Gg
	 AGoNWk69IEU0CkeZTPgTHh6CoOZyVV7e6Fq/LtKKXRNAy9CAFdoO923eP5ly3BmgfkiGu
	 wrHqQA081Erf3GWfUMtZVYZOZSukDJ7n/q4tCVXMOGbrlN1KJaT0W4X2d3uR2EMhPwOrd
	 GZ2QnUowqweMrgNoJcZQHbADV1CKWQEBV9fynmocJu+ZMsoA4zWyZztprC1D2SBPwgTyB
	 QId8qMJeGMvCb+JGcgOiHRpvlhR+omCysZdS+dlFlaQGkoBGpnmYkG0u6dfNURgo2Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=l9p4HIL5;
	arc=none smtp.remote-ip=209.85.160.47
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB0C60A2629
	for <linux-sunxi@lists.linux.dev>; Fri, 23 Oct 2026 23:38:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFB0C60A2629
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=l9p4HIL5
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-475920b9ca2so551948fac.1
        for <linux-sunxi@lists.linux.dev>; Fri, 23 Oct 2026 16:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792798726; x=1793403526; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R5FazDKhThxOYInKBUow6UStlAet68U4bSmH8n3hkL8=;
        b=l9p4HIL5ctt8PrNbVV/rbbG4PPAXA9T73teybeEJn8ZM+LIlYx5ymjqLEGApXe94/y
         b3rrDI1m8czpGRafz7OASjVIhUPzvk4W1LPjj39ximq97qBEw0xUwerTDWdqioObktfn
         ZBp+ZO95sP91z+vWDzzU+kd9cIqwIcaxEZXFMNmHlrv6nfNkF9jN6YvdxFsnyaGxh5H6
         a+6oKdiVud8NodLrXYVmZSkxnJYyXN9OHkDdr2kzd7Xmbv4HlliDNaIJRtWWYoMUUAkx
         d5LcKxOr1PT7eGnThVhckilbo0wkCz+nTNYZWHy/XccvT1m8LgevI1cBAQhBUlNmp0FE
         AOog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792798726; x=1793403526;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R5FazDKhThxOYInKBUow6UStlAet68U4bSmH8n3hkL8=;
        b=qznlD5OYv+AfuBeuOqPkAXA9YYUyKfMBWmIbky273OA+s9wA6zf+56rlIJaQuOCCoF
         kR8RVh+7Ibie9wLu0S0iftCYEux0tqqI0uCsle1rDqMxXiPZFHRfJy4UL+sCplOG2PhW
         1MgBrEVINSLaKXp2wp18fl31Atx1mQQ6v68NKjXs//KNQwjQsdeLRgvPyjLWgRBUmpc2
         bw3bI2jonT9DSSGmkttwK4rP0RdkhSsBh2KhZJabB9+cTv5g4aCYaV/o/hcHLCdu7oW7
         R/XBjnvnJhSq3k4HvKlDpPb+oLsMGQl01egYdQclKULcJsntqvvwAgo9kwr+tp+DVkQw
         ve2A==
X-Forwarded-Encrypted: i=1; AKwUvBy6NOfXHDoxle+TgBtyoSC5ulo8R/MiWlTkx9M5RGV/0terhtaN2D4vp6+UZ/eZ4uJqK+BopX1JAoxwYg==@lists.linux.dev
X-Gm-Message-State: AFq9FYKzulOd+SkiJrfiUiqfNiSrAmDJ6Hn6lWXWmeXi7lEk28l2yHIC
	4rnTUg7ZPBpsDkv5zUqRzU+aq4uqhjAoCV4hpD2143F+BvIyEsS9GHFCqMyNMr8B
X-Gm-Gg: AYBFou3fm4MGdkIuKUopzqpoTsYvd396i38CiKecB1y618grj2lcLzcjKzSO1NkM8hg
	91CidPkIFtgr8fpTms769Ro0uv0Md4xAXdIdM2/1J/T0FKXOP92ZSS4g0mf475fpTZfL59bPvHJ
	8cnJMFAvjnKrCbvu46Co4zdCtQOfYHXh3ue6aZLHc2ta6jXjOb539Zws2fqj/QVl6f/VGuLQ55O
	WWJkrn1BCr4nLA62G13MFNv6ZGwgym/Wxwa03lQuGYzCpRkiS/VTE5kU5tfyd1c2MU2WMnRMtYc
	dcVRvMs7MSJQSacllHLfs0hSPwv6zYdvNIBM9q4neEQnJCsuNkg0c2EczrAdYinrTrJ+NZbIjwe
	7R6F3qhFzySGSm/t1BJgszl3M+4jXWZCkvVmjClgTPQEdDLcHCwmCqrsViRa0TYoIBrW+V0F4hq
	FigPfNkmC0bnQvYaINmxQUP8mJL19YhLVr/TkanzAX+WFQsdVD3RKJ6hf0ITM4rOdaWGZtK+0Gc
	ioMFiUAS00QDMUYPN3VY5GFFyxQMZxXSNYINQDQfClpXo/D821Rzh5cTulUlEfrA0YTwri8SXxN
	KcznrqYoxbHDgJjII90SLLXHsS7bYJj/DNACHzGnKkDlMjF0vTwmv7C2MmMrdwX94/eshEq0vwR
	JI8/CPBLl+tJCAkxJTj/MZSfvsF2GO7LwF4S07Plf8qCXzaRCPtNHDTreKeBeGqO88+ZV/hrzuR
	qB5Fg=
X-Received: by 2002:a05:6870:8322:b0:4a7:5eb7:ab9c with SMTP id 586e51a60fabf-4a83f58e567mr601234fac.28.1792798725802;
        Fri, 23 Oct 2026 16:38:45 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a843225d69sm284345fac.15.2026.10.23.16.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:38:45 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 17:38:28 -0600
Subject: [PATCH v3 9/9] dmaengine: sun6i: keep cyclic state with the
 prepared descriptor
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-9-ef1acb0be768@gmail.com>
References: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-0-ef1acb0be768@gmail.com>
In-Reply-To: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-0-ef1acb0be768@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>, 
 Maxime Ripard <mripard@kernel.org>, Jens Kuske <jenskuske@gmail.com>, 
 Jean-Francois Moine <moinejf@free.fr>
Cc: Hongling Zeng <zenghongling@kylinos.cn>, 
 Chengfeng Ye <cyeaa@connect.ust.hk>, 
 Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>, 
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Preparing a cyclic transfer sets vchan->cyclic before the descriptor is
submitted. A finite transfer on that channel can then select package
interrupts and take the cyclic callback path instead of completing its
cookie. Merely preparing an unrelated future transfer must not change
the active transfer or the meaning of queued descriptors.

Store the flag in sun6i_desc and consult the active descriptor when
selecting interrupts, completing a transfer and terminating it. Finite
descriptors retain their zero-initialized flag. This also makes callback
retirement depend on the descriptor whose lifetime is being ended.

The shared state was identified during the H616 cyclic UART RX review.

Fixes: a90e173f3faf ("dmaengine: sun6i: Add cyclic capability")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index b83138745bd1..2152979f72f2 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -191,6 +191,7 @@ struct sun6i_desc {
 	struct virt_dma_desc	vd;
 	dma_addr_t		p_lli;
 	struct sun6i_dma_lli	*v_lli;
+	bool			cyclic;
 };
 
 struct sun6i_pchan {
@@ -207,7 +208,6 @@ struct sun6i_vchan {
 	struct sun6i_pchan	*phy;
 	u8			port;
 	u8			irq_type;
-	bool			cyclic;
 	bool			paused;
 };
 
@@ -507,7 +507,7 @@ static int sun6i_dma_start_desc(struct sun6i_vchan *vchan)
 			     (DMA_IRQ_HALF | DMA_IRQ_PKG | DMA_IRQ_QUEUE) <<
 			     (irq_offset * DMA_IRQ_CHAN_WIDTH));
 
-	vchan->irq_type = vchan->cyclic ? DMA_IRQ_PKG : DMA_IRQ_QUEUE;
+	vchan->irq_type = pchan->desc->cyclic ? DMA_IRQ_PKG : DMA_IRQ_QUEUE;
 
 	irq_val = sun6i_read_irq_en(sdev, irq_reg);
 	irq_val &= ~((DMA_IRQ_HALF | DMA_IRQ_PKG | DMA_IRQ_QUEUE) <<
@@ -610,7 +610,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 			desc = pchan->desc;
 			if (vchan && desc && (status & vchan->irq_type)) {
 				spin_lock(&vchan->vc.lock);
-				if (vchan->cyclic) {
+				if (desc->cyclic) {
 					vchan_cyclic_callback(&desc->vd);
 				} else {
 					/* Completion transfers ownership to virt-dma. */
@@ -911,7 +911,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_cyclic(
 
 	prev->p_lli_next = txd->p_lli;		/* cyclic list */
 
-	vchan->cyclic = true;
+	txd->cyclic = true;
 
 	return vchan_tx_prep(&vchan->vc, &txd->vd, flags);
 
@@ -1000,13 +1000,12 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 		struct virt_dma_desc *vd = &pchan->desc->vd;
 
 		/* A cyclic callback may still hold this descriptor outside vc.lock. */
-		if (vchan->cyclic)
+		if (pchan->desc->cyclic)
 			vchan_terminate_vdesc(vd);
 		else
 			list_add_tail(&vd->node, &head);
 	}
 
-	vchan->cyclic = false;
 	vchan->paused = false;
 	/* Leave terminated cyclic descriptors for the sleepable synchronize. */
 	list_splice_tail_init(&vchan->vc.desc_allocated, &head);

-- 
2.53.0

