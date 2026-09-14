Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE98343D8A
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Sep 2026 03:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789354923; cv=none; b=cujIpV/TCtPznV7/DnqLPkUYw59mT2V8QmI505yYwj9S/lIng66daHO3kj4h7IE7F63BwwMYRU0I7xE2+aD+ApUAj+TcLdzmJ7nFI2Okdwb8MsbDf2HCko4wNGczUZ8p6qnPgzlJgiNLZ1b/ZqEM5WK+t92MzVrghCnEtm41u88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789354923; c=relaxed/simple;
	bh=9yChzot1ui7noQKhTCzhe1/zvJdG1xELLE60VMQMFlo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AQQhN2xA+34CeqZ+IyTXUrfR0ngv8ITQvsnZEcgxkKkNXUV4wsMP/gisacWzDzpWDaXcJZloTx/VcbWpjWG08ov9sjlPDvl1YzCMS+V0ZwlHNZ/vzd8hKwcet20ZMeWSvK927ExuBoG1itafznkrG/mLPGc61l84EXSDuCLaDOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=siPC4dOL; arc=none smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="siPC4dOL"
Received: by mail-oo2-f42.google.com with SMTP id 46e09a7af769-8050801d337so1103287a34.2
        for <linux-sunxi@lists.linux.dev>; Sun, 13 Sep 2026 20:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789354921; x=1789959721; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F7keaBMI7wLNCHL6SSgnL5KT9FmlTHx9tj/k5MQYbvE=;
        b=siPC4dOL97Q6xq86gQtnDFVxmyZSqe05d3pFfgq8AP0c6lqVPgTvVJ1AaAf1ocr83x
         a5f6XljA2b40rx22ElV8AIMk+mO70w0PKg0ryLwy8RY/kPLvi2oBKFtPl9jhjN8l2ZA/
         HIM5fvTPOEGCxuWsXTA6OLdp+dAAS/VnG/LL4Bzv2uqSjzCnf1H4rY0qwnPCRpkb4SAZ
         I9MC2sNvzBPRra1WQ5LJyLKdvWbMKPaP7DelqUKGHWkqvflqso+S6D2RhQj+GQADA+9A
         lXNOdn2Gm3qrfNB/1PsU47OB245b/eIEnOx5iSUClEYyKZLl/MLszLA71v4z6sLJFQVf
         X0Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354921; x=1789959721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F7keaBMI7wLNCHL6SSgnL5KT9FmlTHx9tj/k5MQYbvE=;
        b=IG7Vw746FY5J2BjXoJ/mCn3glGGn9Wr8F26B611XGnAnkmst+UFsOaZfEtaLLgrxok
         krSi53jzsOE1uc7RuDutKmK5e8XTI4ZyavNa3aexjEn2sAUbK9Kh3JB+k+lBnOsJmuU6
         wn4wf76xlWy06FT5R9ND5h9jEJjL6x4HwGrIVfeMP7dIUZC9ZFMZQ2z+Hy+o8iwIkmQz
         1vA78WhJnT7KbGSxzQyZs+WtalMNLEYu/dEDE4qHY0/lLqlvzZ64RMM2aAZf4AMhartJ
         390ia8Xoj1AxMpHoFcXEZ3mRr7VuqVP8gl2jdojO+mmXeGdnFUBxjfHjZvC/DORrm53x
         jOFw==
X-Forwarded-Encrypted: i=1; AKwUvBwRwYLphTwKLp9MKVYGouCcDsp0RPnS4KMuKC+PboVj9p4aK0fQviZaYpAzZyedZqfTJv7v88ZfWWPfZQ==@lists.linux.dev
X-Gm-Message-State: AFuF++koFc7S209kv53EDuP5TY4WLXyBdoRj4P0L6j5+ynKCZlxuuGss
	/D3QNpIGPxFO2J2UZdsU4p4zDUedp21N1Y36aMqwonrI+r5SFfk3Nb3N
X-Gm-Gg: AYBFou0RZathjgUPuQv6Phdtr2ByUSdqoCXq4+1UG4OzWlHWc9WIS0gHHVRerZCr9Eb
	icoaOmaIVFhI2byWZeqWvXVgk/4QiKzk8lCAe8L8TKxvne1UySL6pIs9nXE6GIJnEdDVyOPwg8W
	/ByTZjfgDfWKZNkNfHPoCeILE3FsSM3nJXBQgI5AaV+FUhLu395cRMTD8E7Vd+eJ1h6VHqOc6bz
	nqNLJ+9vcpa4wt1WxFZ1c5w6Ksx3eoKwLs+TdruPs5nFszemuMvPKnb1qSe3DcMa9qaSKr5Ygup
	R7yHj5D3iTPJYBqPTv3GuGh8msfPD6OPSSGXO6GknEQzyryKXRMpSH/uDQzq/KA12EU35wrRn+V
	smm4vo1dDf5PCEkUJa+ZAYJkjxtyj6v/uL5ilmTtpAYYgG0H+COugrnSMctRdx34sdqLP21b/5e
	bhHvPFeti99Jw3JCAGz4Y0Pk6GAAOTRJSwllKxrg4F6DeskipAXDNwOslKlkUHxLVPuW2LqCCdv
	qBgGv+qrZz5F+qrrdqBnQLYd4tZ8H8b3XAJAyp5ohH078p0gM9Xxm7z5l5m4ihWeO3dVLI0rC6w
	7FTza1jrWNCXsUQkgLQsx4fIcshu+8GKu8TlYbweTU52xpJ2/Uytrw+9EPLUiUhrV3/DUszw5Iw
	bTo3r06PoBFwD9BCZJ0pZc1FxC/hfsQ==
X-Received: by 2002:a05:6830:81fb:b0:7f6:ec23:7956 with SMTP id 46e09a7af769-80897097a7cmr492616a34.2.1789354920841;
        Sun, 13 Sep 2026 20:02:00 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60feba1sm10619014a34.13.2026.09.13.20.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:02:00 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Sep 2026 21:01:21 -0600
Subject: [PATCH v5 15/18] mtd: rawnand: sunxi: combine contiguous
 unprotected OOB reads
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-15-7d711076a6f7@gmail.com>
References: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
In-Reply-To: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
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

The randomized-format OOB reader fetches each parity region and the
unprotected tail separately. H6/H616 pack protected user data before the
first ECC step, leaving a contiguous range of parity bytes and tail data.

Combine adjacent parity regions without crossing protected user data,
and include the tail in the final transfer. Keep software de-randomization
separate so each ECC step and the tail retain their existing seed phases
and PIO/DMA representations. The NAND operation parser splits transfers
which exceed the controller SRAM size.

This reduces column commands for OOB reads without changing erased-page
classification, data-only reads or the plain-marker paths.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 3fb61a10a441..b7ac8d7b0301 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1421,14 +1421,28 @@ static int sunxi_nfc_hw_ecc_read_unprotected_oob(struct nand_chip *nand,
 	int ret, i;
 
 	for (i = 0; i < ecc->steps; i++) {
-		len = sunxi_nfc_user_data_sz(sunxi_nand, i);
 		off = sunxi_get_ecc_offset(sunxi_nand, ecc, i);
+		len = ecc->bytes;
+		/* Keep decoded user data, but combine adjacent parity regions. */
+		while (i + 1 < ecc->steps &&
+		       !sunxi_nfc_user_data_sz(sunxi_nand, i + 1)) {
+			len += ecc->bytes;
+			i++;
+		}
+		if (i + 1 == ecc->steps)
+			len = mtd->oobsize - off;
+
 		ret = sunxi_nfc_read_column(nand, page, mtd->writesize + off,
-					    nand->oob_poi + off, ecc->bytes);
+					    nand->oob_poi + off, len);
 		if (ret)
 			return ret;
-		/* Preserve each path's normal representation of ECC bytes. */
-		if (!dma) {
+	}
+
+	/* Preserve each path's normal representation of ECC bytes. */
+	if (!dma) {
+		for (i = 0; i < ecc->steps; i++) {
+			len = sunxi_nfc_user_data_sz(sunxi_nand, i);
+			off = sunxi_get_ecc_offset(sunxi_nand, ecc, i);
 			state = sunxi_nfc_randomizer_state(nand, page, true);
 			state = sunxi_nfc_randomizer_step(state, len * 8 + 15);
 			sunxi_nfc_randomize_buf(state, nand->oob_poi + off,
@@ -1439,10 +1453,6 @@ static int sunxi_nfc_hw_ecc_read_unprotected_oob(struct nand_chip *nand,
 	off = sunxi_get_oob_offset(sunxi_nand, ecc, ecc->steps);
 	len = mtd->oobsize - off;
 	if (len) {
-		ret = sunxi_nfc_read_column(nand, page, mtd->writesize + off,
-					    nand->oob_poi + off, len);
-		if (ret)
-			return ret;
 		/* The unprotected tail uses the page seed and its 15-bit advance. */
 		state = sunxi_nfc_randomizer_state(nand, page, false);
 		state = sunxi_nfc_randomizer_step(state, 15);

-- 
2.53.0

