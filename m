Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA7B37C92B
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Mar 2026 10:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772704937; cv=none; b=JYPxdOf+WR+o+JYvswGUEWArFM7786zt/N0G+IoNty5hMw0Oa04shG1IWrBwvZKmp9Wpv6ucOMPH4FvRkayfy0DQfqRPzfMl9Et8Mx1UetL0Hc5KJS2379f8gGfZY63jPwpd7O1NLsEl2j7FmuseGhkyeEX60ny8+2t8duAcNdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772704937; c=relaxed/simple;
	bh=82jHg/C84we0ggMOiWeHcRKzXN+cdC4vj8XTNcKMh+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LfArF75U74Zzc3XBZgGsSviSMR1Wmsa/bhuWa6k05mHPykKGVvMLmVOmNlbbQiMKYDOJ9Hv9C5eoq+w/nUpD1bF1DSVkKzMuCR9doAB2D5ZP2KRKcI33oyhNENCuP6Ipi5nLds0sfpmkBmXDmX79ZEuMq7onK6r/QpVAonaCpjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Zghiv2yo; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Zghiv2yo"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0A8E1C40416;
	Thu,  5 Mar 2026 10:02:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 821595FDEB;
	Thu,  5 Mar 2026 10:02:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3C67410369782;
	Thu,  5 Mar 2026 11:02:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772704924; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=1fl+dYL251xXhtusEZ7b8g0kjCughX2VCuIW1qgsL2Q=;
	b=Zghiv2yoEfOauiKl+7OTiaMkunISYRUhHzMXxmuaIzAGpGxApG7CiDMXvPQ5zHnHZ0rom4
	8eqbL/QkYOOvaoUtnF4N1Fr/sJHS7nKFaIUVvfCqfOD1dbOigohz9hABMKrYbU9L3kvL0k
	Id31ptliJ7YLUKThNetmyQxFWFGz+BL5geqUHPrFgRlOwQFeyROwr1gpFXdFPuP7pwqhxI
	/d0e9cEYiVySQzWnyNhiyM4mJEx1PDdZnGbmufZ7N9psPVpm3oRqegxMRXb/YoxxrRsWrt
	88TMVNqFuWcgnU5/x+8nZ0UUMzwGTWotg9Q3SVvDHhviKRZTcqs6NMExh1Mjpg==
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
Subject: [PATCH v2 1/6] mtd: rawnand: sunxi: sunxi_nand_ooblayout_free code clarification
Date: Thu,  5 Mar 2026 11:01:32 +0100
Message-ID: <20260305100137.2558423-2-richard.genoud@bootlin.com>
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

The available length is really USER_DATA_LEN - 2 instead of just 2 (the
user data length minus the BBM length)
USER_DATA_LEN being 4, that doesn't change anything now, but if
USER_DATA_LEN changes, it will.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index e66adfcca7cd..915f1240546f 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1755,12 +1755,12 @@ static int sunxi_nand_ooblayout_free(struct mtd_info *mtd, int section,
 
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
