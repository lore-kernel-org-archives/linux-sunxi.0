Received: from mail-oo2-f18.google.com (mail-oo2-f18.google.com [74.125.231.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31824A0F00
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Sep 2026 21:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789420211; cv=none; b=s8KZoXhsVQ5VlM8g/ul7cHId+sQcOsh2/BuKOCHvFQ901znkHL2jScIS+WekIwaruZCP1BYBmfThclyeg/OmYt9iO6VZayM7qYy3IEvcwJRsQUFisRWuTnYGCexCTLw6BsTk49N8coZMfwdanV+G6VWnseAtnx8cs38HDoI52Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789420211; c=relaxed/simple;
	bh=ovOsliEdUhvhRoeaXGSGPM3LycBRMZNPRXeHkTBG1HM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bMUyo9MQvpOM5RIggUdhK1pQ5pVWIXCbJeO61AOhPtS+/WsaBg+QBLkat0ByKyYjhcKAx9kAcN2f4o63uMnEXh7jrPymP3mcKfQRCdxLPQ+ObIOloDdXSeEwLAhhJizHcgHbRn22XxE3pTqa0z/llzs+BMFYrp/oZwNnZWClnd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d5WA6VqL; arc=none smtp.client-ip=74.125.231.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d5WA6VqL"
Received: by mail-oo2-f18.google.com with SMTP id 006d021491bc7-6b390bcab0cso1519699eaf.2
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Sep 2026 14:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789420205; x=1790025005; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b70jsSBwLMejAy7LligcsivCdZpJr/KiRJCHlaFZ8JI=;
        b=d5WA6VqL6D1qrRfsYFhFHB2f7KWItK60G2W2YEbz7Unm/kP7RtkPSnRSUpURL/xSnk
         Jg+EfCvjWAuci7grnUyUIPj8F8BY+YABVpkiw1as+p4oFlfKcB3VoSF5qVgvjJYNAPwl
         5btZ1svb4U4pO3Dt2nCV8lbZzkJdbGBPdutpXFcdPjvaA6vHErAH5O81lCsk4yPnMYpo
         HVFiAvX5w2FUvH04sWN4m2QxzLXRu6xg6t/0Z036KcNgPfaIibUWKkup2LQCFQ/7AUbs
         D402/jpz8Z9GED55j8+4m+yYiKZlKUdi/nygTMyQo1Z5VGXkJuFMxKrC+OP6qsR+mBtV
         2jag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789420205; x=1790025005;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b70jsSBwLMejAy7LligcsivCdZpJr/KiRJCHlaFZ8JI=;
        b=O8HAQ5FcgfCk5YXiqsH682Vs1TNl8CNu2mM5H26YFwLvDl3SRzCEWlNdzGBdOB43vz
         yRtfNEcdB9VNIpHEeUzdJRZkRk5z5UfMoNTk73LIOGyGBv/m+PP41jO0FDQHOGVUHCVW
         glXn90JoLd9jUxwTHFykK5Nr6zyzOG0PADuy7Q2/Tru6V1XjQuKbVakLFO8OwXDv6aP8
         qhE/+AkqCdMFQ5dVTaU3LWebY1RwPwBkXnidI1IwaBiF4ARsDNCc15G3vDxakIwCncqf
         JEu1GSVg/r3Xgqvr0xYgd1iVbbyu/nFBi3o/6l0PV3jiD5Iue76Q45m2Occcf9uBzemJ
         8Hmg==
X-Forwarded-Encrypted: i=1; AKwUvByiZiVw8dUaz0UUOKdlnnF/Qk1nunM50Y2TBb1CMPlEG6qQy1o61zmGfj8SDfKixoG7MGhVpj3FM9eYAQ==@lists.linux.dev
X-Gm-Message-State: AFuF++njNXy+ynCE7jsGYV2He60CXUicvts7L3qCfeBnYFIiWpOE/Wtu
	xw+aI1UOm3hQm/p2l9pOpk320+rgfUQlub4nmZKif4iM+ra9SEZ3VRuo
X-Gm-Gg: AYBFou3k/cYSkz1kmQoP9Hk5rihtxMgU2zJernU6Zj76NxePsaDHHghhRkztiiiRnr+
	aZVGOvyK33woBO29NjyuUZ2OeHHdiNUtLfiTcs3hMr2HC4GKU4NrxyjStGPjpscwHdSxHkXbhEV
	PY0uuR6Pyi9QCe/mZTbKLW0/BFUJkhW97UzY4wjz7lUoUN9GW2mnlgOWTnbkcq9bflF5GcXeu4V
	TPzfQPON+TiWVn4upKwazSGbFX+U4z/UqWRqkJvyabapx3muBJyollWRhUzPwHDlRXd/vWieUnj
	10N/xeyN66uAZjlB5dWjyOj2o1ohhgdqe3j30jSKDMIJwbXz/lErpxmqk8n9kCnijXCqK4udGqW
	uS4aIv/9TJmLSIcqpTHOZuB4W3pdn80jJw6BWJe9UajWCn1GZ1OBB33V7JwCwhemX8v/Rbi9GDZ
	aGeJwUq11EZGprOcCLgCcUQqSgFAecoG7JQb0eJ/q8ML4KZTy/OUxhr8xdPc0Vk0IVY6nKUvhAU
	MyW76IL6eiNl/EeFHHH++gIphX5skntYJnGPKn6O60zuGL2SG73a03CEkhMaDCGosvki+n2f3dr
	KGeMn8iMwVZ9HHoxErAXYKPan9k+ZCxFoJXZnO/fZnGErit3+dS1iZl1S7itZh/yx+3vt6A9P0M
	YShBOKvNoz3m4vtWeg19AuhDNe/HH
X-Received: by 2002:a05:6820:1626:b0:6b6:93d6:afcd with SMTP id 006d021491bc7-6c540b66d8bmr2665520eaf.26.1789420204843;
        Mon, 14 Sep 2026 14:10:04 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c45bfc3fe9sm4698544eaf.15.2026.09.14.14.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:10:04 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Sep 2026 15:09:53 -0600
Subject: [PATCH v6 07/18] mtd: rawnand: sunxi: avoid a second program
 confirm for OOB writes
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-7-2fb084fe0751@gmail.com>
References: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
In-Reply-To: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
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
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2

The hardware-ECC OOB writer delegates to the page writer, which already
issues PAGEPROG, waits for completion and checks the NAND status. The OOB
wrapper then calls nand_prog_page_end_op() again, sending an extra program
confirm without a corresponding program setup. An error on this redundant
operation is returned even though the page writer has already succeeded.

Return the page writer's result directly. This leaves both PIO and DMA
responsible for completing their own program operation and preserves their
error results, including for bad-block-marker writes.

Fixes: 25f815f66a14 ("mtd: nand: force drivers to explicitly send READ/PROG commands")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 72b79f893e29..41d6560d7df7 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1843,15 +1843,10 @@ static int sunxi_nfc_hw_ecc_write_oob(struct nand_chip *nand, int page)
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

