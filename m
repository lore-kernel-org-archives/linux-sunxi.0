Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795111392;
	b=rrnf8Ue8lSAOJk0YPOAjpo3yiQRSU67ExYIZMQHNjF7FX+xBUgrnxD6g4wyZZTQ3t/MA
	 sRz4z8wL00RPYSI4phRGmHAT45JelB9Rm3Bs7m95ZVFyZ7oI8h2fYCYPqDuiyyP/k67Mt
	 J2Q/Sfq6eqofk7FA51mZYhp4veigHKgN1FoIbFpbzNcXS4FT4la6KzF3HW5+BK01bW/14
	 naHNADdlZcFw6KBGWtkAdUDfJV/MhOrnPGRP9zowkWq3h/bKLKlA/QWbIY7WUn4YucBxS
	 q/gAnPW98gD9WnR9Wmz9KRqEEIpCxAAk/dzW5TdVmNQTMrsqOJckbfjRWcea2NF/Fkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111392;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=dfbuM0pmbxDgRGHnvK9GVp1KbnVrBOX0xw08dSvpRRw=;
	b=2+XqJQMYX7PSFVRKTRk9+jB2hm0cmF3Aa9qYXcv4QqQehrAmSO+7d6AOty0X1P5gVgWs
	 urBr9MOZBJikihx5RprTz0Ph18zH2pAjfOuTV7Ena3NsiL0OTQcZ09FWX+WIg6rUrb3DK
	 JqD7fInL7PeJ5L70V7yohO9wknAUjMg592iKQpYvYelO4FUmKUEfh3u4kFygPiAot4SnL
	 WQotHIBcNcNTh+Be6Z+XVjYxUduAyfYbLMlAEL70XnQ705nPl58Hcx6OBmYy7cyaT8ukd
	 VdHZwUArhs1YIiRS8otoz7oes6y90uXUpa/Sf8wfmad3jPq0wlGCkKdh5ZUOpLkqJZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M1jjQZA7;
	arc=none smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB69606A33C
	for <linux-sunxi@lists.linux.dev>; Thu, 19 Nov 2026 18:03:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCB69606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M1jjQZA7
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-716c0217635so1359504eaf.0
        for <linux-sunxi@lists.linux.dev>; Thu, 19 Nov 2026 10:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795111391; x=1795716191; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dfbuM0pmbxDgRGHnvK9GVp1KbnVrBOX0xw08dSvpRRw=;
        b=M1jjQZA786Mjs4vf1CPYlMmdt0oecB+eHUHN4UbvkWhRo6vqBTNIq82vaJz5XwFgGg
         p2IQye3L998S7DEVuD8/ifaziKHrn4mR+6/XU9HK8tEa6EDpBshsomZi/fCOtSFcBX79
         6Q67C34NwxgcAn0ece8pNSBZK4HIevERIKuhYdeUAxKpLoA94EpSZ4TNr5dymhCP1YD2
         LYTEqXMSHp95jD1kWuttcc5KDKQksifdDGcQEm12fV3gFxopPMX37Hpcia3AjnRlBO6Z
         sf+ghWCGeWGthknqpHrQkKvfWN4RUn3AtwIIQRsL9Y1Em1I5nk2e6hQEY3WCX4FjDoW9
         +xMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795111391; x=1795716191;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dfbuM0pmbxDgRGHnvK9GVp1KbnVrBOX0xw08dSvpRRw=;
        b=qEok0W2c5haheQHJm5lihDvFosxiElQrYSa8i7fMv9oJdOQ16LktHteEOPMorN7dZj
         vrj9P4jCZDj9/dJcyXV0UZ3/U4DNEoqDoiNadQiBdMFyDePe/eOrlzHC79wzE2VwVxJj
         GDlkbHN3CYfrM4MUxg+q0QoT6yMm035ZID+HxyFnsV3LVB2JXzxxgI4WeE245LjAeV6K
         10JtJQ4E+bTwPUO9Hf3sSXYGt+bmplPlY4J+/4IV4Ded11ui7ZXNcXRidmJ/QTLMoQFg
         lBXdiDR6SGdFXqfi+V06I2q22cjllWAZ1bPy0sVlWNkazmkF7ai/KtFVHnqg8IsUumpD
         /iUg==
X-Forwarded-Encrypted: i=1; AL+hErEDF73veNaWF5FliTuRiJWup8yXHT9zM/IhQTwJPHDZwxoXIjaicyJrHTkixGXxOipPIaq24nJxlPPgIA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+DNVgwa58txagb/F7hIyhT1jkRO5lz5GDeSAqrqIPQo1ZQTMm6
	0vV2/nxzx344zIadV/HFocSCt51yLQRX54p97fniOQGM7Lu8+HG32Igh475VyuJe
X-Gm-Gg: AYBFou23wW6UmWyvAESlQe3rTq70a2EmDMXVNaGDqmxFgR3VKFLsWoE7YSiLn2ayh14
	0cNs/ewakW5tINFC3SxvlGpcCt/nj8EMV+uFxQjVlrphrVfQCPjgFQBpKzjhYwHEi1MDUcz0S5l
	bRdP5nIYv8lM0i11mc6fwhMOvvWMrYm7Jvg9g+zdF4+NW5fKhNHhGyZtC2cFAlqWXaY6h2PYyFK
	I7qKnapinpE+JJmZIwVsdapzd9A7jFJwXuP5A8XJLcRb+9NiyM+Wzh7Qy9CBwuH2li+iK9HamJw
	Sf9aMhMyZWRW7IdADxHVCO1rOfQ7dmoTGRtzQ6Oi3lYqIj5Cv/tM8zLwvu/i6fvs1lWGYjjKYKK
	lIyl7xRMptnOCljC7wMKo/Vhqd0lzGBr9ey2pvrfHspdIXXccHXOwemVYI3qSsLv/3vGonzdOn9
	uaH+Lf1L23wEFpwk/TwDSzqhQg/y5Vk8cjztLWAm5fy6wTE4pJUemoOgmsbFwqY0vNkyXsuaBBd
	rKYFTzp5HL/lUVwo6jQTPsGEj0JxK/QYG5xi5ahhawb/y1cmp3gaHoqAhUyLMbofAw19wPd6gZa
	hJmgME8l1betlDQAq7hd1bdWeFRc7y9J/tnR8HU2GUUgzMl8YORL/mIcl+1GNUBx9BZqeklvLCI
	Nye8LcgFxn9L1SnBdR/wwm3C4EM2J6ObjuvFvdd+gIaXyJN8fd93fMLzemMl1V7lR7VBcqV5dCe
	US31HCIYh+Am6tmUCVfxAKrGMFGUNkJiHzvtG1XfeCxEG1Qq+VAABuyw==
X-Received: by 2002:a05:6820:248a:b0:71a:f035:823e with SMTP id 006d021491bc7-71b3945d5demr218426eaf.7.1795111390594;
        Thu, 19 Nov 2026 10:03:10 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b3806ef20sm448478eaf.7.2026.11.19.10.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:03:09 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 11:02:23 -0700
Subject: [PATCH v3 3/3] dmaengine: sun4i: retire interrupt state before
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
Message-Id: <20261119-submit-sun4i-dma-callback-lifetime-v1-v3-3-3935aef58db9@gmail.com>
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

