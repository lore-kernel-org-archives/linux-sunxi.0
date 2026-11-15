Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794735206;
	b=z7/ji9HkDILgQrWTbZOMQh7lT3Vdvz5dq4BuWbk+zj6P+c5/ePP/s2+uCCH7sp4FRg6q
	 kLNR4I2EwCQFDoLLVstJufg1Q1vd2aSbynTOIJX3y/FKJ9PvaPZg3r51T+mcVO3rraUEP
	 86oQ6KIquinN3PtI1FzRyPXL7ckMcQjpn/LnXd8WRfqxxGnNs9AOffiA+1moqhaDe+tV9
	 Akbmw+C+TbcecDy8exbgFOFZExK6TbxJO7thmzjcBwG7rDxjcZ5yJzgDfbXh5fWcOvq28
	 72T0gSiSaW1Y61dmL2kt8NHcWKQQPlBqqHS5l9dBUN4OmF/ZHIAvN4tHpD5K9z2rsrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794735206;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=PuczV2jozFUeyJsXtX8bgTt59XDEa5cGyADBIgej+KE=;
	b=tjTWINo2SSc/NMujW/bZ65sODQQmr2BqdsnJya4F7XIUizEk+sKeJXZG6B7ZKjbw+9y2
	 n6m39sTTpFZgdB5w1VELzpgRUwcN3D8CDrkQfmBEWsdZbEcLbZNHD6Mth+grkmTOh66j/
	 UwjwS2t2ML4vRgVTitP2f2wxrDnsFfVpq4bFROCHCq9JbzbDLKzhxF1yuIYH5BdY0MnSI
	 0QkUsaTHygxT2qOQvylj2NI5xfiNw/aKls4o6k/wtt7tesEVxzPRl3xbko/nN1AvQAYMo
	 EckjlsWK4lpwNXtcsQjWPrverQIBm4bZtTFHEbNAwAUrnBrnb5bENTGLhfi6aJjVgBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uuCRFqpD;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8D960A2604
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 09:33:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D8D960A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uuCRFqpD
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6de2f213b7aso905282eaf.0
        for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 01:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794735205; x=1795340005; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PuczV2jozFUeyJsXtX8bgTt59XDEa5cGyADBIgej+KE=;
        b=uuCRFqpDFytKH9kuusroZ9ICgfFLMl7ZVWACwxURJxv7LfDBvSA2xidhX/oG4tULRM
         L+W6gCYv6lB7IkiLCsVD161EV+fgNUXk6CIv3Foq/wHK/2n6kfeZ0CMaH2VJOJTuD7vK
         WMiliwql0m9Eg/aAhznU077/7gcNdyuYa82A3kAI8ckIlLKGdbNSg94I3qp9+wMfm1Sx
         Efx84pYyqUOGgrl1I+acVRWrVe1j1jKF1/lHS2+hGV4ihqhVQ3I9ybL26ZfW9l2Rbvio
         17P7Fjw10JrlBG1KwIv1cmkg35ZqV7lSXbYh/5Gr3cYLzx5l0BrB6zmLvp/T369iSeoL
         6Wow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794735205; x=1795340005;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PuczV2jozFUeyJsXtX8bgTt59XDEa5cGyADBIgej+KE=;
        b=ZDoiHcH5+Am7OSez0yXplS6nQeeEQ/9s3oXc1IeQA4FVBFVfFQcNd176DNp7IGnCxI
         zFugUJAhlTebwUpOw4C3/yFHgU33rZLC/fY6uvlqD5gd44YpFA2yymA32S5SUeDzGc3T
         84BYzek1OlDekRnRJ0zixY7wipqWSAHgXHIE34Q9t35TTOU3nUEccixHnW9RdZ9XZx2E
         Y1Ft++RUGwHf6ZyLUJ0bIfjK4QK900Wck3b3wzZ1wzRfd4e9QWDAY39uFpeTRs7/oZh3
         hNf8ROvD1aoTZpujwQz+ISgvBlQsOcAM743DNXdu1qAi9VSPAeuVkHv/ZG1qQyUmiaWo
         F4QA==
X-Forwarded-Encrypted: i=1; AL+hErF39+VdV3I1wzJGBeJn5jcvZ/GbVF1JIYBOdKhnI7pF6Dwtwnp7Dq/6oc+vxKGTj1E9y1dn6Ub+XuoQZA==@lists.linux.dev
X-Gm-Message-State: APuU4Z8P8q6L57bmo9zjosuc2Gsy5oDAyo6h/lvGOGfrd1vyjc6MM6IC
	e5ta4CyRX+UjDF9YcZk+PzLcwvckTQIm1RQgofISmULxe+En8iLrqPNI
X-Gm-Gg: AYBFou1uG6rbL7eY9CRrMq58yBBfl9uA6jtNQI92QfXa0OuKTLxydNU1GGPOczVA5mY
	sa8cAxRUWSV+swc+vvPyWsmWx782bIh2OKfVsoUv4Znu/BwBkCKfn8RURW5lvfqWn4t89I3tsVU
	BM/Q3tMxrIlT/7CoELE/+e+M1ZPzbOJk97aaButaSj9wYS+36rD1mIWJVXCblEPMbSXSVm+j4/t
	DQPXS2Jk4ICYVJ1GEZaeeQC0773ncyO5PX6Dm08CQ6lQ3OhdBTPQ+IgdC/zCILKpvg2a1DaTi14
	WQnZJoW856dzWPv/LRUSzIVC3IuanbFamnw4G+Kp+qgrhVFFYqbuT6WcQXNPPSDpRBap8tQUna5
	7by9pyN32w5/b7taCr8uGPKDAPDI78wmLARDy+z8iFvWLf4WKCxmJiEnvg5NV9OGsH9uEmfI9EW
	GiXqA4ywK3QjwMPBujsJYXGl4ZUWWnEI81+tnzfEIvvz8dD5ePfR3XE0RmeZaYcjww88qcCTmfr
	r8PuYki355VM9w2IzpsjYx54iBBAy1SG15Ka7Ui7w6accXiSuFtuxFRZxD8lryZvOO8TYBD3B3R
	WPbcSONO5ZWUjoMIabCKcm/pFgoXJzw43emIGHr34urvpB7LesSqfOUXsm+Wd4zDmWWDZplzx+1
	fz2sosdWYRTrY9CFqADApQ+Pu3p//n7oe3pWNtkHH3JTHsJ5u5h319kfUkVwTK3i8b8vup32xrr
	IzkMdbG+IBbV8BCLxLyMrVb71hMToBOThACkWhh6RbhHxsvVvAnW8=
X-Received: by 2002:a05:6820:5604:20b0:716:c2df:d9a2 with SMTP id 006d021491bc7-71ab505077cmr2942230eaf.44.1794735204957;
        Sun, 15 Nov 2026 01:33:24 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab43347b9sm5933617eaf.12.2026.11.15.01.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:33:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 02:32:57 -0700
Subject: [PATCH v4 9/9] dmaengine: sun6i: keep cyclic state with the
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
Message-Id: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-9-043cd476a45f@gmail.com>
References: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-0-043cd476a45f@gmail.com>
In-Reply-To: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-0-043cd476a45f@gmail.com>
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
 James Hilliard <james.hilliard1@gmail.com>, Frank Li <Frank.Li@nxp.com>
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 8f8443e14719..7316631545c3 100644
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
 
@@ -509,7 +509,7 @@ static int sun6i_dma_start_desc(struct sun6i_vchan *vchan)
 			     (DMA_IRQ_HALF | DMA_IRQ_PKG | DMA_IRQ_QUEUE) <<
 			     (irq_offset * DMA_IRQ_CHAN_WIDTH));
 
-	vchan->irq_type = vchan->cyclic ? DMA_IRQ_PKG : DMA_IRQ_QUEUE;
+	vchan->irq_type = pchan->desc->cyclic ? DMA_IRQ_PKG : DMA_IRQ_QUEUE;
 
 	irq_val = sun6i_read_irq_en(sdev, irq_reg);
 	irq_val &= ~((DMA_IRQ_HALF | DMA_IRQ_PKG | DMA_IRQ_QUEUE) <<
@@ -612,7 +612,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 			desc = pchan->desc;
 			if (vchan && desc && (status & vchan->irq_type)) {
 				spin_lock(&vchan->vc.lock);
-				if (vchan->cyclic) {
+				if (desc->cyclic) {
 					vchan_cyclic_callback(&desc->vd);
 				} else {
 					/* Completion transfers ownership to virt-dma. */
@@ -913,7 +913,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_cyclic(
 
 	prev->p_lli_next = txd->p_lli;		/* cyclic list */
 
-	vchan->cyclic = true;
+	txd->cyclic = true;
 
 	return vchan_tx_prep(&vchan->vc, &txd->vd, flags);
 
@@ -1003,13 +1003,12 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
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

