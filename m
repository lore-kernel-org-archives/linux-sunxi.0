Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004BE19C54E
	for <linux-sunxi@lists.linux.dev>; Sun, 13 Sep 2026 04:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789272322; cv=none; b=Bf+3Zi68kNWihdM32qTWTCJw5tRhxTE70fNa7hBbVDDMqV5ARkTs70ccF9dOq+b82+K647YNOG10Qh4jPA7DFItdn6Dz2Xcu1wkokGdAyazzz3rTBLdWyJDcmZ0hA0GEvWXxjrq8kR5YCnUkW8GVLfB987MnWn/5zdyRDZebq0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789272322; c=relaxed/simple;
	bh=6QXvhJNkBJWcV5Ntyx9Vdimd7EE2MpJdJCkLfrX8lRo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k1mwezqcgJbBzEXWcyZQUitaatFELwCO6J5IfZJW7MniP8UPXJEDzYVHu6Vh5pXSW5wzqTezb2fG+jzKscV9+W6fQ2NVZwrAEsIvJEVu0rlw5BFLddSo9ukvQEtr/jiAOFV/k9uGpzdFTvZ06VmjKk6tv8inBzVNLIRhw4oiDso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W3l1113F; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W3l1113F"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-478622cd851so1000188fac.1
        for <linux-sunxi@lists.linux.dev>; Sat, 12 Sep 2026 21:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272318; x=1789877118; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hb1UAgJ8R3xqyuxnkYr/GKcQBuP99rDSmeFz/RErrU8=;
        b=W3l1113FuTjB21E9zbZZvoyKtklCKy0RoNEkkzJEcb/Ho02/5uJVwicsrxJFot1+E7
         vEgkMwx3JbR0Fv47m+hkRHe+hXLaWEy+zZpIVyDVSZ9o2kQxBKPJEespB1fFiNr8pgan
         tlm5MwDBQ05PH6pJgvN6FSubdmWNN2xjfOk/EH5UiPRsQ0GyJqhL6bxhM1wrPhVd3jLN
         uGfkrwvIqEcTJVOMdUbflqrfwbVg5DNCll8hnqTpWsOopleQEVof/L9uM1cJNKH44Vj+
         9Oi9/xef1X8WJUVbSeRbte/Bk5ALbL0ptDfRkD3HHPJ0bTi8n3jSIYrQyV/6ENRx30zX
         oZbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272318; x=1789877118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hb1UAgJ8R3xqyuxnkYr/GKcQBuP99rDSmeFz/RErrU8=;
        b=o69wM3tcXS0mjiCFA2gIjDgQ0rAlT3UFE3RmAkc+ZrcbvefrHkRQ27obd5n2LVMMuI
         wMZGZ6N5avfR6WXVXcYg+DfGir3T49fkdXpUojANGBk6Bu/UAcDxmDcV2DLm2AwHBWKZ
         K5AE5P5TPv7pEwEHH8xR7p4yO/BNovJLdQUPI4xS6KyeJIt5ZIyfHs2ozorjLOPekXzf
         ZhFZhBgkqZ9NMKu/0zE0Y1wEiNWbzmlIcWIUC3FceNgwX/fqfNyFZuij4JD1398KgQs7
         Q/dCL0HfDXPv4IHfr24b5CKjktTkaNJ17MGMr51eW3V+Sf3jbQIWPQ9QhIHHajEXL/MT
         bS6g==
X-Forwarded-Encrypted: i=1; AKwUvByyYLOL9VAHSdX09wX0xC/FeTILYQwP4x7umMAvdeub23VPwYDGxWULk2dON1RQ76j04/Ns7Fl2NjtBUA==@lists.linux.dev
X-Gm-Message-State: AFuF++kdnf6fikO+uW/tVd7otDhoKpyp9m0CD4C00h7FahLmsRi1Zb6h
	uz8epKYni8OQSUl8rCG2tEK/FySQ8hxVjWckn64l2QHwTsB/P/xrGJ3j
X-Gm-Gg: AYBFou1FmhelTbGQ2vD83VSGxIqQw4+M7IsVxkJgeuDE8tcaUXq5gnXb0q8fmFLVOpM
	OIkZa6xCqqFzj3IZyPwlMkSEAYmfn78+PDklpE6kL1dRJ7rTf+U/9FTyvr6/IpdOKcjTqZ0zn5W
	9XC+rtkyMvUo/tIcycZEXXcXsUY8EUNr08pLRlSkTi9/aBDb3hAI0sT94zG7kI860AVq/6WuilS
	89a/VoO0C/eY2WSaqD1u95kod7fPOKLUdmUvfvTg4/cjsc/eRihNxxU8R8iYNs8ga5DuHqVvpV6
	MRKAViS2aSR0pzeamBep4rM3El3gQLACTYG1QfinD0+c1FfGM6Do736QKvBDLeVON15KUXixNyr
	d0LjeHaKcawzDvXCVfBR5/mqYnxPhSsTPHN/ZnPoHZDFQlFPmKgyOqMjjj4KxwndG4kpGgXNfXj
	buCELn2uIFqWDfuiWAY5e7YyL9eRZaUiuEMkvwhjoM3SFMVGZCG+ZTvKFtSebHm9iqfTX0A6HK5
	HrGb9Log0lacwDlhXr9R3wTKQ/a4+bGbn3aDRzNOi/5iu/B24yktcPNetslB5ChWYrr6vdGop49
	71/Ubsm/zGxGWph7otXZg2McYA1Gf9GR33sEoOa4YwCEHESkpHf/JnlsQ9MNXAJLEm+CQoPlBrx
	ILEp9qTfJplJ3WTv5Q/8Xs9RqLUWbGONneWNA+qe3
X-Received: by 2002:a05:6870:8306:b0:469:fb51:b351 with SMTP id 586e51a60fabf-47de8fd0c3fmr7839424fac.17.1789272317809;
        Sat, 12 Sep 2026 21:05:17 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699647sm6011535fac.5.2026.09.12.21.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 21:05:17 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 12 Sep 2026 22:04:58 -0600
Subject: [PATCH v4 07/17] mtd: rawnand: sunxi: avoid a second program
 confirm for OOB writes
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-7-4a64bed94229@gmail.com>
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

The hardware-ECC OOB writer delegates to the page writer, which already
issues PAGEPROG, waits for completion and checks the NAND status. The OOB
wrapper then calls nand_prog_page_end_op() again, sending an extra program
confirm without a corresponding program setup. An error on this redundant
operation is returned even though the page writer has already succeeded.

Return the page writer's result directly. This leaves both PIO and DMA
responsible for completing their own program operation and preserves their
error results, including for bad-block-marker writes.

Fixes: 25f815f66a14 ("mtd: nand: force drivers to explicitly send READ/PROG commands")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 72b79f893e29..41d6560d7df7 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1843,15 +1843,10 @@ static int sunxi_nfc_hw_ecc_write_oob(struct nand_chip *nand, int page)
 {
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	u8 *buf = nand_get_data_buf(nand);
-	int ret;
 
 	memset(buf, 0xff, mtd->writesize);
-	ret = nand->ecc.write_page(nand, buf, 1, page);
-	if (ret)
-		return ret;
 
-	/* Send command to program the OOB data */
-	return nand_prog_page_end_op(nand);
+	return nand->ecc.write_page(nand, buf, 1, page);
 }
 
 static const struct sunxi_nfc_timings sun4i_a10_nfc_timings = {

-- 
2.53.0

