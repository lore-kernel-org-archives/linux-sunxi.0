Received: from mail-oo2-f40.google.com (mail-oo2-f40.google.com [74.125.231.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F4833C518
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Sep 2026 03:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789354909; cv=none; b=JtsdJ9q1XjLl0qRTQooHq+ECAVs9UIbsutfoNKPkqa3N0mLwasSMbZmSzJScaTquOsxd2odKcfgzHRaCcWwPbD/Ii/F8HFymehgYTNaGmGJJmuqxP4ZvDGke0kdgtfn2N+ZCK9o2ONy/pzEeGNv3QjgCY98bBurenUvaHVe2nnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789354909; c=relaxed/simple;
	bh=+EYozN7O+JBkDeCx/hgJ+s4q3FbwEjbXAk835pOjKgM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=poKE8MYrW+yhqDCfz4pwov/piSZhSj3QeyYQilUF/SqQdh3asq73KgqqH/0cn/0/G/l65EAgVk2bDUYW4WbS6ao5wI+jZI+yR6q8wyTgmArwrr9DNzHL6GLw/MImmL7bF/jfE+922xySZaO49pcqviBZimFLSTfO32Z7dHyHxN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=COy2xpY1; arc=none smtp.client-ip=74.125.231.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="COy2xpY1"
Received: by mail-oo2-f40.google.com with SMTP id 46e09a7af769-804e42309a5so401742a34.2
        for <linux-sunxi@lists.linux.dev>; Sun, 13 Sep 2026 20:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789354904; x=1789959704; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5tiLR7FZzQsyTOBW2MGeS5ZnHrzID+Jy7EEHyMHP5gI=;
        b=COy2xpY1po0WKWKtEPyf9LdYYbxk3oW+TOshMKUduqv0j0QncaPv6HEr/HZgNLOUqY
         mLixXphq1XU7W0sTTJIKAQelbTdZRsmHJLiE6Ifl9PXalzEYF4Ot4elXblvB4Gprw+D3
         XNyRUfoo1FvXNOCxsjJ5darDUnZTAjplT53rgqi866hTJv9LfPZgSUCyd/3IVSaAec8h
         xpkF80eqMlgCHYHO79BdpHv8fsqAkCJtdt9VqkIIzhI2qR+ku9G++sZFo8aOVPvjGdFm
         O6JBQKkcTr4HRl94+uWZ4aPirCanvSp7CbhVSEW4PS2O3jNaDWJHWcFqKPXm6uP2ssdB
         HLCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354904; x=1789959704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5tiLR7FZzQsyTOBW2MGeS5ZnHrzID+Jy7EEHyMHP5gI=;
        b=U9w3Y3/UCLlpRy2uSHefoewfXQyDAzmA05wjGPZHpn7fEOprd2NQrbYCxtuQYw4VMl
         nX6AfyKLKeI4lE0eBLo/zuWnZjGAzElVm7pEFvSalvqMnyj8xB75lSKCVtWZJyrTl2W5
         4r8O9DtMxNgYtzrUaX/lTyLtIUNckp2v/15Bv4xavQOFKr1IXAk6GYdifS4wU9xJKkVi
         XQ9yIj+u+GtDk4j566H5NZvKOtWEilkmXGgpNXKMVo751kCDUM/adUaFc/yIZADYag1w
         L8eXHFYPYcAX1bncI9rXz0GZ01QE4nRXpd8yNI8VHg0hPXsds0T9L0oGzHi2eWIgXyY4
         80tg==
X-Forwarded-Encrypted: i=1; AKwUvBz2oXOh8YWsSScED7A9qRz2BGS6G5r5oHgVeahSWBk4uRe5lUfVhBKQ9JtM7alt18s7O9hrm+o1NKSacA==@lists.linux.dev
X-Gm-Message-State: AFuF++mXU9FrnHheJGPLwbU3FoMlFMARfygO/ev9OIyd8/jkJiv2nI2V
	658iMZG4aGnjPHuLgs+TFhYBdRZiP2NWSz6NHQMl5xroFdF+UvlK8YPI
X-Gm-Gg: AYBFou0v4gATOeWnFkcFZdZqLVW0pS3Zs+ceJm7k+jI0aHBgnvhiqg9Aq2k/j45nZ22
	MBkN1jP5OBhYfVdyp1RZ6xpMC+Ds+jNCeHbAlsnCBVhdzGF2rb45zXyerurbL7srEPTz4XFmi0J
	s1IOJq9RqNetlhG+tD/WQjT6kBNj4+xuz6PX8+1aWEBkAVcQCg1fnCxhuJSFVPe+cOZ6c/jcyWj
	zvywfivw99B6He3ehSythBAL0GJGwkQkVBNfGvjyNeRBfq8DGqxuXeGN9FcUJec9l2bC2UPChK9
	wWJn8RgYfW+t/OD8CtOoyrXOX7YuBuaZCJKMePgrhVNZuUwW8h/TG1gNz52zqTLVGiThEV5rO/g
	QwUPz2ncuAoLS1e9aOhkgQ36vhhcy+2eyEhU2WlMIEYSipZod9m5G0l3B64MArNGPBlVI1xGbBH
	wUdJTJ4df1BW0K1IC117TbFbb31bz5hTRAkb6dugalHZzbYmg+fpt1wPqc19j4q3rPwx5/3KK1B
	uz3j+ofP0S/O46TUE/QC2FvYDTiDLFN6o2wpzNpHb0dPKCk9w8O20FSCpQ12LkjvEB54539DfvG
	hGlLhIDvB92kF/BrOZu6KbBs4kcTqcd9oaniuCDwVuKDdC/uwshBY1kPPn+Q/fMilWgZ+6DwVIo
	+hphv4pTTZ3yRV+O0kY7qNsV1i9U49A==
X-Received: by 2002:a05:6830:67d9:b0:7f4:eb76:8820 with SMTP id 46e09a7af769-80897e81b85mr306525a34.13.1789354904353;
        Sun, 13 Sep 2026 20:01:44 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60feba1sm10619014a34.13.2026.09.13.20.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:01:43 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Sep 2026 21:01:11 -0600
Subject: [PATCH v5 05/18] mtd: rawnand: sunxi: select the pattern ID for
 the current ECC step
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-5-7d711076a6f7@gmail.com>
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

