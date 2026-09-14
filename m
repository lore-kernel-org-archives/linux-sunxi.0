Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520D935295C
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Sep 2026 03:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789354916; cv=none; b=SYO/xDOc7MTBPS7qtORrzOUrcqPkPcW/YpLxrAlc2vQK00FfpyCEHgfhVWHnaYeu5+nsc/WCyoZQXCBeluKEcnUYzubRKKgYANiESeP0emK6LpyqOPJ7WqBjL8RLGRBZV4+3ksjdoPslTVDIcSs58hIssIs0OAjYMHSZgKPgEGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789354916; c=relaxed/simple;
	bh=o3NPqjDQtjCU8+r59n9WbZaWXsVSsfQ6oMXDXHHDqIA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IS+fPojB7jI8Ff9BrV21PD/xYMIp171sqiqAj77C8EO+ApGZupSq1BpJQSTu6L+ldQiS8Pt7WQ5loM1r/kedi0g2nNU2lskhOWhGlUMIhmvLMmIC2VF7TukBB60dLmlM2L8OESKy0tGrtPFHZJPsScCgsprRuuKlcRwP30ccBOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LMfcqoOn; arc=none smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LMfcqoOn"
Received: by mail-oo2-f42.google.com with SMTP id 46e09a7af769-7f4f0c89e35so966499a34.2
        for <linux-sunxi@lists.linux.dev>; Sun, 13 Sep 2026 20:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789354911; x=1789959711; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3gIMuO5LgsmThmwiwqzrGE8ky+825OhMeKFgclE6Udc=;
        b=LMfcqoOnOrhw4pzyqd7opaCmqbG8jA2V4Bz36P0vyMXOyeEw+syKMGrz132MlnebMi
         dWkm2efghHAreHpyJ7Oc8yvq7HIxiAw3LqjHHkbhOU3vy7Fk/0NRdQPwBHCxxTUW4hNV
         kvL2Sv8r6pVwP12fJhkLS3Q5PzwnzluSTEDU7Up4KHBJVpvHx5XOl/B9dsdBtA6QhM+b
         rB/pRrPsg7IE8NimXrnN5dcGeEmu4TCMoXRUo3hCw9im96O5loB9wdftugG+o3718g1g
         /oMVt28JHmNKmckTm4NxQSRf/1yzm27+RsqJOxk77Bqoj4iZ60dcwuFVWP8ytSqkEwsq
         IFgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354911; x=1789959711;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3gIMuO5LgsmThmwiwqzrGE8ky+825OhMeKFgclE6Udc=;
        b=nmszhxQL1R/ZcWMvs52h5IMXBqYFDH/7T4tsWIzTXnDmMmdIFiA/5BZK7y6XyB7hx/
         FXNeJYvmISehR9TKa+UajP2kIPFkUCywo7KWxq/DJoB2OjkJbRXf038Z2hH2Mqwa23ht
         zaQIrpSTZIHdf9tRJ4/zm8MjZ7llMunY4bNhYitzygSD7RnrYyatWwM7kHAjRFqWzznZ
         /H9w9XnKSagaOcz8COcryHBQBq5PBmKOlHZa85oujHwAjg+ylrx1/rOdY6ugRgukFf9l
         h3uS/Z72dvBKNHpTDaCRFPhKUcwYhqPamzWJyUp1ahIhf/fKJ53ug4b1Mc1XCySX0wEZ
         yxkg==
X-Forwarded-Encrypted: i=1; AKwUvBxLvFEFFc/OTNbtfFOnJNngnvUYm6MRIp9NsnmJ9O/715QlUht50p6+Jb/XE1K5+f8BFniiA/E2cYFoIQ==@lists.linux.dev
X-Gm-Message-State: AFuF++l75cR8MinrDGDet76FOVlZ+evGWY865WTh5d2St9MYbLQa33aI
	IMhUkmzvsKvXwzXfwikIZTQnsT1ERqePkRA/moCCVgR9hbopoXmH7Cri
X-Gm-Gg: AYBFou1XIL1S6Rh/yxFfzyBy91Z39s3MRQWJS/yITFV9w67tbCnzChmPCbSU1cFdc16
	lEoodxSN0xM8ihF5cbjE+fmrR8p13nKES3ZkyKrAoFpYz2ZMJxhruHm/58OeZxCyUzIf/2uhxyJ
	shSkb23rezo5NZzahRC5gwi5eQlRUVsaocI12x+w6ktild2vdNMa59Epdazssn3Z+Iny+95LjV0
	JvmerhPdQV2mMMk60nxFoTWeHlupW3RMJ3GWF9EjwfzrbOBZcy6iWhAT2ehkZkfBXMVfaviSQJ3
	zSYCDLdLYywU2rAmLUVtcqEIlJ24wM4fiD02sgkuwVmcJD9oZ+u4/A45pKFp+Ml+kedg2T+xCR7
	tl8a9KH/gHrWnC/Y2T6ZnXrsTR/9M39fPFpNBV/a9o7oePNnTDp4Nb5DNbpEw1zva2rbzfND3zw
	Yupyd32vzey+7whnF/HsaDgoAWgvEkTAvGcCqJXqKZrSmm9abBYHNt2GzuLpfoFCnWPrGERtEMh
	BM0ZNGEqiU7u7iPcyydcs6SPUe9iiD95Re3mEk8bxi3AmRN4eh/fQEMzZt1tgIkxvaefXBV8lLm
	6wJmCLqPmMaX/2IxL39Gc1TG0zfnxOBCzQpau9XclogHoiI3XcQboeBRy5yYatjXasjjW8qfuHc
	QMLPWFKLThIyc0LGnDxOre7UIevhR4A==
X-Received: by 2002:a05:6830:2a8c:b0:7d7:d524:bc88 with SMTP id 46e09a7af769-80897c891b2mr304523a34.10.1789354911083;
        Sun, 13 Sep 2026 20:01:51 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60feba1sm10619014a34.13.2026.09.13.20.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:01:50 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Sep 2026 21:01:15 -0600
Subject: [PATCH v5 09/18] mtd: rawnand: sunxi: use page reads to reposition
 small-page NAND
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-9-7d711076a6f7@gmail.com>
References: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
In-Reply-To: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
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

The hardware-ECC read paths use random-column commands to revisit main
data and OOB. Small-page NAND does not support these commands, and
nand_change_read_column_op() rejects pages of 512 bytes or less. Ignoring
that error does not provide a physical reread: the erased-chunk check can
instead inspect stale buffer contents.

Introduce a read-column helper which starts a new page read for small-page
NAND. Let the NAND core select READ0, READ1 or READOOB and send the row
address. Keep random-column commands for large pages. Pass the page number
through the erased-chunk fallback and use the helper for normal OOB reads
as well.

Retain transport errors and only classify a physical chunk after all its
rereads succeed. Read exactly the requested region so the tracked column
still matches the start of any trailing OOB.

Also select PIO callbacks for small-page hardware ECC even when DMA is
available. The DMA page sequencer uses large-page random-column commands;
PIO can stream the single 512-byte ECC step and its OOB without them.

Keep the ECC geometry checks unchanged. In particular, the usual 512+16
geometry still cannot fit the controller's minimum 28 parity bytes and
four user-data bytes. This fixes the command handling for small-page
geometries that pass those checks, not a demonstrated regression on a
previously working 512+16 device. Software-ECC and raw callbacks,
large-page DMA eligibility and the on-flash layout are unchanged.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Fixes: 614049a8d904 ("mtd: nand: sunxi: add support for DMA assisted operations")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 40 +++++++++++++++++++++++----------------
 1 file changed, 24 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 13dc0af56eb3..e29638c828ca 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1079,6 +1079,16 @@ static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,
 	}
 }
 
+static int sunxi_nfc_read_column(struct nand_chip *nand, int page,
+				 unsigned int column, void *buf, unsigned int len)
+{
+	/* Small-page NAND needs a new READ0/READ1/READOOB and the page address. */
+	if (nand_to_mtd(nand)->writesize <= 512)
+		return nand_read_page_op(nand, page, column, buf, len);
+
+	return nand_change_read_column_op(nand, column, buf, len, false);
+}
+
 /*
  * Return 1 for an erased chunk or 0 for an uncorrectable chunk, with ECC
  * statistics updated in either case. Negative values report transport errors.
@@ -1087,7 +1097,7 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 				       u8 *data, int data_off,
 				       u8 *oob, int oob_off,
 				       unsigned int user_data_sz,
-				       unsigned int *max_bitflips)
+				       unsigned int *max_bitflips, int page)
 {
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	unsigned int oob_len = ecc->bytes + user_data_sz;
@@ -1095,13 +1105,12 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 
 	/* Check the physical representation for bitflips in erased pages. */
 	if (nand->options & NAND_NEED_SCRAMBLING) {
-		ret = nand_change_read_column_op(nand, data_off, data,
-						 ecc->size, false);
+		ret = sunxi_nfc_read_column(nand, page, data_off, data, ecc->size);
 		if (ret)
 			return ret;
 	}
 
-	ret = nand_change_read_column_op(nand, oob_off, oob, oob_len, false);
+	ret = sunxi_nfc_read_column(nand, page, oob_off, oob, oob_len);
 	if (ret)
 		return ret;
 
@@ -1169,7 +1178,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	const int nfc_step = 0;
 
 	if (*cur_off != data_off) {
-		ret = nand_change_read_column_op(nand, data_off, NULL, 0, false);
+		ret = sunxi_nfc_read_column(nand, page, data_off, NULL, 0);
 		if (ret)
 			return ret;
 	}
@@ -1179,7 +1188,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 		return ret;
 
 	if (data_off + ecc->size != oob_off) {
-		ret = nand_change_read_column_op(nand, oob_off, NULL, 0, false);
+		ret = sunxi_nfc_read_column(nand, page, oob_off, NULL, 0);
 		if (ret)
 			return ret;
 	}
@@ -1217,13 +1226,12 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 
 		return sunxi_nfc_hw_ecc_read_error(nand, data, data_off,
 						 oob, oob_off, user_data_sz,
-						 max_bitflips);
+						 max_bitflips, page);
 	} else {
 		memcpy_fromio(data, nfc->regs + NFC_RAM0_BASE, ecc->size);
 
 		if (oob_required) {
-			ret = nand_change_read_column_op(nand, oob_off, NULL, 0,
-							 false);
+			ret = sunxi_nfc_read_column(nand, page, oob_off, NULL, 0);
 			if (ret)
 				return ret;
 			ret = sunxi_nfc_randomizer_read_buf(nand, oob,
@@ -1285,8 +1293,8 @@ static int sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
 		return 0;
 
 	if (!cur_off || *cur_off != (offset + mtd->writesize)) {
-		ret = nand_change_read_column_op(nand, mtd->writesize + offset,
-						 NULL, 0, false);
+		ret = sunxi_nfc_read_column(nand, page, mtd->writesize + offset,
+					    NULL, 0);
 		if (ret)
 			return ret;
 	}
@@ -1386,9 +1394,8 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 
 		if (oob_required && !erased) {
 			/* TODO: use DMA to retrieve OOB */
-			ret = nand_change_read_column_op(nand, mtd->writesize + oob_off,
-							 oob, ecc->bytes + user_data_sz,
-							 false);
+			ret = sunxi_nfc_read_column(nand, page, mtd->writesize + oob_off,
+						    oob, ecc->bytes + user_data_sz);
 			if (ret)
 				goto err_stats;
 
@@ -1416,7 +1423,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 			ret = sunxi_nfc_hw_ecc_read_error(nand, data, data_off, oob,
 							  mtd->writesize + oob_off,
 							  user_data_sz,
-							  &max_bitflips);
+							  &max_bitflips, page);
 			if (ret < 0)
 				goto err_stats;
 			if (ret)
@@ -2305,7 +2312,8 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	ecc->write_oob = sunxi_nfc_hw_ecc_write_oob;
 	mtd_set_ooblayout(mtd, &sunxi_nand_ooblayout_ops);
 
-	if (nfc->dmac || nfc->use_mdma) {
+	/* The DMA page sequencer uses large-page random-column commands. */
+	if (mtd->writesize > 512 && (nfc->dmac || nfc->use_mdma)) {
 		ecc->read_page = sunxi_nfc_hw_ecc_read_page_dma;
 		ecc->read_subpage = sunxi_nfc_hw_ecc_read_subpage_dma;
 		ecc->write_page = sunxi_nfc_hw_ecc_write_page_dma;

-- 
2.53.0

