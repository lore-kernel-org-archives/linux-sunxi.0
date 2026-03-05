Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5280037C90F
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Mar 2026 10:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772704939; cv=none; b=gTaWuJA/ACQu9L6eQy3id+fKFFyfw69yElJYoS+BzKn07W2ObterLFJwyMTmsfnngEWzIkHZMBILHPW0+LElwk7hGW8+210LhtQ2X1FcWjN30aMqvbc/VC1noKU5imWCi2JSSln8GaHr3/5e8eKoLl5u6CboAzRX+9dSSlYqW/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772704939; c=relaxed/simple;
	bh=JzsspTfi7nLlIjSkc4v1Viy+3rVefLUJ9ySnZdDCcxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nFX1ag1O6zB54NxAovMsOeE+MudZzqZC+fW7F05dcpTaTMB3iPYlhiVgrLcqymRveeLJ2dCJWt1DzYejyX5wdXde0IJvRy16sOMlfYAV4yCPMvPfQpnYLAFHCMHdSueQCX2D+isJgBCqTMcO2LRhhRE9Ait5o2fRg0ffTMVaf1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=iqXobXzi; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="iqXobXzi"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CA1F94E42570;
	Thu,  5 Mar 2026 10:02:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A060D5FDEB;
	Thu,  5 Mar 2026 10:02:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 63BD010369865;
	Thu,  5 Mar 2026 11:02:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772704928; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=EFWtYCwuiTAqb7Iuhvh3esPyqysUJUFJvc16hy8gPX4=;
	b=iqXobXziyhbydna86VZHaBVfu8irXfP5fDZee0I30F7kKXcfJ6hSBPac2+UjdRn0JEK6Om
	E/Cpjd/Z3V9MN3btieZCRIi7EoaBpRVAbhH6RWoPixSboFc516gPbqVx9b4VbKbmGRyPLM
	tAiVC5yIWphevXdQZ47J+UsnsmMnGsbSRxOIB/NQxPOy0Iy4hs2MHkjAq2VLki3falVFDz
	dZiCM8QNunDfN38dj1SujD2fvZScPzIHNrq1/MMy7pro7Bgu7JDcr9+yhYVIcm17VmkNPk
	sbDxIPH76BrjMrRnLs4Z0EeXFywE1diLz75JQa2OWh00LafGichJqpI7U4pqrw==
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
Subject: [PATCH v2 3/6] mtd: rawnand: sunxi: do not count BBM bytes twice
Date: Thu,  5 Mar 2026 11:01:34 +0100
Message-ID: <20260305100137.2558423-4-richard.genoud@bootlin.com>
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

BBM is part of USER_DATA section, so we should remove it twice

This was working ok because we are on the safe size, advertising that
there was 2 bytes less available than in reality.

But we can't change old platforms, since it may lead to a different ECC
strength, so, introduce a legacy flag for old platforms, and switch the
new platforms to the correct count.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 8af449e548d4..d126dc18ef27 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -275,6 +275,8 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
  * @has_ecc_block_512:	If the ECC can handle 512B or only 1024B chuncks
  * @has_ecc_clk:	If the controller needs an ECC clock.
  * @has_mbus_clk:	If the controller needs a mbus clock.
+ * @legacy_max_strength:If the maximize strength function was off by 2 bytes
+ *			NB: this should not be used in new controllers
  * @reg_io_data:	I/O data register
  * @reg_ecc_err_cnt:	ECC error counter register
  * @reg_user_data:	User data register
@@ -304,6 +306,7 @@ struct sunxi_nfc_caps {
 	bool has_ecc_block_512;
 	bool has_ecc_clk;
 	bool has_mbus_clk;
+	bool legacy_max_strength;
 	unsigned int reg_io_data;
 	unsigned int reg_ecc_err_cnt;
 	unsigned int reg_user_data;
@@ -1805,10 +1808,22 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
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
@@ -2373,6 +2388,7 @@ static const u8 sunxi_user_data_len_h6[] = {
 
 static const struct sunxi_nfc_caps sunxi_nfc_a10_caps = {
 	.has_ecc_block_512 = true,
+	.legacy_max_strength = true,
 	.reg_io_data = NFC_REG_A10_IO_DATA,
 	.reg_ecc_err_cnt = NFC_REG_A10_ECC_ERR_CNT,
 	.reg_user_data = NFC_REG_A10_USER_DATA,
@@ -2394,6 +2410,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_a10_caps = {
 static const struct sunxi_nfc_caps sunxi_nfc_a23_caps = {
 	.has_mdma = true,
 	.has_ecc_block_512 = true,
+	.legacy_max_strength = true,
 	.reg_io_data = NFC_REG_A23_IO_DATA,
 	.reg_ecc_err_cnt = NFC_REG_A10_ECC_ERR_CNT,
 	.reg_user_data = NFC_REG_A10_USER_DATA,
