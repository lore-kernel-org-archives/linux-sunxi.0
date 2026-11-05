Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904968;
	b=5h2zuPXVRcRWJUVCtNLs6JqxDmtjnGtD4Sp3jLSENMQuB3YAfbCRtYMUTY2ySQwvnvnf
	 TRgMbGprOkn4HhTtn0Pzw5h0olZOBqfBNLGI5qQpMlRxiB6jqdsD3Lxw1nayMLEvlausw
	 bfkmcaedIHJCxUjdbVKJ2qtyYlILAFXJ2B8dZyOPtcilla2KUdAYrqfC+9gPEWTzxhQCo
	 Vjimd6SCs25pkSNgt8skhpjmSf4jzBm0hGeHvZie2BLqkIps4HPwSBDcDTCipWgGtI0mx
	 iop67xr6HqvcJjnd3QYuv6ismV+BVVkX34iXUzqo3GcEEe0/DCmegCYgpLU8V497nOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904968;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Kyb9Vh//GYgUYYgsTf0Rac6RrMspxNg0WSg6hXKbfA4=;
	b=R3W/BrKRIZH593WLVL05Hr097xtyjIbhd1VDUCmEvjfNF75t9yRCa2M/E+WoTcVNIceM
	 eB3IKBGj0WnWMB9yWgwTXb9K3/TRoADuTptxi3MTLGa5WgovTX4RKyXwagwMB+2xHasJE
	 9tn+wAdEo1PpknS+n6kbV9Yn1HhRFP1SQ70fseWBBHpkUwmobdxNk/yLPlItE/QPwfj9N
	 hvVBJQDMVZeFtpB5qyuaVaUQu1uyjzHmaTA7MASxFy9g5vOeOumtrEgtp5kUaNKUnp+YY
	 F1t1n3ljPVP4whJZp2T3TkiUtpU5eq/rtRu7UQD6Fdcv8+68a1AlyePm4CP8FsGvZpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AJ+qVKXA;
	arc=none smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638CE60A260F
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Nov 2026 18:56:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 638CE60A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AJ+qVKXA
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6e560e00a86so1474724eaf.1
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Nov 2026 10:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904967; x=1794509767; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kyb9Vh//GYgUYYgsTf0Rac6RrMspxNg0WSg6hXKbfA4=;
        b=AJ+qVKXAUrj+khNAk5Bz/7tp5erSiWVPU4PafTfe6CnulI520rC8keZjqYe4LGqIJU
         6aSfMHB7JxAXFD1cYI9qbk4UqIXCqzfthJoHjCkxpz9cz4pKJ3UzpQ9sBltQWgbY3j1y
         RztHpHDtl6F1MURINYn/AMzF5FOVSzf8WXKoUJEI7M4u+V4XKS/9tI4QXJgMvbUgirww
         xWmZ7wD0KNB5eDFgQY6hcwk/kUlM/9YUfdQIL0X5g8BapywaaegilqtqQy1FOolDg18R
         87zLF5Da92pDl+n6PjgMs7UhVRP1BfTJeTIn2+wPWIq0PEDI/5e54jQPaKwSokRrI1ZZ
         7oCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904967; x=1794509767;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kyb9Vh//GYgUYYgsTf0Rac6RrMspxNg0WSg6hXKbfA4=;
        b=tMuQR5fwveVKL+AyjtzK5zXuXfH4jcQekAydqiVPxld4wXN9LE+tZiZeJxHQ6skoAz
         7LafHGkkoFzFkdQpoHQkU1A0AQJ4WYtpvPOEHvavyBcVzOGv33e/qFVYVmjIF+guNbok
         hthzsGukrQdBklibirQs5uo1TZOFC2fYI1uCvybynlUuXkNi7h0AhfZD3MTasZp0EFed
         eX3uFumM9QwI73/Aua6S+pqbTrgRso+LTRdYApPdH6ldRiEEaUSSZ9CBmj8hVMDCM/bA
         FttaIjDVp4NAmleymkp09XBBFJgucTTCngWhkopf1MDI1U5u1BkAcHdpVVc6hieS/3y4
         NHtw==
X-Forwarded-Encrypted: i=1; AKwUvBxVd72lEOqoiaL6szR8ubEz44wxsGG87HjgUpZsGxiZalsD7e7BtY/r2IeDGFjB8zM+NDOOd9qVpUU5BQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/R/fvEXspkzMU0IWqyxoKSG0lA+gf912ykTBGJDiC5TQbcHUIH
	moddDi2/tcFJhwpka5ETuj4EzvCgI8Tn24BPtFDMloeGpmSEC3dXGtIs
X-Gm-Gg: AYBFou0o1q5hfKiIlo3vES5Gr/3Df75p4qZxbs5UHbsHQCElyWkoNdSCJd/WIaBz7W2
	7nPUDmi1DjIv099K+cECZT1IVfqjzeBla5kTd/o8DIfFaM/f7zeVR1DaA8NKJ+YNozfaS2L19Gs
	vRvIToFVcu4azCO2uxeznTAGlbocZvIH6haGhN97Guyjup+DDANeyDcdPwRssBLcHlvhMOS/Mqa
	b/zG7dRf+M9CYrPKdO15qLDDspPtk/mRTlT7rj+zw4f6oKOGpNsLwfLcKfAvFnfcCIwKqZPZtCd
	mrApqxo+U0rtrI4Fn2E1mh8X6I8PReUYCgZxvTtoddl64P7YFx2wy+jF1/+E0CQfd3k4xdDWii1
	SM128RiGrt0n94owItL8B/QrdYct87qEGPMGao+ex2+sewF2urV0E45NuaN0XpyEsvCiWKaL3bA
	+K71gCMSO2xQEbhMEjLfoW9oBlfSNd3HEe7dhU2uO9fVsJUFwSKG7lvTiTQfHvDQGSFQ+UFcDwo
	gKSAqZTRr54MfGLdnYG/hZdfGWK7mlttrZDM/B4vl4SvEpwYdwmMUxcecDar3/R+KYh96gGZPpR
	89CGY5GvAJQ1NIh6LL52PLFJJu1z0NbWKz1v4vXwA3Syg+366A5g5Z9n63C4sF1HUqUEZkHEEc8
	dJ1cEAL6FiFMWTXGFWNmqYTDH0lnrEkoDbW9TO/bEq5auO+mxEZSaVra+xk4UZuxsbaAJvIRpe9
	jcdj3YXokfpLhd2AStx05OTQaO5+hA1bBlnL0h2E3I2UHVZbO2cQtPIxySiWTf6WrQ1CJhy0bL+
	A==
X-Received: by 2002:a05:6820:7408:b0:6dd:4f30:258f with SMTP id 006d021491bc7-716e79ad995mr250479eaf.56.1793904967200;
        Thu, 05 Nov 2026 10:56:07 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:56:06 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:40 -0700
Subject: [PATCH v10 24/26] mtd: rawnand: sunxi: reduce user-data length
 register accesses
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
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-24-dca1f6ed29a8@gmail.com>
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

H6/H616 pack eight ECC steps' user-data length codes into each 32-bit
register. DMA currently clears all these registers, then
read-modify-writes one field per step, repeatedly accessing the same
words. Code zero means no user data; the other codes select lengths from
the controller's table.

Build each packed value in memory and write it once per DMA batch,
including zeros for unused slots. Take each length from the batch's
logical step but encode it in the corresponding batch-local hardware
slot. Rewrite every register on each batch rather than caching values
across resets or changes of chip.

Share the encoding with a PIO setter. PIO always uses hardware slot
zero, and its page callbacks clear all length registers before the chunk
loop. It can therefore write the slot-zero code directly, without a
read-modify-write. Keep the page-level clearing so unused slots are also
cleared after a DMA-to-PIO fallback. Older controllers without length
registers remain unaffected, and the chosen lengths and on-flash layout
do not change.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 79 +++++++++++++++++++++++++--------------
 1 file changed, 50 insertions(+), 29 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index c9135c8abf54..814331e16bce 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -57,7 +57,7 @@
 #define NFC_H6_USER_DATA_REGS	32
 #define NFC_REG_USER_DATA(nfc, x)	(nfc->caps->reg_user_data + ((x) * 4))
 #define NFC_REG_H6_USER_DATA_LEN 0x0070
-/* A USER_DATA_LEN register can hold the length of 8 USER_DATA registers */
+/* Each USER_DATA_LEN register holds eight 4-bit ECC-step user-data length codes. */
 #define NFC_REG_USER_DATA_LEN_CAPACITY 8
 #define NFC_REG_USER_DATA_LEN(nfc, step) \
 	 (nfc->caps->reg_user_data_len + \
@@ -1093,35 +1093,60 @@ static void sunxi_nfc_reset_user_data_len(struct sunxi_nfc *nfc)
 		writel(0, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, i));
 }
 
-static void sunxi_nfc_set_user_data_len(struct sunxi_nfc *nfc,
-					int len, int step)
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
 
-	val = readl(nfc->regs + NFC_REG_USER_DATA_LEN(nfc, step));
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
 
-	val &= ~NFC_USER_DATA_LEN_MSK(step);
-	val |= field_prep(NFC_USER_DATA_LEN_MSK(step), i);
-	writel(val, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, step));
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
@@ -1517,7 +1542,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	if (ret)
 		return ret;
 
-	sunxi_nfc_set_user_data_len(nfc, user_data_sz, 0);
+	sunxi_nfc_set_user_data_len_pio(nfc, user_data_sz);
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD | NFC_ECC_OP,
@@ -1546,7 +1571,7 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand,
 	struct sunxi_nfc_ecc_snapshot snapshot;
 	struct scatterlist sg;
 	int page = read->page;
-	int ret, i;
+	int ret;
 	u32 wait;
 
 	if (first_step) {
@@ -1567,10 +1592,7 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand,
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
@@ -1686,7 +1708,7 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
-	sunxi_nfc_set_user_data_len(nfc, user_data_sz, nfc_step);
+	sunxi_nfc_set_user_data_len_pio(nfc, user_data_sz);
 	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, nfc_step, bbm, page,
 					    user_data_sz);
 
@@ -1955,7 +1977,7 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 			goto pio_fallback;
 		}
 
-		sunxi_nfc_reset_user_data_len(nfc);
+		sunxi_nfc_set_user_data_len_dma(nand, first_step, batch_steps);
 		for (i = first_step; i < first_step + batch_steps; i++) {
 			unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, i);
 			int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
@@ -1963,7 +1985,6 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 
 			sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, reg_index, !i,
 							    page, user_data_sz);
-			sunxi_nfc_set_user_data_len(nfc, user_data_sz, i - first_step);
 			reg_index += user_data_sz / 4;
 		}
 

-- 
2.53.0

