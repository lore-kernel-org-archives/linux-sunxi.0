Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C61538F941
	for <linux-sunxi@lists.linux.dev>; Sun, 13 Sep 2026 04:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789272330; cv=none; b=tZ8qFiB7K1aSZ0wWSH/SftwuHvMt087KfwjjImoiVLv0792iDeOunK5mNas8xLm4dxKOcSSybeOhp5G+gbLRkoliM4dp60TqXbYJYYtFCqTObk/L06uVldboxVYTGIC6DYi4VUBhOwC7fwMtwYoudoli2K/V+0E2wMlNg+Fm7y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789272330; c=relaxed/simple;
	bh=sHxgZAC22jRN5x+cGiwyrOUKu8MIdzjliuwZEPvI6DI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lcauYjr6XJmNQYExJeVnRQWCbvDrgyMUVdnGfZc76NKFu2R+JFrzqf2B7BMZyVFex2TNhoTrMfewGk/7WmiR7MQ8K+P03ynbUrRwmqUxnsrKncqcInf6JoeFw1H2PxN2fmHWDApyzd1slaHyVs6SLwRhDHtG3zEfSWTruRz7GvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E7g/D/SN; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E7g/D/SN"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-47a6c640bf7so1318172fac.0
        for <linux-sunxi@lists.linux.dev>; Sat, 12 Sep 2026 21:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272328; x=1789877128; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I96nTr3z4iUIosSghVQixbz9aFa+jjKeIwLd+JYqRDI=;
        b=E7g/D/SNHnxO5AjB1bjl+oaJ8K+yAt4i36ix2i/q0Srtw6MM/xWNZd2JVNabQb2w+g
         BwkpbKq3NLPTXVpTgdRJvLONkxaKmwFoKVpGEha9Y7cH4MWgiriXCKxeAdT/Im1+KzcM
         WK7LgdZKvYX89MhuqGEMscCihdzlpPyj+/twimsvH8BiRgidiGnh3QWmLDfIdehc1em2
         Dr4ORcLDgEHAW5B4JnalxMdPl9+5h6IW5a/kIam1R23QUJabRVIXPWeFKJrlNoNqfJ8O
         0cfcscbFOgVUDHOrXmLKUWQbLRfET1h4px7BsEEKeuZuKJ2XsxC+K7N1lasBe3tEyHae
         8cwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272328; x=1789877128;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I96nTr3z4iUIosSghVQixbz9aFa+jjKeIwLd+JYqRDI=;
        b=ZJYCMvVaS7pBLhZ58MJvcFRt0ckckyP9TVW+/MiGdjSQtaEF2q7Vq0KV/PwWW4KwpP
         B3lpqnb95CwNagWbPx+Njo8fCxlojdpfHbhGSrc6+DYIHUjay9taRkAnbr4MyFOYxfMm
         uGGz0mluJ1uffSH1y4zLpfLdqYw351oBlZSLtnOtdpqHIYefCDOeqcORZNcPn/CyEDFc
         +jau2/F54+KNhb7fGP1f5OeZumTsCzxtvdQ5TrotpOSNovF7epFuwpfdn/2NLZWH/6Dq
         T35euAG16YSy0Dl3giccXY5ezFnzBm1jOqIreo2trL9AvD/kngyxL1/QONJjpw6EhJwP
         IOJg==
X-Forwarded-Encrypted: i=1; AKwUvBxarfDL/LbuEtyOT9yrCOOG6N1taNeQeEcPA+QNjuAX1srN+U+zEAIhkvD8Zk70z36Vg445puYf+g2CMw==@lists.linux.dev
X-Gm-Message-State: AFuF++lAhZFR4BoSMQBVsXuZP/zjVZuMTd3s4GYLUxCemLq6tXqzyvqn
	ayQJ4k8Lz1CyO4DlQ+30SJHil5z6O3g8iYAMuv8qVgs6IiReNE98ILc/
X-Gm-Gg: AYBFou1lGF/5MmMQ3hdbDhMkWg3h+H9GG6gZQIYr2dMgvGMUnuK3bWmLambe4MJ316T
	W8tf2m0SvhzwZoOuOuIGb8aGWP9nsf5+N7qZeysdz7hJ+Ag/TI6oPy/8mS23i/jJVtvsshpzvOF
	ClqpDF5wIzX9Bff9c3uoluOwk5NvywAplGqthPCqTNMqm6a6q9IaT91NZmLqxRsKJk9f7WxeTHU
	YzhJbG6AYJpUBl9jcr3dVcGev3Jcdba69SJUaUzazXZ0CanzeeRDAHZbw6QFdiioJ3B9yPau4j6
	w61FJnrBkrkfqYs1tyuExuoLBrNvfXJPl3eqB18NcM0i4zUfHoU9SxcRa/Lp9k9os2Vp/6gEtJY
	l27Yv35ua3Evm4UyN+anTOey34CPk3Tk9OJF2ff/HLyuZX2B6Ueo7PzZnwLGVaToHAUNIfM8ByO
	AXjJp0GmXD4GubgIp3r+08lXC/IJEB+ABWlsGgCFkjeI3vCgDeki3IVw0jVZd9NOD3IlRROVxfv
	gAn76X9YmMFUx2A/wzHYP7AJa46D2UV/bskRxNx9KDo/ztV4yYa59SA+tRGzRN7KPdv9nxYTKrp
	QiWGMCI606d8ZE9HDb3FzfpvEIyoZRsvZqk7pA6PI1io+38+C7Zra/ozOIAz8Xypajo+f3lVTwT
	DII4zroEv6lTbUaarkQBftjd6s+mXDg==
X-Received: by 2002:a05:6870:d307:b0:47d:a38a:6218 with SMTP id 586e51a60fabf-47de9864d36mr7458245fac.25.1789272327784;
        Sat, 12 Sep 2026 21:05:27 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699647sm6011535fac.5.2026.09.12.21.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 21:05:27 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 12 Sep 2026 22:05:05 -0600
Subject: [PATCH v4 14/17] mtd: rawnand: sunxi: avoid duplicate chip setup
 before page commands
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-14-4a64bed94229@gmail.com>
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

The page helpers invoke exec_op(), which selects the chip and programs
its timing and spare-area registers. Remove the identical setup directly
before those helpers in the read callbacks and PIO write callbacks.

Keep explicit selection in the DMA write callback: it accesses controller
registers and prepares DMA before issuing the program-begin operation.
Do not cache controller state or change selection after a controller reset.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 5fba3c111a4b..84e1e04d0743 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1755,8 +1755,6 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 	int ret, i, cur_off = 0;
 	bool erased_chunk_found = false;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1805,8 +1803,6 @@ static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 {
 	int ret;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1835,8 +1831,6 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 	if (sunxi_nand->randomized_oob)
 		return sunxi_nfc_hw_ecc_read_page(nand, bufpoi, false, page);
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1877,8 +1871,6 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 	if (to_sunxi_nand(nand)->randomized_oob)
 		return sunxi_nfc_hw_ecc_read_page_dma(nand, buf, false, page);
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1902,8 +1894,6 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret = 0, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1947,8 +1937,6 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret = 0, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;

-- 
2.53.0

