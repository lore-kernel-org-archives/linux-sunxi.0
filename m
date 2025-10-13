Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F703164CA
	for <linux-sunxi@lists.linux.dev>; Mon, 13 Oct 2025 15:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760369269; cv=none; b=ajlOX2Mh6fCfFAi2uQf0sGies3eIGecmAO+io0D6AhymSGw28IBoUJXVX3XE5+g1zfh9pDij0DbWVa2vutJdJKbgWAolPL6qe2AqNguF9DVp4E8e0/zpMT8mRFW04xqQQ/gL6AVXt92LnmLPvE4ee+bADPwANpksnpbBgf1vuAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760369269; c=relaxed/simple;
	bh=8RyYfMa0gCTCjCsj5gpn/gbj5bBb2rdSiCdY8PgxtDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RPMlY3n5dH1WYdhNPoYy5xF1d6eDJ7crfLP3RhVkASg8V0qLggNoVyxMQsWJ5PhtL3NGS3DBpx55pk2jByUkst1GcX0gRfHzX6TzGgGjc4gdUVDdQ0w3W13R72XZQfVPQMGoTpwZ14TcjWypVj5vK5h4XxMA8QjKG5+XNAO/qUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Qx3SRHTR; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Qx3SRHTR"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 623EE4E4106B;
	Mon, 13 Oct 2025 15:27:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 38D7F6067B;
	Mon, 13 Oct 2025 15:27:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2ABD0102F227D;
	Mon, 13 Oct 2025 17:27:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760369264; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=O08ZQU7nzCm/CtBp+vh3SNifDt7t1M3uvSj4nDW/Pxk=;
	b=Qx3SRHTRQps2CDtT/SNllhwZ9GrfaYhnN9T0vxsTOnHOVNtvwZ1grCX3JaDJ8DQC1uPchl
	BP6ZESVSBG+VQJLP75HOm4E1ouTrJXqVitoNmg1inuIhxuKLKmQVUDh4dI6WYNaseexAbd
	N5Cvv59QDj72RjGOq6pbS7/0FtIMI7uaT6XWWYMOX80WlDqOyRwyVorhdmfXblamjukWyB
	0/wBsA/wRZMiKB+S4UFAVjxeVNQ2vZYQZnd0ANaY9RWBcA1ugrYy9zxnTmu8BjIk4tRCpP
	s9Wu/pAt2gf/E0UR/Z9uTuYRhGz6si3bsi9Rd0muTPJDM5NUKxp8G/gNtw54Og==
From: Richard Genoud <richard.genoud@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Wentao Liang <vulab@iscas.ac.cn>,
	Johan Hovold <johan@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH v2 08/15] mtd: rawnand: sunxi: introduce random en/dir in sunxi_nfc_caps
Date: Mon, 13 Oct 2025 17:26:38 +0200
Message-ID: <20251013152645.1119308-9-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251013152645.1119308-1-richard.genoud@bootlin.com>
References: <20251013152645.1119308-1-richard.genoud@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The H6/H616 RANDOM EN/DIRECTION masks are different from A10/A23.
So move the masks into sunxi_nfc_caps.

No functional change.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 4118307cac15..3ccb7ea7cf17 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -144,8 +144,8 @@
 #define NFC_ECC_EXCEPTION	BIT(4)
 #define NFC_ECC_BLOCK_SIZE_MSK	BIT(5)
 #define NFC_ECC_BLOCK_512	BIT(5)
-#define NFC_RANDOM_EN		BIT(9)
-#define NFC_RANDOM_DIRECTION	BIT(10)
+#define NFC_RANDOM_EN(nfc)	(nfc->caps->random_en_mask)
+#define NFC_RANDOM_DIRECTION(nfc) (nfc->caps->random_dir_mask)
 #define NFC_ECC_MODE_MSK(nfc)	(nfc->caps->ecc_mode_mask)
 #define NFC_ECC_MODE(nfc, x)	field_prep(NFC_ECC_MODE_MSK(nfc), (x))
 #define NFC_RANDOM_SEED_MSK	GENMASK(30, 16)
@@ -228,6 +228,8 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
  * @reg_ecc_err_cnt:	ECC error counter register
  * @reg_user_data:	User data register
  * @reg_pat_found:	Data Pattern Status Register
+ * @random_en_mask:	RANDOM_EN mask in NFC_ECC_CTL register
+ * @random_dir_mask:	RANDOM_DIRECTION mask in NFC_ECC_CTL register
  * @ecc_mode_mask:	ECC_MODE mask in NFC_ECC_CTL register
  * @pat_found_mask:	ECC_PAT_FOUND mask in NFC_REG_PAT_FOUND register
  * @dma_maxburst:	DMA maxburst
@@ -241,6 +243,8 @@ struct sunxi_nfc_caps {
 	unsigned int reg_ecc_err_cnt;
 	unsigned int reg_user_data;
 	unsigned int reg_pat_found;
+	unsigned int random_en_mask;
+	unsigned int random_dir_mask;
 	unsigned int ecc_mode_mask;
 	unsigned int pat_found_mask;
 	unsigned int dma_maxburst;
@@ -669,7 +673,7 @@ static void sunxi_nfc_randomizer_enable(struct nand_chip *nand)
 	if (!(nand->options & NAND_NEED_SCRAMBLING))
 		return;
 
-	writel(readl(nfc->regs + NFC_REG_ECC_CTL) | NFC_RANDOM_EN,
+	writel(readl(nfc->regs + NFC_REG_ECC_CTL) | NFC_RANDOM_EN(nfc),
 	       nfc->regs + NFC_REG_ECC_CTL);
 }
 
@@ -680,7 +684,7 @@ static void sunxi_nfc_randomizer_disable(struct nand_chip *nand)
 	if (!(nand->options & NAND_NEED_SCRAMBLING))
 		return;
 
-	writel(readl(nfc->regs + NFC_REG_ECC_CTL) & ~NFC_RANDOM_EN,
+	writel(readl(nfc->regs + NFC_REG_ECC_CTL) & ~NFC_RANDOM_EN(nfc),
 	       nfc->regs + NFC_REG_ECC_CTL);
 }
 
@@ -2220,6 +2224,8 @@ static const struct sunxi_nfc_caps sunxi_nfc_a10_caps = {
 	.reg_ecc_err_cnt = NFC_REG_A10_ECC_ERR_CNT,
 	.reg_user_data = NFC_REG_A10_USER_DATA,
 	.reg_pat_found = NFC_REG_ECC_ST,
+	.random_en_mask = BIT(9),
+	.random_dir_mask = BIT(10),
 	.ecc_mode_mask = GENMASK(15, 12),
 	.pat_found_mask = GENMASK(31, 16),
 	.dma_maxburst = 4,
@@ -2234,6 +2240,8 @@ static const struct sunxi_nfc_caps sunxi_nfc_a23_caps = {
 	.reg_ecc_err_cnt = NFC_REG_A10_ECC_ERR_CNT,
 	.reg_user_data = NFC_REG_A10_USER_DATA,
 	.reg_pat_found = NFC_REG_ECC_ST,
+	.random_en_mask = BIT(9),
+	.random_dir_mask = BIT(10),
 	.ecc_mode_mask = GENMASK(15, 12),
 	.pat_found_mask = GENMASK(31, 16),
 	.dma_maxburst = 8,
