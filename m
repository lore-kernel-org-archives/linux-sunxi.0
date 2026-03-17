Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5903E51C3
	for <linux-sunxi@lists.linux.dev>; Tue, 17 Mar 2026 14:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773757494; cv=none; b=MVgECsP+1PZybICFpdYyKDrdS51EyRWEOk2aDZJP5r7Cvt+Q/r6lFopGGy9z8x/Z22260JaoTXnjc1UtrRpRDzWtr9V4iS2gTbhu8SXBJj0CJ490/wKI1jwsRwQy/oqN6H31/XeTsnxwtbKhTfyYwzQsYVD404o4/iFjYQT5ov8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773757494; c=relaxed/simple;
	bh=82jHg/C84we0ggMOiWeHcRKzXN+cdC4vj8XTNcKMh+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qm7xftp5Nk9skBgNEecfGhnFfXWpP5dYPlXuEI1zm3IRBmiSdaqaHRLx1tBEjIm+33++7t1tnjj1DdrRoDjfGYcTFCYagkqAwaXCxnrE3eMtiHsIpNFP5md5IHXEue/Jr5BmI5h1BuORBTsZIC0kSPAZ0xFSNk3iY44d06GvXRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Wseylebr; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Wseylebr"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 00D991A2DED;
	Tue, 17 Mar 2026 14:24:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C8FFE5FC9A;
	Tue, 17 Mar 2026 14:24:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E11D7104505FB;
	Tue, 17 Mar 2026 15:24:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773757491; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=1fl+dYL251xXhtusEZ7b8g0kjCughX2VCuIW1qgsL2Q=;
	b=WseylebrZ8OgCzJNFztlPs25EauF7UnbXMoCwCAXTdAhRWD/i1MJTbLQrPV1tdXufR8tVW
	oyA06yE0NnU4U62RqsGMuFf0HsLf4MXSsRT7sxBYhGQXz9Gxouode6wEQtIXvgEFPb+xvg
	AdpNlYJqv6Qa7cDnYiSv6+jhj8k7tl9l7XPPEXdoWhh3VjgjG56kJSEBkwOYCk47LrsHzX
	T83aV+1B//hI98Fjyvx1Fc/sCT1aVkmpMt0nQe9PS4v4zqrpc6QswdeD7Zd6Iuc0lStGjl
	DviFp9sCciEyNy7tL5X+TFoptfWVmUATqhsOhB3oCqM+BTASnKLuPk+k96goPQ==
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
Subject: [PATCH v3 1/9] mtd: rawnand: sunxi: sunxi_nand_ooblayout_free code clarification
Date: Tue, 17 Mar 2026 15:24:29 +0100
Message-ID: <20260317142437.580204-2-richard.genoud@bootlin.com>
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
