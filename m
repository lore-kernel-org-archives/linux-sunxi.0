Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904959;
	b=Gn++xGgEiAsjXMP9l8DDcvE1VN13MU1yu96BTQXOM3VQS3bGfkxw1nIYGermU/lRM9Vu
	 LO1Ietq8eB1kK0IAeePz64I+HWxEB0fXNZM0G38Tw6TwJKOZQ3yFEdVFx0xLbXFSM1LHJ
	 6JIdN40TGqbIDs9pDEwmp5dg4/4QoRVBPn9UvfaOpAo7OkcEk7no6ENl9uxWZTlCCI2QB
	 6KLmVB+R4unxxx5O9miiFaSSdru3EeEujyo+VSM5GpHwkdthXPjTsyyo+u+dL8JE/LMsg
	 sM/QzFrJ1b5iHuqfMcmYYUAnnSFdjkB2NV7lFNhrEwZWlpeWcsa16FagBTXOpo6aGbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904959;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Du4EE64glD0wtWCQ+qs5atx2KYOu7ZM2ZnRx2xMlHc8=;
	b=WxK991zdiYuLOsAQqmXueI++MyW51ui6hIUrVYAdOG5tf13oEBLvVoN9ozm59ZYjS8Hl
	 1BlbY3/+m9cNL/8nPZsgfy5IyCtNGgKys2OzTXJ/GFaIJhmr9FuzWMu5yBjWRwTiL6BBb
	 NF0X7Qsl5lAXG83ocycD0sWElxF3nu3IjOPCD4HZVfUa1GbmnGlfXnaRUFxM8McfnYfY0
	 5UmEDe1ZKM9UKC7ILdBFV2/6PsKemhyQP51jWW8FquaHBiBqn99ti6YpXY9nzRIS/drY8
	 Xq8d3SFXDg0ftjspcCUCdzzSjoIoGVxuxj5T29ClA0yP/2WO6VswHrl15ha4lmpDHwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UqJyOG6c;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE51B6082BE9
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Nov 2026 18:55:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE51B6082BE9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UqJyOG6c
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-705cb6ceebaso1493640eaf.3
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Nov 2026 10:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904957; x=1794509757; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Du4EE64glD0wtWCQ+qs5atx2KYOu7ZM2ZnRx2xMlHc8=;
        b=UqJyOG6cD19OXImSymO2Q7BQFqNKOWl1H5Qf/4LuJcHj36Mj5SmOxHdlB3A7C/T3oV
         GhWa9zcu60NabvGy/C7VtVI7QNvmHQiF1Nb9dmNc9frvOsMlrirFEcbNv0ZqReIC/KtI
         rVzpDWQgZ6eSwRCuLNR1315PC0btnxFRJJicA2Y4mzEgs6k4oTI5yx9OZUznnaahehzP
         aTlquLjQa+x4+0KHzXbSWUsBonGB2snHmLgEfcR8VZejPdPBj5UKQypFnd/3AuNzHJ/g
         e1I0W/LjiaCDFNX2b238Me968OcAqXF5+IAKXolsC4WFfefbKUD15sDt+tNR2NO9n4ja
         lIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904957; x=1794509757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Du4EE64glD0wtWCQ+qs5atx2KYOu7ZM2ZnRx2xMlHc8=;
        b=Dgs0K1IHayMgbvnXKBfnycQ/5/e6cVVySFNKDGGW6M8A/GKfPEr0/2KzojuOSLBxcC
         8Gogjm3/RAuySYmXf/exep+mRg9X5C7hvaU9+NnJ8itvIhELdgmMiK8N/K1SYWCZKD+k
         5fiaosECD9mpZvH4DCKCt2BNtk60uXbtHBlRcGQGWRRXtIt7Pjd9kJykWxBxQ3SDke39
         9z5V7xg/wXicbB3f5cUMC5qCpZSs/hgaGkyDqlycpTyvtWQfWyKvXg/wIjJukyNO1nDU
         D17Pf6PfNfBLdRkVcMmm8auGx6nmMwiE0r+eLFmbXMBQMixbTeR3WeM6IjYC0Sksy75H
         i//Q==
X-Forwarded-Encrypted: i=1; AKwUvBwIPAFtAUpzMlonezhGQBxIBU0WPtP1jCnyv8l+3feC750PtGFSGYKbDgkEmRpb7UT525Z62D4lhS/cLA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/fwdsDIgWbzvfwspSwtlKmbWgA5x+yFSHJ7gJIO+d+jzVLDWiU
	ojo1JWP0YBWOSa9DTuF2AaA9EgZCg3VHb6WNVQ8wAjo/he+R9P9fITDJ
X-Gm-Gg: AYBFou0WEsTdoerQ69HfOR46PG53+r7+LhU9KEuZt1UU5AZ07zRCS9FIxyN+saDKZb3
	utRtfK5ds3jPYIJRQKAeaYXEVS+Be4UaOwL850hhf6Rz+NFAL73I+7G9q3U0t5SP21ra2jA0enP
	qAvMyF911RmkzYhKkzgurR1j1Aav8AC8mdS7twA+8Yoo+p74jwDZNRZx6M58jOLg+0PfQBxg706
	1GpJGGvq4HmxlQlbw1udJ94fgLyqNQ8BCALrQt14UqFR+KsVy/f8qIavPxGsbfBiF9HqVZFHP4O
	eKNkiIhu1ejKDxP+zVHlKfRHlIlcUSrnpmdiRsxhcRyPA7kg9rSoXHgMWSTIN3ccexlxJStNBxz
	f7FStgBnTdrUrwxyvMCETBWMe/wce3vcaf/XNxrkIFEnHEkz74kKwpadO+w78CTBJkzl40mty3C
	eTKFpQvL/n2gYF6MTvD7hIuwYil+vcb3+Mj9+Tk2OMaHnazf4HtWC/T2Pn6NTg2T9RjzjaPGzuP
	0jyDlhiv3AQFwue9QrvuXRiOM6h0ETTxiOW+Ha5zUqLShuelUWsTyQHaRiXJHzMHXX0OpjD9oKP
	bmu17qOz6yKKs/FiNcI0XAMey4UZMIySvee2OiFUi+jNWve0tmUt0FwZDqsg5qRKRnekmCHPYx5
	7u6I56EYiJspAMgx8kKETYrTO9rdRcZR7Xqb3hYKddp/iDeDKUTAaSTTm2hkSWjaePa7jKWvURw
	NlVPajckMYSdRxNbe8VznDdiyLRxny2YVzGqZjaW1Bhgd8gsTdBUJU
X-Received: by 2002:a05:6820:a513:20b0:6fc:4051:d2d7 with SMTP id 006d021491bc7-716e78ed246mr305545eaf.38.1793904957427;
        Thu, 05 Nov 2026 10:55:57 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:55:56 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:32 -0700
Subject: [PATCH v10 16/26] mtd: rawnand: sunxi: propagate chip clock setup
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
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-16-dca1f6ed29a8@gmail.com>
References: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
In-Reply-To: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
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
X-Mailer: b4 0.15.2

Chip selection ignores clk_set_rate() failures and caches the requested
rate anyway. It then installs timing registers calculated for that rate
and proceeds with the NAND operation. Subsequent selections do not retry
the rate change because the cache already matches the requested rate.

Return the clock error before changing the controller configuration and
update the cached rate only after a successful clock change. Propagate
the error through exec_op() and the DMA page-write path so neither issues
a command with timings for a clock rate that was not installed.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 0b92bbe19c0a..7c80f52c517d 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -651,16 +651,25 @@ static void sunxi_nfc_dma_op_abort(struct sunxi_nfc *nfc)
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
@@ -672,14 +681,11 @@ static void sunxi_nfc_select_chip(struct nand_chip *nand, unsigned int cs)
 
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
@@ -1824,7 +1830,9 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 	u32 wait;
 	int first_step, batch_steps, ret, i;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
+	ret = sunxi_nfc_select_chip(nand, nand->cur_cs);
+	if (ret)
+		return ret;
 
 	for (first_step = 0; first_step < ecc->steps; first_step += batch_steps) {
 		unsigned int reg_index = 0;
@@ -2627,9 +2635,13 @@ static int sunxi_nfc_exec_op(struct nand_chip *nand,
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

