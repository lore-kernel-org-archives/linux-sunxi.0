Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A4E330656
	for <linux-sunxi@lists.linux.dev>; Fri, 19 Jun 2026 04:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781844871; cv=none; b=mSIt4oRUl+NyVJNdN00lkfZ6LYV2bMLdzlodhZL0Emq3LT/Ak1LiIHBtA0ewmDTTox2VtkHoFxFcFdvUa7QjQV8LRHzuYtYKn42lGaQ8UcnY2nshdTKDflymyfy01XAxdSyusJ5NTWmHmZBHB7mlKDlTsfmSBeZbTJD4VVRDW8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781844871; c=relaxed/simple;
	bh=7jkweAVlDub3sDgn0UmgLN1vsZX1f1ymTmCOlDqSb5M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q/4Z43JMGACciMujjgvNhD0p9lQLxjetvCMADV0QZgpWB2i6fKTrrYuec/fmyCArf5FZXcNiCZYG6zJ2kWaSCwJA81dJiBWPlXkI1/U7YiFeHyUUo3NR4V90Es5jyr2GnxAES8OZCok4ZhJ0v84jQwzBnKxZnXJoW2SDoWrNBhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sozTw4zl; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sozTw4zl"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8dc09919aa2so28912256d6.3
        for <linux-sunxi@lists.linux.dev>; Thu, 18 Jun 2026 21:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781844869; x=1782449669; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rCbRPFVxEt0WZgFCBiNC0T/3UAfEsH3DPRtt1y+Tp+Y=;
        b=sozTw4zlb0pX7F/R9gqQ8bOsv2CfgfM2PanctLGCQCQp52KOZVSlADLF3eBR0rYCGk
         hV4edncGK49kpUfmLko/E291oZWyE3ITcxjRrQ1iovgZ8PGl3D7FDC6ubC8Q8xTSlXhK
         rJASpM5ItXyHPWEqTswcdN5qlFCM86CAmXjK3jSHevmDlsZ/6MBKcvg+qePFWJageB+3
         0JwirajS5GF6M4vGzqBaXYiiANT5BY2yLQ+xCwG3Y4jssHyNz/7bNas89TbJQ0PWye6g
         CoA6kHgcof67561EetFOuK0iHykDLXYpNd6VgI95TnRu6AhEhxii49O1mFqknUnkqXOB
         K5dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781844869; x=1782449669;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rCbRPFVxEt0WZgFCBiNC0T/3UAfEsH3DPRtt1y+Tp+Y=;
        b=rXbQGAnePJcWlDFml3OBV6/lkIkDqxxPt1vIqfliNeZbdPeCVWB2TA8sZUCaA/UC3e
         rm0updz94jRvyb1AFrI6Ht0Xpvgx+14+iKYZpAod+lgDlYcgqOscRQXhS0qREOivrKC7
         l5ab86EeWSnii3Gn0Ri4MzHXRCDbhq0oGLc1nqMTSfisz4fl9HCzGpgB8gmdDmYcmnlz
         UbwFvm4OM+HikPqv85cKAOaoelbJ9u4jSdRa+8wc3VjIoZAlvEHgWZk2ZPet2v42cQHD
         ZDuwH1lUqjWupcMimgTLV2+Hrg5AeIo2JpcAEonzf+MAciqjwYC6iIFQ0MM8ulE89gz/
         YqPQ==
X-Forwarded-Encrypted: i=1; AFNElJ9g7A2+VjmMZwlyhOSYlGX44wvGjvg2USEcsb9zXDK1/7r9BM0PhBAIWj/Wn75TPUKnYbOHpSvIuE1fTA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwlDgJpq/YxkunIiRrY56zm59GyH3IzB0XI8dpl7KGUchIuqf3C
	PpvslV7xp1vmIB2NOzRkMo75+gid1wYs57SmyM9TyLh1fp3WJuVZYC8j
X-Gm-Gg: AfdE7ckqVZrxtxnDHxJvBMediBTXA2gNIdo3iNLFPobhTjAh2z1BO64OtTPMweXIyjL
	C/12pJ//dENRhGTqwKkrMt7bfmhRcUwmgovDNUb10B2APhw45XT0qArKYWUtAFOVAWzV4rhnUq7
	cvMqq3BzX20/n1pVpBTwWIesXZOjAWfEkok5ccRweFgKUKsozJ/C/0/DjSQGU8ydit383MbrjQ3
	W9pomMcetUrYO3RqipHHWqGrVQz4n8M/kgOUPKKeBQTIw96SBbBqiqtEOZ9eVmqJJH7U2GP/liL
	jPv109DaJAOtd451YKHW+ydCKbEwxHlwMk6g0Spa+maHpwXeybYuAO2y9kTHFTJ8SgqiZa15yWi
	z2k0bntu8CXHQYc7MKkKxQDX6t/Gwu+heDP2V+/l7mE2nR6Tt7yrhnD1n83sYaS3pBIwpSUbiGB
	RwsFGLMsM5XMtoxg==
X-Received: by 2002:a05:620a:2592:b0:915:efa6:d714 with SMTP id af79cd13be357-92092b3e2efmr316863785a.52.1781844869229;
        Thu, 18 Jun 2026 21:54:29 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-920a425448asm134464485a.23.2026.06.18.21.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 21:54:28 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Fri, 19 Jun 2026 04:53:30 +0000
Subject: [PATCH 1/5] dmaengine: sun6i-dma: Refactor to support A733
 interrupt and register handling
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-sun60i-a733-dma-v1-1-da4b649fc72a@gmail.com>
References: <20260619-sun60i-a733-dma-v1-0-da4b649fc72a@gmail.com>
In-Reply-To: <20260619-sun60i-a733-dma-v1-0-da4b649fc72a@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Yuanshen Cao <alex.caoys@gmail.com>
X-Mailer: b4 0.15.2

This patch is the first step in a refactoring effort to support the
Allwinner A733 DMA controller. Currently, the `sun6i-dma` driver has
several functions related to interrupt handling (reading/writing
interrupt enable and status registers) and register dumping that are
hardcoded.

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
- Updated existing `sun6i_dma_config` instances (A31, A23, H3, A64,
  A100, H6, V3S) to use these new function pointers.

Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
 drivers/dma/sun6i-dma.c | 74 +++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 69 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index a9a254dbf8cb..d92e702320d9 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -138,6 +138,11 @@ struct sun6i_dma_config {
 	void (*set_burst_length)(u32 *p_cfg, s8 src_burst, s8 dst_burst);
 	void (*set_drq)(u32 *p_cfg, s8 src_drq, s8 dst_drq);
 	void (*set_mode)(u32 *p_cfg, s8 src_mode, s8 dst_mode);
+	void (*dump_com_regs)(struct sun6i_dma_dev *sdev);
+	u32 (*read_irq_en)(struct sun6i_dma_dev *sdev, u32 chan_num);
+	void (*write_irq_en)(struct sun6i_dma_dev *sdev, u32 chan_num, u32 irq_val);
+	u32 (*read_irq_stat)(struct sun6i_dma_dev *sdev, u32 chan_num);
+	void (*write_irq_stat)(struct sun6i_dma_dev *sdev, u32 chan_num, u32 status);
 	u32 src_burst_lengths;
 	u32 dst_burst_lengths;
 	u32 src_addr_widths;
@@ -347,6 +352,25 @@ static void sun6i_set_mode_h6(u32 *p_cfg, s8 src_mode, s8 dst_mode)
 		  DMA_CHAN_CFG_DST_MODE_H6(dst_mode);
 }
 
+static u32 sun6i_read_irq_en(struct sun6i_dma_dev *sdev, u32 chan_num)
+{
+	return readl(sdev->base + DMA_IRQ_EN(chan_num));
+}
+
+static void sun6i_write_irq_en(struct sun6i_dma_dev *sdev, u32 chan_num, u32 irq_val)
+{
+	writel(irq_val, sdev->base + DMA_IRQ_EN(chan_num));
+}
+static u32 sun6i_read_irq_stat(struct sun6i_dma_dev *sdev, u32 chan_num)
+{
+	return readl(sdev->base + DMA_IRQ_STAT(chan_num));
+}
+
+static void sun6i_write_irq_stat(struct sun6i_dma_dev *sdev, u32 chan_num, u32 status)
+{
+	writel(status, sdev->base + DMA_IRQ_STAT(chan_num));
+}
+
 static size_t sun6i_get_chan_size(struct sun6i_pchan *pchan)
 {
 	struct sun6i_desc *txd = pchan->desc;
@@ -460,16 +484,16 @@ static int sun6i_dma_start_desc(struct sun6i_vchan *vchan)
 
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
@@ -549,14 +573,14 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
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
@@ -1124,6 +1148,11 @@ static struct sun6i_dma_config sun6i_a31_dma_cfg = {
 	.set_burst_length = sun6i_set_burst_length_a31,
 	.set_drq          = sun6i_set_drq_a31,
 	.set_mode         = sun6i_set_mode_a31,
+	.dump_com_regs    = sun6i_dma_dump_com_regs,
+	.read_irq_en      = sun6i_read_irq_en,
+	.write_irq_en     = sun6i_write_irq_en,
+	.read_irq_stat    = sun6i_read_irq_stat,
+	.write_irq_stat   = sun6i_write_irq_stat,
 	.src_burst_lengths = BIT(1) | BIT(8),
 	.dst_burst_lengths = BIT(1) | BIT(8),
 	.src_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
@@ -1147,6 +1176,11 @@ static struct sun6i_dma_config sun8i_a23_dma_cfg = {
 	.set_burst_length = sun6i_set_burst_length_a31,
 	.set_drq          = sun6i_set_drq_a31,
 	.set_mode         = sun6i_set_mode_a31,
+	.dump_com_regs    = sun6i_dma_dump_com_regs,
+	.read_irq_en      = sun6i_read_irq_en,
+	.write_irq_en     = sun6i_write_irq_en,
+	.read_irq_stat    = sun6i_read_irq_stat,
+	.write_irq_stat   = sun6i_write_irq_stat,
 	.src_burst_lengths = BIT(1) | BIT(8),
 	.dst_burst_lengths = BIT(1) | BIT(8),
 	.src_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
@@ -1165,6 +1199,11 @@ static struct sun6i_dma_config sun8i_a83t_dma_cfg = {
 	.set_burst_length = sun6i_set_burst_length_a31,
 	.set_drq          = sun6i_set_drq_a31,
 	.set_mode         = sun6i_set_mode_a31,
+	.dump_com_regs    = sun6i_dma_dump_com_regs,
+	.read_irq_en      = sun6i_read_irq_en,
+	.write_irq_en     = sun6i_write_irq_en,
+	.read_irq_stat    = sun6i_read_irq_stat,
+	.write_irq_stat   = sun6i_write_irq_stat,
 	.src_burst_lengths = BIT(1) | BIT(8),
 	.dst_burst_lengths = BIT(1) | BIT(8),
 	.src_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
@@ -1190,6 +1229,11 @@ static struct sun6i_dma_config sun8i_h3_dma_cfg = {
 	.set_burst_length = sun6i_set_burst_length_h3,
 	.set_drq          = sun6i_set_drq_a31,
 	.set_mode         = sun6i_set_mode_a31,
+	.dump_com_regs    = sun6i_dma_dump_com_regs,
+	.read_irq_en      = sun6i_read_irq_en,
+	.write_irq_en     = sun6i_write_irq_en,
+	.read_irq_stat    = sun6i_read_irq_stat,
+	.write_irq_stat   = sun6i_write_irq_stat,
 	.src_burst_lengths = BIT(1) | BIT(4) | BIT(8) | BIT(16),
 	.dst_burst_lengths = BIT(1) | BIT(4) | BIT(8) | BIT(16),
 	.src_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
@@ -1211,6 +1255,11 @@ static struct sun6i_dma_config sun50i_a64_dma_cfg = {
 	.set_burst_length = sun6i_set_burst_length_h3,
 	.set_drq          = sun6i_set_drq_a31,
 	.set_mode         = sun6i_set_mode_a31,
+	.dump_com_regs    = sun6i_dma_dump_com_regs,
+	.read_irq_en      = sun6i_read_irq_en,
+	.write_irq_en     = sun6i_write_irq_en,
+	.read_irq_stat    = sun6i_read_irq_stat,
+	.write_irq_stat   = sun6i_write_irq_stat,
 	.src_burst_lengths = BIT(1) | BIT(4) | BIT(8) | BIT(16),
 	.dst_burst_lengths = BIT(1) | BIT(4) | BIT(8) | BIT(16),
 	.src_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
@@ -1232,6 +1281,11 @@ static struct sun6i_dma_config sun50i_a100_dma_cfg = {
 	.set_burst_length = sun6i_set_burst_length_h3,
 	.set_drq          = sun6i_set_drq_h6,
 	.set_mode         = sun6i_set_mode_h6,
+	.dump_com_regs    = sun6i_dma_dump_com_regs,
+	.read_irq_en      = sun6i_read_irq_en,
+	.write_irq_en     = sun6i_write_irq_en,
+	.read_irq_stat    = sun6i_read_irq_stat,
+	.write_irq_stat   = sun6i_write_irq_stat,
 	.src_burst_lengths = BIT(1) | BIT(4) | BIT(8) | BIT(16),
 	.dst_burst_lengths = BIT(1) | BIT(4) | BIT(8) | BIT(16),
 	.src_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
@@ -1255,6 +1309,11 @@ static struct sun6i_dma_config sun50i_h6_dma_cfg = {
 	.set_burst_length = sun6i_set_burst_length_h3,
 	.set_drq          = sun6i_set_drq_h6,
 	.set_mode         = sun6i_set_mode_h6,
+	.dump_com_regs    = sun6i_dma_dump_com_regs,
+	.read_irq_en      = sun6i_read_irq_en,
+	.write_irq_en     = sun6i_write_irq_en,
+	.read_irq_stat    = sun6i_read_irq_stat,
+	.write_irq_stat   = sun6i_write_irq_stat,
 	.src_burst_lengths = BIT(1) | BIT(4) | BIT(8) | BIT(16),
 	.dst_burst_lengths = BIT(1) | BIT(4) | BIT(8) | BIT(16),
 	.src_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
@@ -1281,6 +1340,11 @@ static struct sun6i_dma_config sun8i_v3s_dma_cfg = {
 	.set_burst_length = sun6i_set_burst_length_a31,
 	.set_drq          = sun6i_set_drq_a31,
 	.set_mode         = sun6i_set_mode_a31,
+	.dump_com_regs    = sun6i_dma_dump_com_regs,
+	.read_irq_en      = sun6i_read_irq_en,
+	.write_irq_en     = sun6i_write_irq_en,
+	.read_irq_stat    = sun6i_read_irq_stat,
+	.write_irq_stat   = sun6i_write_irq_stat,
 	.src_burst_lengths = BIT(1) | BIT(8),
 	.dst_burst_lengths = BIT(1) | BIT(8),
 	.src_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |

-- 
2.54.0

