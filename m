Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3C8343D86
	for <linux-sunxi@lists.linux.dev>; Wed,  9 Sep 2026 08:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942660; cv=none; b=N+gGDVCmasa8Ke7lDTCWDOLdVtlyg7ZKlQnQhflIGhn4d770w1owwwNm6fBEGjaSXSSGDAqSUP6z50x/p3U0vmj1ILSzSm5l4FguHQdIsJKUQDHldh+BOD2Infz5dn25Z4EaVypMfqko86Tjvuo21mC+oYdnxytA1zBpF1xl7Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942660; c=relaxed/simple;
	bh=JjcfMNv/ryMPrxdyyGEQfKzKotCCfWbAANdXEfsoU6Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hFYDU+gtafZBNtndWITdvLErBuUJZGs5HqKZdrwQLCbP/8isPqXw6aY+lmNt0xAb+5K7bXFRsr6EH+YjrGILdjMQSU2NnoJfrv3vq1cfTDVSKEvNRokrDr1B7vvHE8JgEBKZolCTC9k6MjAhVICE7/8nWbipPzPgZ3IL+5QIUDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QLwdva0K; arc=none smtp.client-ip=74.125.231.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QLwdva0K"
Received: by mail-oi2-f12.google.com with SMTP id 5614622812f47-4b37a30eae7so660377b6e.3
        for <linux-sunxi@lists.linux.dev>; Wed, 09 Sep 2026 01:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942656; x=1789547456; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TAI1w8ATMKnIgdhqgRiA5pqnRC7cEUdZiCb1QZM8MYQ=;
        b=QLwdva0KwtWunJG8p/6l4kmk/jlSp5L81ciogckgedoMQgY2hEDIFJ5w146dow6221
         b1hut7mZM5ZQsgsKXLSMnm5KQp4FJJYEh0q2EOusrNzH9c1cxmtR5mv1ZkP2ou3whGRA
         rFrd82dVQsdYe5Ynq6BjorERGNsf3EeONjp5lh3o0veoA+NBLdTT9iMI3EmooFFKx1nE
         Dtyar1+8dPE5+5BWZw/BPu/8TIdfRK9l86wu+12w3iEp6GrDIo9oWsMTtaLyfFxouB0W
         s06uFIM8DQxVu5EJVeBvu/UVFP5AGbfZNmfrAmkXoFItluB1SvpCkbPI10UZ/I2ZtBJu
         HLtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942656; x=1789547456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TAI1w8ATMKnIgdhqgRiA5pqnRC7cEUdZiCb1QZM8MYQ=;
        b=Ms3Wp0J5BB1o3zmuI3YPN8Xfd2HTcmm7Ep3vIjob2Ul16AT6xAuAfVYmVuQSbO1OR9
         TUi4Hb1+9N51hoi1LpsufvgNNRPlyczeBv1KPcfwF2YEBNmmM2ekQ3hZKAdMeyvrmzc8
         bzhuCQI1luaM8eigV5pzR/84pCLNA/Tv00j8uUfMXJjwJYnFtLH0588BMnFv59Vn0JFr
         cyVvUrL5dwq8wfX7jbkeUeaOrtF3VVYSHMimpNVY3YqMBBnEJG554hL7vB8XN/23XaIJ
         ITglm5Rw95q6wZh9e9RiN4GXTkdluJV1fiSQA21p3pDcbNLrTCAFpctU82P/lw7TEHM0
         F7lg==
X-Forwarded-Encrypted: i=1; AKwUvBwFcUlkO7PW0rfWOJWqRhgcuG6t9abuLtmtzdMRL+JCjc58ievgZnlTUJ+cx88FmmjgQCp2k7RXZ4kVdQ==@lists.linux.dev
X-Gm-Message-State: AFuF++l+Ob4uC15Pp7tWTY9SfHltYj9VUoBEPz6NQoSBHIXWmyw85Bny
	99ucd6rEcyhrmBaVtyX3fJth9Zo/j7t38fSh0Aes1he8ZUEFSkNxcTat
X-Gm-Gg: AYBFou3gRHs8EYC1KUyYjST7zPh/kQf8KmlHi6zALYG6jL4HP/eq4Y7LUnwbcLuYK/Y
	3oBa3JwM3YoEN4nqMxhyudPp4uIdkQuyar9bSreud64GU0plUScW93SWD7/naB2bX3JUfad9YaR
	dwV5tGAOGbpG7ITlokUJXMSHiPgtH61V2lT2cz/PI8eND/wPrPkGejbVn9xF5HUGBiRL6I7qaS+
	lx9cV025jadqTbyj4un1ZKFcOxJFrHxoZUympFSzhB9AJjf3bIYARWiuUotSrdwh/KOItVjH2OH
	madr8FOrU1JUuUCObcYEd/A0BdaUe91FGXqfzFFRYCu0+A6dxxrKAlw0g+gKyMecn++TkmMJB/1
	5dGLs/xMZ147Z+FQGgi5kKe2+lXmLcfjgq66wm5mZJo21O4ej2UQ6q9ybXxE4fvoAZcJGPbrNEJ
	0XOBbNA3u9fsgjPUanJgHBXmMzPKpRwLOUiJQnQXEQYF9GtA9u/GC3llTLhqryNxPYR3dHtmr/c
	BMC3psPbgubnYywXE9zrQiE5eWF6DAjBiJlBg0xRnwXRD6XqHYHeejFQH/9+XttXAC6bPBNQkOQ
	52ZTvvfMhdIYSEsBmcUutl3xjuxwPCpi4N/REEWoZL1LVffwWCjDeiZvgUVLkc31fsZfRw/6XXl
	ZwSTYrtFIDJfGNXXVawAg+CfQVSz1L4IKn5E3uBs=
X-Received: by 2002:a05:6820:61a:b0:6b1:ba66:6998 with SMTP id 006d021491bc7-6bdca848f71mr4429570eaf.14.1788942656520;
        Wed, 09 Sep 2026 01:30:56 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6a0sm19031004eaf.5.2026.09.09.01.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:30:55 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 09 Sep 2026 02:30:36 -0600
Subject: [PATCH v3 03/15] mtd: rawnand: sunxi: stop failed program
 operations and disable ECC
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-3-838cb0ba1547@gmail.com>
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
index 5190b39aec5a..af8ba2d9f7a0 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1598,11 +1598,13 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
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
 
@@ -1617,14 +1619,17 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
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
@@ -1638,11 +1643,13 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
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
 
@@ -1658,10 +1665,13 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
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
@@ -1700,7 +1710,12 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
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

