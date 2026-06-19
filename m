Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D9D3346A0
	for <linux-sunxi@lists.linux.dev>; Fri, 19 Jun 2026 04:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781844873; cv=none; b=UIvJtVDwehHcSbxC7uxnPiiTg40Csj4EUj7J9rlAXo7/y9D31HZ/l/bkL7xwhCh8UsUHBTDxqbiwTBw478OBPhDC3r5Ta6pe6DPkXHBl4tmtibkrSVPaKEitlK8XKrkKGPLHwfh7EsB8EED72+39j905dbDqHPD6kmpLjkQxoFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781844873; c=relaxed/simple;
	bh=dgeGyS+sC8NkGMnX16tGpIauM/4socL5tcePF9QgX6U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SVqOps3OK95bqhJqxSIdqm8JX8pUYh9WY1KpvplYXdIGRUtjoxqR/6vBGAJVkKCSvrOyKvIEE48lHYhjTR/4Mpxggn6ji+9egwHl2CIbOrhNMcKo9dDrvjuD/MONjptEqi2pkvPQSIXtt/aNf6fbRRXv8qd3Fu4Pi7bO2bUf+D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EcyMIiM1; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EcyMIiM1"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-9158643e538so156246885a.1
        for <linux-sunxi@lists.linux.dev>; Thu, 18 Jun 2026 21:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781844871; x=1782449671; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nu3ld+/x/4fnowny6tKRb6y8649sFddF48H2SIfvkLE=;
        b=EcyMIiM1lr365KnSvCGECX7FBYLV/MhJ4ct6zxJi4fqxAEjrRu7GZeALTQ7utM8BFq
         vboJK0O3OkQHvn5Vyr/D34XHLeOcvqTTK5shyU3sGOG/x5qCRqiGmHfpoVwn/S3HZAQ1
         vCLhd/WOTNU3A9NrZXIvc3N29N6oiJOvc+UMehopNGanrZct6zfYyqBAtRm7/AFJUK5Q
         AKJ0pwRKR/wb7dtKP6Y5+yDn2YH2PAiijcyA13HXTYKsp31h3O2xZpGOapjjSiL9nrgC
         jsNOQUUHfpCKNMGq2rAd0Yfa98HxfNvs1mqXhzma2nabr7WE0v5/p4ATwlOncVmaZFmc
         e61Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781844871; x=1782449671;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Nu3ld+/x/4fnowny6tKRb6y8649sFddF48H2SIfvkLE=;
        b=MlHJoW4mBeEQk4OcYCr/Kp8v7tQgF/Bd7BF5QecrYHuHTWFAXFy7TZpdwnhDiID4GN
         Bmbzj8Qye7FjpmwS9TDAt93qVaJ72VjAPgCGk6CCufuKsd4KVD+plmHhu6J/HY0f33Em
         wVrPs9qkO3prlsChMOuu8v52lycxZMksUtSe6hSJkoJn1eNmsxxsNB9xbqmT3gOIMktT
         hLJSQbfANdOgozVVzjkLuilz+s/bi20+yPlha2+1D8nP9ec8cSzK37lIzlr+u/251hnR
         m8jkky2lr32QBy17e2Hln8qRZ1fP0rhJ/CqGJxbDtYxmNyDITzu1m39TFvRYHC3IgU3b
         Xv2A==
X-Forwarded-Encrypted: i=1; AFNElJ8UlqsIWfP0IMOdPALiI0ZhWudPtKktlpRI85TqOQU+aNxQHktWogaa7ksbF2zmE+rQ5G+m9KxPiNj/8A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyCb5Mpn7cgyVwLqcpC69ryQ2vw3VbWm8zxo7eZ2FiVeJu5VXXB
	640rQMtQgpXjjHQMjhPmIkiP/QqgIgn9uvl/5FJlXpVBrCaTlekbDcXT
X-Gm-Gg: AfdE7ckrPCpne9kOh8EgwMMIqJZjqD5dMSIgHMe202kCHRHZb+a8wJWA5G1HqeOdvKq
	87YdY2CUNf2NjK4w9zjRuNG5i3Kq82Hin3ry/iQdovE8mzGeEJjVmxyJ+fXGYLEvwC1NNASXM31
	c3iVNGC0CFjyXl7/QdPfuvoGZ8dwQngPk9BTi6o3cVUSwJq2apJc2sd6HQNuco4GvHL2nFiFWP5
	VqjbRUW4/XlgvR878U0i/xc5af329naNLjt9vwGEc8RJ4RU1Z5PHFA3MrMxftcxdHn2qhNgzmVu
	zoEwXTPZXjI8yiuI4oFMPIBqN/EKxtUwUAjv0O0Z6j+eNg26BGSC/UZ35dm1kZtbn1DnQ/Bhinb
	/FwktG+8hYMxQNS9n16CGIg2CxOEw8yFqJZcS0ArQLD1oTMTxCXxNVGx2KuNm3r8nMsbtm8vRiJ
	qNTNgMPWPERybSqw==
X-Received: by 2002:a05:620a:4590:b0:915:a6ca:f12a with SMTP id af79cd13be357-920d480da3bmr150184285a.54.1781844870874;
        Thu, 18 Jun 2026 21:54:30 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-920a425448asm134464485a.23.2026.06.18.21.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 21:54:30 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Fri, 19 Jun 2026 04:53:31 +0000
Subject: [PATCH 2/5] dmaengine: sun6i-dma: Add set_addr function pointer
 for variable address widths
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-sun60i-a733-dma-v1-2-da4b649fc72a@gmail.com>
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

The A733 DMA controller supports higher address (up to 32G) compared to
previous generations. The existing `sun6i_dma_set_addr` function uses a
hardcoded logic for setting the high-address bits in the LLI parameters.

By moving `set_addr` into the `sun6i_dma_config` structure, we can
provide specialized implementations for different hardware. This allows
the A733 to use a version of `set_addr` that correctly handles its
specific `SRC_HIGH_ADDR_32G` and `DST_HIGH_ADDR_32G` in the `set_addr`
register later in the series.

Changes:
- Added `set_addr` function pointer to `struct sun6i_dma_config`.
- Refactored `sun6i_dma_set_addr` and introduced
  `sun6i_dma_set_addr_a100` (keeping the logic for high address
  support).
- Updated all existing configuration structs to include the new
  `set_addr` pointer.
- Removed `has_high_addr` since the logic is replaced by
  `sun6i_dma_set_addr_a100`.

Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
 drivers/dma/sun6i-dma.c | 36 ++++++++++++++++++++++++++----------
 1 file changed, 26 insertions(+), 10 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index d92e702320d9..059455425e19 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -112,6 +112,7 @@
 
 /* forward declaration */
 struct sun6i_dma_dev;
+struct sun6i_dma_lli;
 
 /*
  * Hardware channels / ports representation
@@ -138,6 +139,8 @@ struct sun6i_dma_config {
 	void (*set_burst_length)(u32 *p_cfg, s8 src_burst, s8 dst_burst);
 	void (*set_drq)(u32 *p_cfg, s8 src_drq, s8 dst_drq);
 	void (*set_mode)(u32 *p_cfg, s8 src_mode, s8 dst_mode);
+	void (*set_addr)(struct sun6i_dma_dev *sdev, struct sun6i_dma_lli *v_lli,
+		dma_addr_t src, dma_addr_t dst);
 	void (*dump_com_regs)(struct sun6i_dma_dev *sdev);
 	u32 (*read_irq_en)(struct sun6i_dma_dev *sdev, u32 chan_num);
 	void (*write_irq_en)(struct sun6i_dma_dev *sdev, u32 chan_num, u32 irq_val);
@@ -147,7 +150,6 @@ struct sun6i_dma_config {
 	u32 dst_burst_lengths;
 	u32 src_addr_widths;
 	u32 dst_addr_widths;
-	bool has_high_addr;
 	bool has_mbus_clk;
 };
 
@@ -675,13 +677,20 @@ static int set_config(struct sun6i_dma_dev *sdev,
 static inline void sun6i_dma_set_addr(struct sun6i_dma_dev *sdev,
 				      struct sun6i_dma_lli *v_lli,
 				      dma_addr_t src, dma_addr_t dst)
+{
+	v_lli->src = lower_32_bits(src);
+	v_lli->dst = lower_32_bits(dst);
+}
+
+static inline void sun6i_dma_set_addr_a100(struct sun6i_dma_dev *sdev,
+				      struct sun6i_dma_lli *v_lli,
+				      dma_addr_t src, dma_addr_t dst)
 {
 	v_lli->src = lower_32_bits(src);
 	v_lli->dst = lower_32_bits(dst);
 
-	if (sdev->cfg->has_high_addr)
-		v_lli->para |= SRC_HIGH_ADDR(upper_32_bits(src)) |
-			       DST_HIGH_ADDR(upper_32_bits(dst));
+	v_lli->para |= SRC_HIGH_ADDR(upper_32_bits(src)) |
+				DST_HIGH_ADDR(upper_32_bits(dst));
 }
 
 static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_memcpy(
@@ -714,7 +723,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_memcpy(
 
 	v_lli->len = len;
 	v_lli->para = NORMAL_WAIT;
-	sun6i_dma_set_addr(sdev, v_lli, src, dest);
+	sdev->cfg->set_addr(sdev, v_lli, src, dest);
 
 	burst = convert_burst(8);
 	width = convert_buswidth(DMA_SLAVE_BUSWIDTH_4_BYTES);
@@ -773,7 +782,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_slave_sg(
 		v_lli->para = NORMAL_WAIT;
 
 		if (dir == DMA_MEM_TO_DEV) {
-			sun6i_dma_set_addr(sdev, v_lli,
+			sdev->cfg->set_addr(sdev, v_lli,
 					   sg_dma_address(sg),
 					   sconfig->dst_addr);
 			v_lli->cfg = lli_cfg;
@@ -787,7 +796,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_slave_sg(
 				sg_dma_len(sg), flags);
 
 		} else {
-			sun6i_dma_set_addr(sdev, v_lli,
+			sdev->cfg->set_addr(sdev, v_lli,
 					   sconfig->src_addr,
 					   sg_dma_address(sg));
 			v_lli->cfg = lli_cfg;
@@ -858,7 +867,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_cyclic(
 		v_lli->para = NORMAL_WAIT;
 
 		if (dir == DMA_MEM_TO_DEV) {
-			sun6i_dma_set_addr(sdev, v_lli,
+			sdev->cfg->set_addr(sdev, v_lli,
 					   buf_addr + period_len * i,
 					   sconfig->dst_addr);
 			v_lli->cfg = lli_cfg;
@@ -870,7 +879,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_cyclic(
 				&sconfig->dst_addr, &buf_addr,
 				buf_len, flags);
 		} else {
-			sun6i_dma_set_addr(sdev, v_lli,
+			sdev->cfg->set_addr(sdev, v_lli,
 					   sconfig->src_addr,
 					   buf_addr + period_len * i);
 			v_lli->cfg = lli_cfg;
@@ -1148,6 +1157,7 @@ static struct sun6i_dma_config sun6i_a31_dma_cfg = {
 	.set_burst_length = sun6i_set_burst_length_a31,
 	.set_drq          = sun6i_set_drq_a31,
 	.set_mode         = sun6i_set_mode_a31,
+	.set_addr         = sun6i_dma_set_addr,
 	.dump_com_regs    = sun6i_dma_dump_com_regs,
 	.read_irq_en      = sun6i_read_irq_en,
 	.write_irq_en     = sun6i_write_irq_en,
@@ -1176,6 +1186,7 @@ static struct sun6i_dma_config sun8i_a23_dma_cfg = {
 	.set_burst_length = sun6i_set_burst_length_a31,
 	.set_drq          = sun6i_set_drq_a31,
 	.set_mode         = sun6i_set_mode_a31,
+	.set_addr         = sun6i_dma_set_addr,
 	.dump_com_regs    = sun6i_dma_dump_com_regs,
 	.read_irq_en      = sun6i_read_irq_en,
 	.write_irq_en     = sun6i_write_irq_en,
@@ -1199,6 +1210,7 @@ static struct sun6i_dma_config sun8i_a83t_dma_cfg = {
 	.set_burst_length = sun6i_set_burst_length_a31,
 	.set_drq          = sun6i_set_drq_a31,
 	.set_mode         = sun6i_set_mode_a31,
+	.set_addr         = sun6i_dma_set_addr,
 	.dump_com_regs    = sun6i_dma_dump_com_regs,
 	.read_irq_en      = sun6i_read_irq_en,
 	.write_irq_en     = sun6i_write_irq_en,
@@ -1229,6 +1241,7 @@ static struct sun6i_dma_config sun8i_h3_dma_cfg = {
 	.set_burst_length = sun6i_set_burst_length_h3,
 	.set_drq          = sun6i_set_drq_a31,
 	.set_mode         = sun6i_set_mode_a31,
+	.set_addr         = sun6i_dma_set_addr,
 	.dump_com_regs    = sun6i_dma_dump_com_regs,
 	.read_irq_en      = sun6i_read_irq_en,
 	.write_irq_en     = sun6i_write_irq_en,
@@ -1255,6 +1268,7 @@ static struct sun6i_dma_config sun50i_a64_dma_cfg = {
 	.set_burst_length = sun6i_set_burst_length_h3,
 	.set_drq          = sun6i_set_drq_a31,
 	.set_mode         = sun6i_set_mode_a31,
+	.set_addr         = sun6i_dma_set_addr,
 	.dump_com_regs    = sun6i_dma_dump_com_regs,
 	.read_irq_en      = sun6i_read_irq_en,
 	.write_irq_en     = sun6i_write_irq_en,
@@ -1281,6 +1295,7 @@ static struct sun6i_dma_config sun50i_a100_dma_cfg = {
 	.set_burst_length = sun6i_set_burst_length_h3,
 	.set_drq          = sun6i_set_drq_h6,
 	.set_mode         = sun6i_set_mode_h6,
+	.set_addr         = sun6i_dma_set_addr_a100,
 	.dump_com_regs    = sun6i_dma_dump_com_regs,
 	.read_irq_en      = sun6i_read_irq_en,
 	.write_irq_en     = sun6i_write_irq_en,
@@ -1296,7 +1311,6 @@ static struct sun6i_dma_config sun50i_a100_dma_cfg = {
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_8_BYTES),
-	.has_high_addr = true,
 	.has_mbus_clk = true,
 };
 
@@ -1309,6 +1323,7 @@ static struct sun6i_dma_config sun50i_h6_dma_cfg = {
 	.set_burst_length = sun6i_set_burst_length_h3,
 	.set_drq          = sun6i_set_drq_h6,
 	.set_mode         = sun6i_set_mode_h6,
+	.set_addr         = sun6i_dma_set_addr,
 	.dump_com_regs    = sun6i_dma_dump_com_regs,
 	.read_irq_en      = sun6i_read_irq_en,
 	.write_irq_en     = sun6i_write_irq_en,
@@ -1340,6 +1355,7 @@ static struct sun6i_dma_config sun8i_v3s_dma_cfg = {
 	.set_burst_length = sun6i_set_burst_length_a31,
 	.set_drq          = sun6i_set_drq_a31,
 	.set_mode         = sun6i_set_mode_a31,
+	.set_addr         = sun6i_dma_set_addr,
 	.dump_com_regs    = sun6i_dma_dump_com_regs,
 	.read_irq_en      = sun6i_read_irq_en,
 	.write_irq_en     = sun6i_write_irq_en,

-- 
2.54.0

