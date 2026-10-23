Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792780984;
	b=F9PPTvOLBANmIWRgNzsmUxP3mDCZ8xVy0KAIHfNt/QTOhgz5t+eMqx22xwzXqkoigvtF
	 NNSo5p/rDsFwl3P3gN6qHnp1oiu98kvAn/8k4ITwHgYdEBsHcIMyH14DgUXjFKc5kfy+a
	 ZQDkYo95dYw+n7bRhOD5gfgnBcp24tAknA4hViJWvh+qgTmY4tId8qsUYBdrlxmfm52EN
	 u0miwtZK+8SxC3W5kMq6RGWnJeqiK1cwYp7f1lxEWkDjRFLHRrswGbQaXbposX/+jkUEB
	 rvCk2Fi/deq/EOuQ0ns7X4eXZppUlyGZnHrovHcQ8Y8A7mAyDA8PvD416T3f9XwuVTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792780984;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=PqNMKX2JAKOcdDMHgbj/E/YCDonhqS9mo8xwaEZBKXY=;
	b=Z3glM6gtSnvPYjqLGnSw8qod6IUh2M8sCr3dArxLsxtl+Megv5optNfaKL0ohTo2Ve2v
	 /SL8ip3YLYCdmheArDNLUprTSUXppVclZvFvr6lHScVGVMzRh2M28fBsR1RmE3p01c+Dp
	 GwMZ22g0CHW9bZ27eOczbg/eA4io5TgNfRs9PzC++ratHJSMal0aaRKdrAHDy7QOXy2QD
	 9tLN+LMV4qnybamK6LEzecN1iGSUZ01aswcwE6NJCBBgjljHUH3SaABgoE0qnzx2azvUc
	 c62IikYGeZa/AgAM3KiY3dCxJoZvOzTRDL1vlZnE5TL7zfTa1ac0RFESsiHwT4PSYqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="IE7JoqV/";
	arc=none smtp.remote-ip=209.85.167.182
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC1E60A2607
	for <linux-sunxi@lists.linux.dev>; Fri, 23 Oct 2026 18:42:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AC1E60A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IE7JoqV/
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-4c382ece86fso608900b6e.1
        for <linux-sunxi@lists.linux.dev>; Fri, 23 Oct 2026 11:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792780971; x=1793385771; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PqNMKX2JAKOcdDMHgbj/E/YCDonhqS9mo8xwaEZBKXY=;
        b=IE7JoqV/7kZ/srCOuAFdFuykRBCW4ADu7ONIpWaJT0gUctgZ6GarvBH7fanaWIqCv7
         FtsGtYLpMhgOYMmy7qJgKyXjgLlEwOb66IoN4n4XWr9ZPgWvG3Uai8wo+24iXPDpmkDj
         fzZ+oVpLu11WIHIx0u+DkwhKgn7GSa1/0/vRiFIjlhzY0xa3wOt2KEFpC/WoLyK/5qvB
         5kT4sHIbQcLE5Y9bEikmnRRmtFwWrSObQ3AjYuG3perEq2w8VEBN3YXUiCeROzMVMVQf
         pHIZJmJ2Wd6w7mWCTME09IvhkWxxFNN2uuaxP902wY9FfsDUq5sRH1avuoYz3kCrk0c3
         ahYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792780971; x=1793385771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PqNMKX2JAKOcdDMHgbj/E/YCDonhqS9mo8xwaEZBKXY=;
        b=U2Xtl/x4330b7gnrPsNJMdLROTWjDiRHjfVNrSxe4vaHwxBBznSvY2W0rwRtr/kvu1
         ZipV9uCSZD4Rk1y7GaT+Y9eoF0Y5V73pHCMWahTdm0Zs08Se7ZHVDEmCvhIN+W6ivJlF
         sSpmV2z+PGdvd926fPyiuycUfvxkxeinlgjB1XW416ShbSYIVvA0u4XDbf46HJCsyTUS
         M9vjjCOehTtWwtIwsSAZZu3ezSXQztXxAOkbs85t2GyAVZI8Qtb9Oz8SV4TuBbImCEo7
         daoDS6jeHWwxets4AW1rayciaLrZaIsAqDIMxyZii06nPSKcybzE6AihUtAvEVU2b2bd
         9rQA==
X-Forwarded-Encrypted: i=1; AKwUvBzMAs7MDfkpASI/7LYhEy030mM1kSIznBohjjjRm1Gebkz2lImgIar0mLBVJKWA/Y/E3wlH00iLP2c4Qg==@lists.linux.dev
X-Gm-Message-State: AFq9FYL4/UsSxcoTk4Ml5ygLMFeKrg5Q+o/b+NSEKBoihwshdD34L2Qc
	LMadsObx0ICXhphJirJytp77I6/3nQBDPel8bHVdWupycI+Ljq4cMLz5
X-Gm-Gg: AYBFou1KcYz1HdDlUB+AiBhyFL3Bm7edaZ/2bu2M1+PoVJEa6gVCJjMGOF2OW5u7ptI
	avNS2wd9QVn6pt2Y04E7JH5qEhEje2c0AS+t/i+bWfbxWmNY0b9bW2NX98qZgf9NkkPa6B14g9O
	Brlao6rBUaQ9al2Rx9BF9rJf8xNfmwJ+WYH66UZ7Z+VNuO6ClrQ4r4beBeVFXH3wvJ0KJvFs14E
	Y/GqYx5YTK3f8js8Dejr3btfokJbxW07bxe4I7DOSouY3wukekEgqBKuplwcIOXeHtnETJ/tSO/
	bd6spvQSsSTWM/5JyK76zoWn29unn7qCxkdFTTO6VeZBhLWlqvMZfdg7xzxkR0lDiKdrjpP3ctP
	wNFJYZpVO6PLWMcg9ZzmWpfh0dVrJwjjy5BErkqkMCGXSalY/QbnTdZME44eOcyg7ocpej9IGls
	nOMIT2RaV58ilV02hE7CzrlknvSO2MVM2QTnLqbXIPLpkVuM3HYDNgIZcQIV0OHndFZ3ZZZkw7g
	KoH/06IoN0r8ceJqmSZpcyvuiva4ch9jozrhQQtB7/4+wEBD+6U6pmfSfpDDPEUkHws69ie9LWu
	L0Pv/5TOVuNx7O0nbHZjOQ0PPZEsZ8QXynSicTLrsdSyJd6wgIPOfvbtTzNwQVCApA+pfCZvgVH
	dJ8/aLlxIrYGFXXTDhxJRBmUShzUhPKOIz3qbcjjTgHzAYXiljZVREMjKymLExYSGGRr/n7NK+t
	1dhtM1yjKrqjfvvQWeZgeeozI=
X-Received: by 2002:a05:6808:1911:b0:50a:6fcf:d287 with SMTP id 5614622812f47-55c00232f05mr72486b6e.37.1792780971361;
        Fri, 23 Oct 2026 11:42:51 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55bfe199544sm336682b6e.13.2026.10.23.11.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 11:42:50 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 12:42:40 -0600
Subject: [PATCH v2 6/6] dmaengine: sun6i: keep cyclic state with the
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
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-6-c9e07cc44bf8@gmail.com>
References: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-0-c9e07cc44bf8@gmail.com>
In-Reply-To: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-0-c9e07cc44bf8@gmail.com>
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
index c244ef572492..c9a72cfe3f44 100644
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
 
@@ -504,7 +504,7 @@ static int sun6i_dma_start_desc(struct sun6i_vchan *vchan)
 			     (DMA_IRQ_HALF | DMA_IRQ_PKG | DMA_IRQ_QUEUE) <<
 			     (irq_offset * DMA_IRQ_CHAN_WIDTH));
 
-	vchan->irq_type = vchan->cyclic ? DMA_IRQ_PKG : DMA_IRQ_QUEUE;
+	vchan->irq_type = pchan->desc->cyclic ? DMA_IRQ_PKG : DMA_IRQ_QUEUE;
 
 	irq_val = sun6i_read_irq_en(sdev, irq_reg);
 	irq_val &= ~((DMA_IRQ_HALF | DMA_IRQ_PKG | DMA_IRQ_QUEUE) <<
@@ -607,7 +607,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 			desc = pchan->desc;
 			if (vchan && desc && (status & vchan->irq_type)) {
 				spin_lock(&vchan->vc.lock);
-				if (vchan->cyclic) {
+				if (desc->cyclic) {
 					vchan_cyclic_callback(&desc->vd);
 				} else {
 					/* Completion transfers ownership to virt-dma. */
@@ -908,7 +908,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_cyclic(
 
 	prev->p_lli_next = txd->p_lli;		/* cyclic list */
 
-	vchan->cyclic = true;
+	txd->cyclic = true;
 
 	return vchan_tx_prep(&vchan->vc, &txd->vd, flags);
 
@@ -997,13 +997,12 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
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

