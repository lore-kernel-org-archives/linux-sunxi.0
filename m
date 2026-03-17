Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BEC43E5591
	for <linux-sunxi@lists.linux.dev>; Tue, 17 Mar 2026 14:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773757511; cv=none; b=VJ0VAPAFrqmPdba5ZEqpA6TsfU6BWvLA+0+mHCT4C6WnYV4ChmxnGqSI5K2nQ0bVJ5sSkxBIeKMHzGH45f9oy4AXI0wkAkAArh8ONLLjdlIxYpsipEv3gbZl9zO04dS58rfbQ/1ugG5U12LZFSii2hgB39XHKcmSRyFbnhS4xZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773757511; c=relaxed/simple;
	bh=8f2rZDecSgEpsgaXJZ/HMYPdON77L+FyDpsWFX4ZRys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Okzfx0Q+i3Gq4GfzahtDMKa2wzmE05CE0kLhSsK2FBotdjgMkkDV/hl3yQfLB18qC015Hj66hRDC6nul2ryEEOUhcLmNCylaFE3ZT1hDoAVKCp9lvADf6Awyj1xWKyVcAn/tDbxGWzDWegrg1P0ssp1m7wmvejyCL5rzWuVqkNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=xyTOn8Iv; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="xyTOn8Iv"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 16A9EC55076;
	Tue, 17 Mar 2026 14:25:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 071435FC9A;
	Tue, 17 Mar 2026 14:25:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1FEE7104505F9;
	Tue, 17 Mar 2026 15:25:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773757508; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=X7VQhh/JhXPu5QGrk0qvjueePPB/glmqNU70q+jezU4=;
	b=xyTOn8IvIlhEGY/bUbA+/zRDLkFqn/mY/Ad8sb3AZUPABlwwMFyAmtMY7SUvbW+jc2qUpZ
	qxREUJv6tjB8xR6Ltkow1J/05VD2ddosGJAaGkE8sDv3ZUDFAvWzpk5dOnA3zdv98qPwuy
	hgIHCxQbdSE7rnMNc6ykEV81gTvw6fsuutA8t/8sjPzq2Zc8mb3s4pUlog1yo62sptE11F
	fVRGVO3Ls+ectEH9ik6q1N3jVAHNC8lZwTLLBL1rcF/BbTJTmIqGeAmqqtnUh47N156u9z
	IaLhG+3yXotxq4RFYgdl4Ztu8l2I1yMz55e+rtcsQp4oZ6Pol+f5jPBj5+90nQ==
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
Subject: [PATCH v3 8/9] mtd: rawnand: sunxi: fix typos in comments
Date: Tue, 17 Mar 2026 15:24:36 +0100
Message-ID: <20260317142437.580204-9-richard.genoud@bootlin.com>
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

Fix lenghts -> lengths and chuncks -> chunks

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 81e491be3563..3d2580d39e70 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -272,7 +272,7 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
  *
  * @has_mdma:		Use mbus dma mode, otherwise general dma
  *			through MBUS on A23/A33 needs extra configuration.
- * @has_ecc_block_512:	If the ECC can handle 512B or only 1024B chuncks
+ * @has_ecc_block_512:	If the ECC can handle 512B or only 1024B chunks
  * @has_ecc_clk:	If the controller needs an ECC clock.
  * @has_mbus_clk:	If the controller needs a mbus clock.
  * @legacy_max_strength:If the maximize strength function was off by 2 bytes
@@ -294,7 +294,7 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
  * @nstrengths:		Size of @ecc_strengths
  * @max_ecc_steps:	Maximum supported steps for ECC, this is also the
  *			number of user data registers
- * @user_data_len_tab:  Table of lenghts supported by USER_DATA_LEN register
+ * @user_data_len_tab:  Table of lengths supported by USER_DATA_LEN register
  *			The table index is the value to set in NFC_USER_DATA_LEN
  *			registers, and the corresponding value is the number of
  *			bytes to write
