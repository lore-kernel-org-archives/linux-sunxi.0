Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4D44A090E
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Sep 2026 21:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789420207; cv=none; b=k77osW6j37FjWkbrdb71/rpDIFihweI1QCAC9wUiahGcxAf3HM/65ddXs4czODcbVNhVdqYsgRWltkIvaQrROoyypK2pqWR02zwCUpyFpWAD5qxvCVm+6wMkbg/O16V1LB5JlyNoeH0pDI5EgRW/znHCaEqaDK0wTKac8LQ42dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789420207; c=relaxed/simple;
	bh=NlWMHvWo8eC8a5062ul0UGSwTs8Firq1Hsg3xcZzp2E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gjbwSwLH7NK4bnGyXG5mzmpGvnCTXtJLqGU9PccKg4ofoUENtKUWIdElpzaO3k5fWMs5aX92T/gN6n5bqnl7QplRlnXPqjvcOEeoZFH5pDYRdVnAOYarNLY7bTgIv+ukOPVmBkF1cuYgzTisCCPUKNP+IKy5iRgm5YHYvYUmaAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iU9/iQ2H; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iU9/iQ2H"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-46ac6e5d8f7so1446897fac.1
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Sep 2026 14:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789420200; x=1790025000; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o8noBZbj7C7U90sjdVnrOExXAG4fUCSDlE1zY+ZGE34=;
        b=iU9/iQ2H2ja8lPortm1P6zraF5UYMxb6866tZoMtbh3rMRk2f3IvrxK2Vx1KlLkOJj
         3FasraN9Jar6YnCNLnpgclxBJE67Z7V1LYi6yy+L/TGYQYoGwbQYwp7eRM92Mdzudx8f
         Y6yFb9ZvqLpR8/Mk6+ElYOdmZPwDkVxSPX+whuqECHmtkugxAiB0/5DQnIr8yn9j1AL/
         VE8qF6tww00qlHVoAB1d2G9neLTkqBXXkMI0jzBkSnl/hzS9lazAYtXs4rDomw4YBeWv
         PB4iMN5mzxWX0l4A7ySiE0FG9TO4YjLUtWXNs9/6g7UdWPb4dt/fVEgtZuNAzeX6Jx56
         fDpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789420200; x=1790025000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o8noBZbj7C7U90sjdVnrOExXAG4fUCSDlE1zY+ZGE34=;
        b=SvqTERmFWmEsSNKO1GemT5TeqfQA8+OI8TNJVr1B+ZEt6liVFq28vDPbo/+gUuvSAl
         uQgqhVIHEWbs5zNH//DZU9P8muc8gdOUJGwGrPrU3GfIF7m2BKnjxcSKwx7Bxqbj0EwM
         CFRSICShfvgnU/QxPvxa5Opl7guYApsx10rdLmg1BriZL+lHyifbNPf69QYIzB3wYVnN
         3d+ENdPqS90qN4DOvqnUPVleAT4mw3C8VQ3xmfDxOF1wWD3JYthQdqO3/5+ZYmrVjU8s
         yK68NPv/BKBg+Onsl+Y2w8yHhBgfIQ75c9ffupe3sGo6hH7tMTTR2nyxEY3rSMB3dvE4
         atVg==
X-Forwarded-Encrypted: i=1; AKwUvByX+4cZKVEIsJs5YmXPqe/AoPw97r4wV7HoAbPxi30JWkzV5TI/YKu9U5pjvQm+8/RgOQOaSc6wSLMmpg==@lists.linux.dev
X-Gm-Message-State: AFuF++nq/apwKhGTWOGd+djMueTx1SdMFEJBGf8djdWS+Zes5aeJ5MYD
	ATMwIupBjk8Pc36Hw+ZoyUZ1fGRgo1GVz+o+km4iKUwcQOS+Iuk1DbDk
X-Gm-Gg: AYBFou0xtz+UicPlOhAgqXhLcU3+LGW2gdXzkymg6gIw2JYWkGNKXJ9Cux2iJwXLWnG
	vzXeh39ysE5Se10AcUseoLQAVKJCYJ1AbXwM7mYmE6I6sUCvIxl1R4tiYV2u+J3RMi7TOrTNDNP
	JdNWafxuQCwTyvhutHBzftwmdXKrttw5PIktN3RsBCFiXzeHrvB+dcj2sB/ZalGkNjtMA1fndMZ
	VVhYjzJBjBn8DzFAsdVZNYJeFddFUJh3inpBQ0Sn3wFwx0b6Dwz4U5gSM16n9eP0yHgderWIe9Z
	eSNc0wq60/nMZbvhi/eMbaAtSiukWmhEK8omXs3ZYpBZZ669C0MqIEzmh+Gp1FiTYNe8fQCZX69
	f/yKHOhpIBWVTLKGBJfTxomHHnlF/DhbAtfcuqkVN5ib35dLZQuBHBMWYeB1E6BEhaMd4z9zjXI
	f+4MDQFGWs4z2fd4eWtZeuyDvVzP66Wguh29tJgFhomOpXf+YEiF4L9dMyXS62YevrqY4UcZycc
	Pico3UH5r4AufoWMDnIV4CItenuaL0o6nB5cO2ctlEL7/mkODYJ2sIIyW1bYlFm3p5/8ZtByH6K
	L1COY9JtC81X//RwzzHukI+MuJrZ4jCKzX4YrLgx4zfCi08jqBYOeHDPzxXkz3F0faIxM9l4Z7r
	kliN3hc2qzEvAz9XibYnkQNaz+J88
X-Received: by 2002:a05:6820:217:b0:6aa:ed21:6c95 with SMTP id 006d021491bc7-6c53c6f60abmr2434425eaf.0.1789420200643;
        Mon, 14 Sep 2026 14:10:00 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c45bfc3fe9sm4698544eaf.15.2026.09.14.14.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:10:00 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Sep 2026 15:09:50 -0600
Subject: [PATCH v6 04/18] mtd: rawnand: sunxi: stop failed program
 operations and disable ECC
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-4-2fb084fe0751@gmail.com>
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

