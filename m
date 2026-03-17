Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8743E5EE1
	for <linux-sunxi@lists.linux.dev>; Tue, 17 Mar 2026 14:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773757506; cv=none; b=Qo4ZoOtc46d7OBD9q1zjvT26JwIdzzNsG+vTFplCLXCtcFR9QvoWm2hq7XlU3q/lrKtQl7FYkfABOhUywvZ+rCg1RV5gRO4P4j7xnCV3vPcUtxJ0UxD11I5JBryXyJPkkU8iEwBFV02SugkhUZ61PeO/1TCt2MHDnUOgYyCeO+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773757506; c=relaxed/simple;
	bh=PXRtz+AFNFXElofgABMOKjBnpOePYgWHcwo2ttPHwwY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WV+0QZflVo+t7DhYoojqKeqpoJAUqgyY3wyu2CQMFuN+dwezfH6trWKuKyl6gdnLKpMRBK3mYte1KIYJPcd3GyGzbFyzS1NyM1/4OaTXl7S2ji4Grja3+RhJzK+E+Eqb6x9MeHc4zoTkrPMuoFWALiK42Akwl89OY60e7voxlsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gETtDY/m; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gETtDY/m"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 774514E42659;
	Tue, 17 Mar 2026 14:25:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4E4F56011D;
	Tue, 17 Mar 2026 14:25:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 675B2104505F7;
	Tue, 17 Mar 2026 15:25:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773757503; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=ReYpIf5P0XqKNE/IqjBubHIkClDeft9UJw8AXo2Da0U=;
	b=gETtDY/marSGyoN7R6wguIOTQdEILbeMlwFAMgdMgnsxBV3tArklCOogLBtKk1d8gFG8qm
	Jm0hoXCLv1wDqkE4rnYteBz9rwh4QSEeZdlc/tlyT1tgyPAyhCvMpDbqcajMI5GH42xwkQ
	BcNcyMEa+9kgBoolJJtiJAskjmxfKaqwPE0d7+90oV8jqa2EYTC7GuIJNrL/D/bGpVMLPw
	OR2WBpAlayVzF2k08/4+JKLztAY7StppFTnwNsnW9T63uy7d6hDU0z4n80lgFYNE3EUVrw
	2Hh+ToLUEcP61DMjD/Vhm5nCN9VCoQWsuSsFW58FX7aLbprLC+AwAWZgI7r98g==
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
Subject: [PATCH v3 6/9] mtd: rawnand: sunxi: remove dead code
Date: Tue, 17 Mar 2026 15:24:34 +0100
Message-ID: <20260317142437.580204-7-richard.genoud@bootlin.com>
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

sunxi_nand_ooblayout_free() is only used in a code path where
engine_type == NAND_ECC_ENGINE_TYPE_ON_HOST

So the other cases can be removed.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index ca701c75cec5..68e22ce451db 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1756,7 +1756,11 @@ static int sunxi_nand_ooblayout_free(struct mtd_info *mtd, int section,
 	struct nand_chip *nand = mtd_to_nand(mtd);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 
-	if (section > ecc->steps)
+	/*
+	 * The controller does not provide access to OOB bytes
+	 * past the end of the ECC data.
+	 */
+	if (section >= ecc->steps)
 		return -ERANGE;
 
 	/*
@@ -1764,26 +1768,15 @@ static int sunxi_nand_ooblayout_free(struct mtd_info *mtd, int section,
 	 * only have USER_DATA_SZ - 2 bytes available in the first user data
 	 * section.
 	 */
-	if (!section && ecc->engine_type == NAND_ECC_ENGINE_TYPE_ON_HOST) {
+	if (section == 0) {
 		oobregion->offset = 2;
 		oobregion->length = USER_DATA_SZ - 2;
 
 		return 0;
 	}
 
-	/*
-	 * The controller does not provide access to OOB bytes
-	 * past the end of the ECC data.
-	 */
-	if (section == ecc->steps && ecc->engine_type == NAND_ECC_ENGINE_TYPE_ON_HOST)
-		return -ERANGE;
-
 	oobregion->offset = section * (ecc->bytes + USER_DATA_SZ);
-
-	if (section < ecc->steps)
-		oobregion->length = USER_DATA_SZ;
-	else
-		oobregion->length = mtd->oobsize - oobregion->offset;
+	oobregion->length = USER_DATA_SZ;
 
 	return 0;
 }
