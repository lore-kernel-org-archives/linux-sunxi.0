Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733614;
	b=pWlMSwUVX5tUpqAQIxfBk+anRFml49qtLWy4Ox62GjkA5OVJr2rUYhEtpWfiorqH/9E0
	 OIx5xb3mI3UiOqC5vhmHGt8YzBTt7KAk15AqUF4q/nE8qrA33I2SMo586YExdK0G4CAqI
	 caPSu9KgsB1jlYx2uiTHBGJPTBrnVkLNmsClaq3j3NZVqQ+znfw6o+2NqJXFKVhEglEOr
	 xqyWLFvQyK1EK3N+xTCnAZotXjzLYGMmjdVyNob3U5CYbYW/Ajhwhz+F+bdHkStVXeM5e
	 g9sOuGmE3ID6U+1nHtN41G3h8qdAuROSDwNenFqNaRpXBiZf0O9bgtg2XiwTg8baqPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733614;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=xgSmoxBrqnKlDHDPXkpFmY/x2C8GWXkCurAJnyoUmxM=;
	b=wtTIQQmBOFQGh29+iO2/S5+uWe0mXyYfMBYB9Pak0f4yJrSlEqVETHqbl1T/FO2z2KwH
	 nGySeG7zTGT7G4IrlBqUFOvDI4Yxi6hLYtrDbv6Uav0aGz5LiYg/3Rc58cKql3d/ubWUO
	 qUGyccE0x0T7PWUPUSteE3rx2ASN0RsfMi1N/GD9NnQXen+ftQF/4Fy8Vq8HTpMTuQrHV
	 AE2DkQPFt4GYyygBB75RzpR9xucCgPvT4OaLe7h5zyNYrX4utfW1cJiZQky/mvqIgpJsH
	 hd0pTr/9rfply2YNXwIVMaQB2YHpwD39b+BDB+1nL3mSYbbhIcPh3ARiZl0nFnkpsBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BBxyn6y7;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2509B606A88C
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 09:06:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2509B606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BBxyn6y7
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6b1afdf5196so869357eaf.2
        for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 01:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733613; x=1795338413; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xgSmoxBrqnKlDHDPXkpFmY/x2C8GWXkCurAJnyoUmxM=;
        b=BBxyn6y7ZkX0H+LtsmtdiIqhF+qUouOJk/mKnU+HjUYZBiuSiCc7ewPTsIdYUzQ5W7
         wkI4+aL6F8cdd3KCowxmS3gUSceWd6fhpOlWE7ThOrpRhkuRdgszsHLpKN3tZ/yzKJW9
         1VAbghknBFKB8+hOchAxfm4+5hmvHerYYBAYLGf3F+pkSTChiHainYJiOJM/G1HNLI03
         hf0yb729Dk5Qtu6GnCZWE4Cd4auRLK3qKF5RLEe6Zi6weFicSwbuqOW6abx3Mn3abeEd
         bw9nWWLskcnnm0p0cWWCbKW6OkWnX7eZakGry5aGyx55ypL/9/QZDM6hBLcp/spN8kU/
         a7VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733613; x=1795338413;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xgSmoxBrqnKlDHDPXkpFmY/x2C8GWXkCurAJnyoUmxM=;
        b=2KA3heHe2Zn6dkBHBlkiQ9Rdo2CpoU6nd1cfXOUfe76jssLK8YYVFocZFEkdnZ1Bu9
         a2qqqmKE5E6aDyJ+RY0En7s/G0JN9LvRpktyKXInER0BpyHSlx70mVPW/0YEGQpYX7Ht
         a2Ux4O37Cct6kO3lenbvb+j3yaieIKQOlwvEiIp3p7YkDvlR3uZKylYskG9t3XjWvOr/
         EjmCriGTTOVRsd0DS/vDx2bSGt1aSyCiNgvZsrmk2uNNlfxEyOAPAU1J5y4bnBNdwUr8
         FHAwWgrlnz7mJjMKyBZljVk8Gor9yVVEmsh+4dETnEnP3dFdvRSD4b1OBZ18viVhQ0xD
         xYmQ==
X-Forwarded-Encrypted: i=1; AL+hErGjweIWM3SUbeLVv3Mw+GadDai3DmBNrR23ZMXLNeE6H63FMrXJg0pBAZAjH89uxPmKOItxphXCAhl/3g==@lists.linux.dev
X-Gm-Message-State: APuU4Z/LNGgK/tC5xw3F68OYfiL4QAvOUFHeH3iJTdVc8nKPVzkGzT/1
	xDWDkMX4mm2XXkLcmut2WtXngrCenYFI1awzhxYL+09BKO0/5TSwfjAI
X-Gm-Gg: AYBFou12mjA+ALX5xWDcFrGxeYnSYfCT/qm3+gGX4SFFXHR7ybNxsibHFtg8Kongd+Z
	5TEqJMaQ0NMZhkqgRCc4rfkkaM/gQV+WP+mYb430UtGDJgaDFWqxQSgrI+T9ZX2P3kwLoZg+nUL
	6Td3yncw2U8ZPc8t2iGum6jgSz34UzojecHlXaXJ2AUMp5/SYH3d0tcZfGWVm3Yzzkxl0iR9Waf
	O1MNKpdGGHWS3mj946BLoeI4lXjCTsUabzBlZrRknWwdDqXV8brppWrv1oyB97fOGdoc7eshXgk
	kw0Y4CPA5M40wGkMvXTpCRORcHaRzU2TGiYtVjadmlnp+5nt2fmNQQEYuvk8MGzMksQZyR2P4By
	sraIUG9yr+Q88MhaEhS42s35uLnLj4FvGSNPovDs5UhhnF93ZQ3SeL8wx/RbzwoPfVZAUiU3hLi
	Ghc0NU7Es509ZVcZfQ/eXDc1lizLbMyLw5aszsKNLuSrV083DWsye93Z/Z6Vb7PRxgJS3C9jAGi
	1pVUqiM6WVyR4e/vPu+wGCS8g23ycrQEC6/BfTYwLeudYfd3Ji7JpoMcZsnL7a8oFsGYXTWdDNP
	pDyo8iWwPiQ3DU2imoOm232c5+n2O9baNhRrYmU1nO3GL5cIFVpdkf7eERyyi/HZirRUYWflvBB
	ceQJhxVENE7kHfTjfZbSh1w1NiyFI6K6iX5ywvaIShXeubjfZ6E7gYKL8or771jDDfEJEjJAjmN
	ApASaWlhP8j14m5BJX17MDPxxSfTuSjGX5D4/SwLk2m0nMzwfFmkJO
X-Received: by 2002:a05:6820:1c98:b0:716:d143:4692 with SMTP id 006d021491bc7-71ab50b23e5mr4407570eaf.33.1794733613075;
        Sun, 15 Nov 2026 01:06:53 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab4338765sm6198902eaf.14.2026.11.15.01.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:06:52 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 02:06:35 -0700
Subject: [PATCH v2 2/3] dmaengine: sun4i: retain cyclic descriptors until
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
Message-Id: <20261115-submit-sun4i-dma-callback-lifetime-v1-v2-2-fb7d258702f8@gmail.com>
References: <20261115-submit-sun4i-dma-callback-lifetime-v1-v2-0-fb7d258702f8@gmail.com>
In-Reply-To: <20261115-submit-sun4i-dma-callback-lifetime-v1-v2-0-fb7d258702f8@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
 Maxime Ripard <mripard@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

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

