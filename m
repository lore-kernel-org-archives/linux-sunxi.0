Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795223462;
	b=D6z3s3ckaGhGZpqaqsGwyszdpHrx1skeQUqx0XdEOyob7QHPZSSTfiA9LVSiYDkg37bZ
	 aTL4ktDDQoSOLoabKODUyw3tVhNJwJOel92CW6voASafeuZkEH3AfMxlZN1LUW5GGaC/6
	 mdbXdf4O3TyOODHwy2y1Ac/fCWzn0daKaYp/h9pxM460TDoqNXndrW/IQZTZGSiRYndFL
	 16PBosFnKGE8KFpdJ1XmxpiVrUy26yVo2GaSwukgeQW0fMWWvOQMXotD8O8Ez6SaJeYeS
	 SrKzQQqOiLYsW3kZDqKAdn+7vTebLT1hChGyiLJ8M30AOzfa3shbDk4YLbQlpONEVgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223462;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=SRAIIk9U6fp4Kf8B545qVrRs6kaxTJjBXvTeCKe8iRc=;
	b=Tf/TRhheATRgp+TztVLSfsT5gC6zs1Eum6imbmEJnYB/ru4OZoNryuLE1qBRUTP7Kunm
	 wyDa0xba7zxda6Z4nKJb8LZaKnYmNGwOTiHGlTbmpJmIQFtC7AbOIPJiB8BBQU0WimgIf
	 vg1z6x+1Uz8ipxUUiIep7/H5DpLitCz8/WMO99OQFbkhu3oINanKVpMbzja0GfMbjIJxM
	 eR6Yx4yT0FDxAONvKhvY2quWatVh0jFukpWoI5GKNI2RFEvv8JZhq1cwpgSswURX3+5wv
	 3sKPXa62Tx1aA1nSOFRMtj2iTVtsRIBW3KsA/4rkpplXaHruM98U8iDalFBlkrdtkvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KTx+2wHS;
	arc=none smtp.remote-ip=209.85.160.44
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938D560A2602
	for <linux-sunxi@lists.linux.dev>; Sat, 21 Nov 2026 01:10:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 938D560A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KTx+2wHS
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-49429181ce9so962259fac.0
        for <linux-sunxi@lists.linux.dev>; Fri, 20 Nov 2026 17:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223456; x=1795828256; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SRAIIk9U6fp4Kf8B545qVrRs6kaxTJjBXvTeCKe8iRc=;
        b=KTx+2wHS+6ar3aiNpQTLPjpCpwYr56+ArPxMzC8izjXBOf8XtyfdpAnT6yXZRUR6Rh
         B4cBRjJB93irqUQGADV8cJEXwEbmvKFpuV9g/s1WwybRqlkDtfPOsnyDfI70xRlgy6F8
         L86rwGA44sXfEjyGC86wrjN3QTN05tAW+0ivwuE+8inoHaBQCmc3qUQ17tvnli1/bfej
         iYVhsK8HgrJKLIjme1whpL1qIH5FB9nXFRSM+xCUbfM6tg0vtyb/U23myuwlWrSbCKwU
         Jvf8exLChR7quoYUpX7NuLOMJiD5useXZE9rQpDJxQO3KOhO7lgqXT/RHEBxhxZMPwHx
         Aw7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223456; x=1795828256;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SRAIIk9U6fp4Kf8B545qVrRs6kaxTJjBXvTeCKe8iRc=;
        b=gIwHC0/Di37mXrKCDl3KcZqRWSjpkvBZifI7JqBptM5xwlW7zWYoKyLeOOV+OyCRQ9
         nXJpz3lpzZeaD4zgYUE4ZSWWjCeUxFBv1Ew8jJKf7Vg96sqHimG1n+e/neuKICIZopc+
         jl0Qg2D9PrGaLf943M7reNyqMUM9ozOFJd4r6tZIDojFpw11P5ACuQjEdE7FtWO/UkMX
         BW4EPmuRybF/wFQLTb6gBdXFBpKoUOcqMAlncc9IFRXs9Dh7MAGA7vH2/JPV4xWqotq/
         ZC1wqwEy/8qEopsI5SY601g3ZeYZ4TTonqdWa0CVGxHMqvX5iULxGeXdDH0Twtyxv9/Q
         a7zg==
X-Forwarded-Encrypted: i=1; AL+hErGWKBWlpF2Nx8F7oi5yp8x1yFCOYOKsnmT1pC8RLY/ARDpJUNfIGFekl6RMAQWGLchMMuY5SEEiyd6A0Q==@lists.linux.dev
X-Gm-Message-State: APuU4Z/7lnykk4OwmufuZ+x6F+KfEScsxiVS6AdPLZy5nfjdOm5IVC0M
	4dwRGrFgJ6p/RjmGr5tCNdqKSKz8Ijh6UdwcCMn3qwbcHpTayb4d/b09
X-Gm-Gg: AYBFou3wIo7wMx8YAnatwHUAKrUfZwJIXgiN9aJD75Bh3vlqIJenh8bwkzRAM9UU2vc
	IypOKeo9T7eJX6wMt0tLJ1fE86Va14QjVYUoq4JCv7lx19Kh4OiOxuUHa83o+jFTtWlKbPgLRmo
	JbRGmW8l4Fh4sO9v+LHOdNcyHv6tV+FxzMFxUtUcuR6rzg2I5m55tdaDR3NLBslB7qvb9IzVepO
	cpr11ZWamrBHWgWzETWqa7ZHvGx96g+cTNOcHPBt+bhi85eRl6O+fHVOYW3v1lVoaGpIfyVl8hB
	sIqEhRCJjCQR1/h9YoNEbhppGwZf6Bxy/Xq3X848Ys+xJInKLyC4K1ednKMDbrWbBjXBFwLvFnW
	5VsvoZjyr3uXsdvs+P3JfnsbpDP1jdPLNtPyeJBxUyEQ1ZjHyuB/h5keetJKED9DGulrjSvxZ30
	l3tFyMUJOYeZ6znPy8x/IbiONCqAWAzyBE+uH4bpBQ0y+5C+X1MHgU9Aw/cieVfe8LlaV6itS/R
	8CO2UycP5q5B5+Cc1WnEblXb7jsMPGXQhmWuLV+CbO+AEOJfzickj4LikgZbL9J6aqj8NxnWEvR
	HlTFERAPdqqJa4yJNEb7R0daSJMgbVNW9dBchsMFEqoC8hUeAnA6Pw/HtqizRnpCsBBUWDIwXzb
	8RdS3Wcm8hyzormkNvDaNCmC3AIsoPB56ZfikiBF8oLUsEcXFEQ7JduRR5HTViNsjiURcJiumaw
	7vRUksyNynR5MOGfd7YusZfZBKeRJIUKiUnbfZX+yg6fiAlPqLTDy2
X-Received: by 2002:a05:6808:c12b:b0:4f6:5279:5c89 with SMTP id 5614622812f47-57a0b03f55bmr5137406b6e.47.1795223456322;
        Fri, 20 Nov 2026 17:10:56 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:10:55 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:24 -0700
Subject: [PATCH v11 01/26] mtd: rawnand: sunxi: select the protected OOB
 layout from match data
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
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-1-9721b1905ef4@gmail.com>
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

The ECC strength chosen at attach and the OOB layout used for page
transfers must reserve space for the same protected bytes. A10 and A23
store four bytes per step. Their strength calculation also reserves two
extra bytes for historical compatibility. H616 needs only one four-byte
word for the bad-block marker; after choosing the strength it can
distribute the remaining space among the steps.

Select the reservation and initialization together from controller
match data. Keep the fixed layout independent of the step count at
attach: the NAND core can subsequently choose a software ECC geometry.
The selected strengths and on-flash byte positions stay the same.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 98 ++++++++++++++++++---------------------
 1 file changed, 46 insertions(+), 52 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 66ce53850eef..c6001349266f 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -293,6 +293,13 @@ struct sunxi_nfc_mdma_desc {
 	__le32 next;
 } __packed __aligned(4);
 
+struct sunxi_nfc_user_data_layout {
+	/* Space to reserve before choosing the ECC strength. */
+	unsigned int (*min_user_data)(int nsteps);
+	/* Optional setup after the step size and parity length are known. */
+	int (*init_user_data)(struct nand_chip *nand, int nsteps);
+};
+
 /*
  * NAND Controller capabilities structure: stores NAND controller capabilities
  * for distinction between compatible strings.
@@ -302,8 +309,7 @@ struct sunxi_nfc_mdma_desc {
  * @has_ecc_block_512:	If the ECC can handle 512B or only 1024B chunks
  * @has_ecc_clk:	If the controller needs an ECC clock.
  * @has_mbus_clk:	If the controller needs a mbus clock.
- * @legacy_max_strength:If the maximize strength function was off by 2 bytes
- *			NB: this should not be used in new controllers
+ * @layout: protected user-data layout for the controller
  * @reg_io_data:	I/O data register
  * @reg_ecc_err_cnt:	ECC error counter register
  * @reg_user_data:	User data register
@@ -335,7 +341,7 @@ struct sunxi_nfc_caps {
 	bool has_ecc_block_512;
 	bool has_ecc_clk;
 	bool has_mbus_clk;
-	bool legacy_max_strength;
+	const struct sunxi_nfc_user_data_layout *layout;
 	unsigned int reg_io_data;
 	unsigned int reg_ecc_err_cnt;
 	unsigned int reg_user_data;
@@ -2026,24 +2032,35 @@ static void sunxi_nand_detach_chip(struct nand_chip *nand)
 	sunxi_nand->user_data_bytes = NULL;
 }
 
-static int sunxi_nfc_maximize_user_data(struct nand_chip *nand, uint32_t oobsize,
-					int ecc_bytes, int nsectors)
+static unsigned int sunxi_nfc_fixed_min_user_data(int nsteps)
+{
+	/* Preserve the ECC strength selected with the legacy BBM allowance. */
+	return nsteps * USER_DATA_SZ + 2;
+}
+
+static unsigned int sunxi_nfc_variable_min_user_data(int nsteps)
+{
+	/* The first protected word contains the bad-block marker. */
+	return USER_DATA_SZ;
+}
+
+static int sunxi_nfc_variable_init_user_data(struct nand_chip *nand, int nsteps)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	const struct sunxi_nfc_caps *c = nfc->caps;
-	int remaining_bytes = oobsize - (ecc_bytes * nsectors);
+	int remaining_bytes = nand_to_mtd(nand)->oobsize - nand->ecc.bytes * nsteps;
 	int i, step;
 
-	if (nsectors <= 0)
+	if (nsteps <= 0)
 		return -EINVAL;
 
-	sunxi_nand->user_data_bytes = devm_kzalloc(nfc->dev, nsectors,
+	sunxi_nand->user_data_bytes = devm_kzalloc(nfc->dev, nsteps,
 						   GFP_KERNEL);
 	if (!sunxi_nand->user_data_bytes)
 		return -ENOMEM;
 
-	for (step = 0; (step < nsectors) && (remaining_bytes > 0); step++) {
+	for (step = 0; (step < nsteps) && (remaining_bytes > 0); step++) {
 		for (i = 0; i < c->nuser_data_tab; i++) {
 			if (c->user_data_len_tab[i] > remaining_bytes)
 				break;
@@ -2059,12 +2076,21 @@ static int sunxi_nfc_maximize_user_data(struct nand_chip *nand, uint32_t oobsize
 	return 0;
 }
 
+static const struct sunxi_nfc_user_data_layout sunxi_nfc_fixed_layout = {
+	.min_user_data = sunxi_nfc_fixed_min_user_data,
+};
+
+static const struct sunxi_nfc_user_data_layout sunxi_nfc_variable_layout = {
+	.min_user_data = sunxi_nfc_variable_min_user_data,
+	.init_user_data = sunxi_nfc_variable_init_user_data,
+};
+
 static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
-				       struct nand_ecc_ctrl *ecc,
-				       struct device_node *np)
+				       struct nand_ecc_ctrl *ecc)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	const struct sunxi_nfc_user_data_layout *layout = nfc->caps->layout;
 	const u8 *strengths = nfc->caps->ecc_strengths;
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_device *nanddev = mtd_to_nanddev(mtd);
@@ -2083,33 +2109,7 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 		ecc->size = 1024;
 		nsectors = mtd->writesize / ecc->size;
 
-		if (!nfc->caps->reg_user_data_len) {
-			/*
-			 * If there's a fixed user data length, subtract it before
-			 * computing the max ECC strength
-			 */
-
-			for (i = 0; i < nsectors; i++)
-				total_user_data_sz += sunxi_nfc_user_data_sz(sunxi_nand, i);
-
-			/*
-			 * The 2 BBM bytes should not be removed from the grand total,
-			 * because they are part of the USER_DATA_SZ.
-			 * But we can't modify that for older platform since it may
-			 * result in a stronger ECC at the end, and break the
-			 * compatibility.
-			 */
-			if (nfc->caps->legacy_max_strength)
-				bytes -= 2;
-
-			bytes -= total_user_data_sz;
-		} else {
-			/*
-			 * User-data lengths are encoded in four-byte units. Reserve
-			 * the first word because it contains the two BBM bytes.
-			 */
-			bytes -= USER_DATA_SZ;
-		}
+		bytes -= layout->min_user_data(nsectors);
 
 		/*
 		 * Once all user data has been subtracted, the rest can be used
@@ -2173,20 +2173,14 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 		return -EINVAL;
 	}
 
-	/*
-	 * The rationale for variable data length is to prioritize maximum ECC
-	 * strength, and then use the remaining space for user data.
-	 */
-	if (nfc->caps->reg_user_data_len) {
-		ret = sunxi_nfc_maximize_user_data(nand, mtd->oobsize,
-						   ecc->bytes, nsectors);
+	if (layout->init_user_data) {
+		ret = layout->init_user_data(nand, nsectors);
 		if (ret)
 			return ret;
 	}
 
-	if (total_user_data_sz == 0)
-		for (i = 0; i < nsectors; i++)
-			total_user_data_sz += sunxi_nfc_user_data_sz(sunxi_nand, i);
+	for (i = 0; i < nsectors; i++)
+		total_user_data_sz += sunxi_nfc_user_data_sz(sunxi_nand, i);
 
 	if (mtd->oobsize < (ecc->bytes * nsectors + total_user_data_sz))
 		return -EINVAL;
@@ -2233,7 +2227,6 @@ static int sunxi_nand_attach_chip(struct nand_chip *nand)
 	const struct nand_ecc_props *requirements =
 		nanddev_get_ecc_requirements(&nand->base);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	struct device_node *np = nand_get_flash_node(nand);
 	int ret;
 
 	if (nand->bbt_options & NAND_BBT_USE_FLASH)
@@ -2254,7 +2247,7 @@ static int sunxi_nand_attach_chip(struct nand_chip *nand)
 
 	switch (ecc->engine_type) {
 	case NAND_ECC_ENGINE_TYPE_ON_HOST:
-		ret = sunxi_nand_hw_ecc_ctrl_init(nand, ecc, np);
+		ret = sunxi_nand_hw_ecc_ctrl_init(nand, ecc);
 		if (ret)
 			return ret;
 		break;
@@ -2725,7 +2718,7 @@ static const u8 sunxi_user_data_len_h6[] = {
 
 static const struct sunxi_nfc_caps sunxi_nfc_a10_caps = {
 	.has_ecc_block_512 = true,
-	.legacy_max_strength = true,
+	.layout = &sunxi_nfc_fixed_layout,
 	.reg_io_data = NFC_REG_A10_IO_DATA,
 	.reg_ecc_err_cnt = NFC_REG_A10_ECC_ERR_CNT,
 	.reg_user_data = NFC_REG_A10_USER_DATA,
@@ -2748,7 +2741,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_a10_caps = {
 static const struct sunxi_nfc_caps sunxi_nfc_a23_caps = {
 	.has_mdma = true,
 	.has_ecc_block_512 = true,
-	.legacy_max_strength = true,
+	.layout = &sunxi_nfc_fixed_layout,
 	.reg_io_data = NFC_REG_A23_IO_DATA,
 	.reg_ecc_err_cnt = NFC_REG_A10_ECC_ERR_CNT,
 	.reg_user_data = NFC_REG_A10_USER_DATA,
@@ -2769,6 +2762,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_a23_caps = {
 };
 
 static const struct sunxi_nfc_caps sunxi_nfc_h616_caps = {
+	.layout = &sunxi_nfc_variable_layout,
 	.has_mdma_desc = true,
 	.has_ecc_clk = true,
 	.has_mbus_clk = true,

-- 
2.53.0

