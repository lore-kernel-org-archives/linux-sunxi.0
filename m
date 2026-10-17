Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AFA4963CA
	for <linux-sunxi@lists.linux.dev>; Sat, 17 Oct 2026 19:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792266404; cv=none; b=qWOYPQSXMW30s7rDFGdfZdCfElYnRQDcPMlFC1ASDLQKFELD3K23I1zBdQKp7jAMDSaNSbLP9os7eMrOoy6hbAkkZY9iqGPKe0N2xppUd5K2W3lxmgMvOJUw2cUWMl647OOGN7HoOoCOUuIjIJWqXFeuRccj1LZFsOk3L8KL9aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792266404; c=relaxed/simple;
	bh=lCv2gYemwbI1mKURr3K14d4/Nb3rNKPrtxXImPwhdBI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ESn6S5XguG5gduNLqZiVCC1jxYLLMs4QCEB+Ius0GpIAZ8TM9/puG2yKAURGX0miHRIDGTR6s7MHdGmz6XQqsH6blO8gCqLZH5dQ9zCzUb+yB2TeTKH1y7uzZohNedwmO+TnWezk8DVIwBG/iBrMHckqPGv07abJlIzPZJ/K2Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L2f4F2va; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L2f4F2va"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-8451a619da7so568254a34.1
        for <linux-sunxi@lists.linux.dev>; Sat, 17 Oct 2026 12:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792266397; x=1792871197; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mTIpJDfoSvJa9mNPyvSlvbjoEPEDMGD1iYdf7xNBtEM=;
        b=L2f4F2vaOmzWR1Uwd5vTutGzS6YlAHyUzC1b+ZGbiOVITqaeYFgceqMibLHcj/QgxV
         QFubIRMSwrwy/HUyXEp7qL/pemHFtOhzrHz0hgIdyqEivd3YiHT9xxEFu4EK2SZQdQuR
         I3ft6pt4KMOUJDUbwTO2D7O4Lpflgk3YFCJStth+8gdPTQZLMCFyE5xFYJPYZHMNaw3J
         jGJjipU5oqyRIkru7ehwL5anUzrgZbF2gX3hbduT4ogfSEQOalP6rsWhTT7BUxhonSHI
         3AQIevf3L52EqqXHjskrZXbms45qJLtVs1IUQEV8wvWrhpwWHv8FRVF5h83DjMZLFXOQ
         6yZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792266397; x=1792871197;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mTIpJDfoSvJa9mNPyvSlvbjoEPEDMGD1iYdf7xNBtEM=;
        b=rXpWouNwhSGxSsuxkIixs3ZZ2W1Z4mR1kzONYlS3SKDzeXk6ZKdcCGTZWYOMFTmTTC
         VLyyPWrebwqWVEJWrx5zd0iRVjTcBULfoshIVM6DF/7+T9liIkboLQ6oAc23UGnR9mhF
         Pv9W5EG2p+lKFeldlQ7a9TJP9NuB4wx5MhkKuYH+bUQpWO8hln7AfIeFTTk4dygihyeB
         znQgiaEVrgtsBwGGCe40Fycp/bGHPjXhquRNCujm+oNYpBfEb1thiQWpSd0QcI0MpYcS
         VaNipPzlOCyfLDRlxXUHGYAtx5ROpnvwBJ61qOdePuol3V/LX7lq1Uo4QJP9syC2scxB
         VEag==
X-Forwarded-Encrypted: i=1; AKwUvByoGKQBvcI6ic2BJGzNVGTG2kdSqZia6hFWMndMBZYsT2noQj+xMx+OAlXpUl4LPvqgDIZEL/fdgJX2eA==@lists.linux.dev
X-Gm-Message-State: AFq9FYI9TtbHdo793TS/6xKVHQ86Ef0tnC6HrWod1qMZyQtlkJXO+hlX
	hU4vJL4TrvhEI1/ro+N4B6Sfu66jMCSuaoBmi04slAiGsLltu9zLcHhh
X-Gm-Gg: AYBFou24e5xYkEx6Yfy1+DBrCrCzU1FwW5KLeGI9lDNIV4yeF5doo1takPalWChMui+
	+a8llu44A2at06RJPL5DrDMgVKOGNZttUFLF8ThnL5KgbrbDOMata+ukilamuERtviPnNEiIFS+
	1LuTN8qyyOZ9EOCwvLgPER8T4lcWLbgCgpa1iFchFjuNCc1CW4/Kza2uhwswEkudfIK27w/jd6d
	VVh3ch6yXGl0uIbS9ZseUeae8l08JEnAJBR+lvrbkscY4lniHsDnbSgam1EKhPrSNXiaDBIbw68
	Q2im6dO50uvfy6p6SPbND18SMvjM1kDNlkv8sNeuo93ZixwJorx1kteERTVEZyajyPeECwYh4C7
	pdBgcieIooWHQNTDMMctKr4rI4ygtaIAzx7AbCuRYlJgbrWL+XeG7TGTFPfw6hVsKI3BKCwW3EX
	09q/+g5A/ieAL/fOpqb9RdGhTCaW7no77vz/K929jGCxcMyFnUxl3pOwdMiBPLGiFrZ41yVTUyA
	fcuMcZ5AXImdx0FoG5pV+fm7T/0Mg==
X-Received: by 2002:a05:6808:6b89:b0:4b3:7549:d3c0 with SMTP id 5614622812f47-53cd20aaa38mr2724743b6e.18.1792266397145;
        Sat, 17 Oct 2026 12:46:37 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5388dd8b5a2sm4025321b6e.12.2026.10.17.12.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 12:46:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 17 Oct 2026 13:46:06 -0600
Subject: [PATCH v9 11/18] mtd: rawnand: sunxi: use page reads to reposition
 small-page NAND
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-11-b624c09e3ee5@gmail.com>
References: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
In-Reply-To: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2

The hardware-ECC reader moves between main data and OOB, and rereads raw
bytes when checking a possibly erased ECC step. It uses
nand_change_read_column_op(), which sends large-page random-output
commands and rejects NAND pages of 512 bytes or less. For a small-page
geometry accepted by hardware-ECC setup, these reads therefore fail when
they need to reposition, rather than using the small-page read commands.

Add a read-column helper that uses nand_read_page_op() on small pages.
The core selects READ0, READ1 or READOOB for the requested column and
sends the row address again. Pass the page number through the
erased-check path as well, and preserve errors from the resulting
operation. Keep the existing random-column operation for larger pages.

Select PIO for small pages even when DMA is available: the DMA PAGE_OP
sequencer uses large-page random-column commands internally.
This corrects read-side repositioning only; the write-column helper still
rejects small pages. Software-ECC and raw callbacks are unchanged.

This is a command-path correction found by inspection, not a claim that
ordinary 512+16 NAND becomes supported. The existing controller-ECC
limits still apply: it needs 512-byte ECC support and at least 28 parity
bytes plus four user-data bytes, so 512+16 remains rejected. No
small-page hardware validation is claimed.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260913041642.E28F81F000FF@smtp.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 40 ++++++++++++++++++++++++---------------
 1 file changed, 25 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index f00f9a8ff66b..ab9ff470062a 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1072,6 +1072,16 @@ static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,
 	}
 }
 
+static int sunxi_nfc_read_column(struct nand_chip *nand, int page,
+				 unsigned int column, void *buf, unsigned int len)
+{
+	/* Small-page NAND needs a new READ0/READ1/READOOB and the page address. */
+	if (nand_to_mtd(nand)->writesize <= 512)
+		return nand_read_page_op(nand, page, column, buf, len);
+
+	return nand_change_read_column_op(nand, column, buf, len, false);
+}
+
 /*
  * Return 1 for an erased chunk or 0 for an uncorrectable chunk, with ECC
  * statistics updated in either case. Negative values report transport errors.
@@ -1080,7 +1090,7 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 				       u8 *data, int data_off,
 				       u8 *oob, int oob_off,
 				       unsigned int user_data_sz,
-				       unsigned int *max_bitflips)
+				       unsigned int *max_bitflips, int page)
 {
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	unsigned int oob_len = ecc->bytes + user_data_sz;
@@ -1088,13 +1098,12 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 
 	/* Check the physical representation for bitflips in erased pages. */
 	if (nand->options & NAND_NEED_SCRAMBLING) {
-		ret = nand_change_read_column_op(nand, data_off, data,
-						 ecc->size, false);
+		ret = sunxi_nfc_read_column(nand, page, data_off, data, ecc->size);
 		if (ret)
 			return ret;
 	}
 
-	ret = nand_change_read_column_op(nand, oob_off, oob, oob_len, false);
+	ret = sunxi_nfc_read_column(nand, page, oob_off, oob, oob_len);
 	if (ret)
 		return ret;
 
@@ -1196,8 +1205,8 @@ static int sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
 		return 0;
 
 	if (!cur_off || *cur_off != (offset + mtd->writesize)) {
-		ret = nand_change_read_column_op(nand, mtd->writesize + offset,
-						 NULL, 0, false);
+		ret = sunxi_nfc_read_column(nand, page, mtd->writesize + offset,
+					    NULL, 0);
 		if (ret)
 			return ret;
 	}
@@ -1263,14 +1272,14 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 		if (read->oob_required) {
 			/* Keep the existing PIO and DMA representations of parity. */
 			if (read->dma) {
-				ret = nand_change_read_column_op(nand, mtd->writesize + oob_off,
-								 oob, ecc->bytes + user_data_sz,
-								 false);
+				ret = sunxi_nfc_read_column(nand, read->page,
+							    mtd->writesize + oob_off,
+							    oob, ecc->bytes + user_data_sz);
 				if (ret)
 					return ret;
 			} else {
-				ret = nand_change_read_column_op(nand, mtd->writesize + oob_off,
-								 NULL, 0, false);
+				ret = sunxi_nfc_read_column(nand, read->page,
+							    mtd->writesize + oob_off, NULL, 0);
 				if (ret)
 					return ret;
 
@@ -1305,7 +1314,7 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 		ret = sunxi_nfc_hw_ecc_read_error(nand, read->buf + data_off, data_off,
 						  nand->oob_poi + oob_off,
 						  mtd->writesize + oob_off, user_data_sz,
-						  &read->max_bitflips);
+						  &read->max_bitflips, read->page);
 		if (ret < 0)
 			return ret;
 		if (ret)
@@ -1345,7 +1354,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	int ret;
 
 	if (*cur_off != data_off) {
-		ret = nand_change_read_column_op(nand, data_off, NULL, 0, false);
+		ret = sunxi_nfc_read_column(nand, page, data_off, NULL, 0);
 		if (ret)
 			return ret;
 	}
@@ -1355,7 +1364,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 		return ret;
 
 	if (data_off + ecc->size != oob_off) {
-		ret = nand_change_read_column_op(nand, oob_off, NULL, 0, false);
+		ret = sunxi_nfc_read_column(nand, page, oob_off, NULL, 0);
 		if (ret)
 			return ret;
 	}
@@ -2333,7 +2342,8 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	ecc->write_oob = sunxi_nfc_hw_ecc_write_oob;
 	mtd_set_ooblayout(mtd, &sunxi_nand_ooblayout_ops);
 
-	if (nfc->dmac || nfc->use_mdma) {
+	/* The DMA page sequencer uses large-page random-column commands. */
+	if (mtd->writesize > 512 && (nfc->dmac || nfc->use_mdma)) {
 		ecc->read_page = sunxi_nfc_hw_ecc_read_page_dma;
 		ecc->read_subpage = sunxi_nfc_hw_ecc_read_subpage_dma;
 		ecc->write_page = sunxi_nfc_hw_ecc_write_page_dma;

-- 
2.53.0

