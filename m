Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5A3441616
	for <linux-sunxi@lists.linux.dev>; Wed,  9 Sep 2026 08:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942657; cv=none; b=uxhIePFnZXgpxuQJtpNXizQshRYxczZrHUO9nhY+oMRIUsplHCrVIZ20K8/rhrlLvoYRQCXz+VlUicJsy8tlbDCOmQFag1FIvd/iRuTJmSDp/2JJ0XK43ldoeYtVb7yygi+oNd9Y/T2qVDQwohk8BK5ud+KaYe7T4YpgK0WiQGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942657; c=relaxed/simple;
	bh=5dneiBhhffoEYowN5rHUIUIaXuJyOIeTYGA3L5t8iSc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BaDS4HHbXJdlab65d8Zz6TGM4aTgNujvj2me30ddLgIAo416g/bDJCYCoIoezkl+lVdVdHUxYr2Xw3ilqvFytHVkVH+K2f5cJaaKaLnK6+KbWHA3IqvKMjqNLwm4Zhajqw2LhV8TRq/z58l4Qz/p6UnKvk7STg9X2gzpuPhxQUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MCBFHSuf; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MCBFHSuf"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7f4b94d72acso4636961a34.1
        for <linux-sunxi@lists.linux.dev>; Wed, 09 Sep 2026 01:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942653; x=1789547453; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=87D8oi8Qz4sYFsjJ5uXw0JnqD9Cz19yUtQkLE1CMv/c=;
        b=MCBFHSuf8giA+H3Y7BAgGTExI/X4620B6JKeBnRR+nOLmMVrEpcOu1O6J/46RjvJQN
         X5P0rYpohJdKV+w7TFqWQ7HBu4hwiNNXJUSAF5Me688nwRAaCkSOO9Z3rTDEY1Zw7KqM
         nLN8b2C4fzsXCbzHHnwdK5GqgnZJd1r5WxvsUO7vPRxoNez//VpjPEOyhTT1x/7PnRh8
         Bch090bNBfFpf4f/d1024fo2k7dCkbcDRAJF8E27ZrjdjcrMIiU48Cg43XQ+AhENrfXn
         k/iMo7X+TW0U6SUK0KwWVii2TLyLVQxeZY+6sUshZLIAvuirYGXuanRy88XOoHq1hJml
         Hb9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942653; x=1789547453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=87D8oi8Qz4sYFsjJ5uXw0JnqD9Cz19yUtQkLE1CMv/c=;
        b=owjNsCr46AyeO5160lKO4YxhutEOGkOAhq+0nV5LGweebkeI5QQuA4m2mkd0sJHP6D
         Wwfi04QRhsbyIf4Va9bLH6IojI9Z2GZ3u6EVAKf2CeXWTDor8ZINgxqpHmjq/V/kpj+b
         B6paIy85E9H9CQll0bkIX1KqCmjuF2ia+MVNIDN7VWIJ1AikayjCANzc1mWhArL9gc6X
         RT7rwndU+y++Lzfe8BhYQ7pj6N/3/BBSsHvfgsHUDUJleE/JWXsgZlWXhaTmDqBRs98j
         AVZZ5niicr035bwft5qEDUxU6RdAEMr7Pw9+saan/X2XJF/g/x9IGSn5MiN+PQMezOws
         CeGw==
X-Forwarded-Encrypted: i=1; AKwUvBzfhlhxrue4KRYDYqDb4iWvsu6cwP7jrJhKNYWpRl2wVV2Ea2eypNfJW80VKHufHlpv497ZmrmfB8ZgLg==@lists.linux.dev
X-Gm-Message-State: AFuF++nzY7ZsFZPvf/nLAewCZfOBTT83YCV92fjgnpsUFyBYEGR/DYfL
	tb/kBbSz0YGzpePiah+vBnvTLJPM+Ozi9GLHXp02uRuqUwWg6Qcn9I/A
X-Gm-Gg: AYBFou23BR4+gkIu1HxmxV+1xk/gCR5tHxpDAzHfBC/DrkPNVCY7p5bDgytlaZZk2wx
	VRpcEcT2kqjme0A+kIYQtpw1soJ+L4ic32qDI9q/grzf5jkfqptXBGrAHY9H/B+k1uSzpUBohot
	mc64I6IaR2m5H65Fr/2KoUP0KF+/7tBVI7NA7f+2qgeRMwOcoeQgEt1od+WHX4r8OcH4E+jxfZm
	1qrRjYwOJlGAxwh4qH6Ui+uV7AZsHxm/aidixWjVYm6BFoxty+rgvnF1ykEFoKsplJ01PS2BTQH
	G/hXrKzZSwShvP2CGvd1rbUqGL7XfzV7+MnMVuUX9gnN7q5ooBGYh7LR/Zmq9bgBOmx2PeXDMR7
	IhJUZyVFCgiKadUhk4o+UJQq4g+XGwU39Y2B16xBWQa/i/iH+8f5MJOIGrNlN+LLSCt7YGkHXoB
	CqM6Q/RfaK0KTnNw8ctMqoHRQt5mX3w6Pas3bT3nk/TsXsnvsSVmHsIA9D1BXoN3ciqZ0GMsi+V
	TjQHEq4lYGO2Gjgb+OJZWe94+lsJOtb1AtdmIIlhpfIDrlFpLkmKkS2D1Ff4RqDAR84futjM4Vf
	jkc2RMymzQMzrnjPZ61s186qOGesIy3ckX8WLdpFMktb12kgjaAlIk7tHXVhL1gIdr5Qhk+/D2j
	fWEoq1J99aeep7m1NRLm6mrdkdbAxFA==
X-Received: by 2002:a05:6820:3107:b0:6b7:46fc:1df with SMTP id 006d021491bc7-6b746fc028cmr18530314eaf.62.1788942653399;
        Wed, 09 Sep 2026 01:30:53 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6a0sm19031004eaf.5.2026.09.09.01.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:30:52 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 09 Sep 2026 02:30:34 -0600
Subject: [PATCH v3 01/15] mtd: rawnand: sunxi: use the logical step's OOB
 length in PIO
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-1-838cb0ba1547@gmail.com>
References: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com>
In-Reply-To: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com>
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
index f41feebe4257..ab4003ea6fc4 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -999,11 +999,11 @@ static void sunxi_nfc_set_user_data_len(struct sunxi_nfc *nfc,
 
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
@@ -1057,11 +1057,9 @@ static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,
 
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
 
@@ -1143,7 +1141,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 
 	ret = sunxi_nfc_hw_ecc_correct(nand, data, oob_required ? oob : NULL,
 				       nfc_step, readl(nfc->regs + NFC_REG_ECC_ST),
-				       pattern_found, &erased);
+				       pattern_found, user_data_sz, &erased);
 	if (erased)
 		return 1;
 
@@ -1311,7 +1309,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 		ret = sunxi_nfc_hw_ecc_correct(nand, randomized ? data : NULL,
 					       oob_required ? oob : NULL,
 					       i, status, pattern_found,
-					       &erased);
+					       user_data_sz, &erased);
 
 		/* ECC errors are handled in the second loop. */
 		if (ret < 0)
@@ -1408,7 +1406,8 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 	sunxi_nfc_set_user_data_len(nfc, user_data_sz, nfc_step);
-	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, nfc_step, bbm, page);
+	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, nfc_step, bbm, page,
+					    user_data_sz);
 
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD |
 	       NFC_ACCESS_DIR | NFC_ECC_OP,
@@ -1672,7 +1671,8 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 		int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
 		const u8 *oob = nand->oob_poi + oob_off;
 
-		sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, i, !i, page);
+		sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, i, !i, page,
+						    user_data_sz);
 		sunxi_nfc_set_user_data_len(nfc, user_data_sz, i);
 	}
 

-- 
2.53.0

