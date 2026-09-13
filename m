Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CB638F954
	for <linux-sunxi@lists.linux.dev>; Sun, 13 Sep 2026 04:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789272328; cv=none; b=hBuW4UGCJoJzMvECfwPH6dl3MVfoJNvVyEpBADvCe2XmTbp+aK3GUJwB/vOcELe745Ul3LHA/o9bIYx49VQqcHzF8nwOgmEQ83PbIZ8IXHPlnSCg+PBZ3r+Wq4JdVYa/qsZjgqGu/HTJSBSRarwujooB20wqBzjVrqB0kZ/+sNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789272328; c=relaxed/simple;
	bh=/U35JMG7PN0VQxPSNjTNdzYGYwq4m+xXswxlipe9peU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZH80HF2KlXG1uf57wFm/S3YOTq4oJem7/+72kXPa03lEAt1Havu8xzzUNBsH1gR96+TzoSEIkPY9cgs7NNUo5jFwPTvb+4qeTqgpN0ZvojCYoEdvl52ELqJtav/h6b/G97qguER2WpxPWhjqBaCVwiLSjUq3Imzrf5kNr/N3Yv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i7OWBOGw; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i7OWBOGw"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4a451915d8aso2288526b6e.2
        for <linux-sunxi@lists.linux.dev>; Sat, 12 Sep 2026 21:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272325; x=1789877125; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l3fsd5mFSYNbCICE0q+20FvucYtRM3opmhA2nF/SNd8=;
        b=i7OWBOGwH2IKc4W+e9ZUluNWunAyTFNVdFO04cuZvuAsWoxUL9ApvVfzB+F2kPNmpU
         6I/pn5P/szYcwiDmnhNSRUf6+mtsEHp8kZytg3C2MRzjXaYWkEUtbMwlXxp+OWIHFhJH
         /K+XVgVr5ehnRhO4sZm0OnSWHi+vqIx6UXdGTzm23qEzejaHYZ03JYko28VFHFH/ZoYN
         4XGJoTKHP0AHF52xXSWwQhCIvqK5K3+XLI4EOmRRUuCgoiFvU8jQMj7h6d6qvxOgoK43
         BOuEDNuTjLO4zy3LH3X0hBnL7QxnIz/TGk0Df2qzOPQ7PNHY1CRWPCas6tyV3X5XLDGs
         o7PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272325; x=1789877125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l3fsd5mFSYNbCICE0q+20FvucYtRM3opmhA2nF/SNd8=;
        b=Le21PuKpdCvm1qyMbsFCzegSRb/nNFx3Ux1w+HEvH7D+8cjh7OqvLfMkK6/hk6YIN+
         F7b9taCjQN/iMuWldUU8tCNfBC1mMf/sx/JWqM/GISJeHd1Dt0QnRbxnK9uWMeI21g66
         aPxpYJNPOkLVnplc1nC4bG+aiz0bI/utxHd7vNyEO/NaM7JRZrYJ3xeuSSrxyQpg6rTo
         psm/I8JgC04I7S/cTXZzsnAMfqK/Lqd0ASrUOgvK9GLYRvPRGjDNwVh2eTDU90QjsYbH
         BL3GE/4sZiJw57eGD+k2+cNciOj6aOkcvom5I+1LX+xA/cE8UQ1+flh8xHNRXcjKInNZ
         nxMA==
X-Forwarded-Encrypted: i=1; AKwUvBxBX1JiJ6J4PDOHIO7rat+JezpR16DYtwMi35sbse2v7UKvEtZqDW4vpSRw96cjDZHScv+U5VKFbXEDlg==@lists.linux.dev
X-Gm-Message-State: AFuF++knt3G7qJHrfFbM///oMuGGKQSJwYlL2DdM4Osi+aeZILy6Rin5
	4nUFxmM77O2JrDROGevD7DkT2n8mdbKwFBjv0tMPzTE80WQTR8sR/3WD
X-Gm-Gg: AYBFou02dmKVHx1X5NRUGVejKzGOkNX0dlW79UDUU9Rwt/dqLz4HRWQpYpMtYs41ku7
	U/c9yf3qVR/JYugMp4BMZvi0fPRSjZuKTYY6RKeHtlBbIpdpFQTYHydwg10KSwGT1Vdbc8OZGME
	Xa9jRExKg6Ao2OKXiUGT0gJUyClAXKnwzXJBm6I22kAB9rpMmQdLyRWPfk+6gB7/daUBsORt24y
	V/nyth9U+iUUNuMww/lXXPEM5GyYxfVVy+wzUw1cCGsjHVb96lppR6tF/bSanV3XE/WxYjb1Qrv
	bBzfgMkSak7aJQN0jFftnVp+BSLkZNWNHkl8P8F4todXMKccl+QCWvYu4U/rETk3xXoJAppB+du
	1lOb1TZTk+vrl7tA0JSsCkQRNA+HHV4UA2pKS5prsuTJTTjVOVuad/oV8/lMQXWB/sC3OOnqG3c
	I781vijVzPPIqwbxiSpEPl+lMPWN7vPFUESCOydphJp5m5k/FOogu+JCbwfB4wkHjWeUspH/+ly
	cREC8g5RDmjTX0ON1afNq2Oyi3xEarj7AearUYjSWFTRqf3k7Uc2HddwZpWFRZDbLpyfX8x4o5q
	fue1gf/qFRsCVdvB3Mb1cbPSN5DNlGoH/GA2fQnn4YzytDy8LmUPBDWUMLu7h1/CmzBOs8rCeJP
	yWPhASGhGYI6vn3uYHsnEvLukhWo8iGc=
X-Received: by 2002:a05:6809:28e:20b0:4c3:7af9:f497 with SMTP id 5614622812f47-4c37af9fbbemr4704298b6e.38.1789272325105;
        Sat, 12 Sep 2026 21:05:25 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699647sm6011535fac.5.2026.09.12.21.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 21:05:24 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 12 Sep 2026 22:05:03 -0600
Subject: [PATCH v4 12/17] mtd: rawnand: sunxi: select the packed H6/H616
 OOB layout
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-12-4a64bed94229@gmail.com>
References: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-0-4a64bed94229@gmail.com>
In-Reply-To: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-0-4a64bed94229@gmail.com>
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
index 725cc302df9f..97a4b4470dad 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -224,6 +224,9 @@
 #define USER_DATA_SZ 4
 #define SUNXI_NFC_MAX_USER_DATA_SZ 32
 
+/* The randomized H6/H616 layout packs at most 16 bytes before ECC step 0. */
+#define SUNXI_NFC_H6_MAX_USER_DATA_SZ 16
+
 /**
  * struct sunxi_nand_chip_sel - stores information related to NAND Chip Select
  *
@@ -2360,8 +2363,14 @@ static void sunxi_nand_detach_chip(struct nand_chip *nand)
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
@@ -2377,6 +2386,12 @@ static int sunxi_nfc_maximize_user_data(struct nand_chip *nand, uint32_t oobsize
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
@@ -2437,6 +2452,10 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 				bytes -= 2;
 
 			bytes -= total_user_data_sz;
+		} else if (sunxi_nand->randomized_oob) {
+			total_user_data_sz =
+				sunxi_nfc_h6_user_data_sz(nsectors);
+			bytes -= total_user_data_sz;
 		} else {
 			/*
 			 * User-data lengths are encoded in four-byte units. Reserve
@@ -2507,12 +2526,12 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
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

