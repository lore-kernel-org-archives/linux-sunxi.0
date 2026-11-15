Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733615;
	b=uGpPIN8KI7KoLNBXRsM+uYq7qR6S3Ehls7iQR3zJAQFZ++2m7MJWxwqK+qio1xWGXQeC
	 gahMv9FFLiGXiKIfLSvKLFlG7jlVYaXE2rkplxmjnGPv0Och53xmRyWKzFg2QJUd3OI6k
	 LOiCDyuYoOUp9hopE4QwTBFhOmpIGIImqoV8Rbo17SLlCoOc4oqB3Gs2cCdIAOhEeZ3UQ
	 /epTltRsi/EBiJBb3UE0lqbLXw0XTa4bfoVcbYX4RfpOjaHxr2v/8Uz+36XaljWai2IRg
	 YUPgHAfhINYtBrLZ8kQqngQVBc2GT8tgU32ALdwIRkLpE+wTA8u/J7hnS36rZygx0pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733615;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=dfbuM0pmbxDgRGHnvK9GVp1KbnVrBOX0xw08dSvpRRw=;
	b=sJ9c2oYiCHlE1sOxWaQzQYmTZW1K4aZMATzEovS9Na3lits0SDOhy5cPYL7X9NhmO+HX
	 77Q2yhTlH6jDibGmzrJmrxxz/ZRnIw8Ot8hz4cKut+jQzW1DuMDFPyNFyB1MXDBIrVr8k
	 4re8DJlQxvmurmFJqDPbBev3/FJrZrJk7h1s9ulgJlVf/nbdQ1bxi/jfP39WGZfrVKkS3
	 fFLxwf2jH1CrK+Dfp8UU/5YuQGTVOcHdfttpS0AHqFzY5mUTmuHAGFJx4dLL4MSvGY9tR
	 tEPh4A3Cbb4adTOHhRfYsn7PTurQuJtZyysQ7s2zbadQX6kl3QyuoB/OQTHlmCWdM3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZfJRIxCJ;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EFC606A89A
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 09:06:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77EFC606A89A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZfJRIxCJ
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-71acdd32a53so425530eaf.3
        for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 01:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733614; x=1795338414; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dfbuM0pmbxDgRGHnvK9GVp1KbnVrBOX0xw08dSvpRRw=;
        b=ZfJRIxCJYH1a3DmTrGUDEaBHSRapN8gXKfZcRCft24g07OxNdcxnNF6YJFVcdc8ZAf
         p3fmKZ/b2kppytWD458Km/777WTFP4ANkUEDvCtmBbtulvAbGqXyPPiJkF0f38sOzi3Q
         JFu+5tLHRl8lRN97sf3EuTJIm33r/jgy8DDVXijYsjPaGkmz07uwlwldFyGm/ZvqXqeV
         TCuOZ9dfO8y5m1ctSBT6WFa6UJDe/FeeedAZs0XcgQX06Dm5m0Z5jKw11BP4bxknF2oj
         kW7kR1exsXMj4zEdl+m8KSxyIIe8DEgXxb6p3US0gwFRVgYnKktQ/xe3YjT5FL/NwmzE
         noJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733614; x=1795338414;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dfbuM0pmbxDgRGHnvK9GVp1KbnVrBOX0xw08dSvpRRw=;
        b=ayRN0BRDPHpHnXHkdw6rBaOahuTOBHB5L2uwCc5JXjWzbOvsyQvu+lxKRLn/Q+m0v4
         1/OQlX2gBJp32xqDe6D9+gXr1HwPQXOHR1MrzQ+EPqGnFHG5ISGEzAwgaD1Vm8LZoTH6
         mJxWyBm844RFfT5QPpcZO0wS3akNJYf1xYuwn8tz/zVZas49NicOWgj1DrQaMi9Bp5xf
         g0Wi1ZaxFsGLWP8FaJ8rDHBD//42A2bnWtmZ94gjMRVHWL0UY/TUBA/saQFro4fGBEEf
         B154wlzwyRCr4s41Ar1j4ag6fE2ZNbj+ZJoa/tIkvCqyNuNBwAnqueOQrsuhsINGBvf2
         4dxg==
X-Forwarded-Encrypted: i=1; AL+hErGXcdJTKavjqC9VRAq6OzYvS9ROdLaOrcmR1KeGLgEyChbB+6jh+ulF2b6p2zHloBRmt61Lma4n6O+63w==@lists.linux.dev
X-Gm-Message-State: APuU4Z/OLy6YGp10A4uuaB2IU9sSOTNDbzS0Brk3LRoJTuKu07Tr4Mzk
	QBOU9aG+ucvwJN4tc1+zTFHwLQ4PV7SC9o90mGjZArvdbxRSupowQzbi
X-Gm-Gg: AYBFou092Og1bsZhlOeY/qfW2dixwanMRIZCgGlWmiiXflRFRzCbe4KZSlLDWy314Xj
	wTGccDMfTsYsZmaPXwlopi1XninX+xGNCId/WURR5z6ACnPuCiE6PWhiX5h46D3MBKXa/HPwUcN
	XTkQSikA3nNbxrLVR4TRS461U5ihkSEjNLb/oukiaFnJw/sLL/zn0J3mO2TKNpbwxdiZXEjThN+
	ikp85W1YDDo/keXMqKwbVh2G/Lz8c/3NbZCkt3f/Q50JGOGBBnEezj3HCEmw3URDbpQh0+uooUs
	3BKGyN1Vbiw/6NpSZQWgM/DGoiaWQuzQu/JtFZhelpKIbtesa8kbuchLc7hoetaf5iqIvzI54KU
	LUhZKaDjBSffuzQVlI1xT8jN/boguVxdx0Htl1Pl5jCloK04pNNlAFe5xnElQ9ZJeeZBtTRvt8i
	F5rQhI0KBz47hM3wtrJ0cLjaNTysA0bMwM9vyCtszAYor50AQmkhIGiPNJTjcI+AVd+/xDfvPcQ
	WCoBrDw1FScdZb02iLFXnUMf0s2nEgch4GssL+lWmAD8paWNPjm2+ELowgu6QlQbXUP29Oa5n3F
	xmEL+Cf9mEEMThP7HRiI5tWoTOG0JsVxnyGJLv/hFfaleY6v7SJXnMVdbb+M8YnDpQKKaIxVRTH
	ESSxwFDQc3T2+FcjwZESH166ycPqyC+yTrZ7QaWcFiPpy3wwoxHmmNVbkyOQZEAEX5XZ4urO7de
	WKxL6xVOLpxcyvZNoFO6fyDikacGAuO7IPyuzUhvwqU4Cjuf3RfX7v
X-Received: by 2002:a05:6820:1caa:b0:71a:e9eb:6b9b with SMTP id 006d021491bc7-71ae9eb6f5amr480181eaf.21.1794733614395;
        Sun, 15 Nov 2026 01:06:54 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab4338765sm6198902eaf.14.2026.11.15.01.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:06:53 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 02:06:36 -0700
Subject: [PATCH v2 3/3] dmaengine: sun4i: retire interrupt state before
 channel reuse
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
Message-Id: <20261115-submit-sun4i-dma-callback-lifetime-v1-v2-3-fb7d258702f8@gmail.com>
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

The IRQ handler samples pending status before looking up the physical
channel's virtual owner. Another CPU can terminate that owner and start
a transfer on a different virtual channel using the same physical channel.
The old pending bit then passes the new owner's association check and can
complete its transfer before the DMA has finished.

The handler also releases a completed transfer's physical channel before
masking and acknowledging its interrupts. A replacement transfer can start
in between, only to have its interrupts disabled or cleared by the old
handler's deferred cleanup.

Clear both pending interrupt sources when disabling a physical channel,
and read the status back before allowing the channel to be reused. Disable
the sources before releasing a completed transfer's channel. Re-read and
acknowledge each pending event under the owning virtual channel's lock,
before completing or rearming the transfer. This rejects stale status and
keeps the old handler from clearing a replacement transfer's events.

Fixes: b096c1377d1e ("dmaengine: sun4i: Add support for the DMA engine on sun[457]i SoCs")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun4i-dma.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/dma/sun4i-dma.c b/drivers/dma/sun4i-dma.c
index b0c91dab62f0..6ecc45cadd91 100644
--- a/drivers/dma/sun4i-dma.c
+++ b/drivers/dma/sun4i-dma.c
@@ -400,6 +400,13 @@ static void set_pchan_interrupt(struct sun4i_dma_dev *priv,
 
 	writel_relaxed(reg, priv->base + SUN4I_DMA_IRQ_ENABLE_REG);
 
+	/* Do not leave pending events for the channel's next owner. */
+	if (!half && !end) {
+		writel_relaxed(BIT(pchan_number * 2) | BIT(pchan_number * 2 + 1),
+			       priv->base + SUN4I_DMA_IRQ_PENDING_STATUS_REG);
+		readl(priv->base + SUN4I_DMA_IRQ_PENDING_STATUS_REG);
+	}
+
 	spin_unlock_irqrestore(&priv->lock, flags);
 }
 
@@ -1125,14 +1132,13 @@ static irqreturn_t sun4i_dma_interrupt(int irq, void *dev_id)
 	struct sun4i_dma_vchan *vchan;
 	struct sun4i_dma_contract *contract;
 	struct sun4i_dma_promise *promise;
-	unsigned long pendirq, irqs, disableirqs;
+	unsigned long pendirq, irqs;
 	int bit, i, free_room, allow_mitigation = 1;
 
 	pendirq = readl_relaxed(priv->base + SUN4I_DMA_IRQ_PENDING_STATUS_REG);
 
 handle_pending:
 
-	disableirqs = 0;
 	free_room = 0;
 
 	for_each_set_bit(bit, &pendirq, 32) {
@@ -1142,10 +1148,13 @@ static irqreturn_t sun4i_dma_interrupt(int irq, void *dev_id)
 			continue;
 
 		spin_lock(&vchan->vc.lock);
-		if (vchan->pchan != pchan || !vchan->processing) {
+		/* The channel may have been reused since pendirq was sampled. */
+		irqs = readl_relaxed(priv->base + SUN4I_DMA_IRQ_PENDING_STATUS_REG);
+		if (vchan->pchan != pchan || !vchan->processing || !(irqs & BIT(bit))) {
 			spin_unlock(&vchan->vc.lock);
 			continue;
 		}
+		writel_relaxed(BIT(bit), priv->base + SUN4I_DMA_IRQ_PENDING_STATUS_REG);
 		contract = vchan->contract;
 
 		/*
@@ -1183,7 +1192,7 @@ static irqreturn_t sun4i_dma_interrupt(int irq, void *dev_id)
 				vchan->pchan = NULL;
 
 				free_room = 1;
-				disableirqs |= BIT(bit);
+				set_pchan_interrupt(priv, pchan, 0, 0);
 				release_pchan(priv, pchan);
 			}
 		} else {
@@ -1191,21 +1200,11 @@ static irqreturn_t sun4i_dma_interrupt(int irq, void *dev_id)
 			if (contract->is_cyclic)
 				vchan_cyclic_callback(&contract->vd);
 			else
-				disableirqs |= BIT(bit);
+				set_pchan_interrupt(priv, pchan, 0, 1);
 		}
 		spin_unlock(&vchan->vc.lock);
 	}
 
-	/* Disable the IRQs for events we handled */
-	spin_lock(&priv->lock);
-	irqs = readl_relaxed(priv->base + SUN4I_DMA_IRQ_ENABLE_REG);
-	writel_relaxed(irqs & ~disableirqs,
-		       priv->base + SUN4I_DMA_IRQ_ENABLE_REG);
-	spin_unlock(&priv->lock);
-
-	/* Writing 1 to the pending field will clear the pending interrupt */
-	writel_relaxed(pendirq, priv->base + SUN4I_DMA_IRQ_PENDING_STATUS_REG);
-
 	/*
 	 * If a pchan was freed, we may be able to schedule something else,
 	 * so have a look around

-- 
2.53.0

