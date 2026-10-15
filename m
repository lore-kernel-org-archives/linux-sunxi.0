Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3098433C194
	for <linux-sunxi@lists.linux.dev>; Thu, 15 Oct 2026 01:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028065; cv=none; b=Kae0BqGAw7tPax8bSsikh1SFW2L06/Hwdube0IBREI4dHgrc3Fs8mavgXFI/mULPPOyq12xZDT27p0qvq9cbNA1dKMYiw1NnZm2zzGpRD2Wy0oT0gOODG89e7tfrtWQbD96nKztEbinkmTV8nWnT3ZGFxUCL+y7AjTwtDF871vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028065; c=relaxed/simple;
	bh=JonTCMkfo5CDzyNZ0Z71f8IamWNK7BpOBHaurYUB32M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PdMk+YJX60DhKgiIZZONDxC7oKNEHogmj+FBHlr6M0X/HzuecGc8CShL8CdLukHj2ZE7smWXxMYfSh1v9jRV0S5r8Xduw06RpHqEJpPSl5PxxSqXwEHMQGB0Dfwd9jBM1+Ajqj5UG4NpNfTzzjT1n4h8Wn8RmGHvbKXrKDX29Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oytNhFrN; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oytNhFrN"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6d7e06dbcccso2888462eaf.3
        for <linux-sunxi@lists.linux.dev>; Wed, 14 Oct 2026 18:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028060; x=1792632860; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GyWvw8mLllrKH86kVSbt9VISfrTspBfEjHuwdH6ZSfA=;
        b=oytNhFrNQGMH9xG+n/+iamK5aD747UkHh0j6/roG6fTxvZKduSttSMPlD67TZXBThM
         Qk/q2F6bAo6CZAMrQQlvJBgEs+1m+X7HqYRs6Sm7wMO0uEHzp6PdHLAKYEomee0RiqC3
         GsHCzDa39M2RBvrqyS5Evs3lk3AAKD/dIBwbPFCQwDzlwYWCw1QHJXVRi3TrDfGVNZ/Y
         VEZF2CMNetfoW62Wyo73YVLifhob8Fw33XgYZEGeE2us8sO+BeAJtXeFxzRvnuTz206W
         5Eahl2Pw8RZdx1JxWZsfOdbok7j8k456d7A38wEklp7M9qvYn6HlmK2/XGkQa5FmhGDL
         1hFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028060; x=1792632860;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GyWvw8mLllrKH86kVSbt9VISfrTspBfEjHuwdH6ZSfA=;
        b=fX6JVwgvvYQ9uUw/F6z4OqhKhI9hXB27wgPV1V2TfvaAF3nE501z3sW6UvQKOMArO1
         b9g659A/tvnuWYmb2RKqlJznDlGHbG7Hu19mrsiDwdOZiKwZIsUAMwoaF/u1LknsZu5I
         fS10RWopt1aWc/QmhaophOZXUcM/++P7KzLwRGvuhGwtZqmMq6TgbNvQlkq7tH6EhtEY
         GnW0kqOhc/HYbX8Lm0k/3MriYQO9HIE38yFsx/PDIkj79ZB56UGAd1L16JuYNIEyaMoW
         lg8hPSKGr+OfuEAlJSsUFCcy1KSyDFA/JL6HW6T0GbZLwCkB3EsCe8eMpNBKw32Ipssy
         bRMQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6x5k3vfH8kNJnBwgazJJBJ/etcIX9NvIUJBZCKlabORbk0IJTrkW6NfJhPc5XJL2AhCtouhPyi8rKPg==@lists.linux.dev
X-Gm-Message-State: AFq9FYKU8q5R5pt5F/tBmpmab0KpludCuqZbdvz7me7l0Go3iaxUINVu
	QHhSzvcVIme79VISocsxuOKhabiNXQW9HXV4ONnvIorGihdW5niXyIRc
X-Gm-Gg: AYBFou1F+upIL3p3LoNFWwbiqkNnKJlaH7130RuEa//SlAp9ToJBCJOYFJaaLFkg5dS
	om9LhM6BoXTMhzenAnHgzUGhsZAq8h4HbWipY+I/MNlx6wKl4aKEBIJGfIZk6la8F5kWn+Oy6pA
	273juKZL1cl1KRCC57mwM4iQ8IJNHZ6MuWd0bWrlITIDRSUGLOuNWVjeuF3nhL5OZLzIYg1VpDt
	wVfdlor1kQmbG/yyo11R94MGGFt6NrGhFmMbby+lrIwpyEvQKLfk5ihHC1YxHcah96SL2w3p59Y
	W4gnCC29WYuwlBk4tNIb7VORTuurPXMLXFzAweyPcyoFDCeeVexyRRnxVOdO56QkgPpYEMavN3G
	Ptr14XaejEer4/i9RVyOg/cbZQkIcMPZz13rXutj9tyIFfINBN+2vPTeoyjZiZwVqfKuEcLHfwn
	t/fC/6/fEFiscbkt/3X1P6nRsB41WdxpQb7xz4clkUl/JITgApHMTgdkc5Nchyjf6fxL/G43qy6
	ehor+srtab139tVxHmn//ZRdfzxw7xzBAX0N9VZjl6Rfw7KhVuS44BC8og4+ANUW5g9o0eiSMlG
	81W6L4o8K/qs1KSIMq8aF+TRG/7Z1HkOSeLGj93aT9mYYylfIlH3iL3TcRBmmHUuILuZ8/D4Z6D
	K6g5pwJSELC39Xbc5Atws
X-Received: by 2002:a05:6820:4d07:b0:6cd:3fdc:6001 with SMTP id 006d021491bc7-6ef115523a1mr12486639eaf.82.1792028059992;
        Wed, 14 Oct 2026 18:34:19 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a6dfb41452sm3428139fac.4.2026.10.14.18.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:34:19 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 14 Oct 2026 19:33:52 -0600
Subject: [PATCH v7 05/16] mtd: rawnand: sunxi: stop failed program
 operations and disable ECC
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-5-5d3fc6ad2da1@gmail.com>
References: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com>
In-Reply-To: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com>
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
index bc38330c0e36..57df88099206 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1595,11 +1595,13 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
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
 
@@ -1614,14 +1616,17 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
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
@@ -1635,11 +1640,13 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
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
 
@@ -1655,10 +1662,13 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
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
@@ -1699,7 +1709,12 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
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

