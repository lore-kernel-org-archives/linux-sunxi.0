Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF6A42903D
	for <linux-sunxi@lists.linux.dev>; Fri, 17 Jul 2026 17:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784309674; cv=none; b=ou6I3xHTLN9yNHKaiZVEm+OlW5sWuAXepRCWEjpli7vqbzwXe3a9qV+d7HGdnFE3lI2OtgcoGhXDZ7GOyEHOCt2bAVGqF27EgINgsRWcrQvEVLPkdgVwIGca7F3Xtnr8pEU9z2yrSTcfdv32SAFU3sWv1xVno85UIihwKLba68A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784309674; c=relaxed/simple;
	bh=cKHutGHLndJN3BZmJco0fGWbxTiby9/tAM3iiXN6y5I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P9ITbMDU5tXTznLpxzO0tdbrgdGUtX9GIdxn9oLcDwo4Eaq7mZbt7D3S4iGS22kDohpi4U7HA+hLeymRMzUHcep57lO0g7foFJVh/ZZsSPoVVJPhp3eZVNcg1s8BXnSgzP20m6NiuEAdoQp0LNvzPYTw5zfN1ay9tWaus1tldLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y49bfLEM; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y49bfLEM"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7eb61bbeb25so2791934a34.1
        for <linux-sunxi@lists.linux.dev>; Fri, 17 Jul 2026 10:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784309671; x=1784914471; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sBTwbiP2C8OFdHLB83ZBc1RdHRd7b7uHmQhCjRYWMAk=;
        b=Y49bfLEMqrTkiE1nyN06oBnTXGomnDi79eqNqLSj0FkqaQwSnAKeiKkbR5FbjHpxB6
         nvzcd6PGaeTHqhrTHU69dE66Ot8oGTZsmPx+oVNGDIBvntv+9yBDc5p98De9+PyjGCD/
         C6ajUx9iRIc+chfkCJiYN2jaBqzXtaTVAufPtXw9VkGxBFnGFWBhZZtxX2dm+zPk+Va5
         LgK1Gt4st8AvjU4KrFCjMinOLVpXFE/amoxSimgsh/Yr/VKBtUgOsGpYbsOXDdXq2+2S
         cYj/LahpYIetCQcr6zhszExlzlx+27cZor1pXWN8lufxx4h7vOYU2fNNdBRxRi9t3O8A
         vmwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784309671; x=1784914471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sBTwbiP2C8OFdHLB83ZBc1RdHRd7b7uHmQhCjRYWMAk=;
        b=qKJ/WExUAP1Ad8NfV1N6RV6EYq41U9GYmjgwQMxm2neV+h0d8S8i4grePauGB2aCs4
         Fwin6YG8T+NXHP4JJTjMijIAnEx6Lkp8A6pHqraN3mXWzCtAd5cH1TIdHk9gIh9flxDG
         njZySUGV0UrV96hY9u225Dwg83myL883EJcMITTnNtibpp0O4OB0dKl5tNxHTexkn7lQ
         GAryxh4oo0XesWkxrUqdhG9UsnOctecVb2LNPv5P9Apvkv5VaImDtB3SOCq8KXHoJSO+
         ucUGTzp1F7zEsKKQ0W6qiXTHVadaXUR2WR9ARGOxMdp0NXStsbZlyDsCSuRaJZO+dii4
         bFBw==
X-Forwarded-Encrypted: i=1; AHgh+RoMKHlPPzVbsLPwJe1jnrbHg94DrFAOsoQJZ+MSTL/x07ZiedV6BtFh746erZ8CIc4mXw14iUoGP8+9KQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyi6CDuW1+sgheezPgwVPqoPNmXOssa+claSc6m22krMG6YSAyt
	3HYW6SjjW/RBvCWc2ZREtipRzP9jgRpLQLrsG6bQtPfm6CiqDLlXMB8Y
X-Gm-Gg: AfdE7ckX8n9iQEa/+11EUflrLkrrr74/bmX7v66D81crZF7bhcT7P3PdgaXdJuFKD8U
	+mPZIAYxEdvVtFN8NHbapWa0QN7DU4w8KwwvcGYqJDeXUV1T3BbjO5Bb8jX9M73kaX87ykaByR+
	sslZ28Hfxhxv7xw1ISNR760jPhtI3NSALEpWxpAwV+8rdRXsIJPxCwBJKPcVRAgUIuF3Wo+jxPo
	BVPpyKpWTTKGUXhN/CVkd2iALFK8614J35FoniqqZYe+58MQqpbjG75baM0TpfqqiwGf2cR0vgg
	NuWSR8LQJ0U1ckRjhIVZzq6Fz1h1JRIUSZkCi8fg84bTK2Qh1R7xWcT6rRmnSF8B0Vq1nztLCIh
	RtqzyaIyABHqD/kEygw7vDKWAu6CQTjXJW53CYSaX5SPaZoFIzfjdsMCQPWM/m620Kw3UlI1BpT
	oQOz/SOmtCdGYLzfeYtToJWmjqW9CZchXgIh+MScYrqfeJOckZmZJltFjTHRsOqqdy9cpLyEK9p
	EENTw/cNFmvm14+WioFLg8IYxQ/Urm2mAFbQiJtrqoHXNyxR5RNJg==
X-Received: by 2002:a05:6830:2a0e:b0:7e7:571:114e with SMTP id 46e09a7af769-7eda08eb88cmr1835909a34.20.1784309671288;
        Fri, 17 Jul 2026 10:34:31 -0700 (PDT)
Received: from [127.0.1.1] (174-29-11-8.hlrn.qwest.net. [174.29.11.8])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7edad965130sm1677212a34.11.2026.07.17.10.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 10:34:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 17 Jul 2026 11:33:59 -0600
Subject: [PATCH v2 3/3] mtd: rawnand: sunxi: fix H6/H616 controller timings
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-submit-sunxi-nand-h6-h616-timings-v2-3-225515107640@gmail.com>
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
index 791f495f6e82..3d91533a9f13 100644
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
+					nfc_timings->setup_cycles);
 
 	/* T2 <=> tCLH */
-	if (timings->tCLH_min > min_clk_period)
-		min_clk_period = timings->tCLH_min;
+	if (timings->tCLH_min >
+	    min_clk_period * nfc_timings->setup_cycles)
+		min_clk_period = DIV_ROUND_UP(timings->tCLH_min,
+					nfc_timings->setup_cycles);
 
 	/* T3 <=> tCS */
-	if (timings->tCS_min > min_clk_period)
-		min_clk_period = timings->tCS_min;
+	if (timings->tCS_min >
+	    min_clk_period * nfc_timings->setup_cycles)
+		min_clk_period = DIV_ROUND_UP(timings->tCS_min,
+					nfc_timings->setup_cycles);
 
 	/* T4 <=> tCH */
-	if (timings->tCH_min > min_clk_period)
-		min_clk_period = timings->tCH_min;
+	if (timings->tCH_min >
+	    min_clk_period * nfc_timings->setup_cycles)
+		min_clk_period = DIV_ROUND_UP(timings->tCH_min,
+					nfc_timings->setup_cycles);
 
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
+					nfc_timings->setup_cycles);
 
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
+					nfc_timings->setup_cycles);
 
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

