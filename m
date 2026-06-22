Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F8F2571A0
	for <linux-sunxi@lists.linux.dev>; Mon, 22 Jun 2026 01:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782092320; cv=none; b=QoxSfzrYgxgxH+WUrU6TVnBHibVziJsyvjApNMyrW7UOdzZiki5sD9B+kB+7Ww3PXMXMS03W5wxdMxlTs8O9PlR7edtSPT9n3NzmDuOyweKitoCAwyV0OpAsS555CFLEVn+tj1BILPzNQ850qTywcNE7zY1qs1Dm1UqGUCxzw9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782092320; c=relaxed/simple;
	bh=7WQMevtDEMWZ3MVhKm46AMdsaGQMum4hlSPXmXykx7U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mi6PyfpkGXO250GF0mxvhkh+mF0aBlz9ZsEpoFcD21ZahYnBNL5mioGtBkqBdDX1GoqAhl2kpohq3gnkXmjGCHsmmCa8CyqVDFOa8seMJTIlAStxCjD3BZpnsKkXX5a7xIxlS70UkvbmMwMe3aNcenSv3HwNB3JUTXsOUKHl2x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kbg3lQ/h; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kbg3lQ/h"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-517583cb07aso40796251cf.2
        for <linux-sunxi@lists.linux.dev>; Sun, 21 Jun 2026 18:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782092318; x=1782697118; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sOQx0t/yoBTjIlmpwlhy2Xp5tYNVpfWuWDWWOowITKk=;
        b=Kbg3lQ/hACGuxjGambng+vQ9t8D3ZpxntuwGSEzhkWKDtfVugI5cOf24AIf4n/5vnJ
         32XY2F1+ym4I01UeqHgnWKg/nZuPbRS962YozsCOuZfTZxbPqbpllkmnvbrrUjYpIYX+
         RbtTjJycQpkzcgNRR3vV9QLWa1atxpQ2kYs6Seg2j9e+UcugaL/Psod+HirDb9vqZl5G
         rcqayT5NjN+qO8xj4T365r1PLSJOSG9KP+LygA1T1u9DtpbyaKxYlz8pqpDFuNEioXvL
         zJXRZf6yuzIVrTkDqj+lptIQUTN6Tw5oyrSD8lrbiXM/e5F0ZVFN80vXNXxkGq86xzBo
         WY9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782092318; x=1782697118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sOQx0t/yoBTjIlmpwlhy2Xp5tYNVpfWuWDWWOowITKk=;
        b=m1ett5w7mW24Ji8ZujP+3p6qvSCFUml0HcQ7hPFej+Bw+f6qw3TyCs5FS2K+VG2LSr
         P1CjpESeiMEk06jyjAWoBU4sAckm3wkbegC09FNB9+ioQtUzWrQnVbqApi3YFehDI0Vx
         CNWVKQS+S16+pUhJopMa+tgR3nNHicPwyqmUMMmO3dpAa8j9vyLNwDsmqWp8Nei6VeOk
         zsvpZld2DmTKT4+3TNuwU6g+joQmCc+PXM5diHVn+KDCqe8FHcYR/WOlmuU4E5VIxWL/
         aljLB9S56I7cpghTtSZPiEPSkTf0XZ4E/L6a8/Trx85mz8zpqHEHhq0PCA6ocZFkoZNM
         dtYw==
X-Forwarded-Encrypted: i=1; AFNElJ9UkPHkRblloYX6RcMKtfOldza7+5a0kG7GAuuMpG5B2NIoe1ZD90BKkCiwqPxIt/t2HYAow6cxyVYiUw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxLWfe8zoilHSdp3h9lh5T7ZlfPSnRnBPELyvhYHBdQtVeYbtc1
	tk7ddlnL/RMFXqZBI2zSyUbX3BpuoKiPG+35BcdKrXOTF9bAVoK4yOwO
X-Gm-Gg: AfdE7ckhMR77kabZkJJbmBE5uO+EqDl5pvTDlpAW8TcNcBbj2P8ljfVUzt2GxDYTvj3
	TXWP7HvlSoHYznmxG1SNz0WywCJyecUV9Qs4PR4Fj5EMJe+uMm1tV49IYfdIpTVCbzuVwy3Dypf
	N/PFMb6ABcS2NsWecQ3rOIFIzHolibf4LM+MjF3Si2vsYa9Dp/E0Y64wxQDxGAvrTbqZUXOW6nu
	md9IV8ikryaubufGTfPFfZ9/qbSf88v6yblQ0Z3HHPZvwH54tyYS5C2ljxuxBW2JdbiX28lk357
	1V92A6T6dw3eQ/BHMU99K6QS0diGlykIxo/i0tjUo78+3Mbx2ySgVlogRJ24sFo7a2M30uo3s6N
	r73084yHbnPO/AyxhJm2E6BROTGJJo5rcbzf3zqJOI4i6rBtPlRSgwwh4CTXDrBBkwZuTOXzLLW
	QRNcCrF2Y+jydtKQ==
X-Received: by 2002:a05:622a:14d0:b0:517:6665:2a9a with SMTP id d75a77b69052e-519e4e0acdemr186803381cf.50.1782092317978;
        Sun, 21 Jun 2026 18:38:37 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51a098e287csm55778831cf.29.2026.06.21.18.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 18:38:37 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Mon, 22 Jun 2026 01:36:23 +0000
Subject: [PATCH v3 1/5] dmaengine: sun6i-dma: Refactor to support A733
 interrupt and register handling
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-sun60i-a733-dma-v3-1-f697ef296cbc@gmail.com>
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

Refactor to support the Allwinner A733 DMA controller. Currently, the
`sun6i-dma` driver has several functions related to interrupt handling
(reading/writing interrupt enable and status registers) and register
dumping that are hardcoded.

To support the A733, which has different register layouts and interrupt
handling logic, these functions are being moved into the
`sun6i_dma_config` structure as function pointers. This allows the
driver to use a polymorphic approach where the specific implementation
is determined by the hardware configuration assigned during device
probing.

Changes:
- Added function pointers to `struct sun6i_dma_config` for:
    - `dump_com_regs`
    - `read_irq_en`
    - `write_irq_en`
    - `read_irq_stat`
    - `write_irq_stat`
- Implemented generic `sun6i_read/write_irq_*` functions for existing
  hardware.
- Added a macro and updated existing `sun6i_dma_config` instances (A31,
  A23, H3, A64, A100, H6, V3S) to use these new function pointers.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
 drivers/dma/sun6i-dma.c | 50 ++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 45 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index a9a254dbf8cb..ef3052c4ab36 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -138,6 +138,11 @@ struct sun6i_dma_config {
 	void (*set_burst_length)(u32 *p_cfg, s8 src_burst, s8 dst_burst);
 	void (*set_drq)(u32 *p_cfg, s8 src_drq, s8 dst_drq);
 	void (*set_mode)(u32 *p_cfg, s8 src_mode, s8 dst_mode);
+	void (*dump_com_regs)(struct sun6i_dma_dev *sdev);
+	u32 (*read_irq_en)(struct sun6i_dma_dev *sdev, u32 irq_reg);
+	void (*write_irq_en)(struct sun6i_dma_dev *sdev, u32 irq_reg, u32 irq_val);
+	u32 (*read_irq_stat)(struct sun6i_dma_dev *sdev, u32 irq_reg);
+	void (*write_irq_stat)(struct sun6i_dma_dev *sdev, u32 irq_reg, u32 status);
 	u32 src_burst_lengths;
 	u32 dst_burst_lengths;
 	u32 src_addr_widths;
@@ -347,6 +352,26 @@ static void sun6i_set_mode_h6(u32 *p_cfg, s8 src_mode, s8 dst_mode)
 		  DMA_CHAN_CFG_DST_MODE_H6(dst_mode);
 }
 
+static u32 sun6i_read_irq_en(struct sun6i_dma_dev *sdev, u32 irq_reg)
+{
+	return readl(sdev->base + DMA_IRQ_EN(irq_reg));
+}
+
+static void sun6i_write_irq_en(struct sun6i_dma_dev *sdev, u32 irq_reg, u32 irq_val)
+{
+	writel(irq_val, sdev->base + DMA_IRQ_EN(irq_reg));
+}
+
+static u32 sun6i_read_irq_stat(struct sun6i_dma_dev *sdev, u32 irq_reg)
+{
+	return readl(sdev->base + DMA_IRQ_STAT(irq_reg));
+}
+
+static void sun6i_write_irq_stat(struct sun6i_dma_dev *sdev, u32 irq_reg, u32 status)
+{
+	writel(status, sdev->base + DMA_IRQ_STAT(irq_reg));
+}
+
 static size_t sun6i_get_chan_size(struct sun6i_pchan *pchan)
 {
 	struct sun6i_desc *txd = pchan->desc;
@@ -460,16 +485,16 @@ static int sun6i_dma_start_desc(struct sun6i_vchan *vchan)
 
 	vchan->irq_type = vchan->cyclic ? DMA_IRQ_PKG : DMA_IRQ_QUEUE;
 
-	irq_val = readl(sdev->base + DMA_IRQ_EN(irq_reg));
+	irq_val = sdev->cfg->read_irq_en(sdev, irq_reg);
 	irq_val &= ~((DMA_IRQ_HALF | DMA_IRQ_PKG | DMA_IRQ_QUEUE) <<
 			(irq_offset * DMA_IRQ_CHAN_WIDTH));
 	irq_val |= vchan->irq_type << (irq_offset * DMA_IRQ_CHAN_WIDTH);
-	writel(irq_val, sdev->base + DMA_IRQ_EN(irq_reg));
+	sdev->cfg->write_irq_en(sdev, irq_reg, irq_val);
 
 	writel(pchan->desc->p_lli, pchan->base + DMA_CHAN_LLI_ADDR);
 	writel(DMA_CHAN_ENABLE_START, pchan->base + DMA_CHAN_ENABLE);
 
-	sun6i_dma_dump_com_regs(sdev);
+	sdev->cfg->dump_com_regs(sdev);
 	sun6i_dma_dump_chan_regs(sdev, pchan);
 
 	return 0;
@@ -549,14 +574,14 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 	u32 status;
 
 	for (i = 0; i < sdev->num_pchans / DMA_IRQ_CHAN_NR; i++) {
-		status = readl(sdev->base + DMA_IRQ_STAT(i));
+		status = sdev->cfg->read_irq_stat(sdev, i);
 		if (!status)
 			continue;
 
 		dev_dbg(sdev->slave.dev, "DMA irq status %s: 0x%x\n",
 			str_high_low(i), status);
 
-		writel(status, sdev->base + DMA_IRQ_STAT(i));
+		sdev->cfg->write_irq_stat(sdev, i, status);
 
 		for (j = 0; (j < DMA_IRQ_CHAN_NR) && status; j++) {
 			pchan = sdev->pchans + j;
@@ -1101,6 +1126,13 @@ static inline void sun6i_dma_free(struct sun6i_dma_dev *sdev)
 	}
 }
 
+#define SUN6I_DMA_IRQ_A31_COMMON_OPS	\
+	.dump_com_regs    = sun6i_dma_dump_com_regs,	\
+	.read_irq_en      = sun6i_read_irq_en,	\
+	.write_irq_en     = sun6i_write_irq_en,	\
+	.read_irq_stat    = sun6i_read_irq_stat,	\
+	.write_irq_stat   = sun6i_write_irq_stat,
+
 /*
  * For A31:
  *
@@ -1132,6 +1164,7 @@ static struct sun6i_dma_config sun6i_a31_dma_cfg = {
 	.dst_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
+	SUN6I_DMA_IRQ_A31_COMMON_OPS
 };
 
 /*
@@ -1155,6 +1188,7 @@ static struct sun6i_dma_config sun8i_a23_dma_cfg = {
 	.dst_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
+	SUN6I_DMA_IRQ_A31_COMMON_OPS
 };
 
 static struct sun6i_dma_config sun8i_a83t_dma_cfg = {
@@ -1173,6 +1207,7 @@ static struct sun6i_dma_config sun8i_a83t_dma_cfg = {
 	.dst_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
+	SUN6I_DMA_IRQ_A31_COMMON_OPS
 };
 
 /*
@@ -1200,6 +1235,7 @@ static struct sun6i_dma_config sun8i_h3_dma_cfg = {
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_8_BYTES),
+	SUN6I_DMA_IRQ_A31_COMMON_OPS
 };
 
 /*
@@ -1221,6 +1257,7 @@ static struct sun6i_dma_config sun50i_a64_dma_cfg = {
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_8_BYTES),
+	SUN6I_DMA_IRQ_A31_COMMON_OPS
 };
 
 /*
@@ -1244,6 +1281,7 @@ static struct sun6i_dma_config sun50i_a100_dma_cfg = {
 			     BIT(DMA_SLAVE_BUSWIDTH_8_BYTES),
 	.has_high_addr = true,
 	.has_mbus_clk = true,
+	SUN6I_DMA_IRQ_A31_COMMON_OPS
 };
 
 /*
@@ -1266,6 +1304,7 @@ static struct sun6i_dma_config sun50i_h6_dma_cfg = {
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_8_BYTES),
 	.has_mbus_clk = true,
+	SUN6I_DMA_IRQ_A31_COMMON_OPS
 };
 
 /*
@@ -1289,6 +1328,7 @@ static struct sun6i_dma_config sun8i_v3s_dma_cfg = {
 	.dst_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
+	SUN6I_DMA_IRQ_A31_COMMON_OPS
 };
 
 static const struct of_device_id sun6i_dma_match[] = {

-- 
2.54.0

