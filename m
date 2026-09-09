Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2CF485502
	for <linux-sunxi@lists.linux.dev>; Wed,  9 Sep 2026 08:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942678; cv=none; b=sjhXq5xoWi2044YAX5VmXKxDPR9NmiyFcobn/+gR6ju+dfk5Mz3EX99fsysI1xv36hD/VocKl+0AvdyQxMoqushS4tJfngbMsV6WF0MwXLU6pVzd2sYKXRSSZC2jh7d07+NpI8o/6TpL3GAFeyP3XPRrAhjwoSxRZGAWGKLa/cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942678; c=relaxed/simple;
	bh=4II9N3xTKSJHWx8rbwx7Teb5b9LWc1U4UIiXg8Tsx4o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EKeeHngqkof6pc/14V4HeIK4RwNIv7SI1paMQH/YzBr986spufNH4DEdx8LgZos8diDoRMIgztD8Oy4X8qK6nonEaqYens/gFKnoEM+osm8t+Ga+OYQ56Ub8mzNPU6EeRYq5uI5VWlY4xVZ7RsSxl8/r+ja4dg0nzHG7vbtP5WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s5hdf/HT; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s5hdf/HT"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7f4ea388ba6so5287886a34.0
        for <linux-sunxi@lists.linux.dev>; Wed, 09 Sep 2026 01:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942673; x=1789547473; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TWYxqME/J0ZGh+4rhdO4kodCM+OpkopMyyvvaFCYW7w=;
        b=s5hdf/HTpRh9HtIM8KJKroUI3vKQo+fWyIvnaLPcG5mhYoRjVt+KV2fuf3wrodHWuU
         B8frFG6CQu7E+uE4e3BrfaGTcTnxNNbK+U8Ur5Sn0FZ2Fr1bWZIommFEALXU9yCqirRK
         VN5qrJ2zaTbgpm7aoL9H7vvaVb9dlZzvPOk7JziCpONDTFgPegffznOENWOeSXLbVtgi
         /hxgZIHA7qcPjpfc19eMYpBLWbaFnwGWDanIvqeJqefNhoWfEuQVqi855cKfxDtqgytl
         8qptPYOMg4ZyVIQrjc+uM7tQzQkdaM7oEbR6D5W5HQgp7kEaHMO5aTXy0Ki4CotzsuTO
         b+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942673; x=1789547473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TWYxqME/J0ZGh+4rhdO4kodCM+OpkopMyyvvaFCYW7w=;
        b=O4UwxgpNz4SCT1Lqlf12FJYvvf/jPpeGJCbasw6WuIL0XhHki6MZd5/BU/tbCkailb
         5c0p2drI4vuLTVpUk4qZ3RSvTo4t1SJd95YmGPhNr3OOOIHRIww9xZlPP+QOy33U60oH
         8/WzgNAIQ7KouC2Z4xO44ih7VCnKvgBdnLxwDxZmV3k0A8TMQnNqo4gtSJ4vpuGUgBXy
         b+MdYKWaxQ4gob6H6e3x6VbzNrgbGb3ltw7RAwbhzaCFfCbRwSL3l2pF9m0Hv+U1BK4q
         adj8bl1o1lP27ABbg0fPUnXdwZ4bXkuZZTIaFRlC6Pnt2tgBonifDSavmD2+PtCt+gVG
         0Wag==
X-Forwarded-Encrypted: i=1; AKwUvBzDs3NHNCI5eha1gillTChFuR4ZOVh06xeQ7T3G1pPXa2fLgzj9BMGW3ZpzaVECsNs+fjXHtg5W0HPA9w==@lists.linux.dev
X-Gm-Message-State: AFuF++mBUpMgejLhPqzVHBiTPYIa0vUZWrPJqH3AntuhfJSZ66ehuhfj
	7cs0wt3jU8mHQrzubcwonlttaUzB1KX0zp9wOMOnEsx6lE+OQVrEb7N6
X-Gm-Gg: AYBFou3jLJdAXriPXVf4w3/p7tF5XUWZXmhn5GyRhqpoecpGfP7VS6X5MuxW3a/rdiV
	MV4LTDEmD6YazGQ9WtP2IyXbUZKhBvUPLO12VD+0ok2F9z33NBeGwLkSwwPWgSyQ8BeG1WA+yrx
	oGmt8HTpc3FmEH75m0XlcsB9llrB5moKg9786eitDTcYSoEfDqLjR3+8UI60dcwmvGSODTVTaZ2
	GWlXlKjJLFnr2S7dAOlRU4cKsRRv6VuBrEnk265VHBZcaIaQXP8N4qs5UhjsTQxu7kJAzRJHgbY
	ACljbxQoAQuW0fLlBiIDK3UnPug6dAgTns8gq66crkyRqdxvXKHcICX/mFUWjQkSpRFeRo0Ycks
	rgISYZ0S9ksho5Bt3zfRWjSuLQtle1kVklX1LTjYIDwpmqdzHtM8pIbJSK4dF0XPcBS+pOCW8S+
	ZRVRABWP1gtmDE7D6k8U7ItQzGLIpsPXPW0/f4HPuD2AmheUPAI0xvbvd8WNsKOc72k/SFIdMgl
	p0+HJ5R0iOgSuQri/Kz6J4K7ORVbUypNXykQxdyviFmkvQgTK9ubHILAPT6HvGXmZlIdKOIa6CV
	TpNwb/zvxatOsZVas9GLl0HOoCsuHvkTbwZKSI6yiDfdGr68QzerVjIXMyUFN3edqE8ogQVhVF6
	OWEZmFQRIPNoiKzNVKEQRYploTlkuDj9uCQQBN6c=
X-Received: by 2002:a05:6820:1987:b0:6b7:46fa:16a2 with SMTP id 006d021491bc7-6b746fa1a6bmr17306489eaf.55.1788942673434;
        Wed, 09 Sep 2026 01:31:13 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6a0sm19031004eaf.5.2026.09.09.01.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:31:12 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 09 Sep 2026 02:30:47 -0600
Subject: [PATCH v3 14/15] mtd: rawnand: sunxi: reduce user-data length
 register accesses
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-14-838cb0ba1547@gmail.com>
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
index 9dc742ee4344..1c1fcea69108 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -996,35 +996,59 @@ static void sunxi_nfc_reset_user_data_len(struct sunxi_nfc *nfc)
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
@@ -1213,7 +1237,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	if (ret)
 		return ret;
 
-	sunxi_nfc_set_user_data_len(nfc, user_data_sz, hw_step);
+	sunxi_nfc_set_user_data_len_pio(nfc, user_data_sz);
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD | NFC_ECC_OP,
@@ -1524,9 +1548,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
-	sunxi_nfc_reset_user_data_len(nfc);
-	for (i = 0; i < nchunks; i++)
-		sunxi_nfc_set_user_data_len(nfc, sunxi_nfc_user_data_sz(sunxi_nand, i), i);
+	sunxi_nfc_set_user_data_len_dma(nand, nchunks);
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 
@@ -1682,7 +1704,7 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
-	sunxi_nfc_set_user_data_len(nfc, user_data_sz, hw_step);
+	sunxi_nfc_set_user_data_len_pio(nfc, user_data_sz);
 	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, hw_step, bbm, page,
 					    user_data_sz);
 
@@ -1977,7 +1999,7 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 	if (ret)
 		goto pio_fallback;
 
-	sunxi_nfc_reset_user_data_len(nfc);
+	sunxi_nfc_set_user_data_len_dma(nand, ecc->steps);
 	for (i = 0; i < ecc->steps; i++) {
 		unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, i);
 		int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
@@ -1985,7 +2007,6 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 
 		sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, i, !i, page,
 						    user_data_sz);
-		sunxi_nfc_set_user_data_len(nfc, user_data_sz, i);
 	}
 
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);

-- 
2.53.0

