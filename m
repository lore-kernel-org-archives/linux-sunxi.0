Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C59C191F91
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Oct 2025 10:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760955232; cv=none; b=tzhe8sAm+9+VchdLFClB6fOzPk6nPblaZr8pK0GDElMCSFQ7o7ERn5H/zhlyVpdp705VzYc2Q5E0wLgf6MM+yJlas+BcpYX1D+6mrQjYjahjuc4Ql+exkNRzXBGS36YPIWd3UXMMVca1LZD3+PoaDvdeVRB+3jBd8m+gTLkB3hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760955232; c=relaxed/simple;
	bh=uV3J+ukDhk15H89nr/D2cVuC6yRnOiEZ9jjzajCXzKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JVLPoY1bpL/dVw04vvD0nKQVGCtKlqVdKccDhJqzr2mSlYjSXpyoBwpxh8FzVgJyVox8PII9/BvGuNvtoXNmeYM2GSDCafahuuIpjNjrr5B3MJGC6M55/wC9OKxx5Dauuf42bHMWBd/xw8ZKwyYx+DF1IDZK515pyb3bxNhWCrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZKstGuMo; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZKstGuMo"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6CB76C0AFE4;
	Mon, 20 Oct 2025 10:13:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EF86A606D5;
	Mon, 20 Oct 2025 10:13:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BED94102F23A7;
	Mon, 20 Oct 2025 12:13:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760955227; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=j9UGTJcWYSBAqp5JJLufyhsbLELsj0ohBAucYdJtZ1o=;
	b=ZKstGuMoiIN/ifTdPeQY8PmAMotlWmbporhLhj7pGHzBM32L0Oimhlj9F8vLLXbnXug4uQ
	qERwvE68jOeOd4Q+imJIbtPiuOM2dHBoPpiUpyTbmQlzf/koGuwGowDJWgH1xxgkN+AkTz
	YAbTdrNS3yw5I+0goOMHNDmsieefCMP75oNwWSnkZQx9oThOlNMQogdgBRZjR/1HUJ3GGB
	MXUvYhtA8I3ivHfz9GGHYWyTZ+0tAi4bySm6smXAI0gNeN9rC222/WJO5BZ7MTEbGRlfze
	C4gT/le7b8+5cabWB3hpxiSp+z1kyE3ur+IbICHqPAyhFMJHlTx9rS8SJxSaVQ==
From: Richard Genoud <richard.genoud@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Wentao Liang <vulab@iscas.ac.cn>,
	Johan Hovold <johan@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH v3 01/15] mtd: rawnand: sunxi: Remove superfluous register readings
Date: Mon, 20 Oct 2025 12:12:57 +0200
Message-ID: <20251020101311.256819-2-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251020101311.256819-1-richard.genoud@bootlin.com>
References: <20251020101311.256819-1-richard.genoud@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The register NFC_REG_ECC_CTL was read twice and the result was not used,
then a third time with a mask applied.
Removing those calls didn't change the behavior.

Tested on H616 SoC, scrambling enabled.

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index f6a8e8ae819d..cb12179b63a5 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -623,13 +623,12 @@ static void sunxi_nfc_randomizer_config(struct nand_chip *nand, int page,
 					bool ecc)
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
-	u32 ecc_ctl = readl(nfc->regs + NFC_REG_ECC_CTL);
+	u32 ecc_ctl;
 	u16 state;
 
 	if (!(nand->options & NAND_NEED_SCRAMBLING))
 		return;
 
-	ecc_ctl = readl(nfc->regs + NFC_REG_ECC_CTL);
 	state = sunxi_nfc_randomizer_state(nand, page, ecc);
 	ecc_ctl = readl(nfc->regs + NFC_REG_ECC_CTL) & ~NFC_RANDOM_SEED_MSK;
 	writel(ecc_ctl | NFC_RANDOM_SEED(state), nfc->regs + NFC_REG_ECC_CTL);
