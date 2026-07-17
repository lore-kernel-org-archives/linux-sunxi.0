Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202FF3F9293
	for <linux-sunxi@lists.linux.dev>; Fri, 17 Jul 2026 17:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784309670; cv=none; b=QPYPNE+md0F/w+28+yqRKow4DBFV/aSAusVdiByFBNFpKhV/tBzr6FLcdbh80BpGCxEtDuXcL5OWF1AmeIzLgt5ybPfxwR/TLPcfCwXEAPZhK2ejKv2NJ/c+F/LfZzLwtdG0qMaesCZUQpY6BC87VUYSmrHbNqJB1rMmQ04Ua0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784309670; c=relaxed/simple;
	bh=f+Q3D9sl+haJbd8q6IQSARPqlTZdxv8bfThP1g3/NoA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Oz4PfQwPL8oPcC4t26yDvwBQaWpg1idUM6cp8bSJ3twKvcwYnlcdJoAGm2fRn9BlB613/o2C583Za46EKJdD3p9UR5UTx7i3ZN3og5nay9+TQGUp+/rYhSmAOQmiYhEdYieL/DvDjHY4p510m6ompbhDXcLrhElkyc4ziFycbRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g3GpMqPR; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g3GpMqPR"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7ec1e9d3359so3580994a34.0
        for <linux-sunxi@lists.linux.dev>; Fri, 17 Jul 2026 10:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784309668; x=1784914468; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VlsKLWHzuG2ZqAxSmlNnrAEdRDdQeGiW44cbYcWz6fU=;
        b=g3GpMqPR/9VDiW2CkqhMHXVIH7XYuN8LOo4iz0n3yx+2X3fNdKXBOWlGNNpaDuXM1E
         jnmUCkq15YB80SFKTtWTNBeicEMU7+d5sX7wFhISdg7Ov0iE0fOtDJM5kYo+xkdgvrML
         0u7XbmOBpTfw0LKgOUXaoaa007DDoGze8qxjjpnm9id/wbg0RrbBJ1ZNGydYfuC7NnNM
         PH1kf0Z2tfHMCUFN30YqqQuRlXFjW6kknGV1Sgu0kWOJPRTzVZWUugUTOfIXkU2nD9iS
         DwpQlNBUnwNstoZmDOR0OYp6H7K1cPatC1gQ9Vm9k5tVTzCvKWfUGZcEEpEw5MDCcAYp
         HnKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784309668; x=1784914468;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VlsKLWHzuG2ZqAxSmlNnrAEdRDdQeGiW44cbYcWz6fU=;
        b=mzB6iAt5NGOQwtMjwYvXEaS3bHP3IaKCUAlrMKGRrywbR0fJq5xugL1YUxapC5anYi
         sX9+tkehyKNP9Gy66cVo+kGe5S/ObWLCPdFg8C7Wpp6EJZp7t9FFqnj/YB+MNwcs2xuu
         D+KUZGI4QkNcBjpyD4edxHPV6SVNBc2so8cR4Q8r2PND4QEB663bw6xj/PM/IN9DEsVo
         GVO5E82FqBs+KlmHKhXHXv3UbATS9dzRizWq9N8aU6J9TfPhaKxtO2dgaFC3NibOWX+6
         fhs8DOAfEKYgSXCXnztXW/crllo5xeILLh1FA7yOz2KqjHhG9JY7zhxNap9uvxJGm48w
         MANQ==
X-Forwarded-Encrypted: i=1; AHgh+RpSUezV+OrcUFLw9KQpM+J4R7sFdW/V60liZpQ4EUWmqRvO60ipn2JNRaTcM9ZXg2VBCr/9xu7kcRxPOg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2XJd21j8Ii3xfsd0FA37jdBO5uYTIe/Luw/oPXyOzGOAW5CEY
	j9DPBSHWDyg21jSih1qDoIuukaFzrydk8IKoAiBli2czipuYg1+raiz/
X-Gm-Gg: AfdE7clbDBuiU2IV2O54Ar1JqsWLM4HVdRtINO3zIMsTxd/JndI2RJX8X8DajTn162m
	hJJ0S7C8d2v0CxH/gK1FhZLdUrlW2hG7FdC8s+h4DGwwdWICkipLS8w/iXKnQ+qJt8jwq2xwJJG
	J9ln1JYulOdnU6QL2xepvkKtKvcWRwtI/0AxroQs0/LAHQDkEKdxdzJNBzLKUa7C0thAkq99oRT
	O7cg24doDCXTzEmCCyGx6GE3+SwP4r5KhxyojLlI+pOlEKG7q9UJMzhd42t6ZsmJ31cZOJ9j7fe
	cWuw47xEAy4rXzqRr4V7MDaMWAPyyOctvndyNyo/Z7lq7BxFz6moRFV66HaJ2BXh18oW6xmRcVH
	Wy9UpMItglaZ51YPFfiTlOq/9waDM1KsLiJOV70SQmuxkDkNglWa7bIcg+0CPAABXr+EnntB65M
	RieBnBoKUzFQxlVeovbPLOxs4OzgV0Ofvu97Ug2d54hJ5rOrN1QaqjQf/+XHuMw9PuOW29Ux3mB
	UQPAuF/jfnBZUyG2G/zsn5fakF9TCy6mUoT4JvkYYZeXxpV4vCuqQ==
X-Received: by 2002:a05:6830:6afa:b0:7e6:f4a3:1df5 with SMTP id 46e09a7af769-7eda08ae511mr1817637a34.1.1784309667752;
        Fri, 17 Jul 2026 10:34:27 -0700 (PDT)
Received: from [127.0.1.1] (174-29-11-8.hlrn.qwest.net. [174.29.11.8])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7edad965130sm1677212a34.11.2026.07.17.10.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 10:34:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 17 Jul 2026 11:33:57 -0600
Subject: [PATCH v2 1/3] mtd: rawnand: sunxi: group controller delay tables
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-submit-sunxi-nand-h6-h616-timings-v2-1-225515107640@gmail.com>
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

The tWB and tRHW timing field encodings are controller properties, but
they currently live in standalone lookup tables.

Group them in a timing descriptor selected through the controller
capability data. Point every existing controller at the legacy values so
this is a pure preparation change.

Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 36 ++++++++++++++++++++++++++++--------
 1 file changed, 28 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 02647565c8ba..d12cbb3c813c 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -237,6 +237,14 @@ struct sunxi_nand_hw_ecc {
 	u32 ecc_ctl;
 };
 
+#define SUNXI_NFC_TIMING_STEPS	4
+
+/* Delay arrays contain internal NDFC clock cycles for field values 0 to 3. */
+struct sunxi_nfc_timings {
+	s32 tWB[SUNXI_NFC_TIMING_STEPS];
+	s32 tRHW[SUNXI_NFC_TIMING_STEPS];
+};
+
 /**
  * struct sunxi_nand_chip - stores NAND chip device related information
  *
@@ -301,6 +309,7 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
  *			bytes to write
  * @nuser_data_tab:	Size of @user_data_len_tab
  * @sram_size:		Size of the NAND controller SRAM
+ * @timings:		Controller timing characteristics
  */
 struct sunxi_nfc_caps {
 	bool has_mdma;
@@ -327,6 +336,7 @@ struct sunxi_nfc_caps {
 	unsigned int nuser_data_tab;
 	unsigned int max_ecc_steps;
 	int sram_size;
+	const struct sunxi_nfc_timings *timings;
 };
 
 /**
@@ -1667,8 +1677,10 @@ static int sunxi_nfc_hw_ecc_write_oob(struct nand_chip *nand, int page)
 	return nand_prog_page_end_op(nand);
 }
 
-static const s32 tWB_lut[] = {6, 12, 16, 20};
-static const s32 tRHW_lut[] = {4, 8, 12, 20};
+static const struct sunxi_nfc_timings sun4i_a10_nfc_timings = {
+	.tWB = { 6, 12, 16, 20 },
+	.tRHW = { 4, 8, 12, 20 },
+};
 
 static int _sunxi_nand_lookup_timing(const s32 *lut, int lut_size, u32 duration,
 		u32 clk_period)
@@ -1693,6 +1705,7 @@ static int sunxi_nfc_setup_interface(struct nand_chip *nand, int csline,
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(sunxi_nand->nand.controller);
+	const struct sunxi_nfc_timings *nfc_timings = nfc->caps->timings;
 	const struct nand_sdr_timings *timings;
 	u32 min_clk_period = 0;
 	s32 tWB, tADL, tWHR, tRHW, tCAD;
@@ -1763,8 +1776,10 @@ static int sunxi_nfc_setup_interface(struct nand_chip *nand, int csline,
 		min_clk_period = DIV_ROUND_UP(timings->tWC_min, 2);
 
 	/* T16 - T19 + tCAD */
-	if (timings->tWB_max > (min_clk_period * 20))
-		min_clk_period = DIV_ROUND_UP(timings->tWB_max, 20);
+	if (timings->tWB_max >
+	    (min_clk_period * nfc_timings->tWB[SUNXI_NFC_TIMING_STEPS - 1]))
+		min_clk_period = DIV_ROUND_UP(timings->tWB_max,
+				nfc_timings->tWB[SUNXI_NFC_TIMING_STEPS - 1]);
 
 	if (timings->tADL_min > (min_clk_period * 32))
 		min_clk_period = DIV_ROUND_UP(timings->tADL_min, 32);
@@ -1772,8 +1787,10 @@ static int sunxi_nfc_setup_interface(struct nand_chip *nand, int csline,
 	if (timings->tWHR_min > (min_clk_period * 32))
 		min_clk_period = DIV_ROUND_UP(timings->tWHR_min, 32);
 
-	if (timings->tRHW_min > (min_clk_period * 20))
-		min_clk_period = DIV_ROUND_UP(timings->tRHW_min, 20);
+	if (timings->tRHW_min >
+	    (min_clk_period * nfc_timings->tRHW[SUNXI_NFC_TIMING_STEPS - 1]))
+		min_clk_period = DIV_ROUND_UP(timings->tRHW_min,
+				nfc_timings->tRHW[SUNXI_NFC_TIMING_STEPS - 1]);
 
 	/*
 	 * In non-EDO, tREA should be less than tRP to guarantee that the
@@ -1789,7 +1806,7 @@ static int sunxi_nfc_setup_interface(struct nand_chip *nand, int csline,
 	if (timings->tREA_max > min_clk_period && !timings->tRLOH_min)
 		min_clk_period = timings->tREA_max;
 
-	tWB  = sunxi_nand_lookup_timing(tWB_lut, timings->tWB_max,
+	tWB  = sunxi_nand_lookup_timing(nfc_timings->tWB, timings->tWB_max,
 					min_clk_period);
 	if (tWB < 0) {
 		dev_err(nfc->dev, "unsupported tWB\n");
@@ -1808,7 +1825,7 @@ static int sunxi_nfc_setup_interface(struct nand_chip *nand, int csline,
 		return -EINVAL;
 	}
 
-	tRHW = sunxi_nand_lookup_timing(tRHW_lut, timings->tRHW_min,
+	tRHW = sunxi_nand_lookup_timing(nfc_timings->tRHW, timings->tRHW_min,
 					min_clk_period);
 	if (tRHW < 0) {
 		dev_err(nfc->dev, "unsupported tRHW\n");
@@ -2595,6 +2612,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_a10_caps = {
 	.nstrengths = ARRAY_SIZE(sunxi_ecc_strengths_a10),
 	.max_ecc_steps = 16,
 	.sram_size = 1024,
+	.timings = &sun4i_a10_nfc_timings,
 };
 
 static const struct sunxi_nfc_caps sunxi_nfc_a23_caps = {
@@ -2617,6 +2635,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_a23_caps = {
 	.nstrengths = ARRAY_SIZE(sunxi_ecc_strengths_a10),
 	.max_ecc_steps = 16,
 	.sram_size = 1024,
+	.timings = &sun4i_a10_nfc_timings,
 };
 
 static const struct sunxi_nfc_caps sunxi_nfc_h616_caps = {
@@ -2641,6 +2660,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_h616_caps = {
 	.nuser_data_tab = ARRAY_SIZE(sunxi_user_data_len_h6),
 	.max_ecc_steps = 32,
 	.sram_size = 8192,
+	.timings = &sun4i_a10_nfc_timings,
 };
 
 static const struct of_device_id sunxi_nfc_ids[] = {

-- 
2.53.0

