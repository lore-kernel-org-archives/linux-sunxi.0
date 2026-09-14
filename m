Received: from mail-oo2-f34.google.com (mail-oo2-f34.google.com [74.125.231.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA7949F12C
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Sep 2026 21:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789420210; cv=none; b=fNaIXdcgNBrxZ2MXTWEN775rvQc+MiqjL7BTfgPCDC/fEu5g9mwkGOd4dLsyPQjt6b4Zkwu839CwXglHPpYcorwJdYqNtF0du8wd7nzJFf6nmHS0AmOJRVs2/xJswY5gr+L1d6FbiFj6Mdgro9mb55Ukt+6I2ox1KmTq8IqT4Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789420210; c=relaxed/simple;
	bh=+EYozN7O+JBkDeCx/hgJ+s4q3FbwEjbXAk835pOjKgM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OybrcDIulDWskGsFN5p1ICfT+tHUky29nE8J66Owmc7eAkXo2Pl/rahBZvzcfJJE3xoUTffMxyW2YGd96/cm1v/IS+koQCN0Q994x0FoHd0so/x3BOrHcXmrSo3CRiQCFnTRclafBojTuPRst4bDeJJ6XOtgI0Hf63+bIu2RaqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lyQSyIU8; arc=none smtp.client-ip=74.125.231.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lyQSyIU8"
Received: by mail-oo2-f34.google.com with SMTP id 46e09a7af769-80032c08611so2329991a34.3
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Sep 2026 14:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789420202; x=1790025002; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5tiLR7FZzQsyTOBW2MGeS5ZnHrzID+Jy7EEHyMHP5gI=;
        b=lyQSyIU8YpyL6Az1uiDKbl6gE09EJqZC5e550nqPzSLk3i0z5OYM30A4+tL6B/M+fh
         ox1YcvM23Ar49pwxP9RQZ1n+u3I5GoxqKyGsi9PmK5sACUGP/HKJWPkHUar0c/zzy+zO
         +DcGqN/CRpq/vbeOK+8MgHUZcoiH2CTk7eHDN5rxDZZUoaMB8MXwsd13evS+hoxoGsh6
         bZ7cm+SNkrSLL+ENi04qsrc5c+q8DsaahT/a29V8Vxx1+WC08XVebzTuljCJQbDwlO3y
         x+ZW5nwS+eJ0I7pZP/Lysya8q1pUQGBX9TjQwfjokZcH6sunkwyM1drKjOS56d1IrVfB
         mGcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789420202; x=1790025002;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5tiLR7FZzQsyTOBW2MGeS5ZnHrzID+Jy7EEHyMHP5gI=;
        b=Mr9z/OtPqIKUlxPg16Yxh+djo2B7CjJXbYWpzJWJUpPBFcT4VvownmewmeFV+1UMgF
         Y0Jtq+FO/s9Hx7heCSnSHTZ97yZEjEesYpjkqPOUJc0JUxwo/idVV5u9uf7bKGIk18O6
         Wyre1byMlShz/qUiLKEYo8GcBu8UsnN1gQNNtq5cbH6oBJ1mmKWJYAiw4wx80xpbE2oF
         3mzqFTRUfd1l1saWrzdACYPfHszm6mCLss+m2RPG5oC+kO34wWQMtBAOyAVjOIjyJNb6
         qrz7HZlCWX3jJs9GyoauMa7h5Zc5vEdyKxf/OTuWq4xi2tr5tiJ5eKTkVZefwXnfuJ2K
         RlRQ==
X-Forwarded-Encrypted: i=1; AKwUvByEpm6NGjzraP6lH5/0Q2IMaFZxUdRqhZHIiKC8+XxNcTknyiXYa+Y2fJVTIXogiEMJ8oD1gE1PvhICfQ==@lists.linux.dev
X-Gm-Message-State: AFuF++nV6gE2GkL4Cgv+hvNt91zC0EsdawfBGPK2np+dx7xk8LmYBfgU
	DCbQkVws9fnd1PCwTn69tID9mGoeVNceY5NqeFhcu4xxAtVNVHKqwbi3
X-Gm-Gg: AYBFou2IucO+Rj4G+o3aEEOyxATQRikka3kjk4gAViXlpjQoLcXSdMMJj4t08rezE4h
	qdHuVCbXfx06vSsJNncH8j/fTbvYCH0mI1rMHSCNKDfkxqFexAPEZVYoPhQQ+cKOMavLA7IOk/q
	cyGC9+mbuO/ppidK6LPTxIQ5KyCJUT57nnrdwABivkz7rF/st2KXgJYq0bXru+g3pIDmrFkGD/T
	HN59F0XII4Fc/DT7lgvuJiznSuYyLkDmrxnN/nGXc2HloVa2L7bHwZxOUlJazV4yYl3oEdh29wE
	jgHcBtwiR4ygSqIQEFReIj8RuhSi04Nxfp87jl4BYDU8f2ALTWoDOVIvoU4F31HnL9UNMJNntNA
	8JjFrXR6xZhfPi3xyHH8vmpiwIKMk68EPrBfPGkjS9BU8CVs4xqMvn+PzEuiRgV6v0frJI09Uhz
	IyCF3e1KSMKZgydGUHB47mXYV7SC0tX8o9M722GPhril72GuzDzMOvsLB0keGC+N2GTkjkF5fC7
	Z9FzuzhZlEdKQhzwA99oBxLwZqpFxjVAYHlVfkB74HPgw2glfWfl2oqVy5yP9npf3myd+L14HQY
	E3glUj7Kv+XtxeXcjsAoPrdiYzYuoO8m3H0RI3PWW4rzZro2W6hW8ZBdfYyj26l3Dhfs3QvTutN
	Px/WRAsqqP0aWYjp/dvk0Gq8/d43Y4A==
X-Received: by 2002:a05:6820:80c7:b0:6b1:b33a:db69 with SMTP id 006d021491bc7-6c53fb6bf40mr4489299eaf.15.1789420202250;
        Mon, 14 Sep 2026 14:10:02 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c45bfc3fe9sm4698544eaf.15.2026.09.14.14.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:10:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Sep 2026 15:09:51 -0600
Subject: [PATCH v6 05/18] mtd: rawnand: sunxi: select the pattern ID for
 the current ECC step
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-5-2fb084fe0751@gmail.com>
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
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2

The pattern ID register has one bit per hardware ECC step, distinguishing
all-zero from all-ones data. The correction helper checks the current
step's pattern-found bit but always reads pattern ID bit zero.

PIO reuses hardware step zero, so this works there. DMA processes several
steps at once: a later all-ones step can be filled with zeros and reported
as a successful read if pattern ID bit zero is clear. Conversely, a later
all-zero step can be treated as erased when bit zero is set.

Use the current hardware step's pattern ID bit, matching the error and
pattern-found bits already checked by the helper.

Fixes: 614049a8d904 ("mtd: nand: sunxi: add support for DMA assisted operations")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 5d88ad3b8f70..3f506d0666a1 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1117,7 +1117,7 @@ static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 	if (pattern_found & BIT(step)) {
 		u8 pattern;
 
-		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & 0x1))) {
+		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & BIT(step)))) {
 			pattern = 0x0;
 		} else {
 			pattern = 0xff;

-- 
2.53.0

