Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EA54A33E3
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Sep 2026 21:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789420230; cv=none; b=Ax6VjYYYBbHlzjQuZq73+1T4MzRQmV8xP7B5Ksf++yGWM/Q1eFIKMjdOeNc7X9xpNrpnRdjnLnm4du2syGZV/g4j0SIgExtf6h3uxn1VEfEbxRfShITczYebN0sxz/V7x/+lyqCuMBODOVIfleoNO0aBPrs5yo+cphJH7Fvos9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789420230; c=relaxed/simple;
	bh=4xHXBQvwmVz0oonK9wMD8Zxqf2blrn3tsTPZp69gKzE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZJl+w3yJugTT6pmcHc2dtLndtUe57qwK+jN8cvo9c4RsdZ3OLiSbKExs25WajrRS3Ri+ziFYDixPrZ/KdCokKn54NEw2Pid4vI4opGB+qOfwj2I5Fkr3waTfrLCe1G+pEo9ij5uMJb2Rr1wthLDPW95VeNMIKE40Oc2WvwtnyXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cSZ96GYS; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cSZ96GYS"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6c20a9c464fso2484153eaf.0
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Sep 2026 14:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789420220; x=1790025020; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eqAKP8KvklWhrAanMl0NJZL0/+j+O7CDNjnmlHeKJxw=;
        b=cSZ96GYSvZ4+cmd0NLVdsaDBhc4hM9Z9favESrDPaEEV46rZULhqWRNn0jexoDBR7D
         uaQg0e+E8UeIY/0fc0yOzPFn1x1cJPRaI/fqf5Ong/RLQdfWdun7DNcbDt8mrOcYOodV
         DqsxMDHnxcHwZtuICiRU9YgahfAxiBk35XZCt5yT3gF8Lsj9XxKf4YC2DvtqfTwSvSVB
         hUMBDMMDwyRfbloksenB1noc/BenS+rz/jANgh087MIyilN1028u2Prm5tfv00+fRlQA
         ysm1Dwzp8/5AYAA5+nHEVL3ozgf+X40a7eHSpLB3l9EL/AAFs7Rrdes2eM1cmDKgXX9P
         xlRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789420220; x=1790025020;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eqAKP8KvklWhrAanMl0NJZL0/+j+O7CDNjnmlHeKJxw=;
        b=Ctlrlqh92UtIFC0AKX4t10m+BkfY5muc4qKsxTG+SiS4W+5KLTYNmuyVviRc8+u0YR
         FsOlRhSEUMKQW80c+diBXkBh/I4VmHzdFM4HfTV6clcu0Mo+wza1wjRamuEdvgYINpbq
         lj9WkYVVuLXnsMBiXCLwr3trXkbMZcggSFGt/YTnf09C1u8F/U6d3a+2NZsxJyPuWtVX
         Wgmdo/M5tWjx3S1sP06E6j+yiaerre6p+wGieXlODAJhKQoK4zpLExmd22ulpx0YOofF
         ysZRRQnfnotqmOZyXAHz9Wu8xxgZCkjn2VItZ36JK8J+QVKE03qMynMDkE9AmoHwqpEs
         9lvA==
X-Forwarded-Encrypted: i=1; AKwUvBxI01ktg5Mac0SlnjXkRjOQvqv5MkegAmQLxPxX/Kb280RG394GuqWdpsFUP5A4SLkkdPm//y7MmfWLCw==@lists.linux.dev
X-Gm-Message-State: AFuF++kFL+6PcvOUj5YRcYqhVGqVAjduqrm7JBXGniZr+XD86tZbSTtS
	l97/p7MkBwjPtNZrH5pW8CUeaDbeuBWA5TT/cJpeZYlU7j/ifo4/cJ4h
X-Gm-Gg: AYBFou2wHclAjfNET4zeO3/naF9SEkLAwtmEz0Fx5rHij1YOIjQ29w1fZOQM6YbGzxY
	BmIRvRROSX+5D+t23B0fCH4RV044c/Wrelt2iovpgkORAHPAwUFhHAKyDfYDSIQE/COH+PtSL3B
	NMY7eiCSY8AzNPbHvP4x3x0zonCWOwndGLZkvht7mulzHrSrFeXseF8K/0MYbn01fG9aFJxLYyD
	llsF0aUqSQcuipwnLaZeLqYkMscMJZWFrj6vBr5Wc9Jo9NiY/OCm+Y/en89IWyG0s6D0ZgwT9wm
	j6wDG9KsWA9AR/WzJPiKPNYDrMVGN30u6wOlsyQeyqNFGG+O9j/+bDeB8X8MIC6zHHGaBXnvNY1
	h7gTV0gIT89KcPEdsB4XK+szV0CvEySMIVnp9EQS2jlv2/HA/Zd0FVUStMThRN3QJK0s7J71HOf
	5TBnxVCMkIeL86v6eU559D0zxN9sCMT5y9f4c9eftvLQsXAA6NkajwvdkqNgfz/LnyWRMhLIv8Q
	UkLO88pfsj+VNgD2HWc9G2Ht2dmSvjiPhIj+0KoSMnZIw23XkHLG6Zditc+nJG3Z3yFFsxQFjPI
	BI8yY1Xy+AnJs17UpDg8gxfMHxGhfxybvCBZuZUd9/B7mJcwj3PWHnqWqgpKAOVwEPWSDfiDbks
	Tvx7K3yGJ8iPmg8/wSz3y7eTV+dU/
X-Received: by 2002:a05:6820:1628:b0:6b8:ef7d:e181 with SMTP id 006d021491bc7-6c544daaf8cmr2777294eaf.54.1789420219820;
        Mon, 14 Sep 2026 14:10:19 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c45bfc3fe9sm4698544eaf.15.2026.09.14.14.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:10:19 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Sep 2026 15:10:04 -0600
Subject: [PATCH v6 18/18] mtd: rawnand: sunxi: reuse ECC status within each
 DMA read
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-18-2fb084fe0751@gmail.com>
References: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
In-Reply-To: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The DMA completion loop reads the pattern ID repeatedly and reads the
same packed error-counter word for each of its four ECC steps.

Snapshot the completed operation status and pattern ID, and retain the
last counter word while visiting consecutive DMA steps. Read counters
only for steps which use them. Reuse the shared status register value on
older controllers which place the pattern flags in its upper half.
Keep the existing error and pattern priority in both the plain-marker
and randomized-format paths.

Start a fresh snapshot after every PIO ECC operation so reuse of hardware
slot zero cannot reuse status from a previous step. The snapshot is local
to one callback and does not survive controller resets or DMA-to-PIO
retries.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 103 +++++++++++++++++++++++++-------------
 1 file changed, 69 insertions(+), 34 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 41d6ef31ea3d..b79bf13f3ff0 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1157,16 +1157,60 @@ struct sunxi_nfc_ecc_status {
 	unsigned int max_bitflips;
 };
 
+struct sunxi_nfc_ecc_snapshot {
+	u32 status;
+	u32 pattern_found;
+	u32 pattern_id;
+	u32 count_reg;
+	u32 count;
+};
+
+static void sunxi_nfc_hw_ecc_read_status(struct nand_chip *nand,
+					 struct sunxi_nfc_ecc_snapshot *snapshot)
+{
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	u32 pattern_found;
+
+	pattern_found = readl(nfc->regs + nfc->caps->reg_pat_found);
+	snapshot->pattern_found = field_get(NFC_ECC_PAT_FOUND_MSK(nfc), pattern_found);
+	if (nfc->caps->reg_pat_found == NFC_REG_ECC_ST)
+		snapshot->status = pattern_found;
+	else
+		snapshot->status = readl(nfc->regs + NFC_REG_ECC_ST);
+	snapshot->pattern_id = 0;
+	if (snapshot->pattern_found &&
+	    (to_sunxi_nand(nand)->randomized_oob ||
+	     (snapshot->pattern_found & ~snapshot->status)))
+		snapshot->pattern_id = readl(nfc->regs + NFC_REG_PAT_ID(nfc));
+	/* A new operation, including every PIO step, invalidates the count word. */
+	snapshot->count_reg = ~0U;
+}
+
+static unsigned int
+sunxi_nfc_hw_ecc_read_count(struct nand_chip *nand,
+			    struct sunxi_nfc_ecc_snapshot *snapshot, int hw_step)
+{
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	u32 reg = NFC_REG_ECC_ERR_CNT(nfc, hw_step);
+
+	/* Four consecutive DMA steps share one error-counter register. */
+	if (snapshot->count_reg != reg) {
+		snapshot->count = readl(nfc->regs + reg);
+		snapshot->count_reg = reg;
+	}
+
+	return NFC_ECC_ERR_CNT(hw_step, snapshot->count);
+}
+
 static void sunxi_nfc_hw_ecc_record_status(struct nand_chip *nand,
 					   struct sunxi_nfc_ecc_status *result,
-					   int logical_step, int hw_step, u32 status,
-					   u32 pattern_found)
+					   int logical_step, int hw_step,
+					   struct sunxi_nfc_ecc_snapshot *snapshot)
 {
-	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	u32 count;
 
-	if ((pattern_found & BIT(hw_step)) &&
-	    !(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & BIT(hw_step)))
+	if ((snapshot->pattern_found & BIT(hw_step)) &&
+	    !(snapshot->pattern_id & BIT(hw_step)))
 		result->zero_steps |= BIT(logical_step);
 
 	/*
@@ -1174,35 +1218,32 @@ static void sunxi_nfc_hw_ecc_record_status(struct nand_chip *nand,
 	 * Classify these steps with the vendor page check too, and do not use
 	 * their correction counters. Keep their decoded data until then.
 	 */
-	if ((status & NFC_ECC_ERR(hw_step)) ||
-	    (pattern_found & BIT(hw_step))) {
+	if ((snapshot->status & NFC_ECC_ERR(hw_step)) ||
+	    (snapshot->pattern_found & BIT(hw_step))) {
 		result->error_steps |= BIT(logical_step);
 		return;
 	}
 
-	count = readl(nfc->regs + NFC_REG_ECC_ERR_CNT(nfc, hw_step));
-	count = NFC_ECC_ERR_CNT(hw_step, count);
+	count = sunxi_nfc_hw_ecc_read_count(nand, snapshot, hw_step);
 	result->corrected += count;
 	result->max_bitflips = max(result->max_bitflips, count);
 }
 
 static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
-				    int hw_step, u32 status, u32 pattern_found,
+				    int hw_step, struct sunxi_nfc_ecc_snapshot *snapshot,
 				    unsigned int user_data_sz, bool *erased)
 {
-	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	u32 tmp;
 
 	*erased = false;
 
-	if (status & NFC_ECC_ERR(hw_step))
+	if (snapshot->status & NFC_ECC_ERR(hw_step))
 		return -EBADMSG;
 
-	if (pattern_found & BIT(hw_step)) {
+	if (snapshot->pattern_found & BIT(hw_step)) {
 		u8 pattern;
 
-		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & BIT(hw_step)))) {
+		if (unlikely(!(snapshot->pattern_id & BIT(hw_step)))) {
 			pattern = 0x0;
 		} else {
 			pattern = 0xff;
@@ -1218,9 +1259,7 @@ static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 		return 0;
 	}
 
-	tmp = readl(nfc->regs + NFC_REG_ECC_ERR_CNT(nfc, hw_step));
-
-	return NFC_ECC_ERR_CNT(hw_step, tmp);
+	return sunxi_nfc_hw_ecc_read_count(nand, snapshot, hw_step);
 }
 
 static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
@@ -1235,7 +1274,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, logical_step);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	u32 pattern_found;
+	struct sunxi_nfc_ecc_snapshot snapshot;
 	bool bbm = !logical_step;
 	bool erased;
 	int ret, bitflips;
@@ -1275,13 +1314,11 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 
 	*cur_off = oob_off + ecc->bytes + user_data_sz;
 
-	pattern_found = readl(nfc->regs + nfc->caps->reg_pat_found);
-	pattern_found = field_get(NFC_ECC_PAT_FOUND_MSK(nfc), pattern_found);
+	sunxi_nfc_hw_ecc_read_status(nand, &snapshot);
 
 	if (sunxi_nand->randomized_oob) {
 		sunxi_nfc_hw_ecc_record_status(nand, result, logical_step, hw_step,
-					       readl(nfc->regs + NFC_REG_ECC_ST),
-					       pattern_found);
+					       &snapshot);
 		memcpy_fromio(data, nfc->regs + NFC_RAM0_BASE, ecc->size);
 		sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, hw_step, bbm,
 						    page, user_data_sz);
@@ -1289,8 +1326,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	}
 
 	bitflips = sunxi_nfc_hw_ecc_correct(nand, data, oob_required ? oob : NULL,
-					    hw_step, readl(nfc->regs + NFC_REG_ECC_ST),
-					    pattern_found, user_data_sz, &erased);
+					    hw_step, &snapshot, user_data_sz, &erased);
 	if (erased)
 		return 1;
 
@@ -1555,11 +1591,12 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand, u8 *buf,
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
+	struct sunxi_nfc_ecc_snapshot snapshot;
 	unsigned int reg_index = 0, user_data_sz;
 	unsigned int max_bitflips = 0;
 	int ret, i;
 	struct scatterlist sg;
-	u32 status, pattern_found, wait;
+	u32 wait;
 
 	if (first_step) {
 		ret = sunxi_nfc_read_column(nand, page, first_step * ecc->size,
@@ -1612,9 +1649,7 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand, u8 *buf,
 	if (ret)
 		return ret;
 
-	status = readl(nfc->regs + NFC_REG_ECC_ST);
-	pattern_found = readl(nfc->regs + nfc->caps->reg_pat_found);
-	pattern_found = field_get(NFC_ECC_PAT_FOUND_MSK(nfc), pattern_found);
+	sunxi_nfc_hw_ecc_read_status(nand, &snapshot);
 
 	for (i = 0; i < nchunks; i++, reg_index += user_data_sz / 4) {
 		int logical_step = first_step + i;
@@ -1628,8 +1663,8 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand, u8 *buf,
 		user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, logical_step);
 
 		if (sunxi_nand->randomized_oob) {
-			sunxi_nfc_hw_ecc_record_status(nand, result, logical_step, i, status,
-						       pattern_found);
+			sunxi_nfc_hw_ecc_record_status(nand, result, logical_step, i,
+						       &snapshot);
 			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, reg_index, !logical_step,
 							    page, user_data_sz);
 			continue;
@@ -1637,7 +1672,7 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand, u8 *buf,
 
 		bitflips = sunxi_nfc_hw_ecc_correct(nand, randomized ? data : NULL,
 						    oob_required ? oob : NULL,
-						    i, status, pattern_found,
+						    i, &snapshot,
 						    user_data_sz, &erased);
 
 		/* ECC errors are handled in the second loop. */
@@ -1664,7 +1699,7 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand, u8 *buf,
 	if (sunxi_nand->randomized_oob)
 		return 0;
 
-	if (status & NFC_ECC_ERR_MSK(nfc)) {
+	if (snapshot.status & NFC_ECC_ERR_MSK(nfc)) {
 		for (i = 0; i < nchunks; i++) {
 			int logical_step = first_step + i;
 			int data_off = logical_step * ecc->size;
@@ -1672,7 +1707,7 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand, u8 *buf,
 			u8 *data = buf + data_off;
 			u8 *oob = nand->oob_poi + oob_off;
 
-			if (!(status & NFC_ECC_ERR(i)))
+			if (!(snapshot.status & NFC_ECC_ERR(i)))
 				continue;
 
 			user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, logical_step);

-- 
2.53.0

