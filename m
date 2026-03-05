Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CD737C93D
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Mar 2026 10:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772704937; cv=none; b=fIY1hx5Q5BLt9lVcot+4wC5qbI1N8ps2pmfGElIYE5vpUYYCYxzZ9sd2RPAcRtSL1mVl60t9nhixPwKjIFxuOL5Q/RDJl6wipBTTf6DO2H7z19vw/i2agECNVJR87zoRkoQD7B8GUH0BxxiYrBbbOsfH/h4/2yfzD7El1VIGE6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772704937; c=relaxed/simple;
	bh=DJAzBHsTjBw4oM+pSBR4bqr3HXDHu7NQIDcmq6+PG/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L4HcUV+fH9EfTmrYTybB3TOHJupwSa1repr58kbUIUCMUIwrkK5L79TsuExjpvcXUn0e6usOdF5JtwqVghx6uKxFgoHsrgjf1F9lSgUNppGujTP9J001jqe9fBErLEMHsSbt6OmWnjkqVuglJt30pCdGC+cG8kyDdfGVoO0Mwto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=lBilC751; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="lBilC751"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 256701A2CDC;
	Thu,  5 Mar 2026 10:02:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EE8F75FDEB;
	Thu,  5 Mar 2026 10:02:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B2B37103683FF;
	Thu,  5 Mar 2026 11:02:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772704927; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=cDyw0VT/gRD0S6ZYgJzuggHzvkdYaJdJvFIQKhQJvv0=;
	b=lBilC751rjznANkYaxxbdfu4vosOyLn5O8oxsGdjQqYN5hInWOVO2qKi/yggbFucjrpJqB
	58SL80VfxsI64nvR+fVgVX0wbKI8mczC+Ra+aPZla98kkxCNPDABwg+PH5H5CMXcWM+E2v
	qIKZeRILxUCgT6czPcAMSVTHnn/FSyBVS4lZX4PCZnmX9KvtT/Mt7RHxT9S9fhVd9tS1qr
	Gt94UbJEex9MN51YOAlHidVt18dXo1J4YxWE1V539qh4DvWRHZijn4irJWdXkmorXcClb3
	mUGX5w44in3hC4oCDJzXDxiUqHY838U22hoHKFaS77VAV3FLpVwj1Gx8HFjWMQ==
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
Subject: [PATCH v2 2/6] mtd: rawnand: sunxi: fix sunxi_nfc_hw_ecc_read_extra_oob
Date: Thu,  5 Mar 2026 11:01:33 +0100
Message-ID: <20260305100137.2558423-3-richard.genoud@bootlin.com>
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

When dumping the OOB, the bytes at the end where actually copied from
the beginning of the OOB instead of current_offset.

That leads to something like:
OOB: ff ff ff ff ff ff ff ff ea 19 00 3a 83 db aa 8d
OOB: 99 09 c8 9a 90 36 35 7d aa 15 13 07 3d 97 b2 a4
OOB: a8 bb 19 b3 07 e9 f6 25 52 d7 1a 23 e2 7e 0a e4
OOB: 52 8a 09 d2 1a 86 3d cf b4 99 43 13 d3 90 33 0b
OOB: ff ff ff ff ff ff ff ff ea 19 00 3a 83 db aa 8d
OOB: 99 09 c8 9a 90 36 35 7d aa 15 13 07 3d 97 b2 a4
OOB: a8 bb 19 b3 07 e9 f6 25 52 d7 1a 23 e2 7e 0a e4
OOB: 52 8a 09 d2 1a 86 3d cf b4 99 43 13 d3 90 33 0b
instead of:
OOB: ff ff ff ff ff ff ff ff ea 19 00 3a 83 db aa 8d
OOB: 99 09 c8 9a 90 36 35 7d aa 15 13 07 3d 97 b2 a4
OOB: a8 bb 19 b3 07 e9 f6 25 52 d7 1a 23 e2 7e 0a e4
OOB: 52 8a 09 d2 1a 86 3d cf b4 99 43 13 d3 90 33 0b
OOB: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
OOB: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
OOB: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
OOB: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
(example with BCH16, user data [8,0], no scrambling)

*cur_off (offset from the beginning of the page) was compared to offset
(offset from the beginning of the OOB), and then, the
nand_change_read_column_op() sets the current position to the beginning
of the OOB instead of OOB+offset

Fixes: 15d6f118285f ("mtd: rawnand: sunxi: Stop supporting ECC_HW_SYNDROME mode")
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 915f1240546f..8af449e548d4 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1048,9 +1048,9 @@ static void sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
 	if (len <= 0)
 		return;
 
-	if (!cur_off || *cur_off != offset)
-		nand_change_read_column_op(nand, mtd->writesize, NULL, 0,
-					   false);
+	if (!cur_off || *cur_off != (offset + mtd->writesize))
+		nand_change_read_column_op(nand, mtd->writesize + offset,
+					   NULL, 0, false);
 
 	if (!randomize)
 		sunxi_nfc_read_buf(nand, oob + offset, len);
