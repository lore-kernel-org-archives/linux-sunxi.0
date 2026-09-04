Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDC83E5EDA
	for <linux-sunxi@lists.linux.dev>; Fri,  4 Sep 2026 21:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788557021; cv=none; b=ZS9HS2UfgG0/fMWAe41Tw2POA1d5lDVFN1X8BJYoIEX+gIJEBhgc8E/PUFinZviQvb3jRIOpMfcSey+C9xQ3/rjKG2xl9HK/KF1GNxYmGYu+rLRsIs58J16fzij0wNCECRkz//qHcECI7cvGDagirUG5eWqz9qSM7abxmDmHGAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788557021; c=relaxed/simple;
	bh=F/EHqkFfSe/60Ki8YqKwL1Qg0R+is8WeugnWTveWoZ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=buUqJox7eiMtNHnS9rHA1yPGVPvk50MtyjR8FFGt+mZ3SDCgSKePKYLgBKjDklWiLZF6gS66MD0XMU0e/hfp1idO4g0T2SjLwSAUQrxAx2CjeeDrucLi8lJB0kqxBiI5pp9GF8vysRMqZWwNUGLlv7tCpv8Of1JtY8gSHQg7nsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E+lZtm8V; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E+lZtm8V"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6b1b1d128a0so1533201eaf.0
        for <linux-sunxi@lists.linux.dev>; Fri, 04 Sep 2026 14:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788557017; x=1789161817; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1XQ+Ej6D/KOaX2kDDZnurX6Kn6xIUtOZZNoB4S54GFs=;
        b=E+lZtm8VL0wzAsTFO3elbqV6kL6GgDpFZvG1Xd1nhef3at/oIAjDCUbwZJURr1jpIc
         yWp851o9KC5yG18Yd+Ua2oNghojWPQq0bVwP5+LNx6156EAelwu9DEw7caKqx8Q05kZT
         DATJGZybMSB1HiQ/QiFROEBmqEP8o6h2sv7TE7txzVPoLV7AxS0KYaFKbUJQ30qi3nm7
         1cyQhlpndZmrCLuOPKo8RpsYfUYxg443I+KvIpLgqvGhz1Ak4PJmjuW5brrYhfLvkW7V
         7Cezd6o1ieMWwcItAthjkawgrGallc2zbl2hLiBJs6m7hzvqsZe7SXAyaNLSek11uNl3
         d5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788557017; x=1789161817;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1XQ+Ej6D/KOaX2kDDZnurX6Kn6xIUtOZZNoB4S54GFs=;
        b=Umagbws2OmGyrh4qXU5DkkfNilLEaN+BpubSZ5txrwlbRoY2bBV/wAF7D3zsXUR2Vo
         qvszI9vn1r6Vz0dAfo2hWB2SIhORLnLYZL1kdZ6ZdRalj28buy/d0/RLe33sldXPP1kM
         m6QbQZVazJ7d8lQVLAedRah0SRdPboL9I7p5uEm+qyU1CBCVAJLelOCbtluMkIxjiLs/
         ak2m1zm1m3rRN1TEXpvqOrw2YW/d3WIgHRKA8etjkCVhOxT/WnmW6T7Fnj4evaaVir3u
         gFKG8mh60yHcZrg7UPEGDA0qvfhH84cEUHmOwF47jQtQUwE5XbnnMN33jIfEey3t5vEp
         vt5Q==
X-Forwarded-Encrypted: i=1; AKwUvBysVRl6UkQN0JpfVLMeGZ3NNmIBOQc+SFMWxEbSCGnM09qpp0t8TyFjz4maPlvKTBAzaBDqQwC4JU6VAQ==@lists.linux.dev
X-Gm-Message-State: AFuF++kiadOfsolPoM5MVOS0ENbAflQ1uDkZr2nh/0Z8X2aNCAPf46RU
	X1iB0RIKrGq2VyWQ2uDW15lGEuZ1qNLGqOyWwqn0NNd+fC4nZSaJfjt4
X-Gm-Gg: AYBFou1+ibH6bcPo3pwYGN36An3HXsDi7UYCOf0CW6m+oSNAq9Ue74gckSJQWeTc7p9
	En2qMYNLbXOnq3Vp/9+CTkqgf+6mmdJjnqCoVubT7jd9Uu36JuAvPdCSKgD7Xv7++JKtz5Zpvol
	WUdDK2qylj9AiUcLW4nYDr+2ytCrel5a7UBqqDhmwe7BjGGywtxuzktFF64nUJ69UW6nDE7xbcL
	xdyjUg4cYEi/7KRWJhBLfwo/Jfti6UspO9Z95fMq1uM4QPOw9he+HJDf7yefaDyRhqJmpwZ/pGU
	DbxKEtcLYP0p1Y1466rOryIs8nnfsL+smpgT1Us/3rXUviaWJoEEQksupLHy+v8hlBwiLvq1bE5
	yAKaPvNkERWx5GOVRfY2KJgBUAlP+0hWvgVxTGCkc3A7E2/yDKv07JpDEFwpz3POmNBObM9XQLS
	29hJuOtkurGRBn09T8NpKgTSGzitiGTgMH15xh0bSMBHjoFScAJqaVuhfHHZ+MCK2+mWGiTjm1e
	aSolvkFssLfegXS10c8VA2f952DsRCV6lVDcOXSc3GDHA1oaghLwPfR8rAgYKR1XmDqDiFbzmF8
	c++SedCUfgRHxwrs4+hWsrKk40+P2QZBwpmYO9lPqpMI693L6+JXKLVlzJrrhOmopTviv730zro
	NJiLYcIEIsTJ5A35Jhlo=
X-Received: by 2002:a05:6820:60b:b0:6b5:ec3f:4988 with SMTP id 006d021491bc7-6b72054580dmr2866500eaf.35.1788557017178;
        Fri, 04 Sep 2026 14:23:37 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6fasm4492259eaf.3.2026.09.04.14.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 14:23:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 04 Sep 2026 15:22:12 -0600
Subject: [PATCH v2 2/3] mtd: rawnand: sunxi: support randomized OOB formats
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-2-b12074f4aca7@gmail.com>
References: <20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-0-b12074f4aca7@gmail.com>
In-Reply-To: <20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-0-b12074f4aca7@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The controller randomizer covers the bad block marker along with the
rest of the OOB data. The driver currently compensates the marker bytes
before writes and after reads so that they remain plain on flash.

Allwinner NAND firmware instead stores the marker through the
randomizer. Media using that format appears to contain bad blocks unless
the randomizer is enabled while reading the marker.

Honor the allwinner,randomized-oob property by marking the NAND as
requiring scrambling during normal hardware-ECC transfers and leaving
the marker in the randomizer data stream. Keep the existing plain marker
behavior when the property is absent. Reject the property with software
or disabled ECC because those paths do not operate the controller
randomizer.

MTD_OPS_RAW behavior remains unchanged: raw accesses bypass both ECC and
randomization and expose the physical representation. The raw-NAND
core's bad-block and flash-BBT paths use decoded accesses and therefore
continue through the hardware-ECC/randomizer path.

This changes marker handling on all supported controllers; the H6/H616
protected user-data placement is handled separately.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 83666dd6cb2a..c1246a9268ca 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -265,6 +265,7 @@ struct sunxi_nfc_timings {
  * @clk_rate: clk_rate required for this NAND chip
  * @timing_cfg: TIMING_CFG register value for this NAND chip
  * @timing_ctl: TIMING_CTL register value for this NAND chip
+ * @randomized_oob: use the randomized normal-page OOB format
  * @nsels: number of CS lines required by the NAND chip
  * @sels: array of CS lines descriptions
  * @user_data_bytes: array of user data lengths for all ECC steps
@@ -277,6 +278,7 @@ struct sunxi_nand_chip {
 	u32 timing_cfg;
 	u32 timing_ctl;
 	u8 *user_data_bytes;
+	bool randomized_oob;
 	int nsels;
 	struct sunxi_nand_chip_sel sels[] __counted_by(nsels);
 };
@@ -945,8 +947,9 @@ static void sunxi_nfc_hw_ecc_get_prot_oob_bytes(struct nand_chip *nand, u8 *oob,
 		}
 	}
 
-	/* De-randomize the Bad Block Marker. */
-	if (bbm && (nand->options & NAND_NEED_SCRAMBLING))
+	/* Undo hardware de-randomization for a plain on-flash BBM. */
+	if (bbm && (nand->options & NAND_NEED_SCRAMBLING) &&
+	    !sunxi_nand->randomized_oob)
 		sunxi_nfc_randomize_bbm(nand, page, oob);
 }
 
@@ -1006,8 +1009,9 @@ static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
 	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
 	u8 user_data[SUNXI_NFC_MAX_USER_DATA_SZ] = {};
 
-	/* Randomize the Bad Block Marker. */
-	if (bbm && (nand->options & NAND_NEED_SCRAMBLING)) {
+	/* Pre-randomize the BBM so the hardware writes it plain on flash. */
+	if (bbm && (nand->options & NAND_NEED_SCRAMBLING) &&
+	    !sunxi_nand->randomized_oob) {
 		memcpy(user_data, oob, user_data_sz);
 		sunxi_nfc_randomize_bbm(nand, page, user_data);
 		oob = user_data;
@@ -2229,6 +2233,8 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 
 static int sunxi_nand_attach_chip(struct nand_chip *nand)
 {
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	const struct nand_ecc_props *requirements =
 		nanddev_get_ecc_requirements(&nand->base);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
@@ -2238,6 +2244,14 @@ static int sunxi_nand_attach_chip(struct nand_chip *nand)
 	if (nand->bbt_options & NAND_BBT_USE_FLASH)
 		nand->bbt_options |= NAND_BBT_NO_OOB;
 
+	if (sunxi_nand->randomized_oob &&
+	    ecc->engine_type != NAND_ECC_ENGINE_TYPE_ON_HOST)
+		return dev_err_probe(nfc->dev, -EINVAL,
+				     "Allwinner OOB format requires controller ECC\n");
+
+	if (sunxi_nand->randomized_oob)
+		nand->options |= NAND_NEED_SCRAMBLING;
+
 	if (nand->options & NAND_NEED_SCRAMBLING)
 		nand->options |= NAND_NO_SUBPAGE_WRITE;
 
@@ -2467,6 +2481,9 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 	if (!sunxi_nand)
 		return -ENOMEM;
 
+	sunxi_nand->randomized_oob =
+		of_property_read_bool(np, "allwinner,randomized-oob");
+
 	sunxi_nand->nsels = nsels;
 
 	for (i = 0; i < nsels; i++) {

-- 
2.53.0

