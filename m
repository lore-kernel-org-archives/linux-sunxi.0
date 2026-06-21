Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D08D37188B
	for <linux-sunxi@lists.linux.dev>; Sun, 21 Jun 2026 21:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782078098; cv=none; b=WD10UXB9CoCQa20V7Ud9UpHn5fv2DrVq9YZcapllPBRMT71zZjHE0xJci4KTglR5xRrqDRLGZDAbXBbWfhbuau96O150Lcgl8VR97SQdnAw5J8DVGC+mXQ4t00oPSzhTbwjL3JjNVYRMOz8d+vdvVLAgmnUyfV6J+qvdu5aYIc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782078098; c=relaxed/simple;
	bh=18fWd7CDs9ATtKFp3tkSjs04Zj8nl/XFyKUyvkpg2Wg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SnNtEHB6DMY1IrYJbcTMvGdXOE5L/ib2BnCJ8bEzXV1b0liQy0vY9FDT+jakXR8PXJjyC8H9OyqDV/TS3k/qHcCghM+P9wnRJTwn5LyH+rhqBEgLjg1dL38hr9pU9x72+v+yu/eTYwqRMjx1gcBShiCyuSl6y/MuvaV7pX7Lhp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gw3pDy45; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gw3pDy45"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-9159da9bba5so279839085a.1
        for <linux-sunxi@lists.linux.dev>; Sun, 21 Jun 2026 14:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782078096; x=1782682896; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cUxclwCt1AeWLXTJW70zHjVOqZZDagaPH5nxyqxh7kU=;
        b=gw3pDy455Y5xErjFHfZ+9t05DqgOhwqcQTsQJ7+nIrqntuWSKxUm14l2NypePcDW4K
         6cyXgkpFVuiAz90Mf2gVWop9n/XHjLx79z+aSnHAdlT42pKfWxnNHsbY5Ch++OuKPv1d
         bh/dUMtTH0Gsf1dLKj+4otyrxBGkNa6mTUGqSep2E20GcuFbQ2d/tXl+3cz76B60GuMv
         quvkVx0s871HbvbeDJmSPDtKYe/Uocizv81j7hi5ELxMosNaVTf5oUZ3meQVTYljO8wO
         wh2ctoaV19laMaZBXj+iOHOf6fZkeT7tMIYHhnkaJAN72Fj3JVQqgPNtg0LrpvvKrK14
         qHEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782078096; x=1782682896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cUxclwCt1AeWLXTJW70zHjVOqZZDagaPH5nxyqxh7kU=;
        b=fU0QFyT4bugzVQS3MRYGFefF2wIgZVxR4gLW18o0lKCvoejoYDml6jimveQ0kD1Vv4
         lhhaP3JwO/V+7xJwEAm3M0sPDZ691qyOHi4bL0T7n5q9k8rT3Wj0jpahQIyvCvNkw1o8
         OVmUCfCG4BwMlN/xsCktKq/NWOU7qduvZ55V2Tf76rU8iur3K6Usjr4LgsoNR6HUBueh
         XZEEaY4lnJ+dldYXNsXzno6XTy4FkBFk/aIqiWxVnd4TyvbfTMDo5jOI9HvMVBBmjTo+
         +DREeTpj/4NKGJpiE5wnSqxjGIVsfwMD9aPG5DMGGwCqI/TAqQE7DSqQ9+JegrpLzon2
         K2Wg==
X-Forwarded-Encrypted: i=1; AFNElJ8DLucUrNleeWwp+pFj8rJ0FBmlXzxfVW1F/yYzwIvoblCCmfPckkvhj4knNxckmL3UpOBN1+4mgPm3+Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwkZ44au8UzRQqRS8/QS2YK6DJQItiHQG0LrvrKIe5x1cz7bNGN
	dyzJJJRV8Xk4KnN0uWs0LqFJD4cYS1+/9WasekyW/+/x7dtDKP+xuNuR
X-Gm-Gg: AfdE7cmTDH1xeHTntq9o1cxhyPfp5VCxpVmT3DG1r/yrzVHZ5i6oTedpayJfNK6JqE7
	YjRxxbEjB8S249anz4VX/Wrbefw7Qu8nePlK4MEaJSEkxjIuZAGwbO41mqWUVdv9ZHaytd79ED9
	0h/bKwpyzJ9hoYZK5doU+egrvvK8Y/yaU2ALgNrv26ik0fePW8xYpNO9IDL+GxFdPXnXpdUVFFm
	y1bmu6AhwuL8FRO2tmPsNPnt+ytSqIfAU8UcZENUtWBMe89jdC46NFHpDAnq5cAIk+H69WlHPTC
	ItMfiJhVNrwYLXOmD/m58SLb9nz0qs0BaBPpVG2cHnyK80QI7Jjp4fjoXAHvbZYsjnzKtoiwWpY
	iciTrER9UlaRj6cPG/00csJ5qUgJSJDkiiQWJPo/xl0o3kgiEJMd+QhNaUs3NWc9e9NbUvDYRR1
	hr4bp6Y5pPnkBWqA==
X-Received: by 2002:a05:620a:28d2:b0:915:675d:a2d with SMTP id af79cd13be357-9208d7e7a14mr1998933585a.51.1782078095835;
        Sun, 21 Jun 2026 14:41:35 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df81cde9ecsm76274676d6.24.2026.06.21.14.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 14:41:35 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Sun, 21 Jun 2026 21:40:58 +0000
Subject: [PATCH v2 5/5] dmaengine: sun6i-dma: Implement support for
 Allwinner A733 DMA controller
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260621-sun60i-a733-dma-v2-5-340f205891cc@gmail.com>
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

This patch implements the actual support for the Allwinner A733 DMA
controller. It defines the new register offsets and bitfield mappings
required for the A733, which slightly differs from the older `sun6i`
series.

Changes:
- New register macros for A733 interrupt enable `DMA_IRQ_EN_A733` and
  status `DMA_IRQ_STAT_A733`.
- New `SRC_HIGH_ADDR_32G` and `DST_HIGH_ADDR_32G` macro to handle the
  32G high-address field in the LLI.
- Implemented `sun6i_dma_set_addr_a733` and A733-specific interrupt
  register accessors.
- Added `sun60i_a733_dma_config`, which ties all the refactored
  functionality together for this specific hardware.

Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
 drivers/dma/sun6i-dma.c | 87 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 196a0d73b221..4808015934cc 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -52,6 +52,15 @@
 #define SUNXI_H3_SECURE_REG		0x20
 #define SUNXI_H3_DMA_GATE		0x28
 #define SUNXI_H3_DMA_GATE_ENABLE	0x4
+
+/*
+ * sun60i specific registers
+ */
+#define DMA_IRQ_EN_A733(x)		((x) * 0x40 + 0x134)
+#define DMA_IRQ_STAT_A733(x)		((x) * 0x40 + 0x138)
+
+#define DMA_IRQ_CHAN_NR_A733		1
+
 /*
  * Channels specific registers
  */
@@ -100,6 +109,8 @@
  */
 #define SRC_HIGH_ADDR(x)		(((x) & 0x3U) << 16)
 #define DST_HIGH_ADDR(x)		(((x) & 0x3U) << 18)
+#define SRC_HIGH_ADDR_32G(x)	(((x) & 0x7U) << 11)
+#define DST_HIGH_ADDR_32G(x)	(((x) & 0x7U) << 15)
 
 /*
  * Various hardware related defines
@@ -257,6 +268,23 @@ static inline void sun6i_dma_dump_com_regs(struct sun6i_dma_dev *sdev)
 		DMA_STAT, readl(sdev->base + DMA_STAT));
 }
 
+static inline void sun6i_dma_dump_com_regs_a733(struct sun6i_dma_dev *sdev)
+{
+	int i;
+
+	for (i = 0; i < sdev->num_pchans / sdev->cfg->num_channels_per_reg; i++) {
+		dev_dbg(sdev->slave.dev, "Common register:\n"
+			"chan num %d\n"
+			"\tmask(%04x): 0x%08x\n"
+			"\tpend(%04x): 0x%08x\n"
+			"\tstats(%04x): 0x%08x\n",
+			i,
+			DMA_IRQ_EN_A733(i), readl(sdev->base + DMA_IRQ_EN_A733(i)),
+			DMA_IRQ_STAT_A733(i), readl(sdev->base + DMA_IRQ_STAT_A733(i)),
+			DMA_STAT, readl(sdev->base + DMA_STAT));
+	}
+}
+
 static inline void sun6i_dma_dump_chan_regs(struct sun6i_dma_dev *sdev,
 					    struct sun6i_pchan *pchan)
 {
@@ -360,21 +388,41 @@ static u32 sun6i_read_irq_en(struct sun6i_dma_dev *sdev, u32 irq_reg)
 	return readl(sdev->base + DMA_IRQ_EN(irq_reg));
 }
 
+static u32 sun6i_read_irq_en_a733(struct sun6i_dma_dev *sdev, u32 irq_reg)
+{
+	return readl(sdev->base + DMA_IRQ_EN_A733(irq_reg));
+}
+
 static void sun6i_write_irq_en(struct sun6i_dma_dev *sdev, u32 irq_reg, u32 irq_val)
 {
 	writel(irq_val, sdev->base + DMA_IRQ_EN(irq_reg));
 }
 
+static void sun6i_write_irq_en_a733(struct sun6i_dma_dev *sdev, u32 irq_reg, u32 irq_val)
+{
+	writel(irq_val, sdev->base + DMA_IRQ_EN_A733(irq_reg));
+}
+
 static u32 sun6i_read_irq_stat(struct sun6i_dma_dev *sdev, u32 irq_reg)
 {
 	return readl(sdev->base + DMA_IRQ_STAT(irq_reg));
 }
 
+static u32 sun6i_read_irq_stat_a733(struct sun6i_dma_dev *sdev, u32 irq_reg)
+{
+	return readl(sdev->base + DMA_IRQ_STAT_A733(irq_reg));
+}
+
 static void sun6i_write_irq_stat(struct sun6i_dma_dev *sdev, u32 irq_reg, u32 status)
 {
 	writel(status, sdev->base + DMA_IRQ_STAT(irq_reg));
 }
 
+static void sun6i_write_irq_stat_a733(struct sun6i_dma_dev *sdev, u32 irq_reg, u32 status)
+{
+	writel(status, sdev->base + DMA_IRQ_STAT_A733(irq_reg));
+}
+
 static size_t sun6i_get_chan_size(struct sun6i_pchan *pchan)
 {
 	struct sun6i_desc *txd = pchan->desc;
@@ -695,6 +743,17 @@ static void sun6i_dma_set_addr_a100(struct sun6i_dma_dev *sdev,
 				DST_HIGH_ADDR(upper_32_bits(dst));
 }
 
+static void sun6i_dma_set_addr_a733(struct sun6i_dma_dev *sdev,
+				      struct sun6i_dma_lli *v_lli,
+				      dma_addr_t src, dma_addr_t dst)
+{
+	v_lli->src = lower_32_bits(src);
+	v_lli->dst = lower_32_bits(dst);
+
+	v_lli->para |= SRC_HIGH_ADDR_32G(upper_32_bits(src)) |
+				DST_HIGH_ADDR_32G(upper_32_bits(dst));
+}
+
 static inline void sun6i_dma_set_addr(struct sun6i_dma_dev *sdev,
 				      struct sun6i_dma_lli *v_lli,
 				      dma_addr_t src, dma_addr_t dst)
@@ -1339,6 +1398,33 @@ static struct sun6i_dma_config sun50i_h6_dma_cfg = {
 	SUN6I_DMA_IRQ_A31_COMMON_OPS
 };
 
+/*
+ * The A733 binding uses the number of dma channels from the
+ * device tree node.
+ */
+static struct sun6i_dma_config sun60i_a733_dma_cfg = {
+	.clock_autogate_enable = sun6i_enable_clock_autogate_h3,
+	.set_burst_length = sun6i_set_burst_length_h3,
+	.set_drq          = sun6i_set_drq_h6,
+	.set_mode         = sun6i_set_mode_h6,
+	.set_addr         = sun6i_dma_set_addr_a733,
+	.dump_com_regs    = sun6i_dma_dump_com_regs_a733,
+	.read_irq_en      = sun6i_read_irq_en_a733,
+	.write_irq_en     = sun6i_write_irq_en_a733,
+	.read_irq_stat    = sun6i_read_irq_stat_a733,
+	.write_irq_stat   = sun6i_write_irq_stat_a733,
+	.src_burst_lengths = BIT(1) | BIT(4) | BIT(8) | BIT(16),
+	.dst_burst_lengths = BIT(1) | BIT(4) | BIT(8) | BIT(16),
+	.src_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
+			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
+			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
+	.dst_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
+			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
+			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
+	.num_channels_per_reg = DMA_IRQ_CHAN_NR_A733,
+	.has_mbus_clk = true,
+};
+
 /*
  * The V3s have only 8 physical channels, a maximum DRQ port id of 23,
  * and a total of 24 usable source and destination endpoints.
@@ -1375,6 +1461,7 @@ static const struct of_device_id sun6i_dma_match[] = {
 	{ .compatible = "allwinner,sun50i-a64-dma", .data = &sun50i_a64_dma_cfg },
 	{ .compatible = "allwinner,sun50i-a100-dma", .data = &sun50i_a100_dma_cfg },
 	{ .compatible = "allwinner,sun50i-h6-dma", .data = &sun50i_h6_dma_cfg },
+	{ .compatible = "allwinner,sun60i-a733-dma", .data = &sun60i_a733_dma_cfg },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, sun6i_dma_match);

-- 
2.54.0

