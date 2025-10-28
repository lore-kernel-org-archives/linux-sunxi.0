Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3A826ED2E
	for <linux-sunxi@lists.linux.dev>; Tue, 28 Oct 2025 07:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761636969; cv=none; b=tRGuIVXgVM8QSHZAYDzuLYZwln4XRDHZlqO1ucRLXqxgl8Vnn1K/CUqb8CGuCEEMS8kwiRn3fVbSQmy37ZL/jrUxkNNznn/pGmz4yubeclfRQzGKRzIQYoMEXEE2+WOBwxd3zRxtYrbCP2dr2bEbtNUnSSoWR8mJq3DDUunL1L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761636969; c=relaxed/simple;
	bh=6c9HesstG3NQcUpIhPMPZWSj2uV65o7hSr6wSWajpdk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FHUOf459NGeXuZFMPU+977Fym6puXRTu+KAo42quTVBwMTTt740WP80l5DcWI++KN9zuIF9yBS7+iOqnHM2JiIyQlznCPcuMYvgulrjisfVXsHkcLMbyf98IUsG9PAu70HZ+dvvx11nQvQuqRjYcd06tr+9g86twcoIC/jmNcms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VGEOWZU7; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VGEOWZU7"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 46F284E41392;
	Tue, 28 Oct 2025 07:36:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1C7FC606AB;
	Tue, 28 Oct 2025 07:36:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4231E102F251A;
	Tue, 28 Oct 2025 08:36:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761636965; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=LCUJ5/saowpQPNFVp04KkuwgBr8Y1U1BrCTh+Ah/naI=;
	b=VGEOWZU7eCmMm50snDJGfubeXsxXWnafPqY4CgHnMnN0tNBfXTx91OLn8Z/qarILMzrw2e
	lnjmGe7H+skBJ8BigllTbFpPvMurZfKkw5ykkXeBAwEHAMEl9WaChjZPNAO72EOrfsfXgo
	jRxzU/Z9gNEdkHZ4JgYi18OKpoddxEAsc15kCMNfEoOrdoW2phPYlyVGe07EtPU4RTNY0Z
	k+cA/aYZ0Xqs0n1V3lPX1qgO3kem6qNXrCusKwnCVsjLKCz+t/iN1F8QAICMM2Uof1IneJ
	tPQt8O4PF4TV7WnB/+1Tbts/313lhAkllRacw9cD8Xneg3Gmmfe4npNZvlB5KA==
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
Subject: [PATCH v4 02/16] mtd: rawnand: sunxi: Remove superfluous register readings
Date: Tue, 28 Oct 2025 08:34:55 +0100
Message-ID: <20251028073534.526992-3-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251028073534.526992-1-richard.genoud@bootlin.com>
References: <20251028073534.526992-1-richard.genoud@bootlin.com>
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
-- 
2.47.3

