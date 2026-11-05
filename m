Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904947;
	b=N/2VY+JQEw75YbFj2Hxor2G1vIB9w7HPj5ZDRQuM6j7zcUvPx4Hjz2RKtDVF2VULGZCN
	 bcjUr0MXDdRMDUfHNHtsKv4vt9qPNq3+yFU23dvvSSGXDVsuMA/A62fACBsvIysA/EMvS
	 aAaRB5WWOExlIHaDuDBHjYABKrFvyfIllI7ub2bWsKBYesYzyWYNFRy/ByxGbUZeS27+t
	 FYYAMxkXdMRce17EDukn6pv0p25pNDkWKUtTq8ur51+QDolfPDnlcN8zigfgfBPclRX5N
	 fmKVKrlycGFoiDzYJTP5CCoWizZ02GQamxUzPGd5CxdDuuAKYcRY3JWW37UxDXGXtcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904947;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Km1F4VU7EFf3gMbcR27k+iCcZ4YJytvSjdEZeNVUaRo=;
	b=YqFXcRjItsmmQINEfFUsBMXRiFTAkMVJg7uoWEN8FPqumHp8q9bxy5Y3uGMN3LOEflXV
	 bKHtT9CIEL92nEWLETjwgOlcPuYYIY92qJV68UGZrhHVTVulEJ4QgxXsZkzswS8ydqbEC
	 Wbb4SZIUWxchzrLYymScEb1T8ScdvifSjF2jqrEwjltA/FvMiWj1g2/kgN8dxyjKAc8x5
	 trxQssaO3kz+WQFok6kdjP+P9s5tbScrBiXY7PyMODoFK58fX4HRBih4PA4kUwj2LBjAS
	 l3pgef/2+NcJ4WFw69A++WsMrUESHhtI5vS43fP3F8xQWm7VYGbNX+I4FH5C7I/pQYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YEzWca7y;
	arc=none smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22EF7606A33A
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Nov 2026 18:55:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22EF7606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YEzWca7y
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6df5e315bd1so1891444eaf.2
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Nov 2026 10:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904946; x=1794509746; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Km1F4VU7EFf3gMbcR27k+iCcZ4YJytvSjdEZeNVUaRo=;
        b=YEzWca7yu+tGs5DLO9SRzo6hjdNmHmzhWQzVdFXpkkTf9Dfm9cuh8kEdJZ85/c9XX+
         qKZ3lxGhuxHbuhPjJtsWEMLXzqMY3g0sMNKNKJMPYZYxzLD6xUen6m8qoi1c7LWHnXhg
         /MPwiRllLRm8AzYIkn2KpxlEa3gbju4UiW+vlsJ049gXqk75ymRhuRwggG7kNJPqkapG
         izMY/rykNjWIwyZWZ5eoQbWAp0eDcB0tmJRdo+/7fv0OWHmYADapCb1VmZIDIpYgElq8
         pZE5fzeDBCn49unJkcFkAYwvKpaOsi6LHwxbu1KxYPWWW7lHsmJCuQCWLWSiM1O83m6W
         V20A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904946; x=1794509746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Km1F4VU7EFf3gMbcR27k+iCcZ4YJytvSjdEZeNVUaRo=;
        b=jG036V5hjCgxnvlx6NLbV9zAQFZnaTwVFBUdAye1Zw2usTCL08LGu08bkTnCMHRg1Q
         SJEQSs/R3+1HrPPi7GhO3gjCmaxZ7J7IiO6KkL61RfiIVwJhNGA9AY6LsNMBjPiJZ8Nc
         w5ht45ZypkbXH6sHORef+TGmX0YoCK5PyoY96h2F2m5Sb3FkvW4TMjWOnPwb8gdzkLVk
         L8opO90TBBh109e2zJ7mhbIrdUsqpl5CENEtnTXeca30dNJE3g+y0uhiy9RBAlZ6gi9e
         v4OYY2ikdK8d8+nbUw05PFW/wITZC8BbpIbrTgQFRSL+fqQWf8ciLrADrtBjRXXgaeIV
         8/2Q==
X-Forwarded-Encrypted: i=1; AKwUvBxXCgQqNnkl7balddsjJRZDMwY3Lvf8ti8V24DQyAQcuhy27bEOjytTBLxPdF+mFrkPx6YVx198VJkjkg==@lists.linux.dev
X-Gm-Message-State: APuU4Z9mxH8rBIVAKDsZmkFe3+CPhoTSl/ooEixN9ExqVP0bE3g8JhEV
	W7XjdoWcC3QIy3E28BAj5H4EO6qSSztAyYzW2ZKdFe8hohdQgyLQeYXi
X-Gm-Gg: AYBFou3et4fLFitqxZup0aMS2KwYYHTn6PQuFp2avKdIaHA2KLL2FQZwJGnOdovffP6
	qq6pOtu4pW+dEvJZYjcVg5AzEMJlf133D8ALhg7FNFuQSc4pwkRmRwi6p0SMA/XbnIfPqdDZHhD
	WizK9OFDO3IvZe9vuiHYokdmezJPiORnmLF6dg7m0e+vyaV+ipE3c3Zi7kDNqCxQWk8RRtx2Y+L
	8JfXiwPCofqz5alDoM7mAn8RhMszKyb9BXYJWZ+zSfwLHZDGI+tvRw/yvyrRzpDfKyXvFnGPDrW
	n6wOva5JF7m/qwuuKM55KsHo3cgYXkO2jeSPk5IXsBQPNHrKgVy8F8sL+Fpiv2L5ixj9zRLu3bw
	ZOIm1+2FgHDavcy6Dduige/imsScj8nshRcjp8HtmGk+mtvjpidEB5vMBupVfYmAmoophVJX5RT
	CcnNKMPvkTDjKLLzwx7pK/p6lwfDOifDNbRMxLnoajfGNq+VTlNWLEm6C2S2+PHfrEBIVbeQowr
	gj5M00PjumwStbooHpHxjhku+Ln5lnRHt67vj6h5+N2xKoOKAY1nARIDrxDm+UBO5qnY9OmCbO4
	5F9zLTeGaeMltvhMkvdyyJxNA9dD/Evo7KPSNtqHtydHOIII+dy8l5gUpQHFEGz2fccuRhmuyft
	VOLpCU/N4aj27bJ7uCj/OviYjDR//eNCih0cfHha1hMacQiAcxLgh4sPLiAOFrhuuKHtY/NnIMB
	EH/QED8H66/YRJwWHORRGP+jm5QV/ZzyK8Ku0VrHj0895YD+KF6HjE
X-Received: by 2002:a05:6820:2d04:b0:716:cbdc:4fa8 with SMTP id 006d021491bc7-716e796f91fmr333364eaf.41.1793904946065;
        Thu, 05 Nov 2026 10:55:46 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:55:45 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:24 -0700
Subject: [PATCH v10 08/26] mtd: rawnand: sunxi: stop failed program
 operations and disable ECC
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-8-dca1f6ed29a8@gmail.com>
References: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
In-Reply-To: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org
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
index 111094b1c64c..02aa02d2cdb9 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1611,9 +1611,11 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	int ret, i, cur_off = 0;
+	int ret = 0, i, cur_off = 0;
 
-	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
@@ -1628,14 +1630,17 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
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
@@ -1649,9 +1654,11 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	int ret, i, cur_off = 0;
+	int ret = 0, i, cur_off = 0;
 
-	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
@@ -1667,10 +1674,13 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
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
@@ -1711,7 +1721,12 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
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

