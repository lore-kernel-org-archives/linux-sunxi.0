Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795223465;
	b=0BekNX8EWJY+mGRpD+5xh975TUUq6Zw+VEzR/ZIlOUEw9aWn87T3sWHelTc6935yC8B9
	 YC7/njV9JUQZOy2wjuL3uxFUrBVK9vz7jjH051WwEeCmjB8EZefp1uDLlqCKlIGYcgLQj
	 i9fziRriw4YQ7jCNb0gxMvZN3ChTvQczmEawmDKIzfymWS1wuzd6bwo9SX/cH2n5aalAR
	 ea6tkKaUkSfanI00E1pAbeym1FI6iDtu/G2oNwkOBKLxYHzBRK8BcRekJZ+GAd0k9EQKX
	 sGexr5IEDC78rUQLPgq+QHgT/ARdWeXdU7HMkp9MV8asq4oeLN3exl5adof04a0jKKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223465;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=DQGkpSAcUEldrefS3FgTooTEIoCcU3OOOCqakdoP+Go=;
	b=ChkmI0Fv2nAxENF4DGVZkb3wpVANmTW6at9fyf4/EAuecyjvbn9ToOmDDP54JpW+pXEs
	 rzaS8OYKDlXlZMS+urvQNk8nPM6JBrEVJFcpK+PGaoD9Q57qZvZqUC+6oofUaQCMt7aax
	 skibjr4VJpUUDT/nh/ravBc43BqiMxablhLzoaY7/sjS4fuZH0dsn0cd2jfExKSKe+fLO
	 jiNlC+Ujn8qvHpxLcZWiY7u8XMYHIGuohWjJp36MfkEGf3OslkrVSu6ZRf4Frw+PTbzdt
	 XcfPdEAL0xWSALX+fxdVnxwFHGBRinn3Yt0GwgzbG3V3jfK9LgvJ093GF2esnYUC8tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BDnDx97j;
	arc=none smtp.remote-ip=209.85.160.50
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AD360A2601
	for <linux-sunxi@lists.linux.dev>; Sat, 21 Nov 2026 01:11:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51AD360A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BDnDx97j
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-4a77dcc4ca0so905565fac.2
        for <linux-sunxi@lists.linux.dev>; Fri, 20 Nov 2026 17:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223461; x=1795828261; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DQGkpSAcUEldrefS3FgTooTEIoCcU3OOOCqakdoP+Go=;
        b=BDnDx97jsImBpA/kctCdcclzbZrkXXj8PYEzyZuIYyGkH6/InrC1qCh9KKDy/xGPTg
         p04kfDSObfkOzuX0l9V/9g78e96i7dsLT5vuHoq39EfNvCf+x7vvTGHLaQMUxpDnJxsh
         9HFIJaHW1reqEejm/miia+oWOVa++b6nFxi6qL4Ty7GxCg2CDcy90VUtK4Zildfa62lq
         pdFnOnM6w3Lru3+vuG/UlkJ2pViNV96HM9N53hUVpXjME77wgj7ppVPNIedZB8RAF4BW
         OADZ39nZr9mpB48dPftsdSRguxy8/8pMdgBqZKLNnJaKvmfMSdoaAY4hUqqNFzZC97Vw
         lq6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223461; x=1795828261;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DQGkpSAcUEldrefS3FgTooTEIoCcU3OOOCqakdoP+Go=;
        b=lFdJg36T/BGwyWtVNiMHWX6IJR0icTsC1KJQa+YjqZ84ACF+dVdTBNw1w0eYBuhLWJ
         Vh7/LG3vD91TyEADQyXPmerRRTGIi3aQ3r2yr/+4qcNfHO85aU3HbRDnJ6y0DxKmjt4t
         DZAe8OUdy0dUuFtGxw4qCUSS+9gL45AL0f4TtrpxyTevcG9FuNcx70yw1j7w2b8HaoQ0
         lBPzmlX+96LLm7iXjl3+CUHyQ5IkoG0E/OMcDoYCBll7431BZuPiD6klEvyOEw/+DZyA
         GeX/9aG5LaHbnHTRqL/LGkSkKBRM4RgHKrn5F22gHNUH4VrcBB0wFze/nugg1JFdUboM
         /p1Q==
X-Forwarded-Encrypted: i=1; AL+hErGQQNBXvZOn9V0HY/oIixGNjusMALcVKfDidsDIEXfirZMPfGuVItispM4gyEboku2yWxIutnN+NwrN4w==@lists.linux.dev
X-Gm-Message-State: APuU4Z+gCP4VCGmSF+cqV/ZzbEcsj4GLrQubh2m0kWZIeQk+ho3kKAXx
	p/gRq0wfUYdQjj87rBHGuFuzyijwmbYMabrR39qddLHf6fkEohEzRszD
X-Gm-Gg: AYBFou2jzrtZHe1Jmv2Dp9LflUpgcNLqSAZmefi7W4SEF1MoHz1nMDTrDNoFGBOv66D
	jvrccsk8qdL83Oz+JW/bnbfHrDXp51Zj6Ma9aOM2y+PqmpxsdG9M+q4SccGaPYa0lEsRD5wZEAK
	hY6HzSE49G/wJ2MG8A3UOMHsQsBM17zq8LnrCcE/ruUl/jLQStCP+tUbBQnwIqfWhvvZOYN3zEx
	wpTPf6yGVFXD8e8fFK1jeL9TFysD3C6eF1HpiINBQwssVbeNHfoDgdX4W6l39CpqbjtLmNiZXcn
	/gA3ARUF5LCQWmrfmHvZiKZoMHBCZZr2Az9aH0HceDeS9JpoHeSChEn5fNotorio4Tw0rqed5ui
	RlR4lw/BJaO4s+6UvoDgZtXpUyHdB2F5Aj5oI5hfZaAY5Hp59V6b/ZgA4urYfu9e7LGhVx5aWUU
	77S/F/fpjAMcgR8F8KBU/kmuxI3sUxSI6lWuE1vOClDF2VnXyyUt+Yk6NCX10D9yR4sdcooyXFp
	Nx6DUVE2Kvb6ogsM/2Hg/+hDzKezQ7Kq0DYooHX0K1Ce6tFw20FsePpwskxj/iuXICP9InuqyKF
	tZABd+8s1YiXC/TIyeh5KavC9rsr9/c9zyZYCgl+1GGrqJUxJYF7dtVJtgJfOlyO5thORvpb7I8
	/WOA2sUg6cu2WEvHdyt3gRDZvK5leknjy4oCIxuLMHG4d3HvbKcd5fV/c917DOAYoIFMz0otlxN
	zqbapQgFp23+UJRDxmsZzXQOWRy9Fks7J3OVac9JcjJGhQ+rvvVweL
X-Received: by 2002:a05:6808:30aa:b0:4d6:90f3:74a4 with SMTP id 5614622812f47-57a0c0a40e2mr5697337b6e.47.1795223461220;
        Fri, 20 Nov 2026 17:11:01 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:00 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:27 -0700
Subject: [PATCH v11 04/26] mtd: rawnand: sunxi: use the logical step's OOB
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
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-4-9721b1905ef4@gmail.com>
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

On H6/H616, when a PIO read detects a pattern and OOB was requested,
filling the OOB with that pattern can overwrite the next step's bytes.
On the last step the fill can run past the end of the OOB buffer. A
PIO write can likewise fetch more protected bytes than the step owns.

Each PIO transfer uses hardware slot zero. Looking up the protected
length by slot therefore always gives the first step's length, which
can be 32 bytes even when a later step has only 16 bytes or none.

Pass the logical step's user-data length to both helpers. PIO still
addresses hardware slot zero. DMA passes the length for the current
step and still addresses the same user-data registers.

Fixes: 54dcd6aa69db ("mtd: rawnand: sunxi: introduce maximize variable user data length")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 96 +++++++++++----------------------------
 1 file changed, 26 insertions(+), 70 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 8c5aed1fdfb3..ffbe851b87c7 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -927,43 +927,19 @@ static u8 sunxi_nfc_user_data_sz(struct sunxi_nand_chip *sunxi_nand, int step)
 
 /* PIO uses register zero; DMA concatenates user data within each transfer. */
 static void sunxi_nfc_hw_ecc_get_prot_oob_bytes(struct nand_chip *nand, u8 *oob,
-						int step, bool bbm, int page,
+						unsigned int reg_index, bool bbm, int page,
 						unsigned int user_data_sz)
 {
-	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
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
+	/* Undo hardware de-randomization of the plain on-flash BBM. */
 	if (bbm && (nand->options & NAND_NEED_SCRAMBLING))
 		sunxi_nfc_randomize_bbm(nand, page, oob);
 }
@@ -1017,48 +993,25 @@ static void sunxi_nfc_set_user_data_len(struct sunxi_nfc *nfc,
 }
 
 static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
-						const u8 *oob, int step,
-						bool bbm, int page)
+						const u8 *oob, unsigned int reg_index,
+						bool bbm, int page,
+						unsigned int user_data_sz)
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
-	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
-	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
 	u8 user_data[SUNXI_NFC_MAX_USER_DATA_SZ] = {};
+	unsigned int i;
 
-	/* Randomize the Bad Block Marker. */
+	/* Compensate hardware randomization so the BBM stays plain on flash. */
 	if (bbm && (nand->options & NAND_NEED_SCRAMBLING)) {
 		memcpy(user_data, oob, user_data_sz);
 		sunxi_nfc_randomize_bbm(nand, page, user_data);
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
@@ -1086,11 +1039,9 @@ struct sunxi_nfc_ecc_read {
 
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
 
@@ -1213,10 +1164,10 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
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
@@ -1228,7 +1179,8 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 		bitflips = sunxi_nfc_hw_ecc_correct(nand,
 						    !read->dma || randomized ? data : NULL,
 						    read->oob_required ? oob : NULL,
-						    i, status, pattern_found, &erased);
+						    i, status, pattern_found,
+						    user_data_sz, &erased);
 		if (bitflips < 0) {
 			/* Preserve PIO data before the raw erased-page check. */
 			if (!read->dma && !randomized)
@@ -1257,7 +1209,7 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 							      true, read->page);
 			}
 
-			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, i, !step,
+			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, reg_index, !step,
 							    read->page, user_data_sz);
 		}
 
@@ -1437,7 +1389,8 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 	sunxi_nfc_set_user_data_len(nfc, user_data_sz, nfc_step);
-	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, nfc_step, bbm, page);
+	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, nfc_step, bbm, page,
+					    user_data_sz);
 
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD |
 	       NFC_ACCESS_DIR | NFC_ECC_OP,
@@ -1637,6 +1590,7 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	struct scatterlist sg;
+	unsigned int reg_index = 0;
 	u32 wait;
 	int ret, i;
 
@@ -1657,8 +1611,10 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
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

