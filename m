Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795223485;
	b=BhT0JYATItIJy8i7x0F+k8u72zu2JLr97a9U6wl9pAVCMO+R7E/xAX9xGtlWrfeCGzN9
	 XsH90ZLWRCfmDJUIICLgONj3i1DvsuI2VmUUZQ9VBMF0c3G9G7SGTFlUWwJAuWk5rjfx4
	 lDlWanhHb9+S7c0u3F61EVbNX8+mRSaj82wLNNtgQUSzBKRpg+wNTCIt9wpa0OCa9OTXr
	 F0gVASORBaqe+3LtwmEXaClmykFQpOrjj6vRak7lQBw2EKJQmnYNDSs8Ya9KBz2rzC+KB
	 ZRnwn1zyQIrpiZ8ca265RSipVFWEe5/RfivEJ3CaXu7H0MCswIfJIQFUHlvnLPfFRaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223485;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=CgxsAtXFuwPIOpoqITa/yCw7bucmWGSvP7CHXYFl5l4=;
	b=EbiB3aPOTOdHebIu/3ij4hjYh3VALLHI0KNMIiUbIO/ql7I63xb5G11kB7i49gQ7Jg3n
	 lY6PfI+aPcgtyfMl3qe4YSwSCIG8/vKm69bvNZUnfZalcEw9x842YO8mYyIscd7Q7efhX
	 pVaO6RgqH4YOx0/FXM30H6+ROu29gxeGdyGkA1CHexwKAZC5uNy2hK9+MIlUPnNoC1B2q
	 9Io2jZWU3FO9lMLaQ2wb4xoWpMygscB5tKIa4yBUchx1fap74xMb9JsCEfnHIyUmQcbYw
	 9j50/hoDcWFEGZO7irLRvyOEE8nnKnQk8si1j6JlJPV/3FMDkmTbuiDq6hM9Rpak88Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TH3CWbiC;
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02BD60A3834
	for <linux-sunxi@lists.linux.dev>; Sat, 21 Nov 2026 01:11:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A02BD60A3834
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TH3CWbiC
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-833e671ee9fso1455054a34.0
        for <linux-sunxi@lists.linux.dev>; Fri, 20 Nov 2026 17:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223475; x=1795828275; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CgxsAtXFuwPIOpoqITa/yCw7bucmWGSvP7CHXYFl5l4=;
        b=TH3CWbiCrMbCZNyUW0OMS3B+p1NMxJvpNBa2USUEN7+V6soCc4bDk1CnydoeGUgVn4
         +6GgS0z9AZAtgLN+Og4qcFyvlZrfnj6EQEt18V14L3x7eDjxu8QGP2g7PZQ5KVJTv/6D
         Q/wYwf1O3x4WyzjUfUr7R6BFjWOXfMM8XKs/RMYA41XzXCOoIegkWJRhm68edXs8sT/3
         KZb6cKLol4bcaYU1Eyrb+BsR8halSUHLhgXnV3be8Rs79tchpRRA/Kfs0hWFHYa87C4M
         m9MEN+FVd+sQlTx49E33sYfHYreSsgdWz6Os7b35FOX4vfnkH5RQlIVhWk2qQn83+C3y
         BB4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223475; x=1795828275;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CgxsAtXFuwPIOpoqITa/yCw7bucmWGSvP7CHXYFl5l4=;
        b=uw+ei17KMNPWSGrsjZQwCG2+vnQO6pprCUvkx0YEct8Uwbxao69j8PR7g4uXfGzMf6
         6whg9kYwsdSFKN/l+J6pzcTri9iyvaFAM6POy7FEh6GlQZWBuv8kjlrNwnOxctpNwpLb
         hrzTtvsTTva9hL5+OLnVfnOVHgjyW+YibDvssscLoD42G4988QW8I6/roYDAdVu+3wJm
         4GJdKYTcLK2fDTUucJbCZ7uT7Hhj8cTkpJrCnvfz3Y2kQ2Njpol/HIU7Vg8Krg7E3+7t
         yyRt+Y9EB3XP043bINZngJsGNTZIaJ7gkNsFATIPttOfM6D1/tlSzbn5uYucvkIxTBoW
         6Rig==
X-Forwarded-Encrypted: i=1; AL+hErGiXjtrR/j0CAlE4FE+7Hh519x9q7rGNxG5NE8lHW5UHX/ImcpZu6LpsdMVO8od6livQa5iKn0y+d5/EQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z8SQ/JdtVkaWfiitKCQICyzIMFvVNKjht7ChDqE6cDiVDAgXPgH
	/yfHRqA34S3/6Gslh7QWhXrQIZcfjZrTA+2Cd+2C7yukbeV6ZOweKwz8
X-Gm-Gg: AYBFou3KI5emryNS8VPcSuKfrW6dqB5F3ZMu3skS8XOqLHCeC2EnjKidLeMgDQ7hQOq
	omode5l87OhmFTWFnGGWoDeeRbbPLsocIWgHsfZHzAkCcFdqZqTdDmyMmJigBFzTCpt1P8UYSQE
	Px+u1TxPWMu49FVEZEMabyoVcy223BlO8+YhosqgMVrlsIhoP9bnOT2SftnOyaA28ujZevgK4mW
	NaPIBHhFXGsLOZiV+3ycgdewU3sAd9fa9TXp4JSft5IXVp3JBYckzyDQGGmZJtliCYNGC2L989H
	dyEDkanlpQw3BlgyCk9Di6kBdmUSm68CwC6FRBZSMljjX3yM0Xb3AMJID7FscvwbvJTRk/glA/s
	AOv+aet+Uh7amUuP4Piks7NtQLra4dzPtg8tt74khIXj9mpoyawj4X5UqRu7Q/XdU4ZAZ2topCh
	s+jtjSNeq8lHEAFjPna/LdbXLpsfjoTkJj8UVVVQWQ7mStlFDaWZpGzkQFK864yIhpR5bqyIErb
	yXdO4wlCM9lesqVSLP3zrfU/0EOIbZX+Cu3GTL6jkXtqPzqudyaFtcoGI9nKm1Mq8pkgOZu1uQ1
	OfWqGd4KiEbznGpUNex1ucU/sqILwv3tAF0uzmH63b2ZH88yNPncD6O3w/EzlN1jnb9V+OKnhyJ
	OzAh1KbeCc2KWhR2jraCM5jC4f1eI0fFxyJnuRA97ZqNgDGfXoUgQXpvzdQX/ytBcEus6GOGxxo
	OuMQs6PvtdBnZDcMvF8PFedr/VfBxQaB5pc2lujeo2xLvF3A6xcMkX
X-Received: by 2002:a05:6808:23c3:b0:567:f5d0:741c with SMTP id 5614622812f47-57a0b959e91mr6046198b6e.34.1795223475472;
        Fri, 20 Nov 2026 17:11:15 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:15 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:37 -0700
Subject: [PATCH v11 14/26] mtd: rawnand: sunxi: avoid a second program
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
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-14-9721b1905ef4@gmail.com>
References: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
In-Reply-To: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
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
X-Mailer: b4 0.17-dev

An OOB-only write can report failure after the NAND has already
programmed the page. Both the PIO and DMA page writers issue PAGEPROG,
wait for completion and check the status. The OOB wrapper then issues
the same command without another program setup or data transfer. If
that second confirm fails, its error masks the successful write.

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
index 712648864407..7f9bc0237cea 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1779,15 +1779,10 @@ static int sunxi_nfc_hw_ecc_write_oob(struct nand_chip *nand, int page)
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

