Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792725305;
	b=SF4A6YvUDDEUDdGtF1icNfJr2nEsKj15jVLnMrDVIUWHv0OmyPzz1Ys1uRAni0cSmuuT
	 Ds82qg/ooY4dnSKAS1bVvJlQCgvd6tktoUcc+AVfVrpxvHrjcjOHocukuJylbXeUYhJ3b
	 kgP4nUPUH42Z3UsXAUE4AZXwX767ZVD8eny6IGC9g8LaFn7vymODQ8GzkbRNnA8LNy/oD
	 fvmw1fYGRVRc1eLL4KKRVIrnFJNybdUAOmLz/tdr0azrEwA6SsLS8U9Mq457DKDDiBp4B
	 kKnRXVKdDTm2p2gwPpdzdlkjUC6YmFaRCD8kmfmU0409/qH8+VcBEMcjBNwmaGigM/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792725305;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=/Xshv/zG8TvKr+Lm5B41zSVm4wEapx/TH2rePk5m7qE=;
	b=vh6LYgIV8UQ3synDR16SPOl4gEi9kicPmhck30y1JHKSuGplsuB41/iyDU5v6VhsrZVw
	 5OP/yoR81WeWmsPbekAH1YS/uJfdBDrT3+tCxX/fYjiYYsh177bWhEJ7Oo2Yfi/xQReGi
	 l/aS00R7Q8UZcN8T+3krwoniJ8ia1e/9xhocqS8hvbK9rBo0EUVwgTuO1zEn+nkD13Rs2
	 UK9HjAD5JmzjGNeT11x2PmMmPKoSibWLvGrvDhbabFjgNXmD4DQxnkZBf5/geln0AfQlq
	 uDifdL2OghAht5UpWgb4wxOGy/Gwq7y95em4tWez/mkcGfKsK2Tgc4LQhnPj0MLvyXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=S2LETnGp;
	arc=none smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40E7606A328
	for <linux-sunxi@lists.linux.dev>; Fri, 23 Oct 2026 03:15:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F40E7606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=S2LETnGp
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6faddda49e7so413852eaf.3
        for <linux-sunxi@lists.linux.dev>; Thu, 22 Oct 2026 20:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792725302; x=1793330102; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Xshv/zG8TvKr+Lm5B41zSVm4wEapx/TH2rePk5m7qE=;
        b=S2LETnGpvQnfneUKSWpJmVyYAqoLRnpa5J8QCm/eIgJg8G7+hx2eiHTViECU/FZe8U
         vn1zJODsrif+GujSwQRE9eaxpjOy/UNj84ikKMMGNKU+YQHOudmcPqphiAs0gryHkP19
         Xm18jwfDkEdC3gIf4AMpMZRgBZ51uBPuTcJna5Bat/q0R5s33GeDYBRV91v+jUh2Jh4W
         QC5anpMSbG2r/EGkT15OVc+lQ74fGvPiP9rbnDW8UJhZDgAQJ6Pl70Xhp5x7BP2ZLfz1
         pmUh7VQIYRC2e+HcsOsdvkV/2/AcdwnV3DD8dyNhDO7KOv1EnoYDHO+eZsckdvkwEXw/
         LBrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792725302; x=1793330102;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Xshv/zG8TvKr+Lm5B41zSVm4wEapx/TH2rePk5m7qE=;
        b=AMcnwE6MbbMbCieWxk7a83PRl6sIj2/7tjsxYmzD2j1/rdE6L2kNiF2bU0lbSdecRh
         CtcC/HslPG3aA1zc/rqX+IhD+uS/jb8gnamQYCRZNKcLu9MkuOf+g+ALZKC09924phLu
         ublrMb9Ki5iTNqAXnxXBdq/Cmw6qEDob1VVIKpaPabJLylJkO1azXgsy2loPzzeOTgYQ
         Nvlt2EH8ND469GegfbtBcdCcMC08sdVkHKfekvVH3n80YxNeZPgNvRPjVCPrcGb3k2Te
         r8npP6AIyAHFdmlaOzs9ZdKnQqXH8UgjAc0nFo5evNW21Ty4tDQJAtuDljjlaWFj6fIP
         WG3w==
X-Forwarded-Encrypted: i=1; AKwUvBzedEXgsKUZDwtfncDVopoDp/y1I68sBm1DOJHXK7z9oc+/xtWxVbgUdwCJP54UhIUaVp8hyNh3Zd5DZQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYLqTzKDtTbXIgG9NvG4maf+bq7B2pikfor2aTu0VtI4RcaiuLKH
	V7u4pxpkySTt5hkBB83C0cOoeGULQvvIITa+4MdfSnotolBI9P57DkIs
X-Gm-Gg: AYBFou1DmhTxj07cwR+yhThGUT8UDY2BHPTuO4dHbrXXhzU5uRq+e1NfpJP1Zl9943f
	pyu48Y+hZ9/zOhUjwQTk5IxiGOUALEL+OriekYsNjw9mj0jZhtVQ6mqnvGTDpIDCmfH7ziZXNv/
	I0W/sVO5GeVk9L1Z3szwX0tSGXDaIXsYqbVMF5w/6a9ZOjWn8YDB8rIGyAOV/UwxMTecZWBIIa6
	Lb5E2jOcR6x+W4BC5W3esG7GNzM52acuW1EPKNIppKv6Rcz4gdhNkFqq+xvq28ciH6+KaRN6iDa
	iVAKXX7fZBK5DB9tUgjEYKI9cYUZD3IldMICYmQKgY6Pj8I2qr5eq7OF9Q/oE4s43cNfxSpe7Qx
	35PpAoAkHmF3EiOh3dS6CT5UYoyhK0jwy5KrQsEwgg6O3ssALDTXyRodq4PeFn3HzsFRknhXNa/
	kh3HRJwjpMu+rIt5G4DqcoBHp7F8fgn9k73mF+DdVejm8NME8NBDj9XaZ7v+Q2bojPCw2emPVMy
	AbfpNDtqgaykkuvCOxIVjIVhdUOYLQLkvQM0iB4S9+CWFj9MFXDrCnqrSfKLQyGJVSpuzzpQ+z6
	ZdfBETZG/uMrtH7h7arQZAXa+Qi8/L3b4Vpr8hxzKeEx1UEa9l4v3vniLLAF5P4w6ZDJTlpvDuc
	DAS6ysKqIztoqi5oZ2CTF2hoC6QvmHFpdTm9w7Nm9MRu8sd8gvHH8DsYjzCmf513rcZlAXsrAkb
	TBUxM=
X-Received: by 2002:a05:6820:a516:20b0:6d0:1fe7:1744 with SMTP id 006d021491bc7-70b88a9b614mr552186eaf.83.1792725301918;
        Thu, 22 Oct 2026 20:15:01 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84fbda584d9sm938638a34.13.2026.10.22.20.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 20:15:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 22 Oct 2026 21:14:54 -0600
Subject: [PATCH 3/6] dmaengine: sun6i: serialize channel reassignment with
 interrupt handling
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
Message-Id: <20261022-submit-sun6i-dma-lifetime-next-v1-v1-3-01085f684c9f@gmail.com>
References: <20261022-submit-sun6i-dma-lifetime-next-v1-v1-0-01085f684c9f@gmail.com>
In-Reply-To: <20261022-submit-sun6i-dma-lifetime-next-v1-v1-0-01085f684c9f@gmail.com>
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
 James Hilliard <james.hilliard1@gmail.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2

The allocator changes vchan->phy and pchan->vchan under sdev->lock, but
termination reads the physical channel before taking either lock. The IRQ
handler also takes an owner snapshot without protecting it. Termination
can therefore miss a new assignment or detach an owner while an interrupt
is about to complete its descriptor. An IRQ status snapshot can survive
reassignment and be applied to the next transfer.

Use sdev->lock for physical-channel ownership, pending channels and the
shared interrupt registers, nesting vc.lock inside it for descriptor
lists and cookie updates. Allocate and start each pending channel in one
critical section. Read and acknowledge IRQ status under the same outer
lock, and protect cyclic notifications as well as ordinary completions.

Mask and clear a stopped channel's IRQs before releasing its ownership,
and clear pending status before starting a new descriptor. Schedule the
allocator after termination so other pending channels can use the released
physical channel without depending on another device interrupt.

This also keeps process-context acquisitions IRQ-safe. Client callbacks
remain outside these locks in the virtual-channel completion tasklet.

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260706065650.34B131F00A3A@smtp.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 101 +++++++++++++++++++++++++++---------------------
 1 file changed, 56 insertions(+), 45 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 0a9645171180..cd0562de7def 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -217,6 +217,7 @@ struct sun6i_dma_dev {
 	struct clk		*clk;
 	struct clk		*clk_mbus;
 	int			irq;
+	/* Channel assignment and register access; nests outside vc.lock. */
 	spinlock_t		lock;
 	struct reset_control	*rstc;
 	struct tasklet_struct	task;
@@ -502,6 +503,11 @@ static int sun6i_dma_start_desc(struct sun6i_vchan *vchan)
 	irq_reg = pchan->idx / sdev->cfg->num_channels_per_reg;
 	irq_offset = pchan->idx % sdev->cfg->num_channels_per_reg;
 
+	/* Do not deliver a previous transfer's interrupt to this descriptor. */
+	sun6i_write_irq_stat(sdev, irq_reg,
+			     (DMA_IRQ_HALF | DMA_IRQ_PKG | DMA_IRQ_QUEUE) <<
+			     (irq_offset * DMA_IRQ_CHAN_WIDTH));
+
 	vchan->irq_type = vchan->cyclic ? DMA_IRQ_PKG : DMA_IRQ_QUEUE;
 
 	irq_val = sun6i_read_irq_en(sdev, irq_reg);
@@ -524,11 +530,11 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
 	struct sun6i_dma_dev *sdev = from_tasklet(sdev, t, task);
 	struct sun6i_vchan *vchan;
 	struct sun6i_pchan *pchan;
-	unsigned int pchan_alloc = 0;
 	unsigned int pchan_idx;
 
+	spin_lock_irq(&sdev->lock);
 	list_for_each_entry(vchan, &sdev->slave.channels, vc.chan.device_node) {
-		spin_lock_irq(&vchan->vc.lock);
+		spin_lock(&vchan->vc.lock);
 
 		pchan = vchan->phy;
 
@@ -545,10 +551,9 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
 				pchan->vchan = NULL;
 			}
 		}
-		spin_unlock_irq(&vchan->vc.lock);
+		spin_unlock(&vchan->vc.lock);
 	}
 
-	spin_lock_irq(&sdev->lock);
 	for (pchan_idx = 0; pchan_idx < sdev->num_pchans; pchan_idx++) {
 		pchan = &sdev->pchans[pchan_idx];
 
@@ -557,31 +562,20 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
 
 		vchan = list_first_entry(&sdev->pending,
 					 struct sun6i_vchan, node);
+		spin_lock(&vchan->vc.lock);
 
 		/* Remove from pending channels */
 		list_del_init(&vchan->node);
-		pchan_alloc |= BIT(pchan_idx);
 
 		/* Mark this channel allocated */
 		pchan->vchan = vchan;
 		vchan->phy = pchan;
 		dev_dbg(sdev->slave.dev, "pchan %u: alloc vchan %p\n",
 			pchan->idx, &vchan->vc);
+		sun6i_dma_start_desc(vchan);
+		spin_unlock(&vchan->vc.lock);
 	}
 	spin_unlock_irq(&sdev->lock);
-
-	for (pchan_idx = 0; pchan_idx < sdev->num_pchans; pchan_idx++) {
-		if (!(pchan_alloc & BIT(pchan_idx)))
-			continue;
-
-		pchan = sdev->pchans + pchan_idx;
-		vchan = pchan->vchan;
-		if (vchan) {
-			spin_lock_irq(&vchan->vc.lock);
-			sun6i_dma_start_desc(vchan);
-			spin_unlock_irq(&vchan->vc.lock);
-		}
-	}
 }
 
 static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
@@ -590,9 +584,11 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 	u32 channels_per_reg = sdev->cfg->num_channels_per_reg;
 	struct sun6i_vchan *vchan;
 	struct sun6i_pchan *pchan;
+	unsigned long flags;
 	int i, j, ret = IRQ_NONE;
 	u32 status;
 
+	spin_lock_irqsave(&sdev->lock, flags);
 	for (i = 0; i < DIV_ROUND_UP(sdev->num_pchans, channels_per_reg); i++) {
 		status = sun6i_read_irq_stat(sdev, i);
 		if (!status)
@@ -608,14 +604,14 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 			pchan = sdev->pchans + i * channels_per_reg + j;
 			vchan = pchan->vchan;
 			if (vchan && (status & vchan->irq_type)) {
+				spin_lock(&vchan->vc.lock);
 				if (vchan->cyclic) {
 					vchan_cyclic_callback(&pchan->desc->vd);
 				} else {
-					spin_lock(&vchan->vc.lock);
 					vchan_cookie_complete(&pchan->desc->vd);
 					pchan->done = pchan->desc;
-					spin_unlock(&vchan->vc.lock);
 				}
+				spin_unlock(&vchan->vc.lock);
 			}
 
 			status = status >> DMA_IRQ_CHAN_WIDTH;
@@ -625,6 +621,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 			tasklet_schedule(&sdev->task);
 		ret = IRQ_HANDLED;
 	}
+	spin_unlock_irqrestore(&sdev->lock, flags);
 
 	return ret;
 }
@@ -931,19 +928,20 @@ static int sun6i_dma_pause(struct dma_chan *chan)
 {
 	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
-	struct sun6i_pchan *pchan = vchan->phy;
+	struct sun6i_pchan *pchan;
 	unsigned long flags;
 
 	dev_dbg(dmaengine_chan_dev(chan), "vchan %p: pause\n", &vchan->vc);
 
+	spin_lock_irqsave(&sdev->lock, flags);
+	pchan = vchan->phy;
 	if (pchan) {
 		writel(DMA_CHAN_PAUSE_PAUSE,
 		       pchan->base + DMA_CHAN_PAUSE);
 	} else {
-		spin_lock_irqsave(&sdev->lock, flags);
 		list_del_init(&vchan->node);
-		spin_unlock_irqrestore(&sdev->lock, flags);
 	}
+	spin_unlock_irqrestore(&sdev->lock, flags);
 
 	return 0;
 }
@@ -952,23 +950,24 @@ static int sun6i_dma_resume(struct dma_chan *chan)
 {
 	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
-	struct sun6i_pchan *pchan = vchan->phy;
+	struct sun6i_pchan *pchan;
 	unsigned long flags;
 
 	dev_dbg(dmaengine_chan_dev(chan), "vchan %p: resume\n", &vchan->vc);
 
-	spin_lock_irqsave(&vchan->vc.lock, flags);
+	spin_lock_irqsave(&sdev->lock, flags);
+	spin_lock(&vchan->vc.lock);
+	pchan = vchan->phy;
 
 	if (pchan) {
 		writel(DMA_CHAN_PAUSE_RESUME,
 		       pchan->base + DMA_CHAN_PAUSE);
 	} else if (!list_empty(&vchan->vc.desc_issued)) {
-		spin_lock(&sdev->lock);
 		list_add_tail(&vchan->node, &sdev->pending);
-		spin_unlock(&sdev->lock);
 	}
 
-	spin_unlock_irqrestore(&vchan->vc.lock, flags);
+	spin_unlock(&vchan->vc.lock);
+	spin_unlock_irqrestore(&sdev->lock, flags);
 
 	return 0;
 }
@@ -977,15 +976,15 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 {
 	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
-	struct sun6i_pchan *pchan = vchan->phy;
+	struct sun6i_pchan *pchan;
+	u32 irq_reg, irq_shift, irq_mask;
 	unsigned long flags;
 	LIST_HEAD(head);
 
 	spin_lock_irqsave(&sdev->lock, flags);
+	spin_lock(&vchan->vc.lock);
+	pchan = vchan->phy;
 	list_del_init(&vchan->node);
-	spin_unlock_irqrestore(&sdev->lock, flags);
-
-	spin_lock_irqsave(&vchan->vc.lock, flags);
 
 	if (pchan && pchan->desc && pchan->desc != pchan->done) {
 		struct virt_dma_desc *vd = &pchan->desc->vd;
@@ -1000,15 +999,26 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 		writel(DMA_CHAN_ENABLE_STOP, pchan->base + DMA_CHAN_ENABLE);
 		writel(DMA_CHAN_PAUSE_RESUME, pchan->base + DMA_CHAN_PAUSE);
 
+		irq_reg = pchan->idx / sdev->cfg->num_channels_per_reg;
+		irq_shift = (pchan->idx % sdev->cfg->num_channels_per_reg) *
+			    DMA_IRQ_CHAN_WIDTH;
+		irq_mask = (DMA_IRQ_HALF | DMA_IRQ_PKG | DMA_IRQ_QUEUE) << irq_shift;
+		sun6i_write_irq_en(sdev, irq_reg,
+				   sun6i_read_irq_en(sdev, irq_reg) & ~irq_mask);
+		sun6i_write_irq_stat(sdev, irq_reg, irq_mask);
+
 		vchan->phy = NULL;
 		pchan->vchan = NULL;
 		pchan->desc = NULL;
 		pchan->done = NULL;
 	}
 
-	spin_unlock_irqrestore(&vchan->vc.lock, flags);
+	spin_unlock(&vchan->vc.lock);
+	spin_unlock_irqrestore(&sdev->lock, flags);
 
 	vchan_dma_desc_free_list(&vchan->vc, &head);
+	if (!atomic_read(&sdev->tasklet_shutdown))
+		tasklet_schedule(&sdev->task);
 
 	return 0;
 }
@@ -1017,8 +1027,9 @@ static enum dma_status sun6i_dma_tx_status(struct dma_chan *chan,
 					   dma_cookie_t cookie,
 					   struct dma_tx_state *state)
 {
+	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
-	struct sun6i_pchan *pchan = vchan->phy;
+	struct sun6i_pchan *pchan;
 	struct sun6i_dma_lli *lli;
 	struct virt_dma_desc *vd;
 	struct sun6i_desc *txd;
@@ -1026,11 +1037,12 @@ static enum dma_status sun6i_dma_tx_status(struct dma_chan *chan,
 	unsigned long flags;
 	size_t bytes = 0;
 
+	spin_lock_irqsave(&sdev->lock, flags);
+	spin_lock(&vchan->vc.lock);
 	ret = dma_cookie_status(chan, cookie, state);
 	if (ret == DMA_COMPLETE || !state)
-		return ret;
-
-	spin_lock_irqsave(&vchan->vc.lock, flags);
+		goto out;
+	pchan = vchan->phy;
 
 	vd = vchan_find_desc(&vchan->vc, cookie);
 	txd = to_sun6i_desc(&vd->tx);
@@ -1044,9 +1056,10 @@ static enum dma_status sun6i_dma_tx_status(struct dma_chan *chan,
 		bytes = sun6i_get_chan_size(pchan);
 	}
 
-	spin_unlock_irqrestore(&vchan->vc.lock, flags);
-
 	dma_set_residue(state, bytes);
+out:
+	spin_unlock(&vchan->vc.lock);
+	spin_unlock_irqrestore(&sdev->lock, flags);
 
 	return ret;
 }
@@ -1057,25 +1070,23 @@ static void sun6i_dma_issue_pending(struct dma_chan *chan)
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
 	unsigned long flags;
 
-	spin_lock_irqsave(&vchan->vc.lock, flags);
+	spin_lock_irqsave(&sdev->lock, flags);
+	spin_lock(&vchan->vc.lock);
 
 	if (vchan_issue_pending(&vchan->vc)) {
-		spin_lock(&sdev->lock);
-
 		if (!vchan->phy && list_empty(&vchan->node)) {
 			list_add_tail(&vchan->node, &sdev->pending);
 			tasklet_schedule(&sdev->task);
 			dev_dbg(dmaengine_chan_dev(chan), "vchan %p: issued\n",
 				&vchan->vc);
 		}
-
-		spin_unlock(&sdev->lock);
 	} else {
 		dev_dbg(dmaengine_chan_dev(chan), "vchan %p: nothing to issue\n",
 			&vchan->vc);
 	}
 
-	spin_unlock_irqrestore(&vchan->vc.lock, flags);
+	spin_unlock(&vchan->vc.lock);
+	spin_unlock_irqrestore(&sdev->lock, flags);
 }
 
 static void sun6i_dma_free_chan_resources(struct dma_chan *chan)

-- 
2.53.0

