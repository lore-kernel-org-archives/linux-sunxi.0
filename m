Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430B33BCD26
	for <linux-sunxi@lists.linux.dev>; Fri, 16 Oct 2026 03:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792122355; cv=none; b=fm2dZxHJIFQYCbFMvveatBxADqT/GIyDvdpPcQXzKJ52x7MOY45yXeNv9y2SpYqqDXuWjxIKb5N0vMLadgSbvcgBYKSp9sTRYbB5EB3oJAmMp1ENh4VV9bobvn2kQMYj8Rd2hoocbP+8kNeymrLxtYzTMLtIKjf1IezhoDY5n78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792122355; c=relaxed/simple;
	bh=yG1at5m5QJbhW+ecohWXOpUrfbsO1PE/mD8DPJcdLP0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bo3rNGc2YNh+nkLjJElheqR3RuiYM98RbxNkkZtjKUk+0d+MSCwOBQOh4FL2Uyp8pldDAcz+TfXnZWdpx2xHNRuLwESbicT5CPvY0Pm6nLsFkByq1FmKaem0MdSKCDL5dyELilLjgFxCSrDbR/GEDOCBvOTjL/jCFP1Ll6BpKLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jmygGpa9; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jmygGpa9"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-8198a3a54d7so687037a34.1
        for <linux-sunxi@lists.linux.dev>; Thu, 15 Oct 2026 20:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792122352; x=1792727152; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VzQcb2tw5a4i/pk86YXUJlRkyNKtc4irBMv9ftSpeS8=;
        b=jmygGpa9ZSkRkiiMg+XpiPbFtT5Ota/rQHbh9tcsKz9/1846kdjGm2vzxaUglQ3qbz
         VRxg6sKo/oas3O9ckZZSIRNY8Ffo+poydTYt/9gRqyDgZ5HknS8CwpWlBjSKY2cZlUa1
         W6x072UvOddfwfwCgLz79NO4Rm93bIOtSmm8wW2egFWbt+Gy7Ll7RWPYjWWnmnVJD0x9
         jXzUsJl7v2Z2IrR3CltHHtbUasRKHteLpgM3W49EtjCTs5E/1w58kWreWbdWwriblRKc
         hEgdCJChbC1rNzWAbbKZikdSzOfrbmp0J3GvCmAC9zvSrGUNDAvXK0FkmYESOHUGiQnF
         ui/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792122352; x=1792727152;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VzQcb2tw5a4i/pk86YXUJlRkyNKtc4irBMv9ftSpeS8=;
        b=lhhCh/2aDvCehwBoQEuqqGd0/uHWBvOTjTaaUigsus0XaENcrRQr3pdpUqRn1ZQDmT
         Rmqzlxxd240F4MPiV5LOOJW4/UZ4RFL9JDav4XZMtvazXkj7rNDuqSPctvRxYDbycju9
         dlUuxWABPJo/9jlK2ai6vMfqCLZVxWmIeQSDM8H/dewcA5ZI+Nqgm1oN11TMSWTxDpuN
         OeiisO3xpLVXXfNSu4IpvB/Xw5Pxy4lAY85Lo36TEoMIQSJchEt1ILx69tVnmlXk7WkN
         Jd6+ISWm7r45SD9p4HgH4QiFrll205UwBXA8VF1lI0NkNqOJij8sriImlP8FJhVNFKW+
         +70w==
X-Forwarded-Encrypted: i=1; AKwUvBx/IwaQE66rdJIPWI5dj/tzEL1SQlvbCu7W4oWDwhpzGga7L5JFDbd73QEu3GYtqgC08Qssn9DIX0zKZQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYK4fQx2iVSAn2hG60aWi3E21gUfFLXu9Sg+WszUwV/Y1M7nedGX
	EuPEDJ1RhoLETRqiqmGv+ZeII3frB4r/ty8uV6yk40ycXoALsdvYVdks
X-Gm-Gg: AYBFou0wqXkC27Am9NZ9E9vEVva7iJ+mqhKpdl7Wp0/sPl9uG0J985QrtmbxCbzlJXW
	xlVwic+Nrn1w4dq73QCEDFDP0WBm9jUsudWo4X7zzEGY6a3jz1EUOzxAU1jQu73eacxNOi/YExr
	ZDsBtNhRpXTfyMMuE/UvcVnB+tKxCpItL/X2yMtt+hToL2hZM5B/M1mJ3t5W9Yxsm6RX1zd1wXv
	8dBwiRdProS+LYbjk1oYpOqijWBf8ifEDZoGNiLbyBjeH+Uut2f3xbx1xUVcSMvEFMpcpNAzPZ2
	+ZblUbaPrQHPPgi2DvwT/PnN8ibtGGSzXPgEBl8vAORSq0+HS95JMMR5BfvOrw7By9t1lLvt/yP
	pxuo4CMckTi1PzK5RqD46pBYOfBYmiSE7zBwTpeDunS6kjiJLL/1FaaXuAyBvw8moGUT15eyeXQ
	4p5Ajq4ENVXdib8F/uyaWGXb9arvYfDJA0rJxC1C9T0B8Jclteq5IieBxAifnzzyMVpfFSauUhT
	FZxwKsVfCqd0ziOHaud/TVgwBmo+jTKEOaLDoez0BgpIvS3phbmgiOdQlDNexonVmW3WgbE8G3Y
	13CSYpJWDbioX3i2Z+QsDXfvKjAfSiSzjZHhUJnqFm0Bg8ZF/Qzyjs4IH0/d/AhIzVr00fVcIyq
	OpFJbo30ofmOh2pgpmy4tDA==
X-Received: by 2002:a9d:6241:0:b0:843:39a0:7a8e with SMTP id 46e09a7af769-84339a08521mr158641a34.21.1792122352163;
        Thu, 15 Oct 2026 20:45:52 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8429b57870fsm834402a34.0.2026.10.15.20.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:45:51 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 15 Oct 2026 21:45:29 -0600
Subject: [PATCH v8 14/17] mtd: rawnand: sunxi: avoid duplicate chip setup
 before page commands
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-14-8ba4881fbee8@gmail.com>
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
index dfb2a64c6b50..2a9fe89b1ba5 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1650,8 +1650,6 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 	};
 	int ret, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1677,8 +1675,6 @@ static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 {
 	int ret;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1704,8 +1700,6 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 	};
 	int ret, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1734,8 +1728,6 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 	int nchunks = DIV_ROUND_UP(data_offs + readlen, nand->ecc.size);
 	int ret;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1759,8 +1751,6 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret = 0, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1804,8 +1794,6 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret = 0, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;

-- 
2.53.0

