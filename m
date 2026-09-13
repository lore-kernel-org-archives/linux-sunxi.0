Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C043955F0
	for <linux-sunxi@lists.linux.dev>; Sun, 13 Sep 2026 04:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789272332; cv=none; b=kHfSvPEGAntbp8WtchjQyLIOlB1kGufqSYhXl1GyDBd5I/Er0mUkKsQoxvmpBzCFmONYhACkSrc1rkYV+yfzh3FjXVYRsIJ3jGM4GBQWzdCP1WbzHQWlSdUBJbGHJkI9hro3dn7MoTWRb9IImIUN0oNh+YPI64aqkk8Fscgi4Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789272332; c=relaxed/simple;
	bh=VjHE1JdFdVf9CJbf3YH4SKT7hC4rAP1wz6y0IHKu+vU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XZk3wUe+G+mO5pAfgOPFBS9i3BxvHKPiptv563pNJA99UiHvbTfnQMRWyXwi5BYNQFXqdErZzZhSOvAXIQr2NfWCdBlD3Vf6+2yXCxGYICSjaVXYDIKCmBPGguASsrlB5S20QjsmRr2bNVUigwFmO3hqrA3mKrtXlAvTXWPAV9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZGapm6Xw; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZGapm6Xw"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466ccdd77e2so360309fac.3
        for <linux-sunxi@lists.linux.dev>; Sat, 12 Sep 2026 21:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272329; x=1789877129; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KdSItwmPertDTRkK8vqVEqMt7TRjoawR0JDQnwMenpk=;
        b=ZGapm6XwjheXn8MgHWseBhg57FwI7hkgWb94j8ieJgSj2lQ6ab4tp2X4BQs1ezMc56
         sdPDSYYGWVldm+Io7DnXs8Rc4tWSS8d5UuK+l5ah+P/BYT1XdaVRrU2UOLuzZZbshO52
         bYoSL2as14A5Et6BIG3pPnsMRTRNeMXwrhPsuiY7muGzBlBBOOrnNfqLXHFEHnj2+Rt9
         D4MmswefZBi56Gxp8nzX+y++p5BwLSk27rJHl+Q1KjBXYrZYMzqtGoTPSW6SLzH5sal/
         a5TD8JDVijOK/c86/30OBYkzn/IyeZ8DYfDpTp0+1whhQKbSdKEFpxgMLGbArWEgfknP
         Iipg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272329; x=1789877129;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KdSItwmPertDTRkK8vqVEqMt7TRjoawR0JDQnwMenpk=;
        b=fR8uG4W7HcY6PlttsyBzs6zgILZ0NG4q6wpyk7HAufYkaoR0o6S6iKCxF5+nzFcsCz
         ypbxlP56KbqWvwzz4q2lCaNGzNohJ6ke9rNGSWNePd7phPXDWNOL2ojbJQLOPNAFwcMJ
         OQ7wSJ62xRzB0Le+4OAD8eEBFJ01SxXOqKof2AAdjGn3pM8H2cpErx3SiCGkB+tS9awB
         KW+LsJ3ZZpcmdAmD10LH6bdVfXaAI9hP6oE2j2OkMREI2e2J3hSjqwAOaP0MRXCzvrvt
         NGgMwfRHYHLzvTSXctam5mPlcOxB1scPp7XGT5/0Cq0za/eZ8ahz6Orar6X7gNBDbQ1e
         tYAw==
X-Forwarded-Encrypted: i=1; AKwUvBzvOD50rbdTRGbaFE07Isn2w1BX58zcSyeWdreu5brsUGP8lTq8oWq5igj8rOtd7M59YlK3ZUt3T6yQEA==@lists.linux.dev
X-Gm-Message-State: AFuF++lOPj4CalfIgeB/XC+EvG9IDEdU6vxhtzykGYBQ71va8z0OdUHA
	RwZjV+YGWkPpzGFryOXVgrLYd+2Wlbx/GMXfbzgl57TF0YrZ32ku38ky
X-Gm-Gg: AYBFou32DC2R8HVooqR6TFlt07YWHUCYvcZ4u5mJY1odH++N7gAHxhWSmaY7AIiDt6O
	45dvUeA2TztCJY2KSc69ERdmOrAurlPpDApz7bWQi5nuz6mSMeC4qHZDXM6nJ7c5J9mGCP8MAgv
	4vbWiU6CsAT/1lW5SNEs8zEVldXv+7ej4X1Ota8VL1+2vDdYvORIHQmiLwYWiY/UUsWMxaFbKiJ
	B+3v1mDT3+rZVdavizOZlWap+FUekEkXTw7/oEXYMrOl+VgRjVCYLu7wbRoK73KVQ8hUDbG6b4E
	e8zkQEckbFx4MuVP6pkbSLK6wGDmXvFR6TQ0F5udtFZ+TCy5mh70czK9a2puulkvGat71H+m2uc
	OPVdHPCGtrQnNuPKiWkFptv/9s+sPrQWRRjsgadwxZi0z92n90pIXTwhfCCZxM5646pK6H5Aoah
	gF9qO4bxUPxK8ywNHMIFrXz08iVG1oa1ROFJHiDQsT6RPxNlH+IKNe3Wh8BayBWOgF3HFT5FXqk
	RFQCVJnjmqHbAiuFxTh0lbruSk6dy8n4gk5KzZqpwnZvqiqgQAYTDL04fLI4u1Oi9wlkRGRyNNj
	7Yp8/4zffvvvDmd9BflUuwvSZH/O0h8gGSwlR5wduKR5GGhKvvgMgt1lNrLlaORk/N0sMqP1VZt
	0C1sB/ZJmDZGR7O5QtVV2ytgD8+ozXg==
X-Received: by 2002:a05:6820:61e:b0:6b7:46e9:96f5 with SMTP id 006d021491bc7-6c24e672089mr2838753eaf.37.1789272329061;
        Sat, 12 Sep 2026 21:05:29 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699647sm6011535fac.5.2026.09.12.21.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 21:05:28 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 12 Sep 2026 22:05:06 -0600
Subject: [PATCH v4 15/17] mtd: rawnand: sunxi: reduce user-data length
 register accesses
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-15-4a64bed94229@gmail.com>
References: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-0-4a64bed94229@gmail.com>
In-Reply-To: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-0-4a64bed94229@gmail.com>
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
 drivers/mtd/nand/raw/sunxi_nand.c | 73 +++++++++++++++++++++++++--------------
 1 file changed, 47 insertions(+), 26 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 84e1e04d0743..debef3f4f0dd 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1008,35 +1008,59 @@ static void sunxi_nfc_reset_user_data_len(struct sunxi_nfc *nfc)
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
+static void sunxi_nfc_set_user_data_len_dma(struct nand_chip *nand, int nchunks)
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
+			len = sunxi_nfc_user_data_sz(sunxi_nand, step);
+			code = sunxi_nfc_user_data_len_code(nfc, len);
+			if (code >= 0)
+				val |= field_prep(NFC_USER_DATA_LEN_MSK(step), code);
+		}
+		writel(val, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, first));
+	}
 }
 
 static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
@@ -1225,7 +1249,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	if (ret)
 		return ret;
 
-	sunxi_nfc_set_user_data_len(nfc, user_data_sz, hw_step);
+	sunxi_nfc_set_user_data_len_pio(nfc, user_data_sz);
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD | NFC_ECC_OP,
@@ -1536,9 +1560,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
-	sunxi_nfc_reset_user_data_len(nfc);
-	for (i = 0; i < nchunks; i++)
-		sunxi_nfc_set_user_data_len(nfc, sunxi_nfc_user_data_sz(sunxi_nand, i), i);
+	sunxi_nfc_set_user_data_len_dma(nand, nchunks);
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 
@@ -1694,7 +1716,7 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
-	sunxi_nfc_set_user_data_len(nfc, user_data_sz, hw_step);
+	sunxi_nfc_set_user_data_len_pio(nfc, user_data_sz);
 	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, hw_step, bbm, page,
 					    user_data_sz);
 
@@ -1989,7 +2011,7 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 	if (ret)
 		goto pio_fallback;
 
-	sunxi_nfc_reset_user_data_len(nfc);
+	sunxi_nfc_set_user_data_len_dma(nand, ecc->steps);
 	for (i = 0; i < ecc->steps; i++) {
 		unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, i);
 		int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
@@ -1997,7 +2019,6 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 
 		sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, i, !i, page,
 						    user_data_sz);
-		sunxi_nfc_set_user_data_len(nfc, user_data_sz, i);
 	}
 
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);

-- 
2.53.0

