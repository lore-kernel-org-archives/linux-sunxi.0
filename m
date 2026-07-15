Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9556E70809
	for <linux-sunxi@lists.linux.dev>; Wed, 15 Jul 2026 01:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784079120; cv=none; b=Tozd3kWWZuLWbF9VyvInypODonCRRVa71Jy3gFDweYccV/vLN0JMPVCiyxAvdKd2tYSbC6mmSu4Wdv4nCL4ERET4ptfgSCVEki7ISrFJFSG9aapn8lry51540P88n8ucNcwZPlK9txBqc0f7ZgTjhpI/YCmHpRk/f/Fk43jXKII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784079120; c=relaxed/simple;
	bh=mpCqJ1h6RnxILwnkmGXRpNCMXoBxYvpv+WHKRuAetwA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S4U9e2xdd8vbGGVzh1V4Gw51H6VVoSKll1BGsd/aLOmyZUWpzQrr1lweIUpSi+F/wlaW+ng1et6lPU8kxGRnYhLPIOzsaF42NAJFhfez0lOt/JZS/QEZDPDTZIEKoPnGryk7C9Tg3l74F11E35hohBLR5rSUyJJTNK2gog3Gaxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RCC4cR6p; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RCC4cR6p"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7eb5bdb50fcso781900a34.1
        for <linux-sunxi@lists.linux.dev>; Tue, 14 Jul 2026 18:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784079116; x=1784683916; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4RLro0zVrzQrjAPm6l1qYto9Dw+jSbq9LMC2c97EwCE=;
        b=RCC4cR6pn841Xj+ZwP8ZsioWPIdW6SRzJF/zCJJiUw2HNZY1U5m4O9ivhmGZx/6f7W
         YxQ78CagR9xHfYfyJlpVEeZa1xBvP1x9Sdo23J6UHDQaVhr5p6i0+S+Xc3x7VRzpD0K9
         Jrj4FbitMA9q6GD7mFu/P9Jq76yXiHDlHxY3+5iKA7tE3VCyQSX1KR7Se3vw/6QWKXMZ
         ZOXVcNJq3YjoxZ7w/eN7RGWYk+pA+eTzeKuPf/t2GtgdJO5gIBdH1ILDEpsFrYLcp7Jn
         0EmpRh71BjDnDTgKvCAbgzgF62Af/VAAW4Gnt2mpmHWqtfVvwz/aFpJuGBYotYzNoNzx
         h+Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784079116; x=1784683916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4RLro0zVrzQrjAPm6l1qYto9Dw+jSbq9LMC2c97EwCE=;
        b=Hf86TlrSrTde64YFXqE4ndtx69gC600V/YKm34ALZnoE3rCVWDX26m9ZCht6CAhLF9
         qfZtu9kb5Ypb248xyXnPFCQByP5itOBFFyTHGq0fpONVYDBPHzpH9JejAm0x8H7BbUqK
         KDVMNXug49kdufdteyPRI+C+gmdkLpxUocMyHwtNdkvk7qmPSZcE8JM4uNlxNbxU6q8a
         7W9IHs782fRGTBvWqg7n9NEnUJHBSjdFLzlfQBQa+XCw16SXiD4SlJtMA7lmL6dPU2at
         CizuTPrEbze9+x61WFJfmKhrYihEfnNXqeAEeVHxrNr8G+UAt+Rhso9TIT4F6P6P/xdq
         QFTA==
X-Forwarded-Encrypted: i=1; AHgh+Rroa4IRa6nkuvU52a5jCIuQ/mm7yny3R99l6j9C41SFk0cWjmUTMHPUYcAm9l6xZJvM+3EMF+MO829kzg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+HYzH9ZhdKAF+TbzFiq73lYwNXe8HwnW9OvpZikCy/FuMpm6N
	wKVnSTGfREPv02X4taIYUzPfxDmiX2qlT4msFwgVs+DSHgdr0Q/ngI6G
X-Gm-Gg: AfdE7ckfQXuRVu2xkoFMqSWzqgt6C1ADYyD529LOZZEEsmgvLBWaXZmR/zRlmN+oltR
	hwyKFDoq8Y6vvijabo0IH9arP9hatkHpCoZLHUcyK7uhONMgypIZtbU5JFy17T0ujMXInkmFlQK
	z+MsDDA8y+AdedrmxKP28T7wVmzmyeydFcVgcOcKHTUhLA+HYrT9rwK0cBim02r1Zgp3gJlqFF+
	eA/skULC8GMwR05GAhStQhRW/dREjKgwAQ68K8OcPEMo7T7J2cXmFtrSBNwRqy3IeePnqxc3tVE
	96NBk2teL/VQYAUymDLKUP+zqfJjpoEaTvNMVgmshHYKLB67SkDdEVIRCZ7AHDKVj2FodwfMnsg
	K4GNLCLZ+nlk7awakNOjYglw5xFq6LBbWias6T+5TbNF+N89dAhLW5e3gFlbcdvWG0NqC8rvwAA
	rDWV1mXYH8W7/eNHoC4TuRYIh/NE22Rmc27FGgudFpqCSaFTg+nXbvIvTBycnwkNNg6slTIf+N/
	jPGNzG9bKHQ0xfbFuBpRpEB9jWc252U0ZydyFPj7lH/c0GjxK3tq6e1chDKDzT73YCr0RvZX2jT
	UmUNEm97qw==
X-Received: by 2002:a05:6830:2306:b0:7e9:ead3:4449 with SMTP id 46e09a7af769-7ec0967b3e2mr9849272a34.6.1784079116368;
        Tue, 14 Jul 2026 18:31:56 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-11-8.hlrn.qwest.net. [174.29.11.8])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcafda2ffsm16289012a34.12.2026.07.14.18.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 18:31:55 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: linux-mtd@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: James Hilliard <james.hilliard1@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: rawnand: sunxi: fix H6/H616 controller timings
Date: Tue, 14 Jul 2026 19:31:38 -0600
Message-ID: <20260715013142.640977-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NAND timing calculation was written for the original A10 NDFC. It
assumes command and address setup and hold intervals T1-T4, T7 and T11
are one controller clock and uses the A10 timing-register encodings.

The H6/H616 NDFC instead defines those intervals as two internal clock
cycles and uses different encodings for tWB, tADL, tWHR and tRHW, as
documented in the H616 User Manual.

Describe the timing characteristics in the controller capability data
so the clock solver can select a rate permitted by the NAND SDR timings
and program valid delay fields. Keep the legacy A10 behavior unchanged.

Fixes: 88fd4e4deae8 ("mtd: rawnand: sunxi: Add support for H616 nand controller")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 140 +++++++++++++++++-------------
 1 file changed, 82 insertions(+), 58 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 02647565c8ba..9b7d17b6d81a 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -237,6 +237,18 @@ struct sunxi_nand_hw_ecc {
 	u32 ecc_ctl;
 };
 
+#define SUNXI_NFC_TIMING_STEPS	4
+
+/* Delay arrays contain internal NDFC clock cycles for field values 0 to 3. */
+struct sunxi_nfc_timings {
+	/* Internal clock cycles used by T1-T4, T7 and T11. */
+	u8 setup_cycles;
+	u8 tWB[SUNXI_NFC_TIMING_STEPS];
+	u8 tADL[SUNXI_NFC_TIMING_STEPS];
+	u8 tWHR[SUNXI_NFC_TIMING_STEPS];
+	u8 tRHW[SUNXI_NFC_TIMING_STEPS];
+};
+
 /**
  * struct sunxi_nand_chip - stores NAND chip device related information
  *
@@ -301,6 +313,7 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
  *			bytes to write
  * @nuser_data_tab:	Size of @user_data_len_tab
  * @sram_size:		Size of the NAND controller SRAM
+ * @timings:		Controller timing characteristics
  */
 struct sunxi_nfc_caps {
 	bool has_mdma;
@@ -327,6 +340,7 @@ struct sunxi_nfc_caps {
 	unsigned int nuser_data_tab;
 	unsigned int max_ecc_steps;
 	int sram_size;
+	const struct sunxi_nfc_timings *timings;
 };
 
 /**
@@ -1667,16 +1681,35 @@ static int sunxi_nfc_hw_ecc_write_oob(struct nand_chip *nand, int page)
 	return nand_prog_page_end_op(nand);
 }
 
-static const s32 tWB_lut[] = {6, 12, 16, 20};
-static const s32 tRHW_lut[] = {4, 8, 12, 20};
+static const struct sunxi_nfc_timings sun4i_a10_nfc_timings = {
+	.setup_cycles = 1,
+	.tWB = { 6, 12, 16, 20 },
+	.tADL = { 7, 15, 23, 31 },
+	.tWHR = { 7, 15, 23, 31 },
+	.tRHW = { 4, 8, 12, 20 },
+};
+
+static const struct sunxi_nfc_timings sun50i_h6_nfc_timings = {
+	.setup_cycles = 2,
+	.tWB = { 28, 44, 60, 76 },
+	.tADL = { 0, 12, 28, 44 },
+	.tWHR = { 0, 12, 28, 44 },
+	.tRHW = { 8, 24, 40, 56 },
+};
+
+static void sunxi_nand_update_min_period(u32 *min_period, u32 duration,
+					 unsigned int cycles)
+{
+	*min_period = max(*min_period, DIV_ROUND_UP(duration, cycles));
+}
 
-static int _sunxi_nand_lookup_timing(const s32 *lut, int lut_size, u32 duration,
-		u32 clk_period)
+static int sunxi_nand_lookup_timing(const u8 *lut, u32 duration,
+				    u32 clk_period)
 {
 	u32 clk_cycles = DIV_ROUND_UP(duration, clk_period);
 	int i;
 
-	for (i = 0; i < lut_size; i++) {
+	for (i = 0; i < SUNXI_NFC_TIMING_STEPS; i++) {
 		if (clk_cycles <= lut[i])
 			return i;
 	}
@@ -1685,14 +1718,12 @@ static int _sunxi_nand_lookup_timing(const s32 *lut, int lut_size, u32 duration,
 	return -EINVAL;
 }
 
-#define sunxi_nand_lookup_timing(l, p, c) \
-			_sunxi_nand_lookup_timing(l, ARRAY_SIZE(l), p, c)
-
 static int sunxi_nfc_setup_interface(struct nand_chip *nand, int csline,
 				     const struct nand_interface_config *conf)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(sunxi_nand->nand.controller);
+	const struct sunxi_nfc_timings *nfc_timings = nfc->caps->timings;
 	const struct nand_sdr_timings *timings;
 	u32 min_clk_period = 0;
 	s32 tWB, tADL, tWHR, tRHW, tCAD;
@@ -1703,77 +1734,65 @@ static int sunxi_nfc_setup_interface(struct nand_chip *nand, int csline,
 		return -ENOTSUPP;
 
 	/* T1 <=> tCLS */
-	if (timings->tCLS_min > min_clk_period)
-		min_clk_period = timings->tCLS_min;
+	sunxi_nand_update_min_period(&min_clk_period, timings->tCLS_min,
+				     nfc_timings->setup_cycles);
 
 	/* T2 <=> tCLH */
-	if (timings->tCLH_min > min_clk_period)
-		min_clk_period = timings->tCLH_min;
+	sunxi_nand_update_min_period(&min_clk_period, timings->tCLH_min,
+				     nfc_timings->setup_cycles);
 
 	/* T3 <=> tCS */
-	if (timings->tCS_min > min_clk_period)
-		min_clk_period = timings->tCS_min;
+	sunxi_nand_update_min_period(&min_clk_period, timings->tCS_min,
+				     nfc_timings->setup_cycles);
 
 	/* T4 <=> tCH */
-	if (timings->tCH_min > min_clk_period)
-		min_clk_period = timings->tCH_min;
+	sunxi_nand_update_min_period(&min_clk_period, timings->tCH_min,
+				     nfc_timings->setup_cycles);
 
 	/* T5 <=> tWP */
-	if (timings->tWP_min > min_clk_period)
-		min_clk_period = timings->tWP_min;
+	sunxi_nand_update_min_period(&min_clk_period, timings->tWP_min, 1);
 
 	/* T6 <=> tWH */
-	if (timings->tWH_min > min_clk_period)
-		min_clk_period = timings->tWH_min;
+	sunxi_nand_update_min_period(&min_clk_period, timings->tWH_min, 1);
 
 	/* T7 <=> tALS */
-	if (timings->tALS_min > min_clk_period)
-		min_clk_period = timings->tALS_min;
+	sunxi_nand_update_min_period(&min_clk_period, timings->tALS_min,
+				     nfc_timings->setup_cycles);
 
 	/* T8 <=> tDS */
-	if (timings->tDS_min > min_clk_period)
-		min_clk_period = timings->tDS_min;
+	sunxi_nand_update_min_period(&min_clk_period, timings->tDS_min, 1);
 
 	/* T9 <=> tDH */
-	if (timings->tDH_min > min_clk_period)
-		min_clk_period = timings->tDH_min;
+	sunxi_nand_update_min_period(&min_clk_period, timings->tDH_min, 1);
 
 	/* T10 <=> tRR */
-	if (timings->tRR_min > (min_clk_period * 3))
-		min_clk_period = DIV_ROUND_UP(timings->tRR_min, 3);
+	sunxi_nand_update_min_period(&min_clk_period, timings->tRR_min, 3);
 
 	/* T11 <=> tALH */
-	if (timings->tALH_min > min_clk_period)
-		min_clk_period = timings->tALH_min;
+	sunxi_nand_update_min_period(&min_clk_period, timings->tALH_min,
+				     nfc_timings->setup_cycles);
 
 	/* T12 <=> tRP */
-	if (timings->tRP_min > min_clk_period)
-		min_clk_period = timings->tRP_min;
+	sunxi_nand_update_min_period(&min_clk_period, timings->tRP_min, 1);
 
 	/* T13 <=> tREH */
-	if (timings->tREH_min > min_clk_period)
-		min_clk_period = timings->tREH_min;
+	sunxi_nand_update_min_period(&min_clk_period, timings->tREH_min, 1);
 
 	/* T14 <=> tRC */
-	if (timings->tRC_min > (min_clk_period * 2))
-		min_clk_period = DIV_ROUND_UP(timings->tRC_min, 2);
+	sunxi_nand_update_min_period(&min_clk_period, timings->tRC_min, 2);
 
 	/* T15 <=> tWC */
-	if (timings->tWC_min > (min_clk_period * 2))
-		min_clk_period = DIV_ROUND_UP(timings->tWC_min, 2);
+	sunxi_nand_update_min_period(&min_clk_period, timings->tWC_min, 2);
 
 	/* T16 - T19 + tCAD */
-	if (timings->tWB_max > (min_clk_period * 20))
-		min_clk_period = DIV_ROUND_UP(timings->tWB_max, 20);
-
-	if (timings->tADL_min > (min_clk_period * 32))
-		min_clk_period = DIV_ROUND_UP(timings->tADL_min, 32);
-
-	if (timings->tWHR_min > (min_clk_period * 32))
-		min_clk_period = DIV_ROUND_UP(timings->tWHR_min, 32);
-
-	if (timings->tRHW_min > (min_clk_period * 20))
-		min_clk_period = DIV_ROUND_UP(timings->tRHW_min, 20);
+	sunxi_nand_update_min_period(&min_clk_period, timings->tWB_max,
+				     nfc_timings->tWB[SUNXI_NFC_TIMING_STEPS - 1]);
+	sunxi_nand_update_min_period(&min_clk_period, timings->tADL_min,
+				     nfc_timings->tADL[SUNXI_NFC_TIMING_STEPS - 1]);
+	sunxi_nand_update_min_period(&min_clk_period, timings->tWHR_min,
+				     nfc_timings->tWHR[SUNXI_NFC_TIMING_STEPS - 1]);
+	sunxi_nand_update_min_period(&min_clk_period, timings->tRHW_min,
+				     nfc_timings->tRHW[SUNXI_NFC_TIMING_STEPS - 1]);
 
 	/*
 	 * In non-EDO, tREA should be less than tRP to guarantee that the
@@ -1789,26 +1808,28 @@ static int sunxi_nfc_setup_interface(struct nand_chip *nand, int csline,
 	if (timings->tREA_max > min_clk_period && !timings->tRLOH_min)
 		min_clk_period = timings->tREA_max;
 
-	tWB  = sunxi_nand_lookup_timing(tWB_lut, timings->tWB_max,
+	tWB  = sunxi_nand_lookup_timing(nfc_timings->tWB, timings->tWB_max,
 					min_clk_period);
 	if (tWB < 0) {
 		dev_err(nfc->dev, "unsupported tWB\n");
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
 
-	tRHW = sunxi_nand_lookup_timing(tRHW_lut, timings->tRHW_min,
+	tRHW = sunxi_nand_lookup_timing(nfc_timings->tRHW, timings->tRHW_min,
 					min_clk_period);
 	if (tRHW < 0) {
 		dev_err(nfc->dev, "unsupported tRHW\n");
@@ -1824,7 +1845,7 @@ static int sunxi_nfc_setup_interface(struct nand_chip *nand, int csline,
 	 */
 	tCAD = 0x7;
 
-	/* TODO: A83 has some more bits for CDQSS, CS, CLHZ, CCS, WC */
+	/* TODO: A83 and H6 have more bits for CDQSS, CS, CLHZ, CCS, WC */
 	sunxi_nand->timing_cfg = NFC_TIMING_CFG(tWB, tADL, tWHR, tRHW, tCAD);
 
 	/* Convert min_clk_period from picoseconds to nanoseconds */
@@ -2595,6 +2616,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_a10_caps = {
 	.nstrengths = ARRAY_SIZE(sunxi_ecc_strengths_a10),
 	.max_ecc_steps = 16,
 	.sram_size = 1024,
+	.timings = &sun4i_a10_nfc_timings,
 };
 
 static const struct sunxi_nfc_caps sunxi_nfc_a23_caps = {
@@ -2617,6 +2639,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_a23_caps = {
 	.nstrengths = ARRAY_SIZE(sunxi_ecc_strengths_a10),
 	.max_ecc_steps = 16,
 	.sram_size = 1024,
+	.timings = &sun4i_a10_nfc_timings,
 };
 
 static const struct sunxi_nfc_caps sunxi_nfc_h616_caps = {
@@ -2641,6 +2664,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_h616_caps = {
 	.nuser_data_tab = ARRAY_SIZE(sunxi_user_data_len_h6),
 	.max_ecc_steps = 32,
 	.sram_size = 8192,
+	.timings = &sun50i_h6_nfc_timings,
 };
 
 static const struct of_device_id sunxi_nfc_ids[] = {
-- 
2.53.0

