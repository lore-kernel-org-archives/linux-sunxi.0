Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A23476CEC
	for <linux-sunxi@lists.linux.dev>; Fri,  7 Aug 2026 15:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786117153; cv=none; b=B/GDrpjRfYd10ShwGFsoxGvoL40ahIslsbsSZW7GLEDvKK1E4qAonlKTRjGjV2YK5h2XKIQuAqU2BV2dAscj9TFUDdvEz99AglRUzF53OZ1xuwHCmaLYyOGnjKEgSqTvx9D3AzspxkfmrbFsyXJrty6/KX0rfA2mpN7EbRezsNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786117153; c=relaxed/simple;
	bh=2FMplYOhzsgtvnRdbTNiLAZSTZm3+8XCX5VqoyndQro=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BjNDX3icJ/zRioslORoyF9QbOaBYZ4VFmKdGFLFX3luUoF1LmaM3b+vf2TRFLFcd+jXpnO2LFKvrBc7//MIzycUhrFReNhKuu/Z1SUFVabNS6Cc+ik6AwmvWNqjlYvM6wuudB0CFpBiuNNXKVcL0Te7xyOdTmk3rrF/NVkh1Wew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J6cnuV8J; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J6cnuV8J"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-495b98b4f6aso1291089b6e.2
        for <linux-sunxi@lists.linux.dev>; Fri, 07 Aug 2026 08:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786117150; x=1786721950; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BH5d83nxZVwUU/yrlx0wCDcJDqfJzuP8B2aoypwvUDg=;
        b=J6cnuV8JUYWIX3rHlEAgvU/vGmsSR16H27waERBA/9br2HtjhWXecQqAcIqtu3HhBc
         3TNgIst7s/aIla5Es7ZxHt3A4kREe26QP81zXdbmjUvvG3Dy4cbWglVzLKhRMv0eoqtj
         Iyh8YN0mFZEtn1r+/5wAzdo2kKDwLF1otQVE2MDCiDzJv2CLH995AOXoXqHVkE0k/rwq
         24FlpDoDloe6IZamygkY5KhUvWRFoszjzSdjyUUgYL7MFeMx0XZSL4Q/RsRbXXKAbSPT
         Fib0CPWacm7j3Ufo4aBYIHZzTT/M2/WupED6Ee/UiRHdkFip3axOlwylp2yt/3RYffd4
         TmNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786117150; x=1786721950;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BH5d83nxZVwUU/yrlx0wCDcJDqfJzuP8B2aoypwvUDg=;
        b=h+X6nrS6rfZ7hwmeXqJfgGgdwidtHyeTD8Df067MVY6gIyQ/aM4RA8ayl61/kwcHJG
         G8Y9mLxt8QczAmWmEnx10JL8l3jupK0wsXHpy7acytDhlUiB9bZLptVRagWP2ZnpztDq
         9qbtw2nUpbN5ChUJCIiADYgY0ketAZTitEw1TkqFz3YO5RYrrvkHd+5zg8fNPtSkrAdO
         zxZCkCb1GQ2RG3nOrDnZ6OvNz/mrV9q4aKdDkCYkRGz2/RSHuAfchLTicntK3e8UHqxW
         ur6CF6zBq5RiKfhj+FM5crdrpNkIYLnjfyaF1GbxxflNRFNnD4ofv+PBKgluhud+6dCY
         5y1g==
X-Forwarded-Encrypted: i=1; AHgh+RruWk3b+Ps9Xa4xaGy1obF0gEqcnjP9HCR3eShTi3y0LUdEWqPfcXlOUEwF1AOhQZjofDTZfbi/IES47w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzKWK7gVcGkzgAjF5clnt58DIH//r6fKoXrC2ORmkojm5sEi0LT
	EcwSCs8XeYedBzUP6BHL9rk5Tta//jqZ0BlPKAzAf2imAE/zyrGC6QjP
X-Gm-Gg: AR+sD13VOFIt4YrqQntCG7H7abiAUHCXVl55eyCWT6t6nK3YxBzjPd8WjxGXfk3vNur
	BzSV42lLCuMRAYU0F/bWHVu7Zg/yaCqwenbu/QsQLynUdxFTVWc53WFlxsoRHhh3YGQp2GmlwNK
	+wDfZuNzmaq+uBnvJciHAcXzTBEx6Ofw/hLfhO+nUfh4F6pHz31Kaab9QiVB1rHLMJIt6VnwPMR
	HN+s9mMFnnZl5PL9kBDTC3sLTs8ye1BrqoCFA30G5rfumtOYALJz77ZF3H94OyaakdwWAlQa2Vj
	S+q25/JEUsqcuNWrNQM+8T2/2WpkRhIZTBI2CSEK38LUUs4Qa3mY1tr1LjAVsdg0OCMjGtqSNYy
	NxlZjYby/0b8Yeq17ZqycQ0si+vh3h2B/uYAG1k1chg6KCl1LaY88i03FH0xntJR5dBaQr70MgX
	5w8wZ6PLMP2QXAe4/dDcfE1973HtSlskEMUdk9KfyGg75gs190QdYyBCz4pkib/Mvfq8Yo5VvhU
	q1FK1tGkbtbQM5INU0KQ6z/Jrv+YI3IwzO5YF0HGkDioS9ecEEzWU0f09pF6NnbnMe2/SnVF43F
	IpeSGn/c7s8T99h7u9XExdNsb+lRVY/CAL6UuanZGoFrxo4+CA+y1TyGAtIKdZjMzqc/004k5mB
	3MEY57J1qYE8VRc5b
X-Received: by 2002:a05:6808:ec3:b0:4a4:a693:9d87 with SMTP id 5614622812f47-4afadf0e523mr11310972b6e.5.1786117150060;
        Fri, 07 Aug 2026 08:39:10 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4afae706cd5sm7353485b6e.11.2026.08.07.08.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 08:39:09 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 07 Aug 2026 09:38:59 -0600
Subject: [PATCH v3 1/3] mtd: rawnand: sunxi: group controller delay tables
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-submit-sunxi-nand-h6-h616-timings-v3-1-91287b543f41@gmail.com>
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

The tWB and tRHW timing field encodings are controller properties, but
they currently live in standalone lookup tables.

Group them in a timing descriptor selected through the controller
capability data. Point every existing controller at the legacy values so
this is a pure preparation change.

Fixes: 88fd4e4deae8 ("mtd: rawnand: sunxi: Add support for H616 nand controller")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 36 ++++++++++++++++++++++++++++--------
 1 file changed, 28 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 02647565c8ba..9885248c9b85 100644
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
+					      nfc_timings->tWB[SUNXI_NFC_TIMING_STEPS - 1]);
 
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
+					      nfc_timings->tRHW[SUNXI_NFC_TIMING_STEPS - 1]);
 
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

