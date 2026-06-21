Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCAF371CE3
	for <linux-sunxi@lists.linux.dev>; Sun, 21 Jun 2026 21:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782078098; cv=none; b=Ngbuz2ch2a7p6C3CGerQbMpDroDXBUYdUpjMFF2UzUR8jgRjdj7G/nWGIiavyNbe+Ki6zKd8qEMJZRa4YrC2QNg79q2wntrc8XhhHLT5a97m7rA1crvinRNgGbPjNBLKKeUKWm8B+pwyFFVugdD1aZncXfe5mbhbofD9DSKjfcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782078098; c=relaxed/simple;
	bh=nx3mp9nLCWLGwwhXcXHx8zANBb94IT7PqVcAiE3F6PQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lDS6NxbtIupFrkYsR6GscmZF2TdLhSXexsEyMg+IQ7Ra2alPQ+3ktjxxKm0lnJzhVCmMAyrR2019VSDVf/61UzbSdTFhq2s8EQ8xlRGn6JiCAKWyPXCqF20lxhHebavcAVzhpNI3YlUVW6GSux9zz9iZg3/WlYCrE/90lHhJ+IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JeMbfw13; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JeMbfw13"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-517de710886so29997061cf.3
        for <linux-sunxi@lists.linux.dev>; Sun, 21 Jun 2026 14:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782078093; x=1782682893; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WoB3WtpCVismpnSqyX/NJ4l5EF9+u+wVTQ5wN075Edc=;
        b=JeMbfw13jOt/PWmQrC9RllPXo33d1gykxybY07x/Dp4AMTJKLiQWA109/+1CgWel4a
         PYtLe2bLVqDoXALcIOHFVpbEV08xhOgH5d1w58kIToj4drLlIGYs8lcTc2pdX0d7QZlc
         qb4VM6GwC3kHLF92NO77Q/gjY+q3kpxElP+wM5haL/u9XuqS5aPZYqqnlQDV7le/if+R
         FN9aECdCIK3E9zjKOblqi63mg/8qLhI41UT1w1qSXRF6YIXz8X6O467WjptCGimggQSq
         w5m+PQulN4qiyqIU09Tu0HF94QiNmy8IDMzJqNdMjbYaC+6crEVM8KhglIC87vzgTU4c
         vaxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782078093; x=1782682893;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WoB3WtpCVismpnSqyX/NJ4l5EF9+u+wVTQ5wN075Edc=;
        b=S5t89sElAUGTxMRomRvn8iCtoHl+qEA7yBB9GjACIpn9a269C5lFlO6vkF2XrW4dv3
         IXSt4elqdRIYWW25uWVGm5pT7brvooIhhe9WItdc60nge37eNdGSr+B0lAhYqVcBsJGl
         68USP4s+wU5rvnY9rLf69YgLWWL1bO0/insLqfvH/yjR/ak6TzVwvbSuSanO4/wW/tzm
         h/apx8F/+lxor4IfFuVNxF5GX9EmodQd+sqvU303xT7Fjb9KZwaaiEYrm605S5Nd4rtC
         YkqGshh4o209L6203cLgFMysspC9O0OdaC7zRCnsyt06Hgi4p8TpNx2oQ5mv+Sz7EErc
         N5eg==
X-Forwarded-Encrypted: i=1; AFNElJ8TBwNpYUWXIxO5CRfOezneULWN/El+GEPuE6blY6cuYX3iUV1Q9UDf+4WKLXT3D6WN6BvAWpQ7xpTtMQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxjinF+97uii/ft1JoOirc/sYG1XhABK6E72gLYW+dgM/fYCpSs
	bhSUjBkIbXc2xOmfm33+wIt16dSWi00V9SDbzsKReQm/anvN9fWOtO09
X-Gm-Gg: AfdE7cmd78QfDFKOGe0+3RGA/PCEvR1kaq7PCb9TzoHPZMVIz7auzIHXD492RwJw9jQ
	TeyQPTf3mz8Blx3HD4QZAsF29q9Qg2MEGGmf/w6ZQtleWWYWQfJjxCdhpkoPlkZomCrxHcQmpPD
	iQJrdKSVNRnOLzkgjk+KmZhUHpYY69CUAW+7G39VP+gGv3eiNnL05rdvfRQnQVhVOJqDRrBiYT+
	XXLo0vpzEPqIkkU5SafHCawhRCSl7xmtPz1ouFcvrhQ/twIZuod2Imu8NIFe8PeP5eK+IwM5VH9
	VmNymsqF8v65YRosSVv4O8XS+ShYN2+NjWGZ7n7RizHWVLzEdhdyIcA0JnZFn4c5DzLTnVLRE58
	618/8MNAPSGPbd7ZgXuZx/Yan9T86qg8Db8vBYPq0y8QcqvyDhZZRK0oHw1Aq59ZPjoMarGgwLt
	/ktAG0bb5o4ueKSw==
X-Received: by 2002:ac8:5806:0:b0:517:a02f:171e with SMTP id d75a77b69052e-519f04913d6mr162441741cf.30.1782078093134;
        Sun, 21 Jun 2026 14:41:33 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df81cde9ecsm76274676d6.24.2026.06.21.14.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 14:41:32 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Sun, 21 Jun 2026 21:40:56 +0000
Subject: [PATCH v2 3/5] dmaengine: sun6i-dma: Add num_channels_per_reg for
 flexible interrupt mapping
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260621-sun60i-a733-dma-v2-3-340f205891cc@gmail.com>
References: <20260621-sun60i-a733-dma-v2-0-340f205891cc@gmail.com>
In-Reply-To: <20260621-sun60i-a733-dma-v2-0-340f205891cc@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: Yuanshen Cao <alex.caoys@gmail.com>, dmaengine@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
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

