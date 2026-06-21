Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8CF371CEC
	for <linux-sunxi@lists.linux.dev>; Sun, 21 Jun 2026 21:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782078094; cv=none; b=P7Rd3uuQjpnw0+8OdvxJg1z7aiXyN0DEbBiLcmKhjU0hPD1A9yjbU9J+GOOsbG8wBzsLDm81Ib34oI0AOhVAZ58yjIMYwoS/xEDKrM+WWuoWmOrIE0OEr3Z6majHfYSkLhucAJOIU0H6qjwEBgyUAMPLapHPz3xHAlw1VjMlflM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782078094; c=relaxed/simple;
	bh=dQJRxOtJBIdsX16Td7qmdew1G14whihD+vf5uq3M+Yk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oZObZPyTq9MMHn+NE1xlM6Neig4ZP//ThjMwrqEjKeYuM0SeeS3vZD62uDfUfyRXpjxXOg8EHflsRKVH2TqMaII4zeC7JgAlL2Jw3oFerxHZY8SEEcTbrVUr1pQz4oktXiaONi4eXSMt0BDy70WmPQv9i8Xb5e9Dp/en34EU7Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ckg0/mSi; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ckg0/mSi"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8de2adc59d8so29341606d6.1
        for <linux-sunxi@lists.linux.dev>; Sun, 21 Jun 2026 14:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782078092; x=1782682892; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gDRD6LBgJnjsi6QsqIJwMXkO05zRf+ayGk9t0C1JISo=;
        b=ckg0/mSiqXczLZwGrJEJzuu99OAJzU/i/g3g5KrJMIZdVSrJfsaYc3XphCO7ALXZ3p
         T51E5Uz1q94ojbFTecVXE7EYXA2w7QdJR+SZaYxn5lXN/0GACqVIWBTL5Qr4PLMZrtpb
         +yhpNkcd3EdAbBARVmni/Ulb5KgHzKPH41kgmlsfj0bh7Ble+krcmdChoEEQ5DXBh/Cj
         ojDc+adoZBXmlhLeO6OKsfn13QhpKYXDoD0WG79InZb2Rh2owW9aSccnYu/eYPBJyDK1
         tF5k8V5QVUPhmNDQa/rVLnockCwR93bdTIMulO2adqEso3Lol0l1wWL5YCvojakWnLPp
         hhzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782078092; x=1782682892;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gDRD6LBgJnjsi6QsqIJwMXkO05zRf+ayGk9t0C1JISo=;
        b=glHB0i/2/M3WD2v1zm9HhsuzkTh8X7g1GWUz4pyAdXEubLlUveIdtHlgoznJRtJqvY
         MA91QtweMtnixM2WYJJwKQip77TGbv3mFWJdi3wsWbQJudt8pNG1kXJFQMPBJAbkcoNz
         hcF4Ayq8mr9XfSJmxbLN1qcvJONq1472DHNpkzWtwuh8XMZT/7RH01nB5unOS4tEFCKh
         9RiTGswWrpgZChOlnckg56tc6pJ4EMzE7IxA/gDXJrU2r6CvpL/t5jCNOXKASeNkbQH6
         cURGWpzR7WcXv7WX8SqftHdiGgakLb1C6W6E02/12a6K5KO/F1iEae74O178Xq6SDvgr
         XhEg==
X-Forwarded-Encrypted: i=1; AHgh+RqBFaLGAukT7QmSYF4xazR7K0gpUSvn83iHu35DQOslLoAIYmo8gQh2WrVPtdcc5F/50efJ/krrn+H1Rg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzuBhOVQlZwYovsOugO15bA7pALU4ME1N7tDP9BZ9C1qNAMelgq
	gy+mn6K+zzIpTl5tBfExIoj4twPq2/igRRZwvVhhC/ZuNsf1V39eHXan
X-Gm-Gg: AfdE7cmvqCV7VxfUAP4OTTISUuxDmCzUgfu+JU5UixaTaawMog+J3gePJIuNSFZcdDd
	CWJComPZhKI3HarXb/YnWzRWc++1ya3Ft2oOAtX2atbq2c/7UzyK0ZlPY+GLI4FVEZF3dqwts3j
	3ofh6osfgD2uYPxw98qHCZbTfr761OKt0LjawZGBBg6uHzEVJHgvHooAzOMWl3hATdjsOBLqVQW
	JiFSt38vvzd3WGhTxyLNsI3ESe+a31AlLxGW/9dyt9I6z+Gq4w7Rr6JyagnoT+yPic8QfjKEsjD
	ZUN5nPPHzOUX0j92Bd4R70aTNlO+mCkHF7g3Z66+Nwh+dmp3QvhX53Uc0SPKMv+airboCQZPwq4
	RX1f4Hh8Hnbs1n8C9JamM3ksDUtrwCFQ/vS5SKL83VV+O035f4D6OSSJwhjdj3CwjfX8/8rPu+1
	yNOZAJ/VooRj/FUA==
X-Received: by 2002:a0c:e004:0:b0:8cc:f3a0:20aa with SMTP id 6a1803df08f44-8de4c46b4admr132602906d6.20.1782078091871;
        Sun, 21 Jun 2026 14:41:31 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df81cde9ecsm76274676d6.24.2026.06.21.14.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 14:41:31 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Sun, 21 Jun 2026 21:40:55 +0000
Subject: [PATCH v2 2/5] dmaengine: sun6i-dma: Add set_addr function pointer
 for variable address widths
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260621-sun60i-a733-dma-v2-2-340f205891cc@gmail.com>
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
  `sun6i_dma_set_addr_a31/a100` (keeping the logic for previous
  generations).
- Updated all existing configuration structs to include the new
  `set_addr` pointer.
- Removed `has_high_addr` since the logic is replaced by
  `sun6i_dma_set_addr_a100`.

Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
 drivers/dma/sun6i-dma.c | 35 +++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index ef3052c4ab36..9984b9033cbb 100644
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
 	u32 (*read_irq_en)(struct sun6i_dma_dev *sdev, u32 irq_reg);
 	void (*write_irq_en)(struct sun6i_dma_dev *sdev, u32 irq_reg, u32 irq_val);
@@ -147,7 +150,6 @@ struct sun6i_dma_config {
 	u32 dst_burst_lengths;
 	u32 src_addr_widths;
 	u32 dst_addr_widths;
-	bool has_high_addr;
 	bool has_mbus_clk;
 };
 
@@ -673,16 +675,30 @@ static int set_config(struct sun6i_dma_dev *sdev,
 	return 0;
 }
 
-static inline void sun6i_dma_set_addr(struct sun6i_dma_dev *sdev,
+static void sun6i_dma_set_addr_a31(struct sun6i_dma_dev *sdev,
+				      struct sun6i_dma_lli *v_lli,
+				      dma_addr_t src, dma_addr_t dst)
+{
+	v_lli->src = lower_32_bits(src);
+	v_lli->dst = lower_32_bits(dst);
+}
+
+static void sun6i_dma_set_addr_a100(struct sun6i_dma_dev *sdev,
 				      struct sun6i_dma_lli *v_lli,
 				      dma_addr_t src, dma_addr_t dst)
 {
 	v_lli->src = lower_32_bits(src);
 	v_lli->dst = lower_32_bits(dst);
 
-	if (sdev->cfg->has_high_addr)
-		v_lli->para |= SRC_HIGH_ADDR(upper_32_bits(src)) |
-			       DST_HIGH_ADDR(upper_32_bits(dst));
+	v_lli->para |= SRC_HIGH_ADDR(upper_32_bits(src)) |
+				DST_HIGH_ADDR(upper_32_bits(dst));
+}
+
+static inline void sun6i_dma_set_addr(struct sun6i_dma_dev *sdev,
+				      struct sun6i_dma_lli *v_lli,
+				      dma_addr_t src, dma_addr_t dst)
+{
+	sdev->cfg->set_addr(sdev, v_lli, src, dst);
 }
 
 static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_memcpy(
@@ -1156,6 +1172,7 @@ static struct sun6i_dma_config sun6i_a31_dma_cfg = {
 	.set_burst_length = sun6i_set_burst_length_a31,
 	.set_drq          = sun6i_set_drq_a31,
 	.set_mode         = sun6i_set_mode_a31,
+	.set_addr         = sun6i_dma_set_addr_a31,
 	.src_burst_lengths = BIT(1) | BIT(8),
 	.dst_burst_lengths = BIT(1) | BIT(8),
 	.src_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
@@ -1180,6 +1197,7 @@ static struct sun6i_dma_config sun8i_a23_dma_cfg = {
 	.set_burst_length = sun6i_set_burst_length_a31,
 	.set_drq          = sun6i_set_drq_a31,
 	.set_mode         = sun6i_set_mode_a31,
+	.set_addr         = sun6i_dma_set_addr_a31,
 	.src_burst_lengths = BIT(1) | BIT(8),
 	.dst_burst_lengths = BIT(1) | BIT(8),
 	.src_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
@@ -1199,6 +1217,7 @@ static struct sun6i_dma_config sun8i_a83t_dma_cfg = {
 	.set_burst_length = sun6i_set_burst_length_a31,
 	.set_drq          = sun6i_set_drq_a31,
 	.set_mode         = sun6i_set_mode_a31,
+	.set_addr         = sun6i_dma_set_addr_a31,
 	.src_burst_lengths = BIT(1) | BIT(8),
 	.dst_burst_lengths = BIT(1) | BIT(8),
 	.src_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
@@ -1225,6 +1244,7 @@ static struct sun6i_dma_config sun8i_h3_dma_cfg = {
 	.set_burst_length = sun6i_set_burst_length_h3,
 	.set_drq          = sun6i_set_drq_a31,
 	.set_mode         = sun6i_set_mode_a31,
+	.set_addr         = sun6i_dma_set_addr_a31,
 	.src_burst_lengths = BIT(1) | BIT(4) | BIT(8) | BIT(16),
 	.dst_burst_lengths = BIT(1) | BIT(4) | BIT(8) | BIT(16),
 	.src_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
@@ -1247,6 +1267,7 @@ static struct sun6i_dma_config sun50i_a64_dma_cfg = {
 	.set_burst_length = sun6i_set_burst_length_h3,
 	.set_drq          = sun6i_set_drq_a31,
 	.set_mode         = sun6i_set_mode_a31,
+	.set_addr         = sun6i_dma_set_addr_a31,
 	.src_burst_lengths = BIT(1) | BIT(4) | BIT(8) | BIT(16),
 	.dst_burst_lengths = BIT(1) | BIT(4) | BIT(8) | BIT(16),
 	.src_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
@@ -1269,6 +1290,7 @@ static struct sun6i_dma_config sun50i_a100_dma_cfg = {
 	.set_burst_length = sun6i_set_burst_length_h3,
 	.set_drq          = sun6i_set_drq_h6,
 	.set_mode         = sun6i_set_mode_h6,
+	.set_addr         = sun6i_dma_set_addr_a100,
 	.src_burst_lengths = BIT(1) | BIT(4) | BIT(8) | BIT(16),
 	.dst_burst_lengths = BIT(1) | BIT(4) | BIT(8) | BIT(16),
 	.src_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
@@ -1279,7 +1301,6 @@ static struct sun6i_dma_config sun50i_a100_dma_cfg = {
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_8_BYTES),
-	.has_high_addr = true,
 	.has_mbus_clk = true,
 	SUN6I_DMA_IRQ_A31_COMMON_OPS
 };
@@ -1293,6 +1314,7 @@ static struct sun6i_dma_config sun50i_h6_dma_cfg = {
 	.set_burst_length = sun6i_set_burst_length_h3,
 	.set_drq          = sun6i_set_drq_h6,
 	.set_mode         = sun6i_set_mode_h6,
+	.set_addr         = sun6i_dma_set_addr_a31,
 	.src_burst_lengths = BIT(1) | BIT(4) | BIT(8) | BIT(16),
 	.dst_burst_lengths = BIT(1) | BIT(4) | BIT(8) | BIT(16),
 	.src_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
@@ -1320,6 +1342,7 @@ static struct sun6i_dma_config sun8i_v3s_dma_cfg = {
 	.set_burst_length = sun6i_set_burst_length_a31,
 	.set_drq          = sun6i_set_drq_a31,
 	.set_mode         = sun6i_set_mode_a31,
+	.set_addr         = sun6i_dma_set_addr_a31,
 	.src_burst_lengths = BIT(1) | BIT(8),
 	.dst_burst_lengths = BIT(1) | BIT(8),
 	.src_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |

-- 
2.54.0

