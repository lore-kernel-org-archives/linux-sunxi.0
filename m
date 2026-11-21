Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795223483;
	b=Tm+niRkscrIYWAOk2jhHm63oD6+I14jKvC3zLGK2tbRAfBH6iKb5FXEa2VSQsuKQpcQv
	 oWaV8BvbYcqrDFmeKf5y7C12EICBe7HSPdqQBpksJAAn2rxfy2wJtbTG0jowgPJ5n78XV
	 I5HKTy79qnscld7Qs7Uvtc+RS0FZgY3V/MLRSrid9cj0rWZmsaD1TOg/LjqcnHG2FbbAL
	 w4FbBOGwvPnnEbSRKx1cqpWOoMd+7cE0sM1l3tgtR24DZMFjZS/8NM2aZnPHaDnxfYwEx
	 o1jmChBn/aujMaUJOKtu4JbfAqbvCwfOoEMqJwr3v6UoF0c+MsTvh+q5A5mUwhn6g/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Rd+OJrfYC05spJgrrPaaw8Or0kLWD6WKtcmuDL8E++0=;
	b=leJzNXj8z8ZvlnfhRr3uSWQY5jRtXd5roj096xsfjntBIjrH5nXPbCw/sJwTNfa2Smut
	 RqqspOo58jEB//i+YPi3gKxfvf7H3reWye5Z4UXadagfQwyNH9t3jN5vSzwZMjW4thEtE
	 EIsyvMoHkCfVylMQNj350BYQQD/fTGEIXbXY+J6iK96hvKyb7dVL9ydjrtowGR0bCgTbY
	 bZYILaAukPgFFhW2AjRxDMlurD6doXM20GwRHwaC3siYNx8wSLJvM9bkCetP6U6mEraQ9
	 kvpPBt9i5B28Rg1BAdDkyriOErfQ4Gmq++ML+/J8lNcHduIQ3OCzLUF75QOqWd2+PLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ww+yVDRk;
	arc=none smtp.remote-ip=209.85.167.176
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF31A60A5BC1
	for <linux-sunxi@lists.linux.dev>; Sat, 21 Nov 2026 01:11:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF31A60A5BC1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ww+yVDRk
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-57297329b3eso894725b6e.0
        for <linux-sunxi@lists.linux.dev>; Fri, 20 Nov 2026 17:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223480; x=1795828280; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rd+OJrfYC05spJgrrPaaw8Or0kLWD6WKtcmuDL8E++0=;
        b=Ww+yVDRkJAR8dYKd9Nh1Z3+YJy6yvbaBcM8/PeRoMPWm/Y1vHcIi6R4SG4C1+gag4/
         35iaOvYhWR7kTS4LMJYm2S4OIgWKJp68fmQyMF1+0Urf/cU9IJKcqjfJlAYHfm240iWL
         bCcsv+R51Js7STF+MYXqAr/hz+Qv06btIy1JrbP72hhh1xUuE4nunflX62QeO2mSGbrH
         PGWAXG0zpwM2c4toVDAPlEz5JbIo87BBJB8IciK87SazHmVhURFOs3Vu0EN05xQTvXXA
         +fpXvT1S33Xii9T8xlmJ+WFp2CizviB6JvirKqKZBtDo2u1zNE8GMo9LZZ2nJc9Rfx4N
         L5Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223480; x=1795828280;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rd+OJrfYC05spJgrrPaaw8Or0kLWD6WKtcmuDL8E++0=;
        b=sYDvhIdhyv9sVFXUIwLrvfoqxj4jEZ6krB2ZS7bZokfM3YanKx3+aHWfQ64RuZAd02
         oOjCAjYpDFgKh40tdjhtV23gLNdLnEx+z7WONccvyEQuTtQ99E9dozAOtZH77BiNJw0W
         MLj7IsMZ6JV+p3TgcRhhlIr/c71ijdemiq8K6E6HJMjPi61DUdRlqSDOHWgBgUn7b3CQ
         jDcm59p0MnKwQpLihaPOfDfdYM1NeM3xWc8dMDd+hrCIeKFlG9Cbjv3VI+jw/MZvMESd
         87smoRo14/XYpio7N8jk8Wcbs/eXOpczEeM0eud3YNGs8xwHEsYxpIeTrE4zc5AEjRMY
         Yk9w==
X-Forwarded-Encrypted: i=1; AL+hErFE1LMeAgXJfCScTI9bgKSk5v6kFR2a8w1bsilk/dLDxtm7LVTfhmn4Q+MXHw67HyxPnWih6yDfrAL+JQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z+I6PEg2xFnadtrUr4Ab/lhVCWdgmTTkJrDP7ypUlC6XGXE8A7A
	HQY3YqteZTnqoB7sK7+ZbKnCfRdug7SnLurFHEUnCDZBFHk+BVLvErKb
X-Gm-Gg: AYBFou3Eibr0MuEqQcDnF3pd8dEC5LmpaUF6EzIjhWv6IBHxxJaoH+2BFts7uCwR+uj
	56b2qzJB8zNklOevonIE1Ge8JHKvZTTtvi62ukPw2H3e/xl/SHJFwRjvdcDLRAi+z7j/UtyrcY4
	RY6vH6eXs8QYD5+JF9HGqRQAchbtz3SZl2zPxoH1HY40v0sL3we/w3aVYVQiIGyUfV1jkxHnevt
	3Bkh27xsJGDzKo73DCSUHfy2fJlkzeH6lyWfalFsIv6AnGvNdXEWEo1u3kiEWbRi5YidYVChv1j
	Ix4J9nDKYKKc1+xMsCTKPyvJBMolEmf4D4gqwqgkikbePBUd7x3hm7xf32CKx4H/IfkrITmRjt1
	QkMJfsVBJF7DLf17HE0tRYeNFhaU06ZCMFnooQ54CySYPPp2Elov3TVPajrMeQKHIfZbXkH8CDk
	qnDci3FRG+uvQLAmr2Td6gWyu+rpnX5q/Xwc67LqwPBrg03z+ihYYfmthm73vONCYskIVSvBUIG
	ZDp5xIhLqiejILBzaq/Sm1pM9sKminpgXc3/6urJQUoj9wO7DbVkT7MTrw5Ra43qOE17J/xoSam
	cO8PgJhAVojZGR9o4XoPbeKf8wnriENZVNT1HABHP1L1xhlk5g7BX1mTQ3/U072vL5z4YJrdPiB
	9/Cp5pOd6l4n1zw9hwrupRBJMNC3mVt0G/YaJih3i0nO4o1WvEv+LxYBtt6ZTaP3O0otfVu3TP+
	Mbo+qi7wNtQx9wI09rTEg7UyGkyq433p4dIlx2pDy4dw5RTle9rBEy
X-Received: by 2002:a05:6808:4f0e:b0:54e:7cf0:c0b9 with SMTP id 5614622812f47-57a0d2f1a5emr5946703b6e.64.1795223479754;
        Fri, 20 Nov 2026 17:11:19 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:19 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:40 -0700
Subject: [PATCH v11 17/26] mtd: rawnand: sunxi: preserve bad-block markers
 on erased OOB reads
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
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-17-9721b1905ef4@gmail.com>
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

A bad block can appear good if its marker is the only programmed byte
in an otherwise erased ECC step. If the controller reports that step as
uncorrectable, the erased-page check counts a 0x00 marker as eight
bitflips. With BCH16 it replaces the marker with 0xff in the OOB buffer
that the NAND core uses to check the block.

Leave the reserved marker bytes untouched when checking the physical
first step for erased data. If a hardware pattern supplied the OOB
contents instead, read those marker bytes from flash after the OOB tail.
This preserves the column for sequential reads and leaves the normal
corrected path and data-only read traffic unchanged.

Fixes: 146b503e1027 ("mtd: nand: sunxi: fix bitflips in erased pages")
Fixes: 4be4e03efc7f ("mtd: nand: sunxi: add randomizer support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 5415ac6960b4..f8bc6e3c3ac9 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1111,6 +1111,7 @@ struct sunxi_nfc_ecc_read {
 	bool oob_required;
 	bool dma;
 	bool has_erased_chunk;
+	bool read_raw_bbm;
 };
 
 static unsigned int sunxi_nfc_hw_ecc_read_count(struct nand_chip *nand, int slot)
@@ -1167,6 +1168,12 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 	if (ret)
 		return ret;
 
+	/* A factory bad-block marker is not an erased-page bitflip. */
+	if (!step) {
+		oob += SUNXI_NFC_BBM_SIZE;
+		oob_len -= SUNXI_NFC_BBM_SIZE;
+	}
+
 	ret = nand_check_erased_ecc_chunk(data, ecc->size, oob, oob_len, NULL, 0,
 					  ecc->strength);
 
@@ -1251,8 +1258,11 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 
 			if (!read->dma || randomized)
 				memset(data, pattern, ecc->size);
-			if (read->oob_required)
+			if (read->oob_required) {
 				memset(oob, pattern, ecc->bytes + user_data_sz);
+				if (!step)
+					read->read_raw_bbm = true;
+			}
 			if (pattern == 0xff)
 				read->has_erased_chunk = true;
 			continue;
@@ -1321,6 +1331,14 @@ static int sunxi_nfc_oob_finish_read(struct nand_chip *nand,
 			return ret;
 	}
 
+	/* The pattern supplied no marker bytes. Read them after the OOB tail. */
+	if (read->read_raw_bbm) {
+		ret = sunxi_nfc_read_column(nand, read->page, nand_to_mtd(nand)->writesize,
+					    nand->oob_poi, SUNXI_NFC_BBM_SIZE);
+		if (ret)
+			return ret;
+	}
+
 	return read->max_bitflips;
 }
 

-- 
2.53.0

