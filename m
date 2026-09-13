Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F57399356
	for <linux-sunxi@lists.linux.dev>; Sun, 13 Sep 2026 04:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789272334; cv=none; b=G8RqbqTaDAKY9Q5itPaQvIB/rAZ9GbpVdPujdoHIpIimd553xXkoAHX2vKYZjNzmHbokaIeph7GRyTpSSxjGdwcGltA6Cn61UCR1egy8RHhKL93cY3dElcfOsjUEWPgz3gRkBdtqrxRieoG2XifKdqBwbZFUv+w8sgnamG+XcE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789272334; c=relaxed/simple;
	bh=+b9FVk7yg1ZvvCKVqsKXTOxCwWHm82NDo3cdNKjLRZc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M7ARLW+9eYomgM8HvwxAFuaqBYF+nac9B8wtmDShTZZvA94hLTruMbqvshp14HcZQm0kXYRjuVU3szG1OXmajR0IeN0ob6frOgCy6rhuJDCbEU3feZUp4SdtXxaKZqNfVEIXn347aHHqNBqCT1xEi/BSSJD/Msz0eIjTjAj2hlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r+54E1Br; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r+54E1Br"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466cc9ab667so1501987fac.0
        for <linux-sunxi@lists.linux.dev>; Sat, 12 Sep 2026 21:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272330; x=1789877130; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8EW3/f+RzpimWbfDUvAx3KSD/RKaEHodr5Jfoelq2QM=;
        b=r+54E1BrljG8Unb20U9P1Zw2klE6Yni19vrTq6FRnBmOmNaU18fSqkSZJY7KHtNS+j
         pu2Ui+MqC+Kj7WZXKlUeK9oI5EENqlKBiAMYglJHKNAhjolpGpnEPKj2uLsKh3IoqcvW
         AQ3JHaKxxTdD3C0wAbPidtkN5SUhWgXwlmoSishoCNRh+TB7vPb3GseCnkBuVFAgPwMJ
         46cN4Rly3bRElgbJ10zwhDvR9DaLIt/If6EeTx6wwaSjFz8dzO/tSicNjtRNwTdNQA95
         lcl0yZ4S2dVXLkw4uU6STb8F7/yo1kC71i1BWoezTXqrGwPpU1ejwROPkVe1LimQUjQd
         kNBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272330; x=1789877130;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8EW3/f+RzpimWbfDUvAx3KSD/RKaEHodr5Jfoelq2QM=;
        b=hiC0nlh9uGYWvVi4UVP9eSXqcGusGe65bm0s4S/ZjDPw0TlC83n24OmbeiiYaAeGBm
         tvXYucgl170bKJpp7GRKaeDXUEq/UhjBW2WMGCFfDK2NukucjI4iap1X9b//oz3KkEuw
         SLkQZfua2e3wP2bOmv+djH+1M977w2uIe/RtZ8yS6e8wQ7rJlOImF3HvyWI22hkuQd6T
         9TD7Q4A/vEWe7+v0hFEdJCJP7FpqGu1pndSpTnkahJegrDpN2qwisABXEwA9wnOGMOxo
         9dyX5uTuhvVBedu5E7ixg4NTpiNUZlIzXMONCaiRhXEnuIbVtPY3NNsqwPzy5jMZdFUd
         /l0Q==
X-Forwarded-Encrypted: i=1; AKwUvBwiTeYYcY9MvZM3vh/YyoQ0VvXtSlZTvoTeltISnWxH8cLoAQnJABG08ceEQEYvRimxbwCAnuucQ/u/Gg==@lists.linux.dev
X-Gm-Message-State: AFuF++k/26TAF//0ycjV5dqrBsmc9EEcRwhNJeSlyy/QLxzepdvNMn6y
	RDxh3bkrmo4+PamGbDEnTRnpLlxJPlBzo4MT/1DnGllTwgoPTprdRFsd
X-Gm-Gg: AYBFou30JkCsTf6GdBw7nf9AfPlZEmofAYZentaVTEvQZuHvst75iYJtNcLOCA2M8zb
	uighbMukgXm5fPNakywKluUnRZjjPIwobA59Oa9G+4+Heea/O62YPHZBWjjWCcdNayRD/m+Pi65
	d3VWsb17iMPdHCYfR5NiEhh3HpU6qC72JUc99OFp0EBQyYBiwJ5io4sTOxT3gtVN9gbxFv2wvLc
	fVAoVZgPdytGfkUuta9aIuQHjssdsm3pTz0R1KVRkFSKnzpGO9gb6saYY7/d5uOEIhPmAE0dQmr
	KkO7uWeQVmnv62KgxkVYjB6uYuJ2ti39Qu0q7yJY49ZzYexwu7c7XGdrYBgpEHXYjvS+IL8Rw6C
	ydAnhdrMy0zqEXy9AUBuV45qEg0bcoO/CrmkEKN5wmw1CHcC8nh9A5IMDjVpRnk6T0XGhN/lD5n
	07barDdfAJUQ/Io3wSm9TOzhvOOYHJYEzodrtkkDN5W4C+gTsEAXBuwFoDpczNpFBYrz3Ae0LEH
	Hg2Ey3rDDmmAOa3S3M3gwvcIFgigZNJ7CQ3yPAqHIEbjWsMBvfwPdbG31brqJkAI9ZC+pyJatyX
	R9To121XJ1ZfRkf+CdcxMwBL8AES+/2fwEXy3qf91f8pvo6yPCK8an5D3RBu2ldh0SjDz2vg6D9
	w7o8kbxkp9+qjBoEWZDxy5AGRlqkXrYsNVn34xV6n
X-Received: by 2002:a05:6820:8187:b0:6b7:46fa:16a7 with SMTP id 006d021491bc7-6c0bd874de9mr6693573eaf.60.1789272330523;
        Sat, 12 Sep 2026 21:05:30 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699647sm6011535fac.5.2026.09.12.21.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 21:05:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 12 Sep 2026 22:05:07 -0600
Subject: [PATCH v4 16/17] mtd: rawnand: sunxi: reuse ECC status within each
 DMA read
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-16-4a64bed94229@gmail.com>
References: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-0-4a64bed94229@gmail.com>
In-Reply-To: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-0-4a64bed94229@gmail.com>
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
 drivers/mtd/nand/raw/sunxi_nand.c | 100 +++++++++++++++++++++++++-------------
 1 file changed, 67 insertions(+), 33 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index debef3f4f0dd..1303dca74cf9 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1150,46 +1150,87 @@ struct sunxi_nfc_ecc_status {
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
 
-	if (status & NFC_ECC_ERR(hw_step)) {
+	if (snapshot->status & NFC_ECC_ERR(hw_step)) {
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
@@ -1205,9 +1246,7 @@ static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 		return 0;
 	}
 
-	tmp = readl(nfc->regs + NFC_REG_ECC_ERR_CNT(nfc, hw_step));
-
-	return NFC_ECC_ERR_CNT(hw_step, tmp);
+	return sunxi_nfc_hw_ecc_read_count(nand, snapshot, hw_step);
 }
 
 static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
@@ -1222,7 +1261,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, logical_step);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	u32 pattern_found;
+	struct sunxi_nfc_ecc_snapshot snapshot;
 	bool bbm = !logical_step;
 	bool erased;
 	int ret, bitflips;
@@ -1262,13 +1301,11 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 
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
@@ -1276,8 +1313,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	}
 
 	bitflips = sunxi_nfc_hw_ecc_correct(nand, data, oob_required ? oob : NULL,
-					    hw_step, readl(nfc->regs + NFC_REG_ECC_ST),
-					    pattern_found, user_data_sz, &erased);
+					    hw_step, &snapshot, user_data_sz, &erased);
 	if (erased)
 		return 1;
 
@@ -1542,13 +1578,14 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	struct sunxi_nfc_ecc_status result = {};
+	struct sunxi_nfc_ecc_snapshot snapshot;
 	unsigned int corrected = mtd->ecc_stats.corrected;
 	unsigned int failed = mtd->ecc_stats.failed;
 	unsigned int max_bitflips = 0;
 	bool erased_chunk_found = false;
 	int ret, i;
 	struct scatterlist sg;
-	u32 status, pattern_found, wait;
+	u32 wait;
 
 	ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
 	if (ret)
@@ -1589,9 +1626,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 	if (ret)
 		return ret;
 
-	status = readl(nfc->regs + NFC_REG_ECC_ST);
-	pattern_found = readl(nfc->regs + nfc->caps->reg_pat_found);
-	pattern_found = field_get(NFC_ECC_PAT_FOUND_MSK(nfc), pattern_found);
+	sunxi_nfc_hw_ecc_read_status(nand, &snapshot);
 
 	for (i = 0; i < nchunks; i++) {
 		int data_off = i * ecc->size;
@@ -1603,8 +1638,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 		int bitflips;
 
 		if (sunxi_nand->randomized_oob) {
-			sunxi_nfc_hw_ecc_record_status(nand, &result, i, i, status,
-						       pattern_found);
+			sunxi_nfc_hw_ecc_record_status(nand, &result, i, i, &snapshot);
 			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, i, !i,
 							    page, user_data_sz);
 			continue;
@@ -1612,7 +1646,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 
 		bitflips = sunxi_nfc_hw_ecc_correct(nand, randomized ? data : NULL,
 						    oob_required ? oob : NULL,
-						    i, status, pattern_found,
+						    i, &snapshot,
 						    user_data_sz, &erased);
 
 		/* ECC errors are handled in the second loop. */
@@ -1641,7 +1675,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 		return sunxi_nfc_hw_ecc_finish_randomized_read(nand, buf, &result,
 							     oob_required, true, page);
 
-	if (status & NFC_ECC_ERR_MSK(nfc)) {
+	if (snapshot.status & NFC_ECC_ERR_MSK(nfc)) {
 		for (i = 0; i < nchunks; i++) {
 			int data_off = i * ecc->size;
 			unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, i);
@@ -1649,7 +1683,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 			u8 *data = buf + data_off;
 			u8 *oob = nand->oob_poi + oob_off;
 
-			if (!(status & NFC_ECC_ERR(i)))
+			if (!(snapshot.status & NFC_ECC_ERR(i)))
 				continue;
 
 			ret = sunxi_nfc_hw_ecc_read_error(nand, data, data_off, oob,

-- 
2.53.0

