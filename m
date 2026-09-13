Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6D938DC57
	for <linux-sunxi@lists.linux.dev>; Sun, 13 Sep 2026 04:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789272315; cv=none; b=unQDCmflS5moA3E3+L1MlHhmwue3Wujmb8aSF2tohINx3C7pcndqnQWongZ6jsC+RuQ5CqegT7Z2vfkIG9NttaKSvIrRs8o6FH2vXaIb7+bLIbZd4MURbAP88VWQSzo3GIfFY0tyb8OPWlUZJ2WWNVM3I0R25598FzIEx8aOQlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789272315; c=relaxed/simple;
	bh=7ad0N1K59n1v3Jr94aTA8Zx53dMLKuYLMcOiZWOAZ2o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C+qIIzkQV4BgR9COuFsv+DWvy9mBrlDw6UUx5g60aUEJAol0aU0UjtPWkCpkvhrGBz2VTqVt2MgJ91tS4KTV9q/ElVfrnFJj678QlROUNy/yOVYJGb58iG3Me6J4LohFxO0anay8RYnSQ8BZuJ7a67Z7jZopN9GC1krA4UOh2dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kQZB6GMJ; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kQZB6GMJ"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-805d2fbefc4so525682a34.2
        for <linux-sunxi@lists.linux.dev>; Sat, 12 Sep 2026 21:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272313; x=1789877113; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zvSS6wjgtzp/kp5vxvE4i3FisWUsufvg/JdfpaRzj0w=;
        b=kQZB6GMJEqjbA2zw6XRB9dmjws5imV24JjuokhsXm3wU5uKfVXjjj+avbkhqHh7I6Q
         s6WDIJGxxYGNcNK1++DD53pAcsTh03+JDdRkAksP8P1XmML6B3Ubb4WG/FnXQzKCPyxq
         Ie/pruItKWBcwXAPz04AAb9x9K5B+eXd3foD8g1sgD01dIr5I+9FaeRX5IkUQoQzwbow
         xEeDSeluy8mx0SXrHMmF9+HCheg7H5yrKTbY70VVNfhzU7BDSWsurLgwBUQn/ipdZG9u
         GkmzZSS/sEKSV6D7RXHlMOJXkm7wyaBYpVglOstyudopvW0NfD2MfcaJVP8VCsONWkWT
         tG4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272313; x=1789877113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zvSS6wjgtzp/kp5vxvE4i3FisWUsufvg/JdfpaRzj0w=;
        b=oa5LbuYGKj7DUN3FjvJ7poGIuQyPOZII0MPQh/9BhLIGayIDbfYofpbCyYKvMR+rMy
         8skDXsHg0zeK8b4WTSO0nYpCeYp3rsDKh34fydKYVYHlaxadnR5XPh3vc4CS7nuYziXI
         ebsDI7Zx946PV8wiiKEsJnSaY5hzX80awXNvDLYxcZJGxIsOGpQKcH6yymEW1cZMarb0
         BH1l3zX85ur/6JmXl94UgTa1m2MyN0yOAN/WIQ0RwvhtRI9nkopG2PH1nPEVTqAGu9Fn
         iIKuknyHWLv/YIt7kpOdoo9U3rrn6zbXruOPphokcbyDaWymSF6A5sKkIiRXRB/sp0qE
         tNGA==
X-Forwarded-Encrypted: i=1; AKwUvBziihhn04C+ihpCdX8KdOyg768CAc8xwT+HEdb4j/T+XchQuFcnkuNAoxY47z/VDx3EhhElHPBMXo75WQ==@lists.linux.dev
X-Gm-Message-State: AFuF++nTj9luF0GBkxwSOU3SiYl2uZUcWHKfQb44NRHGzUS+UMxllJp2
	99nfQSDrwlLwFG/jBleXk9VtilE7DT4h1CbiLToEAvMLWUVBYZdyw1p4
X-Gm-Gg: AYBFou1SuTHTxf6gnyXMxlnmpiV4tgqhQvRJU2uzLA4lgjtGTSbMAMZ74UZxWsycjEJ
	5c3Mo2PRdvb4TuyCZ4+1Skg7BcshBN/ngfClNUhDFKF1VhHeneEy7HOlQ+6HAAYZVCA3kQXYRcP
	pTmVM9YufG0S3yxovDyqRqQ6K+WKjUnag7a/Fyxqj4EtnfofFty8bGGpBjZBV/geE4UnYX15GRy
	6Z1ZiLjJdSZ4jfieFTLSD5E03gFv9wjNWmRk16sjtswNu9Csmfmmw71ChO3nXup1+AJyMhynMVu
	MADBY1DWZBgUv6kaTzLZ0G2GQvo+O8kxS5TvWMaTjMvosoBpL6LI5rBGBKfUk1DkiWDoB6P/ZQX
	hZXzCCWoe2c3kDh9mNOdGwqCO7sy0UEzZrngl7DRGrXqG0KvhkQdko85IWjanPhqZFSa4yAR5j1
	v+44P81ctAuGRBcSw2S/ANUefE7onR8IvZP3OEJQw4TZIDCQ38YxOfvbvTUqQ4yxhv+uZGXDkrl
	lyQHE5/T0xmJX8seSvBfSteQ4e6b+k69100LeuPnIGIlkbSL2coO1WnZhA5mAqb8/DG93Pd4wn/
	IVd29V6Js9vxgabcn3u1nfvcLGqbE4Fn44G6JdKWC53UlCi3TcGa7XjhOeqrq2+/qEEHOeg1uVG
	I8RuWSxMxaNgcaCUILKuYC1KTGxdZew==
X-Received: by 2002:a05:6870:6111:b0:475:e235:902 with SMTP id 586e51a60fabf-47dea515f36mr7446958fac.32.1789272312951;
        Sat, 12 Sep 2026 21:05:12 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699647sm6011535fac.5.2026.09.12.21.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 21:05:12 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 12 Sep 2026 22:04:55 -0600
Subject: [PATCH v4 04/17] mtd: rawnand: sunxi: stop failed program
 operations and disable ECC
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-4-4a64bed94229@gmail.com>
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

The PIO page and subpage write callbacks leave ECC enabled if a chunk
transfer fails. They also ignore program-setup errors, as does the DMA
page writer, and can continue transferring data and issuing PAGEPROG
after the setup command has failed.

Check program setup before enabling ECC or transferring data. If DMA
preparation has already succeeded, abort the queued operation and unmap
its buffer before returning the setup error.

Route PIO chunk failures through ECC disable and return the original
error. Issue the program-end command only after the transfers succeed,
preserving the existing successful-write sequence.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Fixes: 25f815f66a14 ("mtd: nand: force drivers to explicitly send READ/PROG commands")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index d5d8d383b6d1..5d88ad3b8f70 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1610,11 +1610,13 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	int ret, i, cur_off = 0;
+	int ret = 0, i, cur_off = 0;
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
-	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
@@ -1629,14 +1631,17 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 						   oob_off + mtd->writesize,
 						   &cur_off, i, page);
 		if (ret)
-			return ret;
+			goto out;
 	}
 
 	if (oob_required || (nand->options & NAND_NEED_SCRAMBLING))
 		sunxi_nfc_hw_ecc_write_extra_oob(nand, nand->oob_poi,
 						 &cur_off, page);
 
+out:
 	sunxi_nfc_hw_ecc_disable(nand);
+	if (ret)
+		return ret;
 
 	return nand_prog_page_end_op(nand);
 }
@@ -1650,11 +1655,13 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	int ret, i, cur_off = 0;
+	int ret = 0, i, cur_off = 0;
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
-	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
@@ -1670,10 +1677,13 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 						   oob_off + mtd->writesize,
 						   &cur_off, i, page);
 		if (ret)
-			return ret;
+			goto out;
 	}
 
+out:
 	sunxi_nfc_hw_ecc_disable(nand);
+	if (ret)
+		return ret;
 
 	return nand_prog_page_end_op(nand);
 }
@@ -1712,7 +1722,12 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 		sunxi_nfc_set_user_data_len(nfc, user_data_sz, i);
 	}
 
-	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	if (ret) {
+		sunxi_nfc_dma_op_abort(nfc);
+		sunxi_nfc_dma_op_cleanup(nfc, DMA_TO_DEVICE, &sg);
+		return ret;
+	}
 
 	sunxi_nfc_hw_ecc_enable(nand);
 	sunxi_nfc_randomizer_config(nand, page, false);

-- 
2.53.0

