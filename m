Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D20D3E5ED1
	for <linux-sunxi@lists.linux.dev>; Tue, 17 Mar 2026 14:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773757509; cv=none; b=KSBnQLTQtSeZ96r/M76jXIad4Rib6WgK0PIRWCMfuKPH3elOM9IWtcT1ehJ9/Yt8SLOVCg0FRgZx5+Un9oVhiojQjCqI3zX10cJ4NIu2zHYCqmm+IZdWIg8CnONs6MhDhT6dsmAyFhpr5atmFWYZq98fzZzu0ZjKaMzp3est91I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773757509; c=relaxed/simple;
	bh=g1woTV3yEkdeDkwDBcPQrTzOVh7GVhnMMb7gi8gjbQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kmDupinNPMOSS7dzeYJy+DH+QZk7w/X5OmF8Tbp2DyGDlV3jepsSiQ6sC+m/R5V/oUK6miI9nEFKz1tNuXhzxY5VYEvfiSOGAz0cWlJwTdEC+6VMSedWwUR0DSC52U6sOtwKu3RvWhF4ja1LVJXq4LrDwoe0NxViMLDdAwu8YWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CqbAPns7; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CqbAPns7"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C91131A2E05;
	Tue, 17 Mar 2026 14:25:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 98A995FC9A;
	Tue, 17 Mar 2026 14:25:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DF9E2104505FE;
	Tue, 17 Mar 2026 15:25:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773757505; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=BrbsAztv/q276b/C/c8lHnbUQV+pP9AxyLo2fJhBj9o=;
	b=CqbAPns7a/XjfdhNap2qLpTfQR0xrIEVOs9+SBHo3llrTb21rceKCQsb2U/Qg2ynuRy+UB
	L2/BAgYnXm7qZqHkw6XT9KEezsc+8mEpTFuFS6YlV2X9dQOEEK9IrVm1po3RIpAZecEtP7
	KFnk1s35aY5dJN7PRhJCMHXqwYZv5J86ypdKU4Io7fP1ovNwUuKfLtTeGE1xD52tS0tHvy
	ce/KJyh37G6Sli1PXGFkoGyN70vKrH4fqJmrquh60PFWT/FFp9B0vmmXy28zCeSczQnsA1
	hOM2wAm1sgkJmHOICF4MDaRp7DP8wh1orrmUJaGDNN1lmY+Xwu7hITNcFLAZNw==
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
Subject: [PATCH v3 7/9] mtd: rawnand: sunxi: change error prone variable name
Date: Tue, 17 Mar 2026 15:24:35 +0100
Message-ID: <20260317142437.580204-8-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260317142437.580204-1-richard.genoud@bootlin.com>
References: <20260317142437.580204-1-richard.genoud@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

In sunxi_nand_hw_ecc_ctrl_init(), i is used as a loop index variable and
at the same time as the value used to set ECC mode in ECC control
register.
To prevent it from being re-used as a loop variable, let's change the
naming to ecc_mode.

No functional change.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 68e22ce451db..81e491be3563 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1796,6 +1796,7 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_device *nanddev = mtd_to_nanddev(mtd);
 	int nsectors;
+	int ecc_mode;
 	int i;
 
 	if (nanddev->ecc.user_conf.flags & NAND_ECC_MAXIMIZE_STRENGTH) {
@@ -1849,18 +1850,18 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	}
 
 	/* Add ECC info retrieval from DT */
-	for (i = 0; i < nfc->caps->nstrengths; i++) {
-		if (ecc->strength <= strengths[i]) {
+	for (ecc_mode = 0; ecc_mode < nfc->caps->nstrengths; ecc_mode++) {
+		if (ecc->strength <= strengths[ecc_mode]) {
 			/*
 			 * Update ecc->strength value with the actual strength
 			 * that will be used by the ECC engine.
 			 */
-			ecc->strength = strengths[i];
+			ecc->strength = strengths[ecc_mode];
 			break;
 		}
 	}
 
-	if (i >= nfc->caps->nstrengths) {
+	if (ecc_mode >= nfc->caps->nstrengths) {
 		dev_err(nfc->dev, "unsupported strength\n");
 		return -ENOTSUPP;
 	}
@@ -1896,7 +1897,7 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	ecc->read_oob_raw = nand_read_oob_std;
 	ecc->write_oob_raw = nand_write_oob_std;
 
-	sunxi_nand->ecc.ecc_ctl = NFC_ECC_MODE(nfc, i) | NFC_ECC_EXCEPTION |
+	sunxi_nand->ecc.ecc_ctl = NFC_ECC_MODE(nfc, ecc_mode) | NFC_ECC_EXCEPTION |
 				  NFC_ECC_PIPELINE | NFC_ECC_EN;
 
 	if (ecc->size == 512) {
