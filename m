Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A969142AFAA
	for <linux-sunxi@lists.linux.dev>; Fri,  4 Sep 2026 21:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788557021; cv=none; b=iXrWYUTjBR+utayxfKEZEz/OWd/3/tA6rPA37RvTBy8YkcmV1O4noCTJAiXP/yFiQKeOAau6dBewG0S72DwpE+aLkMNntAPG2DBdoXQ7nhW8A823r94Cny7OYPsBg+DkfsjOHQ+KrjjmB/QNKKBY9bGly9nSw+alYwzYwn3sZ8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788557021; c=relaxed/simple;
	bh=P9VhO/j3MukvM1aMlXTflvte2/XJpvtBnpClC5Qa4Bk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rKtA/UdmmzbGi4qUvcYhxS2tTVKV27pEYHBv2zl8aDba53WIXXKKHpR0MTaYlb6DFpb0JkcrJ+ekNKDTwe1DYklPZ3/+nLUFcoGx9OFXEljXTYkZmHLJY0cU20SftFXDqY5dcMlj3IG1p7vYyJQykoAnyd3uYpKNY+QKP64d4ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=owCdFpVu; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="owCdFpVu"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6b5da53f5cbso677348eaf.3
        for <linux-sunxi@lists.linux.dev>; Fri, 04 Sep 2026 14:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788557018; x=1789161818; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9BgbJZzXDYwsOLv3h9k0AMpcw0EOYW2MSapQnfQyB+Y=;
        b=owCdFpVuLh0bn+ZBv+H7/7aAShm/81HYDHhWwkCgLD0eQT3CmBu/612Ojpn2PK+jhe
         Xo0z4je5qI5GXKEDeNtBcMLGF2j+jusX2WPR4hF3VBRLzPanQovxQCYKpQsmaEvuUeVf
         1gS1z4NYNUAvyC8nPSpOLwO3DxVAnOdeiYiteVdTwq1FbHW83wuX3J+PIsAWoSG6mnZQ
         VHuXC0k/wWvlqBBRun+ddMMHcjCCZWEFt30RkrqzNdnfRUgMFng3pA7TTgF0V9ghLZpt
         qkdtuKS9hq4+eFHdjJ83Fgnc4SJp+QUEZksRDqW1j6jAawGqogHI+ClQRPvzuQD9MOTi
         HduA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788557018; x=1789161818;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9BgbJZzXDYwsOLv3h9k0AMpcw0EOYW2MSapQnfQyB+Y=;
        b=kBpinsS+m9fSYPoLbdublORJFIxh4jLGtOPHPg6uapdLGPkIap1O08KxBsnBECLu2F
         RmvcTwYsUBFGJaUR1zsr7iecjbRLwJ0Ix5n77zGYgO7V5HsvAEAe8KvlbY38nxT14hwP
         3Ae9sPxnMb2t8CYBngmFnoieAC+YSw+oVPq+lVZBEnfpYsj4PuN8RLOUGHkxU5xXgjgh
         TAHFa5gpHtbUemBP9f41aNU4DJj73TpcFsXt4/f2yqMU2AaE3gzvoyrQbu+6zNb14FY4
         jc1o1L31iV+4R1+VfDXvwT100NT5IRp2iNP1ic/tRjtADdgk2N7+hGYHh+m7p9mJjdac
         37GA==
X-Forwarded-Encrypted: i=1; AKwUvBzk3mJIYpc//F3piTpYIZ7wFx/WP1EG//UvwotwCAozVcE1lSEBaBUgAjRJ1bkeuv4HDxDLFmkgndcDvg==@lists.linux.dev
X-Gm-Message-State: AFuF++mhBAyoFKSoySjhYx7lWZ2JxH0W5TWa3JOq844UrAFbgdaC+FT+
	MxG304mSKNjn9Jzbq0tdApf8gO65aRXyYtdcM/TGfPA3AfTu4uToiGxK
X-Gm-Gg: AYBFou3gDq0o0rAKwedXT2UVpXz7KPxB2BhhxDFyDIzxN8IogOBSp9H7bl4V4x9v6yM
	EiuMtPRvHiQYZb5Hyb5/z5T/SPRZPx7rP4pW15T8nqt6OFxfEucQiMcvIKQ7NbYwbnukjXrWxif
	/52BUIEAt3Nv7tIKZX6tF+KJB81jCT+wslFYB85Npf3emR0q0IJGiDQAqeSUAg5OXgwHZNj249Z
	ev7e7YQin3Sf0z4R6skyRzE9OBcKPE6Mltoh5ClmTQktvSIB5U7d7LF2v4lzV92B/MMv9FCYB+0
	CoieP/Fruwk+sObfH+tYG9uKCMP8J6EdreKZ6c/z9oAm0rx0TxGD9GbKOgp0yg+XB6K/jLRBSfS
	TEvWcbez1gJz+rfsHUPcXo7IHrbkU/EnI1dNBNfnzvZSEZKFi9niwIi49GKiaDr5ovj6Wr9TXG7
	QMf29yijghZRnqLN+S9b87kdZTENZAVpVAR6hCWqkwzCZaQ6v2Sl3+QLVP5wxm34Xd2TyGiJgrf
	214I/MpkIJ2grjiKluIMELv/lFgZXSDJIo2xMNqV9a8hslbhE8mnIaX8Lw5Dn0N4zUDHi3x/FcI
	1NQBONl06QDkkZ44aCsB+XNqOPz0iUdVoN5j8Jc+NK0lxTUciRzHuXNkkytTDqZvSQeArf2xRXO
	T0nZmIcnOKPIFxJBQvr8=
X-Received: by 2002:a05:6820:180e:b0:6b1:65ad:3181 with SMTP id 006d021491bc7-6b6fcfd957cmr8410089eaf.16.1788557018080;
        Fri, 04 Sep 2026 14:23:38 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6fasm4492259eaf.3.2026.09.04.14.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 14:23:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 04 Sep 2026 15:22:13 -0600
Subject: [PATCH v2 3/3] mtd: rawnand: sunxi: select the packed H6/H616 OOB
 layout
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-3-b12074f4aca7@gmail.com>
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
index c1246a9268ca..1265d900fc27 100644
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
@@ -2037,8 +2040,14 @@ static void sunxi_nand_detach_chip(struct nand_chip *nand)
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
@@ -2054,6 +2063,12 @@ static int sunxi_nfc_maximize_user_data(struct nand_chip *nand, uint32_t oobsize
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
@@ -2111,6 +2126,10 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 				bytes -= 2;
 
 			bytes -= total_user_data_sz;
+		} else if (sunxi_nand->randomized_oob) {
+			total_user_data_sz =
+				sunxi_nfc_h6_user_data_sz(nsectors);
+			bytes -= total_user_data_sz;
 		} else {
 			/*
 			 * User-data lengths are encoded in four-byte units. Reserve
@@ -2177,12 +2196,12 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
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

