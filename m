Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5634A3F1C
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Sep 2026 21:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789420231; cv=none; b=WYWV4gn13p05VgNnZhN0EwjH4q3cNH+6JkN0XyaWPvCWIVnFyrbgO7k92SRDMZteIaAuEjkAQGx1FSA7Vahi2YO4mDspzcRHuSsdfjF19UDjCLymiCNRvOjTGsQWkNyYbkMlXT4aqkNT8uuDpA1UNhknHcNNIpyCHQGy3x4EkLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789420231; c=relaxed/simple;
	bh=Izml/kmhnoiBi2LFA6kerFQHV26tFgrWjsTUcd1Th10=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b6mdVKHRcH7P7Y2gjc1cMk3MCPb0+RVsCDB0x/mH13B22FSj7QHZ6fQJmBS6xOMdGZAx3sJ4eTVC2zA233tbOhYsfgegN4EFVG2V19TIGN/kg4CGgBC2NFTBmKaE67ejFqafLBGRgIhRuT2X1j531iJFEJ6WD8vmzEFCa7Di4xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jJDRT7DL; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jJDRT7DL"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-46ac6e5d8f7so1446988fac.1
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Sep 2026 14:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789420218; x=1790025018; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+GbSlDHSjNPM9B5dSRFNO0YLnNdNTULtbcSEuiC7wJc=;
        b=jJDRT7DLUvr1F3HjhL0PVHL4ETRWc7MbuXEXpxfBDqG0Asy1dtw2IeaRxNxkjAdnzU
         yw1FzboOcDIKJbFvefWNZb43J51IXFFK0ar6kenD+PFBPb02LM3OHKxqR3+8l0opK5fY
         ir/mRUdT7srxFZxZPxLs8/YabVU5CoXzRBtIqelnSH+CfK7Z6cWuqkUOZkDtjvd721Pi
         tKcJFoaH/xe5CPGgbDmVA6z2hC/sSdcMdoCsaauzCz83aZ2/uBPBuZzVSyLsbykMfdjc
         vvEB3/PLjGTFZWWJkt6gr+5gbvFeFvqSi8LJYFhfUc7ZyaCLdSFPP9Zxsf7zqeYLzIqx
         fWUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789420218; x=1790025018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+GbSlDHSjNPM9B5dSRFNO0YLnNdNTULtbcSEuiC7wJc=;
        b=mGKENjsEucxULx0CRecfeGQE646tbFlofBnKObdEDe2UMhCfzdSrzZsbEJgfVPUjNS
         0bUp58PJunBxT6YsDV8BBynTWa+vYezVupl5MVwxjGCW/eNH77Y0ztAcgn7RYfuPEVW0
         QbRNUb4hbLrdeZFDVYmhFakOlpBZnP+srDpZBeX9/Yws6Axx/ZW9Iil4OoZ2tJxB18wR
         enTiHXLEmKOWlezyubVTRISPkqCWCOeaIPNZBxrYNgYr3lMRc1gmF/qABZy5YcwtY8Oh
         0lKiVmbv9uIVnhK01XXyZoEEweJNrTEpf9fVf3X6Z6RSKIjW0xx408pvndkYvLHacPxi
         fVqw==
X-Forwarded-Encrypted: i=1; AKwUvByn9t4TzbqEqeJcTtqgvVQ1koQ1u57WJLw5IcSlEys4utwNa5Sep1/YxkUl/6TJPAtiSzFTsXN1158SqQ==@lists.linux.dev
X-Gm-Message-State: AFuF++kWz6t444eGp/ykGjSYNjbXWPRFT2+BXlYjofeHCz9d2Zu48OAi
	YYavYzdew2pYmB4qr++BUKbhib01wE7gQYy2lqJavWh4Ic+luu0DBzY421crnw==
X-Gm-Gg: AYBFou1WalZKbsYcbpPxqvyL3vNxLDRHpHcsxXndJs9iusPo5+Dx4TkUFHr/gDBIKRL
	ThdjdsqfPULNsOr4yfJF5N2kCNWej1gvVacbWnAiU/VOY92fqKG+3dyI/63JxNkSZ+YRt8B3yV0
	upK90ruhmHFl7DUZMaA5VFDLw0iCsx7t2iBH3tJ+wJAYOJBF9HMP/FRKNw3zIpiaMy7fla7W5qz
	qMZzVbuS3KS5jL9OycFVICUqoLHfruN2WUDvMzXCH48WNXgSuLZbqVNjznjt0K9VwN13oYueNeT
	qnazGGBJ+3FpW10ipnXiWmjht+4MiPvEy8eg50Y/mSlAbi2mSQBwfIC6+pM/E8011OxCQJi4hXg
	sUduD9FHtDoEYMZcQcXWbOwbmKNOmlcZ58YyYr6KNZzExLVlAjgrj+hrHi4WdE1eECdG2qLlQtc
	d12C/Hh13Px1pU+IeoQU/8VTqlPXpDSKkPYHQ9iK0GxRM1Tue5KFzoPKqH7tViH6LQRVnU/NzUN
	udQiGf277R21INhKZwq9JL3r2ftmWuZDEHLIbi82bXtT/CHSkRuVafNP4lA0E5teBIJVjiMAs97
	RFNWSoJ5grDa+Z+q1qPJlz7DlAdzgkXRJn0GOCgH1iawjcVSunhJxTIYD0WrrOSqAVKyhC9x1MT
	fjVUPJ0YXF3wdVjgiZskb8viTmfiQ
X-Received: by 2002:a05:6820:1893:b0:6b7:8396:f3e3 with SMTP id 006d021491bc7-6c542249981mr2544577eaf.69.1789420218531;
        Mon, 14 Sep 2026 14:10:18 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c45bfc3fe9sm4698544eaf.15.2026.09.14.14.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:10:18 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Sep 2026 15:10:03 -0600
Subject: [PATCH v6 17/18] mtd: rawnand: sunxi: reduce user-data length
 register accesses
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-17-2fb084fe0751@gmail.com>
References: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
In-Reply-To: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
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

DMA reads and writes clear every user-data length register and then
read-modify-write one field at a time. Multiple ECC steps share each
register, so this repeats MMIO accesses to the same words.

Build each register value in memory and write it once, including zero
lengths for unused slots. Reprogram every word for every DMA operation
instead of caching hardware state, so controller resets and switches
between chips need no special cache invalidation.

Share the length encoding with a PIO-specific setter. PIO always uses
hardware slot zero, and its page callbacks clear all length registers
before the chunk loop. Write the slot-zero value directly instead of
reading and modifying the same register for every chunk. Keep the
per-operation clearing so other slots remain zero after DMA fallback.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 75 +++++++++++++++++++++++++--------------
 1 file changed, 48 insertions(+), 27 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 773ba55ecc07..41d6ef31ea3d 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1013,35 +1013,60 @@ static void sunxi_nfc_reset_user_data_len(struct sunxi_nfc *nfc)
 		writel(0, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, i));
 }
 
-static void sunxi_nfc_set_user_data_len(struct sunxi_nfc *nfc,
-					int len, int hw_step)
+static int sunxi_nfc_user_data_len_code(struct sunxi_nfc *nfc, int len)
 {
-	bool found = false;
-	u32 val;
 	int i;
 
+	for (i = 0; i < nfc->caps->nuser_data_tab; i++) {
+		if (len == nfc->caps->user_data_len_tab[i])
+			return i;
+	}
+
+	dev_warn(nfc->dev, "Unsupported length for user data reg: %d\n", len);
+	return -EINVAL;
+}
+
+static void sunxi_nfc_set_user_data_len_pio(struct sunxi_nfc *nfc, int len)
+{
+	int code;
+
 	/* not all SoCs have this register */
 	if (!nfc->caps->reg_user_data_len)
 		return;
 
-	for (i = 0; i < nfc->caps->nuser_data_tab; i++) {
-		if (len == nfc->caps->user_data_len_tab[i]) {
-			found = true;
-			break;
-		}
-	}
-
-	if (!found) {
-		dev_warn(nfc->dev,
-			 "Unsupported length for user data reg: %d\n", len);
+	code = sunxi_nfc_user_data_len_code(nfc, len);
+	if (code < 0)
 		return;
-	}
 
-	val = readl(nfc->regs + NFC_REG_USER_DATA_LEN(nfc, hw_step));
+	/* PIO uses slot zero; the page callback clears all other slots. */
+	writel(FIELD_PREP(NFC_USER_DATA_LEN_MSK(0), code),
+	       nfc->regs + NFC_REG_USER_DATA_LEN(nfc, 0));
+}
+
+static void sunxi_nfc_set_user_data_len_dma(struct nand_chip *nand,
+					    int first_step, int nchunks)
+{
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	int first, step, len, code;
+	u32 val;
+
+	if (!nfc->caps->reg_user_data_len)
+		return;
 
-	val &= ~NFC_USER_DATA_LEN_MSK(hw_step);
-	val |= field_prep(NFC_USER_DATA_LEN_MSK(hw_step), i);
-	writel(val, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, hw_step));
+	/* Write each packed register once, including zeroes for unused slots. */
+	for (first = 0; first < nfc->caps->max_ecc_steps;
+	     first += NFC_REG_USER_DATA_LEN_CAPACITY) {
+		val = 0;
+		for (step = first; step < nchunks &&
+		     step < first + NFC_REG_USER_DATA_LEN_CAPACITY; step++) {
+			len = sunxi_nfc_user_data_sz(sunxi_nand, first_step + step);
+			code = sunxi_nfc_user_data_len_code(nfc, len);
+			if (code >= 0)
+				val |= field_prep(NFC_USER_DATA_LEN_MSK(step), code);
+		}
+		writel(val, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, first));
+	}
 }
 
 static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
@@ -1237,7 +1262,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	if (ret)
 		return ret;
 
-	sunxi_nfc_set_user_data_len(nfc, user_data_sz, hw_step);
+	sunxi_nfc_set_user_data_len_pio(nfc, user_data_sz);
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD | NFC_ECC_OP,
@@ -1554,10 +1579,7 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand, u8 *buf,
 		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
-	sunxi_nfc_reset_user_data_len(nfc);
-	for (i = 0; i < nchunks; i++)
-		sunxi_nfc_set_user_data_len(nfc,
-					    sunxi_nfc_user_data_sz(sunxi_nand, first_step + i), i);
+	sunxi_nfc_set_user_data_len_dma(nand, first_step, nchunks);
 	/* exec_op() restores the page's spare base during column changes. */
 	if (first_step)
 		writel(mtd->writesize + sunxi_get_oob_offset(sunxi_nand, ecc, first_step),
@@ -1747,7 +1769,7 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
-	sunxi_nfc_set_user_data_len(nfc, user_data_sz, hw_step);
+	sunxi_nfc_set_user_data_len_pio(nfc, user_data_sz);
 	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, hw_step, bbm, page,
 					    user_data_sz);
 
@@ -2051,7 +2073,7 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 			goto pio_fallback;
 		}
 
-		sunxi_nfc_reset_user_data_len(nfc);
+		sunxi_nfc_set_user_data_len_dma(nand, first_step, batch_steps);
 		for (i = first_step; i < first_step + batch_steps; i++) {
 			unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, i);
 			int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
@@ -2059,7 +2081,6 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 
 			sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, reg_index, !i,
 							    page, user_data_sz);
-			sunxi_nfc_set_user_data_len(nfc, user_data_sz, i - first_step);
 			reg_index += user_data_sz / 4;
 		}
 

-- 
2.53.0

