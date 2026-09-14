Received: from mail-oo2-f39.google.com (mail-oo2-f39.google.com [74.125.231.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A04041167F
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Sep 2026 21:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789420201; cv=none; b=oPZpOycOIQMqw2e9ph2/XJsW0N2MbLgkCE3wJ7TcTiXLUoZfI+/IApZ/Vgve2xvLfu/OrdJG6Iucip5G3Y0xeNucHKSLOg/+77scvEaYeYp+a8wDiSDjLIklmj4On2CEpCjrVgQJoJHqPuM8nX5oJR5mZ674x3Owgt2O4yEmHvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789420201; c=relaxed/simple;
	bh=Lpu8BYiYZNteYXFlDSxlBr4C2CnU/Gx0SiTFgcn6nP0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aI80agxcCk6aVj+9BfyvgXPYahEmVSegH/YktD4P1GGu0kDRIJRiu5pD+GxXNzGqDO20MqqUM4AKlpLVMuvI2DO2z4YZY0YF7EtgZCG64PGbUsBw5hSziUFdDdGWSpmawbcMg4oglG7JiWCvWN3w/xC1GRkDoiPkRLtfPm7VzW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VtGDTa5J; arc=none smtp.client-ip=74.125.231.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VtGDTa5J"
Received: by mail-oo2-f39.google.com with SMTP id 006d021491bc7-6b4bff33ceaso1582199eaf.0
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Sep 2026 14:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789420196; x=1790024996; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EsI+dpw6vMR742jYDR1gddCVyVHs7LTF48bPd8UEx9g=;
        b=VtGDTa5J295aWfN1DnKXCxPfig+w9Fz5JsrSd+BwtkeL6WMLkzRJhQkyeCIwVY117/
         q89PgW8pwsk4K/9ldm8Q64eBB5tSaEauAGwkjVUZDzBw/7sz9PZzneJ6pXHtn7qgH0cW
         MThUFXjefE5CJZpfGNsQexMQk6Nn4Ci4a/+yvjUo+mwEkc2E0oHUc3U1/VlYZDLBhwmq
         7Z3YMBNbCS7Iy8eE7MPkWvV18sxweaIZJTONr/833HSJ82dmqx0pi1GtE4WCc6/ISnC6
         sbFPp5b5K7DLOuGiNt/G0NLhdkCkLLo1C58j4Hl6sN8ggAyegE/za1v05p/+iWE5sxJF
         rQVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789420196; x=1790024996;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EsI+dpw6vMR742jYDR1gddCVyVHs7LTF48bPd8UEx9g=;
        b=RFW60dPH2uTf/2qdMFeyPWg6AFuVg+BTb2oK77IkZuMZmM+ZfUcW93xdg4OHqNXgW4
         gXsiwZj2FeB+p6FRGR6QxGCxKIMGLnH/JmcNr7GupUnFdi+TW1d6eOIZqerFRpttGI9E
         YzCeoCW7AvL8iEDFHHjDxmBzm1jpG8bU6/ebTviOlAPPRrQJIL02Jk52fmFAydbPiLtF
         g7NFHIU24+jUZNPC3GdS8Ueb8R8aVdAnKfWmEc0o7xpm61bUZwqt9x3bVcgXC+SgHM/v
         UzsOK1KsKjCeXemHgbxZlDa3a08QaI7O93wYRBap8viKhj+LyWkwZYcgBPq92UO2XEIC
         Wvpg==
X-Forwarded-Encrypted: i=1; AKwUvBxpk+ej1Tv+THJK6sTKa5/wVo5RVB+gZCU0klx/JFGpqo2gVFibAXDxgYpsvxjLEGhJOywpJWePyS7a4Q==@lists.linux.dev
X-Gm-Message-State: AFuF++m4XBjPxF9FUQ2p3WUY9BXt57bPiDX4VHOMxPmqZd3dgDAPL8X/
	lhvRDv7+MbXwMC/rQVvde/jWIy3eQGhnoY5bdQF59OzLYzd5rMDu6eAc
X-Gm-Gg: AYBFou0u1uB0FRud1YQpBcQcMsEZBt0Um/nRlc66gQFW756cDuIKsmYAGsyZJxPmXag
	MzskXKtUxqkpFX2s3iwSUnrfzXL8nYwdRdeUsKaXtZuFomhobkTvrjvo3N3+Z7cNeIQJf2XEs96
	u4Iu70wfFAooP93yy/zDXlZL5ryLRO9mixNtn1k+ChV4OyZMdfuVEepGJMh5pd3wGIcjZMgT5wO
	W4i7FMX1ClrbWuD7l1N+tbGncfPDBBrDqJ2l01ejeGVRgLxLMtFd+sAR0KVfzI5Our7I1u7Zg/V
	Z1I3XDrwzGIsx3sAni6inRvfFMbG861BNCKhxpefQi5Jtbyuuut0Os/xQq1R1plb3Qb63gIUIf9
	DP7EYFpt1oB+PEDxQxxRnKJSKbU7eAq5jvIf/XgJnniWN86peKTFWInJD6iB5unO4MK7DR85jKS
	S7SSnVuVaZ9MGjJaojj4/9PcePXtLOVb0VKfMDwCFQkdX9Ig6xRGNu4NvrzkWzUqN8kKYf4GIaB
	7xCh183eHBrqzVCKoFAYqqgpB/gphGuLjeeSBTatLpvRHwymoS/2cdQKsTzJuGXa+tKWc6MdTpl
	YVHDcc4qg13FBF/FI1agp/cMITYcZ9YAl81Ax7mzeBI7TyApTCv7j8eofDy6u94i17K0feO5jJo
	sQFVy7KEYq38k7Ch4UxreOLSH3n4E
X-Received: by 2002:a05:6820:4d01:b0:6a1:4507:3544 with SMTP id 006d021491bc7-6c540d62bbfmr2624632eaf.28.1789420196428;
        Mon, 14 Sep 2026 14:09:56 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c45bfc3fe9sm4698544eaf.15.2026.09.14.14.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:09:55 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Sep 2026 15:09:47 -0600
Subject: [PATCH v6 01/18] mtd: rawnand: sunxi: drain interrupts before
 reusing the completion
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-1-2fb084fe0751@gmail.com>
References: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
In-Reply-To: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
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

