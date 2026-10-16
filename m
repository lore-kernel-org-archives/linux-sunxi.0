Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D4839F168
	for <linux-sunxi@lists.linux.dev>; Fri, 16 Oct 2026 03:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792122337; cv=none; b=K1Uullqka/If7sPMwpnftQi9nwgyt9RQJkl6xLbmjSZN8GTjIcxd47W76qB3EY6QtJQsfCs3o4NWfyXYEtCblgyKCEOPPHZRmv6qAuVF//Yd2GQAyOmINwxms67fua8mQFruIjNL76OnX+tDIGaFPaCtlYM3RbF8ZAjWLfdk/mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792122337; c=relaxed/simple;
	bh=QP1mT8TLRuJ9xSIvxqSG9BInMHYpQcC5zhAAnQdC80g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AsfNUmeAAc3ZNxLpFngS+UsQVk8GqMfk4woesaaqTNeL0XaGHMVFqIzcgkWFy3RY7DthGEewwiwR6K+oJfezkp3v/RdOLaKqf0CRt+BqlSf/gtYJxTwuSWNWMVV9aQBobB1FK0VcJpj/4xnOKRucZWzwwOMI+iOTE64xuKtAEAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z+EYXWQy; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z+EYXWQy"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-823545ce223so2086374a34.2
        for <linux-sunxi@lists.linux.dev>; Thu, 15 Oct 2026 20:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792122335; x=1792727135; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9xu2UIC5iJfecJVYRm44JjAaDQ7zuRMhXFx3hC1cl90=;
        b=Z+EYXWQy/hoXFteAWmiHxKgwLbFgtCdCWNPF8Y7oKWoI6EWPOuuHO4ySSSZ4WV46OK
         ITc1DZ3WLySMh1uVvC/XVT8skXxTnZD2m2uPOVllBUTWo9CAcCKu9dyJprPVyOlI0Seb
         JYnNdnFyaf3u9tn2022LwJoYeE2P4VcaRo6ibiwBGuv5LjbMfxC0ilPcMUyEfRV1XXKv
         Es1/C9xTTtcVsLtvTPjCUNQ2/X9U4LcDDR9/1Vg9ndJehiVUzeTGUDdKu5UJe6NbssWO
         K3Tx/2dX7c6vku1HJi2d4hOxm4tya8NI0p/MqVtZUdjbeCjitPKwRyh5UDaWIc/c0hCy
         lQvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792122335; x=1792727135;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9xu2UIC5iJfecJVYRm44JjAaDQ7zuRMhXFx3hC1cl90=;
        b=1aj0Qo2XsKSK4s551hK47n07S569KQlGl0vaUEGTZ1l6jhaKPVnB3gcXzfLjoeMJLE
         KdV+ojNsZYDxNoxK7XG3mgTvhFlL8Wpaa2M++FMWDVI1/TnhZOUA/taiCUDm9Qy7I/OC
         9aYgcj/Qeve+NBVY92A9EqTowRm7BvgDOJf4jnjsTrO8fyilI2KiOi7yOtQofbpG50YL
         6FX4eheLOXzONeN9WHIvk8ibddUIsr2NxUBYGDIvarIReD6QVEpjdP+G9o3+FZUJjg/o
         waGm1DmFHHDLrBvnMioShdgDJjCQEBLXj+orfQOaxOxk6lLkPaSpCmeAj80Yg+V/3yHR
         rC6w==
X-Forwarded-Encrypted: i=1; AKwUvBzFDuyKc3bR+tUqcTRAsWhckRpPN3DJYpkV+2OBj0YrSFoW0EJ345+mVnVVxJP/IAGAhbUwj+N7FIktTg==@lists.linux.dev
X-Gm-Message-State: AFq9FYLF42kBT7PpIfxhVdOZ/THb95OlFCyN+I1VaNSXb1msrzcje9R1
	rPLlZQqESz8YVL9o1HrYc+kGelrMEdlTqhus+la/7w3zcKbTlGKQwD//
X-Gm-Gg: AYBFou06XblyZhi+GSdb9GPgGBQB+6jIZWO1nJnhG/OK8VID8EC1dfT7BDnd82YsHfr
	AuO3r+qe4ikxO4PeTuwh/GuVXOnMfKXH9CKFXAvqrTmkJKEzEQW82uKkAgEBF5h74506jqYh+/4
	Jyq7wYaWEK1/8V0Tk5ZOSNpgaF8s6UvCmQQa76T5gMygDLm+nyleICCnn3+9Nw06BfbuCzcwpug
	UScAdfazHQoLTV+L7v0cUDkr4snbpGbUgr6PZiPCc/FbdMfiYHrc2k9EHMHOSMY9T+in/+83iUo
	ksnqNTC5M2127EmzIDYddpzY+9oGMQtarnbwJJ/BLxXGzatdPXCkyxhYAleAqYHyF5IKmCbIvZw
	Ewn771LNg0o0X+l8ZmzpHf8dNx7iy518JByN4r4ItVU28U+uSvTBRjen4EmaJl6HOOggjCibomA
	j53t+x0DXcoJpAhIACBos50uja/QTt4cNDgCav6U/2N1farrzp5USzBH6c/lr9EgFmDZ8bEddpg
	O3lPJsuWp2naww4roklpBgUJs7jGosI3Q+dDH5jvEgkHrwk9p64QsUwtFUjAcQOnHGzNMG/Xmnl
	KKPeEgUTOWQov0ANv4pT1TVQuIkElShpPximJknkO9TEC9vDg1fM1v9qNo2OL22bZWyNtjbnSjd
	j4Bj3uOVjk+QrIB+nNnKBxg==
X-Received: by 2002:a05:6830:4394:b0:81b:9d18:75e with SMTP id 46e09a7af769-83090e15541mr22707196a34.4.1792122334840;
        Thu, 15 Oct 2026 20:45:34 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8429b57870fsm834402a34.0.2026.10.15.20.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:45:34 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 15 Oct 2026 21:45:20 -0600
Subject: [PATCH v8 05/17] mtd: rawnand: sunxi: stop failed program
 operations and disable ECC
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-5-8ba4881fbee8@gmail.com>
References: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
In-Reply-To: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

A page program has three stages: send the setup command and address,
transfer the data with ECC, then send PAGEPROG to commit it and check
the NAND status. The PIO page/subpage and DMA page writers ignore the
return from nand_prog_page_begin_op(). A FIFO or command-completion
timeout can therefore be followed by data transfers and PAGEPROG, with a
later success hiding the original setup failure.

Check setup before enabling ECC or transferring data. DMA preparation
occurs before setup and may already have queued a descriptor and mapped
the buffer, so use its existing abort and cleanup helpers before
returning that error.

The PIO writers also return directly when a chunk reports failure,
leaving ECC enabled for the next controller operation. Route those exits
through ECC disable, preserve the reported error and skip program-end.
Keep the successful setup/transfer/confirm sequence unchanged; this
patch does not add a new controller-reset or NAND-abort policy.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Fixes: 25f815f66a14 ("mtd: nand: force drivers to explicitly send READ/PROG commands")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index f7ddd4116bf4..d71b980ababb 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1602,11 +1602,13 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
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
 
@@ -1621,14 +1623,17 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
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
@@ -1642,11 +1647,13 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
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
 
@@ -1662,10 +1669,13 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
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
@@ -1706,7 +1716,12 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 		reg_index += user_data_sz / 4;
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

