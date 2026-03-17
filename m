Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF363E51FA
	for <linux-sunxi@lists.linux.dev>; Tue, 17 Mar 2026 14:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773757497; cv=none; b=s34Scdd+W1n+tk/ns9ZuSEB30iwO0G1OcEFZ3+CT8tJO9dl7K8KochgWmdR6frC7iv05K47cfcH6dSh4QuXzGCwTyL4sOIXOhkcM+m3pOUCvgyv46QvWfuHJ1LpQZfrqZiyy1sLQhdLTfWF10sKzW2ZQa7Zzj9MQ/rIrjJWExVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773757497; c=relaxed/simple;
	bh=DJAzBHsTjBw4oM+pSBR4bqr3HXDHu7NQIDcmq6+PG/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A0lAANcvXZinNzQBs/ioU3U9gInUK5fzLceDyUhsrTzeDPN46TzVAOdcHFRq/8ISg90GphOJ75GaIMc9gy4kgBbSeWp5G5h6YQ/NFz7pvtzJt2/6TjWmxiefFYYXTQS+3v8jqDolGjNrBO1iarq2rb+2yn12S0cLxsU+WGSyDt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ykjH+AOn; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ykjH+AOn"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 75D134E42659;
	Tue, 17 Mar 2026 14:24:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4C6E85FC9A;
	Tue, 17 Mar 2026 14:24:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 88C56104505FC;
	Tue, 17 Mar 2026 15:24:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773757493; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=cDyw0VT/gRD0S6ZYgJzuggHzvkdYaJdJvFIQKhQJvv0=;
	b=ykjH+AOnDg0Ovh6NMWJk9k7DZ654ToPDcrq+hyh1JORlcjPV2LoEMIc3w0foci1lA9pDVB
	HII+BNkTM3RV6/I447xNxK5lrgaYlNF9RBmIIzD0WZEu3iDZLYVAEBYFkuvFSkLERy/1Q5
	/rxyx3ComX+XAJ+H0usyV7J4RW6z5AF9Yz5MWUVsxex71ad0K+0LY0t9lXFpX28ztN6RhV
	rwI9/D87m7E50FmmM8Y4n1/OiawVR/MkoaTMnNtBRYS8FBKJKF4k3q9ae+TN6YPoePhs4C
	h1na2Qa2d51Rbbi3BLSGMyNvSoCW8g9FR9PW6/fxFva7YHH1AuIsQgrMx2sjJQ==
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
Subject: [PATCH v3 2/9] mtd: rawnand: sunxi: fix sunxi_nfc_hw_ecc_read_extra_oob
Date: Tue, 17 Mar 2026 15:24:30 +0100
Message-ID: <20260317142437.580204-3-richard.genoud@bootlin.com>
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
