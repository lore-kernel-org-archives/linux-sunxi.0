Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1042FBDEC
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Oct 2025 10:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760955248; cv=none; b=SdlyBlPLTCz0NfK+uxach6eK8uN6GMa8OFLqvyJlrWiyHX8GLNOYYnwwYYYAjHGTCBRBrMO7wN5skMrOwpmlmm5WakGtKrG22DWzaqjpx9NBb/xC+bQTYq+tjz8gts4eE+YwiqFo8MBHV7SmIqy5k9WSxMwhlpCLDsWmRUmN1uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760955248; c=relaxed/simple;
	bh=MFyDMcWCo+UWJUpYXu4+2EBMuo5mynEUx0dy7DIkUfU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pt8EhT7vMdbUUlroOan8TnYx/31UqS212RB0jOJQ+7pJrVvhXRe6Hm06s4cBjG4xMZ6poJutUl6H69JKq28Dklytd8xOeINMseqnZddP17ph/6l+/+QfIOexFchJnmrbHPZc/KRHHP61B4UNE0aIkCL0eKXSAXHWk6GkvMAWSRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=1i+ActU8; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="1i+ActU8"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8F3E71A1537;
	Mon, 20 Oct 2025 10:14:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 649F3606D5;
	Mon, 20 Oct 2025 10:14:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8DD65102F23BD;
	Mon, 20 Oct 2025 12:14:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760955244; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=SOkpWr5UpB5E+C7Aw7jnme4f1BA7kVlONeX9qzjGraw=;
	b=1i+ActU835wwY66VgxMHAxYxABmNNEAPjD9z6Ji7ZUKIVUg38G1ndRbOwPE17Js0p52NhW
	E1Eq+/l8jeYoFQzIxinTMwPq6ePFZPW2A2AgJpHkEnJ6wm3UXdn+qzbWRUlPxsOGlEQQp7
	wX7XS/tpMUniw6a6oBXA4KO6/Daqe9SPcH9D2/bnWCiTx3PmLfdIx3FbrVB90FCS22MX9i
	SEBZC7lCvYhp7ZvHbPmnJGBi7NW3rPyHoBdb3AdOC04dV9ybeWrJ3Iy/lUp08LU70Xd7GK
	IE59Ks59zd9NvSnLuPONN6kx2Gs4T0KYIOf0mjHCOi6UN698QDA+DKSwbYgfeQ==
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
Subject: [PATCH v3 10/15] mtd: rawnand: sunxi: introduce reg_spare_area in sunxi_nfc_caps
Date: Mon, 20 Oct 2025 12:13:06 +0200
Message-ID: <20251020101311.256819-11-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251020101311.256819-1-richard.genoud@bootlin.com>
References: <20251020101311.256819-1-richard.genoud@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The H6/H616 spare area register is not at the same offset as the
A10/A23 one, so move its offset into sunxi_nfc_caps.

No functional change.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index e8c08f0139d2..da7b8b81d39e 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -54,7 +54,8 @@
 #define NFC_REG_ECC_ERR_CNT(nfc, x)	((nfc->caps->reg_ecc_err_cnt + (x)) & ~0x3)
 #define NFC_REG_A10_USER_DATA	0x0050
 #define NFC_REG_USER_DATA(nfc, x)	(nfc->caps->reg_user_data + ((x) * 4))
-#define NFC_REG_SPARE_AREA	0x00A0
+#define NFC_REG_SPARE_AREA(nfc) (nfc->caps->reg_spare_area)
+#define NFC_REG_A10_SPARE_AREA	0x00A0
 #define NFC_REG_PAT_ID(nfc) (nfc->caps->reg_pat_id)
 #define NFC_REG_A10_PAT_ID	0x00A4
 #define NFC_REG_MDMA_ADDR	0x00C0
@@ -228,6 +229,7 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
  * @reg_io_data:	I/O data register
  * @reg_ecc_err_cnt:	ECC error counter register
  * @reg_user_data:	User data register
+ * @reg_spare_area:	Spare Area Register
  * @reg_pat_id:		Pattern ID Register
  * @reg_pat_found:	Data Pattern Status Register
  * @random_en_mask:	RANDOM_EN mask in NFC_ECC_CTL register
@@ -244,6 +246,7 @@ struct sunxi_nfc_caps {
 	unsigned int reg_io_data;
 	unsigned int reg_ecc_err_cnt;
 	unsigned int reg_user_data;
+	unsigned int reg_spare_area;
 	unsigned int reg_pat_id;
 	unsigned int reg_pat_found;
 	unsigned int random_en_mask;
@@ -466,7 +469,7 @@ static void sunxi_nfc_select_chip(struct nand_chip *nand, unsigned int cs)
 	if (sel->rb >= 0)
 		ctl |= NFC_RB_SEL(sel->rb);
 
-	writel(mtd->writesize, nfc->regs + NFC_REG_SPARE_AREA);
+	writel(mtd->writesize, nfc->regs + NFC_REG_SPARE_AREA(nfc));
 
 	if (nfc->clk_rate != sunxi_nand->clk_rate) {
 		clk_set_rate(nfc->mod_clk, sunxi_nand->clk_rate);
@@ -2226,6 +2229,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_a10_caps = {
 	.reg_io_data = NFC_REG_A10_IO_DATA,
 	.reg_ecc_err_cnt = NFC_REG_A10_ECC_ERR_CNT,
 	.reg_user_data = NFC_REG_A10_USER_DATA,
+	.reg_spare_area = NFC_REG_A10_SPARE_AREA,
 	.reg_pat_id = NFC_REG_A10_PAT_ID,
 	.reg_pat_found = NFC_REG_ECC_ST,
 	.random_en_mask = BIT(9),
@@ -2243,6 +2247,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_a23_caps = {
 	.reg_io_data = NFC_REG_A23_IO_DATA,
 	.reg_ecc_err_cnt = NFC_REG_A10_ECC_ERR_CNT,
 	.reg_user_data = NFC_REG_A10_USER_DATA,
+	.reg_spare_area = NFC_REG_A10_SPARE_AREA,
 	.reg_pat_id = NFC_REG_A10_PAT_ID,
 	.reg_pat_found = NFC_REG_ECC_ST,
 	.random_en_mask = BIT(9),
