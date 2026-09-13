Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4471D38C410
	for <linux-sunxi@lists.linux.dev>; Sun, 13 Sep 2026 04:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789272344; cv=none; b=Tetqr0c7YPQmdpilFQrAaP5/rUWMw/tSjaXnPoX/+7bo4B187qRIcJ/XRcEyQwTVzsfaGaaWSAVPLD52YRe3xvPY+6bLXxnohguaFjXVRIwKklPy8kkUH4qxRX2eGbux5XQVtoJm9ABbTPj9IVmpemdCD9hEOGeTM2wMHq4LEa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789272344; c=relaxed/simple;
	bh=3HfrlOISvouvOHb/zDf0DeWxK38QXA8QpUUxCtZMkLI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T5mqf0TRjQRj/QqHgJQ0b3OgL8SLgBaOEUc0HMWeT51P9p/fHWa+4XHLA7G4pyRTHgN69NSnb34mHegCzJZ6bqJ9/Q8wYG3fZXjPtTZaEULJI+z6OZz3Tg6PzPnj9a7RJfLUZMfg4tYAfuelfEDvCOjs70pY4YcVSzr6bdrxLNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aVMbiS1B; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aVMbiS1B"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6aa9606ddadso1908703eaf.0
        for <linux-sunxi@lists.linux.dev>; Sat, 12 Sep 2026 21:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272332; x=1789877132; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5rmncXijitRcj9RxOard0Heg+Nrz/VMzyCWVR9VWKLw=;
        b=aVMbiS1B89WosUVQVJDtXXAXOIZiW+JvYoha9vR7Sx7trxbGgbuFmlRe9cWVYWfW3x
         58J21f49xUYt1aVqCw8zIlRuEnj5QWpPRik8uWVUXdQ3AkIe1vS9XyWFrywRFV3mQ4ze
         qIq9KKyE7Zh3hnz1NimCISqkh2upajHMH3Bso4P/s+soQUFXk/MhNN9ezjbd2I5uGiiV
         qVSoUSYZet/wD6SRLkPlY3/efFwZV6lnOvcO6Vv1pi3O07iICe4lHIf5Mr9aLILFkmT8
         KFhCv5zgcD6AVjI3rHuU80ZzBLUNypqtUXYEot+hhYBG58XMCsQ4pwuou/xHYrdallA1
         dCgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272332; x=1789877132;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5rmncXijitRcj9RxOard0Heg+Nrz/VMzyCWVR9VWKLw=;
        b=jnAXmoRlYYnJlFoMNfbk3lNBr4uT6HTmQKYtECNnzHlv9IiP9of3277CjuprE6XZKR
         4dTXI7CDDV0WMaFRQHQ9wXF82Rs/A5mD/1lydGFfqVOCJckhz5e7FGHCrAN66BEB98+X
         nKXN1QXPHBbXufBzY/hE3TzDc+ev+hgVksZShx/51ZWW5afywodHVJtmMo0ml/M3fSZM
         kk6SQQmKH0owhJg6KtRgAERUMZtRc4ly//verFT8z+6HoWcdl3uwpJhhK29yHl8D/5HB
         i0x8VEwVvL+mwA/gP7namDZ9TyRWYWlsg7i7ZWdWjbMVuY9jqf7LZAzp5aq0gNsMcgoz
         8hMw==
X-Forwarded-Encrypted: i=1; AKwUvBxgP5WIgNbX3uNWpPyqmOEyQouG6V+6s/5+ViU3oOctgwi1j2gBNeEEm4V2W6mVGHaGTNz7cnH4jDhtaw==@lists.linux.dev
X-Gm-Message-State: AFuF++lpq1Zt41NAd7mYWbuN4R2l7EJx3+Y2gxMWpduhzvxc0dTV4tJq
	m//Nnso9X3XiCU3OO2lKl/0BbhMogWj42KoayrZp34QCAX6orpOjplE5
X-Gm-Gg: AYBFou2KU7ARkRvlNfti1Hp2lTSYsyaaAnK+po5R4dHfnNgg2vOH4hc83BX3qmsps+E
	tORGs4kYBwN+x4u3NUYpL2/v5SZx8C5zVOTQKQ/Dcd599VBnDaxbwW/FWt/2/glVFAcOEJ1NJNB
	9JH8V3eliWYlhCgj3f8WzDZAO4cQEC1F1rZcaxkvK1f1G2gTPoL8kHnKncRLyAlquTaUwspABn9
	mJGesrWXNok5/rTSQ02JoGQSoVAxeo1Ol4CjkgdgUolZ7WAy/5IfoXdXHcCRZkn23b9iZMorXJg
	QxzEN/VIZsfOxcfZhabk+JSZVVK9cLps/TVA0G7P7VUmlqSdU0XwlN1GszpPXvIftVeyIzYqQBa
	vywpiS+q5IjznCll3XfJTG+qU0WORDKN3lfS2gs83C2DdXdo/GS/AV+F6jlIW40S3CCWO/Qi+Xd
	xjDcRweVN1GavWZHvtKKRTe2olHDa5aL82eF6bcN6AcXf28Dp53usbAz/PqUPSZ26gEQTW8HjQG
	aZiCbsn8vRa+Rp6DgkEFIGYiJ/LBkeO3IThkFS+biNTqSKjo5kOxXsxl//4jvxBUSahXmdPijnH
	JtTMNBAyq277c/1SwvyiDOB1i3HfiLaigHVSbS0B0LpRWZB4oXz8iMsTRKBuLvTYaSxWiCbpBEw
	2EFKZj1Cl5nMXJ3D2F4+tdfinIoX4BQ==
X-Received: by 2002:a4a:ec4c:0:b0:6be:4eb3:e1c7 with SMTP id 006d021491bc7-6c0b985e1d1mr6850526eaf.14.1789272332039;
        Sat, 12 Sep 2026 21:05:32 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699647sm6011535fac.5.2026.09.12.21.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 21:05:31 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 12 Sep 2026 22:05:08 -0600
Subject: [PATCH v4 17/17] mtd: rawnand: sunxi: bound DMA batches by the
 user-data register bank
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-17-4a64bed94229@gmail.com>
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

The H6/H616 controller concatenates protected user data in a bank of 32
four-byte registers. The default layout can allocate more than 128 bytes
across a page, even though each ECC step fits its individual length limit.
DMA transfers then access beyond the user-data register bank. For example,
a 16 KiB page with 1280 OOB bytes and BCH40/1024 has 160 user-data bytes,
while a 16 KiB page with 1664 OOB bytes can allocate 512 bytes.

Do not cap that allocation: changing the lengths would move ECC offsets
and make existing pages written through PIO incompatible. Instead, split
DMA transfers into batches whose aggregate user data fits the bank. Reuse
hardware slots and user-data registers from zero in each batch, retaining
the original logical main-data and OOB offsets. Reposition the main column
and spare-area base before subsequent batches. Keep pages whose user data
already fits on the existing single-batch path.

Pass the user-data register index directly to the protected-OOB helpers
and program length fields from the batch's logical starting step. Collect
each batch's ECC status and protected OOB before reusing the registers.
Keep ECC accounting, erased-page classification and the trailing-OOB read
page-wide, and discard all partial DMA statistics before a PIO read retry.

Use one page-read setup or program-begin command for the whole page. Only
issue program-end after every batch and any trailing OOB transfer succeed.
Do not retry a write in PIO after a batch has already been transferred.
The allocator, free-OOB layout and raw-access callbacks are unchanged.

Fixes: 54dcd6aa69db ("mtd: rawnand: sunxi: introduce maximize variable user data length")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 270 +++++++++++++++++++++++---------------
 1 file changed, 161 insertions(+), 109 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 1303dca74cf9..c43d2d268d84 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -54,6 +54,7 @@
 #define NFC_REG_H6_RDATA_1	0x004C
 #define NFC_REG_A10_USER_DATA	0x0050
 #define NFC_REG_H6_USER_DATA	0x0080
+#define NFC_H6_USER_DATA_REGS	32
 #define NFC_REG_USER_DATA(nfc, x)	(nfc->caps->reg_user_data + ((x) * 4))
 #define NFC_REG_H6_USER_DATA_LEN 0x0070
 /* A USER_DATA_LEN register can hold the length of 8 USER_DATA registers */
@@ -946,44 +947,40 @@ static u8 sunxi_nfc_user_data_sz(struct sunxi_nand_chip *sunxi_nand,
 	return sunxi_nand->user_data_bytes[logical_step];
 }
 
-/*
- * Variable-length user data is concatenated in four-byte registers.
- * PIO uses hardware step zero; DMA slots follow the logical page steps.
- */
-static unsigned int
-sunxi_nfc_user_data_reg_index(struct sunxi_nand_chip *sunxi_nand, int hw_step)
+/* Keep the on-flash layout, but fit each DMA batch in the user-data bank. */
+static int sunxi_nfc_dma_batch_steps(struct nand_chip *nand,
+				     int first_step, int end_step)
 {
-	unsigned int byte_offset = 0;
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	unsigned int user_data_sz = 0;
 	int i;
 
-	for (i = 0; i < hw_step; i++)
-		byte_offset += sunxi_nfc_user_data_sz(sunxi_nand, i);
+	if (!nfc->caps->reg_user_data_len)
+		return end_step - first_step;
+
+	for (i = first_step; i < end_step; i++) {
+		user_data_sz += sunxi_nfc_user_data_sz(sunxi_nand, i);
+		if (user_data_sz > NFC_H6_USER_DATA_REGS * sizeof(u32))
+			break;
+	}
 
-	return byte_offset / 4;
+	return i - first_step;
 }
 
+/* PIO uses register zero; DMA concatenates user data within each batch. */
 static void sunxi_nfc_hw_ecc_get_prot_oob_bytes(struct nand_chip *nand, u8 *oob,
-						int hw_step, bool bbm, int page,
+						unsigned int reg_index, bool bbm, int page,
 						unsigned int user_data_sz)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	u32 user_data;
+	unsigned int i;
 
-	if (!nfc->caps->reg_user_data_len) {
-		user_data = readl(nfc->regs + NFC_REG_USER_DATA(nfc, hw_step));
-		sunxi_nfc_user_data_to_buf(user_data, oob);
-	} else {
-		unsigned int reg_index = sunxi_nfc_user_data_reg_index(sunxi_nand, hw_step);
-		unsigned int reg_off;
-		u8 *ptr = oob;
-		unsigned int i;
-
-		for (i = 0; i < user_data_sz / 4; i++, ptr += 4) {
-			reg_off = NFC_REG_USER_DATA(nfc, reg_index + i);
-			user_data = readl(nfc->regs + reg_off);
-			sunxi_nfc_user_data_to_buf(user_data, ptr);
-		}
+	for (i = 0; i < user_data_sz / 4; i++) {
+		user_data = readl(nfc->regs + NFC_REG_USER_DATA(nfc, reg_index + i));
+		sunxi_nfc_user_data_to_buf(user_data, oob + i * 4);
 	}
 
 	/* Undo hardware de-randomization for a plain on-flash BBM. */
@@ -1038,7 +1035,8 @@ static void sunxi_nfc_set_user_data_len_pio(struct sunxi_nfc *nfc, int len)
 	       nfc->regs + NFC_REG_USER_DATA_LEN(nfc, 0));
 }
 
-static void sunxi_nfc_set_user_data_len_dma(struct nand_chip *nand, int nchunks)
+static void sunxi_nfc_set_user_data_len_dma(struct nand_chip *nand,
+					    int first_step, int nchunks)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
@@ -1054,7 +1052,7 @@ static void sunxi_nfc_set_user_data_len_dma(struct nand_chip *nand, int nchunks)
 		val = 0;
 		for (step = first; step < nchunks &&
 		     step < first + NFC_REG_USER_DATA_LEN_CAPACITY; step++) {
-			len = sunxi_nfc_user_data_sz(sunxi_nand, step);
+			len = sunxi_nfc_user_data_sz(sunxi_nand, first_step + step);
 			code = sunxi_nfc_user_data_len_code(nfc, len);
 			if (code >= 0)
 				val |= field_prep(NFC_USER_DATA_LEN_MSK(step), code);
@@ -1064,13 +1062,14 @@ static void sunxi_nfc_set_user_data_len_dma(struct nand_chip *nand, int nchunks)
 }
 
 static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
-						const u8 *oob, int hw_step,
+						const u8 *oob, unsigned int reg_index,
 						bool bbm, int page,
 						unsigned int user_data_sz)
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	u8 user_data[SUNXI_NFC_MAX_USER_DATA_SZ] = {};
+	unsigned int i;
 
 	/* Pre-randomize the BBM so the hardware writes it plain on flash. */
 	if (bbm && (nand->options & NAND_NEED_SCRAMBLING) &&
@@ -1080,18 +1079,9 @@ static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
 		oob = user_data;
 	}
 
-	if (!nfc->caps->reg_user_data_len) {
-		writel(sunxi_nfc_buf_to_user_data(oob),
-		       nfc->regs + NFC_REG_USER_DATA(nfc, hw_step));
-	} else {
-		unsigned int reg_index = sunxi_nfc_user_data_reg_index(sunxi_nand, hw_step);
-		const u8 *ptr = oob;
-		unsigned int i;
-
-		for (i = 0; i < user_data_sz / 4; i++, ptr += 4) {
-			writel(sunxi_nfc_buf_to_user_data(ptr),
-			       nfc->regs + NFC_REG_USER_DATA(nfc, reg_index + i));
-		}
+	for (i = 0; i < user_data_sz / 4; i++) {
+		writel(sunxi_nfc_buf_to_user_data(oob + i * 4),
+		       nfc->regs + NFC_REG_USER_DATA(nfc, reg_index + i));
 	}
 }
 
@@ -1374,7 +1364,7 @@ static int sunxi_get_ecc_offset(struct sunxi_nand_chip *sunxi_nand,
 				struct nand_ecc_ctrl *ecc, int logical_step)
 {
 	return sunxi_get_oob_offset(sunxi_nand, ecc, logical_step) +
-		sunxi_nfc_user_data_sz(sunxi_nand, logical_step);
+		 sunxi_nfc_user_data_sz(sunxi_nand, logical_step);
 }
 
 static int sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
@@ -1568,36 +1558,47 @@ sunxi_nfc_hw_ecc_finish_randomized_read(struct nand_chip *nand, u8 *buf,
 	return result->max_bitflips;
 }
 
-static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf,
-					    int oob_required, int page,
-					    int nchunks)
+static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand, u8 *buf,
+					   int oob_required, int page,
+					   int first_step, int nchunks,
+					   struct sunxi_nfc_ecc_status *result,
+					   bool *erased_chunk_found)
 {
 	bool randomized = nand->options & NAND_NEED_SCRAMBLING;
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	struct sunxi_nfc_ecc_status result = {};
 	struct sunxi_nfc_ecc_snapshot snapshot;
-	unsigned int corrected = mtd->ecc_stats.corrected;
-	unsigned int failed = mtd->ecc_stats.failed;
+	unsigned int reg_index = 0, user_data_sz;
 	unsigned int max_bitflips = 0;
-	bool erased_chunk_found = false;
 	int ret, i;
 	struct scatterlist sg;
 	u32 wait;
 
+	if (first_step) {
+		ret = nand_change_read_column_op(nand, first_step * ecc->size,
+						 NULL, 0, false);
+		if (ret)
+			return ret;
+	}
+
 	ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
 	if (ret)
 		return ret;
 
-	ret = sunxi_nfc_dma_op_prepare(nfc, buf, ecc->size, nchunks,
+	ret = sunxi_nfc_dma_op_prepare(nfc, buf + first_step * ecc->size,
+				       ecc->size, nchunks,
 				       DMA_FROM_DEVICE, &sg);
 	if (ret)
 		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
-	sunxi_nfc_set_user_data_len_dma(nand, nchunks);
+	sunxi_nfc_set_user_data_len_dma(nand, first_step, nchunks);
+	/* exec_op() restores the page's spare base during column changes. */
+	if (first_step)
+		writel(mtd->writesize + sunxi_get_oob_offset(sunxi_nand, ecc, first_step),
+		       nfc->regs + NFC_REG_SPARE_AREA(nfc));
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 
@@ -1628,18 +1629,21 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 
 	sunxi_nfc_hw_ecc_read_status(nand, &snapshot);
 
-	for (i = 0; i < nchunks; i++) {
-		int data_off = i * ecc->size;
-		unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, i);
-		int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
+	for (i = 0; i < nchunks; i++, reg_index += user_data_sz / 4) {
+		int logical_step = first_step + i;
+		int data_off = logical_step * ecc->size;
+		int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, logical_step);
 		u8 *data = buf + data_off;
 		u8 *oob = nand->oob_poi + oob_off;
 		bool erased;
 		int bitflips;
 
+		user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, logical_step);
+
 		if (sunxi_nand->randomized_oob) {
-			sunxi_nfc_hw_ecc_record_status(nand, &result, i, i, &snapshot);
-			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, i, !i,
+			sunxi_nfc_hw_ecc_record_status(nand, result, logical_step, i,
+						       &snapshot);
+			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, reg_index, !logical_step,
 							    page, user_data_sz);
 			continue;
 		}
@@ -1659,44 +1663,73 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 							 oob, ecc->bytes + user_data_sz,
 							 false);
 			if (ret)
-				goto err_stats;
+				return ret;
 
-			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, i, !i,
+			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, reg_index, !logical_step,
 							    page, user_data_sz);
 		}
 
 		if (erased)
-			erased_chunk_found = true;
+			*erased_chunk_found = true;
 
 		sunxi_nfc_hw_ecc_update_stats(nand, &max_bitflips, bitflips);
 	}
 
 	if (sunxi_nand->randomized_oob)
-		return sunxi_nfc_hw_ecc_finish_randomized_read(nand, buf, &result,
-							     oob_required, true, page);
+		return 0;
 
 	if (snapshot.status & NFC_ECC_ERR_MSK(nfc)) {
 		for (i = 0; i < nchunks; i++) {
-			int data_off = i * ecc->size;
-			unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, i);
-			int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
+			int logical_step = first_step + i;
+			int data_off = logical_step * ecc->size;
+			int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, logical_step);
 			u8 *data = buf + data_off;
 			u8 *oob = nand->oob_poi + oob_off;
 
 			if (!(snapshot.status & NFC_ECC_ERR(i)))
 				continue;
 
+			user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, logical_step);
 			ret = sunxi_nfc_hw_ecc_read_error(nand, data, data_off, oob,
 							  mtd->writesize + oob_off,
 							  user_data_sz,
 							  &max_bitflips);
 			if (ret < 0)
-				goto err_stats;
+				return ret;
 			if (ret)
-				erased_chunk_found = true;
+				*erased_chunk_found = true;
 		}
 	}
 
+	return max_bitflips;
+}
+
+static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
+					    int oob_required, int page, int nchunks)
+{
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
+	struct mtd_info *mtd = nand_to_mtd(nand);
+	struct sunxi_nfc_ecc_status result = {};
+	unsigned int corrected = mtd->ecc_stats.corrected;
+	unsigned int failed = mtd->ecc_stats.failed;
+	unsigned int max_bitflips = 0;
+	bool erased_chunk_found = false;
+	int first_step, batch_steps, ret;
+
+	for (first_step = 0; first_step < nchunks; first_step += batch_steps) {
+		batch_steps = sunxi_nfc_dma_batch_steps(nand, first_step, nchunks);
+		ret = sunxi_nfc_hw_ecc_read_batch_dma(nand, buf, oob_required, page,
+						      first_step, batch_steps, &result,
+						      &erased_chunk_found);
+		if (ret < 0)
+			goto err_stats;
+		max_bitflips = max_t(unsigned int, max_bitflips, ret);
+	}
+
+	if (sunxi_nand->randomized_oob)
+		return sunxi_nfc_hw_ecc_finish_randomized_read(nand, buf, &result,
+							     oob_required, true, page);
+
 	if (oob_required) {
 		ret = sunxi_nfc_hw_ecc_read_extra_oob(nand, nand->oob_poi,
 						      NULL, !erased_chunk_found, page);
@@ -2029,68 +2062,87 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
+	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	struct scatterlist sg;
 	u32 wait;
-	int ret, i;
+	int first_step, batch_steps, ret, i;
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
-	ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
-	if (ret)
-		return ret;
+	for (first_step = 0; first_step < ecc->steps; first_step += batch_steps) {
+		unsigned int reg_index = 0;
 
-	ret = sunxi_nfc_dma_op_prepare(nfc, buf, ecc->size, ecc->steps,
-				       DMA_TO_DEVICE, &sg);
-	if (ret)
-		goto pio_fallback;
+		batch_steps = sunxi_nfc_dma_batch_steps(nand, first_step, ecc->steps);
+		ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
+		if (ret)
+			return ret;
 
-	sunxi_nfc_set_user_data_len_dma(nand, ecc->steps);
-	for (i = 0; i < ecc->steps; i++) {
-		unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, i);
-		int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
-		const u8 *oob = nand->oob_poi + oob_off;
+		ret = sunxi_nfc_dma_op_prepare(nfc, buf + first_step * ecc->size,
+					       ecc->size, batch_steps, DMA_TO_DEVICE, &sg);
+		if (ret) {
+			/* Only retry before any part of the page has been transferred. */
+			if (first_step)
+				return ret;
+			goto pio_fallback;
+		}
 
-		sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, i, !i, page,
-						    user_data_sz);
-	}
+		sunxi_nfc_set_user_data_len_dma(nand, first_step, batch_steps);
+		for (i = first_step; i < first_step + batch_steps; i++) {
+			unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, i);
+			int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
+			const u8 *oob = nand->oob_poi + oob_off;
 
-	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
-	if (ret) {
-		sunxi_nfc_dma_op_abort(nfc);
-		sunxi_nfc_dma_op_cleanup(nfc, DMA_TO_DEVICE, &sg);
-		return ret;
-	}
+			sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, reg_index, !i,
+							    page, user_data_sz);
+			reg_index += user_data_sz / 4;
+		}
 
-	sunxi_nfc_hw_ecc_enable(nand);
-	sunxi_nfc_randomizer_config(nand, page, false);
-	sunxi_nfc_randomizer_enable(nand);
+		if (first_step)
+			ret = nand_change_write_column_op(nand, first_step * ecc->size,
+							  NULL, 0, false);
+		else
+			ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+		if (ret) {
+			sunxi_nfc_dma_op_abort(nfc);
+			sunxi_nfc_dma_op_cleanup(nfc, DMA_TO_DEVICE, &sg);
+			return ret;
+		}
 
-	writel((NAND_CMD_RNDIN << 8) | NAND_CMD_PAGEPROG,
-	       nfc->regs + NFC_REG_WCMD_SET);
+		/* exec_op() restores the page's spare base during column changes. */
+		if (first_step)
+			writel(mtd->writesize + sunxi_get_oob_offset(sunxi_nand, ecc, first_step),
+			       nfc->regs + NFC_REG_SPARE_AREA(nfc));
+		sunxi_nfc_hw_ecc_enable(nand);
+		sunxi_nfc_randomizer_config(nand, page, false);
+		sunxi_nfc_randomizer_enable(nand);
 
-	wait = NFC_CMD_INT_FLAG;
+		writel((NAND_CMD_RNDIN << 8) | NAND_CMD_PAGEPROG,
+		       nfc->regs + NFC_REG_WCMD_SET);
 
-	if (nfc->use_mdma)
-		wait |= NFC_DMA_INT_FLAG;
-	else
-		dma_async_issue_pending(nfc->dmac);
+		wait = NFC_CMD_INT_FLAG;
 
-	writel(NFC_PAGE_OP | NFC_DATA_SWAP_METHOD |
-	       NFC_DATA_TRANS | NFC_ACCESS_DIR,
-	       nfc->regs + NFC_REG_CMD);
+		if (nfc->use_mdma)
+			wait |= NFC_DMA_INT_FLAG;
+		else
+			dma_async_issue_pending(nfc->dmac);
 
-	ret = sunxi_nfc_wait_events(nfc, wait, false, 0);
-	if (ret)
-		sunxi_nfc_dma_op_abort(nfc);
+		writel(NFC_PAGE_OP | NFC_DATA_SWAP_METHOD |
+		       NFC_DATA_TRANS | NFC_ACCESS_DIR,
+		       nfc->regs + NFC_REG_CMD);
 
-	sunxi_nfc_randomizer_disable(nand);
-	sunxi_nfc_hw_ecc_disable(nand);
+		ret = sunxi_nfc_wait_events(nfc, wait, false, 0);
+		if (ret)
+			sunxi_nfc_dma_op_abort(nfc);
 
-	sunxi_nfc_dma_op_cleanup(nfc, DMA_TO_DEVICE, &sg);
+		sunxi_nfc_randomizer_disable(nand);
+		sunxi_nfc_hw_ecc_disable(nand);
 
-	if (ret)
-		return ret;
+		sunxi_nfc_dma_op_cleanup(nfc, DMA_TO_DEVICE, &sg);
+
+		if (ret)
+			return ret;
+	}
 
 	if (oob_required || (nand->options & NAND_NEED_SCRAMBLING)) {
 		/* TODO: use DMA to transfer extra OOB bytes ? */

-- 
2.53.0

