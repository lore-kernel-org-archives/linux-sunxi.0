Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A1333064D
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Sep 2026 03:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789354902; cv=none; b=piA6ECjRcdwuxcihvF+sRSOGxoWxq1HdM85vPnxUFLWxl6Hd3CvSgK/gebBTUFtkRmXwTEV5PHxfXea0uQd0s10+Zy1r+6Y1swtp7s3gsDDtKaNmDJIwzjSLGxCP8Beaz8iuAxMgNKEYQKq/UkbPw2A1KsXEC+3wwweP8CDqwHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789354902; c=relaxed/simple;
	bh=Lpu8BYiYZNteYXFlDSxlBr4C2CnU/Gx0SiTFgcn6nP0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TeO6nJpikK9ThOcGxIeTWLmkEmfTm7552Wy4J/P3gIkLPEOfJPCjYNwEZy4J+j85Pw4BTshhu1/eNgT/SOwxqelBZBhsnrBRwcAFMmeXvnwM/SrcthjThJw0hr4ZOtzjg5YkLBZeJ/RJjpCuNBEK/OKIF8THjvIRkW8etPflqLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bIhA+XoX; arc=none smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bIhA+XoX"
Received: by mail-oo2-f42.google.com with SMTP id 46e09a7af769-804e42309a5so401704a34.2
        for <linux-sunxi@lists.linux.dev>; Sun, 13 Sep 2026 20:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789354898; x=1789959698; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EsI+dpw6vMR742jYDR1gddCVyVHs7LTF48bPd8UEx9g=;
        b=bIhA+XoXMa6uhScm3zhnY14sZm1Gwa4r9eKQH9/oz6BWeA02PTPsSbL/lh9YTuOGT5
         E6ovSfJ1Kd4Hnko/8YxZBzqym72zd030BmaRgAWhg7JEltZrIRf3iUFEtgzMZsGi6R/K
         pzrlZWUpEETm1Y0V/MK+WTzzbzBl/sxPxnGDRJkD+6i5SJ87kgk98POguiDZ19YiOE8w
         vO/AEQuQAgtKMFrM+X9N41fI2cBwjucgYhuky9HAI+6Jo1eFmmZfLDpgfWG02WGvlbbn
         YZ0xphmQhbaI05ikFZE0G8k6+kj50oVlpnQt67GAw/UT7auEizlGl8UleBWY+8H5hAk5
         zGOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354898; x=1789959698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EsI+dpw6vMR742jYDR1gddCVyVHs7LTF48bPd8UEx9g=;
        b=mBI+MHCWmE7FQ/GL9NKxuQWvIDKqBrIB2+lXJ8y9ICRwgqvMzM3NwoybuYVwnZZrj/
         lTW1JwIs8g7MvLqTq/JcClv+uNd7IHbsrqGvliFVfc92zxc0vyol9HeZsMbDWmqlWleW
         UY1q3iQm2kI2Bpe4IX+TDOOz9UBzD0+YFKgkVlucPE2RsdvjlWV/lLKaxszEXXvHZNKI
         7Q6OH9wVOCVZykkh0K7fMWwuzG3cwvsX1GgoxUqJfi1CUTuHm9aeGrMwCN3T+sFyJ4v3
         skPl2o7ArE4wkzUzhFty6mQKpXyhjUFFqVIv21QWu9FhjG36qM6Sgv44ouVUKpZ6iI/M
         Me6A==
X-Forwarded-Encrypted: i=1; AKwUvBxbBwwvNcmnnqcBW66yno9zRzVHzlY53yzRuDadcq+5gScQHyTalhHML13dQyQWkklXpByUsgYdi/fmtQ==@lists.linux.dev
X-Gm-Message-State: AFuF++n9QQ1aSbge4V05pkzWRG5pbe9REdkBGx+5+cABco1rSFjwJbrs
	SZgEqxHlJkyKlThzoNJOuotjmz7LrdZgOjyaawClLtXw2m4ary4Nnru7
X-Gm-Gg: AYBFou24CFVUhLf8Ndhq3tY1X0zUyy5Kfbf6a0t41Xp3bRNDBhHOKtNSSxKuuZ4I+M+
	0dtxwKKwKoDNRgnT45XSPiha3bSLligzNPEXemPmR+dfj4CbUndOKeg90EnSYKwh2rIoVMfiZEd
	aCSo9ZyPGeIygigeXr3chq1R8X0VyWQ+0sO45lvSMQ2AmGjq7HqGDfvXr65MBEsVmcpqGSi/wR5
	kqS3u1abFEhf9kybson2D2nMa66yIkR0IsuttLcofz/N8U6Jjobx/uRabMFMTWMu4/R+cRpf1MI
	1lPMRiB8bYyxRItuSKSlDsyvC2UAX1V+nRdV7LD66GlXeuHNEINe6Ne2nI+neDwzTNQ4Rp7fhye
	GGi8s8B+HnYRh14BWMLRAi2PeORwpd0np09t90YynomNgv7jFuh+UiZ6i/rHYHUJ5ja3Knwa+vD
	xCLTt1UEtVGVfHmAEZRdD2RgRalzihXYdAT1+yvxVFG23Wg4443cz9LRN7nfNNeqTDcy+6xI48A
	7VG3lzSJOhINZB+4zHpDlI0MvV3XnDuziticYSSNBTh2v47deiyFvQOeUWMJGs5w3DhHsZGlAh5
	QPcqKcH+16JbvuUbG+AyMXXgtAmF+xrY++Jjwq8rZB5138JEHfrXQCopWtm7qpj7ukKw9eQ2+Qy
	MWWrDsb3CA9CUP29z0g7Rmg5K3T/3iwSitE92f9+u
X-Received: by 2002:a05:6830:81fb:b0:7fb:547f:98bc with SMTP id 46e09a7af769-80897394cd9mr261168a34.5.1789354898430;
        Sun, 13 Sep 2026 20:01:38 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60feba1sm10619014a34.13.2026.09.13.20.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:01:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Sep 2026 21:01:07 -0600
Subject: [PATCH v5 01/18] mtd: rawnand: sunxi: drain interrupts before
 reusing the completion
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-1-7d711076a6f7@gmail.com>
References: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
In-Reply-To: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
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

