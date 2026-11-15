Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794735204;
	b=rfK5bfk+cFo3z6D+2MM/xuQ1HFcMhE/fuxrODIjh6pSss8Z2MTuwJdpTCb2BxHjz+pPS
	 HhmANtNGrO7B2GV8/sN/kahQtkjCBp4D83AUNam0LwaVRYYwmOLlXePaxtxbGTTi1/dVf
	 55S1QDq9p2/UchHkpH+WrugMhjv48hzsJdlUdU+VvVDdDIVtKqZsMpYYVkrLkrExupPYp
	 u2Q5nVP/LclBulQ4YnGiRyAJRk4XF0GYw2LuhIPcA9QEeoia5pYo40DVTXs+q3AunVUvA
	 zXY3fubRvaEEj0PRE9n2tWRM1rmRt8ERI+TiF72/T0GzngHbA3dusTHtN1hW3bG+cRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794735204;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=lLq7Tf1B3BpSLBANTG+leF3RFU5GTaZTVgWe2BOgm6s=;
	b=BiDqgBqqFMPTw0c4vudVeIFcRgSRhAfWbq0uhb06TNpBVTjDyCOMWLB5ciWLQ6IraVcr
	 P+3doxfdwxcVCokpayvhtvdlMSK9ohiZ2NSLD827XcNd++v+iTLTpHZJcIv3kU2lQuubv
	 FbWo2KCMaTPm27Pe+SsEVRrFNbPvezxqMDy4bNl5ATY3J47anmXU9Q4Smt0DVvEvwh/es
	 O2xQSImVdnVIpm7G832s3uZAM0q0FhfmO4BOHNOYrExViyc08iqlJ8Qcngo0jKcmaaxed
	 WGj+DXjkI6Z+puRhZaqC2kpgPD1GE3kqDtvPcrO7CUKV52K3febjfooi3Tp0tFhlNtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RNTvfa8e;
	arc=none smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B56606A89A
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 09:33:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79B56606A89A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RNTvfa8e
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6de2f213b7aso905276eaf.0
        for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 01:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794735203; x=1795340003; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lLq7Tf1B3BpSLBANTG+leF3RFU5GTaZTVgWe2BOgm6s=;
        b=RNTvfa8eb81loVcYokQNeIhBEJRkzsMxzHoRab5d7GD3lWedt4xQootJorGqTjO1Xg
         iAkwX3PMJXjOBNRDZf3oyXPMuIJvaPUixACLEoYDNpwx+PobrZyl2/yQcPyby8DaTjB0
         0zWanwK+I9Pt81BYQ+scz41rK1l7kuGGMWL8CSr64qCpEfhOlRUA76bluAQSKtT4qm6y
         GVeFVUgF9rsIQ5h44zk94RUM9PTMv41qeJ5OnR4yMIGgZ9w2p3Ut/hMPWOTRJnPJi3/P
         kkJvMKM5hMNvpPppPo6tfLMUtEjnuMA7KOXyrY+BQLE8mJ89qk++EfYK1ew2Xlj8c1+C
         V0ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794735203; x=1795340003;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lLq7Tf1B3BpSLBANTG+leF3RFU5GTaZTVgWe2BOgm6s=;
        b=2ADEwrGgpL8nd5cHMBjTCspM3Skz29xiHBcVRlJgkMdBnkWd7ILY4d/+CebIfV7sCZ
         KhVzoP05AD2Lyot+/2vIzI6WifrkB/8VKMegLLNLETIjYNoQL0xUv9wKplBTLubn04Ca
         w4s0RCYpvTWhDIrgfFAUy/BIDG52fXtdF0MclEC954VhySivkrwMCa2Fn+Lvz5p2lH2y
         AX3+oSNTvRcM+uuhzr2ALUdFcz4zMt2t5CErsQsorujx6hREbEqlD+dI3QbAmACrkoaP
         ZZ7ZLfyjotSM0tuzqd+B/Lc74pviSoCjjw42g37cYh3fBe9Wi7StL2AMY7c/2aEewYyJ
         n5oQ==
X-Forwarded-Encrypted: i=1; AL+hErH3/VPmHyt1rzp8ogRpQ52rHBbVXd7potWnCFQuJFmVVuhkoSoSA3+b2j8u1dd8+j+Qulz1kpyLXMZjpA==@lists.linux.dev
X-Gm-Message-State: APuU4Z8H2NKao+IBIa+GT63GRiVOCNddnkzjXl6NSAzWScoGI39JQWZV
	jZtyuvTrDuTWSE6IDd7UEngqnoaGPeg1HwEOWx1xYBLpv4112jK5X1al
X-Gm-Gg: AYBFou1mQDZMZq72yYUrfMTIoEnzdcZpVXBacYy4MpjqjAWyRcmRevrtiWM6SWZ2dZR
	mtO+5cQnGZ8MIDadk4n7nbb6J8RFl6Kp6xtMW8TmcBWWw9vjE3h1wXVGYcXZHjfdPT4OptSYYxx
	GEqkeSs/2i/7KL6a6mHgigrvLo/rKsgekGZqnRZ53OhXj144YNyfwmpQNCqeU87eYoE0A/t3lOh
	wVFqAxSCQs90hFIziVphDXe1R4kccImwB9lHr4pyWvVIDr+SNrFK938ZAa+x9ajEdiugqVRcOph
	N5X8ZWyI5Cxgpa1FIsgL2CxISYDk1Xn8MHN3knw9AgNCN3NtrJhgJDZF4Avx9R8F052FR2KRh+k
	oOP2voba/iyouVA0G01B3oiV0LZqysvzMHlnVDbDHmgGJqShDRkZ7HvZXkvL7Wde8o2wtH/Cbdy
	XES+jgWyvIEf3Oy8a8PmjMgLyy86FHJiDKmK3c0Bft0h4/19uNjxDgY20VgOLR5P3TMSd83fOmB
	Ql3PX8CdU/K+YyK9/hEdJPqfOVx+YU0rgQhUDlyx15XIGVPX+yc75z3FwZDMIHcR6JTWA58DEOg
	xCPvV3ncQPUPdFDAaoQ9+66iPs/mFG3Xe6cVIUwX9IrubZWU+VAhE3/4rHGP9XMs+9kzTYRDdtP
	qsuWOr1/AysZVHzgdW/mjoMgLTUMhJywkuqzYfbA2m9rCN7i0XGeyB6fFEkiuLdIxO5Dz6qfRUl
	YrdHuIT+guCdObokXNfILucKVb3zT3uruBouuvIeQdBAJENpGsxdQ=
X-Received: by 2002:a05:6820:3416:10b0:6cd:3ffc:64d7 with SMTP id 006d021491bc7-71ab51acb62mr2760644eaf.82.1794735203521;
        Sun, 15 Nov 2026 01:33:23 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab43347b9sm5933617eaf.12.2026.11.15.01.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:33:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 02:32:56 -0700
Subject: [PATCH v4 8/9] dmaengine: sun6i: synchronize callbacks before
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
Message-Id: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-8-043cd476a45f@gmail.com>
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 14f1f463005e..8f8443e14719 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -1002,12 +1002,20 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 	if (pchan && pchan->desc) {
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
@@ -1105,14 +1113,10 @@ static void sun6i_dma_issue_pending(struct dma_chan *chan)
 
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
 
@@ -1485,6 +1489,7 @@ static int sun6i_dma_probe(struct platform_device *pdev)
 	sdc->slave.device_pause			= sun6i_dma_pause;
 	sdc->slave.device_resume		= sun6i_dma_resume;
 	sdc->slave.device_terminate_all		= sun6i_dma_terminate_all;
+	sdc->slave.device_synchronize		= vchan_dma_synchronize;
 	sdc->slave.src_addr_widths		= sdc->cfg->src_addr_widths;
 	sdc->slave.dst_addr_widths		= sdc->cfg->dst_addr_widths;
 	sdc->slave.directions			= BIT(DMA_DEV_TO_MEM) |

-- 
2.53.0

