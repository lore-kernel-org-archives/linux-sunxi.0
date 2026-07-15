Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51150385D96
	for <linux-sunxi@lists.linux.dev>; Wed, 15 Jul 2026 16:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784132711; cv=none; b=sggAf8yWrzhlDeZWvo9TIUX5z9qDLD/XU+eTS0+mvAhGRFTaZpS0E72jiEByOgEhGXcfg26aLa95pTgc/riiOOddoPwCgImOyBUzmv7RisE4iSe8mw3klsEXWG9K2Ac/pjPUyNa9JDw8knH1dHqCvb36dUEt8HMh3+6lKTTvP+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784132711; c=relaxed/simple;
	bh=USAM4Ga0MygeCysRq+E0XdtCeOkWf9ljqdPjJJMRvLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k5nlqqXloMA1nGWqvTJNZ0Tbbu4MKDUGfGaFGkT4DNLFtJDWtYmwlOgMEIBn67/kHZLBGY//SU0KnBFZ2Xk/C1JRWoz3cLdezN/WCCMXbppASeKNqjQ8HNKPpbvTkC98eEPWvAZGxDM5iS5X+NUCikHKMI12eZchOA1wQaMIeQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GuSXh+zz; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GuSXh+zz"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7e9eaf04bfaso2091576a34.1
        for <linux-sunxi@lists.linux.dev>; Wed, 15 Jul 2026 09:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784132709; x=1784737509; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9097m1/8Cd7swATAUXouQoSjo89AYWrjWVI5qB+z/6Q=;
        b=GuSXh+zzd7kKQ69bRCz0kH0KSDwsM1OQ/dKTyHTzktNybX5ukiu+3I9H0FsxIi+B4s
         t/NdvM41mF2qR3TX9zwi9XfaqGPrhrr/x+TG6tpgSQG87ZqfDIodh1gedj8q3du16UNb
         YvhR2sC0evTAarU4vG+Y3AKNT2+SYR1M5UPzwHmmjL3Pe+oL55Jf0Acl7nKeLzEGc+NT
         paR4eCC5D/4TuECdtUMs7MH+u+gVO0ubk/VnjW1w3cgzXcNDOSGnEc/AZt2RkQ39B+Yf
         x+EVia1elnihZsy7/W8cYggJIK6QAFLzmOhtd/tEOfalZjPS44NuLPF1NhoMix843AcD
         isfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784132709; x=1784737509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9097m1/8Cd7swATAUXouQoSjo89AYWrjWVI5qB+z/6Q=;
        b=ChUGy5syjCgYDoXfokymBKmrV/Gr7XkzIQo2Ks24FAbrJEYNJ7dgxXgfYjDDYaAoyZ
         4egACmEWnVBE1QSbLMrqOTnH/L4eNOfjpBmGOK58hCwwQBOG6HxD5O1g1n1xn10xZE+i
         2yeK23OJoYwyC23BexfUKC+Hp6G6QbqsUd9rUTbAfI6A+OTaSmwbaS2KNdXOAzJD5dKk
         4wQadI5NA6ZV39SIRSjlUK7E8TWRXW9ytH7ZBcpRfxCYKNwUAc6UP8OSrfOpN/YKZAL1
         +kzmz3W/X15snLRsg7iSS3Aam51DEKK5qGWyLEB28SrhXAXnHV/ELfmoCrLW07HlNCAc
         OPag==
X-Forwarded-Encrypted: i=1; AHgh+RqZecFKqwuMtkF9FkWCu4kgGDNjMKiCwDBjgIZVN/j7sAS7Dx0k1HgBQAIkDSTFI6JKEA5wX7DjZ0YjVg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwREdaqecbkZO7HDyvV9j7mCicOLbtnkO8Eqzp8xO0PaDCSvUcE
	00Rd+3K7j0UEAZIErkYyWVPR46BC0AUc5pqh9pB1FicvcDY2PGpspFUy
X-Gm-Gg: AfdE7cmKMo4n2cBDdBPEcG3BLkLrPJv2ZOiE77fpJpOz/KQt6TDfuqtWbrixXqVmhKa
	KW2p7hPuaUWFwCc96sxEFccnW0/VPeHYZt1MVQMI+KqrcDHg8i6U1YA2Qh+b0T4gYUpR6cTkhAv
	W9woanQ6nnJ273wY4wp+CHVrG9XvBfgX03WN8xVfhnMAb0vDUqcaiW+tojp7QMpFATLcerIdG1v
	CA5o/ng5L80rfTzKuwPD7sqNhOFWbjKvKTPy5KBukAhb1fvJ7e0FFIp71SUS2PXVGzocaTbdfWL
	sX6+pvQe6ersPYq/x4N5wK4StKWbRHKyivifU7MpcSlp8IVaOiL6g8vRYYiBPHnVB8OWTFp0U5u
	I+0sj/6Z1vsX8RCPOpscVFP95sjklqCHchqi1R0FtHlTdN9bNnR7gTQ1GqYKED3Fl9pkdx3sUYj
	Qr5HkW+Bl8uEaJIK4D8fx7EkhDWrUl83LSVZcBrv3Jk11+6dO2yMBth4WF0R1+sqJiU1IKoxmAx
	SZok438oS2QbMH7LA6u9jLDL+xOHK9NROJu7s2b1G6cAKCdu6hr4JTSWcOD2FUPZ44gF05fWIX3
	uNzQ7YCo+g==
X-Received: by 2002:a05:6830:82be:b0:7e6:cec2:a4a5 with SMTP id 46e09a7af769-7ec59d2077bmr1767328a34.20.1784132708902;
        Wed, 15 Jul 2026 09:25:08 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-11-8.hlrn.qwest.net. [174.29.11.8])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcaf77ba4sm17606398a34.9.2026.07.15.09.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 09:25:07 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: linux-mtd@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: James Hilliard <james.hilliard1@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: rawnand: sunxi: add H616 MBUS DMA support
Date: Wed, 15 Jul 2026 10:24:40 -0600
Message-ID: <20260715162444.789303-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The H616 NAND controller uses a descriptor-based internal MBUS DMA
engine instead of the direct address and count registers used by the
A23/A33 controller. Since the driver does not support these descriptors,
it currently attempts to request an external rxtx DMA channel and falls
back to PIO when none is provided.

Add a single-descriptor backend to the existing ECC page DMA paths.
Allocate the descriptor coherently, constrain data mappings to the
controller's 32-bit address range, program the H6-style data block mask,
and request an interrupt for both command and DMA completion. Keep the
existing external DMA and legacy MBUS DMA paths unchanged, and fall back
to PIO if the descriptor cannot be allocated.

Hardware testing on an H616 board with 2 KiB-page SLC NAND
confirmed that the descriptor path improves sustained read throughput.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 110 ++++++++++++++++++++++++++----
 1 file changed, 95 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 02647565c8ba..8a136b9fa7cc 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -79,6 +79,10 @@
 #define NFC_REG_H6_MDMA_BUF_ADDR 0x0210
 #define NFC_REG_H6_MDMA_CNT	0x0214
 
+#define NFC_MDMA_DESC_LAST	BIT(2)
+#define NFC_MDMA_DESC_FIRST	BIT(3)
+#define NFC_MDMA_DESC_SIZE_MASK	GENMASK(15, 0)
+
 #define NFC_RAM0_BASE		0x0400
 #define NFC_RAM1_BASE		0x0800
 
@@ -267,12 +271,19 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
 	return container_of(nand, struct sunxi_nand_chip, nand);
 }
 
+struct sunxi_nfc_mdma_desc {
+	__le32 config;
+	__le32 size;
+	__le32 buf;
+	__le32 next;
+};
+
 /*
  * NAND Controller capabilities structure: stores NAND controller capabilities
  * for distinction between compatible strings.
  *
- * @has_mdma:		Use mbus dma mode, otherwise general dma
- *			through MBUS on A23/A33 needs extra configuration.
+ * @has_mdma:		Use A23/A33-style MBUS DMA registers
+ * @has_mdma_desc:	MBUS DMA uses H6-style descriptors
  * @has_ecc_block_512:	If the ECC can handle 512B or only 1024B chunks
  * @has_ecc_clk:	If the controller needs an ECC clock.
  * @has_mbus_clk:	If the controller needs a mbus clock.
@@ -304,6 +315,7 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
  */
 struct sunxi_nfc_caps {
 	bool has_mdma;
+	bool has_mdma_desc;
 	bool has_ecc_block_512;
 	bool has_ecc_clk;
 	bool has_mbus_clk;
@@ -346,6 +358,8 @@ struct sunxi_nfc_caps {
  *	   controller
  * @complete: a completion object used to wait for NAND controller events
  * @dmac: the DMA channel attached to the NAND controller
+ * @mdma_desc: H6-style MBUS DMA descriptor
+ * @mdma_desc_dma: DMA address of @mdma_desc
  * @caps: NAND Controller capabilities
  */
 struct sunxi_nfc {
@@ -362,6 +376,8 @@ struct sunxi_nfc {
 	struct list_head chips;
 	struct completion complete;
 	struct dma_chan *dmac;
+	struct sunxi_nfc_mdma_desc *mdma_desc;
+	dma_addr_t mdma_desc_dma;
 	const struct sunxi_nfc_caps *caps;
 };
 
@@ -370,6 +386,11 @@ static inline struct sunxi_nfc *to_sunxi_nfc(struct nand_controller *ctrl)
 	return container_of(ctrl, struct sunxi_nfc, controller);
 }
 
+static bool sunxi_nfc_uses_mdma(const struct sunxi_nfc *nfc)
+{
+	return nfc->caps->has_mdma || nfc->mdma_desc;
+}
+
 static irqreturn_t sunxi_nfc_interrupt(int irq, void *dev_id)
 {
 	struct sunxi_nfc *nfc = dev_id;
@@ -466,7 +487,9 @@ static int sunxi_nfc_dma_op_prepare(struct sunxi_nfc *nfc, const void *buf,
 {
 	struct dma_async_tx_descriptor *dmad;
 	enum dma_transfer_direction tdir;
+	dma_addr_t buf_dma;
 	dma_cookie_t dmat;
+	int len = chunksize * nchunks;
 	int ret;
 
 	if (ddir == DMA_FROM_DEVICE)
@@ -474,12 +497,21 @@ static int sunxi_nfc_dma_op_prepare(struct sunxi_nfc *nfc, const void *buf,
 	else
 		tdir = DMA_MEM_TO_DEV;
 
-	sg_init_one(sg, buf, nchunks * chunksize);
+	sg_init_one(sg, buf, len);
 	ret = dma_map_sg(nfc->dev, sg, 1, ddir);
 	if (!ret)
 		return -ENOMEM;
 
-	if (!nfc->caps->has_mdma) {
+	buf_dma = sg_dma_address(sg);
+
+	if (nfc->mdma_desc &&
+	    (len > NFC_MDMA_DESC_SIZE_MASK || !IS_ALIGNED(len, 8) ||
+	     !IS_ALIGNED(buf_dma, 4) || upper_32_bits(buf_dma))) {
+		ret = -EINVAL;
+		goto err_unmap_buf;
+	}
+
+	if (!sunxi_nfc_uses_mdma(nfc)) {
 		dmad = dmaengine_prep_slave_sg(nfc->dmac, sg, 1, tdir, DMA_CTRL_ACK);
 		if (!dmad) {
 			ret = -EINVAL;
@@ -489,14 +521,30 @@ static int sunxi_nfc_dma_op_prepare(struct sunxi_nfc *nfc, const void *buf,
 
 	writel(readl(nfc->regs + NFC_REG_CTL) | NFC_RAM_METHOD,
 	       nfc->regs + NFC_REG_CTL);
-	writel(nchunks, nfc->regs + NFC_REG_SECTOR_NUM);
+	writel(nfc->mdma_desc ? GENMASK(nchunks - 1, 0) : nchunks,
+	       nfc->regs + NFC_REG_SECTOR_NUM);
 	writel(chunksize, nfc->regs + NFC_REG_CNT);
 
-	if (nfc->caps->has_mdma) {
+	if (sunxi_nfc_uses_mdma(nfc))
 		writel(readl(nfc->regs + NFC_REG_CTL) & ~NFC_DMA_TYPE_NORMAL,
 		       nfc->regs + NFC_REG_CTL);
-		writel(chunksize * nchunks, nfc->regs + NFC_REG_MDMA_CNT);
-		writel(sg_dma_address(sg), nfc->regs + NFC_REG_MDMA_ADDR);
+
+	if (nfc->mdma_desc) {
+		struct sunxi_nfc_mdma_desc *desc = nfc->mdma_desc;
+
+		desc->config = cpu_to_le32(NFC_MDMA_DESC_FIRST |
+					   NFC_MDMA_DESC_LAST);
+		desc->size = cpu_to_le32(len);
+		desc->buf = cpu_to_le32(lower_32_bits(buf_dma));
+		desc->next = cpu_to_le32(lower_32_bits(nfc->mdma_desc_dma));
+
+		writel(BIT(0), nfc->regs + NFC_REG_H6_MDMA_STA);
+		dma_wmb();
+		writel(lower_32_bits(nfc->mdma_desc_dma),
+		       nfc->regs + NFC_REG_H6_MDMA_DLBA_REG);
+	} else if (nfc->caps->has_mdma) {
+		writel(len, nfc->regs + NFC_REG_MDMA_CNT);
+		writel(buf_dma, nfc->regs + NFC_REG_MDMA_ADDR);
 	} else {
 		dmat = dmaengine_submit(dmad);
 
@@ -525,6 +573,14 @@ static void sunxi_nfc_dma_op_cleanup(struct sunxi_nfc *nfc,
 	       nfc->regs + NFC_REG_CTL);
 }
 
+static void sunxi_nfc_dma_op_abort(struct sunxi_nfc *nfc)
+{
+	if (nfc->mdma_desc)
+		sunxi_nfc_rst(nfc);
+	else if (!nfc->caps->has_mdma)
+		dmaengine_terminate_all(nfc->dmac);
+}
+
 static void sunxi_nfc_select_chip(struct nand_chip *nand, unsigned int cs)
 {
 	struct mtd_info *mtd = nand_to_mtd(nand);
@@ -1202,7 +1258,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 
 	wait = NFC_CMD_INT_FLAG;
 
-	if (nfc->caps->has_mdma)
+	if (sunxi_nfc_uses_mdma(nfc))
 		wait |= NFC_DMA_INT_FLAG;
 	else
 		dma_async_issue_pending(nfc->dmac);
@@ -1211,8 +1267,8 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 	       nfc->regs + NFC_REG_CMD);
 
 	ret = sunxi_nfc_wait_events(nfc, wait, false, 0);
-	if (ret && !nfc->caps->has_mdma)
-		dmaengine_terminate_all(nfc->dmac);
+	if (ret)
+		sunxi_nfc_dma_op_abort(nfc);
 
 	sunxi_nfc_randomizer_disable(nand);
 	sunxi_nfc_hw_ecc_disable(nand);
@@ -1613,7 +1669,7 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 
 	wait = NFC_CMD_INT_FLAG;
 
-	if (nfc->caps->has_mdma)
+	if (sunxi_nfc_uses_mdma(nfc))
 		wait |= NFC_DMA_INT_FLAG;
 	else
 		dma_async_issue_pending(nfc->dmac);
@@ -1623,8 +1679,8 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 	       nfc->regs + NFC_REG_CMD);
 
 	ret = sunxi_nfc_wait_events(nfc, wait, false, 0);
-	if (ret && !nfc->caps->has_mdma)
-		dmaengine_terminate_all(nfc->dmac);
+	if (ret)
+		sunxi_nfc_dma_op_abort(nfc);
 
 	sunxi_nfc_randomizer_disable(nand);
 	sunxi_nfc_hw_ecc_disable(nand);
@@ -2073,11 +2129,13 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	ecc->write_oob = sunxi_nfc_hw_ecc_write_oob;
 	mtd_set_ooblayout(mtd, &sunxi_nand_ooblayout_ops);
 
-	if (nfc->dmac || nfc->caps->has_mdma) {
+	if (nfc->dmac || sunxi_nfc_uses_mdma(nfc)) {
 		ecc->read_page = sunxi_nfc_hw_ecc_read_page_dma;
 		ecc->read_subpage = sunxi_nfc_hw_ecc_read_subpage_dma;
 		ecc->write_page = sunxi_nfc_hw_ecc_write_page_dma;
 		nand->options |= NAND_USES_DMA;
+		if (nfc->mdma_desc)
+			nand->buf_align = 4;
 	} else {
 		ecc->read_page = sunxi_nfc_hw_ecc_read_page;
 		ecc->read_subpage = sunxi_nfc_hw_ecc_read_subpage;
@@ -2426,6 +2484,27 @@ static int sunxi_nfc_dma_init(struct sunxi_nfc *nfc, struct resource *r)
 {
 	int ret;
 
+	if (nfc->caps->has_mdma_desc) {
+		ret = dma_set_mask_and_coherent(nfc->dev, DMA_BIT_MASK(32));
+		if (ret) {
+			dev_warn(nfc->dev,
+				 "failed to set MBUS DMA mask, using PIO: %d\n",
+				 ret);
+			return 0;
+		}
+
+		nfc->mdma_desc =
+			dmam_alloc_coherent(nfc->dev, sizeof(*nfc->mdma_desc),
+					    &nfc->mdma_desc_dma, GFP_KERNEL);
+		if (!nfc->mdma_desc) {
+			dev_warn(nfc->dev,
+				 "failed to allocate MBUS DMA descriptor, using PIO\n");
+			return 0;
+		}
+
+		return 0;
+	}
+
 	if (nfc->caps->has_mdma)
 		return 0;
 
@@ -2620,6 +2699,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_a23_caps = {
 };
 
 static const struct sunxi_nfc_caps sunxi_nfc_h616_caps = {
+	.has_mdma_desc = true,
 	.has_ecc_clk = true,
 	.has_mbus_clk = true,
 	.reg_io_data = NFC_REG_A23_IO_DATA,
-- 
2.53.0

