Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904953;
	b=mgVplFFpFZ1JaUkl4j9J65/CTxkw1nsgRUT3PFrLtl/BbkEZx/YHqIF1PGCr/5pQQBw0
	 K1JUk91scCDGAU/pp11nVcPLNB6syy9HWmq+KQ19Ou1uA1BJzQP3llgKmEOGV0DKcuDgl
	 Obb6Fv7GSMHDZMOO0dUoqxEebu+mvFUTBASWnCgH5IaT0FJNAF9zHrafEXR8lkPFH3bHh
	 58Y0R/8cwwtzAmNCnHhz4hkmQJRYvz6HlblkVJwZxb3z25FmXykBNhmVGNAeJ75N34vQ/
	 37Q3WYHlH8heUO3ID6tLv9K3uEfF/IAtr/d4Qj2XfYysBgUXe4ZU5QjMc4PLnhnpI0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904953;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=9vgROzYjn2zK6ttGrhZKySS2hmoJVCYg6HGqDUPiUOs=;
	b=e7VCUb6YR3eQx6u/ecSlql2t9cv/H88epA6zsWGkLqai0GBg5SUqvs4jAOzlXYf/z9Tj
	 7b0G1blvD6m67xZwTajgnm6miVGJxybInYH9X9B17biCfGZ0/BA+JNVDmauXm64egi3gC
	 Ea+QR9ElQcAdvLU1BJKaDBmuBCI6KRZ3wo1Kudd5TWpK9mC3lLKXU97qY6HF5LGyuGL4E
	 S8+PiwipSssVD7KqiT+AcmVsLXHNx33pfgb/JB6573hHYssglUcIOCK9TUD4Cq3IBRwzA
	 PhWtm/mCJuRxka/yxS+MywCFICM2/8NqK4FA08yzBKVL4cvTK2gkdDRKooyKEAm2GHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PgAYxEsY;
	arc=none smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06681606EEB2
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Nov 2026 18:55:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06681606EEB2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PgAYxEsY
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-702dedeb70dso1295935eaf.1
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Nov 2026 10:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904952; x=1794509752; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9vgROzYjn2zK6ttGrhZKySS2hmoJVCYg6HGqDUPiUOs=;
        b=PgAYxEsY5Bct9+wGOMlt0Pvut5S4ufy/lPmP9te5amLdODBz0PzB6Jy9A04ARnvr2p
         Tq/TelkJgWWL0XFGxhRznJkXis/NVUbDE60XrVKCsQ6cNueFCHP1YuBXs4yyxMztRULT
         sJlp+sjZ1HRAGWkjZfNoevNOKXGdBnnGTfXmlYqnsx/p50Y24NNpCT1A5UoK5KTh7zIz
         GUQJmOEh0wB6Nk2QGQcE8VBI29DrCBalMwr0l0BzvpD4zBmxNXAKeWP3sVUfGyeFZSeq
         eumzZJEgsg1WlifNgDC/q0dl22CIeuKXIKQwpjpmpVv7F4aKH8xXqUDtHBNveF/pVOV4
         WktA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904952; x=1794509752;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9vgROzYjn2zK6ttGrhZKySS2hmoJVCYg6HGqDUPiUOs=;
        b=nsbMTl06UQno92rDEQnIMDKVn8XlPyV2gPo/z13pzRjJ1407RFb+/yXTikON/cVJ8B
         12AkPehOqzmp99pC/ip+45em3WMcEdZOt8AzSpKQC/yu7+3KU3akxcT+YUlHWTxYE4yp
         3eSZZ+VDrmr/Sqy8hfViBPvf9J1zbY1xRh4kW1vUOs0XIaf8443PNUAS4uekPLER2Pz0
         7q9tbUIBzIOUaDFLjqLu+Odb6uv+yaj5cGyPxW/qoZi4VMuHpjqqBjUuEX/BI6RJwf/G
         e0hfEoEqqT2ZomxtQdKNqMKmpsRT3oVc52fHNPU5msVIckeBggVhT3RsLRp+u6JQqqBy
         ri/A==
X-Forwarded-Encrypted: i=1; AKwUvBws3j3gyidW3kwspMpSBFP8SDZoa/TJ6ULiuL/k4cgIzWjMBRDtCTOuKmeP1RF1XqF4iVLqur6olLwfPQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z8cYfaA94XC1r44bjeLlPvu//TbpVWnLkx6kx0MfMG1XM+qGsKA
	BY16o/d1+EEZLc5Qullo4r/0iSt+8Irl3OxW2VUpxOIxAOXiohrAxFUj
X-Gm-Gg: AYBFou00Phppbbw/ZdD5jnqKzYwDetNmPIdFfjVc+PD0fC5Z+sauG0gZ0ooKKDKU6Iw
	f5Ahqv4Mq9IjvUaNNFwFHg4ULcn6VqgQhPvrm98qtvaM50eded8oWrxnJyVk7Fjn+sgN1nzw+AV
	b/aFsiaACDBw8jbk4lCd8CMHu3/RCofR+tmBhnwK2jLp7ZfAsS+2SSSyz8ZyGCZacwPI2J1nBNu
	XZaCcqBKKCvXE0UhivSivfzAeFpGeCXnfbf/QBItpJZdV+3avPqIpVvb5eyK32twFMQjySlpsF4
	dX8i/NUCuQTY2SgeMqTopurlLEhI6zbEAFJrGY5GnSSPwvPKz6onM7ZL3vqtem3n09OkhdmlcMS
	uJlA3CSwTVA/Ujb9AyKBtmhNCId6j1gpq8sKA7TH9bz73H6CVY36QM6j9jEHvUbtoCmVXJmCsDU
	hlrSyORiX8ESGMV9KR2X8RCOe/Zows6uuxVLpAnm0rvJ67luABqoS98uAoU58iTsTcM6ZLlPVOA
	rpzKkQ3FjLLSsVNq4V0NulzABi6J6mUr07iiOsiZKU0Ct6IaJZpXuii9spD+OnI4aiEaB0GrPs9
	ATBlTt0uxZLk1kNX5gUBuqjxkH1YP72D/puH9sUS0W1OdbT8t6TQU4Q/HqvdzekTIVIhzLFSIw0
	+O6tTX6yLHkPyemzvl6IMCgDrV3EqOSWxoOW5zx1FtYtoqFoPUs1e/aRrwSDx/s8oN23ZC29BAO
	DIffiom4BJ3QYL9Lb6gMDhOsdXEBqRP7cizxsvY7/qQLFBQuhLSYzulQ==
X-Received: by 2002:a05:6820:c30b:b0:716:deda:97a4 with SMTP id 006d021491bc7-716e790f945mr252144eaf.48.1793904951958;
        Thu, 05 Nov 2026 10:55:51 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:55:51 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:28 -0700
Subject: [PATCH v10 12/26] mtd: rawnand: sunxi: avoid a second program
 confirm for OOB writes
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
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-12-dca1f6ed29a8@gmail.com>
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

The hardware-ECC OOB writer fills the main-data buffer with 0xff and
calls the selected page writer to program it together with the requested
OOB. Both the PIO and DMA page writers already finish with
nand_prog_page_end_op(), which sends PAGEPROG, waits and checks NAND
status. The OOB wrapper then calls that helper again, sending a second
program confirm without another setup or data transfer. A failure of
that extra command is returned even though the actual write has already
succeeded.

Return the page writer's result directly. It remains responsible for the
single program confirm and status check, including on the
bad-block-marker write path. Raw OOB writes use separate callbacks and
are unchanged.

Fixes: 25f815f66a14 ("mtd: nand: force drivers to explicitly send READ/PROG commands")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index f003da59cbe7..5f57c5998f03 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1841,15 +1841,10 @@ static int sunxi_nfc_hw_ecc_write_oob(struct nand_chip *nand, int page)
 {
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	u8 *buf = nand_get_data_buf(nand);
-	int ret;
 
 	memset(buf, 0xff, mtd->writesize);
-	ret = nand->ecc.write_page(nand, buf, 1, page);
-	if (ret)
-		return ret;
 
-	/* Send command to program the OOB data */
-	return nand_prog_page_end_op(nand);
+	return nand->ecc.write_page(nand, buf, 1, page);
 }
 
 static const struct sunxi_nfc_timings sun4i_a10_nfc_timings = {

-- 
2.53.0

