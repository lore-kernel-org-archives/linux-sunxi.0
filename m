Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4B3364933
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Sep 2026 03:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789354922; cv=none; b=qVkJa/jgaTuGvTWHUNLYphOTf3eZaMR0OTDxziwCzHLOSJnAxlSHr1r6f5uwawHedEKcZhJRsPMA0iHVvz/hwJXRpgokMoXXsfo927saB171WJf4w9J3WNgNGim49SFqUUQpGNrifHPoBkhVMhZS301OQ69vdE/yheH6pTj0EmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789354922; c=relaxed/simple;
	bh=InyBxnnGJUHrfGks0KD/ITzfsd5gn5CTfPJ5EvLq/i0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pKtxXM+LtscGnUU4BVSdKrh8FycKaweLeNZsJs85KEX0FHZcoSDhOePlyPv7JLaGwppLO5+EIx0O399nGkZj7p2BIJT34WHIinnGR6Qtt3A/4wnkf0IjpgGKjKDWWm02ifJJmloYPeQofQI50cDNmKIrWL+hjR0wXTTchwK4Vk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V4WQaNzx; arc=none smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V4WQaNzx"
Received: by mail-oo2-f42.google.com with SMTP id 46e09a7af769-7f4f0dd550aso216253a34.0
        for <linux-sunxi@lists.linux.dev>; Sun, 13 Sep 2026 20:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789354919; x=1789959719; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wD0VAfBnkJ1JCjUlJIh8uFV9v+cdt2HXmo4JRu4mOC0=;
        b=V4WQaNzxcdbJTIAgBKEVSIGmwSe3Eymj0dAnTI50AMroh2Nupmley3KM+tKAmT9Jhh
         h+1RV+qIkbkXkgu0gUPPFJAbTrazMY084LXMs/z7FHX6yLPIhGSKbFO93BJJz9qSxeul
         r3+vkj50J8APbmlAgIgWBOt3gUOHy7gNKOcZSbYlw5oHmMLemAblBIQsDGTKc7NO0NUe
         EPS+EBtayVHbOmrm7CTGdu8SEkjbMIC9B/bYP/U8WABUYEpTBhhhwBpyaFDPlv5bvgk+
         RyUmdtQDWRG0sPCt930/hf8Aaotds3B2VTVoTBhU8HKL4ADFCiWmMWsy0DcSLbn7b/HK
         1pzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354919; x=1789959719;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wD0VAfBnkJ1JCjUlJIh8uFV9v+cdt2HXmo4JRu4mOC0=;
        b=H2C2wRbwQf0Rh6NCNN5YNTzx2KReAIh0+NRrXD9ibU+47lczbCqYjnG4AiNLAzbFi2
         UA08MDK7CruWcdfHlZ982OntCmeID4jU8s/9zu5JVuUoDbikeiObWjSTXgkLGaKGQvDt
         PlpvvJG7nC+ci6H8jNGUbbvpDQ+rfECRAh9gJ5qUtYqwKmH7dvywdKNwMz9JPitPAKgf
         RXTRHWGRQvD2u+uufT2gY/s4kYTbBxZYrrHk3bFj3/TQNnY7kBBeSA6cEfJWQ5jlGHjL
         9tL5yooaSbyY4O4lnNEPCRXkpBp9XmXKLo3bLOqg2ARyAPdmkNxL4V26FhmQ9bG1uL5m
         EH7A==
X-Forwarded-Encrypted: i=1; AKwUvBzfp7RfR6XsWPSt+YzJqsmajpU5/jnEkp5nQU9WQgnNQaAcU2TWYfMPZShR2UGiWobkL+Low0lJQ8VTHA==@lists.linux.dev
X-Gm-Message-State: AFuF++mPpgh5juNzU6UlySnlPd27TmTiV6NDe0ymEIEQyHo3sTN0tqgT
	1Ijd9UMf0ZfTRvli42ifuDrWXPjsvg+3I8bjgvLW5pgA+3GbfuU0iVon
X-Gm-Gg: AYBFou1iNXHaBiZ+TmgAaX6MAu+zWVte+6h6B2KJACgq+3EQ/i7htUHnrd3em4SOHPY
	nZ60kOXp1OYAzFm+442k/guVeqhlpxcUZN+WwU8HTn9hIAfJ+6wtN7mc1bUwEh+5W85QJUnhJFv
	Z9M1N70hWiDstDlueIBuOQIJkSvYIyjbdNlaIl5GrM01JdWXQHyMx6Q+dlGeqpXxuKvUY/EYtRg
	6D9YD0LAwnGtSSn1fHoDRUjHt3sYjwR2vM/LVEOFK14StsijKr2heJll/Tsps2fMHEWv+kuCIJ2
	BQTjaOpPimAEF7yNf2pGWR0LtBcpoD4cT9axtplo73A3Y/xI+XuHtYSlQH0xDmwXP3ed7zTjNv1
	zwjFWH8MU3zX6mVFa4MBT1KGI6Ib8nVWA18Z+E3RtZ4pxCX+7eOASCdjuv86ioQgT+pK+ROJbUC
	AAYmHifVVacMkHwjhjZDuZ0O05NHcPZbHXBcwWcs7A8iQbz5vmkYi/pzLLrAK/Y9646dQ7iNHJ+
	jHHnPiSUSF7FCzAHXZJKcY7cEEs9FSDJxnXNEIII/Ool+Q9Rd+V+gh+aA3PbRYlPITaHiardRyY
	xkqOEYcZYu/ObsRRpIqmUBoQY0R4A7wQheHP5b3F16/xh3xxSAopHKrfsQdIJqkKAS7fzPLCmhP
	jd09tZNi5WyIEAlH2i18TswDFiG4Gbw==
X-Received: by 2002:a05:6830:67ca:b0:800:bca4:5626 with SMTP id 46e09a7af769-80899266b51mr285872a34.19.1789354919239;
        Sun, 13 Sep 2026 20:01:59 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60feba1sm10619014a34.13.2026.09.13.20.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:01:58 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Sep 2026 21:01:20 -0600
Subject: [PATCH v5 14/18] mtd: rawnand: sunxi: select the packed H6/H616
 OOB layout
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-14-7d711076a6f7@gmail.com>
References: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
In-Reply-To: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The H6/H616 controller can configure a separate protected user-data
length for every ECC step. Mainline fills all space left after ECC with
user data. This changes the physical ECC offsets from those used by
Allwinner NAND firmware, so pages written by one layout cannot be
decoded with the other.

The allwinner,randomized-oob property selects the firmware's normal-page
format for the configured controller hardware-ECC geometry. Use four
protected user-data bytes per 1 KiB ECC step, cap the total at 16 bytes,
and assign the entire total to ECC step zero. Reserve the same total before
maximizing ECC strength so the selected strength leaves enough room.

Keep the existing maximized mainline user-data layout when the property
is absent. Older controllers have fixed four-byte user-data registers
whose placement already matches the firmware and need no additional
change.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 0375930042ef..3fb61a10a441 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -225,6 +225,9 @@
 #define USER_DATA_SZ 4
 #define SUNXI_NFC_MAX_USER_DATA_SZ 32
 
+/* The randomized H6/H616 layout packs at most 16 bytes before ECC step 0. */
+#define SUNXI_NFC_H6_MAX_USER_DATA_SZ 16
+
 /**
  * struct sunxi_nand_chip_sel - stores information related to NAND Chip Select
  *
@@ -2417,8 +2420,14 @@ static void sunxi_nand_detach_chip(struct nand_chip *nand)
 	sunxi_nand->user_data_bytes = NULL;
 }
 
-static int sunxi_nfc_maximize_user_data(struct nand_chip *nand, uint32_t oobsize,
-					int ecc_bytes, int nsectors)
+static unsigned int sunxi_nfc_h6_user_data_sz(int nsectors)
+{
+	return min(nsectors * USER_DATA_SZ,
+		   SUNXI_NFC_H6_MAX_USER_DATA_SZ);
+}
+
+static int sunxi_nfc_init_user_data(struct nand_chip *nand, uint32_t oobsize,
+				    int ecc_bytes, int nsectors)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
@@ -2434,6 +2443,12 @@ static int sunxi_nfc_maximize_user_data(struct nand_chip *nand, uint32_t oobsize
 	if (!sunxi_nand->user_data_bytes)
 		return -ENOMEM;
 
+	if (sunxi_nand->randomized_oob) {
+		sunxi_nand->user_data_bytes[0] =
+			sunxi_nfc_h6_user_data_sz(nsectors);
+		return 0;
+	}
+
 	for (step = 0; (step < nsectors) && (remaining_bytes > 0); step++) {
 		for (i = 0; i < c->nuser_data_tab; i++) {
 			if (c->user_data_len_tab[i] > remaining_bytes)
@@ -2494,6 +2509,10 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 				bytes -= 2;
 
 			bytes -= total_user_data_sz;
+		} else if (sunxi_nand->randomized_oob) {
+			total_user_data_sz =
+				sunxi_nfc_h6_user_data_sz(nsectors);
+			bytes -= total_user_data_sz;
 		} else {
 			/*
 			 * User-data lengths are encoded in four-byte units. Reserve
@@ -2564,12 +2583,12 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	nsectors = mtd->writesize / ecc->size;
 
 	/*
-	 * The rationale for variable data length is to prioritize maximum ECC
-	 * strength, and then use the remaining space for user data.
+	 * The default variable-length layout prioritizes maximum ECC strength,
+	 * then uses the remaining space for user data.
 	 */
 	if (nfc->caps->reg_user_data_len) {
-		ret = sunxi_nfc_maximize_user_data(nand, mtd->oobsize,
-						   ecc->bytes, nsectors);
+		ret = sunxi_nfc_init_user_data(nand, mtd->oobsize,
+					       ecc->bytes, nsectors);
 		if (ret)
 			return ret;
 	}

-- 
2.53.0

