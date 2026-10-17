Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBD748FF9C
	for <linux-sunxi@lists.linux.dev>; Sat, 17 Oct 2026 19:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792266382; cv=none; b=timflIcD5IF4LUxLovA/2u46fa2hejoM0LojCeUQjtTO4hoOB3f7IVO5HJYVolqkKB9Z3N04RD//KCiWWCcj/BVeljIEecQ6tDTVTzT+peNME7gpW1lWs7Fi2RmrO7FM0G8JKOBSPt0QgfCgJZyyyP7ggnDrow1CQQPduVw9Z1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792266382; c=relaxed/simple;
	bh=UTEH9PIbIWwcFKs3wGw1jrXsTWb2sXQT0iEqAm4jyHg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NXtvimG8SwIKFi0qH40onbPoB/J3gXziHZaOMrQK0k7cOhvbwAaUhr08L23yMJ8guc5DU8PKIJf3R13j+OBsPlyzACgZWPxRMaCDkhOMfydCrCi/L0CKS23Ry/IePNQrKu7BZLz2AjmyoLhPcnEcpjYBFGCWg+b+XumkIblovXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KyJl6bwi; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KyJl6bwi"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-8256106635eso323293a34.0
        for <linux-sunxi@lists.linux.dev>; Sat, 17 Oct 2026 12:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792266378; x=1792871178; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AcVwsAGitc/8mDgkiqGJIxKdaOI/OCkQfgdeA86v4XE=;
        b=KyJl6bwiYsJIW91EEG3VboOrjPcJmDOferBfMJwdU6o081CNGvblLe5T8yTH38rmSp
         bYFImlvolZj+5amcP0Rdlzf8AiNXqfQk74qd1SdNqj/NRXr6xHYWHhO5EXS7lIZ8hh2m
         +I57HvWcek47jZt4TSe/1IJTZUlYrfl6Cqgx4hezFkL7jYocWPAtqNhlDfAzhTe78phq
         3cKyGWOyr95JpeiTYXeJXhiqcsH0B1o/HfC5MlKjiqPdmpPm2MTtG8qE+SBSWzV1Fr8l
         aSCnQRH/VXexxAIpZpdMPgFQ+P7ihLGrxc1ldIN8F9W9BFD6zoGpDYDEchsOceBurUFT
         A8hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792266378; x=1792871178;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AcVwsAGitc/8mDgkiqGJIxKdaOI/OCkQfgdeA86v4XE=;
        b=b2nl22qvON4VjoUwCVqXUrOxYGsX5X6Z0yGzNyVKS04Wv/9eEytqWf24RVkT4DGe4P
         av4/oYpQnTVwJvNGg00ErA1DMQzzjPYu8yf8qCMTAP72VgT6kx3JerRtAMBABS/LYvQV
         Fc2zHvWesJqsSU2tStuoy7AQHxllQYkgRK7c/0RrnC0p6iwt0hVx7PSIA7a0fjMEWErg
         tlxOnkodPGOIFtLTD8WBMciUzaeRTf2c/3UgjvANQl9jojk1wluJD68m1wecvFDHJ8ub
         5iMuwYfh6dvsQfbS6COK1Cc7wlaNjvYQ/xp6CLLH00v/m6yGBr00WF5qXP0C/plZJlq0
         imoQ==
X-Forwarded-Encrypted: i=1; AKwUvBx3tXPdY3rx5i8SMVVuZPr1WbEVju9QCqgN04guIEMVvI8I6X+tnBNiSx1nOvMNSItTjFG4kFFeddblaQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYLYFQP8p4HRw2GnU7nCP4tE6zTzPy1u6oA66hi7UtiPz9QRmzk+
	iJL1hO9KME4ONDqlL1YNUQ0v1Ktyg6nUL6AJouIffSuK7pZfoPsVLtMC
X-Gm-Gg: AYBFou0ROvuO+cFWpGFivRTaPit2I99GlMSkArKXgPgutyldl4IlcKuUOMdUAPxAUuq
	XMwvSrNuUhluxdW6c3xNeUwNglZFKRorIBe8SqzEHTqu5xC1+50jzR+A+93jW0ZrdabgthFABDj
	P3my12LObR1ASz9OUjckCH/TyTojppShKvVmvBuYksBCwkrW3B2fwXdUtsQUlhLvOyCS/d59gZi
	AWHhw3DuCGdPtiS80uULuvNClEIPReJOUhU/Ct1uz/USnPgEXfd4KbKVFhIQJAClCYvfFJpwJaB
	9Jai4iVAFwsC9SROS56+85VUMPJxkPPZ6nqcEcNJbn5Cob3PgJPYh9HcI8wW7JUaRqYt+kvgy8y
	Hj90CLc78O5WhuF5DEbv1A35ABqUPuAUbgh8Kgeb9A6tN/OA65SJS13wjSdo5Vd9O2SSq7UhGEO
	FpADQSqhbv963DybCmswKBCaUsXteMsDx+68c9vDEOTHYDgtCb3Y9OI8dEHRaJaLrDDqTQl8B9z
	a0HAmjzVw7B3jBLXEwKI7PeQSxPdjNKqqY3/p6wDQG/astJtLB7GFXaFbWDRXuKi2HjrGJpADLE
	jS7adx9tu6GC1uZYYJpFFBCmzMTlLbwBBvnLClEjPMPxyYnDF6r/NUXte1LinFYXx7jEEk6QzJs
	dUwXe88FMtCGK6K9CrJ66
X-Received: by 2002:a05:6808:4fca:b0:4fc:248a:de3b with SMTP id 5614622812f47-53ccaf2998dmr3273386b6e.23.1792266378042;
        Sat, 17 Oct 2026 12:46:18 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5388dd8b5a2sm4025321b6e.12.2026.10.17.12.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 12:46:16 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 17 Oct 2026 13:45:59 -0600
Subject: [PATCH v9 04/18] mtd: rawnand: sunxi: propagate page-setup and
 erased-check errors
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-4-b624c09e3ee5@gmail.com>
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
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The ECC read callbacks ignore nand_read_page_op() failures. A command or
ready timeout can therefore leave the requested page unselected, yet the
driver continues with data transfers and can report success for stale
data. Return the setup error before starting PIO or DMA.

After an ECC error, the driver rereads the physical data and OOB with
randomization disabled to distinguish an erased chunk from corrupt data.
Those rereads can also fail. Do not pass stale buffers to
nand_check_erased_ecc_chunk() or count a transport failure as an ECC
result: return the reread error instead. Successful erased checks retain
their existing statistics and correction-count behavior.

Route PIO read errors through ECC disable. DMA has already released its
transfer resources before interpreting the results, and its caller
retries a failed read in PIO. Restore the corrected/failed counters from
before that DMA attempt so earlier steps are not counted again by the
retry; leave bad-block counters unchanged.

These unchecked returns were found by inspecting the read callbacks and
their NAND-operation helpers.

Fixes: 97d90da8a886 ("mtd: nand: provide several helpers to do common NAND operations")
Fixes: 25f815f66a14 ("mtd: nand: force drivers to explicitly send READ/PROG commands")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 56 ++++++++++++++++++++++++++++++---------
 1 file changed, 44 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 4ff19da8b98d..29715d179d22 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1038,7 +1038,10 @@ static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,
 	}
 }
 
-/* Return whether the chunk is erased, and account for its ECC result. */
+/*
+ * Return 1 for an erased chunk or 0 for an uncorrectable chunk, with ECC
+ * statistics updated in either case. Negative values report transport errors.
+ */
 static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 				       u8 *data, int data_off,
 				       u8 *oob, int oob_off,
@@ -1050,10 +1053,16 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 	int ret;
 
 	/* Check the physical representation for bitflips in erased pages. */
-	if (nand->options & NAND_NEED_SCRAMBLING)
-		nand_change_read_column_op(nand, data_off, data, ecc->size, false);
+	if (nand->options & NAND_NEED_SCRAMBLING) {
+		ret = nand_change_read_column_op(nand, data_off, data,
+						 ecc->size, false);
+		if (ret)
+			return ret;
+	}
 
-	nand_change_read_column_op(nand, oob_off, oob, oob_len, false);
+	ret = nand_change_read_column_op(nand, oob_off, oob, oob_len, false);
+	if (ret)
+		return ret;
 
 	ret = nand_check_erased_ecc_chunk(data, ecc->size, oob, oob_len, NULL, 0,
 					  ecc->strength);
@@ -1317,6 +1326,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	struct sunxi_nfc_ecc_read read = {
 		.buf = buf,
@@ -1324,6 +1334,8 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
 		.oob_required = oob_required,
 		.dma = true,
 	};
+	unsigned int corrected = mtd->ecc_stats.corrected;
+	unsigned int failed = mtd->ecc_stats.failed;
 	struct scatterlist sg;
 	int ret, i;
 	u32 status, pattern_found, wait;
@@ -1375,9 +1387,19 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
 	ret = sunxi_nand->oob_ops->read_batch(nand, &read, status, pattern_found,
 					    0, nchunks);
 	if (ret)
-		return ret;
+		goto err_stats;
+
+	ret = sunxi_nand->oob_ops->finish_read(nand, &read, NULL);
+	if (ret < 0)
+		goto err_stats;
+
+	return ret;
 
-	return sunxi_nand->oob_ops->finish_read(nand, &read, NULL);
+err_stats:
+	/* The caller retries the whole read in PIO mode. */
+	mtd->ecc_stats.corrected = corrected;
+	mtd->ecc_stats.failed = failed;
+	return ret;
 }
 
 static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
@@ -1465,7 +1487,9 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
-	nand_read_page_op(nand, page, 0, NULL, 0);
+	ret = nand_read_page_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
@@ -1473,10 +1497,11 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 	for (i = 0; i < ecc->steps; i++) {
 		ret = sunxi_nfc_hw_ecc_read_chunk(nand, &read, i, &cur_off);
 		if (ret < 0)
-			return ret;
+			goto out;
 	}
 
 	ret = sunxi_nand->oob_ops->finish_read(nand, &read, &cur_off);
+out:
 	sunxi_nfc_hw_ecc_disable(nand);
 
 	return ret;
@@ -1489,7 +1514,9 @@ static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
-	nand_read_page_op(nand, page, 0, NULL, 0);
+	ret = nand_read_page_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, oob_required, page,
 					       nand->ecc.steps);
@@ -1514,7 +1541,9 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
-	nand_read_page_op(nand, page, 0, NULL, 0);
+	ret = nand_read_page_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
@@ -1523,10 +1552,11 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 	     i < DIV_ROUND_UP(data_offs + readlen, ecc->size); i++) {
 		ret = sunxi_nfc_hw_ecc_read_chunk(nand, &read, i, &cur_off);
 		if (ret < 0)
-			return ret;
+			goto out;
 	}
 
 	ret = read.max_bitflips;
+out:
 	sunxi_nfc_hw_ecc_disable(nand);
 
 	return ret;
@@ -1541,7 +1571,9 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
-	nand_read_page_op(nand, page, 0, NULL, 0);
+	ret = nand_read_page_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, false, page, nchunks);
 	if (ret >= 0)

-- 
2.53.0

