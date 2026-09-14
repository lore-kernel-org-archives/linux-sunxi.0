Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03304A3D3C
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Sep 2026 21:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789420224; cv=none; b=kwrBdOyiyCkSLz35WcTFkwOYVeDUMEPEr/iOh4R4v7TqTVNt9sJxWtGDE+1MtbyJ0c+AGUbzsfri+DDG3GgRP10QmeRz1BG51gNYT5CZOWP6dMK2C6HIBiOTuRMJOLmX//V7IAauqxIBESfZ4oHJ/8RFGbVFr2XVl6jR8dfsNW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789420224; c=relaxed/simple;
	bh=ZhwsgqB5mjFiVy7QQ4USypPx8q5jZF5EM5tixdJx7b8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UTLHH3UNmpB+VXe3R4IHSDwMFxfvdte6BRooc7q4845+XIO1nsPVDcEOEDY0C0CcFR6rpCjIpAAv0vSUHKKjJVPLEnoMtIvrDgiM++me9vk39xIUnGrOz0PGvoLtGblYXmXES4dnt81LbgVV71hr0cPN3n/z3S7c6IqLgfhD4MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jcCAaOVM; arc=none smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jcCAaOVM"
Received: by mail-oo2-f43.google.com with SMTP id 006d021491bc7-6b1ae6c9b72so450449eaf.0
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Sep 2026 14:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789420217; x=1790025017; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7XwVosOtOADwbw6wxbVAGv82uPNwv85si6C2vLS4JkM=;
        b=jcCAaOVM1i6zck047/3ikxVaKOxjiaZ9YaNMpizVaMZ7mPJk90q9fjWslpUUngng+1
         pO0aywt+apTBllq5KvifMcFhL4g1XWGMonDd80zpmhw5bDSu3r+8LkmyO4b5B8dM4KvS
         iSpiX4BssE7hIUnEC4g7vdOltHBtxGvtTEpG7xNxv4l81GXVZUP4wYVD3ndf49kZlcLW
         hAvCozeGY9Upd02CkvcI6mXaxHfMTqPbb+mw1nRt/fBVNnv0w2062KaBIwnizmUwCoN0
         ZVVd7bZeI8kWdWy2/mPhWaxex/GAVWqXyBkVU0A4fSpfRAOfnRAZFcn3Ia60C0oG4BwC
         CgRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789420217; x=1790025017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7XwVosOtOADwbw6wxbVAGv82uPNwv85si6C2vLS4JkM=;
        b=b1N6ko/uMpqXb1cPFlNrBruBKHYWZ6vDRoctqC0JMk9kBzEHZkX/n02FJgCitcb0Kw
         R5/uSUdRM3yToIDNZRJFGPNb2+qiD/AKp/9fdPARX+i7KpOO93L9KjP+lW79fHZsP1sE
         os+jTG7C2opnMRqDGrTb/TPVVkLVMypYCbFecxg4vk713Pa7rdxr737QNsF4qAZ7kAZC
         IrPtQr1hH7pAcslXoD14tCLU5FNtI+XBHXzhTz8iuoEYD1FcNTOT9R/4rsXt7HT787P0
         mwUXqscue56ipf8j5DY5F4urDlR3HmB/YfYY4qD2HTxDz2fwz0KGF2mpT3H5H6je4lZE
         sOng==
X-Forwarded-Encrypted: i=1; AKwUvByEbyp73QqyQMBFsaWvxN1rDuwO3ZM4jZkfApTk+3EtLD8/fmaPaVRfNhgaU2CEVK+vegj1g2mXV9+OVA==@lists.linux.dev
X-Gm-Message-State: AFuF++m8DBpaGDRuzZZcmr7CrBZm1Sa7dsYx+jZuP56DrH1n0fLNdAOe
	9cYfa6BRdIIsaccW9IAM1esRW1jNKQGEwEItelsLVDL1mGHRTz8B2O1B
X-Gm-Gg: AYBFou3Ct4dvCX0XsMMUB4OrWzztnUlRtK39z4QJK3+OjVUaqgxJhRZXpAwLja8uLcK
	k0AVtkLEoxZKsSKRhrA+qeaffcKvWtJEPjG70yX7Whu7pKlJAI7ubB0gP5EhnnifMhKMCobuQtS
	smqWV+OVDZqnMjtDRJRKTy0OlJttLAEJLcvGUle547RS+1mLOt0MpyO1DloJbQ0UwhZNC7GCES7
	kmJnd4dsKwrbDiGV54L62URdWKJ2Z2DIXz06Jg1nVpuLnDLkbsJcXRJPP8fTRHmwjBQIqLsAIcF
	D6MSU5pZo/crGy52y8zpITMAibmnoSabCTI2OdktCfmmtxEuBRIH4av/QPZ06jbQUgwgChrSz/d
	fGqW3Uy7g0ktC+1RR8dwJcODM21G4wK2GGl6ViILkJyZ8XfaW3k2lXLkhTiEorZTYvMMVrqf7qv
	KH4OuMf3NUulOQWIkkCUjUxFuvRKbSjX3WZosTDQhZXFxqkPjO9spfcZrFg4nYi3Rd2Ah+M90z4
	30w+o2kXm+MaCxbCR+azjNU7mnti0mi7uX+q0W5fuQVSrv0RqMpWhD1TdLpy4DI4FZ8wpOHd+u8
	cHKJuto9e2sjx4jVxX7/kmWb1k3MuIVAWTEioFeu+valG6sGNu9L2hoqVBz6OqF2RighBXiUNOI
	UD/jEt6fXinTLL44Uf9Fth4ctVOQg
X-Received: by 2002:a05:6820:1890:b0:6b5:ec3f:497b with SMTP id 006d021491bc7-6c639498c9bmr552266eaf.22.1789420217054;
        Mon, 14 Sep 2026 14:10:17 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c45bfc3fe9sm4698544eaf.15.2026.09.14.14.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:10:16 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Sep 2026 15:10:02 -0600
Subject: [PATCH v6 16/18] mtd: rawnand: sunxi: avoid duplicate chip setup
 before page commands
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-16-2fb084fe0751@gmail.com>
References: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
In-Reply-To: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
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

The page helpers invoke exec_op(), which selects the chip and programs
its timing and spare-area registers. Remove the identical setup directly
before those helpers in the read callbacks and PIO write callbacks.

Keep explicit selection in the DMA write callback: it accesses controller
registers and prepares DMA before issuing the program-begin operation.
Do not cache controller state or change selection after a controller reset.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index f3234d2831ea..773ba55ecc07 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1808,8 +1808,6 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 	int ret, i, cur_off = 0;
 	bool erased_chunk_found = false;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1858,8 +1856,6 @@ static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 {
 	int ret;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1888,8 +1884,6 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 	if (sunxi_nand->randomized_oob)
 		return sunxi_nfc_hw_ecc_read_page(nand, bufpoi, false, page);
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1930,8 +1924,6 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 	if (to_sunxi_nand(nand)->randomized_oob)
 		return sunxi_nfc_hw_ecc_read_page_dma(nand, buf, false, page);
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1955,8 +1947,6 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret = 0, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -2000,8 +1990,6 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret = 0, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;

-- 
2.53.0

