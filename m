Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3782E62B3
	for <linux-sunxi@lists.linux.dev>; Wed, 26 Aug 2026 02:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787712049; cv=none; b=Xu4e0GAELEk8vSOtLU6LOb08sBtStWCXFZk15XAvyICTNQAUIPOZNSMpt2WFkbXWE+W8pXc76wqiWbcI5Z0FqZriDlwVSAKmeqbems/CcJQkuYkODr83kKjWS4Hmu/JmGQhasuu+REal+mfN2d6NWDKqFQIW6PIh+EAA77nRqGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787712049; c=relaxed/simple;
	bh=Q/ba6rrz9Iw7+Y9A/qw1n7IqOmUJJcPITi7eRXxJZSc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gph+JMqvStjy0lEoarQ3L4tbQOBwfn9mE7SAWrRt9NlrejmhJp0PfKXnKXyXESlWRfmC0UzcEimg6dUS0HBVyxTyjSf4mUSgJeNDsaaBckLWkIlGi1AmderQ8mQJY7BXIekqM76jkmXm7h3k2Nj3sg146Fbx52DORw8xvwRa+JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dR0RKs88; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dR0RKs88"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-85845398586so715797b3.3
        for <linux-sunxi@lists.linux.dev>; Tue, 25 Aug 2026 19:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787712046; x=1788316846; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sFcQNAEgapc01hiKVhmrcgq3W/QfrjksyHpLfTytFFk=;
        b=dR0RKs88huIRB+vD4BCB3/HUxsO/HOOJ8m7ZOLRFNkDvrZmmXmXro50IbkMrbu3S8W
         3ZTHDFj8FrSA4sVKLpu4MbMZnAyw7yYrjkK9g3wAxQN+n9DExSU1BKJDUr8HLzwiH0pk
         O/cZA2KUzMaB5hWRFMrBpEeWbkDe6jjukIjubbJuWqhTQ9w4SdJkzzsOdlStdeCYkrS4
         q3uUcpXJrXVm9jSaoUWpYkaiS4PCEffStz2TQRjTjhxamaYBER7Ut3PUz8Nazypf8WmB
         uY2IUQrEkavuEN2NeCVEjqxElRw4uIKDMoQIGSx0oPdqFv67N+Pjb6oYf2eOE1yBEdp2
         Uh9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787712046; x=1788316846;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sFcQNAEgapc01hiKVhmrcgq3W/QfrjksyHpLfTytFFk=;
        b=a4EPIbReVs+pVdjLGFVNiUyovr4k/YsxMBfm/gwwzouMyhdcLD38gMIBoDPo+kpav1
         qnfyM3fIO/5B2tjmewyCybRE6tLZEa1m38r0aQ/Z3HS+DCKZLSvjkYXBf++jJJv7xGz1
         oB/IQOuGH/VIdJdUWs8EVxBpVj2Fq32wov57SCAyGCnVx8LHM8E2iRE4pE4T34l+qgF4
         Ypb9v/ufmogLdWO1GSK+jrs9hPxeEUO+OeFSbZPLpQF4rHbTKIQUjdQM/HIbOLTip1K0
         NrHF0reH3Rni9uXz19X1hSNxTxPDjTrhWMvBd/C3B+3jihse4vImLKFYEgDbPwoQpiBi
         vVFw==
X-Forwarded-Encrypted: i=1; AHgh+RqIavXqvx8ZKn521cePc5felclEYkraG6Z/q9oK2JO5BgFKjdU9hjK52MA6R7MmRPq1rlNSu3DOCXOvHQ==@lists.linux.dev
X-Gm-Message-State: AFuF++lz35izXCDP9Q0pFQsHsXraWBpdPkwmH6OURCE9m0XM5i+2AQiV
	aqcC4SmzNLmc1S0894DJuB5HeY8TCTWtJRXl7yfLKlrgJdsJ19yhbrK+
X-Gm-Gg: AR+sD13RkbRg/vutQClbrk5wlybFe6ofDUAM91rxYVEareu4qlr111P335px5Ng4UVc
	Ws4aptSFDI4l822vQJXMA+LXB0fh8DS3R4rXHgcdI68Bijmdx5HmTToG/L5W48EgMLqkUp7BdwD
	fnIsHHSeXc4hHLoLvOd6Dh4LQK+7JsCRWVocXoYujFb32NqQgYf9Ms6xjlEmmrhBQfgyiDzzdHU
	QHislkBRyMaAjsayBJQMC5xE/uZm73NdaX0sIR0oiHSirLnryoMn7x8LC1VwHUGzqTXXFQUs2NF
	OJ2HgZUNNllvEspzR78bF4CoPOS1rABt6g5gdA6GPqCVl52KXaY37r5pnNznSVcjm61RaJmsVaf
	YwNgWvYnRYxds8gCW2o3LYcm91a4Q2HxTPVJaE8sfQktI9jVGTH+RxQRdiFE7cPU6l6ai8bgLqB
	F78upG3oa3ktdD0Z8d+LspRNhQKOAHcY6COShvWZtQM3RXyE0a0xUKcGs3RSnb/w==
X-Received: by 2002:a05:690c:a583:b0:845:23cf:7c01 with SMTP id 00721157ae682-8573c7dfc2dmr13611677b3.10.1787712045994;
        Tue, 25 Aug 2026 19:40:45 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-857053839fdsm9976087b3.10.2026.08.25.19.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 19:40:45 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Wed, 26 Aug 2026 02:40:31 +0000
Subject: [PATCH v5 5/5] dmaengine: sun6i-dma: Implement support for
 Allwinner A733 DMA controller
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-sun60i-a733-dma-v5-5-abc5229b441e@gmail.com>
References: <20260826-sun60i-a733-dma-v5-0-abc5229b441e@gmail.com>
In-Reply-To: <20260826-sun60i-a733-dma-v5-0-abc5229b441e@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Yuanshen Cao <alex.caoys@gmail.com>
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
 drivers/dma/sun6i-dma.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index ffb63212bea7..66281e01972d 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -54,10 +54,14 @@
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
@@ -107,6 +111,8 @@
  */
 #define SRC_HIGH_ADDR_MASK	GENMASK(17, 16)
 #define DST_HIGH_ADDR_MASK	GENMASK(19, 18)
+#define SRC_HIGH_ADDR_32G_MASK	GENMASK(13, 11)
+#define DST_HIGH_ADDR_32G_MASK	GENMASK(17, 15)
 
 /*
  * Various hardware related defines
@@ -1318,6 +1324,32 @@ static struct sun6i_dma_config sun50i_h6_dma_cfg = {
 	SUN6I_DMA_IRQ_A31_COMMON_CFG
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
@@ -1352,6 +1384,7 @@ static const struct of_device_id sun6i_dma_match[] = {
 	{ .compatible = "allwinner,sun50i-a64-dma", .data = &sun50i_a64_dma_cfg },
 	{ .compatible = "allwinner,sun50i-a100-dma", .data = &sun50i_a100_dma_cfg },
 	{ .compatible = "allwinner,sun50i-h6-dma", .data = &sun50i_h6_dma_cfg },
+	{ .compatible = "allwinner,sun60i-a733-dma", .data = &sun60i_a733_dma_cfg },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, sun6i_dma_match);

-- 
2.55.0

