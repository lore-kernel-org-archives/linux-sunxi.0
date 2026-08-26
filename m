Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791862620DE
	for <linux-sunxi@lists.linux.dev>; Wed, 26 Aug 2026 01:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787707838; cv=none; b=ks0xgkSo5kq2mef3r0kTYWs5XQHbxDt/fL5caIQjXmFrcKAsI/h/YIo+J6iUYhC1vOw7ZZrTrGZD5Wd9ETCdpFrMV/ZqjSOpjwpgklkvhsqHtfrOo9pKuUP8tYFoKYVTF8w0oFUaXBzqVxXaag01gFXVqh85qkcIY8H69ulvk3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787707838; c=relaxed/simple;
	bh=iEeYpXVBs+6TjhynLsq72YEZrB4FSj6Ah2QNjNtJqLc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PRzZCydm7/CeazYUl+VsoRl8h6vMFd2Zz3NmmE4k/oug/yFESYyiTjHSWMt3gEIDe5yS7gz8GlqslAVr60jMBi9A94t6fASJXj4o3ocAJwYCFcvi27XkZlZM/cq0fZaVsMJRh7JfkDOP8H+54Hw6bOpK/hV8/3yoWGP/TGfCYWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lmqb7rJd; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lmqb7rJd"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-92e6a434cabso18018585a.1
        for <linux-sunxi@lists.linux.dev>; Tue, 25 Aug 2026 18:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787707830; x=1788312630; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+RELVhCB2dHvNU7KH92aA8UYXxthIHKWatUemcM2Bk0=;
        b=lmqb7rJdNOnbH3mTrBowXSHYQwLxrZBkvvTYjTIvW6infmFN6L+xe40me333khp4XG
         TMyhF6Lwcat4O25rIlWfsAs96Oz89mKdzK52DYslnt1vPzHvvQ3fX5Ilsj3UdB7Db7VO
         eZGAgSOimm0um1iKwiLT8BvFdsy92EdwJrGl8H/5s/fWW7uzTfutoA61su8x6j9jSPIa
         +qAcuVFgzW12WSh6Vt2FInZAsin3ZREEs8Oo7pbGdTeD4SHNLQcfTQduc4S25XahDxxw
         yey61sMPrlVaU/xXpnxKWAGJqvVCm4a34WSYkQE8orrUNSB9gUSxRILq6e2kf06d6yM7
         mzVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787707830; x=1788312630;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+RELVhCB2dHvNU7KH92aA8UYXxthIHKWatUemcM2Bk0=;
        b=NVsLAfbg4kPYwF5jemZRIeZ8bvRlPW19SfKlV2NQYuG3E0MOQ5anG6XrWjdoq06ipz
         4JkHw7LWC8GmS1MXhNVUYj+3NlBfA7ENmBBQ+saplI3M+vPb8GtWcriiq0Uegq8e/hz4
         e7qajMJrLd2bxPuArGqXP7oz43bgR8UPt8+zHPXQ5NHtUCzULs/JRcgKzNKVBujGynW0
         6H6m/iqNBOcGMr6jCIr6ZHXJKdzYnyfSZso1mwGmZEJTGCIIxt4myBzZcvIwjX9yAokG
         CP4mzRrpKGawvIg+pPWfxBy8ryynj6g4NmDxut4TeJUEeEI2nooHBsNxIjLfx8bhdWRO
         Z5rQ==
X-Forwarded-Encrypted: i=1; AHgh+RpEfpsNeb7/xRz+2Jj7tuwwRe2E5cQO0aGCUx8sI+/YSatPUs/vvE09Vm9tk1pQiY5gEqEcHN3h1mi5bQ==@lists.linux.dev
X-Gm-Message-State: AFuF++lWGRjzf2P8k85btrx4kzcW1sS2szqGnu3nYOswwc6w/0lWHxvO
	9k8/Cc5TxXozXLE2a3lyMnddQLQLy6u4iIiDwSmyRyX1FnE8i/UtdGTT
X-Gm-Gg: AR+sD13hOLTmDzEvdUJvf5xO1lkB3zHkrfakaGAFAysAawKiN34OuLgAmTefCjaoOO5
	9+FzMZ8XytONselZ9OXj1+4isANS9K0RU/NqjmyxDf/jVATekQpN0TBR69BlbXaDnokcpi3MvAw
	ISQsLYvbAoPfV81UU8EoDzgFr7UjZqwV6e6Vep3gK3886L7m/tjbn/F6AptzmJqN70MKHe1Bcw4
	85y0oh0pcqnwVisoqOgGUhdsYek4umNeQpLXxIwP6fJeVPBzGR1OOQNYbIFXAptCXnD2ObYBGkd
	GrMg92F1vpkFcVsPMXBpj45RqRsEGqL319MLG40B5+pLcj0Trcn1D6ihHar/bjcoPZIXAjsNash
	6+fHOWnW/oy4sljpuYF8DcmEVtDcE9fYGeg+v5yHX2IO2UHv1iPgOo4mYORshX/BySUHNnP6aUy
	R7o3hXufubhlAGSUhpOFTq9FYOsHgVBtNh29f+TnE2nBxk9Jn3AVLDDkNLOLPjBw==
X-Received: by 2002:a05:620a:8306:b0:937:11c9:37f1 with SMTP id af79cd13be357-9378015274emr224520185a.16.1787707830137;
        Tue, 25 Aug 2026 18:30:30 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9377e67c52csm102398585a.38.2026.08.25.18.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 18:30:29 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Wed, 26 Aug 2026 01:30:07 +0000
Subject: [PATCH v4 5/5] dmaengine: sun6i-dma: Add support for Allwinner
 A733 DMA controller
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-sun60i-a733-dma-v4-5-dc2f745f40dc@gmail.com>
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

Implement support for the Allwinner A733 DMA controller by defining
A733-specific register offsets, bitfield masks, and the
`sun60i_a733_dma_cfg` configuration structure.

This includes the IRQ stride, offsets, and channel counts specific to the
A733, as well as the 32G mask for high-address fields in the LLI. Add
`sun60i_a733_dma_cfg`, which ties all the refactored functionality
together for A733.

Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
 drivers/dma/sun6i-dma.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index b96d7d90f6b5..fb371b57d792 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -57,10 +57,14 @@
  * Interrupts specific registers
  */
 #define DMA_IRQ_STRIDE_A31		0x04
+#define DMA_IRQ_STRIDE_A733		0x40
 #define DMA_IRQ_EN_OFFSET_A31		0x00
+#define DMA_IRQ_EN_OFFSET_A733		0x134
 #define DMA_IRQ_STAT_OFFSET_A31		0x10
+#define DMA_IRQ_STAT_OFFSET_A733		0x138
 
 #define DMA_IRQ_CHAN_NR_A31		8
+#define DMA_IRQ_CHAN_NR_A733		1
 
 /*
  * Channels specific registers
@@ -110,6 +114,8 @@
  */
 #define SRC_HIGH_ADDR_MASK	GENMASK(17, 16)
 #define DST_HIGH_ADDR_MASK	GENMASK(19, 18)
+#define SRC_HIGH_ADDR_32G_MASK	GENMASK(13, 11)
+#define DST_HIGH_ADDR_32G_MASK	GENMASK(17, 15)
 
 /*
  * Various hardware related defines
@@ -1321,6 +1327,29 @@ static struct sun6i_dma_config sun50i_h6_dma_cfg = {
 	SUN6I_DMA_IRQ_A31_COMMON_CFG
 };
 
+/*
+ * The A733 binding uses the number of dma channels from the
+ * device tree node.
+ */
+static struct sun6i_dma_config sun60i_a733_dma_cfg = {
+	.clock_autogate_enable = sun6i_enable_clock_autogate_h3,
+	.src_burst_lengths = BIT(1) | BIT(4) | BIT(8) | BIT(16),
+	.dst_burst_lengths = BIT(1) | BIT(4) | BIT(8) | BIT(16),
+	.src_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
+			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
+			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
+	.dst_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
+			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
+			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
+	.src_high_addr_mask = SRC_HIGH_ADDR_32G_MASK,
+	.dst_high_addr_mask = DST_HIGH_ADDR_32G_MASK,
+	.has_mbus_clk = true,
+	.irq_stride      = DMA_IRQ_STRIDE_A733,
+	.irq_en_offset   = DMA_IRQ_EN_OFFSET_A733,
+	.irq_stat_offset = DMA_IRQ_STAT_OFFSET_A733,
+	.num_channels_per_reg = DMA_IRQ_CHAN_NR_A733,
+};
+
 /*
  * The V3s have only 8 physical channels, a maximum DRQ port id of 23,
  * and a total of 24 usable source and destination endpoints.
@@ -1355,6 +1384,7 @@ static const struct of_device_id sun6i_dma_match[] = {
 	{ .compatible = "allwinner,sun50i-a64-dma", .data = &sun50i_a64_dma_cfg },
 	{ .compatible = "allwinner,sun50i-a100-dma", .data = &sun50i_a100_dma_cfg },
 	{ .compatible = "allwinner,sun50i-h6-dma", .data = &sun50i_h6_dma_cfg },
+	{ .compatible = "allwinner,sun60i-a733-dma", .data = &sun60i_a733_dma_cfg },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, sun6i_dma_match);

-- 
2.55.0

