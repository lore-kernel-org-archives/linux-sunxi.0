Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2424D37BE81
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Mar 2026 10:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772704939; cv=none; b=YYqf1vgyP9lz1o392hjZHoKleCn8so36A3zBH61YzDoAMza+0ll9ho8x4P/NSZA4EPl4r5NbRKPW2UXMct6PPbu/4ysVDeNgN7NaH3kBmxN+0oMey/vevp1U8kbdhPKBzwpbxVe3t5+3kX8rTT7oQrhfv+3wu1PXE6ABh6UXEhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772704939; c=relaxed/simple;
	bh=KbWkE0xerrbCBpcn8lkbOUzzTCyNgP404+chNGHcVv8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kzdSxK2OWHNsUildxZX0gyKFjqevEHOdHtJUJS7PQ7Xn64JAM6nzR0YseMg3jpswDYiGwaK4na8arDMR8UM7EdxUXjEMRreulIoFLilUjaeASbQzsnQRu8pFsSigTKct6zxkY9g4xxfIA6JDEaO149XinoudW6ANSBDkSdWkpB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ue+w5GLA; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ue+w5GLA"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 78FCA4E42575;
	Thu,  5 Mar 2026 10:02:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5053C5FDEB;
	Thu,  5 Mar 2026 10:02:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 04C6E10369782;
	Thu,  5 Mar 2026 11:02:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772704930; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=1UvyLJ/S/s7R/v2QWzX78RjV1H2TGB5loF5BsnWForU=;
	b=ue+w5GLAg4LDAFO5YzVna2E32vLhpSejLV+0w3WEzh3QePeJMczFzDUMeHp5UxQWeBwPfA
	a63ic1P9NsA+u1jyry0zIzVZnlkr5t7q9zb9um3ow7VbOvCK6cssAIgafPJ5C4zm0ufnXA
	ZZx4u8RgdKWgSTDacKsgRhbq7c3LRGHJAMdpuNsZ6xm6TLVIMAlMrYp5wI608XtBG4B0Vh
	wBgR3GmG7toAXQ40OzBCeQEmEiQA08+UoX+wCCy50SYHtND0+Bw/0vtqGeEwWSrJbxBcZD
	9A+rW3t7e/x5/yjt7QcKKKT+rIALqZR65eGTJQuLdCe8jTtMuHw7kDqgyeD6yw==
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
Subject: [PATCH v2 4/6] mtd: rawnand: sunxi: replace hard coded value by a define - take2
Date: Thu,  5 Mar 2026 11:01:35 +0100
Message-ID: <20260305100137.2558423-5-richard.genoud@bootlin.com>
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

The user data length (4) has been replaced almost all over the file, but
2 places were forgotten.

The user data is placed before the ECC, for each step.
So, in sunxi_nfc_hw_ecc_read_extra_oob(), the offset of the user data in
OOB is indeed ((ecc->bytes + USER_DATA_SZ) * ecc->steps);

And in sunxi_nand_ooblayout_ecc(), the offset of the ECC chunk in OOB is
the same offset plus the current user data size:
section * (ecc->bytes + USER_DATA_SZ) + USER_DATA_SZ;

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index d126dc18ef27..0b0b5349f446 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1045,7 +1045,7 @@ static void sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
 {
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	int offset = ((ecc->bytes + 4) * ecc->steps);
+	int offset = ((ecc->bytes + USER_DATA_SZ) * ecc->steps);
 	int len = mtd->oobsize - offset;
 
 	if (len <= 0)
@@ -1741,7 +1741,7 @@ static int sunxi_nand_ooblayout_ecc(struct mtd_info *mtd, int section,
 	if (section >= ecc->steps)
 		return -ERANGE;
 
-	oobregion->offset = section * (ecc->bytes + USER_DATA_SZ) + 4;
+	oobregion->offset = section * (ecc->bytes + USER_DATA_SZ) + USER_DATA_SZ;
 	oobregion->length = ecc->bytes;
 
 	return 0;
