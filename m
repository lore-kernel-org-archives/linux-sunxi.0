Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C5D34A76F
	for <linux-sunxi@lists.linux.dev>; Thu, 15 Oct 2026 01:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028078; cv=none; b=mq/DjhLiuEFdnBy2yHgBlIpqyvfDd+SsBjjXyJmM70Pqg1bMB1nHLjDblKw+rt+r8mHdlBFI4z7GXV4T1+7rT7VEz86BvwEIrBL4mcF1L/dWdjBiF7Pskuoq53PtDBHvQzsnxGT9xx/x8NHDB4tOakbcdbj1m2X5tPEC64rDN4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028078; c=relaxed/simple;
	bh=0kxWl9QWVm1G3QyRQQoFBKdw9ex2r5DsXOknVXwQkMk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=duRazK35GRxNwCQbnU7hp9KPlIIouPPyeA9zUCYyRrNKjPqKph/3uz6t56urICVCVLwpBSBAmb/u8eWcw3ALVydD5ut7zp5rkFlJ8wxtoJs48vntGgUtGxiYpNsRUvfmcQ79Z7OXv0ceTUsmkBv/h5Wlr+CkNSwnxPBK23aerdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ovy4rBef; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ovy4rBef"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-483c607ccb4so623015fac.0
        for <linux-sunxi@lists.linux.dev>; Wed, 14 Oct 2026 18:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028076; x=1792632876; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oafE3Y1G60hqD5AuR17ZSRtdy2A1IL7jrwTpft1hiNc=;
        b=Ovy4rBefm/Errtqc8IcIIRsZdhmBoCoWfCqfgD/Bquf1GLASwT1SocNTiAPzenmHyZ
         n3+cx7ml/h5iWk828trWqEuIIBOTcNy+r8q42n9g1jLTcT8aF0BCIedMmUQqIMvW9TQQ
         a+aaV0xqOH0tcOkwBEiI675F0V/HdtEXQgBkUvHh2bOf7JkW0p/Wh6gIOC804HhZVAdW
         c+GMA9SkN5Lij8wrmQHOCmVJaycJg8s1GgnHk94rgmID7H97e2LzqxfzJrGzK6rW9PvR
         qMEIS3n5x7xK8K5EXp1DC/xE44rPrP052nhedmwnaNcGGxQRFzR9P8DR8vYLc38U4bst
         /O3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028076; x=1792632876;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oafE3Y1G60hqD5AuR17ZSRtdy2A1IL7jrwTpft1hiNc=;
        b=2wmFtgtdcZ+p05vp+W/jnqGygYGen8CKomEweBuCvDK8DpXfYp44/M3bz/D3tHIyWy
         F6f5igB6UXTYoHZjC+QoBqyKT2jTRA5ZEHatBtTC7Eo+RcV54Bs0oHSWispPqPY/iZjy
         kaaPNlKO/1vYpzFH5P0w3NILrGllfZJIMz+qvYBv2UELhFGE94Gh4KxkGTfKAgPtYGhv
         KiePP1W1B71KC9lI0WLpoIOd3brS0etVtA4X8OE7dEdJ9Q2eWzZLS8hXVWEQkcwnGf4y
         5apVTfokljy/TUgBbxEO0crZLcf3hElW5Z3KBUhPM1eD2NU4v+pG6vfX46+Q6ceFJSfy
         s61Q==
X-Forwarded-Encrypted: i=1; AKwUvBzi8z06gXDGbqrAZGhG7Ecnp49UNvXWJojxmo0yq/tBkp+I6dC+DAua+Uc1EJkI8k94oFJpdp889h06fw==@lists.linux.dev
X-Gm-Message-State: AFq9FYLadQsGNt4eSJZRSs+L2/SxAv4m3V5nekzDKcnFmL7u+bDrNxI4
	uAYel57pk4T9gCX4xaBVuj1EQ6klij0QqWP8DrWSsltDMcAhcfm0R4en
X-Gm-Gg: AYBFou3PMT1zOvLsVfw+OBZtjk23/S+e/vBz6TaiucCSLGUoxA/fGVDrnP4prDXW9F7
	s5rqZoLk7bcvU6NhJqHNYbHcZajnUqQJTDRoooHwYPwlfZQJ2nRy1+uTenraO3ELjvdfPEbJcJb
	UR3czjAJ+gS5cV+mQJpfPFFGJtu7rfo9V002VCnYRQOY4a+nyeTeZDdtp8d3WMcv8FJobgPofPy
	S0y3VRBl6drONdqFrlUo1a5qmcjiHyYWMQF0k2TN00eFBB6Bp3lSnMu95+cbUeWNPRFyXMgDm70
	u0VX6DVce845kiG+/7QBfCQYf27b0Dxg+Itqr5fIHRombc6Sy2a7yYSrRDWY3QCwuJgHOZx9P78
	Q6oA9t7C0x0ILKsWRi9da1sUEX0WXO3rTqevz3VU0LXylv9xDtwbj1IvGEi3bDOTziBjY+iVL5z
	92qTcm9QUOVEF1HwN5XLO1/5gW8AJDTwyTLMrpmcxRZQ7HAjl7HFgTFZP656nz8EWpCfeYHYF7r
	0FUVIr4soUPHY+oEFbkna3HiHoaa5K0fG+IJuvLTSasDtt+HT8unSkFpQNOsFeEyOgOwn62wA17
	VTjRu2jJNTbRx64PBjfK9AwqDQa1S3xjtC3wksyiqnM+4jijLE8220gpUvjY081hYfRMD30Yk5v
	sIIj+IBuUqyKteAiSZnnO
X-Received: by 2002:a05:6871:722:b0:48f:e0f6:bd5f with SMTP id 586e51a60fabf-4a2a8b0964amr15694991fac.48.1792028075784;
        Wed, 14 Oct 2026 18:34:35 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a6dfb41452sm3428139fac.4.2026.10.14.18.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:34:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 14 Oct 2026 19:34:00 -0600
Subject: [PATCH v7 13/16] mtd: rawnand: sunxi: avoid duplicate chip setup
 before page commands
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-13-5d3fc6ad2da1@gmail.com>
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

sunxi_nfc_select_chip() programs chip selection, timing and the
spare-area base. The page-read callbacks and PIO page/subpage writers
call it directly, then immediately call nand_read_page_op() or
nand_prog_page_begin_op(). Those helpers dispatch through
sunxi_nfc_exec_op(), which performs the same selection before executing
the command. No controller access between the two selections needs the
first one.

Remove the duplicate calls from those callbacks. Keep selection in the
DMA writer: it accesses registers and prepares DMA before program-begin,
so it cannot rely on the later exec_op() call. This removes redundant
setup only; selection still runs for each executed operation, with no
new cached state to invalidate after resets or chip switches.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 74fdca27ba10..4e6fcf1e7aaf 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1642,8 +1642,6 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 	};
 	int ret, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1669,8 +1667,6 @@ static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 {
 	int ret;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1696,8 +1692,6 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 	};
 	int ret, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1726,8 +1720,6 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 	int nchunks = DIV_ROUND_UP(data_offs + readlen, nand->ecc.size);
 	int ret;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1751,8 +1743,6 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret = 0, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1796,8 +1786,6 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret = 0, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;

-- 
2.53.0

