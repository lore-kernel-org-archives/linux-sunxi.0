Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A81B2E62AC
	for <linux-sunxi@lists.linux.dev>; Fri, 20 Feb 2026 16:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771603844; cv=none; b=Gf2QjOrkBMEfl93Nq1gy5DhpxycsayYFAMzXTYMDUOCUy4XDc8HVgn52EsmipitCePVGmmrB2xbBuLMxdNvOwBeWkajdnxlBb2diIRn7QMH5rDIOBjPfWhOUIJsM24Zu8umSgdSgx76QV7wYrREZBEJumL8swkMhPz87BsZEO74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771603844; c=relaxed/simple;
	bh=6voLoD89XuLbGcVGmJ8G1iu/7ztbHj67VpMEPPMRKEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YFFIUsGteZssWwS5JpgDJ0xghKSZgS1i9C+YwrZT3r+DUgB2Gtm/ayb7ZPD3x5rH66CEtIb3V44wjmMOXZKaa8SbaD9bZszK0WArhRy8hEiHjPDHuzF09OscuU9lUQjNxHt/G0ceoK8mpiRlACrpuhZwjCMlk6kBgM+4b/GMj9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Lj5W7Kbt; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Lj5W7Kbt"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D4249C16549;
	Fri, 20 Feb 2026 16:10:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 003BE5FA8F;
	Fri, 20 Feb 2026 16:10:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D30C310368D48;
	Fri, 20 Feb 2026 17:10:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771603839; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=A5F3mFDukX3wj83GSepuRxgZnuBzHMueQF9c9toBDfY=;
	b=Lj5W7KbtqwKU37vaJfTiVFtRTUjoCePRvQlMFqlRH7v3m5GqNK0QGkxqtcUgn9zf/HRVEs
	7K+veFwvtoP8IHxreJCU9s1u/BjamBBe5Xe/OYRUi8GdsFGTduUld+ZhbKVCEIOMLnMLJn
	PaOBrJ1F+wKXlPk23nvVzWaJjVgW5B/TZojfo1ezipkc+ikNtSi68jEKGL01lQLAJ26C73
	FvzYwB66hXHUH5wdQNxPDh4csyOHzzOoQDcN8rb3H0E1K3kuZ0CY7bkLtNd9Wsk7PixFh1
	XG/LYGjOAcmGN297A3CThZalfydYlcHuw5MabsmgKr6bcaQAsCBa7z3zR4lnQg==
From: Richard Genoud <richard.genoud@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Wentao Liang <vulab@iscas.ac.cn>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH 5/6] mtd: rawnand: sunxi: make the code mode self-explanatory
Date: Fri, 20 Feb 2026 17:10:10 +0100
Message-ID: <20260220161011.999642-6-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260220161011.999642-1-richard.genoud@bootlin.com>
References: <20260220161011.999642-1-richard.genoud@bootlin.com>
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

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 5d925b59b618..b3a0f70dd4e9 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -969,6 +969,8 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	u32 pattern_found;
 	bool erased;
 	int ret;
+	/* From the controller point of view, we are at step 0 */
+	const int nfc_step = 0;
 
 	if (*cur_off != data_off)
 		nand_change_read_column_op(nand, data_off, NULL, 0, false);
@@ -983,7 +985,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 		return ret;
 
 	sunxi_nfc_reset_user_data_len(nfc);
-	sunxi_nfc_set_user_data_len(nfc, USER_DATA_SZ, 0);
+	sunxi_nfc_set_user_data_len(nfc, USER_DATA_SZ, nfc_step);
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD | NFC_ECC_OP,
@@ -999,10 +1001,9 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
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
 
@@ -1035,7 +1036,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 			sunxi_nfc_randomizer_read_buf(nand, oob, ecc->bytes + USER_DATA_SZ,
 						      true, page);
 
-			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, 0,
+			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, nfc_step,
 							    bbm, page);
 		}
 	}
@@ -1213,6 +1214,8 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret;
+	/* From the controller point of view, we are at step 0 */
+	const int nfc_step = 0;
 
 	if (data_off != *cur_off)
 		nand_change_write_column_op(nand, data_off, NULL, 0, false);
@@ -1229,8 +1232,8 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 	sunxi_nfc_reset_user_data_len(nfc);
-	sunxi_nfc_set_user_data_len(nfc, USER_DATA_SZ, 0);
-	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, 0, bbm, page);
+	sunxi_nfc_set_user_data_len(nfc, USER_DATA_SZ, nfc_step);
+	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, nfc_step, bbm, page);
 
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD |
 	       NFC_ACCESS_DIR | NFC_ECC_OP,
