Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E84A3BF673
	for <linux-sunxi@lists.linux.dev>; Fri, 17 Jul 2026 17:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784309671; cv=none; b=SQI5FN3xg3Ww0rINtkiBofvDGIzu5Sycr35AnQYwdMi926iP+/W9O7EVm2DfOo587tD8/cEMuaB9bHuVe5s5/tVFgRyINgCE2YrT5A4MI3wbS5UYqOyXU+WjMUOyCakHYza7vrUZMInQoUXOVvNlruvG24lOtyXNWWfnXVcTqXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784309671; c=relaxed/simple;
	bh=44TY2dOMwcJODONgQHSuiNADRv/0XYu2Y2Iil3nCRsk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=twI1a6+x+dld97P3LUfS3V3fYZCSq5B0NDiSb0vyxMbEJkhXYNqVJkv28YWinKKvd5qDIduMhH8QZww2kWvTfTsXq666x5EYshGvUamNYNc1Ysvw8iw7HjucJq7T7pGBnG0xBYFNOVr0yrAoGvaz8hFh2YgzCPjfpC6erf+oTo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pd/IS5ff; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pd/IS5ff"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7eb1dc6bd53so4356196a34.2
        for <linux-sunxi@lists.linux.dev>; Fri, 17 Jul 2026 10:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784309669; x=1784914469; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fU/T4ePwxMvnfrbedCWGcOi9RX0frxKmTN5hi5W5USU=;
        b=pd/IS5ffLrato+tEaiRMexVtKIl+bNyj4wINDwjvVNF8w1TXI/NkE6u/KPoyj7FuvS
         x8c+SECNBUJqxYyabOQ+3849lNyREo4zmIsSmkNXDKK2sJPOJnGYgEwCb95Uu3Cx32YD
         vw6I/AYQxYmN1sT+vnakvcukVgPwFjTSDbkdXkMn7RXd9wTuHpeTos0YpicIXMzRdJX+
         ed5ej8BEMx4LT1TzNlWgKdw+AMliTqUS51Kf/hF73xfKc09DyoeBH9pkvmBowcXj89cg
         vi/wLY5zvge9VzT4g3ivThZKNrNJHvPCyQkHdMu4tosa7EXZ9LJ5oiY39yUwmqgRPKD+
         971w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784309669; x=1784914469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fU/T4ePwxMvnfrbedCWGcOi9RX0frxKmTN5hi5W5USU=;
        b=SMcAkupM2D3MGJN0gxuv2odoeivsSSiBMWkCMwXcrfBAGknj5EEzdkXUdSx7AtvCiC
         vPtJ8pvwpPMx2fUQsBw/UwZ22TDi/1FtJSpz2/DdU8QromnTCCrYQC3BYTb/e+bnD9O9
         oXX1lQnJ7SDtQYrQbB1OAPj4hb8JisrtVloTEbIHu875JTd8qsF9ffSTGc2XNLuKtfjA
         ZwBrr2GphO93wWYP9cPj0QMwrhA7R9vefpzYgHsuOiDAZTAGmD4HrHMk+9Awi3iL8esl
         88lJLO5YLcR3cjerGrMm+fV0hCTo7qD9vi1GtBZPCDQ9B+TpidcdfFk7w6WJ4uOibDwj
         BZ4Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp9E5SP4mMm7Yn6LLC+I4V86wmigxN7286UUAmR/A/nSyQaayeNxUnLAc6WFntSn8DHeKt4mFQJYcW0xw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy45RSdf3W1s4Ter0Wg4EWRqbAWDWrUmGunnqC+WlMcSea8IpM5
	QXI8I6xNOkahX4pbYMHikDQAklP+Q15ormBdCwwnuYU7IBA+0aPrtXTN
X-Gm-Gg: AfdE7cl/EQrdwd9SnwJreLjMHgWW09BsYHcUbB9dJOk67D16DFGgJYNeMwA1es1mtGY
	6mQO89sVSTq2RFkEqUztXaIWQUUYGh8tjzY2/5co32Ub+RSfH76iqSk7SU9WsBlEfLvYBEO07WG
	Uy3iogMroPVx3LvDEjYW04Pm+L/0JhbjqZtFYY6gVBceOuVuZczbA2pe3PdAKQ1oabUSUSSZbRE
	0y+hMm1yswOp2rZ/StExwW+LlNGyPPYcNoSa9kqmWUDZgCApDpt9jmg/viu3x5yDmH0HuQtZLK+
	K9oeJDQZq+k6n3je7QiLQ4WrpC16DtltIpFO50Oo9hr+m+T7x2JtGoiSP2gwDv5esdpnNbpuwEb
	rmn8iEXKtINa6uQLCatJ8JgrK9U9T0a1QxbqBp2AkEPrygcEslTjm5CNhp/P4Uv65ei20GDZQae
	+Pnb28a1d8/YjQdsibWDYOxXZojeDj9ZW1QhU7jYwg1r5B+NXG/iGZ9f9jycNEEoRPDt05xnlAe
	nJjeI1HR5EeTQT7yfYAwu5sURHPRvaZe9ekKZFOTbxYAZqFiL3CKA==
X-Received: by 2002:a05:6830:4888:b0:7e9:cdf6:230d with SMTP id 46e09a7af769-7eda154706fmr1996146a34.24.1784309669083;
        Fri, 17 Jul 2026 10:34:29 -0700 (PDT)
Received: from [127.0.1.1] (174-29-11-8.hlrn.qwest.net. [174.29.11.8])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7edad965130sm1677212a34.11.2026.07.17.10.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 10:34:28 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 17 Jul 2026 11:33:58 -0600
Subject: [PATCH v2 2/3] mtd: rawnand: sunxi: describe tADL and tWHR delays
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-submit-sunxi-nand-h6-h616-timings-v2-2-225515107640@gmail.com>
References: <20260717-submit-sunxi-nand-h6-h616-timings-v2-0-225515107640@gmail.com>
In-Reply-To: <20260717-submit-sunxi-nand-h6-h616-timings-v2-0-225515107640@gmail.com>
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

Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index d12cbb3c813c..791f495f6e82 100644
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
+				nfc_timings->tADL[SUNXI_NFC_TIMING_STEPS - 1]);
 
-	if (timings->tWHR_min > (min_clk_period * 32))
-		min_clk_period = DIV_ROUND_UP(timings->tWHR_min, 32);
+	if (timings->tWHR_min >
+	    (min_clk_period * nfc_timings->tWHR[SUNXI_NFC_TIMING_STEPS - 1]))
+		min_clk_period = DIV_ROUND_UP(timings->tWHR_min,
+				nfc_timings->tWHR[SUNXI_NFC_TIMING_STEPS - 1]);
 
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

