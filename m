Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795223480;
	b=KadX0x1KuTaFzUhaRIE6xFt5xqcRVWCszPOi4S032G1BJmH+JrVvv1stj9LRj+0oJ64s
	 mr/feUovg1oOl2t0LRQbBw82E5Ajr4uBdvfrCThB0k4hyC2u+ba8OzMdRI8SMJpiTqmI3
	 SmYEmemcfnxgelM/T6y6L6oX6pvKc8l+F3YC9vdGTNhttysJxuCiDDWtXt0/XwByQBU8K
	 Mp+tqpguFcQ3qr/z2fp7bkAM3qkGbUfT8yqV7qH2kQR4f54vww2phclgd+l6VeqB63GXq
	 CDIxdzlvgMMxRNJb/fBxte/nBhAOcSqTB339bo4ft10IJbC1M19a6Ic/Py0WDuAG2tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=25Y0T/EWWqPPUndC1dVyA3/WPrprnkSUm6qbYkkV3TY=;
	b=eHd4xKrScTNVqAIo2ORcoIUMNI1kSJcob8Z9CpWixE0Qcna5t0eRSve66O9BQULEM6p+
	 nky2RTo4CBAuwK9iqpEK440pu2iQStMvOLDuH5UQo1xhzNy4tV1qVIo6tmtilVgdKETXT
	 PDSiNpMqi8PiundOPg+VmRlFldM9kd+XZtHxj9fckoI6eT3C79rUygmGURGEyusbKbYzQ
	 gGD8dXml6OGnbjYFClUz/Q6gFNyD5BymomUD2TIwX7EKH8QsXahYuCCjCiQylu+qQlwsj
	 L6momoHxLgFVMViKArWglYfIYa3cX2jv9gcjl3ER94I76xBUXlEMN14n43KteybO6QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=izAJxhhg;
	arc=none smtp.remote-ip=209.85.160.48
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1681606A69F
	for <linux-sunxi@lists.linux.dev>; Sat, 21 Nov 2026 01:11:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1681606A69F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=izAJxhhg
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-4a85c656c58so1032393fac.3
        for <linux-sunxi@lists.linux.dev>; Fri, 20 Nov 2026 17:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223473; x=1795828273; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=25Y0T/EWWqPPUndC1dVyA3/WPrprnkSUm6qbYkkV3TY=;
        b=izAJxhhg/HCeHqTeGMwPXz+N63Rg/0mQUeBVuAZ/AqkGv5Jyg8zgiGaGPUJyjcSBsq
         XYVOM2NnWtOTk1uY57M0MAguKaL/yOFd7ZcPboy5gLXtB9/0mD5Z9feu14IxE5C8P3w9
         LGWeUzJBKME6/APlDb00wN+UBDXXJLljKlrs2sUOp0kKz/0RWnOr2IFZfQ+uvPV3dO21
         dHT3I0PhoSyYx4aygHQBLGPUfN6A7iUvM9j1RilLCdEE4Vd7fC42IMVyH16sfxbIL3Zo
         uVkLqMMjvdsPSTVB+2e900HBH6JtauA6KBp6/g8+44UTNXcVgSn1yPkygoM/K7w7Jzlm
         9wOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223473; x=1795828273;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=25Y0T/EWWqPPUndC1dVyA3/WPrprnkSUm6qbYkkV3TY=;
        b=XA9y2ScmdGYllTSEUE3+ZLS4ns/lMjE+MWfYzeAaOzJhyWtzpcIs9O93Mj2GnVTBcm
         mKKBlMppPjbeWpnQgTPOwZVvUmlLT6EU6/4ALHtoSNxxaGCbijJp3VY470DBvlEMxM+K
         ChsTBDwnQDLClg2FMhS5YRjsdbBIt+GoyC16rumdyuwoQYStHyo0+3YeGh8H+LFOd5CZ
         FoxkaM8ET2hyhb43h3hJZJtgZhB0rTO0xmWrAZFuZTfroxmybd05doMZ+jT7Ggw+K9Kk
         0AdHq5eKHJbPgr6BMQBxRc48ad3kA/tVONgZMtATY6H2avAWs2e9SPQxB82B14SsXkVO
         juxA==
X-Forwarded-Encrypted: i=1; AL+hErGM1U+IbB5NHapFwONsGRiWajV8RXmsa0hzprGFBzHjAJgSeGiC38RfiCCaeYJMObshRlHQyDim5+ypvg==@lists.linux.dev
X-Gm-Message-State: APuU4Z9wcvFotfxsuxNhezugB8YT5jswx754OZvWwtlH9ebM/9v18BXb
	dxwkcucKr4kRUi6SqUseCtdGYX0J9K2cg2P2KCCdX3d+Q0RLOgARC4fc
X-Gm-Gg: AZFdTZfDEUnTW2nSO4BVfxBVxS/LYqd7Uka5qDJItdaIEu69TIC+UsWtSHnLgkCmKIh
	Om/p8xAlkc60d3gMImAWGsViKUL/Ri3fCRiUf7sI5xMoAJA0QgzbkZJF+AUBHo/TuwYP8Ih+ZYH
	F6m/22RmhufKKzB2A+7erTZ0lrmwY/IraDKHaiPGJHp9IQtokgvgLjvXXPnmEhdeHfT+q2MXdkb
	dtGY9WvWP7LmFqmnPB/mv3HxNqO0Bxw3iD2Y/+8bOYSvHAZ85rYirUAWM9Ief8GfONu/cCWagPC
	lnDzQGYB7BesFsAJwA28t9V69Drbg8tm6mALj+8SNd/rzSQPPjDp5YWLcotCSR7DVyi74L97ynV
	lkTOddGn3wBZaLrOdZg+my9svVyTADtVp9oytnGI79ZjNdxezy2UGwIBhPmxcXMEQMPeMTfjVLx
	TyXejZX4HjLsPqmVibcsSHndKjzsvRutWRSrrZVQamTiGN7oFL+hz2N0T71gduM2ctORK9jc3Nl
	qhcpMr2OpdoPGXzXU6ofSE9q+eoRlAAMaqdKTbE7ee9DYZ6qSzN8m/2sZO9FZOgCm30yXRZm5M8
	7X4j0EufjMwDCbzpSG/+kfOfvcrZVOCojOCPONJKBWtl5AWldYsHhBYjDbP5hY8A9Qll2nviYMC
	VRPPPByFJUbHlXN542PZAWfMjjLpLu/ZL1/VHAppSkqxu146P75pJtDmgwxWu8a+oGsekZGOGp3
	Bg72EmEfw6edrOMMiTAdvg4N5wEhGuYOwyc7oT9JBr/2IkMzAEuSgo
X-Received: by 2002:a05:6808:1986:b0:572:72d4:9ac9 with SMTP id 5614622812f47-57a09e0d7c4mr6351251b6e.27.1795223472625;
        Fri, 20 Nov 2026 17:11:12 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:12 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:35 -0700
Subject: [PATCH v11 12/26] mtd: rawnand: sunxi: handle ECC results in the
 batch reader
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
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-12-9721b1905ef4@gmail.com>
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

The batch reader must know whether the corrected bytes are ready to
use, need to be filled with a hardware-detected pattern, or need a raw
reread to distinguish an erased chunk from an uncorrectable one. The
correction helper returns zero both for a pattern and for data with no
bitflips, so its caller tests the pattern bit a second time to avoid
overwriting synthesized bytes.

Handle the three outcomes in the batch reader. When a slot reports both
an ECC error and a pattern, keep the existing error-first ordering.
Preserve the data for the raw erased-chunk check and run that check
after collecting corrected OOB for the batch. For a pattern without
an error, fill the applicable buffers once; only an all-ones pattern
marks the chunk erased. Read the correction count only for an ordinary
step.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 70 ++++++++++++---------------------------
 1 file changed, 22 insertions(+), 48 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 538ffcc79108..e76f7cc67081 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1070,41 +1070,12 @@ struct sunxi_nfc_ecc_read {
 	bool has_erased_chunk;
 };
 
-static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
-				    int step, u32 status, u32 pattern_found,
-				    unsigned int user_data_sz, bool *erased)
+static unsigned int sunxi_nfc_hw_ecc_read_count(struct nand_chip *nand, int slot)
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
-	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	u32 tmp;
-
-	*erased = false;
-
-	if (status & NFC_ECC_ERR(step))
-		return -EBADMSG;
-
-	if (pattern_found & BIT(step)) {
-		u8 pattern;
-
-		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & BIT(step)))) {
-			pattern = 0x0;
-		} else {
-			pattern = 0xff;
-			*erased = true;
-		}
+	u32 count = readl(nfc->regs + NFC_REG_ECC_ERR_CNT(nfc, slot));
 
-		if (data)
-			memset(data, pattern, ecc->size);
-
-		if (oob)
-			memset(oob, pattern, ecc->bytes + user_data_sz);
-
-		return 0;
-	}
-
-	tmp = readl(nfc->regs + NFC_REG_ECC_ERR_CNT(nfc, step));
-
-	return NFC_ECC_ERR_CNT(step, tmp);
+	return NFC_ECC_ERR_CNT(slot, count);
 }
 
 /*
@@ -1203,35 +1174,38 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	bool randomized = nand->options & NAND_NEED_SCRAMBLING;
 	unsigned int reg_index = 0, user_data_sz;
-	int i, ret;
+	int slot, ret;
 
-	for (i = 0; i < nsteps; i++, reg_index += user_data_sz / 4) {
-		int step = first_step + i;
+	for (slot = 0; slot < nsteps; slot++, reg_index += user_data_sz / 4) {
+		int step = first_step + slot;
 		int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, step);
 		u8 *data = read->buf + step * ecc->size;
 		u8 *oob = nand->oob_poi + oob_off;
-		bool erased;
 		int bitflips;
 
 		user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
-		bitflips = sunxi_nfc_hw_ecc_correct(nand,
-						    !read->dma || randomized ? data : NULL,
-						    read->oob_required ? oob : NULL,
-						    i, status, pattern_found,
-						    user_data_sz, &erased);
-		if (bitflips < 0) {
+		if (status & NFC_ECC_ERR(slot)) {
 			/* Preserve PIO data before the raw erased-page check. */
 			if (!read->dma && !randomized)
 				memcpy_fromio(data, nfc->regs + NFC_RAM0_BASE, ecc->size);
 			continue;
 		}
 
-		/* Both patterns are already filled; only all-ones is erased. */
-		if (pattern_found & BIT(i)) {
-			read->has_erased_chunk |= erased;
+		if (pattern_found & BIT(slot)) {
+			u32 pattern_id = readl(nfc->regs + NFC_REG_PAT_ID(nfc));
+			u8 pattern = pattern_id & BIT(slot) ? 0xff : 0;
+
+			if (!read->dma || randomized)
+				memset(data, pattern, ecc->size);
+			if (read->oob_required)
+				memset(oob, pattern, ecc->bytes + user_data_sz);
+			if (pattern == 0xff)
+				read->has_erased_chunk = true;
 			continue;
 		}
 
+		bitflips = sunxi_nfc_hw_ecc_read_count(nand, slot);
+
 		if (!read->dma)
 			memcpy_fromio(data, nfc->regs + NFC_RAM0_BASE, ecc->size);
 
@@ -1260,10 +1234,10 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 		return 0;
 
 	/* Finish consuming the batch's corrected OOB before raw error rereads. */
-	for (i = 0; i < nsteps; i++) {
-		int step = first_step + i;
+	for (slot = 0; slot < nsteps; slot++) {
+		int step = first_step + slot;
 
-		if (!(status & NFC_ECC_ERR(i)))
+		if (!(status & NFC_ECC_ERR(slot)))
 			continue;
 
 		ret = sunxi_nfc_hw_ecc_read_error(nand, read, step);

-- 
2.53.0

