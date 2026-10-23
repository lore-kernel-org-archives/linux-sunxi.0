Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792725308;
	b=SJt35opXzgfs1JLBPK3fL6A7THO2HfJam+o/uQHrDeKM8oDW1TiZ2mPk6pUP7XtnYs2C
	 4wCZKHe6NPyQqq2wFSTdmrsEHcwj/rh3IHNq/F56JBjK9GHn8mTt1jDU2lXzcNmIpLDns
	 MjchT8Fn0S6akyOE7g2y4ac6D9D7T6iYUcfm0CJV+d49gTap4yGE/lgWRwKKVtjUu0Nl3
	 vByDxzDqQgGZARh1No/5xwu4XqB8Q1qRWSW8o4+6/+NaQ9h0MQk95rCatFi2al8e9UexD
	 8Kc4t63fk0EYmzvn/yaWQ9bp4UKuyk/4qQQXqT3h3iJzxIpvDfeHV37H7rZotKa4dow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792725308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=CYdgjPfv0+4Wy+FKCquHpiCKWW+PI9qvviL25EIL1ZY=;
	b=Dxq2+BRDIYVzNxGflh2XNHiX4tkC6/WgVgSQhwihGYwhzmu0obkumOsTK0lK0mRGc9N1
	 rrIXkYwFQW8ZrQ52iX8D8VwkCVUenPN/JP/bN2Mc2F96bbQgn07Q/FZZ8T9vBBdRbJFKq
	 S/4ThIZKvZDBg7ldPlzbPbP44zxZ72NSvXUKiIk3H9w2DnCKKBb1KOrinI4QKRZpz0b0t
	 RkwVU9i1KMwT1aGLJ7KDGSw7wxQ+2dHl+lqpQ9pAjg43RfoyFjCsCRzvsuq/luPnwmjAs
	 gl8ZIEDIHDA8S6FCzjnlpeLZMQWK0GiAv6UKBl2gQu6nARDSD51gk0uEdWT4Vd2XkaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JeRBaCJD;
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A239860A2614
	for <linux-sunxi@lists.linux.dev>; Fri, 23 Oct 2026 03:15:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A239860A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JeRBaCJD
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-8446af403b5so281139a34.2
        for <linux-sunxi@lists.linux.dev>; Thu, 22 Oct 2026 20:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792725306; x=1793330106; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CYdgjPfv0+4Wy+FKCquHpiCKWW+PI9qvviL25EIL1ZY=;
        b=JeRBaCJDfurjZwRzsWq0INTkzpJZ4SNWffRC/gM4epw0hRspgEzciRpAVvEkZDCREi
         dpG77U61A0YtrwopuFZcRTgWJn7l3MNQ9yHclOrFfyBjr+Wzj2ykdAWYtupATqS2RrAx
         Il2Fqy1sYjU/U0EPa208C99u/EuqwIT+tH+DescOn4lI7bCflTOpr1DwLW6R9gI/q0m1
         6i4FYlIt0ZAl5EdhfasBN/vqTd9oKKKCKgdQ7JV4L9mZaE1M8NGHdOnNe+lY7yOVdzDJ
         yHEIxEBm4OpprLkeSuiHoFNWJjMUVDJh41uG3tIk4hNF8tTr0MSyYvm/YE8MCFBWLb+B
         JJxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792725306; x=1793330106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CYdgjPfv0+4Wy+FKCquHpiCKWW+PI9qvviL25EIL1ZY=;
        b=eWv2mBAHGO6FKb75gB+qvpWidtfHjN+z4wc/crq3FGse96qWWyoUsurTnGWnzmuCwv
         8P+le8DVakFxC8C5pbCSihh00jgTgr07J53oyd2jpgK8a58t6XlZNJQnDfLgTCrJlrp3
         g2J1nBz5HWX98PfmWcJknySQNicrwU+Lc3KGgjQfJWdKAXmYor60jDQ9MQtUx5TNhIVM
         oMZyp0wo9oa8G0zXyh3Glinf4onJCuLZ1EqRAaTHjumI6DTt8Q47YC4qEFf92rbsLyTc
         0M9YQoI0wrprP6BUE2i8as1epCBCOxw1dDtvCjjByMtWXWyU7g5Fw7WeIei1wpicMvqb
         GM6w==
X-Forwarded-Encrypted: i=1; AKwUvBx5PBh+lCelIuG2eK3zk1SxeA92MXC0ycTmlCIIe951SeMIPjCYg0hZDtYZgPDJ2hoI+XH+iutP2tvygw==@lists.linux.dev
X-Gm-Message-State: AFq9FYLCk+W6PBZb1qqvtymkrKl/yYH5CiaVamVSAS1aUyRgArtqiqZP
	n7KtrMgkKxK3YixhqDCZ99To0OC7cBM+O7YUFcxk+Wu+bELNPQgvRwje
X-Gm-Gg: AYBFou0LnwlSaYGMzTSzBW7Wt5L+hM25zzVe6xh9Y3ry6cBDevkZ7ROKdqfwLg/Cft+
	VvbbQLApkKgacvIswUZOiP7z5H8VIiknWH6VDQi7LieuiTQRAwGOi+4m/qcVp3HWdJy9K8FiNYF
	8/wrx1tVPSD3GAB4ObPSJxT2XAc225X9nfcJ39oN4FNb+LoUMvRVCbmAhcfLWxCpd458/nc8Vn0
	DwrpkKfQlLBEoUrJuzxvAuIyTMnZ6gDyCmj/JSbJiSjSZhHMN37DlB2S5tzokRZKHY+g5z1OkZU
	/i21mbl8fyzV8gIEU7ljh+NWJgks/yOdP67caGh+ApnefbMeeufqU1+qFkv4XgVHwzgix0DCS+0
	HypcdQ/sXKvSlnX6klTjcQU8QV4IKrNuPZQeS0jbVoCAItb1y5c7agwVcVbp7AX6mA1WQZZxrlg
	BNPk4O6/wsHNQln4CPfh1OXjZU3NWrQljLPF4OyROyQonFC7nwFXlQvcYCwqyKl8Fb7T+r0mxFL
	hRDhg8xyGcynVsVYq6WzWoOY9fTFzt73tyXyrg+l44SIUInnt2kU0RdQJEfK05x0nJg7xGghasS
	N9HjM/5BJd4UBNscq0qRNBJlTBTpz1kpdgS0n4S0jktfjpCzGS/osdWRHVODsTdOPGvGAnGRBsd
	dWjH0TdB5s6IUqFlclmI8ahKXC1WnIaQ7cGXw+bfvPueNFUtQRnfO2rHDBo4GNMRBH3BWL0a9GX
	THilC0
X-Received: by 2002:a05:6830:640c:b0:829:2866:3106 with SMTP id 46e09a7af769-84fb2712b6cmr633959a34.21.1792725306519;
        Thu, 22 Oct 2026 20:15:06 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84fbda584d9sm938638a34.13.2026.10.22.20.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 20:15:05 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 22 Oct 2026 21:14:57 -0600
Subject: [PATCH 6/6] dmaengine: sun6i: keep cyclic state with the prepared
 descriptor
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
Message-Id: <20261022-submit-sun6i-dma-lifetime-next-v1-v1-6-01085f684c9f@gmail.com>
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
index f807d9386939..5fac3a991314 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -191,6 +191,7 @@ struct sun6i_desc {
 	struct virt_dma_desc	vd;
 	dma_addr_t		p_lli;
 	struct sun6i_dma_lli	*v_lli;
+	bool			cyclic;
 };
 
 struct sun6i_pchan {
@@ -208,7 +209,6 @@ struct sun6i_vchan {
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
@@ -606,7 +606,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 			vchan = pchan->vchan;
 			if (vchan && (status & vchan->irq_type)) {
 				spin_lock(&vchan->vc.lock);
-				if (vchan->cyclic) {
+				if (pchan->desc->cyclic) {
 					vchan_cyclic_callback(&pchan->desc->vd);
 				} else {
 					vchan_cookie_complete(&pchan->desc->vd);
@@ -906,7 +906,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_cyclic(
 
 	prev->p_lli_next = txd->p_lli;		/* cyclic list */
 
-	vchan->cyclic = true;
+	txd->cyclic = true;
 
 	return vchan_tx_prep(&vchan->vc, &txd->vd, flags);
 
@@ -995,13 +995,12 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
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

