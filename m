Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BABC2E762C
	for <linux-sunxi@lists.linux.dev>; Fri, 20 Feb 2026 16:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771603840; cv=none; b=FEhHm4uZvwBt8k0hhpUgm0jT6fbCwW29N6Lv7pMGoq7wdtBhdBYGdkT5wM0S5pwL6j6cCM2vF876vWrOmXlJPL1CpKsabdO8zjD+dsztCRGxZUBoM6Dfy2iFmDyi2HlrnzzmjxPqvEzktIObpCbtibBurZIUEftvVQyhs/XJTIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771603840; c=relaxed/simple;
	bh=5W/1OpfJsz5Okun9JADdKci255cYWEN3kmucMXgI7v4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E5kQxUf07zVOO5g6lXK7qgjvhIBhBaH1FRCIZ8mkneZ7g3MFwHDFiZhpF5jEs2iX78uqlyTes7/3KcvvxIxBaLOEcfEv5SfQoShIE+e0ZC/lJScHd+e732qKm920JXKoK2BHntOm+0qYD4t978OMREbZUeYUY5C34mAK6wDtjH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=XoZudrdU; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="XoZudrdU"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 336E7C16548;
	Fri, 20 Feb 2026 16:10:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 563005FA8F;
	Fri, 20 Feb 2026 16:10:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 492B810368D45;
	Fri, 20 Feb 2026 17:10:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771603837; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=kwjIfxJ8VNKkkqo4t0mWwpyEaLWQDyzfgT0yAJ2gX2E=;
	b=XoZudrdU9MU8FqiGo0MY7wjqPVjn/PHA5ebsam9oLxnojF2wMpeWVz8KZaBkFDhX0dcbBL
	uJPWsghim8fLkbuNDV0Q18OEIkIzq+LSM07yAxQR6P8F8gM7WnumCzk8WnNIsteajcyTWT
	hehwbRQWfn5hTdOAIXXsMAcdlea0F1LkEXzdsECoYKZcGohd14vNHxfNxrtGNYn6/LpgwQ
	tyiDXGQL6MN1la8r9gOHBPLVW9YsaOl38LiqNcN/cufurMz9gQeOPbeHTwbuUG5J88n1v3
	ZHqs/c2OIUNpj575epYSLATY/Ih5FCQe1R+oeH/QYKK+zL33YdDJJAVFv8jjJA==
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
Subject: [PATCH 4/6] mtd: rawnand: sunxi: replace hard coded value by a define - take2
Date: Fri, 20 Feb 2026 17:10:09 +0100
Message-ID: <20260220161011.999642-5-richard.genoud@bootlin.com>
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

The user data length (4) has been replaced almost all over the file, but
2 places were forgotten.

The user data is placed before the ECC, for each step.
So, in sunxi_nfc_hw_ecc_read_extra_oob(), the offset of the user data in
OOB is indeed ((ecc->bytes + USER_DATA_SZ) * ecc->steps);

And in sunxi_nand_ooblayout_ecc(), the offset of the ECC chunk in OOB is
the same offset plus the current user data size:
section * (ecc->bytes + USER_DATA_SZ) + USER_DATA_SZ;

Fixes: 1be7ac78b72f ("mtd: rawnand: sunxi: Replace hard coded value by a define")
Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 99d305bbda53..5d925b59b618 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1051,7 +1051,7 @@ static void sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
 {
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	int offset = ((ecc->bytes + 4) * ecc->steps);
+	int offset = ((ecc->bytes + USER_DATA_SZ) * ecc->steps);
 	int len = mtd->oobsize - offset;
 
 	if (len <= 0)
@@ -1747,7 +1747,7 @@ static int sunxi_nand_ooblayout_ecc(struct mtd_info *mtd, int section,
 	if (section >= ecc->steps)
 		return -ERANGE;
 
-	oobregion->offset = section * (ecc->bytes + USER_DATA_SZ) + 4;
+	oobregion->offset = section * (ecc->bytes + USER_DATA_SZ) + USER_DATA_SZ;
 	oobregion->length = ecc->bytes;
 
 	return 0;
