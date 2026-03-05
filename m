Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8F337C0E1
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Mar 2026 10:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772704933; cv=none; b=krz7LP7hsP9mCPlCDOlHQ6Dvujd5FtzaA4zFdvaEVgGvTDuk4sLgGDtIvSIZaAR6ZCK0PsCuwLUuQ20Os0quU5JK8eBDF//mBkCxUq6I4nagnUu0Co5iw7xQLF9q21AXAhYXrqOmiUHKPPbk3486PgUg5ZEHxbN6yZkdeKXnUV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772704933; c=relaxed/simple;
	bh=kNgLjJrlVPIOrUijBxEICSEKE/F1DSIovTFoz7mVwRA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I3k21Esey7kE56H6j3qCHqmM2Z6kwZrG+ObwNKxOw9PvS0cls77cdTV4BqKPPavyD8XWkHzYrBHejDfqfBGEwtr5wkb2d3OIeTqL9EuFlur6GFLZeSHlVxYVrpixF0zmZMXRJN7yd/hm+gPIeq9Nju/NqcOphvvO0JniMI2jtUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cz0BjviQ; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cz0BjviQ"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E87121A2CD8;
	Thu,  5 Mar 2026 10:02:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B54E55FDEB;
	Thu,  5 Mar 2026 10:02:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EB371103683FF;
	Thu,  5 Mar 2026 11:01:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772704922; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=+Ukn0Yvb5TGeLdfNUGvVVDbAWuNnjNEYtRv3RO9qwKA=;
	b=cz0BjviQaYJ+d9g1FXpkfniB/qlG1QqEPcplCAMwp99Xc5Fq/PhiayYmCKHXQCFbEK+jPJ
	D6CCSX9KL5rMUWp8CFl+OEf8zfAiD+arSephpwuc1SjxTz0BbEEaxro2Z5Xx9DjdLOJrcp
	6bedvuR15cOlrEhQPj6wE+oBwaJaMp3Jjgi/LGS+I3CIdVbQUvj4s1YDnUfkOfMIpnKV3H
	Zr6/MQ69nMGRFbTE9yGcuF3YvzOg5PgmyOJBh+KgbjLSju04lDEEfWcoFdxXG2bdK0XkQZ
	ziVdVsat+ivCfu8SsunRps9LAkTFZBQ1M3s9UvAvgF6aAhtZywyA+FjgP5n65A==
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
Subject: [PATCH v2 0/6] mtd: rawnand: sunxi: Fixes user data length for H6
Date: Thu,  5 Mar 2026 11:01:31 +0100
Message-ID: <20260305100137.2558423-1-richard.genoud@bootlin.com>
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

In the first round, the behavior was kept as the one used by A10 when in
fact the images in the wild with the vendor kernel are using a different
layout.

The first patches are fixes/code cleaning and the last one enables using
a variable user data length for H6/H616

Changes from v1:
- gather Reviewed-by/Acked-by
- rework patch 1 subject (more a code clarification than a fix)
- fix typo in patch 2
- remove patch 4 Fixes since it's not really a fix

Richard Genoud (6):
  mtd: rawnand: sunxi: sunxi_nand_ooblayout_free code clarification
  mtd: rawnand: sunxi: fix sunxi_nfc_hw_ecc_read_extra_oob
  mtd: rawnand: sunxi: do not count BBM bytes twice
  mtd: rawnand: sunxi: replace hard coded value by a define - take2
  mtd: rawnand: sunxi: make the code mode self-explanatory
  mtd: rawnand: sunxi: introduce variable user data length

 drivers/mtd/nand/raw/sunxi_nand.c | 299 +++++++++++++++++++++++-------
 1 file changed, 227 insertions(+), 72 deletions(-)


base-commit: 11439c4635edd669ae435eec308f4ab8a0804808
