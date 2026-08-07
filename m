Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F134478869
	for <linux-sunxi@lists.linux.dev>; Fri,  7 Aug 2026 15:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786117155; cv=none; b=Ep0oV8Qn36r0ertpvqEgWilHHTRnJ/9NzGxr/gNpK4tQiYckPSJvWq3DDG1yBLEgD7i2AdwlyDyV2xfq/RzwXIurDgFbnMpn1PhG77Krp1Y44aN56rCXU/syRs6pxOsYeb2RrEN/bO4vLA0ZLWJtuMFK2zFPZVAFOHcQowQSJaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786117155; c=relaxed/simple;
	bh=fjJbOQKzguDWbLI313C9AMkwyvYLGGwqNj2+pQIqOD0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y3jgTkBRmZtcsJvhEBk2FmwZarD7nadqsACOa1LdZX8pMs9rfAAnGbHgDw6RaZWymU2+6jDDyQVgL/1tDPJwcGg6oYDFWOtMKY2Y1u7X5Q2Wqjfm8T9Je1WGVrSFmGCPjYP0s9lyr7o3nGHvZgreL69Fn98qqTI2KmV8EP+3nT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ahadb1IQ; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ahadb1IQ"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-497deab2d66so1736702b6e.0
        for <linux-sunxi@lists.linux.dev>; Fri, 07 Aug 2026 08:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786117152; x=1786721952; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xCFnyxQ3kE94m7oA5V9nQHQf/U50pnd0oZWwoKAuPBw=;
        b=ahadb1IQVK6DzOHyj/WzHxGSkOUFSrUK7bJ9A5JPT/Rkwc74lhT9eQ1bNvur1gBvWz
         Tzl9sDZd+Lp0AlTmNkx4C7bcRIUDDiGwk5m6eNpDURKPv0s33MymQtvPM06ikC+tisTR
         Urs4oXl8KIo2e2Ntsw9/8/R9ZDefxziVJaYfVWLlSt8NXIvauxG9r5eOmjAv+fynZhT4
         mZcA0xNSxnljQFVG0k2SQqHvPJj3AWAd/CYoaL/HVmHkvw2JX9oBm9N2Nqt6awHAYf0E
         cqdWJ96KiEN7mv9OpyrvaPZK/GAHJa+Pn6Xpfvo1vGDs0cxzr9r6cF9PGjV0Mqx7uvOr
         dnQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786117152; x=1786721952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xCFnyxQ3kE94m7oA5V9nQHQf/U50pnd0oZWwoKAuPBw=;
        b=Iq0uVWGS5GyMQ3eRtbZXnDOkrJins+o+AeM9bq70RFlsHQWBWJl9W2Cugr0Mp0DF9J
         1xhiRFER/uOBTSezHO6a4lMnDO+XDTbud9e8lIr9ptJBPFECIMxkKqSDEqiZrkGhiB0U
         u9fQd515+VhyFW9rNHi5RwW09T2/WtbXqXVLcZ7FY4m60gejS/UEEmlkebNAf0IbSjUO
         k0SqQ2FS7O+U7r25SylusUW1h9i+mfR8vKhjg6vQp7YYwnhEx1sbhL4UJqr7ZvdHTa9S
         hdY+soJ3H8JyJKTeFHFqJUU9+DV6Sa9jrCrf8xXY+mnUyC71o6SeJpGu6tZ1n3+c/pA8
         ZA6g==
X-Forwarded-Encrypted: i=1; AHgh+RrviIIJi9uPw2t7RdEnhrvnExmEIk2XmYqJFlBBk6LUBdBJomTCx6cP8uc85uRlDQIiEck8XyNBF8s4fQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwY53JClGYcQdd4hi7jKi0nJJy7PD48ojqrG7JPmuUUn55fIUSl
	d9N9wgHQ7qdIx8RBAQohq21lVkAhyzuQ9ilvF5Hq8Nj08NdYwCNAGXlh
X-Gm-Gg: AR+sD11J/GrYfkH3VkbWmwi+pVLGdfzaYU9ja4Cd5kCHZ+KW7sjLPQFja1FdaHYt5il
	n+XQiHhoeIFMzg1hRMMzN3IkzYRMqIC9qa2CFGKvAIj3PIln06pHdXo958jgV+PTW63JyZiLohr
	bB+mVC5pCyfAlkifEAQrLISKZxi+D+jvqwoW3mT6lrF2XUKcVyWyj+ID91gQdIWz7ZNhF8ugKA/
	eZQX8gLyDOLfBjzJe6VeUe61hFdzk4ERF76LneQHhhyHchbuqsWMTXfNBhBLVFKP6a+D1lu2y/0
	PUjQVqpPxLVQO7UmCfrf8Hhmlg6m/1TTQmpb0bYX8pP6FaAm46K/ZpavTXJZSQDqGM6isLyBL12
	x90vkKwtG0h+8FA+MUzlI84dL38ShVjoSS/bkQev3FZXxgHdHkf7U5UDOSFCdNL/Ee0IDVr08f0
	6xS1rYw/RHR1rF/dtUDn1cPLg9qRdfiLIxzwoIVaFd2g9M5nvQBRiHCByhavV/MMZriRmpW44Bq
	t9PHfNvwhyM6b5MHW7l5BDAES8jMIALRA7Euob8vQl084dieaphXpk6VlFjJmktdYSq7kb8Wjlu
	nDnTDydN3xFa2uAiO+oxv5paOxn4AQobvtYtOLhHlWypW6z2jEOkosIBpKYcVPh1SwItiJEzypZ
	wT1ZKYmK+QpEFm70K
X-Received: by 2002:a05:6808:ec9:b0:4a4:cedc:6859 with SMTP id 5614622812f47-4afc4df6419mr8781396b6e.4.1786117151816;
        Fri, 07 Aug 2026 08:39:11 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4afae706cd5sm7353485b6e.11.2026.08.07.08.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 08:39:11 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 07 Aug 2026 09:39:01 -0600
Subject: [PATCH v3 3/3] mtd: rawnand: sunxi: fix H6/H616 controller timings
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-submit-sunxi-nand-h6-h616-timings-v3-3-91287b543f41@gmail.com>
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

The NAND timing calculation assumes that command and address setup and
hold intervals T1-T4, T7 and T11 each take one controller clock. It also
uses the original A10 delay encodings for tWB, tADL, tWHR and tRHW.

The H6/H616 NDFC defines the setup and hold intervals as two internal
clock cycles and uses different delay encodings. Add the H616 timing
characteristics and select them through the controller capability data so
the clock solver and timing fields match the hardware.

Fixes: 88fd4e4deae8 ("mtd: rawnand: sunxi: Add support for H616 nand controller")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 49 ++++++++++++++++++++++++++++-----------
 1 file changed, 36 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index df52501c1285..ca74c9c333e7 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -241,6 +241,8 @@ struct sunxi_nand_hw_ecc {
 
 /* Delay arrays contain internal NDFC clock cycles for field values 0 to 3. */
 struct sunxi_nfc_timings {
+	/* Internal clock cycles used by T1-T4, T7 and T11. */
+	u8 setup_cycles;
 	s32 tWB[SUNXI_NFC_TIMING_STEPS];
 	s32 tADL[SUNXI_NFC_TIMING_STEPS];
 	s32 tWHR[SUNXI_NFC_TIMING_STEPS];
@@ -1680,12 +1682,21 @@ static int sunxi_nfc_hw_ecc_write_oob(struct nand_chip *nand, int page)
 }
 
 static const struct sunxi_nfc_timings sun4i_a10_nfc_timings = {
+	.setup_cycles = 1,
 	.tWB = { 6, 12, 16, 20 },
 	.tADL = { 7, 15, 23, 31 },
 	.tWHR = { 7, 15, 23, 31 },
 	.tRHW = { 4, 8, 12, 20 },
 };
 
+static const struct sunxi_nfc_timings sun50i_h616_nfc_timings = {
+	.setup_cycles = 2,
+	.tWB = { 28, 44, 60, 76 },
+	.tADL = { 0, 12, 28, 44 },
+	.tWHR = { 0, 12, 28, 44 },
+	.tRHW = { 8, 24, 40, 56 },
+};
+
 static int _sunxi_nand_lookup_timing(const s32 *lut, int lut_size, u32 duration,
 		u32 clk_period)
 {
@@ -1720,20 +1731,28 @@ static int sunxi_nfc_setup_interface(struct nand_chip *nand, int csline,
 		return -ENOTSUPP;
 
 	/* T1 <=> tCLS */
-	if (timings->tCLS_min > min_clk_period)
-		min_clk_period = timings->tCLS_min;
+	if (timings->tCLS_min >
+	    min_clk_period * nfc_timings->setup_cycles)
+		min_clk_period = DIV_ROUND_UP(timings->tCLS_min,
+					      nfc_timings->setup_cycles);
 
 	/* T2 <=> tCLH */
-	if (timings->tCLH_min > min_clk_period)
-		min_clk_period = timings->tCLH_min;
+	if (timings->tCLH_min >
+	    min_clk_period * nfc_timings->setup_cycles)
+		min_clk_period = DIV_ROUND_UP(timings->tCLH_min,
+					      nfc_timings->setup_cycles);
 
 	/* T3 <=> tCS */
-	if (timings->tCS_min > min_clk_period)
-		min_clk_period = timings->tCS_min;
+	if (timings->tCS_min >
+	    min_clk_period * nfc_timings->setup_cycles)
+		min_clk_period = DIV_ROUND_UP(timings->tCS_min,
+					      nfc_timings->setup_cycles);
 
 	/* T4 <=> tCH */
-	if (timings->tCH_min > min_clk_period)
-		min_clk_period = timings->tCH_min;
+	if (timings->tCH_min >
+	    min_clk_period * nfc_timings->setup_cycles)
+		min_clk_period = DIV_ROUND_UP(timings->tCH_min,
+					      nfc_timings->setup_cycles);
 
 	/* T5 <=> tWP */
 	if (timings->tWP_min > min_clk_period)
@@ -1744,8 +1763,10 @@ static int sunxi_nfc_setup_interface(struct nand_chip *nand, int csline,
 		min_clk_period = timings->tWH_min;
 
 	/* T7 <=> tALS */
-	if (timings->tALS_min > min_clk_period)
-		min_clk_period = timings->tALS_min;
+	if (timings->tALS_min >
+	    min_clk_period * nfc_timings->setup_cycles)
+		min_clk_period = DIV_ROUND_UP(timings->tALS_min,
+					      nfc_timings->setup_cycles);
 
 	/* T8 <=> tDS */
 	if (timings->tDS_min > min_clk_period)
@@ -1760,8 +1781,10 @@ static int sunxi_nfc_setup_interface(struct nand_chip *nand, int csline,
 		min_clk_period = DIV_ROUND_UP(timings->tRR_min, 3);
 
 	/* T11 <=> tALH */
-	if (timings->tALH_min > min_clk_period)
-		min_clk_period = timings->tALH_min;
+	if (timings->tALH_min >
+	    min_clk_period * nfc_timings->setup_cycles)
+		min_clk_period = DIV_ROUND_UP(timings->tALH_min,
+					      nfc_timings->setup_cycles);
 
 	/* T12 <=> tRP */
 	if (timings->tRP_min > min_clk_period)
@@ -2670,7 +2693,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_h616_caps = {
 	.nuser_data_tab = ARRAY_SIZE(sunxi_user_data_len_h6),
 	.max_ecc_steps = 32,
 	.sram_size = 8192,
-	.timings = &sun4i_a10_nfc_timings,
+	.timings = &sun50i_h616_nfc_timings,
 };
 
 static const struct of_device_id sunxi_nfc_ids[] = {

-- 
2.53.0

