Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904965;
	b=OhS8PvNiwKGm9brl3bThZ0QoeH9kK+IQOQILChBkUOJzEBgO1B4fAvg6QSLTVuHneEp9
	 YaA4BIN9cUxQq0KFsbF+zspLKiuZQRaQdzvLj2MR/2/PZ237qfjEKaEqg5dFrbq0+mg+O
	 8N6HRh/oOoyXD0yspaZh3MMoZMYc57RV8u3qUpC72lYrWE/r6yZrdhJm5K5KRNL/58f10
	 Zym4ZYw+wxW9v6xVN/YKczdMUy7/GKEhaVp+/xmyZpwaeaQNTwAnTJDeTbTU3Sd5AluV1
	 7Wmg6ivyJpg706eNor/OsyS3aab6O/veSV0uNnq1S6rYrUmjIBxyxOVuiqTfeyc/TMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=4VfFDNUuLZDxL4knEKt4xHIe8trG1WlypP2b2NwnIZI=;
	b=1lg5VN2/Y6+5DLSX0ZBv8+hTJI2BlX1hKuLFtJUOHSKFVoQTm0YPs6ShrxLMWz8U9N1o
	 tbIYl0ZklIEvyTUgUU4Wi1cnORZ6PoH9//WiB3++NEZoRpb/njvdOxydX5lO8INYmFUhy
	 D4YTSuZYNf89E1Wn1IytYl4smn4BZr9EZ2IGtlhYX5hI28ZVsYwEPu9WvoZxoQHHV0EW1
	 9Cj+lfndojGqDGFVepRWWGDKIp8sFCNtHhjrDGBP2cTUdoNe9e2JHzMDWnCTRaKsyK/4s
	 JHXtE2smF9kw2s9+XVcgnHxLqQH97BWJXY3fSERl1tsKGU/2RuEvoA7m/VdS0Ymc38g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="tkYkCU/7";
	arc=none smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF72B606EE93
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Nov 2026 18:56:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF72B606EE93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tkYkCU/7
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-7143451981fso1504531eaf.3
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Nov 2026 10:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904964; x=1794509764; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4VfFDNUuLZDxL4knEKt4xHIe8trG1WlypP2b2NwnIZI=;
        b=tkYkCU/7r0FzQCs+uZdUYFqthe3BRjtDbxt3LFEjUZ5/oeApjl67/pqfFhW0sLra9C
         5CDAcwL6C828JNSYkHxLnJpDxmel18v0B9IrObjKvbIbIjC+A1xaxlZNJU30kttAEKL/
         kc/we8tWI2k3jiI3TeuPnWfq9SgbZmfGayOlNq9kGT52KsypIXLzUZYc7TmiJBNFEXW/
         lDH/yS7uTmmhyrUyPHMpswgw7dF6bntQpJN0J1s/pdh1Yf8rWz11ab4d714NaGX3Q/ms
         CeOrLQ8fMFduuFG2q5WUei2uGmaDfi+p+zYd0ezixSqsjiWRa6OK5HgThzqrU4Qlq67N
         3qhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904964; x=1794509764;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4VfFDNUuLZDxL4knEKt4xHIe8trG1WlypP2b2NwnIZI=;
        b=nOxNKtBOz9Izv6+q/aKACL3lS/T/gSC5SUzgV2+cVCO4Szix7Aap1K9vCCsfnB+sy4
         JFKmxBUTi0V9Ayn2nIYEpgQPtwzF2lpKuVXGIyqkd5tSsgU3RRds3zBmJZx/ZdqutWoA
         T32yIzd6gDNIzgNdxzeWiaIypNUk93W3Et50BaxSuHl0ABKZ3qLTD8pIhwKgQEsW3lty
         9DppQjHnwsHe4EUXZME4pcYjkhM5iM2Rx7mYj/h3eAUisH9tjFAHOnbmFsI0MeRLL02D
         +hoc+dM0l6J/Z2gywZ+CN1UDOea2hp/8ek+CugnjLMic4gX03J136bZBBgccl3DkwxGH
         e1sA==
X-Forwarded-Encrypted: i=1; AKwUvByouWu20MutT0IRdhQo+Qk0nMMx2jL1E0kLCoUSGvSFwbRqSxkPXU/iI6Wsyp7e/S1lmLrShEKSIX9auQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z+ZSS+H18hoqPzoHPoVv4fQKW/zmM11EGqIJT36b586th/1oL5h
	0zkXArtt8Twh4ERcUBPncwbz/iqICuFQp92IAUdDdj0Fo3vWzaj/mvtA
X-Gm-Gg: AYBFou3r8UlxdmMmijwjCzBd5pwPdRPredOL2cH89K3YZW8bBoRAVI4CGV3w7KDc9bo
	mwBf2IqzGkxqHT5ycU+CSQxprBLCrdjyTtTiqeh5xFz8H+1ABN/PybkEU0FpmqW+iSIQvNKM0rf
	ER8gO2bZN3wf8Oz5k4wrrcU6UR+r++FoouFOw7Qy6KBWuBjH/acIPyzdhAjckB1yk7Y9fPpbQbr
	lpMCORblcm0kzg1Ctjr1tBbLxaXr6lC5KeVQUhStnsMVNfCmAeMdfGR7iFnwYymwnRG+cB8+oZh
	akOKUZH+RXybax3cBEb6djdxonfBEavk6u+XYCyz49ZRx+MDy1YimJt9okbZc6y6O7szB+cBz6d
	v6sGq5wuRTSZkN3wYkWv7F7sIOPUjRikd4+BWEg0Lz3m2Mvm2+aVqsFh8dEB6P/oSqH5Exngtpf
	KLt7O3x0R53nJwj3PmLnluwjfCvyjDcqR1tsCv5/wEeP/cRHz3Xq3lN0Clpk3ajJIR/Wpr8LDWl
	9OZrsk+iZ0a3AlX558jtsXpkyvgAhwRGq/h1jUdjiaX9cdV+iwqPaXwGsDhbt0OD4TzMZO4Sx++
	KD3u4X6NPYQmfiNEQT+r21uM2od6C/LD7Wk/2v2IKzhPsLz3ATAALwMsWbe7Esti7ODYeI+54PC
	GhKD+PN6TlJvrucyEhYRJ1WbkAyEi30MQsqww/HKrRs2jqONvzOFLaRjuzAfCuNgVjt39jmlwnc
	KPO5jmMZ0JxONjoGkAdPrH65vs++MS64v8eg/YakZH6FGRnA/NN22L
X-Received: by 2002:a05:6820:4481:b0:703:10f3:89e4 with SMTP id 006d021491bc7-716e78a0258mr317119eaf.42.1793904963622;
        Thu, 05 Nov 2026 10:56:03 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:56:03 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:37 -0700
Subject: [PATCH v10 21/26] mtd: rawnand: sunxi: reset the H616 data path
 after DMA aborts
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
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-21-dca1f6ed29a8@gmail.com>
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

Resetting an active H616 MDMA read with NFC_CTL.RESET can leave the first
1 KiB of the next read displaced. Both raw and ECC reads are affected,
including reads for which ECC reports success. Reissuing the NAND read
command and restoring the visible controller configuration do not correct
the internal data-path state. The DMA read error path can therefore return
incorrect data when it retries through PIO.

Pulse the controller's exclusive AHB reset after stopping an H616 DMA
operation. Drain interrupts before resetting the registers and clear the
pending events before accepting another command. The next operation
selects its chip and restores the page layout and timings; reads retry
from a fresh whole-page setup, while interrupted writes return an error.

Require the AHB reset at probe and exercise the same reset operation before
accepting transfers. Perform the AHB reset before releasing the DMA
mapping. This relies on the H616 CCU reset callback, which asserts
and deasserts the reset through register updates and returns success. The
reset handle pins the provider module, and the CCU driver suppresses sysfs
unbinding.

Propagate unexpected reset errors, leave the IRQ disabled and reject
subsequent commands. Avoid register access after failed recovery. Error
propagation is not a substitute for stopping DMA if the supported reset
provider contract is violated.

Select the stronger recovery through H616 capability data, leaving older
controllers' abort sequences unchanged.

Fixes: 5ee37db34637 ("mtd: rawnand: sunxi: add H616 MBUS DMA support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 90 +++++++++++++++++++++++++++++++++------
 1 file changed, 76 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index e1306d14ab3a..e8286dc360ac 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -335,6 +335,7 @@ struct sunxi_nfc_mdma_desc {
  * @has_ecc_block_512:	If the ECC can handle 512B or only 1024B chunks
  * @has_ecc_clk:	If the controller needs an ECC clock.
  * @has_mbus_clk:	If the controller needs a mbus clock.
+ * @needs_bus_reset:	Aborted DMA needs an AHB reset to restore data ordering
  * @legacy_max_strength:If the maximize strength function was off by 2 bytes
  *			NB: this should not be used in new controllers
  * @reg_io_data:	I/O data register
@@ -368,6 +369,7 @@ struct sunxi_nfc_caps {
 	bool has_ecc_block_512;
 	bool has_ecc_clk;
 	bool has_mbus_clk;
+	bool needs_bus_reset;
 	bool legacy_max_strength;
 	unsigned int reg_io_data;
 	unsigned int reg_ecc_err_cnt;
@@ -412,6 +414,7 @@ struct sunxi_nfc_caps {
  * @use_mdma: use an internal MBUS DMA backend
  * @mdma_desc: H6-style MBUS DMA descriptor
  * @mdma_desc_dma: DMA address of @mdma_desc
+ * @recovery_failed: reject further operations after unsuccessful recovery
  * @caps: NAND Controller capabilities
  */
 struct sunxi_nfc {
@@ -432,6 +435,7 @@ struct sunxi_nfc {
 	bool use_mdma;
 	struct sunxi_nfc_mdma_desc *mdma_desc;
 	dma_addr_t mdma_desc_dma;
+	bool recovery_failed;
 	const struct sunxi_nfc_caps *caps;
 };
 
@@ -644,16 +648,50 @@ static void sunxi_nfc_dma_op_cleanup(struct sunxi_nfc *nfc,
 				     struct scatterlist *sg)
 {
 	dma_unmap_sg(nfc->dev, sg, 1, ddir);
+	/* Do not access controller registers after failed recovery. */
+	if (nfc->recovery_failed)
+		return;
+
 	writel(readl(nfc->regs + NFC_REG_CTL) & ~NFC_RAM_METHOD,
 	       nfc->regs + NFC_REG_CTL);
 }
 
-static void sunxi_nfc_dma_op_abort(struct sunxi_nfc *nfc)
+static int sunxi_nfc_dma_op_abort(struct sunxi_nfc *nfc)
 {
-	if (nfc->use_mdma)
-		sunxi_nfc_rst(nfc);
-	else
-		dmaengine_terminate_all(nfc->dmac);
+	int ret;
+
+	if (!nfc->caps->needs_bus_reset) {
+		if (nfc->use_mdma)
+			sunxi_nfc_rst(nfc);
+		else
+			dmaengine_terminate_all(nfc->dmac);
+		return 0;
+	}
+
+	/* Drain the handler before resetting its registers. */
+	disable_irq(nfc->irq);
+	writel(0, nfc->regs + NFC_REG_INT);
+	readl(nfc->regs + NFC_REG_INT);
+
+	/* A soft reset alone can leave the first subsequent read displaced. */
+	sunxi_nfc_rst(nfc);
+	ret = reset_control_reset(nfc->reset);
+	if (ret)
+		goto failed;
+
+	writel(0, nfc->regs + NFC_REG_INT);
+	writel(NFC_INT_MASK, nfc->regs + NFC_REG_ST);
+	readl(nfc->regs + NFC_REG_INT);
+	enable_irq(nfc->irq);
+
+	/* The next operation selects the chip and restores its timing and layout. */
+	return 0;
+
+failed:
+	/* Keep the IRQ disabled and reject commands after failed recovery. */
+	nfc->recovery_failed = true;
+	dev_err(nfc->dev, "NAND controller recovery failed: %d\n", ret);
+	return ret;
 }
 
 static int sunxi_nfc_select_chip(struct nand_chip *nand, unsigned int cs)
@@ -665,6 +703,9 @@ static int sunxi_nfc_select_chip(struct nand_chip *nand, unsigned int cs)
 	u32 ctl;
 	int ret;
 
+	if (nfc->recovery_failed)
+		return -EIO;
+
 	if (cs >= sunxi_nand->nsels)
 		return -EINVAL;
 
@@ -1496,8 +1537,14 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand,
 	       nfc->regs + NFC_REG_CMD);
 
 	ret = sunxi_nfc_wait_events(nfc, wait, false, 0);
-	if (ret)
-		sunxi_nfc_dma_op_abort(nfc);
+	if (ret) {
+		int abort_ret = sunxi_nfc_dma_op_abort(nfc);
+
+		if (abort_ret) {
+			sunxi_nfc_dma_op_cleanup(nfc, DMA_FROM_DEVICE, &sg);
+			return abort_ret;
+		}
+	}
 
 	sunxi_nfc_randomizer_disable(nand);
 	sunxi_nfc_hw_ecc_disable(nand);
@@ -1874,9 +1921,10 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 		else
 			ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 		if (ret) {
-			sunxi_nfc_dma_op_abort(nfc);
+			int abort_ret = sunxi_nfc_dma_op_abort(nfc);
+
 			sunxi_nfc_dma_op_cleanup(nfc, DMA_TO_DEVICE, &sg);
-			return ret;
+			return abort_ret ?: ret;
 		}
 
 		/* exec_op() restores the page's spare base during column changes. */
@@ -1902,8 +1950,14 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 		       nfc->regs + NFC_REG_CMD);
 
 		ret = sunxi_nfc_wait_events(nfc, wait, false, 0);
-		if (ret)
-			sunxi_nfc_dma_op_abort(nfc);
+		if (ret) {
+			int abort_ret = sunxi_nfc_dma_op_abort(nfc);
+
+			if (abort_ret) {
+				sunxi_nfc_dma_op_cleanup(nfc, DMA_TO_DEVICE, &sg);
+				return abort_ret;
+			}
+		}
 
 		sunxi_nfc_randomizer_disable(nand);
 		sunxi_nfc_hw_ecc_disable(nand);
@@ -2904,11 +2958,18 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 		}
 	}
 
-	nfc->reset = devm_reset_control_get_optional_exclusive(dev, "ahb");
+	if (nfc->caps->needs_bus_reset)
+		nfc->reset = devm_reset_control_get_exclusive(dev, "ahb");
+	else
+		nfc->reset = devm_reset_control_get_optional_exclusive(dev, "ahb");
 	if (IS_ERR(nfc->reset))
-		return PTR_ERR(nfc->reset);
+		return dev_err_probe(dev, PTR_ERR(nfc->reset), "failed to get AHB reset\n");
 
-	ret = reset_control_deassert(nfc->reset);
+	/* Exercise the recovery reset operation before accepting DMA transfers. */
+	if (nfc->caps->needs_bus_reset)
+		ret = reset_control_reset(nfc->reset);
+	else
+		ret = reset_control_deassert(nfc->reset);
 	if (ret) {
 		dev_err(dev, "reset err %d\n", ret);
 		return ret;
@@ -3021,6 +3082,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_h616_caps = {
 	.has_mdma_desc = true,
 	.has_ecc_clk = true,
 	.has_mbus_clk = true,
+	.needs_bus_reset = true,
 	.reg_io_data = NFC_REG_A23_IO_DATA,
 	.reg_ecc_err_cnt = NFC_REG_H6_ECC_ERR_CNT,
 	.reg_user_data = NFC_REG_H6_USER_DATA,

-- 
2.53.0

