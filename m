Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBB038332F
	for <linux-sunxi@lists.linux.dev>; Sun, 13 Sep 2026 04:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789272314; cv=none; b=TnI8b1MPFh7ZGeuq2Szpj16BsQby5uzG6FxxCrCrGhwNKkiKJIgmSN2taUBK0k8bAkYPPzbO89gulQUWml0rvovkNyl9Fq4acokAxdwkZp3LyV1uxpy83J8o6rUlBz9rV0UpxEeCx9oUy3cfdDtPH2JS2CLWu+BeXqCuU4jOurs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789272314; c=relaxed/simple;
	bh=Lpu8BYiYZNteYXFlDSxlBr4C2CnU/Gx0SiTFgcn6nP0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sfdBZb6xpdELgP30Aib4P36qPofrzGKhiXInyF0S4vhT4hNEiG6rn8T4bT1j6L5nbrcoYI2Jqo5OIqHc4QKuRMezxb60FBjxIfDoL/ZcYRE7N2L8ADCC+DOPRopwTJsSsQIQmCBRtbCuAQy4qPzr5o1J7zWWmf85NCSApDu7h0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ijUK/Amj; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ijUK/Amj"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-469fdb78b1cso627073fac.0
        for <linux-sunxi@lists.linux.dev>; Sat, 12 Sep 2026 21:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272309; x=1789877109; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EsI+dpw6vMR742jYDR1gddCVyVHs7LTF48bPd8UEx9g=;
        b=ijUK/AmjH0hdfiz5d0adzvuKGsYTwoaruZD3Tt10ozsUqtKngf1pi5l8Hfa9a3XN5s
         kxX0V5C88K7YKFEmcj7Mn+Zz6+R9+eEPVi4DQvapoHPsmaK0+4/76Z63jLUjnnwRbCXU
         U41z9aOEMdxFh+UOtNuuDefVQBg6jN8v8EJOqUAw0GkBKaf84Bz4I+fKOpX1W6fw/8L+
         Lyjaal7QyM9vUd2XL0Kr57bBG6G42ALd0u15ogohgraWv+LriT9tIYL+GNMzG6ZzRvID
         DgbDwaI1miMY5LOsVr+Xus0b+H2wdkrg8LEZHSDQcbmMI58Hb8orND4JvS+YNVvUP8XR
         f17A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272309; x=1789877109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EsI+dpw6vMR742jYDR1gddCVyVHs7LTF48bPd8UEx9g=;
        b=JyL7FXFfqNb+Eozl6STur0869tJxoHDzvNnBFLM01objrKJrPJoAP5ckyqxP/JgS4h
         47tFj/1msKSdlQmNU7hc4N6CxQzfBgt4yHw769dP6KEOJBzoEGn2O8KSauhU1GB7tci5
         +/NK8TM+XSTcZAaVJp4lHZJCJBXzwulb349IC5pitgewdcmxhzV2lZ8eOuzssdHHGSES
         e6plRxmSCgXhYM0XWngPHkO5RjdFNMLRnKT1XCE0uaEpFYWBBBKDYW6WA4qfzlkEhemY
         uBcrJHuYF8eGHk0JGlc/F6mg7chOi25V0/azdBvnqfPNjWPQm9xKkOtLePzr+hpZedx3
         zQww==
X-Forwarded-Encrypted: i=1; AKwUvBwRv+70bNsX671vZAtjv4DFiqMexfZDgYNYKVAcNBBvqyA5e/UiisDHiucKzL7inE0lT87kVLv/4XH3YQ==@lists.linux.dev
X-Gm-Message-State: AFuF++n5iwhAiHjDFEGlj/R3Pkd6piWi3Q5PIxzCbRaeH7PJ/15TxW4U
	3hfA+IWqTUszdeZZOE61IB0gbkU23MI6FAGmDWlylXvTK8ic8FHJd11p
X-Gm-Gg: AYBFou2sc3AUmFkqzQZta9eqYBosfbzd0nRWfS6t7bbwAKHCMUKHBV7Nh/P3b4CWcYH
	Yzlfnr1QPKaQmC124Yx/mvmaN3m5/q+u5CyV1ZW+dXXTqNUlR3AkuLHMD8+wRfncSM8ePNLN0pJ
	Q/mKcZH6w1siEcs+09udJgsCbqST9n+GAicxynjm0PPymw8aRGbSXo/ObwaIdAZoP9AN6fOl7i8
	zMJ4dKpZ9okT3Y9f8FhLFKjxF4zUC7WEKYR8egWtn3YsjOZSZQ8xmgipjT4fR4QCfOll5XVIQow
	3wF+8bAwnV9OI475Px/mf2tj/6/zoxymCXtYj9n4aTpiUOFnVRQ6lldnelo4YwYbTEkCFmcmYcU
	g866Sudo2T8vE/VHCL0UNzrr4Kp+3/GuHTRJEtN1agSlmNgN6yB7q4BBlatKiPfQEBRvkLmSwR6
	gDeDVcy55o72a7aDqKWRQsNd1td0iJvqkgmfcqMCkk92VjJNgAazLo9Zsd7T0uXAtjidpFOz8bY
	cD4PQLKtbNXjvmRWIoEbCaWCE4V+fbtzCoY6XHLvcwTjZYbYGY2yhLFpG7UeGSIgdk7ZOSJiWAd
	a25ungYm58t76Fz2B7y+xBtqf0RPCZqcBmEilHivixzb5gf0+C7qpIYAibm666BPHPNkZt4v4kt
	sagJsewV7Fr3PLHMihr37D4lt9RQuTg==
X-Received: by 2002:a4a:e90a:0:b0:6be:8d11:a077 with SMTP id 006d021491bc7-6c24f2660eemr2474010eaf.67.1789272308682;
        Sat, 12 Sep 2026 21:05:08 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699647sm6011535fac.5.2026.09.12.21.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 21:05:08 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 12 Sep 2026 22:04:52 -0600
Subject: [PATCH v4 01/17] mtd: rawnand: sunxi: drain interrupts before
 reusing the completion
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-1-4a64bed94229@gmail.com>
References: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-0-4a64bed94229@gmail.com>
In-Reply-To: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-0-4a64bed94229@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2

A timed-out wait can return while the interrupt handler is still using
the previous operation's interrupt status and enable mask. Starting the
next wait calls init_completion() on the same object, which can reset its
waitqueue lock while the old handler calls complete(). The old handler
can also complete the new wait or restore an obsolete interrupt mask.

Initialize the completion once in probe and use reinit_completion() for
each interrupt-driven wait. On timeout, disable and synchronize the IRQ
before masking controller interrupts and acknowledging the waited-for
events. Draining the handler first also prevents a partial-event handler
from rewriting the enable mask after it has been cleared. Flush these
register writes before re-enabling the IRQ line, leaving the controller's
interrupt sources masked.

For successful waits, move complete() after the handler's register updates
so that the next operation cannot race with those updates. Keep polling
unchanged and leave controller and DMA abort handling to the existing
callers.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index f41feebe4257..e50cf5b6a730 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -374,6 +374,7 @@ struct sunxi_nfc_caps {
  * @chips: a list containing all the NAND chips attached to this NAND
  *	   controller
  * @complete: a completion object used to wait for NAND controller events
+ * @irq: NAND controller interrupt
  * @dmac: the DMA channel attached to the NAND controller
  * @use_mdma: use an internal MBUS DMA backend
  * @mdma_desc: H6-style MBUS DMA descriptor
@@ -393,6 +394,7 @@ struct sunxi_nfc {
 	unsigned long clk_rate;
 	struct list_head chips;
 	struct completion complete;
+	int irq;
 	struct dma_chan *dmac;
 	bool use_mdma;
 	struct sunxi_nfc_mdma_desc *mdma_desc;
@@ -414,12 +416,13 @@ static irqreturn_t sunxi_nfc_interrupt(int irq, void *dev_id)
 	if (!(ien & st))
 		return IRQ_NONE;
 
-	if ((ien & st) == ien)
-		complete(&nfc->complete);
-
+	/* Finish updating the interrupt state before waking the next operation. */
 	writel(st & NFC_INT_MASK, nfc->regs + NFC_REG_ST);
 	writel(~st & ien & NFC_INT_MASK, nfc->regs + NFC_REG_INT);
 
+	if ((ien & st) == ien)
+		complete(&nfc->complete);
+
 	return IRQ_HANDLED;
 }
 
@@ -435,16 +438,19 @@ static int sunxi_nfc_wait_events(struct sunxi_nfc *nfc, u32 events,
 		timeout_ms = NFC_DEFAULT_TIMEOUT_MS;
 
 	if (!use_polling) {
-		init_completion(&nfc->complete);
+		reinit_completion(&nfc->complete);
 
 		writel(events, nfc->regs + NFC_REG_INT);
 
 		ret = wait_for_completion_timeout(&nfc->complete,
 						msecs_to_jiffies(timeout_ms));
-		if (!ret)
+		if (!ret) {
+			/* Drain the handler before it can restore an old IRQ mask. */
+			disable_irq(nfc->irq);
 			ret = -ETIMEDOUT;
-		else
+		} else {
 			ret = 0;
+		}
 
 		writel(0, nfc->regs + NFC_REG_INT);
 	} else {
@@ -457,6 +463,12 @@ static int sunxi_nfc_wait_events(struct sunxi_nfc *nfc, u32 events,
 
 	writel(events & NFC_INT_MASK, nfc->regs + NFC_REG_ST);
 
+	if (!use_polling && ret) {
+		/* Flush the mask and acknowledgment before re-enabling the IRQ. */
+		readl(nfc->regs + NFC_REG_INT);
+		enable_irq(nfc->irq);
+	}
+
 	if (ret)
 		dev_err(nfc->dev, "wait interrupt timedout\n");
 
@@ -2617,6 +2629,7 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 	nfc->dev = dev;
 	nand_controller_init(&nfc->controller);
 	INIT_LIST_HEAD(&nfc->chips);
+	init_completion(&nfc->complete);
 
 	nfc->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &r);
 	if (IS_ERR(nfc->regs))
@@ -2625,6 +2638,7 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
+	nfc->irq = irq;
 
 	nfc->caps = of_device_get_match_data(dev);
 	if (!nfc->caps)

-- 
2.53.0

