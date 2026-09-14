Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DE7365A1A
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Sep 2026 03:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789354926; cv=none; b=JW6Xk8hmTnoqFrOr7PuTLfgM06j62iJrk/Bg501Bq5Xh/CqTFHfUMqtkB1iK05Kv3Oeq6cpuv9p5uZrn/4ZJYMEPB/EzS9K5HRaXbradcJTHVQAYnuU9B6TRwumsXmOy/C90npoUEehKkreo0iSJmbF8HNquUryPzWHqMDFgDss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789354926; c=relaxed/simple;
	bh=ySqoYQ1XnzlLitXctoBmkfL5K98OvUxXEwUoBjaPCPg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Haqd0DRN5Yb3A4OyeD09+Ger9yF7p3sGz8O4Mm1xbor++B2SQywi9xc8QYBsEm/WLjyHy8kNpMrzjoJIsuA5b7X8/B8KqfsM1kNMIEv8hCdINGN2/Gn02BwA5jzt1kz89wtxJwKA9phWXuyKBQANoRR7KOYMEK+330nakluRl8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S5jnI4hN; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S5jnI4hN"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-805453b1c0cso1846804a34.1
        for <linux-sunxi@lists.linux.dev>; Sun, 13 Sep 2026 20:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789354923; x=1789959723; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IWbz9jOOwHMkOzJhcyeNlTXZtZx9bja+bTwtbiwOKWk=;
        b=S5jnI4hNlD/85Pw6EBGylQfP7lOjAUtEReYlFpZkGstqXI4Fs9tGmj++Epx/x+LmGq
         PXD2Jox6tHkWrh45fas/SLHaFMLpHIsbt0lEAF8IJkGSm0Mfn95KYPPt6bgq6nqxzNOe
         R16CLXIGeu8Mlv969p+87B0rnfH6Iad6a9jBD/8Bf6bkYeFKQ8W+4VUUVI061Pb398a1
         PT8vyU3RghInR34QttUebs6KSHInwTJYaouVajgTwF4CaGjif5n5CoQQZqdeZw1OgMOL
         NTdlfcfWtiieQ88X9JkNUorSCBcCQUIL8nULtP9Lr6AlqEy/cU8Y7wXffbE3rLX4ndmr
         h9HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354923; x=1789959723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IWbz9jOOwHMkOzJhcyeNlTXZtZx9bja+bTwtbiwOKWk=;
        b=OvNeSSx3qVXRfLo0o+hGtxpj61Ok094miBpU6NyIRhxsGQiDAwoXAmVryXfAvZWjYJ
         aQdxR9Gcj7VUpbNGUEtC3wJK6YAyQPS5DzYzCHjvX2g9qL/2MdO2b/uz6iQbdR8HQAjA
         ZHdWpCkswOv387uUU3iTBL6PsrR1CPNcTz1BpZKyGO4pOiLsb2Lis0CilGo9BtgZYO5V
         Tp+8omocMTakkZDj5ndCDC2z3rPgidr4YaKoaagaZIZEnZOFQ+Ch5srFA1xrB7Oej1gl
         NvqU3FYYR+PNTrAO6b5kTQ148j9iL9Zl5xcIf4584gUrA964EX7oLcc/id8HTr/RzRje
         Uz9w==
X-Forwarded-Encrypted: i=1; AKwUvBwRMz4gq4hjU63TYI++s2uoGjWSVxujigNQImQIL1jI28buCcmuNe0Rv+Ms0JT4bnMJmsTEOTe/ObFFAg==@lists.linux.dev
X-Gm-Message-State: AFuF++lFzJKr5hlHsPFxG4inK9/0odz1ILgn5F089Y8Sy+BAos1J4Oym
	Mch0aJZcjsQUSTDSXY4WY8sUOwX7+hKElrBYfOtefWaKPkz1KZyUdMQd
X-Gm-Gg: AYBFou19Wq6NsyEYEBgPzyHI/ncg6uQAKCvyuS/HUdbMnycm5AAlSLEfuA8Y/SLzReR
	E+v2zJd0nQNFbpydffe5dBL8BreKyfPRcICr2oFpqzlHFuNO4r8FhK/TQaqByAMkZ4wY2ENRPSz
	WMuOUJYD/vPtFVBtyJVckC7ymKfXr09Y8RAuaN/XUflgomrHQiLSMjHfv1vMJZxQr4UWR69Vy7p
	af4OpI4+6Byp7blymIk6GDIJBo6osq0KUTGVLaXmsZmvW7IhF8fSQfU9QwYJsPOIB+H+c/uhWa2
	HXFig/1QlZtCDGPq4d1IbxJ2FU8Ny2q49RG7rnimL7U9h9S4U/h29vxRLvK/r5EuM/KPUW09dqQ
	OnJ0kmtqZ6Rk8OvLaZXwqsoDQPgaJA3pcStomWoZv18rYPpomK0Y+34ghtioxZ4+EuJeiElyOyu
	7vlZluGmB5I1WmOPAJ0IGV62ED3AX2Pb2lITi2XjnIWUTgud3ILiGU2qSc/PTi6MzMTdbYNY1+H
	JlVj8Q6SrJPjSlXx/A+B5v3vA1eLdmIfZiTtqzm/dPaig4GybiU5Dc6UHXQs/R1OND24XtkmqxY
	aP815e2K8UBQ0u+UtS+Rv/U8Vhf0kujoLtjlm0wTlNkEYjJicrBykGRA4DOM+E7M8ki/FUeDc2v
	7aQX4qnQeV1ckb5iGnGgtnewBkK2oI1EnoLkjP9Ji
X-Received: by 2002:a05:6830:3888:b0:7e9:ead3:4449 with SMTP id 46e09a7af769-80897489f75mr263437a34.6.1789354923503;
        Sun, 13 Sep 2026 20:02:03 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60feba1sm10619014a34.13.2026.09.13.20.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:02:03 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Sep 2026 21:01:23 -0600
Subject: [PATCH v5 17/18] mtd: rawnand: sunxi: reduce user-data length
 register accesses
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-17-7d711076a6f7@gmail.com>
References: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
In-Reply-To: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
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
index 4103337f6a07..2b8ed142c9bf 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1005,35 +1005,60 @@ static void sunxi_nfc_reset_user_data_len(struct sunxi_nfc *nfc)
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
@@ -1223,7 +1248,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	if (ret)
 		return ret;
 
-	sunxi_nfc_set_user_data_len(nfc, user_data_sz, hw_step);
+	sunxi_nfc_set_user_data_len_pio(nfc, user_data_sz);
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD | NFC_ECC_OP,
@@ -1540,10 +1565,7 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand, u8 *buf,
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
@@ -1733,7 +1755,7 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
-	sunxi_nfc_set_user_data_len(nfc, user_data_sz, hw_step);
+	sunxi_nfc_set_user_data_len_pio(nfc, user_data_sz);
 	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, hw_step, bbm, page,
 					    user_data_sz);
 
@@ -2037,7 +2059,7 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 			goto pio_fallback;
 		}
 
-		sunxi_nfc_reset_user_data_len(nfc);
+		sunxi_nfc_set_user_data_len_dma(nand, first_step, batch_steps);
 		for (i = first_step; i < first_step + batch_steps; i++) {
 			unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, i);
 			int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
@@ -2045,7 +2067,6 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 
 			sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, reg_index, !i,
 							    page, user_data_sz);
-			sunxi_nfc_set_user_data_len(nfc, user_data_sz, i - first_step);
 			reg_index += user_data_sz / 4;
 		}
 

-- 
2.53.0

