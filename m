Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9B92E06E6
	for <linux-sunxi@lists.linux.dev>; Fri, 20 Feb 2026 16:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771603833; cv=none; b=ok06++ZIBKqqKj4LzMLGqkbSHgbuACcTp1asnJ7Uu0674K/JxYnrm7VAYD7+TwawTXbH7TgLO3Tyjf4sfsmDfheK6x7SQ7QDKCHhMVCKoTdvEEX9gZdCNR9+Zy6yw18XTlFwsBtJi4GIOLrzA++WvFM+kOFNfy2JtCHpT6JpR0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771603833; c=relaxed/simple;
	bh=S5KZPUevfKU8t3WF1yRA/KYz5TuGHSpPxYFHfE7Sbmg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hPFDUfksf2G9O35yxcQSGDx8Ry+qiQqq92DAB+TrOOD/uXhw0gJ90u0jDT0jUsmYGeWliohLk5huM5YRIpJvOYUCl8CVPSUxSk64P0CbTQ+Z+OVuY7/bMcagv8QowEN/odb54ZuXpzweY7j5cfS5rardlJM4mD2Tx78HstEV5ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Isq5Nrqs; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Isq5Nrqs"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3EB201A0ACF;
	Fri, 20 Feb 2026 16:10:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1283F5FA8F;
	Fri, 20 Feb 2026 16:10:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 45B5710368D1C;
	Fri, 20 Feb 2026 17:10:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771603828; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=Dq+uxH2nK+WQ3kQsH/3znHt6ViWHPx5hXuA0KzxJW2g=;
	b=Isq5NrqsXvgTfqYvuXHenJ3EV8jFMtRfYBrpox2nTb7FYB9z9U8hfBxdupzjzWbjrYBrUq
	touW/QCm5sKgTttudRlDA6OuloJDtWEazV+Wfe5jx25h7oCEZZP6eBj0HLjJRCa3Z69nRH
	9908gISDI6czfT8iu49w4tYA11QMltu6teG7xg6mru59UQATZmg9dPj7DNJSVvgV7rjtaE
	NA2pECuhVYhcWZGF9wrWMElmAI0d+pNkW4UjdQ73SGwe6gi96mXCa9bAzNNRb7rqGE+LtO
	ZAMhD5ILqV1ZmRhf42Dw79GHnPpgXdbW8Q1X3l9V74mWMGI5L9kxojn4o0zBQQ==
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
Subject: [PATCH 0/6] mtd: rawnand: sunxi: Fixes user data length for H6
Date: Fri, 20 Feb 2026 17:10:05 +0100
Message-ID: <20260220161011.999642-1-richard.genoud@bootlin.com>
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

Richard Genoud (6):
  mtd: rawnand: sunxi: fix sunxi_nand_ooblayout_free
  mtd: rawnand: sunxi: fix sunxi_nfc_hw_ecc_read_extra_oob
  mtd: rawnand: sunxi: do not count BBM bytes twice
  mtd: rawnand: sunxi: replace hard coded value by a define - take2
  mtd: rawnand: sunxi: make the code mode self-explanatory
  mtd: rawnand: sunxi: introduce variable user data length

 drivers/mtd/nand/raw/sunxi_nand.c | 299 +++++++++++++++++++++++-------
 1 file changed, 227 insertions(+), 72 deletions(-)


base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
