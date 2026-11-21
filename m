Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795223471;
	b=v0bhht/ggpkoITqfcgq4lnPXVQScqzBZix2RWBK3gYWBbIf05+sD4xHfTiRGpwdIr+tY
	 e5a6oU+TxxWfUGZClR+56MnRhEsoDQ8Pf1GpmL2i88qirGOUSQNmCg2d8OPENQeJhUami
	 wMo0sdGlW0YA1y/MRMVSJbb0WFuR0+C8/ZgpSAmwftX4x0mUz9YXA4HbDLgcoZNgzu3RK
	 F10kv81doMaYB0O9IIfGkC+AHlFIsbNjGwiNoRMlIFTPTwjMYDqOwbEp4Ql2/P6KZbGAL
	 f0Gh4J01tFnt95QRsMpmnETHkb65v48r65/dTtosL8TaAWiIx6VZRDmPgvvVrBDjdxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223471;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ykELsWqv0rr01vGMcfJTxNz9WxlFG0XTipq7Ly2y7EA=;
	b=3d8rN2jfSNwUuAV5QH0ULwB6c0rulKDCWPonAWfgHdibDetU4j3CdYCnLkwT26a5axAC
	 ExoeOPAE+WHPwUUVDcHunB48ozX/GjzchnywwqFz23khfEihyLf59flDRugwY8aIfobmd
	 5OW+mt96N4d1Dpl0KGSlTXZvNEBXFm9cdRqCwNa1tQ5WQxaH6mA/+ftCqxHZS5Td19CnG
	 TRq+ZcGx5Ko1W2y3/zPv0yUO1xymg9HK4PCiX7Iz+CT/eoOfYAlqOtPUqn6XX9Pnrmsz6
	 XzjBjxJWsLUay1TyvnI2w/6KfjZDVqw2+XYfbZXsfKu3ZiCyK+yswLEboCHDUGfswHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vr1DAGPb;
	arc=none smtp.remote-ip=209.85.160.49
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB5A60A260A
	for <linux-sunxi@lists.linux.dev>; Sat, 21 Nov 2026 01:11:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CB5A60A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vr1DAGPb
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-4b5138f0991so1430360fac.1
        for <linux-sunxi@lists.linux.dev>; Fri, 20 Nov 2026 17:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223467; x=1795828267; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ykELsWqv0rr01vGMcfJTxNz9WxlFG0XTipq7Ly2y7EA=;
        b=Vr1DAGPbFZL7K0QQzoBgAT1kK1Pbr034Kmz49NCZTPKzwozHj3sJ2Qwg87z+Pf3Yz1
         fdq+yQN4JoON1leba2RJTcHoFEhBzIfiztyz+VyVU/SVbm87ayBv6S3BOXhn9V7se7WY
         06IkT+CcFujHekJqxpXUCFxdPodp1LlolVyuhd0PfQwLLIcmsEZh4AqTOSMbVARfBFEj
         2jqXR7QAapAHzyZ0lLFTkz3V6a5TKPgDEgcjuxhEi892oukj9tkfmh+/t0vdWbOdtUV3
         ZS9iG2ch45xlJKNRfYxjpQcsXiTcCMDaymjCYHeQu6ponwkxAhEKOfCCa1Lxy40+EIQ0
         3N7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223467; x=1795828267;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ykELsWqv0rr01vGMcfJTxNz9WxlFG0XTipq7Ly2y7EA=;
        b=VJk51e3ElBR0p/1fywhtR89S0OLGlEEAUi/NzMSuKRZ9A1IDBGBazUx+jQvxePqjny
         jSIcvAiuhFPSQmW8upnSXe+54EfhLwQWHEt+AS3HV0wGQNSJOKFID6cni+IQcPyfGe6g
         W8Jyg8RjGmB00eilP9oeZ1Ofr5OWnwTYUk9XNkYmfZPEKNxquBz/MIlvxdF9Pc/Amie8
         /dNrQUmKzdfluYb3uPBUM8U8mkJTd7GDTiVb+wmc9tWVGmqlA3QH0pTHu5ElZWyF/g8a
         1caZB2erATtPdRt6TWq5RDyB4hwEcZyVAotC/zFmjspLWoUDzmCqIDaqqJOLENlK6qzk
         6SGA==
X-Forwarded-Encrypted: i=1; AL+hErHD1rPHJMX5TiPmYUTAlHUIAF50zA54IlANFqYDIe7h1xnzDivJ0HK/1kjFALbVsi0GXF0Maw3P2lj/Lg==@lists.linux.dev
X-Gm-Message-State: APuU4Z9lRnpg2Z2PrxgETcyWDbB+mp80W0O4nzBRUbMuz0liYSfr9NXn
	pYZ1hhWpoWxxRtGMsun0nGbUe59DKLszWaX7stXZq4c5WIvHLXcVZoeM
X-Gm-Gg: AYBFou2Nw86VMNnDTukiwGtrXFyqOTCA/dF0RILnnmGL+9Pt+ft1iGIJNsXQXukQffz
	RUB4Bn7et4a2Sw0Dc/V712syjaRtgyAdPLxVDJfKBDItkaJQ0OPka9Jw+1WL3QP0iJz095Fm0eT
	amGqUoDDywSbHeFT51CrOCWGLybN1G9ZMZnGVPi3jRbClxnSSuj4mjPjE36D5Bl3kVcjtjOpbTX
	QJe7+RerlGgaqfvorqiPwYB21d3M72eUCsUUtocIex7J/0SEWS1FDiWuBK0FxxO2d4d4p6uWi59
	DytOORQG/xRIE99vfpyFVCsYqa1YUYwN3vErTT3J5VA4BromEoJ7+A0MPvmUyu+C4KGt58UndHc
	oI7mCckzXHAzqwf1dgRRYSNN8PQIMQ3G+iS9EEXk75/gQASloMsUBbMFiJE8NWVL11WUzhbWoeW
	NIHkDxfJHmh5oRl796dQ9GAF3L0bf8u4ZqYRr9kwBXWjsnD5qIckHVEM15yMokHR4RQRK2ZLV9o
	iS0DmAu4u6x/+nMWHdGrtf3z3vAneaJA8b747YSahGNH0ISVAWwr2ZHQSggTtQObS08tqAhVn5R
	OdsT9tc2z9Z1ok2v9Gzm0bL9oUNLrA042HiRUXJg90Y8oe60s+y28E/rVsuAQM8J+dWWMcp5Apu
	mW+aNwpQepkPW1WgzWbZUNMpymXRqcrZL7tvNNhTRnxOTwvjtnNXgfKwzoe1K87wyQUarLyEGp7
	MjAa/qoiVJAHlNyRMbjffDpj4eyppgXAjy4/1VTYlRm5u+piKhitbS
X-Received: by 2002:a05:6808:3a19:b0:4f1:a3ac:a637 with SMTP id 5614622812f47-57a0b6533e2mr3933225b6e.27.1795223467204;
        Fri, 20 Nov 2026 17:11:07 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:06 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:31 -0700
Subject: [PATCH v11 08/26] mtd: rawnand: sunxi: drain interrupts before
 reusing the completion
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
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-8-9721b1905ef4@gmail.com>
References: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
In-Reply-To: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.17-dev

Back-to-back NAND transfers can time out or appear to complete early if
the previous IRQ handler changes the interrupt mask or signals the
controller's completion after the next transfer starts.

On success, acknowledge the events and update the mask before calling
complete(). On timeout, masking the device alone is not enough: on
PREEMPT_RT the IRQ thread can be preempted after reading the old status
and mask, then resume after the next wait is armed. Initialize the
completion once at probe and use reinit_completion() for each wait.
On timeout, drain the handler with disable_irq() before clearing state.

Recheck status against the events still enabled after the handler has
drained. Command and DMA completion can arrive separately; the handler
has already acknowledged and masked any events it handled. An empty
remaining mask therefore means the transfer completed. Flush the mask
and acknowledgment before re-enabling the IRQ.

Normal NAND I/O waits in process context. The IRQ is not shared, and
the handler needs no lock held by the waiter. Only timeout cleanup
needs to drain the handler. Its latency is not bounded on PREEMPT_RT:
there is no priority inheritance if the IRQ thread is starved.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260909085434.C8F201F00A3A@smtp.kernel.org
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 38 +++++++++++++++++++++++++++++++-------
 1 file changed, 31 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index c5e429318de2..6d7384aac917 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -378,6 +378,7 @@ struct sunxi_nfc_caps {
  * @chips: a list containing all the NAND chips attached to this NAND
  *	   controller
  * @complete: a completion object used to wait for NAND controller events
+ * @irq: NAND controller interrupt
  * @dmac: the DMA channel attached to the NAND controller
  * @use_mdma: use an internal MBUS DMA backend
  * @mdma_desc: H6-style MBUS DMA descriptor
@@ -397,6 +398,7 @@ struct sunxi_nfc {
 	unsigned long clk_rate;
 	struct list_head chips;
 	struct completion complete;
+	int irq;
 	struct dma_chan *dmac;
 	bool use_mdma;
 	struct sunxi_nfc_mdma_desc *mdma_desc;
@@ -418,18 +420,20 @@ static irqreturn_t sunxi_nfc_interrupt(int irq, void *dev_id)
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
 
 static int sunxi_nfc_wait_events(struct sunxi_nfc *nfc, u32 events,
 				 bool use_polling, unsigned int timeout_ms)
 {
+	bool irq_disabled = false;
 	int ret;
 
 	if (events & ~NFC_INT_MASK)
@@ -439,16 +443,28 @@ static int sunxi_nfc_wait_events(struct sunxi_nfc *nfc, u32 events,
 		timeout_ms = NFC_DEFAULT_TIMEOUT_MS;
 
 	if (!use_polling) {
-		init_completion(&nfc->complete);
+		reinit_completion(&nfc->complete);
 
 		writel(events, nfc->regs + NFC_REG_INT);
 
 		ret = wait_for_completion_timeout(&nfc->complete,
 						msecs_to_jiffies(timeout_ms));
-		if (!ret)
-			ret = -ETIMEDOUT;
-		else
+		if (!ret) {
+			u32 pending, status;
+
+			/* Drain the handler before it can restore an old IRQ mask. */
+			disable_irq(nfc->irq);
+			irq_disabled = true;
+			/*
+			 * The handler removes acknowledged events from the mask.
+			 * An empty mask means all requested events were acknowledged.
+			 */
+			pending = readl(nfc->regs + NFC_REG_INT) & events;
+			status = readl(nfc->regs + NFC_REG_ST);
+			ret = (status & pending) == pending ? 0 : -ETIMEDOUT;
+		} else {
 			ret = 0;
+		}
 
 		writel(0, nfc->regs + NFC_REG_INT);
 	} else {
@@ -461,6 +477,12 @@ static int sunxi_nfc_wait_events(struct sunxi_nfc *nfc, u32 events,
 
 	writel(events & NFC_INT_MASK, nfc->regs + NFC_REG_ST);
 
+	if (irq_disabled) {
+		/* Flush the mask and acknowledgment before re-enabling the IRQ. */
+		readl(nfc->regs + NFC_REG_INT);
+		enable_irq(nfc->irq);
+	}
+
 	if (ret)
 		dev_err(nfc->dev, "wait interrupt timedout\n");
 
@@ -2559,6 +2581,7 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 	nfc->dev = dev;
 	nand_controller_init(&nfc->controller);
 	INIT_LIST_HEAD(&nfc->chips);
+	init_completion(&nfc->complete);
 
 	nfc->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &r);
 	if (IS_ERR(nfc->regs))
@@ -2567,6 +2590,7 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
+	nfc->irq = irq;
 
 	nfc->caps = of_device_get_match_data(dev);
 	if (!nfc->caps)

-- 
2.53.0

