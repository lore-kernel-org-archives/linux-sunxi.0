Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792798725;
	b=cGZ8uNpOdfCq+M4arOxZq4bg44JFYYGvNoUuHCZLWVcl7blP6surLNEtZpOGvHmuOOAc
	 E6LEW+KWI8EaBY1ekZF0Ay+lHCAjogKqTE3nPGqAXUrxDM3iJNMjTE5aPCEMe21eidLXV
	 f5owukOOIsIwrWMB4T0EKQEjucsyogwl1aZZGiWawUpOrA1QpQ6qcnZNWt7puPbI1jPHe
	 ZRWqebHfOQJt+RuyGw5Lp3YvtWahWeaLmCGKGyIhHLosCXFq3NvomyXbBaNJUG7CAj+eu
	 5jblmQG4UdjrZFrdn+YVf+HvctR+TXJsPG7hZZfn9O87q0KH10XSwlyLHgbvXv1av1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792798725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=yK+VB9i3XnDuZ2aB6oRjlCMBfgt+FvmOgzszXtH8SUQ=;
	b=ytGMDZarruMDSvMcAQsPh1rDPTVFCPfkgI2Ylcjh9R3bDDTuDAV59FdEoRq0MlTq0Zbl
	 Rxnsz4FyG+vJ50kSCXobjsj19nAswiNauLq7/u/sUbPnvG9qtApNSdxaTZWHX+38JmkjB
	 oT5x2ZkkyB9u1jmkmDDLRSbvRyoJwPDuBeoUN0eH1lUb6Fw533gap1mHoYbD4nAHariXk
	 ld3jKCOoRncdJqGjl2sA0ZNV+lxg9Nv0eLiU0Y4wvu5sBr+kmypkXRi5LWz/w9F0ORQr8
	 dJQlc+YOFVBWIj1djSvU6MEUSEN7Pbf2AEpZae0nNCstMSbzrt3o+A+wPaG9mXSdv1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GRWoOMCG;
	arc=none smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3791160A2618
	for <linux-sunxi@lists.linux.dev>; Fri, 23 Oct 2026 23:38:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3791160A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GRWoOMCG
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6dd7070699eso992352eaf.3
        for <linux-sunxi@lists.linux.dev>; Fri, 23 Oct 2026 16:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792798724; x=1793403524; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yK+VB9i3XnDuZ2aB6oRjlCMBfgt+FvmOgzszXtH8SUQ=;
        b=GRWoOMCG5a+S0Z+zRa9DUbCM/zKafj8GppEvawj7MhjSCgVLlpdZR+Q/rwjwc86qIE
         8OjYcx2JQOsDopNf8hpwac4M41xzoWbqklXv+xWthucjf1n0y4OVLZS7BFqNhwb5Wy8J
         e+9OWg46LSthCiYIlD9i4IGa0HnI46vcfmooTu/692K/7K67Y/SA1XnHtc0YSIbc1qe4
         ilzAlSej80v6DPoTdG/Bc21BGAKxqxodanW05utU2DMMkZN3CDWSZn3cJo4T44ijS0Pf
         hicYI6Lam9x19IfbHRguhIgj8G1RdooEz9TNkrEhL7+LVRHwhT3nPGwS9KePmE1h2Laa
         LHkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792798724; x=1793403524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yK+VB9i3XnDuZ2aB6oRjlCMBfgt+FvmOgzszXtH8SUQ=;
        b=HEED9tc5dNOnNDO/BQZ/ajyoYSHtopv5skV4AJGQ7EcY8v5bUG4/+1iIhaT2iSY4Lu
         Rj+vAUepGgb3nWKAfCJIe84p7cXd4k7d/DdSctlZQt1mwxBd2tJge6PyFacArbADN9aC
         dt56Ym+fNPEt43WMh0INaxaJczDmF2tHi3ct/usrPZRH6U9B78N4vS51VUz1V9bLcFgo
         cjiccN95amaxVmdOGtmOV9vB9XYrWNH29c7ryKJrBe6a9BXEUeKl/OJrXJAdzrrQRSqf
         48bzIA52i/sGEYeicbKui7rbs2mhZPnt2fWH1/yKTmLPPMOQV1IpgRSjK6pfLBmyJDXX
         pYwg==
X-Forwarded-Encrypted: i=1; AKwUvBzIDSbq9scqJMWC9s2EladqmhsfVZCi7i9DTH4IZYD4IHD6/wnLaG/wCWSgyzuiLzyGpXkvu2l+bW52Cw==@lists.linux.dev
X-Gm-Message-State: AFq9FYIhnm9xDWd6Fm2Gj2NZ6JgVQdpnPyfQ7LRpbze0rwekByj9WZXx
	4lDp7y03GRMiBZnQPlpNnLmP45xuJshcmfVw/UMfLRzLDU9w22CgXCVf
X-Gm-Gg: AYBFou25+P/VEZHRTl/UzQtcx2AP1LA6YC0hc50yozsrpQAH0+1sUZE8ePpg/L5mWzT
	UflkMJqUC3jQcwNPqFyodSdsQOBs5CTqPmdRvPcSOXVspyvOife+QLyvFOfdF+lwqotxPmxM36/
	iqsvkdL9r2AqL0fQ9BlgAH//5NU2p7ZvRc98ID8JgNd7Y2ETc9TOC35MeSYdHDtTMUGthxXTxBV
	fsTqIvRtEzPc3vyj2t0VLha6DQXp6nhD2vm7tVURezbnGGAeFbVz5ozvM2pGqC7ATufjL/gO9C/
	87Jc+2RtRlVcfCrFWBIx5lUxVJUn/wp33TaL4j0xHY5pvRxaa5H0+THyazr2bzbT9Yqkc4x/hXS
	4rU29waYbybe0h+75EBhgvmTx+uqEiG49H3kZ6u+SB4mxQwXNT1u/PnPXJlgYd+5c0WQDPQWN0h
	X9vGHKsSXC1bzQImmccYMMc1NG87bl7PS35ppBbTKOn+1rrDG/1P3ANYmyCIdAkVvHzXV/Eodto
	ZptiBAGXS71ITDY0NO9VpM2qg/fWHld+HUeZsQr4UbXJ3eDHWuZjkgThSmlD6dpyI/4S85HXQf+
	O+W3oMubmFjuefBOCB8WHqtP3c5ozUeHKEzVmg/n8EpycxIDZittCDbZZ1p/cnyAr8lssvB5eX0
	LcMOxKn29joYwSwcxXB2PjMQhRXzYBtbs2XbJjbu7JTH/HBFMMaCS2XCDRnOfdebfSbNfoUT96y
	JfAFhicBfe1sR7pAmYeCof99A8
X-Received: by 2002:a05:6820:83dc:10b0:709:244b:b4f8 with SMTP id 006d021491bc7-70ba0ebf5f5mr161408eaf.63.1792798724223;
        Fri, 23 Oct 2026 16:38:44 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a843225d69sm284345fac.15.2026.10.23.16.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:38:43 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 17:38:27 -0600
Subject: [PATCH v3 8/9] dmaengine: sun6i: synchronize callbacks before
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
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-8-ef1acb0be768@gmail.com>
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
index 25987f550707..b83138745bd1 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -999,12 +999,20 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
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
@@ -1103,14 +1111,10 @@ static void sun6i_dma_issue_pending(struct dma_chan *chan)
 
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
 
@@ -1483,6 +1487,7 @@ static int sun6i_dma_probe(struct platform_device *pdev)
 	sdc->slave.device_pause			= sun6i_dma_pause;
 	sdc->slave.device_resume		= sun6i_dma_resume;
 	sdc->slave.device_terminate_all		= sun6i_dma_terminate_all;
+	sdc->slave.device_synchronize		= vchan_dma_synchronize;
 	sdc->slave.src_addr_widths		= sdc->cfg->src_addr_widths;
 	sdc->slave.dst_addr_widths		= sdc->cfg->dst_addr_widths;
 	sdc->slave.directions			= BIT(DMA_DEV_TO_MEM) |

-- 
2.53.0

