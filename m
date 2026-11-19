Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795111391;
	b=zk59nnCZ+Fzv9OF0HxP2WcpLeieNK4pomDkw9hHDQ3Dlfz4WXuX8l2+dIwNuB1WN2I5X
	 HxlpSlr6ySqboxj7emEC7ATME8ZL2sh/Tyw+NPZYSPLjMK8ZCQLeHJTM5510mecko0nvA
	 rRJqqOBKzB+TMSX78RsSn7Dqp5Hnkdjwh9jHdU8x8BpIcodVOmBzMDJCGB1B7P0p9K2uy
	 mZliJKiMXSWxqXK9+SGTXridf2tZ/OvSuVqx6+FO3O/RjQNyqd70npOhJ14Ud0bXmDBvj
	 Jq55x1fshbyCzBcpTB+/rVXnAImwfR37Rn7kS0x1Ci7zGOlvGvZPQm3pRAdcAPxeFDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111391;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=xgSmoxBrqnKlDHDPXkpFmY/x2C8GWXkCurAJnyoUmxM=;
	b=Qp2zLq+1TTpZg8FXAgPyrMXm6UKHCyEdozUpOcL4Rm3zmwDXaGSnyko1ln1KqQ/vtB5R
	 GF6LU+DS4RsESwywQ+PpaQVb52KSrlcyysX7yUVn6pAK+uuF/VfcZiG1dud9Yz3nJBwCp
	 DK/UIHwust6eY4ftm97f6mlnCrAjDGgxE9oqw5qapMijIyBlAwYAaODN42hDIDalEzp3j
	 PgJE8wpF9mT62YJHhWe29YIePeYrS4pRND0ZhdVq++r7NEjcC54DZ3As1WGpMRKba9I96
	 bUAvQ/ZzUOIXI7VW2lOtKW48fgn3XcD+jkHZ64CmMclN9jNFzsuPbJUquic366V3VCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="bs/LuToK";
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E152606A338
	for <linux-sunxi@lists.linux.dev>; Thu, 19 Nov 2026 18:03:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E152606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bs/LuToK
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-71acdd32a53so1000584eaf.3
        for <linux-sunxi@lists.linux.dev>; Thu, 19 Nov 2026 10:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795111389; x=1795716189; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xgSmoxBrqnKlDHDPXkpFmY/x2C8GWXkCurAJnyoUmxM=;
        b=bs/LuToKNc+egLbAT2zhdeLzQlXTjo7qH53LTiOjwmAGg6O9ysoRUSVpyCSoL7oslI
         /OUKJN+h9Mz0pBk5NKf7wbeBJwlbsmYYUSXPCvGcw8BKFmp1DYAgU6ewqVtxrVZJ0zrc
         s1wuOHdQoXXqhFSDafsysQuWLFNkmTujOJosiLId66/lcE9ue5AB0Kkqb7FouRLgMxc5
         DD3cM7RbW+koXE1bMrNtdeotVSgMR7hYGMN/h2pmncqhNjua6tlwinARljvaqK0Fsl/8
         PSomIWHPAZo7tGTpaCturmNMQvYJarwGlS1Wi/rJ5k8ZuEjW2CeaYuRfOqLqbp8TWOW4
         2KcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795111389; x=1795716189;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xgSmoxBrqnKlDHDPXkpFmY/x2C8GWXkCurAJnyoUmxM=;
        b=q37wREf2zhKgQKOawUQLIN8iYsFKjCcKCKh7lGltCYVDfMFbvYXrZcrhX+DuCLmSYC
         TRgyHYS6I/t0jgcMnyn/dOaWK3U2YnO0RcvUG5NPBP4N/9Lef/kMOo3oANq0gp2PV3iw
         VE6AkOysS1Ql0WRXpCQ+b1slLVgFKXwZbuJ+9rLNNwtQQygHysW/3qgLpAsTb9j0HDld
         /e649GvrMK3t5fLRZcVrQ9ngHyf70qCvvyaH7Iz3G6fH6qZAL0/4lEZMKEyKUwvKF74v
         dfIpjMcQsPLreya8k02qJuXPBD89LPCbLG4uI+2cF23ULnxCchuje7RoVzIiGDj3ZpCP
         qU6Q==
X-Forwarded-Encrypted: i=1; AL+hErERTlt+Hjk04anQq/XhspTKbclAUuN//Xc24EhlUJYVY/3oit/wc0FIrgeihwKSCt4htM8F0Ocl3Z4MPw==@lists.linux.dev
X-Gm-Message-State: APuU4Z9bQ+3WoelD3GvznWFShfRsEWHyGlRRyvPdtM2adSNc2af6KJr8
	hdBgDaVY8/PqZZqEYl8hU7VYSkZBuFpaV4bv/KYkvZGSkGhMUOV7fbz7
X-Gm-Gg: AYBFou0LtdTIcPFRfTI0RGB2wXuYbvSVq11MbMEksFc+TVi1ML//n6Ew5T4Mb7VEBY+
	+X9j+CPUy+1geoCOW8OhM2S3oO4t62242QpkggXYNkiaWTm6TTf7u2+MuVTdAeyjS5mqtm090EZ
	l4AQafT9sqGA7VBkbjp+aeRsvQbLzGoKGpcjj1aAd6rOFSDjm7J+ZZ3Cc1k/OaG0efkQ0v+Zjmo
	xBV4M/MnxdEFetyKKgeTK0WByNukoJRPx0xKsTYnPSYL/5JxyxXoPAuKL9Xv3Ko7JKqZOU2srUt
	WXsJ3VBePfrcgxmE91tKrJA3T/Bw477AFjw3+qFytwY0hcCBXjMgNZfTe74pmdKeqZrz/f13Jqx
	1dds7AO2d4dEuUDLf1A2bLhrfQrYTch6oWfHKlw8S3RMStDjceSByd4w8RVPiHR/T1SZNHHq0MH
	DBKOLKucuLuWk9qHk5LkIKYUuzL23yxojrDZ1/bQs+qCR6c1grwz6sTECuJUM+oA4BzSOg3nu/q
	50TZL4cbCKTiHTu7VzvKl8sTQN7Gcmw4Yalb8XbJt7/BrTXP+47YbDxSZbNKgvYdlpkpEo0DFwV
	2pKmx650kiLLXlxKnLES+zTPKp9w4UO7EL0HPN61Hb6PYrlMr7GneGet44VA+5tHjb7ckHQ8yh4
	CTDtPZ+KnmCU/VlJMC/tMlr3uc9l4QtxVNbQHPnsnyRd6P00+ZGkExEQXdz32Q/kp8+ee6JC+EM
	AUfQTTVXTsNah3kxNqEZU4W7sNTdWbGv7RgNkHx0N4UP1CETYMX+rk
X-Received: by 2002:a05:6820:614:b0:71a:f794:49c6 with SMTP id 006d021491bc7-71b39566d0cmr341259eaf.69.1795111388904;
        Thu, 19 Nov 2026 10:03:08 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b3806ef20sm448478eaf.7.2026.11.19.10.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:03:08 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 11:02:22 -0700
Subject: [PATCH v3 2/3] dmaengine: sun4i: retain cyclic descriptors until
 callbacks drain
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
Message-Id: <20261119-submit-sun4i-dma-callback-lifetime-v1-v3-2-3935aef58db9@gmail.com>
References: <20261119-submit-sun4i-dma-callback-lifetime-v1-v3-0-3935aef58db9@gmail.com>
In-Reply-To: <20261119-submit-sun4i-dma-callback-lifetime-v1-v3-0-3935aef58db9@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
 Maxime Ripard <mripard@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

A cyclic IRQ queues a virt-dma tasklet with a pointer to the active
descriptor. sun4i_dma_terminate_all() frees it without clearing the queued
cyclic callback or waiting for one which has already started. The tasklet
can subsequently access the freed descriptor. There is no
device_synchronize callback to let clients drain these callbacks before
releasing their own resources either.

Serialize both half-transfer and end-transfer IRQ handling with termination
under the virtual-channel lock. Recheck the physical-channel association
after acquiring that lock so an IRQ which looked up the channel before
termination cannot use its detached transfer state.

Use vchan_terminate_all() to retire descriptors until synchronization. This
clears any pending cyclic callback. Retain them until a new synchronize
callback has waited for the IRQ handler and drained the tasklet. Drain
callbacks before freeing channel resources as well. Termination itself
remains usable from atomic context and from a completion callback.

The shared helper retains all collected descriptors. An in-flight
non-cyclic callback still owns its descriptor on the tasklet's private
list and retires it when the callback returns.

Fixes: b096c1377d1e ("dmaengine: sun4i: Add support for the DMA engine on sun[457]i SoCs")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun4i-dma.c | 41 +++++++++++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 14 deletions(-)

diff --git a/drivers/dma/sun4i-dma.c b/drivers/dma/sun4i-dma.c
index 225e4a53502b..b0c91dab62f0 100644
--- a/drivers/dma/sun4i-dma.c
+++ b/drivers/dma/sun4i-dma.c
@@ -293,10 +293,20 @@ static int convert_buswidth(enum dma_slave_buswidth addr_width)
 	return (addr_width >> 1);
 }
 
+static void sun4i_dma_synchronize(struct dma_chan *chan)
+{
+	struct sun4i_dma_dev *priv = to_sun4i_dma_dev(chan->device);
+	struct sun4i_dma_vchan *vchan = to_sun4i_dma_vchan(chan);
+
+	synchronize_irq(priv->irq);
+	vchan_synchronize(&vchan->vc);
+}
+
 static void sun4i_dma_free_chan_resources(struct dma_chan *chan)
 {
 	struct sun4i_dma_vchan *vchan = to_sun4i_dma_vchan(chan);
 
+	sun4i_dma_synchronize(chan);
 	vchan_free_chan_resources(&vchan->vc);
 }
 
@@ -322,7 +332,7 @@ static struct sun4i_dma_pchan *find_and_use_pchan(struct sun4i_dma_dev *priv,
 	spin_lock_irqsave(&priv->lock, flags);
 	for_each_clear_bit_from(i, priv->pchans_used, max) {
 		pchan = &pchans[i];
-		pchan->vchan = vchan;
+		WRITE_ONCE(pchan->vchan, vchan);
 		set_bit(i, priv->pchans_used);
 		break;
 	}
@@ -339,7 +349,7 @@ static void release_pchan(struct sun4i_dma_dev *priv,
 
 	spin_lock_irqsave(&priv->lock, flags);
 
-	pchan->vchan = NULL;
+	WRITE_ONCE(pchan->vchan, NULL);
 	clear_bit(nr, priv->pchans_used);
 
 	spin_unlock_irqrestore(&priv->lock, flags);
@@ -970,13 +980,11 @@ static int sun4i_dma_terminate_all(struct dma_chan *chan)
 {
 	struct sun4i_dma_dev *priv = to_sun4i_dma_dev(chan->device);
 	struct sun4i_dma_vchan *vchan = to_sun4i_dma_vchan(chan);
-	struct sun4i_dma_pchan *pchan = vchan->pchan;
-	LIST_HEAD(head);
+	struct sun4i_dma_pchan *pchan;
 	unsigned long flags;
 
 	spin_lock_irqsave(&vchan->vc.lock, flags);
-	vchan_get_all_descriptors(&vchan->vc, &head);
-	spin_unlock_irqrestore(&vchan->vc.lock, flags);
+	pchan = vchan->pchan;
 
 	/*
 	 * Clearing the configuration register will halt the pchan. Interrupts
@@ -991,13 +999,14 @@ static int sun4i_dma_terminate_all(struct dma_chan *chan)
 		release_pchan(priv, pchan);
 	}
 
-	spin_lock_irqsave(&vchan->vc.lock, flags);
 	/* Clear these so the vchan is usable again */
 	vchan->processing = NULL;
 	vchan->pchan = NULL;
-	spin_unlock_irqrestore(&vchan->vc.lock, flags);
+	vchan->contract = NULL;
 
-	vchan_dma_desc_free_list(&vchan->vc, &head);
+	/* A tasklet may already be using the active cyclic descriptor. */
+	vchan_terminate_all(&vchan->vc);
+	spin_unlock_irqrestore(&vchan->vc.lock, flags);
 
 	return 0;
 }
@@ -1128,9 +1137,15 @@ static irqreturn_t sun4i_dma_interrupt(int irq, void *dev_id)
 
 	for_each_set_bit(bit, &pendirq, 32) {
 		pchan = &pchans[bit >> 1];
-		vchan = pchan->vchan;
+		vchan = READ_ONCE(pchan->vchan);
 		if (!vchan) /* a terminated channel may still interrupt */
 			continue;
+
+		spin_lock(&vchan->vc.lock);
+		if (vchan->pchan != pchan || !vchan->processing) {
+			spin_unlock(&vchan->vc.lock);
+			continue;
+		}
 		contract = vchan->contract;
 
 		/*
@@ -1138,8 +1153,6 @@ static irqreturn_t sun4i_dma_interrupt(int irq, void *dev_id)
 		 * interrupt (odd bit)
 		 */
 		if (bit & 1) {
-			spin_lock(&vchan->vc.lock);
-
 			/*
 			 * Move the promise into the completed list now that
 			 * we're done with it
@@ -1173,8 +1186,6 @@ static irqreturn_t sun4i_dma_interrupt(int irq, void *dev_id)
 				disableirqs |= BIT(bit);
 				release_pchan(priv, pchan);
 			}
-
-			spin_unlock(&vchan->vc.lock);
 		} else {
 			/* Half done interrupt */
 			if (contract->is_cyclic)
@@ -1182,6 +1193,7 @@ static irqreturn_t sun4i_dma_interrupt(int irq, void *dev_id)
 			else
 				disableirqs |= BIT(bit);
 		}
+		spin_unlock(&vchan->vc.lock);
 	}
 
 	/* Disable the IRQs for events we handled */
@@ -1276,6 +1288,7 @@ static int sun4i_dma_probe(struct platform_device *pdev)
 	priv->slave.device_prep_dma_cyclic	= sun4i_dma_prep_dma_cyclic;
 	priv->slave.device_config		= sun4i_dma_config;
 	priv->slave.device_terminate_all	= sun4i_dma_terminate_all;
+	priv->slave.device_synchronize	= sun4i_dma_synchronize;
 	priv->slave.copy_align			= 2;
 	priv->slave.src_addr_widths		= BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
 						  BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |

-- 
2.53.0

