Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795223489;
	b=mUIlxSAgdVTw4qDHz4t0Ki46PIXQscqBA53JYX/8t/c0+mxUbnN/Lp0Pz1x6RK+LBeo/
	 7fSHgCbSEusz7dCARhuQ+tXkoGnb3bq1lUIa6arZiper9DFwmvaGBHxzwVF0vEL543ACv
	 R/bzoGF/+RbbQznjhTBFdJomjMlDrn3bS0QMSFteIRgc5o53F/BSlsqdPAMQ9ulunESVD
	 5chD1JcEw3NyQPhF2NPzZHeh4uU4aQe0U3CUA8cQIgswO+p5vbtcL/Som83GzHe9nhiNm
	 RlYk7Zi12cO0PbQFi6xwtAjBirmWH/R2kkgFFqHxP1bXp7bk3haPt6w7/DfiqKE1oaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223489;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=9R93eLtRuVCsdbuGEdtd6/wt6t26wDnU5PW4NiI4F68=;
	b=dbCxpKlT0p/mfAI/oAbGYWWsS+slX8EhuvpitXpUmaRll1IG3Zk3TG/NdENOAG3Cdw3y
	 QDl6meeSP27piWBl4+m/Tl9jSl0OkA3K5yv0+Yp14K7yBDFssPxq87YI2ydgY92zRKghC
	 3o9LPAGVEAhqqS0eNR56d5/cO11iTho/RvSYRgrV5wlHuyQWvmbqXwX2iXSWw1y69snRW
	 erby2klSWTc4onE8qW+gb3rb36w2JNeFXwHXdPuYO97vsO/uM7OvjQ5nBUqmDI31pTOsX
	 jsv+8ExlmbH0SXqN01vN43vonN1DZInmIYbQfPGdnp+zKn0OU061i7K3qdxANbjgvoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KDZeBMxV;
	arc=none smtp.remote-ip=209.85.160.50
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773F160A6F6C
	for <linux-sunxi@lists.linux.dev>; Sat, 21 Nov 2026 01:11:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 773F160A6F6C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KDZeBMxV
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-451a49abd8aso1569538fac.3
        for <linux-sunxi@lists.linux.dev>; Fri, 20 Nov 2026 17:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223482; x=1795828282; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9R93eLtRuVCsdbuGEdtd6/wt6t26wDnU5PW4NiI4F68=;
        b=KDZeBMxVEx4HoN7YujL7aEiUWU7miU0Un2hTrwuZn4evmr7NYmxTM/gSP+okWfRpy7
         bAfO2EKdMy7g5taV0Bfzzu1Q6xGaJWwUzZl/neUD79g4CKK5iCMD7gN/0ZWlkaiV9bqF
         /iW0UhKTbtHD45LOyikM5BtkuTLaNnpaGZeAvhtSbt2JNBui2QmtNz1+VsdwV2N6Kb3d
         EUGBntHm77Sk9RWC5tu0r8ymblFHFzocnNWofDeqx14T7iiQ/QHuIcIshsgRhmSL8TSS
         6wNsdj8lKDiTaxxkAeQ8rQBXx8a9tawmWrXER1R3s73iXQuIe83Hl3oxJ5kKZICgUFfE
         C0dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223482; x=1795828282;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9R93eLtRuVCsdbuGEdtd6/wt6t26wDnU5PW4NiI4F68=;
        b=QrSD1VLRVYoqfTK5FidBbUEHYojpsqH9BFY+n4kSnaEPlW586K6p/NQueYAFVOfMzW
         /VccYB+j9igbbbLNtlZ5j8LkkBPospvdJ2wxYNhrnSdu3isYYout7/mEg+rWp+QiMJf/
         iF+U8rVwvE1tAAjROP6fQMKp9bGtjuZijgDihydeexwuuWliG04lDZJNd1/Yl9KXtjLM
         IptvR+WOExswEE7C9xarwNRcC/lwNT/p6sFLGiUTS+wNdaH6DFZmmacyEQy3MIehrNn7
         w/zEKwGwyKqGYho+RWTfWR7yVABXCFEVDgk80Hioe+sqsp7Q/7Obbes1tE/zi66aJYX+
         fMgQ==
X-Forwarded-Encrypted: i=1; AL+hErHVTWpb102rR/fAO3HmvUJ71ozwPJidvEptfr2wnoJoeoMn3wXpaU3RFZ95eHlxyJ+ZafJzxsr0ylL0PA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9AUqx/hbvJYb7epQ52efeLXZK4Z/qSG50iTocbuCM/8I2H2m6N
	o5rV67G+AkHzPP/fjmyW/2RKv1YsGb9xSSGp30BXZH7/tjWwyFk4vywu
X-Gm-Gg: AYBFou1mDzeQfj5qFXIagrZAJwrb81+R8Rqiz96lVsMuS8s1WtXFLP6a14i9MK8PvkA
	GrOjN1PRWNpn6/gmyl9vBf5jNwyKhm+9RholBtR1sM+KjsAc3Hp3OMFzLrX98q63ljtUEg+Yl7L
	O/3fvTAYTY5Vsf65rsadvKUMFXzni2v1g7vg6ja4l+LRlCrxdDoW08kXhdOJWYxYKW7HI6MByYd
	SrY7xe3CFoeQ88cJf6qP8/joo9srJVDlANE178nMvIeZEMjyWy2nK3Lqncbh1Ml0lnb6kMLndQp
	tuqWeZPy39FTMJkfNKVYF79xwKDkPXlujfKPmgJzsxKEWblZ4aYVysa3c8+S8NRXM/YzvVu7TzZ
	wmphQHeKo5jYSGFmTDc0Qf9Oyw37GOCt+2jLprzTrX0lAelHQ0IaTfDj38BdveoKjdCW+Xw8S7h
	7OPkIAKzifd/KCtdUHjTrLtXrVkNmhqF8hhNxrNoItS6cCF0fulJIPxS6hlzYIw9e1Q0XsNWqQ/
	L7PznCGabO/+2jqmZYBRO5PnisUq1cVMEn3hwNDIQKYhMatYeicBqQRX6nJSitt5ynyBnfWTQI+
	QP+Tc8A0xLe+zcT9EaRNTBVO3MP9OpRPD5Y3l13tKATvOLnV3xPgOUKY6TzCGIgu9nME3F8yNSe
	xocjKL8teCjEDegODgHhxJ+QIC6W28fh4yF79/FVGhEIHCGmPLQMF2WCdOw3U2VdU+cbRhZanK3
	traz+uOpS6pBXYTLivFO61b2jHT4GgGsCNAmnnuObgYQm51C5q9A0f
X-Received: by 2002:a05:6808:13c5:b0:573:52b1:bb00 with SMTP id 5614622812f47-57a09910c41mr6373784b6e.39.1795223482353;
        Fri, 20 Nov 2026 17:11:22 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:22 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:42 -0700
Subject: [PATCH v11 19/26] mtd: rawnand: sunxi: propagate chip clock setup
 errors
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-19-9721b1905ef4@gmail.com>
References: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
In-Reply-To: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.17-dev

If clk_set_rate() fails during chip selection, the next NAND command
can run with timings calculated for a clock rate that was never set.
The driver also caches the requested rate, so selecting the chip again
does not retry the change.

Return the clock error before programming the timings or updating the
cache. Propagate it through exec_op() and the DMA page writer so
neither starts a command at the wrong rate.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index ee68ef9bba33..37cc023db74e 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -628,16 +628,25 @@ static void sunxi_nfc_dma_op_abort(struct sunxi_nfc *nfc)
 		dmaengine_terminate_all(nfc->dmac);
 }
 
-static void sunxi_nfc_select_chip(struct nand_chip *nand, unsigned int cs)
+static int sunxi_nfc_select_chip(struct nand_chip *nand, unsigned int cs)
 {
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(sunxi_nand->nand.controller);
 	struct sunxi_nand_chip_sel *sel;
 	u32 ctl;
+	int ret;
 
 	if (cs >= sunxi_nand->nsels)
-		return;
+		return -EINVAL;
+
+	if (nfc->clk_rate != sunxi_nand->clk_rate) {
+		ret = clk_set_rate(nfc->mod_clk, sunxi_nand->clk_rate);
+		if (ret)
+			return ret;
+
+		nfc->clk_rate = sunxi_nand->clk_rate;
+	}
 
 	ctl = readl(nfc->regs + NFC_REG_CTL) &
 	      ~(NFC_PAGE_SHIFT_MSK | NFC_CE_SEL_MSK | NFC_RB_SEL_MSK | NFC_EN);
@@ -649,14 +658,11 @@ static void sunxi_nfc_select_chip(struct nand_chip *nand, unsigned int cs)
 
 	writel(mtd->writesize, nfc->regs + NFC_REG_SPARE_AREA(nfc));
 
-	if (nfc->clk_rate != sunxi_nand->clk_rate) {
-		clk_set_rate(nfc->mod_clk, sunxi_nand->clk_rate);
-		nfc->clk_rate = sunxi_nand->clk_rate;
-	}
-
 	writel(sunxi_nand->timing_ctl, nfc->regs + NFC_REG_TIMING_CTL);
 	writel(sunxi_nand->timing_cfg, nfc->regs + NFC_REG_TIMING_CFG);
 	writel(ctl, nfc->regs + NFC_REG_CTL);
+
+	return 0;
 }
 
 static int sunxi_nfc_buf_chunk_size(struct sunxi_nfc *nfc, int len)
@@ -1778,7 +1784,9 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 	u32 wait;
 	int first_step, batch_steps, ret, i;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
+	ret = sunxi_nfc_select_chip(nand, nand->cur_cs);
+	if (ret)
+		return ret;
 
 	for (first_step = 0; first_step < ecc->steps; first_step += batch_steps) {
 		unsigned int reg_index = 0;
@@ -2519,9 +2527,13 @@ static int sunxi_nfc_exec_op(struct nand_chip *nand,
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	const struct nand_op_parser *parser;
+	int ret;
 
-	if (!check_only)
-		sunxi_nfc_select_chip(nand, op->cs);
+	if (!check_only) {
+		ret = sunxi_nfc_select_chip(nand, op->cs);
+		if (ret)
+			return ret;
+	}
 
 	if (sunxi_nand->sels[op->cs].rb >= 0)
 		parser = &sunxi_nfc_op_parser;

-- 
2.53.0

