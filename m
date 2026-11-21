Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795223494;
	b=3FreAElO47mPPWR6ab5Ky+pcv/mQIcXEmdgXk/ELuh3COJWy990gisEJnsr1DOGn02q9
	 qVcj2GWFCUxbHKhCt92V5H0NUYK9uaY5kubTWsRCyYtxrjrtGr7D5+ZyqbwRy4ZaCIxPZ
	 gc7AIx19ry44oVTJvS5cbiDl/lQVbWaPTVUwKnPxp8mK2UlMFyQkEC1tKnlOW4ASSetoA
	 1klgXsNin5UFJs+CmdGv6fIXRFg3DpPCzo7HG+nLhKM39srwczzBDvcv9iXBzI+Gy5aIo
	 kh1d9ppMIdM/M9W0EIrIBc1sNCPMGcKgoJsgosXOdZ856o588HMt/pH5w1Co6sJEeYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=J6dsf3PUVYR2e83j22FZDt4Y383GBQ5T4kYYqbMeWQw=;
	b=QaswfyPNA9ZtkCzuhWEePB3Q6ON815iz2k7cjVydHAgE1IIUVaC0Aq3VfyFDqgUtFL2E
	 XYoqbMYcjqL0YMH3L6jGTU2GlFkARqU5dEFJ6rhfWGC8ItVsd4lMiYu2qEI7QdA+CYKsk
	 +3s5SY0PTx1uI9MMpcjZGQKyrIfWSAkCY9UIoDpnD2Oyd7xEMwqfIIa8BYEt4KzwWltzx
	 l8GftIfR9PISeiZsO66Dab4U8PYD8RHQFv9hrv3vEdH9O08LKx5JCBS9YnDldBRbNc9/E
	 gwMPhqA++jsDGLk544hgwtTHU+7DRek4dy0OVOGlUabcVz4Q0Mj3UwVDohY5h5M+aNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="fW/UDt6z";
	arc=none smtp.remote-ip=209.85.167.174
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB03A60A6F5B
	for <linux-sunxi@lists.linux.dev>; Sat, 21 Nov 2026 01:11:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB03A60A6F5B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fW/UDt6z
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-57728d859e9so756071b6e.1
        for <linux-sunxi@lists.linux.dev>; Fri, 20 Nov 2026 17:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223491; x=1795828291; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J6dsf3PUVYR2e83j22FZDt4Y383GBQ5T4kYYqbMeWQw=;
        b=fW/UDt6zEp7j4AozyPwSYfCz50b27XmC9T+y+KXJQF2h0y/elkynywzTzAzyAhDWuU
         eAn3tvgy2AvCNfL5VebDNxnR3jjEKP2skKG+BuqyE+f3qVgXHk9Eox3FFmspee2MoxFk
         ucdggwdz0q+DYQ0K5MLHmZzJtmGXwBqAUWM5nYNvBe6K3US6xIKUmIcepDz6c7n2E+Rj
         7e45KZdbzsJD2UEz6xopYmQgt1CPhKqpyVaH2XzH8EhQPcJNH9/xgVvpOnfgHgY2X1Xx
         v5eNJNmsf2Ys62963TbzhsEt9THgnKjJEi35Ya192cPsnYCN2IRDrD1pNBg+4MdSr1VY
         qYsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223491; x=1795828291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J6dsf3PUVYR2e83j22FZDt4Y383GBQ5T4kYYqbMeWQw=;
        b=tGbWx/dVWuwH8e8nJ4TSuZGOPKy4drqm1gPm3zpDJZSKEua3c3JMFEH++BHHene7uJ
         +pkL3at7NszENzLL3bX3b4qZOMPIEDR4SOfo9VCt2HSqg8+IjrRgC3k8lK1tg7QIRMiJ
         VAsA8YEIB/fCzn0B+Lf8echwSCbV+VlUApdJYf0G9phBW04WNQh2lktteykT/b5Wmuj/
         GnISL4bLkAt6YzuOX35jwpl8xSkfoXCj5bNmiABn/yVy+2B2N2L18lSKYNFT72Hr6oEc
         Bu5n0NZmS3wfSpTzWr0fh1e9FKgTCNiNaAkXKURDMaS5rs6djDgA2wz/xlcDldr8hqnG
         Efdw==
X-Forwarded-Encrypted: i=1; AL+hErHMcFjJZxYiChnmq0Dv0breofvZp0HkduMWeTaG2xm7hvr0ioGMhZr/H9t/QA98gDDF0YS+0okO1GPfdw==@lists.linux.dev
X-Gm-Message-State: APuU4Z9BOZwNZvigIMWKjzFcExKzmvPpl8Mf6KvEMNT6voNYPLxIpVfm
	jD3bb9A5TFgovGeJr04/5AKlkhGVZFWFzgLh1EhX7tNpDoxnKOSON0dI
X-Gm-Gg: AYBFou39/O2uDScjW/L9E71V9HlExuUPwqx4OCFS6fsYZgFc59hW5hhu+eykyd7fOJ/
	uo7z6DXyi8WBcMUqI2gxLV7aV5VNWxxzhQl542XqEkLepA/lM5ymtWs2lWC6tSXdECemGRpDVoG
	AwnTGdRM99fDYc48O0JEMggHAnQfXa8FI3JqAmhDPoQmeHGV3E5rnvvy6+wDO8K7bGwM36IQBgF
	byFD7ib3bmFs/7E4ZNhgb2xxTBa49wafeQCaNs3C81aguEBTIEkrGJ2lEChru0ezVr5JSVLfiPK
	PILQNuPT3uJpWCgEfwC+HMZr1iCTMpaaQa3D4L7s7T8LbFMLEXShgqd5dOCPGmSFRBH+uVijU6m
	rU9s4f7g3iDFVLcd4yk/AhUu7ZkG4BAfGJSMopA5M9BVVD5ltIMQRyG2xytGU9y+cqP2FE9xMDj
	sxzvJm3ayyeTjI3bYLBhoYKv9v2tFQVsLU3Z84k6vRR6MgIyPojvPFL97oHpX8Km1zCkHtY9q0h
	BXGT1uaaKJt5VKAx5QOK5fS42VdTRM1i+QDUxdn3qChTinGtthukmV5dxh0mlsxvpVm/dKqM5oe
	1qB/AUF3PsNWGcsTDWpD4OQ00D4ohHkLPR9m1FwGDhukwj2a1X2KZRV6J5MwRZPqHAuaCCiLFk5
	nSqZpWCxD0hfZSfbEA/+/wNkCDDTXP+S2L1rVGir7V0Zdrp6EN4UpLQ52jc4Eh3G0p5gJVG8Jci
	QrLt/ys3mKdd22w667T1sB2VMVo6uJ8uURkIGZMFFCiyVvohpxjS+ExwFBiHAg5YR633k7XCglR
	Q==
X-Received: by 2002:a05:6808:f07:b0:571:846e:6f08 with SMTP id 5614622812f47-57a06c1b05bmr5537864b6e.5.1795223490849;
        Fri, 20 Nov 2026 17:11:30 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:30 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:48 -0700
Subject: [PATCH v11 25/26] mtd: rawnand: sunxi: reuse ECC status within
 each transfer
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
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-25-9721b1905ef4@gmail.com>
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

The pattern ID register describes all slots in a completed transfer,
but the driver rereads it for each matching step. Four consecutive
hardware slots also share one correction-counter register, which the
driver rereads for each ordinary step in that group.

Take a fresh snapshot for each PIO step or DMA batch. When the
controller places the pattern-found bits in the ECC status register,
use the same read for both. Read the pattern ID at most once per batch
if any slot reports a pattern without an ECC error. Read each packed
counter word only when a slot needs it and reuse it for the other slots
in that group of four. Consume the results before starting the next
ECC transfer.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 87 ++++++++++++++++++++++++++++-----------
 1 file changed, 64 insertions(+), 23 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index a722636f2e15..37f01801cf48 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1166,12 +1166,56 @@ struct sunxi_nfc_ecc_read {
 	bool read_raw_bbm;
 };
 
-static unsigned int sunxi_nfc_hw_ecc_read_count(struct nand_chip *nand, int slot)
+/*
+ * Transfer-local ECC results. Consume the pattern ID and correction counts
+ * before issuing another ECC transfer.
+ */
+struct sunxi_nfc_ecc_snapshot {
+	u32 status;
+	u32 pattern_found;
+	u32 pattern_id;
+	u32 count_reg;
+	u32 count;
+};
+
+static void sunxi_nfc_hw_ecc_read_pattern_id(struct nand_chip *nand,
+					     struct sunxi_nfc_ecc_snapshot *snapshot)
+{
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+
+	snapshot->pattern_id = readl(nfc->regs + NFC_REG_PAT_ID(nfc));
+}
+
+static void sunxi_nfc_hw_ecc_read_status(struct nand_chip *nand,
+					 struct sunxi_nfc_ecc_snapshot *snapshot)
+{
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	u32 pattern_found;
+
+	pattern_found = readl(nfc->regs + nfc->caps->reg_pat_found);
+	snapshot->pattern_found = field_get(NFC_ECC_PAT_FOUND_MSK(nfc), pattern_found);
+	if (nfc->caps->reg_pat_found == NFC_REG_ECC_ST)
+		snapshot->status = pattern_found;
+	else
+		snapshot->status = readl(nfc->regs + NFC_REG_ECC_ST);
+	/* A new operation, including every PIO step, invalidates the count word. */
+	snapshot->count_reg = ~0U;
+}
+
+static unsigned int
+sunxi_nfc_hw_ecc_read_count(struct nand_chip *nand,
+			    struct sunxi_nfc_ecc_snapshot *snapshot, int slot)
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
-	u32 count = readl(nfc->regs + NFC_REG_ECC_ERR_CNT(nfc, slot));
+	u32 reg = NFC_REG_ECC_ERR_CNT(nfc, slot);
 
-	return NFC_ECC_ERR_CNT(slot, count);
+	/* Four consecutive DMA steps share one error-counter register. */
+	if (snapshot->count_reg != reg) {
+		snapshot->count = readl(nfc->regs + reg);
+		snapshot->count_reg = reg;
+	}
+
+	return NFC_ECC_ERR_CNT(slot, snapshot->count);
 }
 
 /*
@@ -1275,7 +1319,7 @@ static int sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
 /* Interpret one PIO step or a completed DMA batch before reusing its status. */
 static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 				    struct sunxi_nfc_ecc_read *read,
-				    u32 status, u32 pattern_found,
+				    struct sunxi_nfc_ecc_snapshot *snapshot,
 				    int first_step, int nsteps)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
@@ -1286,6 +1330,9 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 	unsigned int reg_index = 0, user_data_sz;
 	int slot, ret;
 
+	if (snapshot->pattern_found & ~snapshot->status)
+		sunxi_nfc_hw_ecc_read_pattern_id(nand, snapshot);
+
 	for (slot = 0; slot < nsteps; slot++, reg_index += user_data_sz / 4) {
 		int step = first_step + slot;
 		int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, step);
@@ -1297,16 +1344,15 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 		if (step < read->first_req_step)
 			continue;
 
-		if (status & NFC_ECC_ERR(slot)) {
+		if (snapshot->status & NFC_ECC_ERR(slot)) {
 			/* Preserve PIO data before the raw erased-page check. */
 			if (!read->dma && !randomized)
 				memcpy_fromio(data, nfc->regs + NFC_RAM0_BASE, ecc->size);
 			continue;
 		}
 
-		if (pattern_found & BIT(slot)) {
-			u32 pattern_id = readl(nfc->regs + NFC_REG_PAT_ID(nfc));
-			u8 pattern = pattern_id & BIT(slot) ? 0xff : 0;
+		if (snapshot->pattern_found & BIT(slot)) {
+			u8 pattern = snapshot->pattern_id & BIT(slot) ? 0xff : 0;
 
 			if (!read->dma || randomized)
 				memset(data, pattern, ecc->size);
@@ -1320,7 +1366,7 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 			continue;
 		}
 
-		bitflips = sunxi_nfc_hw_ecc_read_count(nand, slot);
+		bitflips = sunxi_nfc_hw_ecc_read_count(nand, snapshot, slot);
 
 		if (!read->dma)
 			memcpy_fromio(data, nfc->regs + NFC_RAM0_BASE, ecc->size);
@@ -1353,14 +1399,14 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 		sunxi_nfc_hw_ecc_update_stats(nand, &read->max_bitflips, bitflips);
 	}
 
-	if (!(status & NFC_ECC_ERR_MSK(nfc)))
+	if (!(snapshot->status & NFC_ECC_ERR_MSK(nfc)))
 		return 0;
 
 	/* Finish consuming the batch's corrected OOB before raw error rereads. */
 	for (slot = 0; slot < nsteps; slot++) {
 		int step = first_step + slot;
 
-		if (step < read->first_req_step || !(status & NFC_ECC_ERR(slot)))
+		if (step < read->first_req_step || !(snapshot->status & NFC_ECC_ERR(slot)))
 			continue;
 
 		ret = sunxi_nfc_hw_ecc_read_error(nand, read, step);
@@ -1402,10 +1448,10 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
+	struct sunxi_nfc_ecc_snapshot snapshot;
 	int data_off = step * ecc->size;
 	int oob_off = nand_to_mtd(nand)->writesize + sunxi_get_oob_offset(sunxi_nand, ecc, step);
 	int page = read->page;
-	u32 pattern_found;
 	int ret;
 
 	if (*cur_off != data_off) {
@@ -1441,12 +1487,9 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 
 	*cur_off = oob_off + ecc->bytes + user_data_sz;
 
-	pattern_found = readl(nfc->regs + nfc->caps->reg_pat_found);
-	pattern_found = field_get(NFC_ECC_PAT_FOUND_MSK(nfc), pattern_found);
+	sunxi_nfc_hw_ecc_read_status(nand, &snapshot);
 
-	return sunxi_nfc_oob_read_batch(nand, read,
-					readl(nfc->regs + NFC_REG_ECC_ST),
-					pattern_found, step, 1);
+	return sunxi_nfc_oob_read_batch(nand, read, &snapshot, step, 1);
 }
 
 static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand,
@@ -1457,10 +1500,11 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand,
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
+	struct sunxi_nfc_ecc_snapshot snapshot;
 	struct scatterlist sg;
 	int page = read->page;
 	int ret, i;
-	u32 status, pattern_found, wait;
+	u32 wait;
 
 	if (first_step) {
 		ret = sunxi_nfc_read_column(nand, page, first_step * ecc->size,
@@ -1522,12 +1566,9 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand,
 	if (ret)
 		return ret;
 
-	status = readl(nfc->regs + NFC_REG_ECC_ST);
-	pattern_found = readl(nfc->regs + nfc->caps->reg_pat_found);
-	pattern_found = field_get(NFC_ECC_PAT_FOUND_MSK(nfc), pattern_found);
+	sunxi_nfc_hw_ecc_read_status(nand, &snapshot);
 
-	return sunxi_nfc_oob_read_batch(nand, read, status, pattern_found,
-					first_step, nchunks);
+	return sunxi_nfc_oob_read_batch(nand, read, &snapshot, first_step, nchunks);
 }
 
 static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,

-- 
2.53.0

