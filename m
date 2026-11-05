Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904939;
	b=rKR2N1k3RxfNpYcw2v2CXonhsED8xQO+7Uxbmk+5qKzQL2eWPh/TSNN60eYYmq045b6/
	 7vAW0r+2v0gOsPGAigey+qz8p5E5A0EQf7pOPCK9NdED2v0MPKgsIIYWlyGBz1j92qJRt
	 1LJqfiv8mwx40Y6EiX7BqCeAyyrBZg1OQoziwWWxhlDVUazhMTP3ySNJiv3jKvH3JFrwx
	 a9VJ4b/qYrF3o04DMMT2IBOouEWioefDiDMzCi5wdG/6ECBf5u5mfuLN6h+NWf3ugVikm
	 u2I1wHgFh3bs6ZETXGNYYTbfXRtmNcH9kneelQnHCaLVMxD0gf+4qTTYtPEAkCAu3sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904939;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=riAAQMfBLq8mpLK4f+nQf7CL76Wru2zCVjChEptNvYo=;
	b=4vPwfz1M7W8XbkC9cwOguTzneoHkS2SImikQKTI8whC6Au4ubYwLqYPaoJBmfvND4AMY
	 9L3KoQvKApv32iP03aKQD5GguNJUQ2raN+qfU7qmqHAN9L/v7Np/R3kgr60o++6I/I6ZW
	 KGB3VWuJ6A9a8At5kcjYnvePUrvcLKXyeqlKnbcYVEiQa8T+22enFbvwP6/sIDSn6OcPm
	 QdAEawMDw4N4+M6GcluPUHzRrj/UfYetaZWYpT0tTMI4QdeWgllpOFCn78+mYP2PSjVAU
	 J8bMceIWLbEgqyMStWEwbYmmIrtG1oT6TH0LDbM//XtOI9wqZKG6VIUEInwXG3ugSeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lO5UEGTr;
	arc=none smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AA7606D809
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Nov 2026 18:55:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59AA7606D809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lO5UEGTr
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6f5a0893610so1619021eaf.1
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Nov 2026 10:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904938; x=1794509738; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=riAAQMfBLq8mpLK4f+nQf7CL76Wru2zCVjChEptNvYo=;
        b=lO5UEGTr5D9GR0HmnKuAMcnBPJjISptM/b2BU7njfYMZyJyii/+HHiIwhPltBZUthk
         ghsOwUAVmKa1WdfhFkZY7we4/8QhsKZrLPPa0vayx32Gcyyt/+vvwSKQwCy2IOJ7Xzns
         kTAFzm7SkFqy4KgncZ1yipQjuNXu0z61ecRl5xwyrXHn8UkQvGOnWPIyEYcMpxY4m4Uq
         vek+OQsetNHmsND4nWsHgJzLoyfsv3O+OCOm3AumnRmrOGktV5Lhdp4gb0DyUb33ljrM
         YjqcGU3UabycdqyW44XeUrtE/mz8yGfLDauzd7FYpvtSnLEPx6ENv0vd7iE/oS6JY916
         a9gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904938; x=1794509738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=riAAQMfBLq8mpLK4f+nQf7CL76Wru2zCVjChEptNvYo=;
        b=b9t8LF+tvIXHVqrcgaR8YtpBanZU7/K5v+SOUWBiBDA5feft8XlN4Be6Z7lHRkK7Y7
         CYyycJJvSTp4hbmhBi5UagffBlq3fl7xvVRA/lMYlGNnXC+i1pjQ205kYRo/MLqZOp1D
         BYH66iBWrJAi+E5d7CSsVDz/aN5h3hmC4KTcKdZrjF5ugIpGeTjxqwmOdxEGZsJVlDB2
         wQfjwIu8uyb6zh3NmsuyzS/Xni3YnpAUCYzLY/oASYPMW2m+cynZilTXeohisUGrqvxQ
         3bJksw2Sj0H5O+dMVHKFBCQK0ywwvqCRrnBfbOxeWud+JEI8tNLgAJuG/GvfCrb9+mYD
         BOKA==
X-Forwarded-Encrypted: i=1; AKwUvBxDoBY6kBK/lO2pKun4qivIUD3D7mdcw0wkso+HXtcuYtu6+fQrywFxUJGamDfQpYYVQ4KK79EdMiN0JA==@lists.linux.dev
X-Gm-Message-State: APuU4Z8MuMjvQqfQ9X0Cs/Mdg6zAgKxAqo2abNDsmlAf1k2lvzs9YJ9j
	L7UoRdNAb6vfUcfO8UrrPUHaSAzk5AYCV4mxJkxWfGqtZOquY6oy5GJ/
X-Gm-Gg: AYBFou2VAj4fKNEYtpu3E8aXRpxtjZf1bkL3zVk0jnoEqZa2Bp3BSqhmnLUK4ZBbuUn
	a9Y0NbIJWL6R5LcWPu5w2XBrx+cVKPY/L7rx88ezFmJj8BpMw6XkT5hmRhti9uU+4yEfDB/sDpu
	dRqfgAiKXjDMfOBnUKQRLKlRhyc5IC8lmfP39Vm8F1tJBKK59ADqstPULvz8KNxXaIpeDefPXcL
	Au7JosQlMTp8ilXuNXIUA7rH8EKP0jUwzJQ2VPQ1s46owJIUKxH3zeccUTT2YRy2/+IliMyEtTg
	qQgAjfYwVNZggP+3HXOF0EJ8uslrjgmpQL/WLirgqc2+Py9YTopeFeAwERxcfryRlMWMvP17KOL
	Ww/S8ihECzhzE9OnBP1GHU/1Frlm8YTs18oChKEBL/SZve/+0EaKbyJtLGguyM+H/Z3S9IjAqmr
	UDxNI1Es+dtqAs41wLjEpKWqVYWlB1LwZcCbSnc1IChiW3oZkWAGazzksUzy+vN6ACIjq3zIlAa
	hwAZQWxaRWYip9KCAOwd4jEtYruCChVXAYQXsizPhIM4bKNIYU4tirI5kvHfDZwFE77vefwLSsM
	JilYeEaXGgIfYmliYwY0jS+9as0y/WRr4UAG0Yh8oA0D+Fm3/8K7yYgmHESzkJx1Id199aAWhhN
	Y1N3Op67/Cq7keJiXnea5phcIY5/8IJinIRA0AXtfH5R/kUcuYB7UMuRp6LMMz1jv5CAe+HSW8f
	sCggDTO8H++s9hhCy+2e5t5x8BZrD6Y4gmcTnJqjm1FyDiTOzng3Zu
X-Received: by 2002:a05:6820:2484:b0:716:bb14:b806 with SMTP id 006d021491bc7-716e7abb94fmr268521eaf.75.1793904938216;
        Thu, 05 Nov 2026 10:55:38 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:55:36 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:21 -0700
Subject: [PATCH v10 05/26] mtd: rawnand: sunxi: use the logical step's OOB
 length in PIO
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
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-5-dca1f6ed29a8@gmail.com>
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

PIO transfers each logical ECC step through hardware slot zero. On
H6/H616, user-data lengths can differ between logical steps: step zero
can have 32 bytes while a later step has only 16 or none.

sunxi_nfc_hw_ecc_correct() uses the hardware slot to select that length
when filling pattern data. A pattern detected in a later PIO step can
therefore overwrite the following OOB region with step zero's longer
length. The protected-OOB write helper makes the same mistake when
loading slot zero, reading bytes beyond the current step's user data.

Pass the logical step's user-data length explicitly to both helpers.
Separate that length from the user-data register offset: PIO always
starts at register zero, while DMA advances by each preceding step's
length in four-byte words. Update both DMA callers with the helper
contract so variable-length steps continue to use the same registers.
Fixed four-byte layouts and the on-flash geometry are unchanged.

The mismatched logical and hardware indices were found by code inspection
while consolidating the PIO and DMA OOB paths.

Fixes: 54dcd6aa69db ("mtd: rawnand: sunxi: introduce maximize variable user data length")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 106 ++++++++++++--------------------------
 1 file changed, 32 insertions(+), 74 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 1a61f608ad91..ae18a7fbca77 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -942,45 +942,22 @@ static u8 sunxi_nfc_user_data_sz(struct sunxi_nand_chip *sunxi_nand, int step)
 
 /* PIO uses register zero; DMA concatenates user data within each transfer. */
 static void sunxi_nfc_hw_ecc_get_prot_oob_bytes(struct nand_chip *nand, u8 *oob,
-						int step, bool bbm, int page,
+						unsigned int reg_index, bool bbm, int page,
 						unsigned int user_data_sz)
 {
-	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
+	const struct sunxi_nfc_oob_ops *ops = to_sunxi_nand(nand)->oob_ops;
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	u32 user_data;
+	unsigned int i;
 
-	if (!nfc->caps->reg_user_data_len) {
-		/*
-		 * For A10, the user data for step n is in the nth
-		 * REG_USER_DATA
-		 */
-		user_data = readl(nfc->regs + NFC_REG_USER_DATA(nfc, step));
-		sunxi_nfc_user_data_to_buf(user_data, oob);
-	} else {
-		/*
-		 * For H6 NAND controller, the user data for all steps is
-		 * contained in 32 user data registers, but not at a specific
-		 * offset for each step, they are just concatenated.
-		 */
-		unsigned int user_data_off = 0;
-		unsigned int reg_off;
-		u8 *ptr = oob;
-		unsigned int i;
-
-		for (i = 0; i < step; i++)
-			user_data_off += sunxi_nfc_user_data_sz(sunxi_nand, i);
-
-		user_data_off /= 4;
-		for (i = 0; i < user_data_sz / 4; i++, ptr += 4) {
-			reg_off = NFC_REG_USER_DATA(nfc, user_data_off + i);
-			user_data = readl(nfc->regs + reg_off);
-			sunxi_nfc_user_data_to_buf(user_data, ptr);
-		}
+	for (i = 0; i < user_data_sz / 4; i++) {
+		user_data = readl(nfc->regs + NFC_REG_USER_DATA(nfc, reg_index + i));
+		sunxi_nfc_user_data_to_buf(user_data, oob + i * 4);
 	}
 
-	/* De-randomize the Bad Block Marker. */
-	if (bbm && sunxi_nand->oob_ops->transform_bbm)
-		sunxi_nand->oob_ops->transform_bbm(nand, page, oob);
+	/* Undo hardware de-randomization of the plain on-flash BBM. */
+	if (bbm && ops->transform_bbm)
+		ops->transform_bbm(nand, page, oob);
 }
 
 /*
@@ -1031,48 +1008,26 @@ static void sunxi_nfc_set_user_data_len(struct sunxi_nfc *nfc,
 }
 
 static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
-						const u8 *oob, int step,
-						bool bbm, int page)
+						const u8 *oob, unsigned int reg_index,
+						bool bbm, int page,
+						unsigned int user_data_sz)
 {
+	const struct sunxi_nfc_oob_ops *ops = to_sunxi_nand(nand)->oob_ops;
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
-	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
-	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
 	u8 user_data[SUNXI_NFC_MAX_USER_DATA_SZ] = {};
+	unsigned int i;
 
-	/* Randomize the Bad Block Marker. */
-	if (bbm && sunxi_nand->oob_ops->transform_bbm) {
+	/* Compensate hardware randomization so the BBM stays plain on flash. */
+	if (bbm && ops->transform_bbm) {
 		memcpy(user_data, oob, user_data_sz);
-		sunxi_nand->oob_ops->transform_bbm(nand, page, user_data);
+		ops->transform_bbm(nand, page, user_data);
 		oob = user_data;
 	}
 
-	if (!nfc->caps->reg_user_data_len) {
-		/*
-		 * For A10, the user data for step n is in the nth
-		 * REG_USER_DATA
-		 */
-		writel(sunxi_nfc_buf_to_user_data(oob),
-		       nfc->regs + NFC_REG_USER_DATA(nfc, step));
-	} else {
-		/*
-		 * For H6 NAND controller, the user data for all steps is
-		 * contained in 32 user data registers, but not at a specific
-		 * offset for each step, they are just concatenated.
-		 */
-		unsigned int user_data_off = 0;
-		const u8 *ptr = oob;
-		unsigned int i;
-
-		for (i = 0; i < step; i++)
-			user_data_off += sunxi_nfc_user_data_sz(sunxi_nand, i);
-
-		user_data_off /= 4;
-		for (i = 0; i < user_data_sz / 4; i++, ptr += 4) {
-			writel(sunxi_nfc_buf_to_user_data(ptr),
-			       nfc->regs + NFC_REG_USER_DATA(nfc, user_data_off + i));
-		}
+	for (i = 0; i < user_data_sz / 4; i++) {
+		writel(sunxi_nfc_buf_to_user_data(oob + i * 4),
+		       nfc->regs + NFC_REG_USER_DATA(nfc, reg_index + i));
 	}
-
 }
 
 static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,
@@ -1125,11 +1080,9 @@ struct sunxi_nfc_ecc_read {
 
 static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 				    int step, u32 status, u32 pattern_found,
-				    bool *erased)
+				    unsigned int user_data_sz, bool *erased)
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
-	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
-	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	u32 tmp;
 
@@ -1228,10 +1181,10 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	bool randomized = nand->options & NAND_NEED_SCRAMBLING;
-	unsigned int user_data_sz;
+	unsigned int reg_index = 0, user_data_sz;
 	int i, ret;
 
-	for (i = 0; i < nsteps; i++) {
+	for (i = 0; i < nsteps; i++, reg_index += user_data_sz / 4) {
 		int step = first_step + i;
 		int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, step);
 		u8 *data = read->buf + step * ecc->size;
@@ -1243,7 +1196,8 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 		bitflips = sunxi_nfc_hw_ecc_correct(nand,
 						    !read->dma || randomized ? data : NULL,
 						    read->oob_required ? oob : NULL,
-						    i, status, pattern_found, &erased);
+						    i, status, pattern_found,
+						    user_data_sz, &erased);
 		if (bitflips < 0) {
 			/* Preserve PIO data before the raw erased-page check. */
 			if (!read->dma && !randomized)
@@ -1272,7 +1226,7 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 							      true, read->page);
 			}
 
-			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, i, !step,
+			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, reg_index, !step,
 							    read->page, user_data_sz);
 		}
 
@@ -1461,7 +1415,8 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 	sunxi_nfc_set_user_data_len(nfc, user_data_sz, nfc_step);
-	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, nfc_step, bbm, page);
+	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, nfc_step, bbm, page,
+					    user_data_sz);
 
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD |
 	       NFC_ACCESS_DIR | NFC_ECC_OP,
@@ -1675,6 +1630,7 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	struct scatterlist sg;
+	unsigned int reg_index = 0;
 	u32 wait;
 	int ret, i;
 
@@ -1695,8 +1651,10 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 		int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
 		const u8 *oob = nand->oob_poi + oob_off;
 
-		sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, i, !i, page);
+		sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, reg_index, !i, page,
+						    user_data_sz);
 		sunxi_nfc_set_user_data_len(nfc, user_data_sz, i);
+		reg_index += user_data_sz / 4;
 	}
 
 	nand_prog_page_begin_op(nand, page, 0, NULL, 0);

-- 
2.53.0

