Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C3646EC9F
	for <linux-sunxi@lists.linux.dev>; Wed,  9 Sep 2026 08:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942658; cv=none; b=N4z3khGubvWu3NlagQFTsTaVkzp0DlxQVMZyqPm2+DXNcPrAXYayfKfSMVCEDlkn9EN6/jHisiF8eh5qE8K/ITJOaCYezUBavG2lxrFP6ORnx2lEvDWV+MJFOELr32XxDgLBTOTH5pBHQv4eaFEhZ6TcjDA2xSshUT6QhzT2SgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942658; c=relaxed/simple;
	bh=INVPCo9loZHqDMUNO+XVhGP57eMmNVJkeuMOWBHeYHI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JHTHWTf9tJSsPyTt4C98exx32y1Yz1c6hcbznz9zWCdseaq2OT6HT7t3EPC7WyU4zHTzbc8CZS40l8YHXPIjRJU20U5h+FvR6MSec++BnFJNjc+47pYId6FsbQugMTkORzVHLi9ryC+kT2ZBnMIcFLP60xgqECM3eQApw6NxNLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iukaCDcP; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iukaCDcP"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-46adfc81112so3214154fac.3
        for <linux-sunxi@lists.linux.dev>; Wed, 09 Sep 2026 01:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942655; x=1789547455; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oFX62AXoyl3FxsiGA0PjAmm/T3mqKPnSwH2wCNYEBT8=;
        b=iukaCDcP/XyfFFxEUoiG8TWv35qm6pcbchR7GhrkNRHb40sLkk4Gjy8UhJVioGs9UG
         jJZIAFxUlHVD/I42+aN+t3pzdiPaO+2M4EWLLSnJhHbVRtnVevnJPV/gm0LrX3T0+fD0
         Eb1yNIdltRz/2YZUPQ674eW5t8uf1ORw/aFBjJ4kW+GFvGsGuxEPkEFCFKLOlEkGeZh4
         ySs+5ggXq3oFAxS90qLUdgRmGOOC0Q9g2IBQXGbc3qEoSOkdLiScA/t0Aq3+CWWhjQlC
         PMpwZDF6/0JbyfjmOzhMi3XtZXI726IhyX0mtO2yqCLaf73qItIWdtDt87ySeUIj9NIm
         DHQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942655; x=1789547455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oFX62AXoyl3FxsiGA0PjAmm/T3mqKPnSwH2wCNYEBT8=;
        b=eArJnzqA6eW0W5RO6mJz12CciIRX0lmYVCF6yD9+829R/gf3ISUN3YCletPMAy6AAO
         WtHBQDhH5JBFyedCItBUObbjGWbStcjyPqzW/C/PBT0EIw3VL/miILxi9C62Asqap975
         htNsVXantQiKY0AKUkf5gJCkOfeY0hZTOP3GTuiP783sjKAljyGBjrn6jx+aulJsWXgh
         LuTBxbOPVgow6s222zsz9b+I5xytjV0+aA1PJed9Jwd9/9uKqT4CJackjI+FiFZZsDsh
         fE8sPzSTdUI918Rf/doKVX6EV3wCQEfps9N+nT/5YkLz52WO4R9zE9ijB6qJhWFRI7mA
         v/6g==
X-Forwarded-Encrypted: i=1; AKwUvBzzYnj6RgqI7HY+MqldFMpG7A1iXRNLfVbjWa73cj0/HH4ewcpNjwm2k0dhNiIAhSmcrr9s1YFAUxwRBg==@lists.linux.dev
X-Gm-Message-State: AFuF++n7uFguZOcoeBQaAowREFggPe5L/ftwM/KAQVACq33b3iGcoPw7
	+JXbopLK5JAc3ssFNBDy+uwOlh67LmQL66rJCl182vexasEy3vSy16Tq
X-Gm-Gg: AYBFou0qPOxRlhngVtLHipzO8Qnwo3Zz+oOWMpU79EzCzHrDrFcn6m5vDd/AYxY8kcP
	gDnVAhQayYR/Ts2WK74fOq+pfcyscb1zCKC6Adv82R8he4zaeqzlsEPJax9DRPal33O7t9pY3lH
	jhjGii8chw/ttalpTb7HYfVMjn+iqyx179khkPwxJBb3wj4mzoywT4zTLuD6uYc3iafmZGoxhwr
	irKjHWfWO+spCuWJ+PQuCzJmSBMl8XbRNSDz3MHryuGGn/B8u1ZcnHIAMQfhpVPT9QQjM+Ukqha
	dC+HnF+pQZ5z3Vs1OAbv+s+Hk+iT98nbOkZEMu2IOGdJeWfGHLJwa1xQHjipOcMfHeqoEp7YKAl
	CpbD1zAltQ/i01r4uZwRFCD+nYj+AZCRqxnr8qdknG3AeGCG87afRC7GTTInrY3EejqmCxe7CGv
	wgSvJyWRsxGskpkVKP5VQdcK43OfDfHogMO5lfqRCLWTqs5uSwpnPYlvveVShE8nuEynM7bBGGw
	7hAJQ7cH75XRc3thtmX7oRN7bIp3XSpO7eVrebI0Nt8R0XD7qJ74fqWvU6yTAjmXE47XTtjpt7+
	n5ZnzICII9OrVKHFZMmbKZZTO2PtIWmVGnkJXWsxxB0TYKPGijzXzcsU0ngIHwEWEXLt1DQQy25
	nxZJ4WhUzyVgQfZfixDLhTR9JO0Dd
X-Received: by 2002:a05:6820:4b8c:b0:6b7:83d6:2930 with SMTP id 006d021491bc7-6b783d62ed8mr16163242eaf.51.1788942654859;
        Wed, 09 Sep 2026 01:30:54 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6a0sm19031004eaf.5.2026.09.09.01.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:30:54 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 09 Sep 2026 02:30:35 -0600
Subject: [PATCH v3 02/15] mtd: rawnand: sunxi: propagate page-setup and
 erased-check errors
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-2-838cb0ba1547@gmail.com>
References: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com>
In-Reply-To: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The hardware-ECC read callbacks ignore errors from nand_read_page_op().
A failed page-setup command can leave the previous page available, so a
later successful transfer can return stale data instead of the requested
page. Stop before starting the PIO or DMA transfer when page setup fails.

The physical rereads used to check an uncorrectable chunk for erased
contents also ignore errors from nand_change_read_column_op(). A failed
transfer can therefore leave stale data in the buffers used for the
erased check and turn an I/O failure into an ECC result.

Share the erased-chunk fallback between PIO and DMA and stop before
checking the buffers when either reread fails. Preserve the existing
erased-chunk test and corrected-bit accounting when both reads succeed.

Before retrying a failed DMA read in PIO, restore only its corrected and
failed counters so partial results are not counted twice. Leave bad-block
and BBT counters alone. Route PIO page and subpage error exits through
ECC disable before returning the transfer error.

Fixes: 97d90da8a886 ("mtd: nand: provide several helpers to do common NAND operations")
Fixes: 25f815f66a14 ("mtd: nand: force drivers to explicitly send READ/PROG commands")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 120 +++++++++++++++++++++++---------------
 1 file changed, 72 insertions(+), 48 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index ab4003ea6fc4..5190b39aec5a 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1055,6 +1055,40 @@ static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,
 	}
 }
 
+/*
+ * Return 1 for an erased chunk or 0 for an uncorrectable chunk, with ECC
+ * statistics updated in either case. Negative values report transport errors.
+ */
+static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
+				       u8 *data, int data_off,
+				       u8 *oob, int oob_off,
+				       unsigned int user_data_sz,
+				       unsigned int *max_bitflips)
+{
+	struct nand_ecc_ctrl *ecc = &nand->ecc;
+	unsigned int oob_len = ecc->bytes + user_data_sz;
+	int ret;
+
+	/* Check the physical representation for bitflips in erased pages. */
+	if (nand->options & NAND_NEED_SCRAMBLING) {
+		ret = nand_change_read_column_op(nand, data_off, data,
+						 ecc->size, false);
+		if (ret)
+			return ret;
+	}
+
+	ret = nand_change_read_column_op(nand, oob_off, oob, oob_len, false);
+	if (ret)
+		return ret;
+
+	ret = nand_check_erased_ecc_chunk(data, ecc->size, oob, oob_len, NULL, 0,
+					  ecc->strength);
+
+	sunxi_nfc_hw_ecc_update_stats(nand, max_bitflips, ret);
+
+	return ret >= 0;
+}
+
 static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 				    int step, u32 status, u32 pattern_found,
 				    unsigned int user_data_sz, bool *erased)
@@ -1103,7 +1137,6 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	int raw_mode = 0;
 	u32 pattern_found;
 	bool bbm = !step;
 	bool erased;
@@ -1146,25 +1179,13 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 		return 1;
 
 	if (ret < 0) {
-		/*
-		 * Re-read the data with the randomizer disabled to identify
-		 * bitflips in erased pages.
-		 */
-		if (nand->options & NAND_NEED_SCRAMBLING)
-			nand_change_read_column_op(nand, data_off, data,
-						   ecc->size, false);
-		else
+		if (!(nand->options & NAND_NEED_SCRAMBLING))
 			memcpy_fromio(data, nfc->regs + NFC_RAM0_BASE,
 				      ecc->size);
 
-		nand_change_read_column_op(nand, oob_off, oob,
-					   ecc->bytes + user_data_sz, false);
-
-		ret = nand_check_erased_ecc_chunk(data,	ecc->size, oob,
-						  ecc->bytes + user_data_sz,
-						  NULL, 0, ecc->strength);
-		if (ret >= 0)
-			raw_mode = 1;
+		return sunxi_nfc_hw_ecc_read_error(nand, data, data_off,
+						 oob, oob_off, user_data_sz,
+						 max_bitflips);
 	} else {
 		memcpy_fromio(data, nfc->regs + NFC_RAM0_BASE, ecc->size);
 
@@ -1181,7 +1202,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 
 	sunxi_nfc_hw_ecc_update_stats(nand, max_bitflips, ret);
 
-	return raw_mode;
+	return 0;
 }
 
 /*
@@ -1248,6 +1269,8 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
+	unsigned int corrected = mtd->ecc_stats.corrected;
+	unsigned int failed = mtd->ecc_stats.failed;
 	unsigned int max_bitflips = 0;
 	int ret, i, raw_mode = 0;
 	struct scatterlist sg;
@@ -1342,29 +1365,18 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 			if (!(status & NFC_ECC_ERR(i)))
 				continue;
 
-			/*
-			 * Re-read the data with the randomizer disabled to
-			 * identify bitflips in erased pages.
-			 * TODO: use DMA to read page in raw mode
-			 */
-			if (randomized)
-				nand_change_read_column_op(nand, data_off,
-							   data, ecc->size,
-							   false);
-
-			/* TODO: use DMA to retrieve OOB */
-			nand_change_read_column_op(nand,
-						   mtd->writesize + oob_off,
-						   oob, ecc->bytes + user_data_sz, false);
-
-			ret = nand_check_erased_ecc_chunk(data,	ecc->size, oob,
-							  ecc->bytes + user_data_sz,
-							  NULL, 0,
-							  ecc->strength);
-			if (ret >= 0)
+			ret = sunxi_nfc_hw_ecc_read_error(nand, data, data_off, oob,
+							  mtd->writesize + oob_off,
+							  user_data_sz,
+							  &max_bitflips);
+			if (ret < 0) {
+				/* The caller retries the whole read in PIO mode. */
+				mtd->ecc_stats.corrected = corrected;
+				mtd->ecc_stats.failed = failed;
+				return ret;
+			}
+			if (ret)
 				raw_mode = 1;
-
-			sunxi_nfc_hw_ecc_update_stats(nand, &max_bitflips, ret);
 		}
 	}
 
@@ -1459,7 +1471,9 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
-	nand_read_page_op(nand, page, 0, NULL, 0);
+	ret = nand_read_page_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
@@ -1475,7 +1489,7 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 						  &cur_off, &max_bitflips,
 						  i, oob_required, page);
 		if (ret < 0)
-			return ret;
+			goto out;
 		else if (ret)
 			raw_mode = true;
 	}
@@ -1484,9 +1498,11 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 		sunxi_nfc_hw_ecc_read_extra_oob(nand, nand->oob_poi, &cur_off,
 						!raw_mode, page);
 
+	ret = max_bitflips;
+out:
 	sunxi_nfc_hw_ecc_disable(nand);
 
-	return max_bitflips;
+	return ret;
 }
 
 static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
@@ -1496,7 +1512,9 @@ static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
-	nand_read_page_op(nand, page, 0, NULL, 0);
+	ret = nand_read_page_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, oob_required, page,
 					       nand->ecc.steps);
@@ -1520,7 +1538,9 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
-	nand_read_page_op(nand, page, 0, NULL, 0);
+	ret = nand_read_page_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
@@ -1538,12 +1558,14 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 						  &cur_off, &max_bitflips, i,
 						  false, page);
 		if (ret < 0)
-			return ret;
+			goto out;
 	}
 
+	ret = max_bitflips;
+out:
 	sunxi_nfc_hw_ecc_disable(nand);
 
-	return max_bitflips;
+	return ret;
 }
 
 static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
@@ -1555,7 +1577,9 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
-	nand_read_page_op(nand, page, 0, NULL, 0);
+	ret = nand_read_page_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, false, page, nchunks);
 	if (ret >= 0)

-- 
2.53.0

