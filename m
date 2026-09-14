Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B3F36212D
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Sep 2026 03:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789354924; cv=none; b=fKPLVOLX0Ru3RHEsxCeU1EfbQhkHPk/+8rW4l5oUr04Xnz6y0FRYiapHAIaX5zsrNMU5ui2B8oPpdv7V+x2LNG591aBgeuwN7oZUNUh1lodQ+2/h5Knen9qhdCH/iAF97FG5zLeA780h4SNBrE1RdFhQWKDagBDVika1S/wZPmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789354924; c=relaxed/simple;
	bh=NZw8JcFCedJgacAoPkTIc+LEMQt5mQHzie6HVHZKZUM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jYVGuuu/sCfGVEsVHOj3OCugcNtBov+iGbH7GICGCjUnqnFh/Car1uEK6L5Kqp3Pa3j5sS4vGONWJV57JQMqB0jey6cdZ88zkvA0frIoqJRu21uqcNFvqOqyZARVU29Q1tc89+sHt5S1kFF14E7en889W4JFyX1zoDRtqcomBPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J3YdMKQ4; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J3YdMKQ4"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7fccba9c675so2923032a34.0
        for <linux-sunxi@lists.linux.dev>; Sun, 13 Sep 2026 20:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789354922; x=1789959722; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OyRFeG3dg/KDzFyQJutH2zdFtVEXygh+smPcYHYkDoA=;
        b=J3YdMKQ4Qca6/mtmf0M8InNdOdtpKmXSmfxaAH2pJOxdD9+ZVjfZWa7TDVJLStgQSq
         T5LXgSyyypugvrn6l/iB/TIlvsi9U5PoN8GIm00FIfjJsSxvkT5b/08pARh1CCT2SpOJ
         C+FlJG4JtCK2QJNEZo94HCi7oyoFR5qruXVACsce/cFmZw1ZavZfrd5UJFwfBeAEZ4gI
         xn5xDjMwKlkM9RIxtOP8xvyaL/UW7xGA7CjGlj1URPLO4+YtLAyBdeDA+n281iW7QKMQ
         Eydt0beR1PtOwYnYW612/37nBkMkxuU1acAFzK3J7otkO6umHhqztSnCE7t8skgXvIoi
         UwlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354922; x=1789959722;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OyRFeG3dg/KDzFyQJutH2zdFtVEXygh+smPcYHYkDoA=;
        b=oM8+1aK6FfCUlmz16QdhpLefWm9/dHt3cFXvpcboxllRQYVv29AAnJmZe+kc+o3Ecq
         rZSeI0f0vDKiecX+4LibG0nujlEhMRXqEGbgtjVJCsoCD0vHdIS+kcnxDv9xQEijxNpG
         i/O7tCugCnjczlq6yTZi8n6wW20JDSDQM9U7fZ3wWlvaXAr6sPwnqxbJgzNd/pmthTfc
         Xkr6L3mvecerZKd3P3zjZ76N8BNRt80OLhKlXPsK7K3YFzyyH40Q4ha+MQi5IPkza8RB
         TlWFykzbX3FSFQ+QEGF1YiMUuyQXmlFM2cif8Wa14MUFlFsp77TEPtC05lCjyeuyMcRc
         V1/g==
X-Forwarded-Encrypted: i=1; AKwUvByz5MPIL7FwD5D5JJanUyd5oCkhDx+21OttOL3gmmDlvkQax1YwBBUc8F1NWHEBsmI4B257bpjG/nZP2w==@lists.linux.dev
X-Gm-Message-State: AFuF++nygJ/bkb33rtgl7zRkpMIFaqTdLHaDCBpkORBYfXz2GKOlW549
	A+0xbn85APGUFaa5gsMLzZcUTApnxoXCI8YlHwQS9xOdAQp6H3BM9UzO
X-Gm-Gg: AYBFou3hODKuK0rCPbRMAnKFSQKFsgSIv3GP5o4iBkMF2vc1H/jyVORzgGTucA/AuPY
	9g7OSBiJEToZ+G+4h+Ki2T8ljEgKzX4n7lxlu03oaH2BvkKrv361V4sENKUi5hJ1lXecpswHMp6
	hz2fmMDRYzCt4RNu95YS+y7IYWZVhthm7QXgOmaOi1YlHe/Ue8C8zgtE6ISsLOTf1GhJmrSmrHp
	ER1d42RFbnj66adIEa/oQwwmVkNyjcnT+si7LK67jEwzUuYGBUeQ1kO/sRZrS+1dK4eWPESdD/y
	MwgQK7hF8B/y8FedF2WSXL/ANfpUBjk8ZqSrGXAQvHi+mFslfHIBMYjWeKA+15Hw1FBD9sAGDTK
	tUSniDNZ+2kNqoTEW02SgUkEWLYAKEGPvQ/PedReHduD9vBTjS36LM6zr+2784FBV7/R2qSSWMo
	Zina31WStCRZVU+7krphWwSRRUV3W2NSmD04WHojHP6IPlIED2JsDPFIQDXk9/Mlr9ZgLnLjhPB
	88SUUD3uIOkCT5uQBgnx+Lp2p9gM3dL//7dtkHBIa2xJch3koBPCzciRhkoFULuC+0C/1Vy6eNT
	IeOj6yDzMUk0Q6RWkmnbvRww0UKhx1v8IKbvhS8nUQGqMh5rWXu0pBNdLBIufMFZmUZJnsslTef
	vQx2gTaR/P0mvI5zYo0n6MvlZmJCSgQ==
X-Received: by 2002:a05:6830:6d2a:b0:7de:9b99:a8ee with SMTP id 46e09a7af769-80719632b97mr1941438a34.9.1789354922030;
        Sun, 13 Sep 2026 20:02:02 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60feba1sm10619014a34.13.2026.09.13.20.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:02:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Sep 2026 21:01:22 -0600
Subject: [PATCH v5 16/18] mtd: rawnand: sunxi: avoid duplicate chip setup
 before page commands
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-16-7d711076a6f7@gmail.com>
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
index b7ac8d7b0301..4103337f6a07 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1794,8 +1794,6 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 	int ret, i, cur_off = 0;
 	bool erased_chunk_found = false;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1844,8 +1842,6 @@ static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 {
 	int ret;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1874,8 +1870,6 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 	if (sunxi_nand->randomized_oob)
 		return sunxi_nfc_hw_ecc_read_page(nand, bufpoi, false, page);
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1916,8 +1910,6 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 	if (to_sunxi_nand(nand)->randomized_oob)
 		return sunxi_nfc_hw_ecc_read_page_dma(nand, buf, false, page);
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1941,8 +1933,6 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret = 0, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1986,8 +1976,6 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret = 0, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;

-- 
2.53.0

