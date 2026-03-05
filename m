Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0549237D13D
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Mar 2026 10:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772704941; cv=none; b=hZfR1zyD41gCeGwuudO3A+RLW02WtDcH+D2eX15tAglTPvsla2Gh+58ZyBfPnUu5mRFRLaVK6YQiJZKWxEfWUkqZ/A/VzhjOfG2Uufn1k0+2TRD6JqVeK8X75XWcTnz4ZOG9zIJbAbbMbht6FTYKUzhxbxP1AAZce0hWf80rfiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772704941; c=relaxed/simple;
	bh=3+6zQbR+SwjJUYI086wQhSWKl51UvmXsl0Eo6538vzc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fZsfQQnuXoUabaOyLnr7abO9GOZse3EmKrVTTyIzdKDX96bomB6O8bjpCNjTFdgGywd0u1Mpc28lqwEJrs/9SrtfPuZqG9wIsEe9xaFmZr6cA5Cobi04iHovp07ZtyLk/c7sD9qPYO2DheiXT+zOXrqESS0BgW9jqEqg0YUQ4ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=1FKBsL23; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="1FKBsL23"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EB6DA4E4256C;
	Thu,  5 Mar 2026 10:02:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C197B5FDEB;
	Thu,  5 Mar 2026 10:02:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B965D1036982D;
	Thu,  5 Mar 2026 11:02:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772704932; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=AnFYOnDz1DIlRxk4/M2buM/Tm1miYn6Fq7SgPCkXfNo=;
	b=1FKBsL2331inTkV8Kk48WEXXfd459eenaglA6zOhQT1z6Aw1ERp6YTAxSDDXGeThAP2jvq
	DxnYWDKnPoLZQNtyCql4faC/O2YIkqVplm2KyEEHUTq2OLjqM4QCSEGmFI+/EjADj+MGed
	q9d1EIL21qlKydBUuBEjRJF+iFx7yhPU7drcLRZTM9uWqLpvQgIfu7HyIzu9t66cENYzUB
	Y7cv0XR8j90k5h/JLEpw8hhz0fySjPowqyqCB7C2jHu7+wdbel2VsQybv99EgLpLgT1Gbi
	VqjxliOElOoEbSwqgnvWI3EMcsjO3LF+xOtzh+wcpM84bex36BJbYIt/alY+sg==
From: Richard Genoud <richard.genoud@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Wentao Liang <vulab@iscas.ac.cn>,
	Maxime Ripard <mripard@kernel.org>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH v2 5/6] mtd: rawnand: sunxi: make the code mode self-explanatory
Date: Thu,  5 Mar 2026 11:01:36 +0100
Message-ID: <20260305100137.2558423-6-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260305100137.2558423-1-richard.genoud@bootlin.com>
References: <20260305100137.2558423-1-richard.genoud@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

In sunxi_nfc_hw_ecc_{read,write}_chunk(), the ECC step was force to 0,
the reason is not trivial to get when reading the code.

The explanation is that, from the NAND flash controller perspective, we
are indeed at step 0 for user data length and ECC errors.

Just add a const value with an explanation to clarify things.

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 0b0b5349f446..ca701c75cec5 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -963,6 +963,8 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	u32 pattern_found;
 	bool erased;
 	int ret;
+	/* From the controller point of view, we are at step 0 */
+	const int nfc_step = 0;
 
 	if (*cur_off != data_off)
 		nand_change_read_column_op(nand, data_off, NULL, 0, false);
@@ -977,7 +979,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 		return ret;
 
 	sunxi_nfc_reset_user_data_len(nfc);
-	sunxi_nfc_set_user_data_len(nfc, USER_DATA_SZ, 0);
+	sunxi_nfc_set_user_data_len(nfc, USER_DATA_SZ, nfc_step);
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD | NFC_ECC_OP,
@@ -993,10 +995,9 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	pattern_found = readl(nfc->regs + nfc->caps->reg_pat_found);
 	pattern_found = field_get(NFC_ECC_PAT_FOUND_MSK(nfc), pattern_found);
 
-	ret = sunxi_nfc_hw_ecc_correct(nand, data, oob_required ? oob : NULL, 0,
-				       readl(nfc->regs + NFC_REG_ECC_ST),
-				       pattern_found,
-				       &erased);
+	ret = sunxi_nfc_hw_ecc_correct(nand, data, oob_required ? oob : NULL,
+				       nfc_step, readl(nfc->regs + NFC_REG_ECC_ST),
+				       pattern_found, &erased);
 	if (erased)
 		return 1;
 
@@ -1029,7 +1030,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 			sunxi_nfc_randomizer_read_buf(nand, oob, ecc->bytes + USER_DATA_SZ,
 						      true, page);
 
-			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, 0,
+			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, nfc_step,
 							    bbm, page);
 		}
 	}
@@ -1207,6 +1208,8 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret;
+	/* From the controller point of view, we are at step 0 */
+	const int nfc_step = 0;
 
 	if (data_off != *cur_off)
 		nand_change_write_column_op(nand, data_off, NULL, 0, false);
@@ -1223,8 +1226,8 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 	sunxi_nfc_reset_user_data_len(nfc);
-	sunxi_nfc_set_user_data_len(nfc, USER_DATA_SZ, 0);
-	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, 0, bbm, page);
+	sunxi_nfc_set_user_data_len(nfc, USER_DATA_SZ, nfc_step);
+	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, nfc_step, bbm, page);
 
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD |
 	       NFC_ACCESS_DIR | NFC_ECC_OP,
