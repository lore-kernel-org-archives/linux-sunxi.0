Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904954;
	b=TcRDC+pEjdrQOMJ0onYUNrjC0dvPpSIjglyGMGTTJMDXRUD5YrfNjh3FIzS1kO80FJBF
	 Km9MhZobrfMjLd2UrFWnMxxL99ZxUXcCPsj5zPQYd/lC5RF07okdnuPBNNs2KkNqXAe88
	 mMksYTT3+HniT4cnCYPFS6MJXc0lWl9f6f85D6bvpoz8jwl8a1CUkfHirjW4Vx5csTs/9
	 X+0ArAKyC8PG1m0w0G/fX0w038YLV4OWhw14da3lL7PiHru8U3cgNP7q7Tc1bt7G3TBu7
	 hZPmYRKsyJ1lO8G38rMKCnX8QAUHgN7pv95tfB8nGUioE9L59dBvTaXjgdLPBZxj7EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904954;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=TewWxDRlBExCimd2doTjt5ku/ZOc7YaK3BqCExDTIIk=;
	b=wgcHMv8EwpYrhg55ZwR92rWw2lZYIlLwKj6foV2qbd/JKbgynemPfc50cQM7qrRypy/h
	 N7mNcFwiDLXecFjSm4r9luwzOrKcAbLf6qLhbSVJjhomk07vzwFCR5reYVZ4K+QcU/I4D
	 CuFyuw15lyju1+DiAjjbwvsGdDzWoAAsaS4q4ebwvmXQxthkCby6QoW6LAPW78H1UWN0V
	 6XndVG4HRTqbL7Mi5eSMI6JkMyrBLsV3HVzBTEjHu3gXv1vyZsGq1swIXrwQyCl0xZUVt
	 7xIVOMXXW+PGvfthF7SYN6Zn5GdjRntOIs/NwhPF9cKR3gouJFfgPru07CUa5OA/qlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="d/v+FahZ";
	arc=none smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E716082BCC
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Nov 2026 18:55:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91E716082BCC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d/v+FahZ
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6de2f213b7aso1047859eaf.0
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Nov 2026 10:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904953; x=1794509753; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TewWxDRlBExCimd2doTjt5ku/ZOc7YaK3BqCExDTIIk=;
        b=d/v+FahZhW7GnTuC+eaQgIu7UwPOo0PzDvbDOVLaFlajd4m7mrc2e3CgxZHRWv4j/I
         aJRodNTm/zRQl1bKhpHnpBHy06fmSkAymLCDBf9YSzdcDCJ3oEfUYin/1HOiYaOrkjuP
         H8EmyKxP2oTPtmBcTneOd2mljwmU1xWNP04ViOYeSWm5RmNZYAJF32N8mkdgZQ73uv5Y
         7G/QlhvS2nG+31uNgp3YnMm49Ha6uzJmsoL+yXiphs2InmYw8OrRdwlqjYRrUHddBA7S
         XNxkNfesz2HOtA80Ey4HF36bDhV9OFr1Y1wRocgwTjrLLgQfd91yqxVK0b2iLGOGQMgP
         nKfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904953; x=1794509753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TewWxDRlBExCimd2doTjt5ku/ZOc7YaK3BqCExDTIIk=;
        b=1z+7J1sosGC+NB0V041/GL+vfTFK/T6KO9R/3ycmBKKx6O/8SBSb+oHwM8D6zB+psg
         hc9HVPw7WtCbb0A98x6f78mxEpmC/1a6pX8inCYxUHg7V0PRKXLYCfzjEVWDybRbWlwC
         1DbyJDnI3x5usUDJQGLPYVulWedgqMd1/OZro/Yu82t7YsfRMUvcieHbIes6kPNiMAdw
         5AN4HJDKGMK5CAXMEGKBIKzoTj1l/wt+7eKXgmCWwiWaGfmKqyuRpNNy4k/nRtx7uqNn
         hW09eotBr/l7S3ZLiFa0sBfKc8sBzPddJIhQ8RVXfKR++8GcWHtcYXymVcch8rk+jxjL
         YN/Q==
X-Forwarded-Encrypted: i=1; AKwUvBzPRGKG7f9N/mMhd1GJkCXE2MdCOOGf7fGFTbjDpUeF/ueK6fJdVNH/8d1p2XE9DV0ZzTSM7/PswvCxeg==@lists.linux.dev
X-Gm-Message-State: APuU4Z8ZNvI4XKE9Q2vFy3v9+itxfW3NFXtq4hvot5GDkJhNbSPzQeKH
	nmYlcc6OSRKlK+f3qxxOgJsQDvVFg0+odvgj02uLk7PoxeP1Yxxaq/G2
X-Gm-Gg: AYBFou0rFbHWruQ1cO6fomGQ9uHMFtiuhv9/OzjTEG1a5nVpXpsFqxGL89or20NWovA
	nL8zFIws7p7atDQZltyEF6oc5uBxBNRcBrdcqdZRIG8Z66cibhhvgyYN6hr+YmZiqfKX9sD/17b
	Dd+7uXCQkEppf720k3FcIWYbAoNJtQ/aQDb2ndH4gOB26AVRqeGmc37Y0yd+FauT1wii/zqMBvr
	fXU7ZmeyKAfF1Hy3brnIALJqIJJdlPLtV/kv4ORYJEzMOC5fhLCxAzhgNhpTJNnqf67gr8iaJ9F
	A/xNGwk1d++y1y9WvKPrVAVAU7OYsazOTJWc68pjC2tf0nD/+6bFnwC/xG/+q2BfrW91EIVLgEk
	/c+sm6YKRf/+FZryi8fT7lBi3D8FLa4bIzqt1vJNm5Yq92aEBt6LW/3n+2wP14EUjN6B+s8pzub
	tsIVz4Fbo3EQpR7f7yZ3o5naijzUZhlbNH+oiAtD68o8LvxrpjlIYVMk8EPTBfjfhVg2cfZ2kq9
	EiSvp/H0MArRrZJsSl/KAR70HmV4XyCyoK3hAPViCsSjxraWV6dHB3aL3TcSKJPbdGtotrnXdsi
	rrZbe6J8uQvjHgAfnYTmXRTRZtJx/pADRIvCKFqg3TpZuQUuOorV1HS8vH7wLk3CbnybNbz5zQp
	0dnN/SJ2vmxnNOeQivIcdY/R4K0rHbp6ULIwGctfIo5A80xc9LVwN7HNONAHn4MfZmTQKQ1Hybs
	X28IrDv1bFhDKvii3Og0nGLEndfqEHbXroPDUvRAXb+poaj17a7SsI
X-Received: by 2002:a05:6820:340b:20b0:708:ccf9:886b with SMTP id 006d021491bc7-716e79e8540mr267932eaf.84.1793904953478;
        Thu, 05 Nov 2026 10:55:53 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:55:53 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:29 -0700
Subject: [PATCH v10 13/26] mtd: rawnand: sunxi: use page reads to
 reposition small-page NAND
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
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-13-dca1f6ed29a8@gmail.com>
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
 devicetree@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
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
index 5f57c5998f03..931d437e196b 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1077,6 +1077,16 @@ static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,
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
@@ -1085,7 +1095,7 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 				       u8 *data, int data_off,
 				       u8 *oob, int oob_off,
 				       unsigned int user_data_sz,
-				       unsigned int *max_bitflips)
+				       unsigned int *max_bitflips, int page)
 {
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	unsigned int oob_len = ecc->bytes + user_data_sz;
@@ -1093,13 +1103,12 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 
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
 
@@ -1201,8 +1210,8 @@ static int sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
 		return 0;
 
 	if (!cur_off || *cur_off != (offset + mtd->writesize)) {
-		ret = nand_change_read_column_op(nand, mtd->writesize + offset,
-						 NULL, 0, false);
+		ret = sunxi_nfc_read_column(nand, page, mtd->writesize + offset,
+					    NULL, 0);
 		if (ret)
 			return ret;
 	}
@@ -1268,14 +1277,14 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
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
 
@@ -1310,7 +1319,7 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 		ret = sunxi_nfc_hw_ecc_read_error(nand, read->buf + data_off, data_off,
 						  nand->oob_poi + oob_off,
 						  mtd->writesize + oob_off, user_data_sz,
-						  &read->max_bitflips);
+						  &read->max_bitflips, read->page);
 		if (ret < 0)
 			return ret;
 		if (ret)
@@ -1350,7 +1359,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	int ret;
 
 	if (*cur_off != data_off) {
-		ret = nand_change_read_column_op(nand, data_off, NULL, 0, false);
+		ret = sunxi_nfc_read_column(nand, page, data_off, NULL, 0);
 		if (ret)
 			return ret;
 	}
@@ -1360,7 +1369,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 		return ret;
 
 	if (data_off + ecc->size != oob_off) {
-		ret = nand_change_read_column_op(nand, oob_off, NULL, 0, false);
+		ret = sunxi_nfc_read_column(nand, page, oob_off, NULL, 0);
 		if (ret)
 			return ret;
 	}
@@ -2326,7 +2335,8 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
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

