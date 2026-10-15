Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDF833F58D
	for <linux-sunxi@lists.linux.dev>; Thu, 15 Oct 2026 01:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028059; cv=none; b=I1WfWoZEQpZDVHdNmo7rV9iidW+gzzrmNbUxGbpxQXDJ6wnGE63FdaNSiIWCLHt9r3UM30/5gB/9dBtOaUg63s6RnSrfUQLvYtSDfCdEVkYzUGPBuNhz0wdhBYbJ/Zf6iaqAqw2+2T9G9b5QmyiLaUr2YX+E9J7x1xKjRBb3cHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028059; c=relaxed/simple;
	bh=5swNrnjhpqGxZeyGDlWe9TNZCEAsFDPalqzTOJ3Aefg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hsa/BKAIjRZj3esfhMZtvAx4fkMiaKNdUZeV4Ky7QDYoLf6c2E9/J/jndc6qTAGLCGtl5IlOSji/SduJIpLkDqEwJPeGwmmOTOQsvT4BpRi74l+RK6YuNfX9h8hn7cElonE3I0lfWknsTDAfr2xrPlO0Xty1qbUGkF2c7kgtN7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WmSYQ08i; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WmSYQ08i"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4b21f71613fso3041909b6e.2
        for <linux-sunxi@lists.linux.dev>; Wed, 14 Oct 2026 18:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028056; x=1792632856; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hlWVFZs9qMdbAGtAdGz2zNdnsjoirOAt+ztYuqFoEV4=;
        b=WmSYQ08iY2tvForWvkX21Eb7gSjWGWzxtHfHpIX+u3sG+81+seMWESPPoDUrTKUIED
         9zdC4FR+A36vGkOD90lAg7EXfksWLiaWvOx3eBK5V0gTUoWFbjEUHbHSULS8ba069d42
         0fvSXqNDcx/oaweVGrqk5j0dIPnB47402lCXRFz9PfvR50Tbtl//O3eizwdE9mgkSSsa
         Hs6Vc3navssuDigo7ljETVjGzZS2qnS1V5Ck2nfpmMsvUAoThb+IWKrwuu5nrXmrVYYY
         wDLS5nOvlHNkF0+4blUrC/7mEH12TcuiQQOWYv9OSFhUg06nmt3wnRD8PZob+PxsXcMH
         VjgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028056; x=1792632856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hlWVFZs9qMdbAGtAdGz2zNdnsjoirOAt+ztYuqFoEV4=;
        b=GEFSsxl2mJNlslFhJQtqI5WDKVxMpfPDep33mlMKsv9CVXeLcSdBICVvWdZXuR2WAD
         b2gUfDGypfyZE/zA2dXRVoplNBY2SycqkGGEbDY74x5nKf65jwJN111+TUyCZHvnV6hh
         AIO37ggvsMtPscqWP2FMJytoZRLZEXlFzju9MspLMNwY7ORzaWVhi1e+YtYfZnzBvHAk
         jdMg84d8eaW+OxW1H0yJ8+s+b759QZSoH4X+qLiM/WjdwojpLo0meMIRnCNR1bESpWmt
         8OIv2eh+PnpSviptBClVpOrKIURn0F7I4yYTOKYKQCccUUK7IyAw7wptWfN34E4ev2gs
         d8sQ==
X-Forwarded-Encrypted: i=1; AKwUvBwOWfohoKcLEc0qS4Cdi3zNjD5UAlD16jhh8tt094MwM90AqIBet/Cz5iipgXrcvZB8zT/7HFcJyHt/Gg==@lists.linux.dev
X-Gm-Message-State: AFq9FYJpXhdK6HjOKndzlQUAilLFE+OYZQEXVlTdTkAedAsm0JlgUDF/
	2r5+SThERTFfpJMmN/8pLanAAvcRqabv7RHQmI/dKslIrWljMmH2x5p+
X-Gm-Gg: AYBFou1m5IYMzgY6FGeBZ7PMSJXt5ELiVBqO+m02B2JgWpIE8+Z6dRWMn1rWpEOtxNy
	ybVwV+TDhWzAUKWt3Bd7q0czS9kMtsrBT/HtSaoixtbj0GyjnZgwBhxkGwl0gqrnB3zqj12EM9/
	a9LQdpQU5MRtDI70ILb9AEAMxkO+iFM5ewwqBIyUqyCbwfIetfhi/VWMKej8+iLCm8MDa6/5vfW
	9kkZeOlI73FTZsRS/Fyci7fMr6n7dvoaWjcjDeRESDTH/UdVZzzRhoPXY72N0gRYqp4Cvp+FHlV
	5xvfIN/VYREmroiaC06C/wJYSDlWKQgLopXgHnqOLe4ftTQtPSf8PCJMWt/pwTUF36ZoYYsjSHA
	UiI3cX77kT8doQ0k4cyNfumBIPCMTa0jxmIr5O0t5H8W/O6Klcng0b3MhrsT8IUywDOlUJ5BevA
	iim6HNy8SMJQV/P50GgMRzeM+h5YCEc/tEUQmsgOSuCuqP8Ss4LcNb3Ca+C+hK+hhTGp/wlCAZD
	RfprdkK+JbJX8S/OzMbUDgcSnnG/vsNUJMsy02EJxJpn5eUWERVYU2s50m3UVw33JgXVjsWIJiS
	lGiRVK3Id1nZO1HbVlQXZ1VJAVIrCSFuLJDjY/H12+oeKEnkmj7rOv1/kDgGgT1ndqd6M372R04
	N/KTRFo9OtEPm3YF6+ZVa
X-Received: by 2002:a05:6808:251a:b0:4cb:818f:d56e with SMTP id 5614622812f47-50c4c7a2fbdmr18782064b6e.22.1792028055832;
        Wed, 14 Oct 2026 18:34:15 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a6dfb41452sm3428139fac.4.2026.10.14.18.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:34:15 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 14 Oct 2026 19:33:50 -0600
Subject: [PATCH v7 03/16] mtd: rawnand: sunxi: propagate page-setup and
 erased-check errors
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-3-5d3fc6ad2da1@gmail.com>
References: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com>
In-Reply-To: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com>
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
index c2e97b8656f7..6c0d3e2d2be2 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1030,7 +1030,10 @@ static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,
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
@@ -1042,10 +1045,16 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
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
@@ -1308,6 +1317,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	struct sunxi_nfc_ecc_read read = {
 		.buf = buf,
@@ -1315,6 +1325,8 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
 		.oob_required = oob_required,
 		.dma = true,
 	};
+	unsigned int corrected = mtd->ecc_stats.corrected;
+	unsigned int failed = mtd->ecc_stats.failed;
 	struct scatterlist sg;
 	int ret, i;
 	u32 status, pattern_found, wait;
@@ -1366,9 +1378,19 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
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
@@ -1456,7 +1478,9 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
-	nand_read_page_op(nand, page, 0, NULL, 0);
+	ret = nand_read_page_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
@@ -1464,10 +1488,11 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
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
@@ -1480,7 +1505,9 @@ static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
-	nand_read_page_op(nand, page, 0, NULL, 0);
+	ret = nand_read_page_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, oob_required, page,
 					       nand->ecc.steps);
@@ -1505,7 +1532,9 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
-	nand_read_page_op(nand, page, 0, NULL, 0);
+	ret = nand_read_page_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
@@ -1514,10 +1543,11 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
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
@@ -1532,7 +1562,9 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
-	nand_read_page_op(nand, page, 0, NULL, 0);
+	ret = nand_read_page_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, false, page, nchunks);
 	if (ret >= 0)

-- 
2.53.0

