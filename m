Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3276D3E315B
	for <linux-sunxi@lists.linux.dev>; Tue, 17 Mar 2026 14:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773757493; cv=none; b=Ff1TRWGX9t8ccUtMKggE4AExGVx0equeSmjILC1aJCqndpJx/Es75KNnFFD1ozC7YU2OeYwbE/ZPLgbims1/0ocBFlGRFkZOS0I5m6IKs0JoWPFkp5yisuknI+u2niqem/Hhizo9l4x52oxOKJa9rNkm41vB/wjN0tcIvptVzKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773757493; c=relaxed/simple;
	bh=eamVMEdwbpi5RVbts4PBYUeRiWc/WbG6XzEGJRHBwFw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a40t8jHvYvJkCk2FL7iFvq/m8zQtqVPYqOrv/SmNz6iYGgVrfUQYYze3u6JHe7EIf8VzeYhhRIDgZpJbdBTA/cezT8E0HiSLSNgdDHb2ZGrNwdgo3qGvJ3rJfOpb8q4PThi0QZ53W8x014S5GRGZTbFtTj8BGuzqlftwXPnZ7bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=0Tbm+tOw; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="0Tbm+tOw"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 71223C5506F;
	Tue, 17 Mar 2026 14:25:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 604C45FC9A;
	Tue, 17 Mar 2026 14:24:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8AE7C104505F9;
	Tue, 17 Mar 2026 15:24:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773757488; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=DN78EL9T5Ru3RT9ZOEzKnpYV80b6m9rbH2jsKW98yuk=;
	b=0Tbm+tOwnWZWD3hVCVLj6+aaoji2FfaYNAfB7ZBgC54xlBT6q26z5NiCypgNpgfJUBT6Je
	2i4WFnjGXAQ6zgGH6GP1fytWGmgMMITuUfG7trg7lwcSQw++OI9wfM7w0k2gROe9LJcrjW
	mn+eH6USQyS4dy7izgnTKSLNB+B/IMGqOEIVSqgANtdrEUyhOPjt+HZ3/swbmGSK7LCsdX
	3tCrLydh46Hae9jqy+t0SCrrLAb8bhaOxfS4UmTyyCQu09+ghtc7UGVRTdmZoX65uXR3OK
	qg4N1w278igbsyzx9C3vNhhSdCbcZTDc4reC7B/NRmtBFPTnrpFTBFjqka0/jw==
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
Subject: [PATCH v3 0/9] mtd: rawnand: sunxi: Fixes user data length for H6
Date: Tue, 17 Mar 2026 15:24:28 +0100
Message-ID: <20260317142437.580204-1-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

This series introduces the correct usage of user data length for
H6/H616.
If the older SoCs must use a fixed value of 4 user data bytes for each
ECC step, the H6 can have a different value for each step.

In the first round, the behavior was kept as the one used by A10.
But we have multiple choices:
- do like A10 like before (and not use all OOB)
- do like the vendor kernel (different from A10, but not using all OOB)
- use the whole OOB for user data bytes

In this second round, the third approach is implemented.

The first patches are fixes/code cleaning and the last one enables using
a variable user data length for H6/H616

Changes from v2:
- fix typos in commit messages
- add a patch fixing typos in code comments
- add a patch to remove some dead code in sunxi_nand_ooblayout_free()
- add a patch to change an error prone variable name
- maximize user data length instead of relying on vendor layout

Changes from v1:
- gather Reviewed-by/Acked-by
- rework patch 1 subject (more a code clarification than a fix)
- fix typo in patch 2
- remove patch 4 Fixes since it's not really a fix

Richard Genoud (9):
  mtd: rawnand: sunxi: sunxi_nand_ooblayout_free code clarification
  mtd: rawnand: sunxi: fix sunxi_nfc_hw_ecc_read_extra_oob
  mtd: rawnand: sunxi: do not count BBM bytes twice
  mtd: rawnand: sunxi: replace hard coded value by a define - take2
  mtd: rawnand: sunxi: make the code more self-explanatory
  mtd: rawnand: sunxi: remove dead code
  mtd: rawnand: sunxi: change error prone variable name
  mtd: rawnand: sunxi: fix typos in comments
  mtd: rawnand: sunxi: introduce maximize variable user data length

 drivers/mtd/nand/raw/sunxi_nand.c | 381 +++++++++++++++++++++++-------
 1 file changed, 294 insertions(+), 87 deletions(-)


base-commit: 11439c4635edd669ae435eec308f4ab8a0804808
