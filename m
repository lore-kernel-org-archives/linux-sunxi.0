Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792725306;
	b=DRkvh6Sy8wr/tNoE2W/tpImCmbEVA0PMAZrtRu10j+x2hwvPoq2nlbE3mtOM+hSF5C+W
	 +dsE9lKi7wYHRhu9oPgzlxWx09bGppBG1GlVR9MJ27ObHcCizkTCUDHhLSsfO3+DaDfzs
	 zm1nY7sNrAXMA6J+bycY8biuzem2/nFdZj5oUg42DbLTHSHCIc6pUhhiDlG1dfDncNmbm
	 bsgH5gLeZcPXG6tg+FTmg/1wbNzbKIUbcx6NAwzkB7AXZ/kZPbvaDnQpxpF34wYob9Dbm
	 4f4WFfWWAxjTqrYalFh+4Q/zvwk011l0uzCS+etlNT5rvB+/ZiHahzK5LD1c+kRRHGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792725306;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Fx8akCh1b2SJodc1FWp75y3A6YsSjEhFlzNdHqoUtLI=;
	b=EVFh+FQ2yeqgoUAVJT2Hq1mAyb3mpffI/qaYYeJrKYPNEojJ4JLDcKgWSa095utLeveJ
	 c+w+aaDencUkkUHp+FEcs4bybJXMVSDnERl80p2yVJlffhevbyedUA9LrFgB9cOTShv8N
	 F4jZQdre7x4t5ECDcljeUE2d4I6a4iISCahnBbca/2w719jsaB+LMneO5TmMswHFox1m7
	 IHy+MLZwfDP5tZjsdEjZKD4dONGO0IzwT/Bl49X8/73E2AOVOwzqNvA9r6eE5t8s8LV3b
	 um0g1SZsvgRCCSQh7MzvuUxCOodx2muAN0kXdZDWilpQxDzmpm727c6eqmPwsi8cwQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=elax3nXF;
	arc=none smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E3B606A32D
	for <linux-sunxi@lists.linux.dev>; Fri, 23 Oct 2026 03:15:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23E3B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=elax3nXF
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-84e513877a3so319567a34.0
        for <linux-sunxi@lists.linux.dev>; Thu, 22 Oct 2026 20:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792725305; x=1793330105; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fx8akCh1b2SJodc1FWp75y3A6YsSjEhFlzNdHqoUtLI=;
        b=elax3nXFz3inxG1m2GtSHHBsfpemi37xlJIdlbmZwRXeSm9eU9cNG+jBGljIGdxXuB
         ClpkcAfgJ87Zy+8mbJc8WCUsR7DffypQjRSCfT4V5YdYU7c9lILO4VatTfrzcWERJ9Lq
         aZNexQ7mcCWY8xSfHVE27xUbN5dUfuaZoJ7nmBMRYx8+g9MdQbCgHdNZIuD9GcA/kAIG
         ttFcv4DsiXnMGEUD0H86ixP6RtEaTUBegCc3D/TFMNe5e//0WUf4qwWac3Rlu7K4OfN5
         4cIHpF+hqa0ksJwhTHvVVChjVGHXj8H/9MEU1U+7L8c6b024+ZfilLTLqrCaR4cl4h+e
         H5aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792725305; x=1793330105;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fx8akCh1b2SJodc1FWp75y3A6YsSjEhFlzNdHqoUtLI=;
        b=0w1wGZrmkOmJvLzfsx+K1ztQSSTY4jlplATd6RRl8Aro4NcvOes6TNFMhaDQ83dY+6
         6MeA7e00WiI9Z+mWBgtJSB58lQHTQtjEogRU8UwbmQuwONrQvZbgtyDFHwXckVEmlJ/4
         32+b8Gf1KHPRJmR0efg5fBAPI8tF+RLuLbRT5ZpZb2FuwebRy/hUwisqyQaqdLBY07YW
         SINAM+6MveqiLwJdaqtLWuZj2z+J0v+dVvduty5jZDI1r+IYBRA8fd+PvMALiVp3IUrS
         Ijmh64JZWo7B50JHHZtOMSeeu0UtHNJQ1CAyNm2SkL6y6YAMau8P+wqdoa7JmM4IgrDy
         7BhA==
X-Forwarded-Encrypted: i=1; AKwUvBzsqxmvE44x6NKVHg7Xb03usWUAzRJgeujchZLZARlZmegNXRPfazufNhEyE4QDg1YaYz5ZmZFSsjCETg==@lists.linux.dev
X-Gm-Message-State: AFq9FYKxGjKgCSbYADYbfl319ZQxUYI5d8Fbe48L7zudBssNjj5W7bPp
	1UipqUK9UCS/l6sL5m379SwZL+ebl1IPBFtkd8P7vIcCoZ1G4xKsJ8ZY
X-Gm-Gg: AYBFou3AU+Ghqt5OEG5BRRK4DbBlj2k9RAN0wRT9ol2aB7fVMxViO8LfRshRIfYB8un
	j9x98RrkkOu6r0GnflJnGmohjDe8zSVmsS14iMqk+0ClUVqn0HAf0E6p3miK12lm0nfLkMDoMLa
	A9w1u/JrIX6Lh78stqAUdd4HYmU9t2BfkNGzr6ylJH4OoxIrzlzzWkFYxpUhRGM/xa6h+sdUFAN
	3Nr9tEsGBCsD0uxqKYrf6WDjc1rKn2QkSrw6Y7d4Yklg0zu0Idh0IkJSnZ5Y54IgZ/qgGRZldSu
	Tt+kZuj4+/pC03WNFETRopzPdk2xNFKnIdnHnx3I7FfiacJTru1No6cnB1oTqOu8apUs+y7R/vQ
	lpGLK3HsTlm2BS4+YydHOJskzqag4XGxVmNwXKoGVp8fcGYzz9S9KgN21ILncHVkHSaStmVVJuz
	CZWYrxsrMzfJ/lhNp/V0sWCfWw76sMN4oxmZnE+cQPDOmY+4yw7AyVvvUlEQrnCPcdexYfl431L
	KuXPaLiWtZu8UQHTPkO4n0wMkFzYuY4uPTQlmfnOqLf4RQw1V4Dwyg52slLgIB3PDp4ec3s3WX1
	iJI8+QupMYEKnzoQCwzBJiNa+6AvC8Wp592THr771CkJHe+mr8hkFe4KPSXcRXDKP9IaaqlD6pw
	oHM5OGJw+GZxq6gtFk5rNl+zTsCqOsphnifIF04/9vINapUoeI3LwZanEWPpcrGiMMAGoCDUtG6
	IbPhE=
X-Received: by 2002:a05:6830:a185:10b0:839:c62a:1661 with SMTP id 46e09a7af769-84e32d0adcdmr1665921a34.7.1792725305092;
        Thu, 22 Oct 2026 20:15:05 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84fbda584d9sm938638a34.13.2026.10.22.20.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 20:15:04 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 22 Oct 2026 21:14:56 -0600
Subject: [PATCH 5/6] dmaengine: sun6i: synchronize callbacks before
 releasing channel resources
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
Message-Id: <20261022-submit-sun6i-dma-lifetime-next-v1-v1-5-01085f684c9f@gmail.com>
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

The driver has no device_synchronize callback. dmaengine_terminate_sync()
therefore returns after stopping the channel without waiting for the
virtual-channel tasklet. That tasklet may already have removed completed
descriptors from the shared list and be executing their callbacks. For
example, serial8250_release_dma() frees the RX buffer and unmaps the TX
buffer immediately after terminate_sync(), while those callbacks can
still access them.

Use vchan_dma_synchronize() for device_synchronize. Channel termination
excludes the interrupt handler and allocator before detaching the channel,
so they cannot schedule another completion for that transfer. Also stop
the channel and synchronize when freeing its resources.

Keep terminated cyclic descriptors on desc_terminated until synchronization
finishes. vchan_complete() may retain that descriptor outside vc.lock.
Ordinary active descriptors have not published a callback and can still be
freed by terminate_all(). This avoids accumulating descriptors on each
8250 partial-RX flush, which uses the atomic termination API.

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 7ac6693a041e..f807d9386939 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -994,12 +994,20 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 	if (pchan && pchan->desc && pchan->desc != pchan->done) {
 		struct virt_dma_desc *vd = &pchan->desc->vd;
 
-		vchan_terminate_vdesc(vd);
+		/* A cyclic callback may still hold this descriptor outside vc.lock. */
+		if (vchan->cyclic)
+			vchan_terminate_vdesc(vd);
+		else
+			list_add_tail(&vd->node, &head);
 	}
 
 	vchan->cyclic = false;
 	vchan->paused = false;
-	vchan_get_all_descriptors(&vchan->vc, &head);
+	/* Leave terminated cyclic descriptors for the sleepable synchronize. */
+	list_splice_tail_init(&vchan->vc.desc_allocated, &head);
+	list_splice_tail_init(&vchan->vc.desc_submitted, &head);
+	list_splice_tail_init(&vchan->vc.desc_issued, &head);
+	list_splice_tail_init(&vchan->vc.desc_completed, &head);
 
 	if (pchan) {
 		writel(DMA_CHAN_ENABLE_STOP, pchan->base + DMA_CHAN_ENABLE);
@@ -1099,14 +1107,10 @@ static void sun6i_dma_issue_pending(struct dma_chan *chan)
 
 static void sun6i_dma_free_chan_resources(struct dma_chan *chan)
 {
-	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
-	unsigned long flags;
-
-	spin_lock_irqsave(&sdev->lock, flags);
-	list_del_init(&vchan->node);
-	spin_unlock_irqrestore(&sdev->lock, flags);
 
+	sun6i_dma_terminate_all(chan);
+	vchan_dma_synchronize(chan);
 	vchan_free_chan_resources(&vchan->vc);
 }
 
@@ -1479,6 +1483,7 @@ static int sun6i_dma_probe(struct platform_device *pdev)
 	sdc->slave.device_pause			= sun6i_dma_pause;
 	sdc->slave.device_resume		= sun6i_dma_resume;
 	sdc->slave.device_terminate_all		= sun6i_dma_terminate_all;
+	sdc->slave.device_synchronize		= vchan_dma_synchronize;
 	sdc->slave.src_addr_widths		= sdc->cfg->src_addr_widths;
 	sdc->slave.dst_addr_widths		= sdc->cfg->dst_addr_widths;
 	sdc->slave.directions			= BIT(DMA_DEV_TO_MEM) |

-- 
2.53.0

