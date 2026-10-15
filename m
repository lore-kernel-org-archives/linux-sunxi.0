Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B799272E6D
	for <linux-sunxi@lists.linux.dev>; Thu, 15 Oct 2026 01:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028067; cv=none; b=OhTtkVeP01GvZYFEuIOYmu6lI/vX/EMQdh4BC91iMPTIrBUwROGhNGoaSg77HwwsEKc4O1sn2ADI2QPbRgGAZ8wraTZyc+o33oZ7SKEdYSG+khJtlJX0p8csThEu3lfqOhmQf7Dr0bPfGd3u8MN4TCv2ZRfEwtuoc/eMFhsU58s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028067; c=relaxed/simple;
	bh=pp2SixJcCNbM9ouP1cQ4wZ06wECMdT8iJOt4pVovses=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Uljsug3rB8IySAYZgcxPSIgruz2W8am1APGlQgWApBBowrHlgOdIR5d68ROMXotog+PO+4ArJv3eppBlLQItkErpj7SLz6ZiH/3o3TiTipBdQyEbfZzshKQ9j4MC2YhVI2BKqEpkexEREMfVf9RwzqiC8c8MsaqepQicU5u9O4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ngjjsKZf; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ngjjsKZf"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6dd4f3f696aso2396452eaf.1
        for <linux-sunxi@lists.linux.dev>; Wed, 14 Oct 2026 18:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028062; x=1792632862; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vV+y+As1/xEWZJVIUOnWi1zmF397GSE51b2dM1xKJWs=;
        b=ngjjsKZfspSZj6yjtwMioBtW66GDq20MlvNF10Ltaxtq9jMKZ0fVLljo0jlrj5sxxI
         fTCMoYIpQIj9GuDZe4atHQmgUzpKGoxBXTTx/Mag3IPFJYv58iZIi4o63qcsoxMVZKx5
         DoIk+Vci9RrTrJIaWEfYJ2T4Yb5SM0r3u+VpT31+XOTwTU+JI//fbl4lzJawWKCyfK9B
         pFNL58dI41kiERcs2DY192w6CT/wvJBWHmpGecAkgqFizyTStx/KtKp3Gv9KEUGd5y7c
         Ey9oR5RnOIzzjqGJ4OSKLD0K0nHkZ7coOUuFHZLPIoRWOYjUd4Lg7NKEsIOhPjOGQ4ST
         C9SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028062; x=1792632862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vV+y+As1/xEWZJVIUOnWi1zmF397GSE51b2dM1xKJWs=;
        b=2ydRDOMSN5/WpQv5P6XQj/gfT1JMF/btt3UEMz6/LpJsqYItQqMRZVYHXdqPb5MnRR
         8L8TbR01L8t6NRp5a39jyA4abCyzzWPTt/Tjebf1uL2jfE9k6CvtLcHvJLWDm9lKqkmu
         A/be/LkyIoGFgyf3nvcTbYbaJj+R44IOPsWcJ7d41dj++caWcPIH5IgyNCVOHri3NV9x
         MflGhrzMD/CgyWVJNs4Jvur9gXpQguzRYod+76WuAkl+zW1gWF61cWzDCzlTbIRO0t9T
         NTnuOQS+9dQPriWy0b2q2YbBT8fh0ybE6Y309YEFKVOPl/VCCKTrtUMnBftDh2G038Mw
         oLdA==
X-Forwarded-Encrypted: i=1; AKwUvBw35QvaWrQ5JdcbdPDywHWW+Dxd//8M3CM8UPnmAXb66Dr+lgB659WR/S412BGUi+dy+9EcLa2m5k9nAA==@lists.linux.dev
X-Gm-Message-State: AFq9FYLbxoVQSAbEZ78C2b6U4MIK1dJReYVJlvkb7bX7/xQ3P+AZ5Lio
	Y4YX72sh5WwyJh+Zgo8U7163xpMYXQYGeDuqF1L63wpaq5WpPvRJyewE
X-Gm-Gg: AYBFou2ykHSxmlY9kRLfcphSdhqwkboEbj5+rsRkbrA4pjk0OBfa4mYuX07JjaCHKfI
	wdpUKAbKpX4BXM3fMKpVkcKxWll50KGIeG4gMg0y+fuST+zxLl7Dm0ydwKL/0cYoGQs7NJna91i
	rSWxKgiQm0alMQgF63wz4nt33fZsY3sp0wtgXsw0mldYNtMuUTqqzOtn75lBBoKPa16ECuT4D+9
	ikNkR/c+Z7psivwcKlczar9ndek3Szr9cY212U+ow+sxI+ACCwdvxC515nyaDVeGipZwIgqMM+o
	8jtxwsqFqZIT7fKS+2nh1pX9r15ugyVDUfnzzsSw3tSfCe1t4vZK6nFGyeuwhBBHFlwOvFc6LiN
	6LFBvor0RaOSuPe1npncWDSNwolmtQSwE7tzfmQ0GUUnJ5F4lWQ6+/C8LjoErjTepynv1hvxqkm
	GriJSDg3KOvUaH3YwTIQ3QJHXcIQ7QBEFeFXaeiaUyFVw2yBKoP8gEhoXAtaRPgDpOvho/1nEEM
	hRXOLFIpaIvv7V1ZNKeGEOAfxHm14C/mWmOtH8ZIzdwb9S4A2Iu2QjQnfKan5tM5IDIBVfiWSsK
	Oi+dKlxn8WvC23DfJKcw6UzgHvdWk+q2GyRLhktSOEzS+kCqOg301qF1i26xQBaHpkxnlk7jcd7
	kojip+XxXWQlWU9242G5O
X-Received: by 2002:a05:6820:1517:b0:6cd:3fdc:a936 with SMTP id 006d021491bc7-6ef1144ff66mr12723501eaf.83.1792028061915;
        Wed, 14 Oct 2026 18:34:21 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a6dfb41452sm3428139fac.4.2026.10.14.18.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:34:21 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 14 Oct 2026 19:33:53 -0600
Subject: [PATCH v7 06/16] mtd: rawnand: sunxi: select the pattern ID for
 the current ECC step
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-6-5d3fc6ad2da1@gmail.com>
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

ECC exception mode recognizes physical all-zero and all-ones data
blocks. For each hardware ECC step, a pattern-found bit says whether
this happened and the corresponding pattern-ID bit distinguishes zero
from 0xff. The correction helper checks the current step's pattern-found
bit but always reads pattern-ID bit zero.

PIO processes one step at a time in hardware slot zero, so it is
unaffected. DMA processes several steps at once. For example, if step
one is all 0xff but pattern-ID bit zero is clear, the helper treats step
one as all zero. On scrambled DMA reads it fills that step's main data
with zeros and reports success. Requested OOB is also filled using the
wrong pattern. Conversely, a zero step can be classified as erased when
bit zero is set.

Test BIT(step) in the pattern-ID register, matching the error and
pattern-found bits already selected for that hardware step.

Fixes: 614049a8d904 ("mtd: nand: sunxi: add support for DMA assisted operations")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 57df88099206..8256982d1d56 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1101,7 +1101,7 @@ static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 	if (pattern_found & BIT(step)) {
 		u8 pattern;
 
-		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & 0x1))) {
+		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & BIT(step)))) {
 			pattern = 0x0;
 		} else {
 			pattern = 0xff;

-- 
2.53.0

