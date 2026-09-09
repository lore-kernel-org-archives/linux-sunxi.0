Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A495F48E0DD
	for <linux-sunxi@lists.linux.dev>; Wed,  9 Sep 2026 08:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942676; cv=none; b=Lhrhz6t+RuQnX4PmPYKEWsUKbCGySGS20LvpW8DnVP7pTvdLxZb2ZZLuP6mHwDBx1ETGl85x+RK3KrJIUJjs2ri1PVCsWNJH3xIvkmfK+S5CQMiWF/pjGq4RBEiQxG36jvb//M15+n+LWuN3XfIIL1NkpNymsPvrcQVbgNlDdaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942676; c=relaxed/simple;
	bh=lMdcdhYtYCAbzv2Kq+ncTMrjUm4c2U4X65RY3mT9uRw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HFrHFpmJW7x8WH6DHi3ANkf3RyRachDwa8fi4u77icibtpWTLX49TaifZTq578f5xT6n/JXhZxOnfxQBoq5YKZ8T2YD7nrd53Br/Cq78lenSZk8pFGDsh1QqAS7jhEWt+2aY6+gu73/+XnOYzLqShUeI1gajp8zkvrP/SvA7Yv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R0sgUgkA; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R0sgUgkA"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7f4e729368fso4774678a34.0
        for <linux-sunxi@lists.linux.dev>; Wed, 09 Sep 2026 01:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942672; x=1789547472; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BAB7sP/kuv2a2+DjQqOPqA2dsbZemJ16Q3uUsVl6HgY=;
        b=R0sgUgkAZbrSq5yG9Snkq1MjYjwdqZOhSNqM6kgqiu/DuJfrDtxmi0N9hfpN4O+0c2
         bpUew3AhKDHX4Gz//OnpcbHtgUsqQ2LEs1Bc2rPUF9AZX6IQPxu+oq8/caur17HrxKSP
         iB7E8CiRZjjXcvNFXv7kizy8toCckZQCVezURJEg1ILacJ8BMq9g3Lx+5a7uhecuRYDh
         5pb4xksfXHRkXIhgB906NFYNWEhnAXh/2r5VQKL/4NGCtYsIL0HVSv3efzH5/T1T4iYD
         GjY9n7UvQ7U8UACWs+bxCqAyijCqLxWETKGW9x9r7tibWo7lMz0mwVuZ5xy3jO8Cr8+q
         euHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942672; x=1789547472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BAB7sP/kuv2a2+DjQqOPqA2dsbZemJ16Q3uUsVl6HgY=;
        b=RD4YNOIzpDTDGlZpZWcXh2s8neR1Sd8MXCxntCWV6IKT6sWSTrcXvdCtmi9/VIA2jG
         ivZK/2xBmnvIFokoTLp91ETHh/eLcyHDszuubJwHOnj+GL/XSt074wbwqp8UxR89P2D5
         xd+ujDfOyAr2yakALqtMlX7gvfnWPoKI3Ps9rnjn8J/ub/aGdSsQEVQypC+Oc+4HRFE8
         fUIHO+OIhK1UMEkSo34i9vHeQgn7I0yEI8Nxhp2G7jORMhdgs5X0azEBvchkYwab66Uj
         q08SzQRK7yMpB89g5eZKz7E3WRsXZ1R9bCdQmeaCGLkTylKL4qwRVNKTfiQKvdylRs8i
         l4fg==
X-Forwarded-Encrypted: i=1; AKwUvBzf/0sQ4JzM7lxrveNqcLCZHfy8xdSWsSo0cSG2/2+9FoSUaLGIePTKZUHT7G8i6XHNsRnfX41RNAGIDA==@lists.linux.dev
X-Gm-Message-State: AFuF++nzorPMkfSt0jcWyciulcuyqyBpE6+HS9jMrCEDjZGGjdo2Exl4
	pgUxdRSMJku9P9EV+bmqdcHD1kuTa+8ftHPM01quECJYm1nOiY1MTyUu
X-Gm-Gg: AYBFou1WYQMVMl4IuGeNz9MbgmdiXAHOULPAthdVpr1EVDALCm9bxoR5RKjwhkFPU6m
	17oxjJymTGoYovmbs0B/HMZv2EfuB2oOvwEl+ibk3t5v6EIwDU/TToKx+DX+q8zQDVkB9xCJ93r
	Q2lg/YElsVkqQABOQPfIfX4kI8jbAIwSKGyT+6DLSIY8f0I1nI5wWDDNexpln4v5H8oBu6fyjyo
	mSGpi7XZHgLegdgfWZgCibc0+1nEhu5OUzhhM5jz5u107BVyaIXn21y/02trqMToZh5X78dZ3CW
	lbXz8EDjh6alwOgX48VZ/kPMuzVcaHv+LgpLacLvgct4YXJ24oL9Sc56dBcnytR3RvXL4ocEokt
	GAyR5Ql3Pvcfxn/fuNbx4X2mvDs1eUDlmEfm83ON7Ud1VWu77uGAJAMKpXU/JSD/rtpw2AShsT1
	Z/6OWCNN9F9Mt9QGsB5xahj6DzGxsIoeH07PxE1aPgpD6H818zzcfkmHeJKt3Mszc4yxPytld9g
	s4nH4Si1zrDqRMtKxTk6DVr/LNGRxu4q/Z39N2nsHgE0To2Sm7XAOyQMUEH8++wDpMBUhgWhXWh
	ryVhAftmyten8+rNf+glmPuRw+WJImBAA1ajVAL9P+lNtmGhxbtNGUew7ZKWojQGwCwLaV2F3FJ
	+rVi2+XjVMymOTGLA2XfRvIHCymC+1w==
X-Received: by 2002:a05:6820:f00e:b0:6b8:ef7d:e17e with SMTP id 006d021491bc7-6b8ef7de370mr14081411eaf.51.1788942671900;
        Wed, 09 Sep 2026 01:31:11 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6a0sm19031004eaf.5.2026.09.09.01.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:31:11 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 09 Sep 2026 02:30:46 -0600
Subject: [PATCH v3 13/15] mtd: rawnand: sunxi: avoid duplicate chip setup
 before page commands
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-13-838cb0ba1547@gmail.com>
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
index bbfed22640c8..9dc742ee4344 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1743,8 +1743,6 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 	int ret, i, cur_off = 0;
 	bool erased_chunk_found = false;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1793,8 +1791,6 @@ static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 {
 	int ret;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1823,8 +1819,6 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 	if (sunxi_nand->randomized_oob)
 		return sunxi_nfc_hw_ecc_read_page(nand, bufpoi, false, page);
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1865,8 +1859,6 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 	if (to_sunxi_nand(nand)->randomized_oob)
 		return sunxi_nfc_hw_ecc_read_page_dma(nand, buf, false, page);
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1890,8 +1882,6 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret = 0, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1935,8 +1925,6 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret = 0, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;

-- 
2.53.0

