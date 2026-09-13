Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478E9384CDF
	for <linux-sunxi@lists.linux.dev>; Sun, 13 Sep 2026 04:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789272312; cv=none; b=mY0aAXkpsCYceUQb8mCgIeN1T1cQGFhMVOKycsVU94x0wfBxUMqI4OGyW/ZHWrnViIDyZAwBymCL1i+SXyzsiiZuFkBCd0FC7DjW1w6djkBimPou/4qrMCeaIcaj3Efr0QnErlCy8yLTPGzlakhVabTBSqktr6B+hHR4cnlxsp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789272312; c=relaxed/simple;
	bh=pCshx7KzarhNGja6hjwZgV+xF1fwWKykuklNPxmL+JQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t6W32pe1AF3FkveH2DPQwPha195bvdwcSPEvlQsnQ/vKalmBu1Oqk2fHSVgNB/MApdevwDsM22xNkVbdQ5WYR8K2AqYrh1sw8YIgFPXY7/1o8wMaKWexTusHgPtvKsLvzLva66bmY5GPCXmp8OI9TIGw/f0juWUI/Rhkh/t7DT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IKS8xEI/; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IKS8xEI/"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c13f2685f2so717220b6e.1
        for <linux-sunxi@lists.linux.dev>; Sat, 12 Sep 2026 21:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272310; x=1789877110; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2jxU2MaLD6ynlliV/V4nmXeQrG06Mf6j7bRrOAd0XuY=;
        b=IKS8xEI/TH6Sbh4fRLik0It5kORiIPhxYsuoGnC3br/Kf7P3B2l5HGLS+LODTjL7VR
         tlFjRN0y7PYlLtmA47cHab1f9r7DQtL3gV5Fr8ouu3efKd0g55MNacTavuTCCPOL0pkG
         4x4dOMyLfCCMxldi9/M7S7PSIQmXxR9L/wKFhqQ4vrEEN1ffRwWeP46ZWpvRTgjdiH1j
         mjIKNKc6Os/SToimIsZgbVqfbn650sFZ8XRdvZgXCxgXyyA2ubI/TfEZklRf4zFwaPrN
         o5J5KzigoqEIT2LtpWZ+Vn8INyETRM12fv1qH86rU89BkX7Oou9PMTx49JbRqSWJtp3g
         vFOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272310; x=1789877110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2jxU2MaLD6ynlliV/V4nmXeQrG06Mf6j7bRrOAd0XuY=;
        b=re4EFjHWRDY1/w2dKJIqn3kNnIaGkxWR0h8woQPfpBmAWSY0Z8A1uT++KdPLj0hYmJ
         19IaPUIhmWszmrflxYTUhlB9E1zca1OZw6qFqaIDKEbgnAHV5WFVxEVDeWedpIMDsQJ+
         1nUriZcW5khJ7cRh28YwSjtpCu4YS7hEnJWCY4PZ9zctlAcWTdS/j/pzLOsOXYvBNmvu
         tK+7kkjNA2ihS/nbcrQttGN7Z6S5CQy3bktGrqV3g0lBIH4tPuJ6EwSmAWv+0U7R8qgN
         gc+EWG/rGc6bnOfG8p+JCorHMJA0I8m8cAqzk7Ch+ZAs4kLuvyV/AewNhORc6CmUgGpQ
         8Ixg==
X-Forwarded-Encrypted: i=1; AKwUvBzhGFlycePLpwMcaqVOVt1Ntjh2rPPHbCLgND7at4SE8KnSyzzm0m+FugvGvoKZPBREf52SihXGvjYp/w==@lists.linux.dev
X-Gm-Message-State: AFuF++myBGif436rrCsGXiQ51oOFlONXZgjEMIwx+tndvXV/udk8iAjq
	n80eo7zTzfTpL7k2jtdokuo2W3r0KTFJc0RqHtbGqbR6FqW6B4XFiV7a
X-Gm-Gg: AYBFou2sj/wLVxTcupGHRU4PLVaEyInyPkmDg3xW1FJYAz5zj5ErNAbtjv47rsbBxnJ
	z68hmqCb2kNDOgFXuVs18PIkzJn/yE/VIx9RzWfT1/g2TbibGBtNfJRrqGBXy1ZlGqNC6yWyg49
	ah7DWkVaEe6wjgUBZTIzdQph2RZfDX/0LWSkp75aEWhgyfVeGF05HptImuoupP8+Mdt7gs0qgKl
	NPn7MsfOY1jUIoc2FuAKdIkPN9HJoETD7B0OT3yJUklULBEtIMgKDIasuud6wkukdXtCIx9EIrE
	L4CMc4LBDpA1OvCi0j4J1UX9uQjT7Ax76X7KgteyP/u2wj6AAA8Me63KB67ZhXn2eXXFrj1VFvg
	SPorF/4xZ2Ybo3fcZQeEsBoxyRoK/PXDqnJQ2vFuBieJOeaxZ/Hpcb6ZY17OR3xOg+fRTSn6+Cl
	IePE8UFyItcGooHIo6ivOZgPo+J0AaNYNqyvK2Z4DsflKw0QqbZkDG+sn1un5AzoIFDY3hd5KP2
	Qqm5riP8OTyql2T7IyAS4LP4nAVw7oE4IDpR+kvKTjrluZcP1zaxrrgsc5OufkUvB4XkUrkRo2W
	ZC15jgdEWlgEz8XeY4LGOdRyEi0hYpGpFsPYH1aAqK61G2pQlKsQy97SeVliWFe77M3ZI4LfwmT
	YtotwUOtD3Xw9JHQ4myOfIy3q0CjvxQ==
X-Received: by 2002:a05:6808:13cc:b0:4b9:a8ac:489 with SMTP id 5614622812f47-4c31c8306c5mr7319934b6e.39.1789272310145;
        Sat, 12 Sep 2026 21:05:10 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699647sm6011535fac.5.2026.09.12.21.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 21:05:09 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 12 Sep 2026 22:04:53 -0600
Subject: [PATCH v4 02/17] mtd: rawnand: sunxi: use the logical step's OOB
 length in PIO
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-2-4a64bed94229@gmail.com>
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

PIO transfers always use hardware ECC slot zero, even when transferring a
later logical step. The user-data length programmed into that slot can
differ from the first step's length on H6/H616 controllers.

The ECC correction and protected-OOB write helpers instead derive the
length from the hardware slot. Pattern handling can consequently fill
beyond the current step's OOB region, including beyond the page's OOB
buffer for its last step. Writes can also fetch bytes outside the current
step's protected user data.

Pass the logical step's user-data length to both helpers, as the protected
OOB read helper already does. Keep the hardware slot for register access.
DMA callers pass their existing per-step length, without changing the
on-flash layout.

Fixes: 54dcd6aa69db ("mtd: rawnand: sunxi: introduce maximize variable user data length")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index e50cf5b6a730..172c7c4b0ba6 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1011,11 +1011,11 @@ static void sunxi_nfc_set_user_data_len(struct sunxi_nfc *nfc,
 
 static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
 						const u8 *oob, int step,
-						bool bbm, int page)
+						bool bbm, int page,
+						unsigned int user_data_sz)
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
-	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
 	u8 user_data[SUNXI_NFC_MAX_USER_DATA_SZ] = {};
 
 	/* Randomize the Bad Block Marker. */
@@ -1069,11 +1069,9 @@ static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,
 
 static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 				    int step, u32 status, u32 pattern_found,
-				    bool *erased)
+				    unsigned int user_data_sz, bool *erased)
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
-	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
-	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	u32 tmp;
 
@@ -1155,7 +1153,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 
 	ret = sunxi_nfc_hw_ecc_correct(nand, data, oob_required ? oob : NULL,
 				       nfc_step, readl(nfc->regs + NFC_REG_ECC_ST),
-				       pattern_found, &erased);
+				       pattern_found, user_data_sz, &erased);
 	if (erased)
 		return 1;
 
@@ -1323,7 +1321,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 		ret = sunxi_nfc_hw_ecc_correct(nand, randomized ? data : NULL,
 					       oob_required ? oob : NULL,
 					       i, status, pattern_found,
-					       &erased);
+					       user_data_sz, &erased);
 
 		/* ECC errors are handled in the second loop. */
 		if (ret < 0)
@@ -1420,7 +1418,8 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 	sunxi_nfc_set_user_data_len(nfc, user_data_sz, nfc_step);
-	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, nfc_step, bbm, page);
+	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, nfc_step, bbm, page,
+					    user_data_sz);
 
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD |
 	       NFC_ACCESS_DIR | NFC_ECC_OP,
@@ -1684,7 +1683,8 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 		int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
 		const u8 *oob = nand->oob_poi + oob_off;
 
-		sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, i, !i, page);
+		sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, i, !i, page,
+						    user_data_sz);
 		sunxi_nfc_set_user_data_len(nfc, user_data_sz, i);
 	}
 

-- 
2.53.0

