Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792798722;
	b=fKe8SsHnEKqjq9hUu7hz1QNcBwUz81LudPAvnRCUDq9Rw5GVfEmbGNdGLaiI7oDsvR3L
	 0kraFt8UvrLuCTvBnS+xXf6A0ZiXyiiF2+PSWHBtGIK/wl2VHDdqjGRbMnfahaWB+B6go
	 UbNHg0Bri1BobLfYSqpeHbZPmJNyyqdhj9U8LIjXcQhrooq2j/SD6OhWqxeImcBm+wwZ+
	 xjQfSQcepgh+pB5eTG4NqQ8N6k6WWe3mHL1I+hPptdcxdpazrtOXlM2sAl1/n92pp4iwu
	 AnFugZOWjPhUipr1A0yR1SFn2Cgpscax/XLnh9YELfrfwc+7xwxKbFouQjsfH4ZWQlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792798722;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=zkFWZrZqrOF0fJWX5siiys4KdKUOKCNqH6flFHqQFIY=;
	b=cWWn3RUdXMENcpvGeTEqBYe7MIqT0JJjs06m7JfJX/xsyDI0GuSZIL/dv8QSf45R3btF
	 FMXVqH3iYDVeLnKfxdNN4HfDYieZo1aH1GxFUBnfPRWqdDcewM45gy8YfHqQEEKUP8xd2
	 Yc64Fr5LRoI75OBGLo00duLfSLK0RftMbaC5CuXyPhXs9FGVs/0FiI4/D8mdyoBxYIY5D
	 L9xcqMQiK3kXjzp/CYpONDrXdm3GFWAw311ny9uYCNYh7QRqeDQCjOIbOZvYgijclc8Uk
	 0/VNkobE+K2aOaPmrZ9xc9LhO9GldoxycgWn/EN4JedRGmxpp+RMZakYTt9yf6paIEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dJrYd7qi;
	arc=none smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35E660A2613
	for <linux-sunxi@lists.linux.dev>; Fri, 23 Oct 2026 23:38:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C35E660A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dJrYd7qi
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6dd7070699eso992327eaf.3
        for <linux-sunxi@lists.linux.dev>; Fri, 23 Oct 2026 16:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792798721; x=1793403521; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zkFWZrZqrOF0fJWX5siiys4KdKUOKCNqH6flFHqQFIY=;
        b=dJrYd7qiU2bvcp2iIMqM4F60D4QnUEmfjAufiDQhaFWL9B0DjBLlbtHRfpSgIHWCsj
         9jrO4ePfmqMVwFrUO77wgg8sbFK4nn6ozhffN/H6fq2Z0hqgNVhZWZo6z3hBrHjDlyjd
         a6aQSjVyST2bHaX9NjYa5Zoqme65hMerVFEYRRCP11fs0ShqVVOVuifWLobzmvulZawj
         DNZjpud/1HZnzBH3yDFa+23phj8hi1yxKL06gl8LCxNagcRFNshJIt+3j/jsuZn4JMfa
         UcPeSZAxjSn7TwhLBge6M/Zm3XneYMmvYMVAZbF6zfA8NxSQfxikglF0XHmqIlZkx5IS
         Affg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792798721; x=1793403521;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zkFWZrZqrOF0fJWX5siiys4KdKUOKCNqH6flFHqQFIY=;
        b=BEQXwLBA0cbKQYJjRWIKHmBpJaFv/NBHYf15AYK6s4TqEO8BZOd9+DnaAc75lygRdB
         eBZsIuotP43cxlznnj32MmshYfqo3gp1MA4cUtpWIHycb0e8Gc8QPeC9A1dHJVn0IeXN
         mGWzfDMJWNnAEZJzOvJMIhXBt0d5N630ZIo8LhfwLEI4RZ5Hs/q2/PY3TO2e+MousrvW
         9ye7QHUkIu7MEQSP/OJLbOl5HrDTJmApVspNcODIDqbjg7sPyu1euq1Jk9Edqnnp5QBL
         GW6CWQMWlAUjHaJhPisJCX6tIllzMmgZXLeDR0LPuau1riH+IFxTDGC+nPSSXG9QsKUg
         XxHQ==
X-Forwarded-Encrypted: i=1; AKwUvBxD24F2BOKG8UjL0H4aNH+b3SwRB1FhKoy/bF8V4b1N0NXkmeEbCr9IWYRc5Ful/dznsnX+wvRO5W/lwQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYKuFeFt8jEd+BaUsvrmPScEmTCBJ50ja9VRdAZOqAxukfbHuieB
	aj+PlutAKK2NVKf3Au1eFqETSp0tdmewoHuQZ+hQFEnih7qSMDYbz+IZ
X-Gm-Gg: AYBFou2rP2kM31seswRqmf7BFJ5tVaJ4Zjcw8viC+W3II6mywICNah0/pA2Z4fUInvY
	b5JKCCyP+Fx9HjNOpJLx03j1SdwClLaFQ2X+XRzUcygL9oOpAbS++Y0TWczy8o+8lCVlHFF5zU4
	eaxut8nfvhZQjVnbjD2p06UON5wzfFN0Dui1XhZ+h7lwiXPQ0S/wnew1QEEoZp+Gd5gzseKN5U5
	L9YyHM/M++OigpzTyMvT0P1BB+saJMcemVFWg8T3rsfhHIA5fKHrBaXCdytsfI9lOMUShfNoGiD
	XuF3SvOoaDzgwq/jVQi7bPTUtPe9u294bEHEUqJ+jyxdm0a1VRVwl3yBGpQtkk+Ya5eWoY2uHoi
	sBy4KcNpIzZxMWGYtVHc+qU4W/IKIRGtOy0ESFWH3GMQa0PNQAbkqF1Dv2+PHMS6QHlHF5aNuAX
	uzybi7xmYkH48wRs/LuqsBDzwgaRKj+ugzm/8Q26qOwD6UDajtNw3S3UOBhzS8OpZZJc8knP3Gc
	n8qY/JCcj4TAywiDj9fImthutA3UuTYRPVZxOq8wkV0Q1hF0+cW5muDauWWKQR0uc98XfumBC5X
	ymkHEeaEwzjg/7Q2+9r1KBa5QcSSmGi9KZISZh49/6+KRWHwpdAXPQj80WuQtX3i2B/SuJC4+wY
	wqInI37OhoGFdCH26dROjOXykh8heXL5Ks29jHkqb3SWV/s94yt8nfUn27uHU+CXihsO5djXrsq
	pHV1E=
X-Received: by 2002:a05:6820:7093:10b0:70b:8379:c145 with SMTP id 006d021491bc7-70ba0da0506mr162964eaf.28.1792798720713;
        Fri, 23 Oct 2026 16:38:40 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a843225d69sm284345fac.15.2026.10.23.16.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:38:40 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 17:38:25 -0600
Subject: [PATCH v3 6/9] dmaengine: sun6i: retire interrupt state before
 reusing physical channels
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
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-6-ef1acb0be768@gmail.com>
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

Termination stops a physical channel and drops its owner without masking
or clearing its interrupt state. A completion latched by the old transfer
can therefore be delivered to a descriptor installed after reassignment.

Mask and acknowledge the stopped channel's interrupts before releasing
its ownership, and clear pending status before starting a new descriptor.
Keep these register updates under the same device lock used to sample and
acknowledge interrupts in the handler.

Schedule the allocator after termination so pending virtual channels can
use the released physical channel even when no further interrupt occurs.

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 900bb629ba3b..dab17b3863fc 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -501,6 +501,11 @@ static int sun6i_dma_start_desc(struct sun6i_vchan *vchan)
 	irq_reg = pchan->idx / sdev->cfg->num_channels_per_reg;
 	irq_offset = pchan->idx % sdev->cfg->num_channels_per_reg;
 
+	/* Do not deliver a previous transfer's interrupt to this descriptor. */
+	sun6i_write_irq_stat(sdev, irq_reg,
+			     (DMA_IRQ_HALF | DMA_IRQ_PKG | DMA_IRQ_QUEUE) <<
+			     (irq_offset * DMA_IRQ_CHAN_WIDTH));
+
 	vchan->irq_type = vchan->cyclic ? DMA_IRQ_PKG : DMA_IRQ_QUEUE;
 
 	irq_val = sun6i_read_irq_en(sdev, irq_reg);
@@ -973,6 +978,7 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
 	struct sun6i_pchan *pchan;
+	u32 irq_reg, irq_shift, irq_mask;
 	unsigned long flags;
 	LIST_HEAD(head);
 
@@ -994,6 +1000,14 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
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
@@ -1003,6 +1017,8 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 	spin_unlock_irqrestore(&sdev->lock, flags);
 
 	vchan_dma_desc_free_list(&vchan->vc, &head);
+	if (!atomic_read(&sdev->tasklet_shutdown))
+		tasklet_schedule(&sdev->task);
 
 	return 0;
 }

-- 
2.53.0

