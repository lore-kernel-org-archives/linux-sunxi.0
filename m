Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C71B274B53
	for <linux-sunxi@lists.linux.dev>; Wed, 26 Aug 2026 01:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787707830; cv=none; b=q0QRMHC9SEBmYTuIgig1Okws9EX85u7Kkm3WXL6pbM8iEQ+yL/wBzttfry3V/M0JeRVqIe0MNT1kiB5/+Q+r7E8qtHpGogiDpQ5lniY60BItssqV+HzHT2YEhTw0TE3yt5CL//SKxCCjiNtlQ1X+dt3Qd1Ank4mRE3J4Q5EEqVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787707830; c=relaxed/simple;
	bh=usCw7Ym88poS56Zm5L+NHxa343GGy1zqroa3ApFu/gg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VJU3cM+FIf52t60Buh3kzudBN8N09jBUBP6PZEA+0H7/QMLxAFk6XT2liDEOs8moZW3jYzFKlz8ezjUOtTJwl3MyYueofr296io6urgiDu5ydUMMGh9WNZ0ZTb7ZKaMPX3dWJYNUZgoLqMMR924JZQtpmU0ma8xdPzxnv4zCt3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SEgCZ0bG; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SEgCZ0bG"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-9309d4ea213so29092585a.1
        for <linux-sunxi@lists.linux.dev>; Tue, 25 Aug 2026 18:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787707827; x=1788312627; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o5pUUJmcn3/3Y2ngemNPoG+r9QKqCH0NVXE0QE3SQQY=;
        b=SEgCZ0bG1Njn4cvSTaQTtQeWTmPao7SwbceNAXZgsxSeHwqWiMXKYHo5rcTnvpWPbw
         mJ8Shbabj6KbUYnh32o4S0zwAFvoklaTBjxY9ZcfuZgLsVg1xD9s1srbgPJ+ooCxOdHK
         qxzrm1dOedkBxAKgt2B54shFWEY4t+FVEUXRPpukFbOxhPlXPYAiPkdlkJ+OnTRl1bcD
         P0Nw0lfwD2hiigdQ236ZS05pVeh6Aw+HA+lt687qEwBMzdjPrrc8/D4x0h1hNLDlBTPe
         5Z+cvZ/G9z1BLTMzkDiMS0JHKruBIXBRBruADU6zM3LAwGXrPBh1zLbVvcqFynrh6NcV
         3weQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787707827; x=1788312627;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o5pUUJmcn3/3Y2ngemNPoG+r9QKqCH0NVXE0QE3SQQY=;
        b=bVRjjrZARfyTT+d9NaDkW8Boj9/4aU7NQ3tAfg12wwjQovJa23UAZPtMMfUB1FS/MG
         0Wc1oIO82uSCF28+q5bxC+l9aZj/e/MKX1xFxS8kieEwP79gP1Xg6znmsGrgSx0UNRkU
         CNi/uU8yhKh/rASu0na63vaLEdg7qNerdahuAk+Yeku8uYlqw/UYrkJT/HUCImECxsZA
         sY7uldK+xBVagx2ROnkxGDC7v6f2fupqUekgHJyu7DW+dsrSM2qzbusDtdbBP9D8Ow0B
         28XLV+FJJXid44Op2RdjCvOkxsqNABKTbtOu+D+vJoRdt0QgeFHONHIwYPxjdT3afoCo
         DQwQ==
X-Forwarded-Encrypted: i=1; AHgh+RoxWOEb7IE1vYvLSXOOsRloHdU6vSJ9qYsuROAXhnn66QWUiwKoDzUkVxgNDkN/Z9REfqvAStosuP1psw==@lists.linux.dev
X-Gm-Message-State: AFuF++m7P6/2NQzxuHa3ycztdCLuOtxCOkK7fZxL5onvA0v/03IWF+OB
	/1HibsjSlnNI4dxKSIgDsdgmgTYdpewJPe/ARlSx0KN5AI+d4gL7IsWv
X-Gm-Gg: AR+sD10Vy0mBZXxft5ME8acVhgoXP5i0r7VplsYYPxAe/QifvL1PpqSdLtM3aMMYGpC
	BNM06I9SiCCxmLj7ACcaF4IMSbMeec3RHQcrQACnmAqxRX94UvUBI1E2txprbe14ryCd08Y+Mxz
	XqBJXd5st2Uvv83Yx4AZ377pKaSbWSkAxHX6fFVvv3BhOv8xmOk1c6y+zuNjUWVGzckhj926zCR
	/IjY66K1RijwUC5HYmLS1h5YneVPYxlYKBy88cFcyu8akdPLHOzJ9t5Iv3IJZxIhnr2Rhc/q7Et
	FIJaxoE9xLhsIh3dq3f8L5m3iFXJ6Gc4LkAKKfxReWJ+1ix2ae0aEbBLoLgY45TcvJSqZTN1+jO
	n6adJ93aQIJO91IWjTA7FTOabZ+ty1KHGwhZ5oRKHxphPUzmzc8FwOUPyKEd4Orrf1/gB4iLmD2
	bkasvqdHSJymXS3MElLidxdJTzCLiurnhleDMV2BqDvWgkOHCkKd1XhnTel+79og==
X-Received: by 2002:a05:620a:4102:b0:92e:9d63:a6f6 with SMTP id af79cd13be357-937801702c8mr267218185a.17.1787707827056;
        Tue, 25 Aug 2026 18:30:27 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9377e67c52csm102398585a.38.2026.08.25.18.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 18:30:26 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Wed, 26 Aug 2026 01:30:05 +0000
Subject: [PATCH v4 3/5] dmaengine: sun6i-dma: Add num_channels_per_reg for
 flexible interrupt mapping
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-sun60i-a733-dma-v4-3-dc2f745f40dc@gmail.com>
References: <20260826-sun60i-a733-dma-v4-0-dc2f745f40dc@gmail.com>
In-Reply-To: <20260826-sun60i-a733-dma-v4-0-dc2f745f40dc@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: Yuanshen Cao <alex.caoys@gmail.com>, dmaengine@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0

The `sun6i-dma` driver previously assumed a fixed number of channels
per interrupt register. For example, `sun6i_kill_tasklet` was hardcoded
to disable interrupts only for registers 0 and 1. `DMA_MAX_CHANNELS` was
also not in used previously, and the old SoCs never has more than 16
channels.

The A733 has a different interrupt structure where the number of
channels per register may differ. Add `num_channels_per_reg` to `struct
sun6i_dma_config` to make the interrupt handling logic handware-agnostic
Update `sun6i_dma_interrupt`, `sun6i_dma_start_desc`, and
`sun6i_kill_tasklet` to use this value.

Additionally, set `DMA_MAX_CHANNELS` to 16 to ensure loops over
interrupts are correctly bounded, aligning with the hardware
specifications.

Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
 drivers/dma/sun6i-dma.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 53c54161e32a..b96d7d90f6b5 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -35,14 +35,13 @@
 #define DMA_IRQ_PKG			BIT(1)
 #define DMA_IRQ_QUEUE			BIT(2)
 
-#define DMA_IRQ_CHAN_NR			8
 #define DMA_IRQ_CHAN_WIDTH		4
 
 
 #define DMA_STAT		0x30
 
 /* Offset between DMA_IRQ_EN and DMA_IRQ_STAT limits number of channels */
-#define DMA_MAX_CHANNELS	(DMA_IRQ_CHAN_NR * 0x10 / 4)
+#define DMA_MAX_CHANNELS	16
 
 /*
  * sun8i specific registers
@@ -61,6 +60,8 @@
 #define DMA_IRQ_EN_OFFSET_A31		0x00
 #define DMA_IRQ_STAT_OFFSET_A31		0x10
 
+#define DMA_IRQ_CHAN_NR_A31		8
+
 /*
  * Channels specific registers
  */
@@ -157,6 +158,7 @@ struct sun6i_dma_config {
 	u32 irq_stride;
 	u32 irq_en_offset;
 	u32 irq_stat_offset;
+	u32 num_channels_per_reg;
 };
 
 /*
@@ -271,7 +273,7 @@ static inline void sun6i_dma_dump_com_regs(struct sun6i_dma_dev *sdev)
 {
 	int i;
 
-	for (i = 0; i < 2; i++) {
+	for (i = 0; i < DIV_ROUND_UP(sdev->num_pchans, sdev->cfg->num_channels_per_reg); i++) {
 		dev_dbg(sdev->slave.dev, "Common register:\n"
 			"chan num %d\n"
 			"\tmask(%04x): 0x%08x\n"
@@ -492,8 +494,8 @@ static int sun6i_dma_start_desc(struct sun6i_vchan *vchan)
 
 	sun6i_dma_dump_lli(vchan, pchan->desc->v_lli, pchan->desc->p_lli);
 
-	irq_reg = pchan->idx / DMA_IRQ_CHAN_NR;
-	irq_offset = pchan->idx % DMA_IRQ_CHAN_NR;
+	irq_reg = pchan->idx / sdev->cfg->num_channels_per_reg;
+	irq_offset = pchan->idx % sdev->cfg->num_channels_per_reg;
 
 	vchan->irq_type = vchan->cyclic ? DMA_IRQ_PKG : DMA_IRQ_QUEUE;
 
@@ -585,7 +587,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 	int i, j, ret = IRQ_NONE;
 	u32 status;
 
-	for (i = 0; i < sdev->num_pchans / DMA_IRQ_CHAN_NR; i++) {
+	for (i = 0; i < sdev->num_pchans / sdev->cfg->num_channels_per_reg; i++) {
 		status = sun6i_read_irq_stat(sdev, i);
 		if (!status)
 			continue;
@@ -595,7 +597,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 
 		sun6i_write_irq_stat(sdev, i, status);
 
-		for (j = 0; (j < DMA_IRQ_CHAN_NR) && status; j++) {
+		for (j = 0; (j < sdev->cfg->num_channels_per_reg) && status; j++) {
 			pchan = sdev->pchans + j;
 			vchan = pchan->vchan;
 			if (vchan && (status & vchan->irq_type)) {
@@ -1113,7 +1115,7 @@ static inline void sun6i_kill_tasklet(struct sun6i_dma_dev *sdev)
 	int i;
 
 	/* Disable all interrupts from DMA */
-	for (i = 0; i < 2; i++)
+	for (i = 0; i < DMA_MAX_CHANNELS / sdev->cfg->num_channels_per_reg; i++)
 		sun6i_write_irq_en(sdev, i, 0);
 
 	/* Prevent spurious interrupts from scheduling the tasklet */
@@ -1141,7 +1143,8 @@ static inline void sun6i_dma_free(struct sun6i_dma_dev *sdev)
 #define SUN6I_DMA_IRQ_A31_COMMON_CFG	\
 	.irq_stride      = DMA_IRQ_STRIDE_A31,	\
 	.irq_en_offset   = DMA_IRQ_EN_OFFSET_A31,	\
-	.irq_stat_offset = DMA_IRQ_STAT_OFFSET_A31,
+	.irq_stat_offset = DMA_IRQ_STAT_OFFSET_A31,	\
+	.num_channels_per_reg = DMA_IRQ_CHAN_NR_A31,
 
 /*
  * For A31:

-- 
2.55.0

