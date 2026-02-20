Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0860F2E62AC
	for <linux-sunxi@lists.linux.dev>; Fri, 20 Feb 2026 16:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771603836; cv=none; b=mzZAfFKLzGij1/hnM3nDGsAvKcsp7+gZI4GQjsO3wKv020Y/bZxoaYdkL6Kk7vnX3fc5t0WWCzZQylafP3K0ow3qiZ/1qB2bPojp91l6fxmm1a/o+kd1uXkF3Gz+8SGYtfStkp8MxQeGZqfU78BBZfhCklC6n6hvZEL8G2KD67w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771603836; c=relaxed/simple;
	bh=dttikJiZfkeAyckrKqao9r8VP9Ys24xHfHOxt5mVMVE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MJ55YE5BNbKb9RSeSrTii8+Nr+B/wfIiDKTJLBS/WdM9nV6f7eSl/uPYhhj9J37bMutziDKFsVUTR63RoH60Ees5H7EXe/j7JKTURsDzR90ek7yAcvGDPHZajn4TcdPtu2us7Aaq3j/ZFv6BzrrIZGvd3NGySCXgu7sjZ+yH4cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=a6i2RJyL; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="a6i2RJyL"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5BC9BC16545;
	Fri, 20 Feb 2026 16:10:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 795395FA8F;
	Fri, 20 Feb 2026 16:10:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7882910368D1C;
	Fri, 20 Feb 2026 17:10:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771603832; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=sc1ud4NvoSk2r2XkR507CAgHdz72HRaNe5gFe/sJK8E=;
	b=a6i2RJyL2lZNjW2hv3kXp3DpYkrzMP6CA6mYlLELH1wOzZVx5Ruuh0ikaKvklhk+jzm0aL
	enWEmtR5phIczunvjo4Z5LVL5aisAdukPwHJiil4v9lza1fiNHJP9PJa/K5NWl6DBktl4l
	YGksdqN/u2vlgxvEwGBv9OJQb/Wc3KYVx/VBAiTtA5WRIpju7vlbgwgEv9f7JBZz32zt/z
	sIfpn/4MaE1gPj6JXtmMyWCo58FaY4azt7vapiW30EHX/+TIto0tXaPW9ebANNa4SYBFtB
	jnoYN1RMgS38Qi75XgMp+pmfQPCCjnR7bndOLgZxo/eouTa1n0O+AKrgWABZnw==
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
Subject: [PATCH 1/6] mtd: rawnand: sunxi: fix sunxi_nand_ooblayout_free
Date: Fri, 20 Feb 2026 17:10:06 +0100
Message-ID: <20260220161011.999642-2-richard.genoud@bootlin.com>
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

The available length is really USER_DATA_LEN - 2 instead of just 2 (the
user data length minus the BBM length)
That doesn't change anything now, but if USER_DATA_LEN changes, it will.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 9dcdc93734cb..c420909b944b 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1761,12 +1761,12 @@ static int sunxi_nand_ooblayout_free(struct mtd_info *mtd, int section,
 
 	/*
 	 * The first 2 bytes are used for BB markers, hence we
-	 * only have 2 bytes available in the first user data
+	 * only have USER_DATA_SZ - 2 bytes available in the first user data
 	 * section.
 	 */
 	if (!section && ecc->engine_type == NAND_ECC_ENGINE_TYPE_ON_HOST) {
 		oobregion->offset = 2;
-		oobregion->length = 2;
+		oobregion->length = USER_DATA_SZ - 2;
 
 		return 0;
 	}
