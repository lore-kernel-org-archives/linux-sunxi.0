Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2D3453A28
	for <linux-sunxi@lists.linux.dev>; Wed,  9 Sep 2026 08:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942661; cv=none; b=rPJdRcX7Sk0CvwFgji032F09fwHeAgG5EpMw9Pv7Jb6b+DtexjG3cfjaGXPmHECPBM9aipYaM9czwdD5IMgKFmM0wh6Swhopor7TdJO5l67xOf5QT+0eDMQ8E1wo7KNLHk5mEB7RjOeJXTy72E5B44gthPQ8Q6qNPREteNqQd2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942661; c=relaxed/simple;
	bh=M5gOmxNVEYBWCZddIshPvl/AuXs4iPCkuaNTOjovIfs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mrrC3a4MX0uiYpSXx+kxaz9fdlcQ2XmrQUt4JUkqiNtjfIBpVeqbSydeykO3ZueLiDg0sV3rHJ6fhi2g5DpA0hNRLswQHQAQ+Lz5qJgdIOKg1ODe3x/Vej9wwPoyKl+SFXlqaFvqA5DbNKnUjKY/fJfnQYbx9Kr61cyq5Jqgb5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gg15KS9n; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gg15KS9n"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7f4b94d72acso4637014a34.1
        for <linux-sunxi@lists.linux.dev>; Wed, 09 Sep 2026 01:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942658; x=1789547458; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fr9GqqlcZjpJ8b9Wsl+mydOW8kr4IAMiGLW3BSwW8ho=;
        b=gg15KS9nJvn9dM4tBz98mQ4aUJg48JgExcIm41/EOXz5x+OCogNt98h17iK6Qk6bHD
         9K4B+SHs72WMhC9sqfxYxed8B91p7UR6zidVmajM5YWOp+EGeCD3ahBR0BiRsgS7mWus
         qawqnXc3ks8tiNJpj5ip880l3zRAquhnEpAppnYj6QBvOjx0iET4z9+4zyZcdA3QkOrG
         mlZNWxCwlcdsSLDsWxn2ZcX9W0CUPwBrYh1zntJ++oxer5qBIJUybVEMXTVnRwHGwAI3
         aqjrYwfjPVg11ibAPTPUKHP+yE64TadiDZvL5k8wfXG13dnwHiqxfZkakHrLZt/hw7cF
         481w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942658; x=1789547458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fr9GqqlcZjpJ8b9Wsl+mydOW8kr4IAMiGLW3BSwW8ho=;
        b=QZaQXsSmYlcj9N6JNaHz9dDoDwPGw862AAGETDfccJ3PawTpNPAZ2FS/pF68RrbVgV
         kPKvlFN5hZJ3pBb4QbCErAMdi1PMoMard0kjUC7iGO6RM9KYEouar0S9/hg7IJ+LI5fN
         kO86PeMSzzvLcKoPgqer7VyZMLm0FId1+OmN+R4j85FtzuVCNfCmwtmakWT0GMz6x2R6
         bYIr3kbwae64en92Bg7R73lfhmW6ISgC9JIeM+PnVTHa0cbpq4NSP7jfB6dk2ymhnhki
         xIduJ6e5aLNMX1smOvBB+HCxm7x0DdvB7zz0mcdmbki3OdvwT8nJjJWhzChN1TgqM6js
         wxrg==
X-Forwarded-Encrypted: i=1; AKwUvBw+i1xOK+b0zuzy07A1ICzQJmH9JxXCd72iMoZ7DV845LMmTw/utleY3s9v0Vk67UnYAxjHce7K+MLfRA==@lists.linux.dev
X-Gm-Message-State: AFuF++n2etQpf16wkeCTnTqJUmOujBf7AERmnH3FWqO7HTca4rmr7xNz
	K3F6an7zxko0V7uwlQzfgaNqztK0BomnWrAy0+RWYkR6OYDp9kM0bJVH
X-Gm-Gg: AYBFou2flPD7A248wITJINsgYAtm0/xu+ZSKSMHlHxqM99w0wHXlWXIDSaGgO856fNj
	5GNMt4cHgkBq2PkkZgxdGLV2J+qYTM1UVRLXK4SpcqK4SVOw96tL5HdL43jZskzt+UIqJV/c6FR
	NGF8iIFndWo56PzkZTmFttonzWwuWycVnWfxdSISRTQThr+aN+zYTHP9sQassFsaCxk8F9O5qm0
	JW/bzJwHh7VN6q3YV4sqTCegdGfyA9Q1kEwPqE52tBjocg7u0rf1BpPmX/clGhsOX7Ae0fxKebq
	XhgYsBICtdQSih7fuyKqUqc/LIBTRytB6jpfsHG3R2OuJHNHy/ti94QVljKtNBYapYp3RBmq8U5
	0tYxR4q3wrZLzUc+azt25wSiDOa/x2fUzYTvufGWdX/Fpat23b7HpjKi1mPsxDGKLz9zmdwXm9m
	wGRzQKCzk1eM7pCYlR+7tgrRhnwNuxRtj60XUkIHd9eWLdkLOIgIrB+4sf4Bp2XRWkxSnCbydTb
	hYrqBGuR1KZc72w7TCZG0Ek+dK6QrgLZLRBxtvZyp0D7FkM/IO/0slk41iMldftCSWM2ClCIXYi
	m+SqGILg5+ErPQVRydqyWrk/pFU8V2FNRN7xoxEScnVSscPpIZl7hhBX5OXWTONE4bcJIlgh6+T
	iuOIQd6qbBOdl3cVLwrEXpho4PQ6C
X-Received: by 2002:a4a:e914:0:b0:6b2:69bf:c8d7 with SMTP id 006d021491bc7-6b6fb3df17emr20147370eaf.10.1788942657854;
        Wed, 09 Sep 2026 01:30:57 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6a0sm19031004eaf.5.2026.09.09.01.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:30:57 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 09 Sep 2026 02:30:37 -0600
Subject: [PATCH v3 04/15] mtd: rawnand: sunxi: select the pattern ID for
 the current ECC step
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-4-838cb0ba1547@gmail.com>
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

The pattern ID register has one bit per hardware ECC step, distinguishing
all-zero from all-ones data. The correction helper checks the current
step's pattern-found bit but always reads pattern ID bit zero.

PIO reuses hardware step zero, so this works there. DMA processes several
steps at once: a later all-ones step can be filled with zeros and reported
as a successful read if pattern ID bit zero is clear. Conversely, a later
all-zero step can be treated as erased when bit zero is set.

Use the current hardware step's pattern ID bit, matching the error and
pattern-found bits already checked by the helper.

Fixes: 614049a8d904 ("mtd: nand: sunxi: add support for DMA assisted operations")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index af8ba2d9f7a0..1bc94565e9e8 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1105,7 +1105,7 @@ static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 	if (pattern_found & BIT(step)) {
 		u8 pattern;
 
-		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & 0x1))) {
+		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & BIT(step)))) {
 			pattern = 0x0;
 		} else {
 			pattern = 0xff;

-- 
2.53.0

