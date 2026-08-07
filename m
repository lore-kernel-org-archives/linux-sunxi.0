Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B205476CC8
	for <linux-sunxi@lists.linux.dev>; Fri,  7 Aug 2026 15:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786117154; cv=none; b=FAfxXgnRTPouoIk21MdwONWYIdc7elgvZ3C2iqhky3+6bjNTr4YxzXGefOPDPKAtJUkSUGx/rnsY+cQkJPpapKuq7B2g1ULOQ5DTRJEovM+5064oGPdsOhk5tLRmR/vP7OMJnsiorYxI3LkQkvHAfEXshkWvwz6GTRmC44XXPnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786117154; c=relaxed/simple;
	bh=GOAlpolOzUCQKB0D6s76EOdiJ4JtM3txEaAtWy2BZY4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EfEgHHA+iaW2MSvDLRfCKxBwlrZ8gGGDxD05orpuex7r5uINx17dMjx4ASzdNkzQ34oPwZ8yTe/D72JFWBOnu3B1Y7FVDdwoJEGXhP7WqRmHTDgFQQewKiOi59N8mHPD2WuvoFAN21tpxSNoMnx70fZJT2ROURCcOmcZLAl+pZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i5bvC2vI; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i5bvC2vI"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4ab47c40e7eso1472015b6e.3
        for <linux-sunxi@lists.linux.dev>; Fri, 07 Aug 2026 08:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786117151; x=1786721951; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4LVBJaFomYnqSqtZwNfhU1nsKV+qCjSwKc3i+p0HPzM=;
        b=i5bvC2vILJaazNnxr9BPEzVRPJx/DVQO/pz1Q4U/l6Yrri45MjT5G4SlhB0VT6W9xz
         l/kTvwlrJflW/pOnSrJb0MAasUH9HqARTQPKiglr6gRID1t0dYXKWc00b4kqD8vUJlxv
         5wQrgt3VGLvkuBAMTkYjk5dNVH+DMGYIUYux/5xDKHzW1JNxTZ5CNqzoeo8NPxfx14u1
         roOiFdWsk4SAqCbH9yFq08+2nIkvDizaZu5UCUGVjhQ6ILXp2a3D3JPioSnUV3NrKrGm
         2bsxzHM5BDlsRSHvXpfsr7B6pibVdpdfe6yNSqTo5y5QJU9rxKTtsoAynykvF1rVmHsQ
         7dJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786117151; x=1786721951;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4LVBJaFomYnqSqtZwNfhU1nsKV+qCjSwKc3i+p0HPzM=;
        b=jyup+6uON048F6T6jjkAY7i93EUypu7DYk/Q0252aetRm16vc70Dss19bmlhkOIxq/
         YQ4YKHRCR1nncPy8KKfZq8o2VhKuiG0NC5vwXS9wKKfWUaW98ihI0j1gmCv7dAeBy1hL
         01TLnzTzX77KEjULpLQzw1YWVqR1uRaghkM4FGJb2h9ohRSVHUsxDZxW9MO2mflIDlXJ
         nc+K1lNanU3X0D3DuZo4gZADg4PYKzpvlntvI2PdB0FLDEeeePfLqbTiYRughmJwNc5+
         71Wz7YDLkvuSFgSA1ZB4B3OdHidm+adNakSoPwLt6jFALoN48E3VzbgpAdxhPLuZQugb
         Xo2Q==
X-Forwarded-Encrypted: i=1; AHgh+RqRDSOA7aTLs0POWHQXKCCHadGlzK3BG+92RA89YzSW+1BClM1x9jhf8cEdQNfRyeJXBW1GKbyJiPiKcA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwwUJi4VWWX358wzKLYn+JmesBf1ibK6id8FWQHNamp9UeHM2ad
	Lu7g5mPWiqov/Vh3GVIbjBjj7jAaKMjtXTTRwIpNV9neFCbhJUKUre9X
X-Gm-Gg: AR+sD119BW5HkOLZPkYjy+D7yUH0ZfHE4NhtjORsYlTnOV1JyADSBRSJPbebmwqz0pY
	0S/WcCxTfXvTUCr39BFhlFlJEi0I9vnJVnU0j2yoURv1M48cMqxfLZBZxr7d46KUWoLxKVdOPM1
	Y3e6S8M2UPNp02YjfnjR29W2uY1mUkGtjYM7mGE51ojkGxO/RN0x5G11XcaL705XjuGheg6P9Dx
	8MRx6fo4av0c/x3icXnnTraYxNm1UHRO7v6LIEGmz67zg/8MajQS9zOgdxRvss8QJ0ySPAf8ojG
	OoTC2nN7I1Wl5U8IeUFPppiD7xsLpTDGkwBINUetAJvd/ic71MCNT5PH2JgEb3Tf5wiQe227Csx
	ZI+/dbEVEFOcpzxModwYoamEwm41ML+CC6Xe75kNc0co2DfiF+Ozn63NahDRcGle8QXB0OTiSLx
	mfr9uBRggxhhLZJ4NztkvkmEO74XExvF4QBT+pn0jYsCv1kEjUqpD/kSoI1arcfrA+XnqKtfHy9
	djVBKLgguJmym3ZGxi1y9ugAdPwu1yNOIB5/OTNkjpmwlGrVa9gwQyCB0pWjMI2iagjDPAAYMMq
	Iz7EjE4dnTfktxf18SFKhHPWo+E6AqYRqcfMxNtyioVyDF2ht1wWGbyUMjwyygP6hKX+HtnLGeg
	3TcKqGuNSo3iphdDY
X-Received: by 2002:a05:6808:c1ba:b0:48a:ddd4:d36f with SMTP id 5614622812f47-4afadf16e3fmr12514228b6e.8.1786117150933;
        Fri, 07 Aug 2026 08:39:10 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4afae706cd5sm7353485b6e.11.2026.08.07.08.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 08:39:10 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 07 Aug 2026 09:39:00 -0600
Subject: [PATCH v3 2/3] mtd: rawnand: sunxi: describe tADL and tWHR delays
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-submit-sunxi-nand-h6-h616-timings-v3-2-91287b543f41@gmail.com>
References: <20260807-submit-sunxi-nand-h6-h616-timings-v3-0-91287b543f41@gmail.com>
In-Reply-To: <20260807-submit-sunxi-nand-h6-h616-timings-v3-0-91287b543f41@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Richard Genoud <richard.genoud@bootlin.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

The tADL and tWHR timing fields use four encoded delays, but the driver
currently derives their values with a shift. This hides the actual
controller timing characteristics and lets the clock solver select a
32-cycle delay that the fields cannot encode.

Describe the legacy 7, 15, 23 and 31 cycle thresholds explicitly and use
the tables for both clock selection and field lookup. This prepares the
driver for controllers with different encodings.

Fixes: 88fd4e4deae8 ("mtd: rawnand: sunxi: Add support for H616 nand controller")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 9885248c9b85..df52501c1285 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -242,6 +242,8 @@ struct sunxi_nand_hw_ecc {
 /* Delay arrays contain internal NDFC clock cycles for field values 0 to 3. */
 struct sunxi_nfc_timings {
 	s32 tWB[SUNXI_NFC_TIMING_STEPS];
+	s32 tADL[SUNXI_NFC_TIMING_STEPS];
+	s32 tWHR[SUNXI_NFC_TIMING_STEPS];
 	s32 tRHW[SUNXI_NFC_TIMING_STEPS];
 };
 
@@ -1679,6 +1681,8 @@ static int sunxi_nfc_hw_ecc_write_oob(struct nand_chip *nand, int page)
 
 static const struct sunxi_nfc_timings sun4i_a10_nfc_timings = {
 	.tWB = { 6, 12, 16, 20 },
+	.tADL = { 7, 15, 23, 31 },
+	.tWHR = { 7, 15, 23, 31 },
 	.tRHW = { 4, 8, 12, 20 },
 };
 
@@ -1781,11 +1785,15 @@ static int sunxi_nfc_setup_interface(struct nand_chip *nand, int csline,
 		min_clk_period = DIV_ROUND_UP(timings->tWB_max,
 					      nfc_timings->tWB[SUNXI_NFC_TIMING_STEPS - 1]);
 
-	if (timings->tADL_min > (min_clk_period * 32))
-		min_clk_period = DIV_ROUND_UP(timings->tADL_min, 32);
+	if (timings->tADL_min >
+	    (min_clk_period * nfc_timings->tADL[SUNXI_NFC_TIMING_STEPS - 1]))
+		min_clk_period = DIV_ROUND_UP(timings->tADL_min,
+					      nfc_timings->tADL[SUNXI_NFC_TIMING_STEPS - 1]);
 
-	if (timings->tWHR_min > (min_clk_period * 32))
-		min_clk_period = DIV_ROUND_UP(timings->tWHR_min, 32);
+	if (timings->tWHR_min >
+	    (min_clk_period * nfc_timings->tWHR[SUNXI_NFC_TIMING_STEPS - 1]))
+		min_clk_period = DIV_ROUND_UP(timings->tWHR_min,
+					      nfc_timings->tWHR[SUNXI_NFC_TIMING_STEPS - 1]);
 
 	if (timings->tRHW_min >
 	    (min_clk_period * nfc_timings->tRHW[SUNXI_NFC_TIMING_STEPS - 1]))
@@ -1813,16 +1821,18 @@ static int sunxi_nfc_setup_interface(struct nand_chip *nand, int csline,
 		return tWB;
 	}
 
-	tADL = DIV_ROUND_UP(timings->tADL_min, min_clk_period) >> 3;
-	if (tADL > 3) {
+	tADL = sunxi_nand_lookup_timing(nfc_timings->tADL,
+					timings->tADL_min, min_clk_period);
+	if (tADL < 0) {
 		dev_err(nfc->dev, "unsupported tADL\n");
-		return -EINVAL;
+		return tADL;
 	}
 
-	tWHR = DIV_ROUND_UP(timings->tWHR_min, min_clk_period) >> 3;
-	if (tWHR > 3) {
+	tWHR = sunxi_nand_lookup_timing(nfc_timings->tWHR,
+					timings->tWHR_min, min_clk_period);
+	if (tWHR < 0) {
 		dev_err(nfc->dev, "unsupported tWHR\n");
-		return -EINVAL;
+		return tWHR;
 	}
 
 	tRHW = sunxi_nand_lookup_timing(nfc_timings->tRHW, timings->tRHW_min,

-- 
2.53.0

