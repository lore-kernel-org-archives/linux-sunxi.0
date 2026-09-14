Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5D735DA5D
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Sep 2026 03:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789354918; cv=none; b=oDUlIlm7xBKpcAl4O6tmIHR3i8w7my0KJtQ3LZfMPA8SC8Mi+NtCNlIEclP6Rn3ebvlqJYM/cod9xQzV7OLYa928Up5u35JRs5Z2rtaJjR09W9q7n8bTgBgbyONAh8hK7jPlAPhwYARjyuayAXb5Ac3Orc73sebweGTNEeBO/jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789354918; c=relaxed/simple;
	bh=0vst0CVnlry03ftKyPut9wNxD9SkwAYgr+pMgxkNU28=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ju44kmsb9RfcKOJ32HAENzWK9FGfbYP1+K4X5brb2DiI0ijJWC6nB7nw/SK0U7RUkHmO2fd+GhuIeKKzpSWgCg2xk76Bf1g7Nl7iocyka1lLl5nK6uby54tCA0M+uJ7XmOymibuaUhuZPpccbZsZVbqD1ppGQnSCQi5pM5WJ9wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SifLoa/b; arc=none smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SifLoa/b"
Received: by mail-oo2-f42.google.com with SMTP id 46e09a7af769-8050801d337so1103248a34.2
        for <linux-sunxi@lists.linux.dev>; Sun, 13 Sep 2026 20:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789354914; x=1789959714; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Wt8ZYJ1+YeVWIymrCDD1Zyg4sGrqRQe4OCsHxO3n6g=;
        b=SifLoa/boS/YTS1X8swMgSsxhLZmNLWMHIsRiBjmC14FqxRpXylyEkSQOp+GpEGMiF
         ng0SKoq2dTuoR4BpfBdn2XwcnYwUqI2xg5aTZjkei5d5yILzIafsoK8JYFt16K5FIM6y
         4cNBZmsgeG0WYy4bXmLXmH8qjqWKhrnV2Lwk2JMfGovcZZRYsjD+Lv6c2k3YXJJ2oua/
         UF9ikUPZjk2LhjHZH3kHrSkoOu5wAj0glMDcDvYyNSwguBl04tt83mbbBDclQV5I5+Rh
         BVSS23QBfRq8vwFykRctLNXzNlraT5f3/wzyzexCIBR4k1nDAGEc/Mbs9GdRq01i5zyb
         orEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354914; x=1789959714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Wt8ZYJ1+YeVWIymrCDD1Zyg4sGrqRQe4OCsHxO3n6g=;
        b=FdYGvJG+tXuZcmasSnX6pwwMgdmSBrwH1pBulvUylwF3EcYDR9ngJtcAh9baSqG8G1
         km2ANlSYoldfPz4+/PbAJss8D2rq7n8wA4QZAFv7FltEIgSGpsXil1DD1KZ5jhBfJLTd
         2EgIikHRWAC/n/3YpkFiTfmTsUuEtBCMjtBMT7/mz3hV7/obcDeDVVSutbizOk7Uhu7v
         R+YGjGuBKRy1eLKl7vkpcDzcstVabHT6f5b7YxYZxeg63DehoLWhoGpmNkzav7PkNX6s
         sr1Pq17ori7KKDJ2BWjve1/+e9OeFUydhBd8KOOOeUf0KWqCh0ix+bJj2BWvWDYSXbSq
         i3zA==
X-Forwarded-Encrypted: i=1; AKwUvBzIVhLjWOE+Q7AZehJrvCDipfUIqx9ysGT2p+VBHLfZTM//lN841uqqOD1F2z1mgNhyBSDKNA17xGhc/w==@lists.linux.dev
X-Gm-Message-State: AFuF++nd4+4qdugpYJc6DJ12maYo/aoNeg7XdhccvrPTWG994635Cw+U
	mUC82duW3cmtu47utnsNVeTlrCkt4bF8uKoG42h0lvLSFkQxJvj3ghGN
X-Gm-Gg: AYBFou3+3uHMd8iV+qG6e0Cbw+Y0IphJLQJRBRHt42o/xu2OhRchy8AkHUH5Ngbam+M
	Abml1TRN8N1f3x+oc9b1ieh3al3suaSLyRCQU7Hy9H7elSmo1BQD7ORzHdnePclp2Yoni7phbM+
	EcJQYK2FnQR0keBNk0LjnH5uU7CNwMQHYAm8ZZnbmhz8vwblOwK0tyLu6Ko7ynvDbq+jF0eOauk
	QGsnJ9hNvU32UMeIOMA/3R/WBhyAP6tAtHooVX6s05vxkNtkxKnf7Q4RCSyjrC1tfMT+TITG3p9
	X+AR4LCXRfL3D83YNkx83Zkwcasz78k9E1U+wilNZE8sZwCel/oD4NZK9zBZfYYATodxXDUnm25
	xE0+pwZbjW9yIMSI+VSljUjBbgaJK5MOpfSJlVkwY7rX+KVGvzvZU2M7rxBDP5zWd/QZ0u6dbPP
	rYyDGS7LgkCQqXvfpl7dyR7e1ALSdvCOj6aVv6RpVBaIozqsxQ2PJWc20s6R+VCX11knB5pVEaJ
	7G7BXjO5MTYCsGezE+LSWWaJNeCNlihPtwvjDNslE8lB0wQECYZPdklrmOPczcs0YB7fTYcpn4t
	54lfnhTxYX6fTcaCDy1prZhWpcs3/lRkAP7w0jUtC+nVALoPdThRKzl4TlAN9ygHDVJita6+AXs
	gLzXBE2D8i8R4winEHW2TISBxJ0qw4E38sK1yloj/
X-Received: by 2002:a05:6830:6a98:b0:7e1:cbe3:bb1b with SMTP id 46e09a7af769-808942ffab2mr584784a34.0.1789354914222;
        Sun, 13 Sep 2026 20:01:54 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60feba1sm10619014a34.13.2026.09.13.20.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:01:53 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Sep 2026 21:01:17 -0600
Subject: [PATCH v5 11/18] mtd: rawnand: sunxi: clarify OOB register and
 step handling
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-11-7d711076a6f7@gmail.com>
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

PIO reuses hardware slot zero while the user-data length and OOB offset
belong to the logical page step. Name the two indices explicitly in the
helpers so their different roles are visible at each call site. The
protected-OOB helpers already take a batch-local register index separately.

Clarify why the plain-marker format compensates the bad-block marker
around hardware randomization.

Rename raw_mode to erased_chunk_found in the page readers and DMA batch
helper, using a boolean in both paths. The flag suppresses randomization
of the trailing OOB after an erased chunk; it does not select MTD_OPS_RAW.
No on-flash format, register-access sequence or ECC accounting changes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 87 ++++++++++++++++++++-------------------
 1 file changed, 44 insertions(+), 43 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index fbea6f16ea9d..7cefb4d6951d 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -925,12 +925,13 @@ static inline u32 sunxi_nfc_buf_to_user_data(const u8 *buf)
 	return buf[0] | (buf[1] << 8) | (buf[2] << 16) | (buf[3] << 24);
 }
 
-static u8 sunxi_nfc_user_data_sz(struct sunxi_nand_chip *sunxi_nand, int step)
+static u8 sunxi_nfc_user_data_sz(struct sunxi_nand_chip *sunxi_nand,
+				 int logical_step)
 {
 	if (!sunxi_nand->user_data_bytes)
 		return USER_DATA_SZ;
 
-	return sunxi_nand->user_data_bytes[step];
+	return sunxi_nand->user_data_bytes[logical_step];
 }
 
 /* Keep the on-flash layout, but fit each DMA batch in the user-data bank. */
@@ -968,7 +969,7 @@ static void sunxi_nfc_hw_ecc_get_prot_oob_bytes(struct nand_chip *nand, u8 *oob,
 		sunxi_nfc_user_data_to_buf(user_data, oob + i * 4);
 	}
 
-	/* De-randomize the Bad Block Marker. */
+	/* Undo hardware de-randomization for a plain on-flash BBM. */
 	if (bbm && (nand->options & NAND_NEED_SCRAMBLING))
 		sunxi_nfc_randomize_bbm(nand, page, oob);
 }
@@ -990,7 +991,7 @@ static void sunxi_nfc_reset_user_data_len(struct sunxi_nfc *nfc)
 }
 
 static void sunxi_nfc_set_user_data_len(struct sunxi_nfc *nfc,
-					int len, int step)
+					int len, int hw_step)
 {
 	bool found = false;
 	u32 val;
@@ -1013,11 +1014,11 @@ static void sunxi_nfc_set_user_data_len(struct sunxi_nfc *nfc,
 		return;
 	}
 
-	val = readl(nfc->regs + NFC_REG_USER_DATA_LEN(nfc, step));
+	val = readl(nfc->regs + NFC_REG_USER_DATA_LEN(nfc, hw_step));
 
-	val &= ~NFC_USER_DATA_LEN_MSK(step);
-	val |= field_prep(NFC_USER_DATA_LEN_MSK(step), i);
-	writel(val, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, step));
+	val &= ~NFC_USER_DATA_LEN_MSK(hw_step);
+	val |= field_prep(NFC_USER_DATA_LEN_MSK(hw_step), i);
+	writel(val, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, hw_step));
 }
 
 static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
@@ -1029,7 +1030,7 @@ static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
 	u8 user_data[SUNXI_NFC_MAX_USER_DATA_SZ] = {};
 	unsigned int i;
 
-	/* Randomize the Bad Block Marker. */
+	/* Pre-randomize the BBM so the hardware writes it plain on flash. */
 	if (bbm && (nand->options & NAND_NEED_SCRAMBLING)) {
 		memcpy(user_data, oob, user_data_sz);
 		sunxi_nfc_randomize_bbm(nand, page, user_data);
@@ -1099,7 +1100,7 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 }
 
 static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
-				    int step, u32 status, u32 pattern_found,
+				    int hw_step, u32 status, u32 pattern_found,
 				    unsigned int user_data_sz, bool *erased)
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
@@ -1108,13 +1109,13 @@ static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 
 	*erased = false;
 
-	if (status & NFC_ECC_ERR(step))
+	if (status & NFC_ECC_ERR(hw_step))
 		return -EBADMSG;
 
-	if (pattern_found & BIT(step)) {
+	if (pattern_found & BIT(hw_step)) {
 		u8 pattern;
 
-		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & BIT(step)))) {
+		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & BIT(hw_step)))) {
 			pattern = 0x0;
 		} else {
 			pattern = 0xff;
@@ -1130,9 +1131,9 @@ static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 		return 0;
 	}
 
-	tmp = readl(nfc->regs + NFC_REG_ECC_ERR_CNT(nfc, step));
+	tmp = readl(nfc->regs + NFC_REG_ECC_ERR_CNT(nfc, hw_step));
 
-	return NFC_ECC_ERR_CNT(step, tmp);
+	return NFC_ECC_ERR_CNT(hw_step, tmp);
 }
 
 static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
@@ -1140,18 +1141,18 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 				       u8 *oob, int oob_off,
 				       int *cur_off,
 				       unsigned int *max_bitflips,
-				       int step, bool oob_required, int page)
+				       int logical_step, bool oob_required, int page)
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
-	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
+	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, logical_step);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	u32 pattern_found;
-	bool bbm = !step;
+	bool bbm = !logical_step;
 	bool erased;
 	int ret, bitflips;
 	/* From the controller point of view, we are at step 0 */
-	const int nfc_step = 0;
+	const int hw_step = 0;
 
 	if (*cur_off != data_off) {
 		ret = sunxi_nfc_read_column(nand, page, data_off, NULL, 0);
@@ -1173,7 +1174,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	if (ret)
 		return ret;
 
-	sunxi_nfc_set_user_data_len(nfc, user_data_sz, nfc_step);
+	sunxi_nfc_set_user_data_len(nfc, user_data_sz, hw_step);
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD | NFC_ECC_OP,
@@ -1190,7 +1191,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	pattern_found = field_get(NFC_ECC_PAT_FOUND_MSK(nfc), pattern_found);
 
 	bitflips = sunxi_nfc_hw_ecc_correct(nand, data, oob_required ? oob : NULL,
-					    nfc_step, readl(nfc->regs + NFC_REG_ECC_ST),
+					    hw_step, readl(nfc->regs + NFC_REG_ECC_ST),
 					    pattern_found, user_data_sz, &erased);
 	if (erased)
 		return 1;
@@ -1216,7 +1217,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 			if (ret)
 				return ret;
 
-			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, nfc_step,
+			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, hw_step,
 							    bbm, page, user_data_sz);
 		}
 	}
@@ -1231,12 +1232,12 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
  * (it includes the user data before the ECC data.)
  */
 static int sunxi_get_oob_offset(struct sunxi_nand_chip *sunxi_nand,
-				struct nand_ecc_ctrl *ecc, int step)
+				struct nand_ecc_ctrl *ecc, int logical_step)
 {
-	int ecc_off = step * ecc->bytes;
+	int ecc_off = logical_step * ecc->bytes;
 	int i;
 
-	for (i = 0; i < step; i++)
+	for (i = 0; i < logical_step; i++)
 		ecc_off += sunxi_nfc_user_data_sz(sunxi_nand, i);
 
 	return ecc_off;
@@ -1248,10 +1249,10 @@ static int sunxi_get_oob_offset(struct sunxi_nand_chip *sunxi_nand,
  * but it skips the next user data.
  */
 static int sunxi_get_ecc_offset(struct sunxi_nand_chip *sunxi_nand,
-				struct nand_ecc_ctrl *ecc, int step)
+				struct nand_ecc_ctrl *ecc, int logical_step)
 {
-	return sunxi_get_oob_offset(sunxi_nand, ecc, step) +
-		sunxi_nfc_user_data_sz(sunxi_nand, step);
+	return sunxi_get_oob_offset(sunxi_nand, ecc, logical_step) +
+		 sunxi_nfc_user_data_sz(sunxi_nand, logical_step);
 }
 
 static int sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
@@ -1292,7 +1293,7 @@ static int sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
 static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand, u8 *buf,
 					   int oob_required, int page,
 					   int first_step, int nchunks,
-					   int *raw_mode)
+					   bool *erased_chunk_found)
 {
 	bool randomized = nand->options & NAND_NEED_SCRAMBLING;
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
@@ -1395,7 +1396,7 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand, u8 *buf,
 		}
 
 		if (erased)
-			*raw_mode = 1;
+			*erased_chunk_found = true;
 
 		sunxi_nfc_hw_ecc_update_stats(nand, &max_bitflips, bitflips);
 	}
@@ -1419,7 +1420,7 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand, u8 *buf,
 			if (ret < 0)
 				return ret;
 			if (ret)
-				*raw_mode = 1;
+				*erased_chunk_found = true;
 		}
 	}
 
@@ -1433,14 +1434,14 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
 	unsigned int corrected = mtd->ecc_stats.corrected;
 	unsigned int failed = mtd->ecc_stats.failed;
 	unsigned int max_bitflips = 0;
-	int raw_mode = 0;
+	bool erased_chunk_found = false;
 	int first_step, batch_steps, ret;
 
 	for (first_step = 0; first_step < nchunks; first_step += batch_steps) {
 		batch_steps = sunxi_nfc_dma_batch_steps(nand, first_step, nchunks);
 		ret = sunxi_nfc_hw_ecc_read_batch_dma(nand, buf, oob_required, page,
 						      first_step, batch_steps,
-						      &raw_mode);
+						      &erased_chunk_found);
 		if (ret < 0)
 			goto err_stats;
 		max_bitflips = max_t(unsigned int, max_bitflips, ret);
@@ -1448,7 +1449,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
 
 	if (oob_required) {
 		ret = sunxi_nfc_hw_ecc_read_extra_oob(nand, nand->oob_poi,
-						      NULL, !raw_mode, page);
+						      NULL, !erased_chunk_found, page);
 		if (ret)
 			goto err_stats;
 	}
@@ -1465,17 +1466,17 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
 static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 					const u8 *data, int data_off,
 					const u8 *oob, int oob_off,
-					int *cur_off, int step,
+					int *cur_off, int logical_step,
 					int page)
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
-	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
+	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, logical_step);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	bool bbm = !step;
+	bool bbm = !logical_step;
 	int ret;
 	/* From the controller point of view, we are at step 0 */
-	const int nfc_step = 0;
+	const int hw_step = 0;
 
 	if (data_off != *cur_off) {
 		ret = nand_change_write_column_op(nand, data_off, NULL, 0, false);
@@ -1499,8 +1500,8 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
-	sunxi_nfc_set_user_data_len(nfc, user_data_sz, nfc_step);
-	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, nfc_step, bbm, page,
+	sunxi_nfc_set_user_data_len(nfc, user_data_sz, hw_step);
+	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, hw_step, bbm, page,
 					    user_data_sz);
 
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD |
@@ -1557,7 +1558,7 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	unsigned int max_bitflips = 0;
 	int ret, i, cur_off = 0;
-	bool raw_mode = false;
+	bool erased_chunk_found = false;
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
@@ -1581,12 +1582,12 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 		if (ret < 0)
 			goto out;
 		else if (ret)
-			raw_mode = true;
+			erased_chunk_found = true;
 	}
 
 	if (oob_required) {
 		ret = sunxi_nfc_hw_ecc_read_extra_oob(nand, nand->oob_poi, &cur_off,
-						      !raw_mode, page);
+						      !erased_chunk_found, page);
 		if (ret)
 			goto out;
 	}

-- 
2.53.0

