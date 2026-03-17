Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA233E5564
	for <linux-sunxi@lists.linux.dev>; Tue, 17 Mar 2026 14:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773757502; cv=none; b=OJElY50fqO9HXN/fOG7LZVeKv61NStFY0z/8DguMs11aT07QVm8smg1BaqVDwcW6/q/TJxE0RwoewDSP+Qw8rsC8QaesHw4lwQX7WS5kouOIkFfS5CLnTT7czPzR8NLpPqlCttNi2CFyFZ3bZifHu6sSqVulB8C/wvwy4aVLl/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773757502; c=relaxed/simple;
	bh=KbWkE0xerrbCBpcn8lkbOUzzTCyNgP404+chNGHcVv8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BvuaMwrFJG/zMqzuXToeJT6IaGjDq5b4ElB87FP8aHeMFRpBWCzyUbTAIP8Lwr2fZi0MflX0NHuOL6yfyUeNIni9/27Z+s3Mnfm6thlLzk66Su49w+/cRd5OCJKtgn59crggbok/ZVsuxgnSJWxg3DwhGJ+Lf3WWKlZIkaKpNg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ecr3GlS4; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ecr3GlS4"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A02294E42661;
	Tue, 17 Mar 2026 14:24:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 75D20600E0;
	Tue, 17 Mar 2026 14:24:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8B5C9104505FB;
	Tue, 17 Mar 2026 15:24:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773757498; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=1UvyLJ/S/s7R/v2QWzX78RjV1H2TGB5loF5BsnWForU=;
	b=ecr3GlS4/ntkiBjCJBb9m+h5WGJVAxxTNLuU8QAhV8xcC9rfeAezpCJlr7MA4h5Z6ADpqf
	+EhCwD4PMorXlnpQLKKCgSmA6zX9UF2j0BfF9qigE/Os8+CRX/R1CfiA6oKsF7NF7XZfWU
	IF5SaikLhM346ci+aeARFkcwaHkA7XyubhqWMiVDroL7Nhs74a37DDJGkejWIX1srrw34F
	SNrvT+ipdb8wxGDGAAoBAwwI6Q8PWB5vYUBISa5pcQ0aBG1KrHfYpiJcCNXTScpqDWP638
	oukvNKTXe5NQmB321x2NCOylZifjtVANlV7n8hJIL+WLkyWb/ChbWLpQcIaytg==
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
Subject: [PATCH v3 4/9] mtd: rawnand: sunxi: replace hard coded value by a define - take2
Date: Tue, 17 Mar 2026 15:24:32 +0100
Message-ID: <20260317142437.580204-5-richard.genoud@bootlin.com>
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
