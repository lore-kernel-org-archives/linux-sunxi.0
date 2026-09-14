Received: from mail-oo2-f41.google.com (mail-oo2-f41.google.com [74.125.231.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC1A4A0F0D
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Sep 2026 21:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789420213; cv=none; b=I9jZN2WKR2qQexdspdUb/FAoKGw7IuMf+nDed2X5Up0ORSaAVacIKBzojD9lBIuk57IGYJ4nfHmm5hy8XbhFVuwASxUM4ZmO6FZVx4H1+BGwmS7vHBDqXBFYbvB7/roKVu+ZGR98oASpEpr8PfymwVhOvNKNLiZIXNP3TD0yU7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789420213; c=relaxed/simple;
	bh=YbBF9laHAErhZzSaGZGDzYG7q1LarpeBoJ8ap1tchQo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XRusTJHGUqkkQxF2yCotv/Vf8zcDrQHmrmZUNPtk1gBqRUp8oKcGNmJ1kAYp4OdBbf5dcarNpSKgXMmyCZ+iMyQQqD5UGx78Xl47zx4s9p3uy5tcR0BS84QK0w13z4VsZxYNdwQIGue4pCxSF3ityn4Ctrc2D7Wi/L8ZWVA3Zng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PN4zJGPw; arc=none smtp.client-ip=74.125.231.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PN4zJGPw"
Received: by mail-oo2-f41.google.com with SMTP id 006d021491bc7-6b4bff33d18so1038114eaf.3
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Sep 2026 14:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789420206; x=1790025006; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A0CrISCG3enxLUNERhlMVwT+4sBOgXXXdTBmRqqtC4g=;
        b=PN4zJGPwi2s6SSi7waVrxUQPpjf0nCMsB5IVqrhoZnHLa/3K/c0uFMOFH10ovDtrMM
         EP3Xsy0vegF1qDqzBgyYTbttNaQJ0h5nlvUCodpGAsyLZSZHP57nnRW/N61cLRqbHTnS
         LH0GzKhzxCvAyTkWcRH8SkNdoMmEgT6y1jk8zXKkG+cxNwcR5mM5heSm9tcqM71wPFuz
         30ycHl02vAl6HaR6p5BTtrSK11gFjJwX7xLhWm00EThIodKrpT+yR5zcuBESpYTHYraV
         2Cp2VlbhwFLyRjLHdQZ5KbwzUIXLUxawQrFFbp5iTMtGpdoICDcV0gGp2zxzm//3MCOp
         AuOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789420206; x=1790025006;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A0CrISCG3enxLUNERhlMVwT+4sBOgXXXdTBmRqqtC4g=;
        b=Q5rFHA/WEu3lVzgmNRdNqYMHibZiM90Gzw83eHsAaxBhLOO2j9hc0MgeycyMjINMaG
         i+sy1Q7uhuolmGy6fi2N2AGevyd/1E6OdJoL/+N4xG3dYcaxF1v1IGOYLD3zg6WRxyNK
         BhJEhdp91mEDiiITfVKCh9SeLv8qoNjZzy//aPIR92ttqG/GbZnOCm1pGM7zN2kkaPqe
         U2dJiS/eYOegoG7KtM+ej1bvZU8HlXzlr4Wh+TI1wKYVUB97a1HNOnfOSJ6VZlggoYqp
         DZMJ56aUcKuwECyEtwzKcuBgpA+jE25zffhK3sJZSJ4gRyZrA2Srgkv9IR7SOh0ByRzx
         D/zQ==
X-Forwarded-Encrypted: i=1; AKwUvBxVX/FnZTh7B26FP0ZZBrDAejLWClgdGUZ6xSdYaCi9HDUG5PZ9nAQpi3Sj/0szzKfAfABOfmnZ8M6y3A==@lists.linux.dev
X-Gm-Message-State: AFuF++lqpt92pRxGsKYxpozsZuX6xvZS2YVKbNw+AhLiKOh4Z8x8MBEQ
	j2RY9cC2te0/NHKPXLTSJjpZ20wA0RZ/t47QDkcJXTT4ZZ3SkRiEu8c8
X-Gm-Gg: AYBFou3cILPAE4SemI0GGAWoPgewGMatvEkggpuJFnu1MONx+GPIZirlUp1uJyYOK61
	lCKVJpWHBT1Yd3qX7Y/p9h9eNc6Ixc9VMyxAW2Q79tlnmx1OKBRCyErLYSFYAU9K+zTd/8ALNc/
	Ep8BtGoZTwRRVi/XJQLLfn3u0Toxez3jBFAUKWk903qF8IVrTI8vc/6Ma4YIFGn9FtDKXlroM0Z
	072F7ufFEQJMBpvK694maMMERIRg2TGj21X4s+g/1uJIvW+74PeQFYkipvr7G13t8tfHFEfCteT
	uUtz+epD9PtA5t2qE7deIaI6XTwMSSfsOF6RMN8jPs56JCTFJ3qycT20cQf8Yu5tNBbVS1jcANx
	MjvnpqwNiG5kxuJZfMglErew4w3TyQGeCPhyqR3yp8DTKHn8XDQp5Nhhlr2VOWKL+o/DmEH4yEh
	u+caOxQTL34zYy65GRCx/7uf/3DqxV+OK5HjzOqLjhCkb0BK3zlkspul0cnr1Pw3UXj9qDPHfyO
	IulrR6hW4XXpS0diaUoWUZEjXuYIKTZJ93qSXr4t4Eq9soC8W14U2Arcvvx0Tnig5p8mgjszP/1
	8tUH0e2jp4/qTFUZbbm1gtpatUXW6hh4/4BT6hRiNMccs20/EydnXvsaqfFZDrwytTKdaDGJCfU
	mHAJft+yfPRB2fhOWllILbLpi4MZi
X-Received: by 2002:a05:6820:c85:b0:6b7:8396:f3c4 with SMTP id 006d021491bc7-6c541457fa1mr2615579eaf.38.1789420206238;
        Mon, 14 Sep 2026 14:10:06 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c45bfc3fe9sm4698544eaf.15.2026.09.14.14.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:10:05 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Sep 2026 15:09:54 -0600
Subject: [PATCH v6 08/18] mtd: rawnand: sunxi: avoid redundant column
 changes for extra OOB
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-8-2fb084fe0751@gmail.com>
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

The PIO write loop tracks the absolute NAND column in cur_off, while the
extra-OOB helper computes an offset relative to the start of OOB. Comparing
these values directly always requests a column change, even when the last
ECC step has already left the cursor at the start of the extra OOB bytes.

Include the page size in the comparison, matching the extra-OOB read
helper. Keep the explicit column change when the caller does not track the
cursor, as in the DMA path, or when the current column differs.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 41d6560d7df7..13dc0af56eb3 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1509,7 +1509,7 @@ static int sunxi_nfc_hw_ecc_write_extra_oob(struct nand_chip *nand,
 	if (len <= 0)
 		return 0;
 
-	if (!cur_off || *cur_off != offset) {
+	if (!cur_off || *cur_off != (offset + mtd->writesize)) {
 		ret = nand_change_write_column_op(nand, offset + mtd->writesize,
 						  NULL, 0, false);
 		if (ret)

-- 
2.53.0

