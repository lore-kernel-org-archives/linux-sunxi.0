Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792798721;
	b=NJClIsJPXAu143F8SZN/y+blBgiWgv+KEfkuGniAP1ZcnDRxaoZX1QqR0XhkEbHEPET8
	 ARPLDNBycapekOLDgIzAUsN069IovEk0ymbE7XKPVGL0mAWBFg5/YlTQjFg+UbD67mnsc
	 cvFn5y851DwdfSKwIugKQsLsCBJgwLnNGdO9MOgjetIP3hl2r3ThM35Hhh4aELWVYxxT5
	 OzxpWcN0ZA3bd0LuqDJ0c58TTg4RjfsxpjTRvbJ8iQ3Duh6YZl8bEqSKW8GEqoyHTqE0/
	 R0p3pwWwCVVIZ8SGkjBaeh/MGDRopmli1omfirbDR/x3GNWpECgGxc70gHwBYIsPI6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792798721;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=vk26c3BTQSmOJJ6zClJ284dH3SqVTC5An1nrNJrjOFw=;
	b=MBWSXfQbyVhu7TvyAaJxx328kCrRp0JfMepZPYPjuuFto07w1Ie/ebSdzr4IBfmxGBtP
	 xcD0ZUsuCWcgy6s2uBJMpdK0VaP5TBLt+01UC88cM9wCxvUVQDaU7iO5EJrd24lkMGntP
	 f9bq9VFvcaydhJQrGzLuT03Zo1AaNYttZPQYwGhW2jUHyEh6RfLhdZosvVLul94U+Kf9Z
	 GBycV9/Xsry0JDK0KfBtdrVkFEY9jT1o9K8+snLJshNRVjh6Wz1zFoOON9QYLaDT1t1wF
	 /8SeTN4AUPhzCmuvhvUEP1NRQyTBnjvx5vC7DBNfNQps8qLTxiSrBdB8a2tzW3Rumww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YUOpcbFM;
	arc=none smtp.remote-ip=209.85.167.177
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E9560A2609
	for <linux-sunxi@lists.linux.dev>; Fri, 23 Oct 2026 23:38:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65E9560A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YUOpcbFM
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-55651e7de9bso776612b6e.0
        for <linux-sunxi@lists.linux.dev>; Fri, 23 Oct 2026 16:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792798719; x=1793403519; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vk26c3BTQSmOJJ6zClJ284dH3SqVTC5An1nrNJrjOFw=;
        b=YUOpcbFM+aErvs4u36vrzZFSCMd9mrIuB4ptO3MN3SrXRMggI1fVrY0XobPuLTXd6r
         jT8v5byoP19WDHlXhl5Oi0QBAfQEIoPFP6PICFU+Dt8qZBo6HfH/Ed3E5JbC59B2enpL
         55KnzR+hWZydtYSvpwvhKISnLISulV4/FTwvfNQON+srtYr1uPWPULR4rcDWwnX4OwLF
         PlLuG8YLjb4srfdevVrcl89xYTdWgwDWoAYEHFVZJh96nrHKxL1rmjSEfNYLH2Uq2N1u
         YaBuWUjztOypUsem0oUlvGqlnLwhZsTrJjoQzjMdo7n6eHackBPv8R68vzQf7UPKFtc4
         i8DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792798719; x=1793403519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vk26c3BTQSmOJJ6zClJ284dH3SqVTC5An1nrNJrjOFw=;
        b=qOxEjk2YHh6rBKNWzlXIrc07/Qoqmr9sBoyTQi1NgFgXd3961OGkb/RkIEVaJ2l1gK
         ir/HIjSfDIPTeE4GwWd6B7GxAzT7cepk5z5TxklKp1EzXfrTkY0i4/dmBS8HBOu74tXV
         zIkRRw4DnwpWz8cTL5MMkUc02tW4psuq/Q3jBfmgjFO4n+IV8UWb3RjZJ+904K/5In0u
         zYw7na4lktDrC6chlQrrjgBgzsJidMwb9OCnQ5ybRXlQcHJw3Z4vax5bFDz2oN7eBYlN
         7/dgBNbVja4dkqEm5rO9ToWy0t4cjcuJf4EM4G5mnrA17u7akljewxgtLPXgrZlHYzQY
         6ytQ==
X-Forwarded-Encrypted: i=1; AKwUvBwI04coBD7r/p+2NbuAcSAxrkf9uH0za9mdeHe6rUCmqmLvwiD18m2CkSMLQenSj/+9zwO/ewrAASQj+Q==@lists.linux.dev
X-Gm-Message-State: AFq9FYKbr3Lr6blWWTByLA20ujPfSr9LbtAym8IxN7fAZqmDzgMgZlNx
	Wym8Q7slx+fH1WTFKq83baLyC2HDFEquSB8kKakXkIS9RAVdOZPF7WC2
X-Gm-Gg: AYBFou2DL7MkKDgSWRpVWttiBBzx04UTuO7Cx2Ba+mtAjDwZwSKTGAdmRX0Pxjtyai3
	hOYBxT3IY/gT6eHGv/L42jWx5+W0GXSnVBNBsB0RQfsSKQykS3FpYqaqbfiBX2FSbKRTEZOQmiw
	x4SlAWLEqLz7kp7XuqnqBk82P7v/rqijke/sFHWcM+EOR/BOh/Oo2Cmx7SRUVw6bIQ/EQ6SBjqd
	eWKBBkzdvoB8Ps/3BpMBfXuXWjguxRsyQKn5kGZ7YgrI1PGR9bVwWNw5qSs1lsG60QLll3b80CU
	WGs7C9FER62+jjQM/XSlH7LP2bnKjWiFUaX33r8mgRwM7NAiZHy74+YTVTS3PDO5iQX6C4uKwmS
	3Wmq2AA5Jk8BMUrL6ueId/RI57P20Cxi1OgGkw4P7t3NMS7D0boaDXrVXserti55lb2RidNglS/
	/wEaSO8fFQO/jILezu+6ieITg6o7GcM4UAkmBN9y56yT2R7Pe6WOSY5XTOkCTYT+Qyeg9Me91ra
	on3Y3LKiXfxZ4lT2Hat7yn1D2luVLnDe66lK9qP5EhTIX2edEKJjZPqbMWungaoKy6KjxKe0JCZ
	MuH5vB05ukwcWGjTtTfnvIQ5L7YDgWKLLTFXXV+dmuDUvu+tUalL4xbnKOrG8t3hflPH3z4idEa
	3x5nf0clEVk6wVNt38ZikMQicj22KCQqhZh4MvvbTvfR64YuUYPFFk8DMef7PF2r+b89YuIZJAk
	2nnHUVAyTg4VeTwEFxYKRHZ4OT
X-Received: by 2002:a05:6808:538b:b0:4d7:2721:cfb0 with SMTP id 5614622812f47-55c002e295emr491276b6e.31.1792798719329;
        Fri, 23 Oct 2026 16:38:39 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a843225d69sm284345fac.15.2026.10.23.16.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:38:38 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 17:38:24 -0600
Subject: [PATCH v3 5/9] dmaengine: sun6i: detach completed descriptors
 before invoking callbacks
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
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-5-ef1acb0be768@gmail.com>
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

Finite completion publishes a descriptor to virt-dma but leaves pchan->desc
pointing to it until the allocator runs. The virtual-channel tasklet may
free that descriptor first. A residue query for another incomplete cookie
can still pass the retired descriptor to sun6i_get_chan_size().

Clear the active descriptor pointer before publishing completion. An
assigned physical channel without a descriptor is ready for the allocator
to start its next transfer or release it. Use that state in place of the
completed-descriptor pointer, so residue queries and termination only
consult descriptors still owned by the physical channel.

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index d3a63c866645..900bb629ba3b 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -198,7 +198,6 @@ struct sun6i_pchan {
 	void __iomem		*base;
 	struct sun6i_vchan	*vchan;
 	struct sun6i_desc	*desc;
-	struct sun6i_desc	*done;
 };
 
 struct sun6i_vchan {
@@ -490,16 +489,12 @@ static int sun6i_dma_start_desc(struct sun6i_vchan *vchan)
 	if (!pchan)
 		return -EAGAIN;
 
-	if (!desc) {
-		pchan->desc = NULL;
-		pchan->done = NULL;
+	if (!desc)
 		return -EAGAIN;
-	}
 
 	list_del(&desc->node);
 
 	pchan->desc = to_sun6i_desc(&desc->tx);
-	pchan->done = NULL;
 
 	sun6i_dma_dump_lli(vchan, pchan->desc->v_lli, pchan->desc->p_lli);
 
@@ -536,7 +531,7 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
 
 		pchan = vchan->phy;
 
-		if (pchan && pchan->done) {
+		if (pchan && !pchan->desc) {
 			if (sun6i_dma_start_desc(vchan)) {
 				/*
 				 * No current txd associated with this channel
@@ -582,6 +577,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 	u32 channels_per_reg = sdev->cfg->num_channels_per_reg;
 	struct sun6i_vchan *vchan;
 	struct sun6i_pchan *pchan;
+	struct sun6i_desc *desc;
 	unsigned long flags;
 	int i, j, ret = IRQ_NONE;
 	u32 status;
@@ -601,13 +597,15 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 		     i * channels_per_reg + j < sdev->num_pchans; j++) {
 			pchan = sdev->pchans + i * channels_per_reg + j;
 			vchan = pchan->vchan;
-			if (vchan && (status & vchan->irq_type)) {
+			desc = pchan->desc;
+			if (vchan && desc && (status & vchan->irq_type)) {
 				spin_lock(&vchan->vc.lock);
 				if (vchan->cyclic) {
-					vchan_cyclic_callback(&pchan->desc->vd);
+					vchan_cyclic_callback(&desc->vd);
 				} else {
-					vchan_cookie_complete(&pchan->desc->vd);
-					pchan->done = pchan->desc;
+					/* Completion transfers ownership to virt-dma. */
+					pchan->desc = NULL;
+					vchan_cookie_complete(&desc->vd);
 				}
 				spin_unlock(&vchan->vc.lock);
 			}
@@ -983,7 +981,7 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 	pchan = vchan->phy;
 	list_del_init(&vchan->node);
 
-	if (pchan && pchan->desc && pchan->desc != pchan->done) {
+	if (pchan && pchan->desc) {
 		struct virt_dma_desc *vd = &pchan->desc->vd;
 
 		vchan_terminate_vdesc(vd);
@@ -999,7 +997,6 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 		vchan->phy = NULL;
 		pchan->vchan = NULL;
 		pchan->desc = NULL;
-		pchan->done = NULL;
 	}
 
 	spin_unlock(&vchan->vc.lock);

-- 
2.53.0

