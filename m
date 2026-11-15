Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794735201;
	b=usjZ3tGuz9X7SyJpEqyirR9T/2nJrKjiPeESE5AuIDxTDrewy9IKnacfpdN85Bzj71kX
	 FVvqAsndK/JVPqI0NnrhdMaPn60kGgA/QIXcJwkHxGfZ2XcHfO4FUn/7JyLVwk4JFQjNv
	 eM5fLH42p3K2TJ8Fk7DISXvAFlQA4BGj5v6oBnxt4VaCKBpuhLknW8LCzTz4vcTMHk0/i
	 wB/NGZU2JNJN/G7D4jYFzUYpZeEIycOWqKSTru2CHqGR6TCbrObAZFmHffUG1XXX+DFI9
	 QfZigTpW+nvONMrXhag1LUgmcxomt9KUX4j8LVCx38viwnQOXvyZVJv7GqyWPCSmoyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794735201;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=NlQp3R8KuFLhV9wrXx8XG9nak7uXzaBTY2y9ltCW+Ec=;
	b=naLL4wTB+T/h4AwxJCue3BrZLkCwFt0bitZicN3VjaLNn6xdhpc4Poxaleja1efmr3K4
	 1OhiFjVh+Bya+b5PvSLh2ingw2pPAUovuH7C1H7bo3xAzCxQIYGE3i5XhTav4iHaZlCHO
	 FQ90sEXoVNQlXQ9cvyJSHM8twktMMa35Npn3Z12FI7O27QRxLQVM86g0AWGgUC7seoLSd
	 j/ypADaWwXhKgK9YGZZcWVxj5BNTDliQDoW2Mw8ZfZbFN7vtjpx6FlWzqU4yNw4XmVYR3
	 hRYHskeQ+yQNCv3kx7GzQXm+HOEOTDi7VMce2Im9dE1uEZhIdKz9+V0+8bxvTLwR3dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=clNl6+d9;
	arc=none smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D30606A8A6
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 09:33:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94D30606A8A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=clNl6+d9
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6de2f213b7aso905267eaf.0
        for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 01:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794735200; x=1795340000; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NlQp3R8KuFLhV9wrXx8XG9nak7uXzaBTY2y9ltCW+Ec=;
        b=clNl6+d9X8exKCMnGNwaG/cjldOjhn8ZH2SvvZmbk6SuLq23QmChrNz6CeBtIHSB5G
         QOTf55A0fXGIsTgTdvji7dTV4tB2WXJ4wQMwS/3re5A+9g/tp7M4IlOW202tMWyNtdMZ
         Q2eZgSZoi//5ISqWAyBq7SXMAO++BEMdRDcleGUTo+quyvAIOjB3XZozK3pPKXYWh4Q/
         SyjaK2/r9OaX3rV7m08E/FQepLczbZ8Mj6WBjzVLCTlxV3QYZ6xpo1MObV+iGPFeRETA
         6NvvmR4hHxKaDRj7uILkXY9NDgIg6gCkzFURfZA95Zv0/0Nw4NwcuSq0t7AfnatlEc38
         5XTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794735200; x=1795340000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NlQp3R8KuFLhV9wrXx8XG9nak7uXzaBTY2y9ltCW+Ec=;
        b=okFOWuHUW5acJDiOF2W6kKnDyCnAXYuhUnarECeotZupJqlALACIwpz0wQ8X9Ut6Rs
         pi/o/svMaSNPeFc15RJ2l03h6J3ixeC7FeQFGm4gbGv9jeEeypvy33eKN3DqBINCgDkr
         gBc5111duKHOqnEjGCU/LI5dD6pS2jDjES9/oxcSUp2lgJtW9TWFAe6k66+B7snTaGEP
         mEF5zAxula2QUV89roUHOtMyhzumFCnHP1bXtmK4RVtbOOEy1NiseYOClosHHnH9Dr07
         v4BK6EfOp4zrfhhdQ/McZcHHMTxI/qJA4zxN7d5ZyogQ0XDbQhyO5AxUfOE5H81pdLyJ
         ElPg==
X-Forwarded-Encrypted: i=1; AL+hErH5qRwpsce9DPbzoFXGP0dN0DmYFdmjTge9nleSeDqvF5vWyMW5rpFCPKcpGXQe0cJkjhPwrQhqMxAaCQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z80PgVSC0r0R01LpUbcQuTjW0ngKXQ3Dv5+H94y5m+plFxUnKlW
	f6tmndg/3v5pvuXnRtpuGtOMOwFPkF5fzGTvEuKNg2qq3X3AZ4x7Ahv4
X-Gm-Gg: AYBFou3kgFb4VjPSC4g9VcXvDlyWbBRW6Us+gU62egUrFoCBnX7YhcnutAvWqRxV3XL
	Mxuj6vASkGShgdlSQR6OanWZdYLh7XKVp0TVLcfaGENIxUzsA/itqiyfBm3hiqZwDewhFdflhsu
	n5tOUBEVGGLZ0FbYytJxW14G3fQJJNJDu7lQ/Snw30Twd/A02B5+2fTDv2vh497B218LiZResoy
	KxjjsSVEkpjTx6TuwXyDDBXqksto93+bBT8NYMZTFYdA+JeweGuhZEHlfd6pfHgSAT77Kx86nRT
	VPH90LOrSq5hMKHLTEuSx1PJiGaJdVJDMkPE/QE1OgEIJNMWfEc2j9Ud/KKxBnDZmxktAabs5gK
	idEmIMjREz/0UYx4uMiwnKcsmQWnLbCS5G3a1SIwTUVXTFfWskozWEZhorIGGUQNanwcQUODdmD
	7tFZMXMV2DDcsYhhrKFQFAAFM6MhEGI+5QKCe1CCf/U5PoW4qU5ooAb+mMpNFBnSDQZrJ+cEdQJ
	SqrEZywtdAcYmnn9wmxKZP/txRiTvTSJVVABDdWQYKu7gME76CN/lWFvuETou/+1cSj9n71zM0r
	Eb19vftDbnuN2pqoz/he/olpqTvW+19RjNQs8MHKrj85vjZ8W9JWicisXNEoMHWcECzUt/DhSPn
	YEWNm7dLXTZCdPayOAr22rSS4Jj2ELBGdSR+4MeEq9FMvHtwDBwMPbeCwocNLkWgTeYDr06A2Pq
	TC82m2/H/ny45n4qe6fMjNv+Su91wGP1vSinfOuUuBken5Sn7dX5g=
X-Received: by 2002:a05:6820:a711:10b0:70e:1dd8:6713 with SMTP id 006d021491bc7-71ab51550camr2956017eaf.71.1794735200601;
        Sun, 15 Nov 2026 01:33:20 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab43347b9sm5933617eaf.12.2026.11.15.01.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:33:20 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 02:32:54 -0700
Subject: [PATCH v4 6/9] dmaengine: sun6i: retire interrupt state before
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
Message-Id: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-6-043cd476a45f@gmail.com>
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index c30e244e50ea..ab4474f0a8aa 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -503,6 +503,11 @@ static int sun6i_dma_start_desc(struct sun6i_vchan *vchan)
 	irq_reg = pchan->idx / sdev->cfg->num_channels_per_reg;
 	irq_offset = pchan->idx % sdev->cfg->num_channels_per_reg;
 
+	/* Do not deliver a previous transfer's interrupt to this descriptor. */
+	sun6i_write_irq_stat(sdev, irq_reg,
+			     (DMA_IRQ_HALF | DMA_IRQ_PKG | DMA_IRQ_QUEUE) <<
+			     (irq_offset * DMA_IRQ_CHAN_WIDTH));
+
 	vchan->irq_type = vchan->cyclic ? DMA_IRQ_PKG : DMA_IRQ_QUEUE;
 
 	irq_val = sun6i_read_irq_en(sdev, irq_reg);
@@ -975,6 +980,7 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
 	struct sun6i_pchan *pchan;
+	u32 irq_reg, irq_shift, irq_mask;
 	unsigned long flags;
 	LIST_HEAD(head);
 
@@ -996,6 +1002,14 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
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
@@ -1005,6 +1019,8 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 	spin_unlock_irqrestore(&sdev->lock, flags);
 
 	vchan_dma_desc_free_list(&vchan->vc, &head);
+	if (!atomic_read(&sdev->tasklet_shutdown))
+		tasklet_schedule(&sdev->task);
 
 	return 0;
 }

-- 
2.53.0

