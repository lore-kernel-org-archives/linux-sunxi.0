Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5F82E06E6
	for <linux-sunxi@lists.linux.dev>; Fri, 20 Feb 2026 16:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771603837; cv=none; b=ua9npEgOJgQdRo/BjSa7aXgYkTyPxZi7L/TWlLX+SVn7I0DnC3cjkNCB8xOwYQe5PeQJ7AxEAbN59Je8ejO2zxG8fI8G4taG6LIN2adbtIag9Zr5qwtZqQgWQ+5mbAARYY9Eofznw6Skxn76HCcA1xeHvOMAu3g05+mugHCHL60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771603837; c=relaxed/simple;
	bh=/Nlxg6memL0C4+QlfWCbaOQc+Kl0SfzSqE1to0+e4og=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iu4X/udYsmlpd09O05lURv8Tw2AglNeR0nwm3s2sQ5rb0GwcUTyLww7xkNSbbCZAlLHwpDVlhHqS1wH3XJawgo4fdFxkYx4ev+wt3TqzE0fyUfS0vAp2vzMTl8kb2yHe5VfbqL5i+T4dyAYGxDOhqETDpLUk5X0B7GTAejdYO7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=yy/o5J0X; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="yy/o5J0X"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0F1FAC16546;
	Fri, 20 Feb 2026 16:10:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2E2805FA8F;
	Fri, 20 Feb 2026 16:10:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 11F2910368D43;
	Fri, 20 Feb 2026 17:10:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771603834; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=bnU1GLfsfh6CTuL5hdpsi/Zvec+WPL6baVdsR4hhOyQ=;
	b=yy/o5J0XBww1iLBwk2qM0/8qfK8FUIErpAb29xMB6xB2FobmoCiJbtVgK/FZ+wDrrXF0P+
	njhPMJNplLyLIB7+KYrygmL+RyVWFvbHIcqY9A4CFiysiGWy08osrA+c1/TVAK8SUEPEzI
	N710nB7agg9msOKBVoM27xacCCcWsfN14B95EnrsIyepj7tTQmMPZ2rC83mFxH+8Z4ZgxO
	8OG0/Jih4OyZ+CMrlLqc3mCScD8l0Lc3NZxcTyE9QH3Cagx1b9k5KQ6GgtLr/6TzH7dEES
	svi5zgiVh1YWubpWhRU1yS2t6hC/umNoVXuE+qmtE4YnbTz4vSbA7T9iRrCq7g==
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
Subject: [PATCH 2/6] mtd: rawnand: sunxi: fix sunxi_nfc_hw_ecc_read_extra_oob
Date: Fri, 20 Feb 2026 17:10:07 +0100
Message-ID: <20260220161011.999642-3-richard.genoud@bootlin.com>
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
Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index c420909b944b..9c6e0625e34f 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1054,9 +1054,9 @@ static void sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
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
