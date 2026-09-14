Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E985125CC74
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Sep 2026 03:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789354907; cv=none; b=juw+yxNrd//K7414iPBcJvSq7ra/HroreNWNZIyf0Ln1O/Moxfqbq1b++AFf2riNSIOfnNivaimWFpfZN7ulWXu4xos+NHGpXRfYzFR83R92WJ4AEGHMTWO05qrDtk3sfpkI227gdrDIUGG76em8cV3Nl7L07tH+1PldWf2whss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789354907; c=relaxed/simple;
	bh=NlWMHvWo8eC8a5062ul0UGSwTs8Firq1Hsg3xcZzp2E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hkH3bIHs/Amx/Wcy6Cnu2Ql0qkPH4cDnnIltQjGK4IPf87GLt5EAPrKNjInSo2oqpo8o+ZjcwvbgzbnQ1Yp59RoeMVXzjeM1+s7Ih7fl4+i5F6z54SfZ/udkHUva8TvHmCDC25IXjJPUucOHOTpkDlnkE+cxEIJiieMIk3pu+4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Crcm955v; arc=none smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Crcm955v"
Received: by mail-oo2-f42.google.com with SMTP id 46e09a7af769-8050801d337so1103173a34.2
        for <linux-sunxi@lists.linux.dev>; Sun, 13 Sep 2026 20:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789354903; x=1789959703; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o8noBZbj7C7U90sjdVnrOExXAG4fUCSDlE1zY+ZGE34=;
        b=Crcm955vNA2ZNIPPzi9D/r/nUlB39usn23JmAnCxhQ9APx0LG+5unbhpuf3BpQvZ2M
         EaM64kcK5xAMb/NN94Q2Q4J6y2rS9U1pQfKG9fe1IpwjlHKhd499B17hkq5Z5ZR0yWvn
         v53DE8qauLDWqzy3KMMP5fNBTW2buPHz0dKYuqT12lsbyUDXKvqBMf1rQayUfjbUgSPe
         731u/qtMsyDPRi40//ERTBg45L/rj3PZKNC60H4H4zzphk1aAeN7b/BMX7esowjTLjFQ
         RsGLUX9dkyVCZgACMtIV5XFAS3/HbcMQ9wodsm7VDLxl+vZWpqqby4qmOH4LN3wqvqkN
         lRXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354903; x=1789959703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o8noBZbj7C7U90sjdVnrOExXAG4fUCSDlE1zY+ZGE34=;
        b=f3vOEIfi2ASA/w/a9wLs5oIsuDRkqv5bgAatZ1kw+zeUsDli2dsdFfz5AQCxXPhAEV
         bwViv7isBeC0Mg0M9JqT+7WW7EJQ0190cctHD3CCqGgV/MSi9k31RZcvUkj+Yk1euO+H
         Cva1JPXbnmYjGpRiSArcJvBROGdYT25YXnNDCC3VNEmneQds/MhK9HyV3VBBkAKiQPc5
         Wb/UxnuhSHPZdLk7ilcswJ+RZEusxsxkJ22H5A2Pez6WRFo7uEjKo30xZCv0WRxeRIwK
         BaTb2bZOCVcrMvJPtXQ1a0xjIxiFOOzlvR+BhAPW5BRLSJ9pHeVNXKKOswWpP9FLf8Z8
         NG0g==
X-Forwarded-Encrypted: i=1; AKwUvByCLjozmJiPYs4IhPeUIa1NtnT67kifVp1YVN+90wHcbaqXSARTMHIq/GHOJbElCUGB65LBqC96Yalbvw==@lists.linux.dev
X-Gm-Message-State: AFuF++noHg56cMrRcszCo4w4ZHAGgCzhhFBqLzsEouJIbHVpsjJJxa97
	IN9oAacZfWSK9EOxT+42IKrHnpfJ6V0w6Iv+Llm8fk8i+pLvKjtJ5e7H
X-Gm-Gg: AYBFou2lzSgv22KLZlVXxMLYnxqJOTKBaHqN/l4ZsXIV3E0NFwk5AAsMVvBH3wpV+RC
	8qyE8Fbai2nFf/HcuybWG3AwSMqVtXn/c3whHG6QClwopClo/3It8jLfXduWvabX8c4JxmY1Cal
	g8KaFPAL+5s/FoXEtQ/pR9UQzt664gaqWVydzxn0lLZkDLrJHhgwsQPhgu8wrjlQJdNW5vAU1Ne
	ojqkUdU/hGtXlaO5vDvakPkd6dT4YmBdq6rPGndGp0kd1e3nhdMUvNe8ucmGbqZbtl/HvhybCEq
	oEA1ieTI40kcFOVzd364U3jInpBLfKS+wtmkGZYAEKqjxu+qIJlp0INu1YC7qgmMhuucAed855f
	SF9UPy/rXyyaC0wihpaE0Op2JsbfLFD4Ux/ZpA7KCuHjzLAO23sgy+pBm2nAK4Ih6paRJ6W4dAt
	fnv5yBUFM0wbCgWLBnXArOJxd+9BX97EwLA0Gmoy+t6sgjxHIfykfjsuINVSG2+Wakoi9Zcgqh4
	XXARJtjDshEFibUJKb5ple2kgO2WRVuSCwUXgXE8snIM0dgnNWor6KVWtQ20Q986qzPEAFMXXsd
	8ppZgULYFhte8lN6AGHszwZMM5gw6t2lfMNoMdkdktmj1foECCZ+1OJ/HFp6/LDyBzbrsqXagsR
	4qTiRXl8YYe+IvFUT/FH1wJFYq16Ckw==
X-Received: by 2002:a05:6830:3894:b0:805:9f8b:bef8 with SMTP id 46e09a7af769-8089974baa0mr554382a34.14.1789354902809;
        Sun, 13 Sep 2026 20:01:42 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60feba1sm10619014a34.13.2026.09.13.20.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:01:42 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Sep 2026 21:01:10 -0600
Subject: [PATCH v5 04/18] mtd: rawnand: sunxi: stop failed program
 operations and disable ECC
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-4-7d711076a6f7@gmail.com>
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
Cc: stable@vger.kernel.org
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

