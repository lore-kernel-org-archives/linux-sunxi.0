Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EDD2E762C
	for <linux-sunxi@lists.linux.dev>; Fri, 20 Feb 2026 16:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771603839; cv=none; b=IvwTpG32QMOgEGP5WKTtq6ku5CizY8N2nLg+CvbuISdDpzki3zQLWRRMZOJTPh/aVMutQHc1r3oVqkVsB22+BW62hjQB2whN2flSG6PtIVLtyYfha2iEXCl09uRsOOE5Fy/ocYwZPWTR/xBwj+k62b+rMPgAaUp32PlZHeELA4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771603839; c=relaxed/simple;
	bh=+VJHFh1qK87zMJKzbtM/dyXlBA1sY8uPf+MwVLl9UIc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=usDgGNoEqpv7DA97JVXT3ooo7niZUWJufMHjjg2H/y4A78teJUXTaBUX9sgNAga+TjAWeyNoVUh689W6P+k3M/2JD9PgIME+NnOCd0jSzO+rTE9OcyKXP02RWGtedJ9zlxUsz7rjTbtO63CR7d9W+L64Z4Yx082Cpbka15kvip8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=sHDQeCgn; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="sHDQeCgn"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8058EC16543;
	Fri, 20 Feb 2026 16:10:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A26835FA8F;
	Fri, 20 Feb 2026 16:10:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9149C10368D47;
	Fri, 20 Feb 2026 17:10:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771603835; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=5Kma/dQTmZIgX72gFxn/OuuMgzz0tSVOS/9inwwwNmo=;
	b=sHDQeCgn5sygMr4vwv4OD7wil38NEv5yfweX8rCtUpz8/kUeTJ4GAalBkzAk0Gg386lbVI
	xURYIDJLOgTo/cTYkiPhW2PJsSmhNi3ZVWPdeZDzUrDLazd7LN0Ljy9OE1WdKHZ1aY8faK
	/ORDFlZM7CiIdswgtCAMdtEl9mSi6KXFvZ7zzUi/FwMrXgWC9iYiOVjzc733bwA3tdXqem
	V1Xn1rr+TdqDY+wxE86qlpR51qay8ZDMio2lRCZjP//3d3wI00xKemifZ7aLCRE/k0dgKR
	SfpPGjrjrTFf95ihDcAqxZICe2m+jzles+Cz0D7iGM9rtUYP6UHMdrTx2LyONw==
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
Subject: [PATCH 3/6] mtd: rawnand: sunxi: do not count BBM bytes twice
Date: Fri, 20 Feb 2026 17:10:08 +0100
Message-ID: <20260220161011.999642-4-richard.genoud@bootlin.com>
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

BBM is part of USER_DATA section, so we should remove it twice

This was working ok because we are on the safe size, advertising that
there was 2 bytes less available than reality.

But we can't change old platforms, since it may lead to a different ECC
strength, so, introduce a legacy flag for old platforms, and switch the
new platforms to the correct count.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 9c6e0625e34f..99d305bbda53 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -281,6 +281,8 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
  * @has_ecc_block_512:	If the ECC can handle 512B or only 1024B chuncks
  * @has_ecc_clk:	If the controller needs an ECC clock.
  * @has_mbus_clk:	If the controller needs a mbus clock.
+ * @legacy_max_strength:If the maximize strength function was off by 2 bytes
+ *			NB: this should not be used in new controllers
  * @reg_io_data:	I/O data register
  * @reg_ecc_err_cnt:	ECC error counter register
  * @reg_user_data:	User data register
@@ -310,6 +312,7 @@ struct sunxi_nfc_caps {
 	bool has_ecc_block_512;
 	bool has_ecc_clk;
 	bool has_mbus_clk;
+	bool legacy_max_strength;
 	unsigned int reg_io_data;
 	unsigned int reg_ecc_err_cnt;
 	unsigned int reg_user_data;
@@ -1811,10 +1814,22 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 		ecc->size = 1024;
 		nsectors = mtd->writesize / ecc->size;
 
-		/* Reserve 2 bytes for the BBM */
-		bytes = (mtd->oobsize - 2) / nsectors;
+		/*
+		 * The 2 BBM bytes should not be removed from the grand total,
+		 * because they are part of the USER_DATA_SZ.
+		 * But we can't modify that for older platform since it may
+		 * result in a stronger ECC at the end, and break the
+		 * compatibility.
+		 */
+		if (nfc->caps->legacy_max_strength)
+			bytes = (mtd->oobsize - 2) / nsectors;
+		else
+			bytes = mtd->oobsize / nsectors;
 
-		/* 4 non-ECC bytes are added before each ECC bytes section */
+		/*
+		 * USER_DATA_SZ non-ECC bytes are added before each ECC bytes
+		 * section, they contain the 2 BBM bytes
+		 */
 		bytes -= USER_DATA_SZ;
 
 		/* and bytes has to be even. */
@@ -2379,6 +2394,7 @@ static const u8 sunxi_user_data_len_h6[] = {
 
 static const struct sunxi_nfc_caps sunxi_nfc_a10_caps = {
 	.has_ecc_block_512 = true,
+	.legacy_max_strength = true,
 	.reg_io_data = NFC_REG_A10_IO_DATA,
 	.reg_ecc_err_cnt = NFC_REG_A10_ECC_ERR_CNT,
 	.reg_user_data = NFC_REG_A10_USER_DATA,
@@ -2400,6 +2416,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_a10_caps = {
 static const struct sunxi_nfc_caps sunxi_nfc_a23_caps = {
 	.has_mdma = true,
 	.has_ecc_block_512 = true,
+	.legacy_max_strength = true,
 	.reg_io_data = NFC_REG_A23_IO_DATA,
 	.reg_ecc_err_cnt = NFC_REG_A10_ECC_ERR_CNT,
 	.reg_user_data = NFC_REG_A10_USER_DATA,
