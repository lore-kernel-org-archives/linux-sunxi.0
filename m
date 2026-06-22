Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29C225A321
	for <linux-sunxi@lists.linux.dev>; Mon, 22 Jun 2026 01:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782092323; cv=none; b=peeJ6tNyDw4yMYf/IG3vGjdccZDSLDCKGqrGy8qmbq0lIhqKj/xN/YivtlUqdHT30X13iIYAL+n5n8KRZRZtR7HiCbUNa/1ouPJZkWd+xCVoR3SIkqYwl6Hkk3hTAKwAAUhq/vEMBDRZXUvI3zsogB/BzqB+lrKFDo8Xw8xk3y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782092323; c=relaxed/simple;
	bh=AUqQtUzkNoSkYSGTZ+DxhkWOf9HoxaXr4yKXv+TNYDU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jNK5HGWZfV848xotWLLlGHrdQhyvndG8o3m+X0FpgSQgTWLte4iBuWuYMn/5WLXkbfAIlqWJDEfrM8/JYmdTqGbVNxx/QqLPgliyc4ZDYTPyALIr1SeFYG2gm2YGIMpwmrH46lP6l54gVTqLleto5T80yStqSxC6+HjDx8JrU2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nhpB8ZbY; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nhpB8ZbY"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-517654b8e28so33158801cf.3
        for <linux-sunxi@lists.linux.dev>; Sun, 21 Jun 2026 18:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782092321; x=1782697121; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v94lnRVnvoTJ1Pc8aoKqSqEARqq8CGmwJLQaxJ+xYl4=;
        b=nhpB8ZbY7kR00fDmm9F8AWfUVY0+V81Mvin6db5kjCED6ObcY5sdLd2HutWDXV0yzU
         ZZUUM9jFzvWAV0iJC6wh/Oi9XyMr0ohcSrH9p1ZvmIUI6Y5H9tO5ZWm9b81vYGlG0nQw
         1/blx4yECvhWDW+rC1qfRaHS9zP6oq1+IbCQPetSRLlugMifETZCDjnn9ApkppS2tJOk
         1RADRSLHVGtZLRCK/CngQDCojdQzC2d9uO8xyTN5mkV5ZVhZvUYB30VBKzmUWfh88fTD
         quLUrYlEsW64YN8EM0VPSoFCZwuuJueLg82RgsePDYgJbbXVQQaoxGK2+uf73pwaW9rE
         zd/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782092321; x=1782697121;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v94lnRVnvoTJ1Pc8aoKqSqEARqq8CGmwJLQaxJ+xYl4=;
        b=pNeHj3DcQJIj/IZkUPRUtR/k+6zAvu1LnjKWzkYTNgXc8tEEl6RIQl3JGxDhtRKxqH
         3Q9KiqyWBrac/cK+8r5Lk8AyysuFd7OvKMNPk2DqivKGSOlBke1jpwmF+2QLzdByLgKU
         G5ufrn0MP+5nFbl4Ai1P/WaSMZLqqwZvSE7nusPWYNnSnLXASLWtpcpG4eTXnXc7F+R9
         EFs6iI6rwucZvTrY4CXgwgKaqMCjqfInHPyuRBXo5OZ7ortZrGWcgSd3aRRRQBkVJFBf
         2BIHYpnIetHJ7q9uhnoEO02Zgi/n4/c+ALDV8xTunDWnSekZq624uUfI7hgsg3guYJ6t
         0lfA==
X-Forwarded-Encrypted: i=1; AFNElJ/rQS82Yjbl3TRZFLTjVlXxRVIrLqFdLf6Vj1Rm361fTeVZv/SjCJ5rtfgoKKVKx/8YQywXAq8TX55KMA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yza01dsF+c1D19iw7Dyj4cafLn9PMMgfvDRseqqx3BlYmNKJksQ
	Tmk0EgWLHac9wKE950p65SEM5aU0n0TKc3ivspZWu70f990QroPTXgT1
X-Gm-Gg: AfdE7cncMKIu57zNJlFbwbWyxulroS8sO2rzmPQW13UuqEIgESR8m59994RzhiVlZSc
	MUKjHTTab+PfoeSx0ERRXFuXqofRW/DX6ptZLqgZE93Vx8xCxOoTy+KWJzSVAIaANnXUYeQySec
	CiKBpO/PHNDLi11RWqZs4O2sLrEtoUyMwMuzAKXLr60yhpRcIjdRJkfdxQZHSHZvCyK/u2lG3xi
	/21jMeNE4rFPKF7+GrgJm+SBVDCCObFd+UB82Ia3RME+kdzBLGN3Uea7kQMAq+SJLWKVIVS5ZkA
	ijUHOVUML7bP0FJ0MqTbWfm6yLDufx0bM7pOkpSxiUgarnO/ljBUigwzMWjGKQP4xLDO5HW5M+y
	QzMZeZupECIn7+V2Oi5b5BRFuigFvnUS0VG8jXAwdZx+pjjp0vwvl9i0pCpvAiX3I51mWgb/8Qn
	3iM+0P+JS5tJY2AQ==
X-Received: by 2002:a05:622a:410e:b0:516:e39a:8540 with SMTP id d75a77b69052e-51a06af48a7mr138785651cf.48.1782092320980;
        Sun, 21 Jun 2026 18:38:40 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51a098e287csm55778831cf.29.2026.06.21.18.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 18:38:40 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Mon, 22 Jun 2026 01:36:25 +0000
Subject: [PATCH v3 3/5] dmaengine: sun6i-dma: Add num_channels_per_reg for
 flexible interrupt mapping
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-sun60i-a733-dma-v3-3-f697ef296cbc@gmail.com>
References: <20260622-sun60i-a733-dma-v3-0-f697ef296cbc@gmail.com>
In-Reply-To: <20260622-sun60i-a733-dma-v3-0-f697ef296cbc@gmail.com>
To: conor+dt@kernel.org, mripard@kernel.org, krzk+dt@kernel.org, 
 robh@kernel.org, samuel@sholland.org, wens@kernel.org, 
 jernej.skrabec@gmail.com, Frank.Li@kernel.org, vkoul@kernel.org
Cc: Yuanshen Cao <alex.caoys@gmail.com>, dmaengine@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2

The previous implementation of `sun6i-dma` had some implicit assumptions
about the number of channels per interrupt register. Specifically,
functions like `sun6i_kill_tasklet` were hardcoded to only disable
interrupts for IRQ 0 and 1. `DMA_MAX_CHANNELS` is also not in used in
the past, and the old SoCs never has more than 16 channels.

The A733 has a different interrupt structure where the number of
channels per register may differ. This patch introduces
`num_channels_per_reg` to the `sun6i_dma_config`, similar to BSP, to
make the interrupt handling logic hardware-agnostic. It also sets
`DMA_MAX_CHANNELS` to 16 to align with the new BSP code and ensure loops
over interrupts are correctly bounded.

Changes:
- Change `DMA_MAX_CHANNELS` definition to 16.
- Added `num_channels_per_reg` to `struct sun6i_dma_config`.
- Replaced hardcoded IRQ register calculations with values from
  `sdev->cfg->num_channels_per_reg`.
- Updated `sun6i_kill_tasklet` to loop through all possible interrupt
  registers based on `DMA_MAX_CHANNELS` and the configuration.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
 drivers/dma/sun6i-dma.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 9984b9033cbb..196a0d73b221 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -41,7 +41,7 @@
 #define DMA_STAT		0x30
 
 /* Offset between DMA_IRQ_EN and DMA_IRQ_STAT limits number of channels */
-#define DMA_MAX_CHANNELS	(DMA_IRQ_CHAN_NR * 0x10 / 4)
+#define DMA_MAX_CHANNELS	16
 
 /*
  * sun8i specific registers
@@ -151,6 +151,7 @@ struct sun6i_dma_config {
 	u32 src_addr_widths;
 	u32 dst_addr_widths;
 	bool has_mbus_clk;
+	u32 num_channels_per_reg;
 };
 
 /*
@@ -482,8 +483,8 @@ static int sun6i_dma_start_desc(struct sun6i_vchan *vchan)
 
 	sun6i_dma_dump_lli(vchan, pchan->desc->v_lli, pchan->desc->p_lli);
 
-	irq_reg = pchan->idx / DMA_IRQ_CHAN_NR;
-	irq_offset = pchan->idx % DMA_IRQ_CHAN_NR;
+	irq_reg = pchan->idx / sdev->cfg->num_channels_per_reg;
+	irq_offset = pchan->idx % sdev->cfg->num_channels_per_reg;
 
 	vchan->irq_type = vchan->cyclic ? DMA_IRQ_PKG : DMA_IRQ_QUEUE;
 
@@ -575,7 +576,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 	int i, j, ret = IRQ_NONE;
 	u32 status;
 
-	for (i = 0; i < sdev->num_pchans / DMA_IRQ_CHAN_NR; i++) {
+	for (i = 0; i < sdev->num_pchans / sdev->cfg->num_channels_per_reg; i++) {
 		status = sdev->cfg->read_irq_stat(sdev, i);
 		if (!status)
 			continue;
@@ -585,7 +586,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 
 		sdev->cfg->write_irq_stat(sdev, i, status);
 
-		for (j = 0; (j < DMA_IRQ_CHAN_NR) && status; j++) {
+		for (j = 0; (j < sdev->cfg->num_channels_per_reg) && status; j++) {
 			pchan = sdev->pchans + j;
 			vchan = pchan->vchan;
 			if (vchan && (status & vchan->irq_type)) {
@@ -1116,9 +1117,11 @@ static struct dma_chan *sun6i_dma_of_xlate(struct of_phandle_args *dma_spec,
 
 static inline void sun6i_kill_tasklet(struct sun6i_dma_dev *sdev)
 {
+	int i;
+
 	/* Disable all interrupts from DMA */
-	writel(0, sdev->base + DMA_IRQ_EN(0));
-	writel(0, sdev->base + DMA_IRQ_EN(1));
+	for (i = 0; i < DMA_MAX_CHANNELS / sdev->cfg->num_channels_per_reg; i++)
+		sdev->cfg->write_irq_en(sdev, i, 0);
 
 	/* Prevent spurious interrupts from scheduling the tasklet */
 	atomic_inc(&sdev->tasklet_shutdown);
@@ -1181,6 +1184,7 @@ static struct sun6i_dma_config sun6i_a31_dma_cfg = {
 	.dst_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
+	.num_channels_per_reg = DMA_IRQ_CHAN_NR,
 	SUN6I_DMA_IRQ_A31_COMMON_OPS
 };
 
@@ -1206,6 +1210,7 @@ static struct sun6i_dma_config sun8i_a23_dma_cfg = {
 	.dst_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
+	.num_channels_per_reg = DMA_IRQ_CHAN_NR,
 	SUN6I_DMA_IRQ_A31_COMMON_OPS
 };
 
@@ -1226,6 +1231,7 @@ static struct sun6i_dma_config sun8i_a83t_dma_cfg = {
 	.dst_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
+	.num_channels_per_reg = DMA_IRQ_CHAN_NR,
 	SUN6I_DMA_IRQ_A31_COMMON_OPS
 };
 
@@ -1255,6 +1261,7 @@ static struct sun6i_dma_config sun8i_h3_dma_cfg = {
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_8_BYTES),
+	.num_channels_per_reg = DMA_IRQ_CHAN_NR,
 	SUN6I_DMA_IRQ_A31_COMMON_OPS
 };
 
@@ -1278,6 +1285,7 @@ static struct sun6i_dma_config sun50i_a64_dma_cfg = {
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_8_BYTES),
+	.num_channels_per_reg = DMA_IRQ_CHAN_NR,
 	SUN6I_DMA_IRQ_A31_COMMON_OPS
 };
 
@@ -1301,6 +1309,7 @@ static struct sun6i_dma_config sun50i_a100_dma_cfg = {
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_8_BYTES),
+	.num_channels_per_reg = DMA_IRQ_CHAN_NR,
 	.has_mbus_clk = true,
 	SUN6I_DMA_IRQ_A31_COMMON_OPS
 };
@@ -1325,6 +1334,7 @@ static struct sun6i_dma_config sun50i_h6_dma_cfg = {
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_8_BYTES),
+	.num_channels_per_reg = DMA_IRQ_CHAN_NR,
 	.has_mbus_clk = true,
 	SUN6I_DMA_IRQ_A31_COMMON_OPS
 };
@@ -1351,6 +1361,7 @@ static struct sun6i_dma_config sun8i_v3s_dma_cfg = {
 	.dst_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
+	.num_channels_per_reg = DMA_IRQ_CHAN_NR,
 	SUN6I_DMA_IRQ_A31_COMMON_OPS
 };
 

-- 
2.54.0

