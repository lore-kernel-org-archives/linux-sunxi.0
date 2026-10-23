Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792780971;
	b=fIeRwWAfc8Ca8oDGH1zhXQn8VXIltepTM2LQV9iyjMXblH7Mu1a9u9xrtvFCCL1Zzcff
	 p8GxXM9WhXb9I9uZRW0P9jK1+JkdqLKd/cjZvoR655WN5skdbzBxWoCAQwITi6tp52PiD
	 A65ZAApZsfqzHGReTyxhcXyII10w8Wmi9tsp9VCoOmueLcb7ctq1egzfDXgkhVR6aZf+a
	 TpJtGvu30hsfO2LspSl0UNFydiDSJuPrGIA0mnFR2e5qkG0PCj//GqtpXsstwkWGrCNH9
	 P1aU/75aM8QfBb1/fsXVc587xRzDXChCrRLW5aE1A3WI0YtM+rlYNQpy/SDXkUQy5HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792780971;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=B1IqYW+doNQQMcUHP4l8j+5MQVcguml9gPI+cwHAG8g=;
	b=dqRdGTw0G8GBNa+Nc9rmcWPVRlMMuFHI6522d/maXgdlrTFsjI0rUIkpLxyNZ8KR42mR
	 ykUciWi+L9S2oiOv2Nqs+xpNwy3BZnzvzUnBYpuuHJnzzvKWSXGE7gHr4Mo5+BRdQbUVf
	 9Rc+/aS9j8C5gkMKwRvY92iDvqhVr5IouoJwVLs88Mp1EVUkKm10RfITuoCWQoDZkiMvw
	 XqOJCmgjzEwFUYdwS9+cEnxcaYeU6Y1CRgTZ4wogYpRc3jv+m0IverfnDqD9NP8/yVceF
	 tCTJrVIj5j4dwTQakOz1Gs+y7Kn/xJ4B4BpNGg13esSkvf07TX1mQ8KWROqaf7L0+5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pizzbvuS;
	arc=none smtp.remote-ip=209.85.167.181
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E89606A337
	for <linux-sunxi@lists.linux.dev>; Fri, 23 Oct 2026 18:42:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12E89606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pizzbvuS
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-4d198f1a591so634856b6e.2
        for <linux-sunxi@lists.linux.dev>; Fri, 23 Oct 2026 11:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792780970; x=1793385770; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B1IqYW+doNQQMcUHP4l8j+5MQVcguml9gPI+cwHAG8g=;
        b=pizzbvuSpBODje3Uf7MNf1IYzvBe7mQOQKnsRzkDlV1auyHXV/H5TuIyRKC1BVrMEK
         1FfItGf1fBy8cLeJS6E65H5DzJ8HGRHUXy0RZ7ch4BHdNvA0Prj9PQhSt09atnndyvBv
         HYGOpp2LBBfoAr8XWZ74MUbCawJLRJDzts1oIVXV4E8x+cEJfd5iPZ6tk9S7RmfW6BPX
         PZ+jwCoJWmyYY7U4vTCxI82MkBrLs1gepgSLl0zpQU33lQJZZSdR0mmufzC8z4gsxyZT
         OgsSaWiTTNHpN6OSd+pMpMrzt+JrwWn5QYuHu5wrz+h+1aH6u2hPeF7AHoNYW6YImnC8
         GO8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792780970; x=1793385770;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B1IqYW+doNQQMcUHP4l8j+5MQVcguml9gPI+cwHAG8g=;
        b=Bm0e6iSj/oVbVwIr0rVcivSrGo0DTbJUVDPxxiKqOpk645me/mW5waNnZ8Guc3jzdy
         WjeLQwC088QzwE2dZIkIPVk+C8xiKG9qeSm0CN4I3HoyV7XM3AgscfZJGxw4t1CBseLA
         +q4QJnkho6kjVQw7X7sdoMsQL8fIztftNhGV3yHZRKuB7LzpZXJGAzx+SEF/d6OOfcqy
         8hQNK9Y2OL2nE9wxJdc5XG5p8Y+LPIZnB9fxMNf+DL2gjvlZnWX7QIC3oDranoYXcgbt
         SPNGWf14XVdiOGvYSmOrjCXwde5asg/qlYiM+QanCV868X17opNWcwVcABx06MQGx3dZ
         0eWw==
X-Forwarded-Encrypted: i=1; AKwUvByazAZu1PHMntFi6hoGmb1aXbuNh+CVgdZixcuIOmBRPW/LyfDYiTQh7s10756Czed3FlIZQbNUNMKKGQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYKSOc8POzetxyGd3gDT2hiuU1XBt45EsuHiHn8lWVXBkkIYR2kV
	KKYffnK/5fEjraa4vnP/JfosGtXU4mYJRUT6/yvicV5uhJb4Uja0wWU0
X-Gm-Gg: AYBFou3CkNw4AZKFleYo+ajC3W1rUM2UttRhEnTN4DB0YffAHfvZUyFz9x549LiDWM4
	iOfon9rMmKRRzbbJfiZ3ojc9pDEx6igXwhzRuwX+E56YAARDQBaZxMYI8/d6bmxL7z92ol62AIt
	CAAyV53B8xiqqPRIv5tiZOpX8bT8PkLy44p42pGF9w/1TGVYlCMof/Mgq96nNN+TfgfPUFvrTey
	KqXsXcFWoFDUhVzm2wGxYFNyFFbO17ZTofMFXlOjWD0rhlavpQkjrdD/3FVuqGD41aMPQZygB2U
	/IDmOIAoA08OHzt1HUet/bttZrRbBVXv6ka3b7sMN3LFiK4IkwTHDvha1vIuTvJW+L2Q6Aw2Jl1
	0+SHl7tSbvmHYWYLEK7B76ItgEHQ/1y7mGeStBLSESXR2qdS0rL1hTvhNcOUUwFSJJQCZSbB0iF
	6j8Gv6Li/8j8QXJJYGs/vSSommB7BjOUqpaxviPCCFKobb8FN9J2uHyThBXE8N9Ehiqx7iO8330
	2RRaRa9/rrn/5DXJgeYFZDnrXEj/lRYfQc4q/DMYw+Zw4wc3sEvwG3QUp0CeY660y1SSWllCzHs
	05psa+soE2ag0GfkchALUvYbZb/OSqosxLh29I10z+S8TVJzwOMCcn8PMlXZFRDhnbKGsnsDotx
	adI2iViAOgdZQaFNb1+Qy/KvH0/WyeHp3gHAqdMXTpTUm2f3T8WPKW7+6SYZ9jr2xMBfA6+72gD
	kN9k8=
X-Received: by 2002:a05:6808:4f6b:b0:4f5:eaac:5173 with SMTP id 5614622812f47-55c002c7d48mr52342b6e.57.1792780969992;
        Fri, 23 Oct 2026 11:42:49 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55bfe199544sm336682b6e.13.2026.10.23.11.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 11:42:49 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 12:42:39 -0600
Subject: [PATCH v2 5/6] dmaengine: sun6i: synchronize callbacks before
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
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-5-c9e07cc44bf8@gmail.com>
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
index 157746c9423d..c244ef572492 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -996,12 +996,20 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
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
@@ -1100,14 +1108,10 @@ static void sun6i_dma_issue_pending(struct dma_chan *chan)
 
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
 
@@ -1480,6 +1484,7 @@ static int sun6i_dma_probe(struct platform_device *pdev)
 	sdc->slave.device_pause			= sun6i_dma_pause;
 	sdc->slave.device_resume		= sun6i_dma_resume;
 	sdc->slave.device_terminate_all		= sun6i_dma_terminate_all;
+	sdc->slave.device_synchronize		= vchan_dma_synchronize;
 	sdc->slave.src_addr_widths		= sdc->cfg->src_addr_widths;
 	sdc->slave.dst_addr_widths		= sdc->cfg->dst_addr_widths;
 	sdc->slave.directions			= BIT(DMA_DEV_TO_MEM) |

-- 
2.53.0

