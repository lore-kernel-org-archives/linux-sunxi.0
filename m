Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792798724;
	b=UA0YffW9vRXqlISpTGzMdjEs5hrfZX0fTuEyb9MIHZKG/F6NLWThDdIWWPSOqVRWew4u
	 Nx0yEBhffga4cNIklNcYBiof+iDhM0jK1oApZX8zFGbxc2vCLjV4ESNP5KalXRuFVsmbt
	 6+hncr8FVa2NX8G5NLFsYm4sThB9OF61mO1bJIQIqgCQTKYDBzxiUki5b59n6lTaJKdIv
	 sodXXCF+KsfCU4kJ6aDRwqVMR8h3gvqoT9fj51ndJIYve5RLnJ3T5uvIRw4FvHpa42EJ+
	 j6mM5tF4hH6v6N6xjwn+4E7grHSnP61lbLwMdob8bqHDuTY1Trbr5h0+JFSlBgMBI8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792798724;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=GUQ9hlCoo6Dy1AIQut5SiYH7FfRIMv35mZmA2VeNSQQ=;
	b=siFtp2x0FxRnaEj0wHaeUO10ZM/YA4+0YFKi4IBGLn8vOf8QTTLD9MmmWOFGoMMPwIe2
	 ZiJpavdzvclHBo5H6rzjRMl76XHu8/qxJH1CGx+yVHnZm591Vjkt/dYTXDY0CEZxUAHGo
	 9i0n28yo5Eex/BdocDMiqDFWDvS7Dvu7uLNHVs3CajBBk1fH2kbBGR5Qp/HFdVLOlKROX
	 73op6wnDcuDyYjBDzIsP14b5w12BNGNFSW3L4iw/1JGqRC6/RWPcAvOPHD4f23hidVEej
	 HfzlJpNHMXvcYLO1JSF27Oqt37s6E9ymH85972nIjDCwYZ3V2gRRy1GCmsj4En/Pqog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lrcEtnWZ;
	arc=none smtp.remote-ip=209.85.160.45
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6918606A33B
	for <linux-sunxi@lists.linux.dev>; Fri, 23 Oct 2026 23:38:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6918606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lrcEtnWZ
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-4a6bb779d13so743543fac.1
        for <linux-sunxi@lists.linux.dev>; Fri, 23 Oct 2026 16:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792798718; x=1793403518; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GUQ9hlCoo6Dy1AIQut5SiYH7FfRIMv35mZmA2VeNSQQ=;
        b=lrcEtnWZ/3zB+2P18o9xVPMlfDppOjyf3Q96T58IX0MmvVjWXJNBrDO+GmrRwgsrPy
         L4UzSSefw5XMYBWs+QbjOIjRmA8bRc9ziNlmwT7McU/K8vygoHUNl92NCuD0V2a81CtW
         hQ/DPdwnpRhXmzCOp2aFShl4cA56UTY43cr8yU7GJoldZ1M5lINLSlA5lii1hriTc5Nq
         J4i9v8UXkGJUMaAbDM6N7gnIJnoRipWJEJoDXJTRxaTE6woK7SKx6OsXTE3NwUbfddwl
         fkbcZ23VtPXSWkdmCG6w8re8jP2OUTT0fUUYd0SvapqNADO4FOS0/GxgfftQrxED11Tp
         EIYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792798718; x=1793403518;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GUQ9hlCoo6Dy1AIQut5SiYH7FfRIMv35mZmA2VeNSQQ=;
        b=1QNsdp2/5OKfsi3S5XhXCImu5ZWtGw/ehad/+Yfp6BKkxhO4FoaZp16b5kuQrTzm2l
         Fcc+KbZvGKU31VeRmIM7Epooxu00RYOETWjbEaRuTKTlGoYTJx2x6Wz2yh9JGULmpXW0
         nM6ptrYlp3oHijFnV/575T7ubYwubYyTei3XQ3+Oo38yH/QQG+0DvNHyd4fwvdM1ThEM
         NaBrsrI9sC4gIPsyGIFe9C30JHrl9Tay4VSXbQQ2fK2NHt6GhpJoakxHxJMtdI0eRzP8
         rGI9EveWbHQr+qA6edkq6z6CrFFIMERqozKvY+UC1EFpKDP0RWidiUv7/ve6p4x0FJ/g
         itAw==
X-Forwarded-Encrypted: i=1; AKwUvBwD3p2PFKN2xAprA2HORJqMShuIFuCOHSTmsiA3JO4K5rj4LRBwonpdsaFe8m00CeltJ7R9pIkNIt+sEw==@lists.linux.dev
X-Gm-Message-State: AFq9FYKBx4ljGE/L56NcsMbgJaP/ylRMQJkyPTr5dvuXuzcFCUML3pT9
	iX5Ptiqt5CO2tksBNSZXRHAgG7QgXNZihWhZ7FoWljazXpM9xiyizHN2
X-Gm-Gg: AYBFou16u6ckMIIE4j516kijAz/h5ZoQvdvR8O8nehaNUGsMsKcIJHtjCsMs3ZS7uqC
	O5H0treo6BOIhHQV9KY1QS35NFbH5byM4Rry+av4NtSuvdbIs1eCxSDOsEa3sEaXhaxztnyFXw0
	AOBKRtd3oxqZBRQWs1A/DcVq3z2o/CPzqDxlFtmgrgvXbTlSausIWuBRG4LOTAlF8iJ3zYy9j9j
	Bg0enKpOpOakUVZJvDeChZhMmHiMfWwLUXkbpqZ8UWm+gnZQTGbrhM9xXGbw/KuKl2v4N4qsz5B
	CRQCaPKVfEtrM4QduF2Z+pAZILzTY8v6Z7FDYdFBG7mqcZNZuxjQdwJH8GTcSBHYIf+3YvGiGqS
	0btv42e5N6zQpfpDh00t9HM9GsfE1L4gVxzQ9gMjlM76XrbGVnsmanF6x3oSQtcbuGbdNkeHkWi
	pd9iEBx6WSLNkg67sYkGUVmYEJJhNeVh6C6cq/D5++6nIlRHkmrQE6D14McQfE3hd5K2oH2JFNy
	teuHesYuXhvJ796segf0iwR1hPH32UTYLen6IHhU5R6fk2z53ZhlegxK7yDA6Jp0/j0YLnEDyWK
	QaAPx6UP+fNredv+6F2wuGwFO7W4jCXTJuNz7ImHhPcKq6XTVVRMHFNLZzZyZ9lE3Iweob3uOfc
	Fuoy5jEYfZhryaIEwUPYaowCaNbK+z0aPzzdMazkZ8n6oPjh2gFTPaA/s+YQiB9kMIKW7Tz312O
	vZGMM=
X-Received: by 2002:a05:6871:4715:b0:4a2:c175:d339 with SMTP id 586e51a60fabf-4a83f58e426mr639235fac.39.1792798717749;
        Fri, 23 Oct 2026 16:38:37 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a843225d69sm284345fac.15.2026.10.23.16.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:38:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 17:38:23 -0600
Subject: [PATCH v3 4/9] dmaengine: sun6i: serialize physical channel
 ownership
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
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-4-ef1acb0be768@gmail.com>
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
 James Hilliard <james.hilliard1@gmail.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2

The allocator changes vchan->phy and pchan->vchan under sdev->lock, but
termination reads the physical channel before taking either lock. The IRQ
handler also takes an unprotected owner snapshot. Termination can miss a
new assignment or detach an owner while an interrupt is about to complete
its descriptor. A sampled IRQ can also be applied after reassignment.

Protect physical-channel ownership with sdev->lock across allocation,
interrupt handling, pause, termination and residue queries. Read and
acknowledge IRQ status under that lock, and allocate and start each pending
channel in the same critical section. This also serializes updates to the
shared interrupt-enable registers.

Nest vc.lock inside the device lock when accessing descriptor lists or
updating cookies, including cyclic notifications. virt-dma takes vc.lock
independently when preparing, submitting and completing descriptors, so
the device lock does not replace it. Client callbacks run outside both
locks in the virtual-channel tasklet.

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260706065650.34B131F00A3A@smtp.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 67 ++++++++++++++++++++++++-------------------------
 1 file changed, 33 insertions(+), 34 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 435d7daa1c0f..d3a63c866645 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -217,6 +217,10 @@ struct sun6i_dma_dev {
 	struct clk		*clk;
 	struct clk		*clk_mbus;
 	int			irq;
+	/*
+	 * Physical channels, pending list and registers; nests outside vc.lock.
+	 * virt-dma also takes vc.lock independently for its lists and cookies.
+	 */
 	spinlock_t		lock;
 	struct reset_control	*rstc;
 	struct tasklet_struct	task;
@@ -524,11 +528,11 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
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
 
@@ -545,10 +549,9 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
 				pchan->vchan = NULL;
 			}
 		}
-		spin_unlock_irq(&vchan->vc.lock);
+		spin_unlock(&vchan->vc.lock);
 	}
 
-	spin_lock_irq(&sdev->lock);
 	for (pchan_idx = 0; pchan_idx < sdev->num_pchans; pchan_idx++) {
 		pchan = &sdev->pchans[pchan_idx];
 
@@ -557,31 +560,20 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
 
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
@@ -590,9 +582,11 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
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
@@ -608,14 +602,14 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
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
@@ -625,6 +619,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 			tasklet_schedule(&sdev->task);
 		ret = IRQ_HANDLED;
 	}
+	spin_unlock_irqrestore(&sdev->lock, flags);
 
 	return ret;
 }
@@ -931,19 +926,20 @@ static int sun6i_dma_pause(struct dma_chan *chan)
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
@@ -978,15 +974,14 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 {
 	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
-	struct sun6i_pchan *pchan = vchan->phy;
+	struct sun6i_pchan *pchan;
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
@@ -1007,7 +1002,8 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 		pchan->done = NULL;
 	}
 
-	spin_unlock_irqrestore(&vchan->vc.lock, flags);
+	spin_unlock(&vchan->vc.lock);
+	spin_unlock_irqrestore(&sdev->lock, flags);
 
 	vchan_dma_desc_free_list(&vchan->vc, &head);
 
@@ -1018,8 +1014,9 @@ static enum dma_status sun6i_dma_tx_status(struct dma_chan *chan,
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
@@ -1027,11 +1024,12 @@ static enum dma_status sun6i_dma_tx_status(struct dma_chan *chan,
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
@@ -1045,9 +1043,10 @@ static enum dma_status sun6i_dma_tx_status(struct dma_chan *chan,
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

-- 
2.53.0

