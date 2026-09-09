Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51691485CCD
	for <linux-sunxi@lists.linux.dev>; Wed,  9 Sep 2026 08:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942674; cv=none; b=ZYrEa0PWuM4b2L1xOCVcNre9IyPT7myIHo27CVlPlNBzh4ECkk7+IIiLBzz0YjbkQGYDU9cJbM2dP0yDPfA6gMHlRhQLLQ0X72z1/CLJuP9J2ai1JkRC+qnlyYUbbrK6uIZ5SP/KrCGukpCZgGfU6aENqW4mSjNPZyaFosGPI/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942674; c=relaxed/simple;
	bh=cGpmPCWk/z4rj5JVkICnW7HVGVcxN3tvIGoYKX6sOJI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=El1gp0CANFN/VAnlxd6/kUw6IQzuL/sz1+NGukCTjsWS9TmwKrYmM3jmvvTzXxd5asRWZE19DBBxUiqFvNuevyyyrK8uab4/99xcznTngzFgx1HgYza9B8tqnJ1d/82Jlrr4f5nm3NlP2K/IcGvBOjIWTNiM8wN6Qp8eDOwN228=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ra2FTZ2s; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ra2FTZ2s"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7f57db8b5a4so4284461a34.2
        for <linux-sunxi@lists.linux.dev>; Wed, 09 Sep 2026 01:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942670; x=1789547470; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CID5bvCPjR59lMZ6K1AMRWDV5Xq0pdMdX69zJBV2wqs=;
        b=ra2FTZ2sQ1DP+mPtx4yo/zk2G+48Z/djLfXjVETkNKoMhA5FQMSrNSZYgyktlp0ltv
         4pPEJ+dim2d7FpDlhJHT93AJCkrjzZgKc9aNA8W7b0y8/MaI2kj6HYDIlXUC178TBDNF
         8UEsX3ATbtIq4qglQzNmnQQ8ooxkN8zJ7YBs4SipDr7ywPR9A8/aRyJgLbC5+ov71pVF
         QuDrxU03YosyhG+VYN9fWgvzcP0363asi5RQOjWP0SWzRmQUxwtAtZAfhcrxipC5Er9M
         iPm6wKk6RN0EO4A9GMKZ0nKpXUWNSc0kVQe3Ttd6gF8EKCocKcvS2SZKfaHTB4MoQL+2
         3tbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942670; x=1789547470;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CID5bvCPjR59lMZ6K1AMRWDV5Xq0pdMdX69zJBV2wqs=;
        b=bWyGNrlzELN/l6gd5Srl6lDq/hvIVm9RHVE5+8kzn1YoBYHCIdjN/YHAXAmbtIh2/j
         PNUC9nAR5u1Ry7u5Xs2wEtCIdJ5Zg3VCpPdVQnO++aA24kYJgjN2tfgCNsL4QPJY+C+i
         JiukgP6T3YJVAcXw6BnFJIP4rjf1745yYXnxhVJUo3fqE+ZfBQhNlJ6OPlb9K+ESQWgC
         iEP9cN7oojb3A0gp8jAZ3nb4cxHStgtSH8BvmzUtWlyigD8lHTtMWU5JLPCHShnkJNr5
         Sg5eVR/Wb3le3Ce/EP68ja3XP+O+syIvt4wn7CScp2jLfHLYAHF5dzUlyy0l5Fu59vzl
         lIvw==
X-Forwarded-Encrypted: i=1; AKwUvBy7yFd1RBzSzb9x5jQVZ2gbXRLzqD8WNzcDz2HxGEmlxg8IsQC0ozvnjz4ET7tx79m1qhwYM9/If3YTWg==@lists.linux.dev
X-Gm-Message-State: AFuF++mobor7nQgFqoDi2Z7Gem1aCpci4BSB//Iilf+L/mcJPavuo20v
	3F9WFbMDkl6AXRRP7BciCC4Qxyn5gqhHliUOtY4UAE5ZX9fVdty2HOH2
X-Gm-Gg: AYBFou3i2lcRMsDqztpgSuQVgDhcwiUp3/ocNdDYeFhnQ8jNHJyh/pFuWrGJ375+/jL
	v8OE8Lri017E5csbjdZZVyEC51LFvF6O6EOiZiQNIAhlpNelarL6kPtS77G5gaWbxvvHdaZ2bY/
	iCIgJ/wYlIRPrqu91HopRHVAi8PKCjGL+JRPD1QG/MWApriarfFmBiGqlv9VT4W1U9cKOtS2CPk
	v5lWQnTVVQyb5sAjBw/qjKFz8ftBlrBTsL+b25O42gUNc8kcrIjt4A45zya+/jsw2ce0q4OUQ/t
	nIy8DawWnS+plem1JStT5Q1w6YGZ6E4ZbQwJfgyg1qKujr2r9tE4Xa2XI3KphzfeG5ogyJZedvV
	y6E0+1vG4ydVPWyLhJxqLWf6BFbPhv7VF61pmzmByPPLPLRGjL7Sy/mRQQq+J5guNbXYC6TBs4l
	hgEjh5yuwlUxA3hqIUU4t+Kdh3rX9s+JDxroHdr6dggr0ocHEj2L50FGi07OFkwflF+qatxZSx+
	nfnO3AYnN81cWwA1DTR5hbSxbuA3qQLcAEPVAUNPR+Bpmfm/Wv6NUj8RfBjIR46IrjWHZsp9c2B
	qf7kKQlgE3OeTEv6nlqF6BwByRODCPzB0xN73emhLkadej/LbLShXSrb9rurJsbpnyHEX1fhnSt
	oKonMK8V9GIyh7kiFL4ENeRvTZatGUw==
X-Received: by 2002:a05:6820:1891:b0:6be:731b:5544 with SMTP id 006d021491bc7-6be731b5b5amr683141eaf.37.1788942670338;
        Wed, 09 Sep 2026 01:31:10 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6a0sm19031004eaf.5.2026.09.09.01.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:31:09 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 09 Sep 2026 02:30:45 -0600
Subject: [PATCH v3 12/15] mtd: rawnand: sunxi: combine contiguous
 unprotected OOB reads
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-12-838cb0ba1547@gmail.com>
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

The randomized-format OOB reader fetches each parity region and the
unprotected tail separately. H6/H616 pack protected user data before the
first ECC step, leaving a contiguous range of parity bytes and tail data.

Combine adjacent parity regions without crossing protected user data,
and include the tail in the final transfer. Keep software de-randomization
separate so each ECC step and the tail retain their existing seed phases
and PIO/DMA representations. The NAND operation parser splits transfers
which exceed the controller SRAM size.

This reduces column commands for OOB reads without changing erased-page
classification, data-only reads or the plain-marker paths.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 6e54d3a92219..bbfed22640c8 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1412,15 +1412,28 @@ static int sunxi_nfc_hw_ecc_read_unprotected_oob(struct nand_chip *nand,
 	int ret, i;
 
 	for (i = 0; i < ecc->steps; i++) {
-		len = sunxi_nfc_user_data_sz(sunxi_nand, i);
 		off = sunxi_get_ecc_offset(sunxi_nand, ecc, i);
+		len = ecc->bytes;
+		/* Keep decoded user data, but combine adjacent parity regions. */
+		while (i + 1 < ecc->steps &&
+		       !sunxi_nfc_user_data_sz(sunxi_nand, i + 1)) {
+			len += ecc->bytes;
+			i++;
+		}
+		if (i + 1 == ecc->steps)
+			len = mtd->oobsize - off;
+
 		ret = nand_change_read_column_op(nand, mtd->writesize + off,
-						 nand->oob_poi + off,
-						 ecc->bytes, false);
+						 nand->oob_poi + off, len, false);
 		if (ret)
 			return ret;
-		/* Preserve each path's normal representation of ECC bytes. */
-		if (!dma) {
+	}
+
+	/* Preserve each path's normal representation of ECC bytes. */
+	if (!dma) {
+		for (i = 0; i < ecc->steps; i++) {
+			len = sunxi_nfc_user_data_sz(sunxi_nand, i);
+			off = sunxi_get_ecc_offset(sunxi_nand, ecc, i);
 			state = sunxi_nfc_randomizer_state(nand, page, true);
 			state = sunxi_nfc_randomizer_step(state, len * 8 + 15);
 			sunxi_nfc_randomize_buf(state, nand->oob_poi + off,
@@ -1431,10 +1444,6 @@ static int sunxi_nfc_hw_ecc_read_unprotected_oob(struct nand_chip *nand,
 	off = sunxi_get_oob_offset(sunxi_nand, ecc, ecc->steps);
 	len = mtd->oobsize - off;
 	if (len) {
-		ret = nand_change_read_column_op(nand, mtd->writesize + off,
-						 nand->oob_poi + off, len, false);
-		if (ret)
-			return ret;
 		/* The unprotected tail uses the page seed and its 15-bit advance. */
 		state = sunxi_nfc_randomizer_state(nand, page, false);
 		state = sunxi_nfc_randomizer_step(state, 15);

-- 
2.53.0

