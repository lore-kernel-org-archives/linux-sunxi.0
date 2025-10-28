Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598432C11CB
	for <linux-sunxi@lists.linux.dev>; Tue, 28 Oct 2025 07:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761636973; cv=none; b=oXbxibwfKvGlFw6E4Q5nuV9u7fgb3jZ71H7eaF7zs6xtGDqPb3K+V5TG12+MXsuzRNN/wzzuPEzW5ZszZeYHVRpQ7Kix6LI6anhM+hUri2tStGPkZgG41pa0g9uSzUN/93l6OQZmu6gGA9R5cqOTT+oAU+SIjAh3zE2dIWgewhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761636973; c=relaxed/simple;
	bh=gQK/StF5drtduvloYxVT0iuojLEga1RaNobUynT3zgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l/AqIIOqAxTI/sI4FJRJ5A/lyQgokNh/gTEZBe3hpVoFQpH5xG4LFtBa0lS6ndyJ9LbRGMJ11dJMkD46Moxs1r+Qfr2aPqVT5eXAq5q2+LPES+LAL7rqmrdtnpIXL1DY/HWaRWpycuhDAikshFtjlgmX2aPG7hneFHQAFZqvL+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GLp35+q0; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GLp35+q0"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id AE7BBC0BE98;
	Tue, 28 Oct 2025 07:35:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EA971606AB;
	Tue, 28 Oct 2025 07:36:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 391D1102F251B;
	Tue, 28 Oct 2025 08:36:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761636969; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=ifAJqTgwm8F4FEEPqzOTM9nQ8UFLDfY1PWOvTI7AfHE=;
	b=GLp35+q0eSEMSMgsGU7ui1Womvs4a/x6Ir/1sv5gNa7lThDfb9sqwJG8NRl9EEbms9ZHPt
	W+jGH7+Y4u9cqEvzxNQdKmAPvtODo41isJdrxbxZNV/ehs2k2n/hC5IF0UYDX8jG5dNvxL
	VkzE6KmdOOIpAPrCpWIbj0daEFJH6SGzuQbjYDfbOMA+VL/0Vncee6+3cwvUgqXQOBIurZ
	C4kHRdCzk8TsDmRD8Eq9MQPjkzRL3clrC3U9pqr3WgS1eAxT4Ch2vpUF6n8Zw5g/gTEWls
	5G/Goa7Y3HRvEhKGLb7MP0aGeK9a11hVgz5qrl9/V+ZBjLyXWyLiu+/lZJa7ww==
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
Subject: [PATCH v4 04/16] mtd: rawnand: sunxi: move ECC strenghts in sunxi_nfc_caps
Date: Tue, 28 Oct 2025 08:34:57 +0100
Message-ID: <20251028073534.526992-5-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251028073534.526992-1-richard.genoud@bootlin.com>
References: <20251028073534.526992-1-richard.genoud@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

H6/H616 has more ECC strenghts than A10/A23.

Move the ECC strenghts array to sunxi_nfc_caps to make it ready for
H6/H616 support.

No functional change.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index f24e8d2083f8..89115a8f0718 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -224,11 +224,15 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
  *			through MBUS on A23/A33 needs extra configuration.
  * @reg_io_data:	I/O data register
  * @dma_maxburst:	DMA maxburst
+ * @ecc_strengths:	Available ECC strengths array
+ * @nstrengths:		Size of @ecc_strengths
  */
 struct sunxi_nfc_caps {
 	bool has_mdma;
 	unsigned int reg_io_data;
 	unsigned int dma_maxburst;
+	const u8 *ecc_strengths;
+	unsigned int nstrengths;
 };
 
 /**
@@ -1630,9 +1634,9 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 				       struct nand_ecc_ctrl *ecc,
 				       struct device_node *np)
 {
-	static const u8 strengths[] = { 16, 24, 28, 32, 40, 48, 56, 60, 64 };
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	const u8 *strengths = nfc->caps->ecc_strengths;
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_device *nanddev = mtd_to_nanddev(mtd);
 	int nsectors;
@@ -1656,7 +1660,7 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 
 		ecc->strength = bytes * 8 / fls(8 * ecc->size);
 
-		for (i = 0; i < ARRAY_SIZE(strengths); i++) {
+		for (i = 0; i < nfc->caps->nstrengths; i++) {
 			if (strengths[i] > ecc->strength)
 				break;
 		}
@@ -1677,7 +1681,7 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	}
 
 	/* Add ECC info retrieval from DT */
-	for (i = 0; i < ARRAY_SIZE(strengths); i++) {
+	for (i = 0; i < nfc->caps->nstrengths; i++) {
 		if (ecc->strength <= strengths[i]) {
 			/*
 			 * Update ecc->strength value with the actual strength
@@ -1688,7 +1692,7 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 		}
 	}
 
-	if (i >= ARRAY_SIZE(strengths)) {
+	if (i >= nfc->caps->nstrengths) {
 		dev_err(nfc->dev, "unsupported strength\n");
 		return -ENOTSUPP;
 	}
@@ -2178,15 +2182,23 @@ static void sunxi_nfc_remove(struct platform_device *pdev)
 		dma_release_channel(nfc->dmac);
 }
 
+static const u8 sunxi_ecc_strengths_a10[] = {
+	16, 24, 28, 32, 40, 48, 56, 60, 64
+};
+
 static const struct sunxi_nfc_caps sunxi_nfc_a10_caps = {
 	.reg_io_data = NFC_REG_A10_IO_DATA,
 	.dma_maxburst = 4,
+	.ecc_strengths = sunxi_ecc_strengths_a10,
+	.nstrengths = ARRAY_SIZE(sunxi_ecc_strengths_a10),
 };
 
 static const struct sunxi_nfc_caps sunxi_nfc_a23_caps = {
 	.has_mdma = true,
 	.reg_io_data = NFC_REG_A23_IO_DATA,
 	.dma_maxburst = 8,
+	.ecc_strengths = sunxi_ecc_strengths_a10,
+	.nstrengths = ARRAY_SIZE(sunxi_ecc_strengths_a10),
 };
 
 static const struct of_device_id sunxi_nfc_ids[] = {
-- 
2.47.3

