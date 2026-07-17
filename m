Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E323F429CCA
	for <linux-sunxi@lists.linux.dev>; Fri, 17 Jul 2026 16:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784306536; cv=none; b=ACtbXSUu6Ks+yAWc+PG40Jca7CLCP7SnkqSRCRuv78R+P8lUOndK8uFVJlU2m2ALlVXMdOe1l+DKuo5CYYUXSscULOPFN8+oSS4z/7ia40/MPCFlAjqcD17sD+DOFT+qHhJWsr0O1enLDtYh+3tvwn4hKPpAActrROYTcMs2WY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784306536; c=relaxed/simple;
	bh=eQ6DJP3MKypiEDtsltfn2dJbmMK2TyB5A1Qsi/qmkUE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tmE1lchArtXSiP79PsC/uYZmn33+KVt2pDVWzEKm9C2YBzwkR0i+LXNJa9EIag8eWsGR2dRt2xAEC5tvfOoRS4VVmMjmu+qdT8pdFEZlKdxUAz8TO9lR6WRHiWWkvI9NSkrljKHC0c7pSz+/j7doQlzfYjR5HF8HkeZXhpa3iGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WJboTQRM; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WJboTQRM"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7eb4d8a21a8so3001132a34.2
        for <linux-sunxi@lists.linux.dev>; Fri, 17 Jul 2026 09:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784306533; x=1784911333; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zBmmy8W22qacqO6CsFuVEthSgchjWOCosdpbxtawDI0=;
        b=WJboTQRMBJDMiAX/3l0SU2DHc2meb0s32rqyI3kzWS6AxaprA1u8p0C+tnMq38X1qo
         FuGGpYt05CLqA4IoAkj0O7qZdtSoPAl7bmjj7scHXegTgJVjul57Bpow54tndCTR+kVN
         H20OtVqvsd6pYxNoCMcrUVw6/md+d68WhyFV++gP0hnGIBH21E6YTmcAPcOcgPoaTBxc
         CJD+peMTuF/aOnqRetuDbi2LZvY4afvZFTrY8YeNb5neOjU5nMZg0SP3R5wKIEIr/dmA
         eFWz7469kKccZ8ubrVxCeNpSrJBhK7Ja8+ByzGRh6w3TUs8Ak9/K04TFeUovg6T30URt
         nCcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784306533; x=1784911333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zBmmy8W22qacqO6CsFuVEthSgchjWOCosdpbxtawDI0=;
        b=qYa2uL2zrOZTb6UuKeR2uEAM5SqHBWdsfM/Cv3NKxEDWuvucLdW55f5rJfsoIoZSIS
         16PR7UpKCToP3YWXzYevTN2QsZh8+iAFkAlHED30JqJXz76yx8owIp8FUyYSEFLd5L9A
         Q8SY1pRD5oK8S3cVRQBNMoWHtGz6Oq9ipc3iGRov6k5yB4Cw+CcybTjxLmA9EkhmwcW2
         b6QLkOpk/q9CqJbpnUWC+hcqVSn3DPs8qOISdJwNqH73bMY0aTIUAkv/SokuOlgP1jWL
         iGJPhAsBm+Jc56eer2bMd3femOI4cszYKwiJBT0ebsR8MqJpjVJj7/g0XQQjwFEScwGQ
         klEA==
X-Forwarded-Encrypted: i=1; AHgh+Rpjw0YsM1dd9Q8y6gUgZhMUkRfNcTLXTdsNMDJ5L66a3ZqsOcQPvWXnWw1yjmY7pvsnSNGQhH+EBPAumA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzS2HhLHwedqseqTR9hIbiC7zLCFgGqXQgWwWWBiauMpz/Eciba
	hoozAdg+0RT/FtQmS40P6DaIaIWUMTo9CjDTlfB5Yg/D/mMalfVDCcMS
X-Gm-Gg: AfdE7clw1Xm5CzKaxtbKIQhzwyet4qnj6m9aI79M4RivBkWoC/HBkC9O9bczhMDGouk
	c2iZWFj7hDUM9QXolzn+FgIltj1Yxc/rtRQGao85dhE/w1r8/ixydS9LZQT6pm7vfVUPx8Xkmt0
	7ON0oxbFDP2Ajv80ba08B9OtAHMt5hL77+ZJ9L1/elRVH/V8Gs5CwvRpw/efouwQkLEauKIHXvz
	6scPmgCmzxP+UkH7+15u6Rc6D5FJnj06b3yfFQi9FoqRf0ckrut+Eyc0XmoF2ZNyfEo1vGqZJdm
	K00Qe5vXr5cV4sJ3qTW8jPrq4gNi2if9TWLXrJHyfFbbL1TGf388cR42m0+39+gCskMiuS+aWX2
	tIdMHeu82FW0qMkDHaJe15QxBZOtbdbuYQEWRqQVckGFqGO3gM30cWQY9q/d3Gsbo3CCt8UNn+Z
	szHvs+bBc7unJfYLzTFw+86oN25ZntfEFNxt9iGtluUJHN+ryGAK4Ix5lxBGYy+NpD/veHLh2aV
	33v8kNqTNz7HUaSjiX40hXz+ckaWyko81RpU2xk9Os44DqopjVTPWB48yk9gv3429Qhxm5onpw=
X-Received: by 2002:a05:6830:4901:b0:7e6:f2ef:e231 with SMTP id 46e09a7af769-7ed9a7ca72emr1789456a34.2.1784306533242;
        Fri, 17 Jul 2026 09:42:13 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-11-8.hlrn.qwest.net. [174.29.11.8])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7edad9576a5sm1563536a34.9.2026.07.17.09.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 09:42:11 -0700 (PDT)
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
Subject: [PATCH v2] mtd: rawnand: sunxi: add H616 MBUS DMA support
Date: Fri, 17 Jul 2026 10:41:58 -0600
Message-ID: <20260717164202.3099982-1-james.hilliard1@gmail.com>
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

With identical kernels except for this patch, running
flash_speed -d -b 1906 -c 100 /dev/mtd6 on an H616 board with 2 KiB-page
SLC NAND reported:

                         PIO          descriptor DMA
eraseblock write        3365 KiB/s       4192 KiB/s
eraseblock read         6454 KiB/s      16040 KiB/s
page write              3254 KiB/s       4021 KiB/s
page read               6419 KiB/s      15686 KiB/s

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - Make descriptor layout and alignment explicit  (suggested by Miquel)
  - Track active internal MBUS DMA state consistently  (suggested by Miquel)
  - Clarify the block mask and completion bit names  (suggested by Miquel)
  - Let the 32-bit DMA mask constrain mappings  (suggested by Miquel)
  - Explain DMA descriptor endian conversion
  - Add flash_speed PIO/DMA results  (suggested by Miquel)
---
 drivers/mtd/nand/raw/sunxi_nand.c | 120 ++++++++++++++++++++++++++----
 1 file changed, 104 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 02647565c8ba..6e22d82a77ea 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -79,6 +79,12 @@
 #define NFC_REG_H6_MDMA_BUF_ADDR 0x0210
 #define NFC_REG_H6_MDMA_CNT	0x0214
 
+#define NFC_H6_MDMA_STA_DESC0_COMPLETE	BIT(0)
+
+#define NFC_MDMA_DESC_LAST	BIT(2)
+#define NFC_MDMA_DESC_FIRST	BIT(3)
+#define NFC_MDMA_DESC_SIZE_MASK	GENMASK(15, 0)
+
 #define NFC_RAM0_BASE		0x0400
 #define NFC_RAM1_BASE		0x0800
 
@@ -267,12 +273,19 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
 	return container_of(nand, struct sunxi_nand_chip, nand);
 }
 
+struct sunxi_nfc_mdma_desc {
+	__le32 config;
+	__le32 size;
+	__le32 buf;
+	__le32 next;
+} __packed __aligned(4);
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
@@ -304,6 +317,7 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
  */
 struct sunxi_nfc_caps {
 	bool has_mdma;
+	bool has_mdma_desc;
 	bool has_ecc_block_512;
 	bool has_ecc_clk;
 	bool has_mbus_clk;
@@ -346,6 +360,9 @@ struct sunxi_nfc_caps {
  *	   controller
  * @complete: a completion object used to wait for NAND controller events
  * @dmac: the DMA channel attached to the NAND controller
+ * @use_mdma: use an internal MBUS DMA backend
+ * @mdma_desc: H6-style MBUS DMA descriptor
+ * @mdma_desc_dma: DMA address of @mdma_desc
  * @caps: NAND Controller capabilities
  */
 struct sunxi_nfc {
@@ -362,6 +379,9 @@ struct sunxi_nfc {
 	struct list_head chips;
 	struct completion complete;
 	struct dma_chan *dmac;
+	bool use_mdma;
+	struct sunxi_nfc_mdma_desc *mdma_desc;
+	dma_addr_t mdma_desc_dma;
 	const struct sunxi_nfc_caps *caps;
 };
 
@@ -466,7 +486,10 @@ static int sunxi_nfc_dma_op_prepare(struct sunxi_nfc *nfc, const void *buf,
 {
 	struct dma_async_tx_descriptor *dmad;
 	enum dma_transfer_direction tdir;
+	dma_addr_t buf_dma;
 	dma_cookie_t dmat;
+	int len = chunksize * nchunks;
+	u32 data_blocks = nchunks;
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
+	     !IS_ALIGNED(buf_dma, 4))) {
+		ret = -EINVAL;
+		goto err_unmap_buf;
+	}
+
+	if (!nfc->use_mdma) {
 		dmad = dmaengine_prep_slave_sg(nfc->dmac, sg, 1, tdir, DMA_CTRL_ACK);
 		if (!dmad) {
 			ret = -EINVAL;
@@ -489,14 +521,35 @@ static int sunxi_nfc_dma_op_prepare(struct sunxi_nfc *nfc, const void *buf,
 
 	writel(readl(nfc->regs + NFC_REG_CTL) | NFC_RAM_METHOD,
 	       nfc->regs + NFC_REG_CTL);
-	writel(nchunks, nfc->regs + NFC_REG_SECTOR_NUM);
+
+	/* H6/H616 use one enable bit per ECC data block. */
+	if (nfc->caps->has_mdma_desc)
+		data_blocks = GENMASK(nchunks - 1, 0);
+	writel(data_blocks, nfc->regs + NFC_REG_SECTOR_NUM);
 	writel(chunksize, nfc->regs + NFC_REG_CNT);
 
-	if (nfc->caps->has_mdma) {
+	if (nfc->use_mdma)
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
+		/* Descriptor words are little-endian DMA memory, not MMIO. */
+		desc->buf = cpu_to_le32(buf_dma);
+		desc->next = cpu_to_le32(nfc->mdma_desc_dma);
+
+		writel(NFC_H6_MDMA_STA_DESC0_COMPLETE,
+		       nfc->regs + NFC_REG_H6_MDMA_STA);
+		dma_wmb();
+		writel(nfc->mdma_desc_dma,
+		       nfc->regs + NFC_REG_H6_MDMA_DLBA_REG);
+	} else if (nfc->caps->has_mdma) {
+		writel(len, nfc->regs + NFC_REG_MDMA_CNT);
+		writel(buf_dma, nfc->regs + NFC_REG_MDMA_ADDR);
 	} else {
 		dmat = dmaengine_submit(dmad);
 
@@ -525,6 +578,14 @@ static void sunxi_nfc_dma_op_cleanup(struct sunxi_nfc *nfc,
 	       nfc->regs + NFC_REG_CTL);
 }
 
+static void sunxi_nfc_dma_op_abort(struct sunxi_nfc *nfc)
+{
+	if (nfc->use_mdma)
+		sunxi_nfc_rst(nfc);
+	else
+		dmaengine_terminate_all(nfc->dmac);
+}
+
 static void sunxi_nfc_select_chip(struct nand_chip *nand, unsigned int cs)
 {
 	struct mtd_info *mtd = nand_to_mtd(nand);
@@ -1202,7 +1263,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 
 	wait = NFC_CMD_INT_FLAG;
 
-	if (nfc->caps->has_mdma)
+	if (nfc->use_mdma)
 		wait |= NFC_DMA_INT_FLAG;
 	else
 		dma_async_issue_pending(nfc->dmac);
@@ -1211,8 +1272,8 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 	       nfc->regs + NFC_REG_CMD);
 
 	ret = sunxi_nfc_wait_events(nfc, wait, false, 0);
-	if (ret && !nfc->caps->has_mdma)
-		dmaengine_terminate_all(nfc->dmac);
+	if (ret)
+		sunxi_nfc_dma_op_abort(nfc);
 
 	sunxi_nfc_randomizer_disable(nand);
 	sunxi_nfc_hw_ecc_disable(nand);
@@ -1613,7 +1674,7 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 
 	wait = NFC_CMD_INT_FLAG;
 
-	if (nfc->caps->has_mdma)
+	if (nfc->use_mdma)
 		wait |= NFC_DMA_INT_FLAG;
 	else
 		dma_async_issue_pending(nfc->dmac);
@@ -1623,8 +1684,8 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 	       nfc->regs + NFC_REG_CMD);
 
 	ret = sunxi_nfc_wait_events(nfc, wait, false, 0);
-	if (ret && !nfc->caps->has_mdma)
-		dmaengine_terminate_all(nfc->dmac);
+	if (ret)
+		sunxi_nfc_dma_op_abort(nfc);
 
 	sunxi_nfc_randomizer_disable(nand);
 	sunxi_nfc_hw_ecc_disable(nand);
@@ -2073,11 +2134,13 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	ecc->write_oob = sunxi_nfc_hw_ecc_write_oob;
 	mtd_set_ooblayout(mtd, &sunxi_nand_ooblayout_ops);
 
-	if (nfc->dmac || nfc->caps->has_mdma) {
+	if (nfc->dmac || nfc->use_mdma) {
 		ecc->read_page = sunxi_nfc_hw_ecc_read_page_dma;
 		ecc->read_subpage = sunxi_nfc_hw_ecc_read_subpage_dma;
 		ecc->write_page = sunxi_nfc_hw_ecc_write_page_dma;
 		nand->options |= NAND_USES_DMA;
+		if (nfc->mdma_desc)
+			nand->buf_align = 4;
 	} else {
 		ecc->read_page = sunxi_nfc_hw_ecc_read_page;
 		ecc->read_subpage = sunxi_nfc_hw_ecc_read_subpage;
@@ -2426,8 +2489,32 @@ static int sunxi_nfc_dma_init(struct sunxi_nfc *nfc, struct resource *r)
 {
 	int ret;
 
-	if (nfc->caps->has_mdma)
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
+		nfc->use_mdma = true;
 		return 0;
+	}
+
+	if (nfc->caps->has_mdma) {
+		nfc->use_mdma = true;
+		return 0;
+	}
 
 	nfc->dmac = dma_request_chan(nfc->dev, "rxtx");
 	if (IS_ERR(nfc->dmac)) {
@@ -2620,6 +2707,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_a23_caps = {
 };
 
 static const struct sunxi_nfc_caps sunxi_nfc_h616_caps = {
+	.has_mdma_desc = true,
 	.has_ecc_clk = true,
 	.has_mbus_clk = true,
 	.reg_io_data = NFC_REG_A23_IO_DATA,
-- 
2.53.0

