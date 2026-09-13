Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3C438E8AD
	for <linux-sunxi@lists.linux.dev>; Sun, 13 Sep 2026 04:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789272317; cv=none; b=cQ/iSq8D+SE16Y2GWzRn9w7szpeNrSrRojQ3tkpEfEq1hzZj59S+urJ5YzrQOkhlD8TQaESP0Qf8idsuJGIgCvS+nPaRinjzht8vZxHHAU9PDNFCcR8L76lbEhMdfFf+wMGsodtz2IslOaf4s2+jsPPELgCHcLp+JG/4U5fBRuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789272317; c=relaxed/simple;
	bh=ZVisc35YlAHASgRL9Dg/dczoW+VnaymOjG/nj+ZynBM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bKJmTOSMnB+mpE2Zi4FpOpwI0vkKZ/ihWMZ+c85iLK+HPZtRzexlOZUsA49PqqN4ez4MvJRN4c4Gjjd9cFAsnr99IWs5l9387q+nIQ0bSzraqUDJwfxvjQD0vbnj0HWzp1ZfhFHCx6WhbA3Xg1kDAjJqJY4qICyz87y4bZkM1BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jWbnrqLW; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jWbnrqLW"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4c27f0df6e8so1483599b6e.0
        for <linux-sunxi@lists.linux.dev>; Sat, 12 Sep 2026 21:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272315; x=1789877115; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qvHpZ4p+GIyvL8ZBW88R4SfXXqB8aP1HME4Kv/dMBls=;
        b=jWbnrqLWfESKyyL0K7s6yD0UFdA94edD+wFROjMqFswY3GrJY/dMoMAlaEAONyUgw6
         M7QP3TSCORczqSGtEbuJ12Wu5c3NYTfC1DMuMcLxY6yrIi/wYPPD1xeH9p+Icmqh4tBI
         QmKMEexuY8w35KyHCrUs21KVGb6UHqNAnFgCGoK5lbtD5pE0eQLNlHt2Vvoc12c3oiyg
         YNwyG8aTAS2xYhAUG/8Q5zLf2F1h/Tkj36CUjDmrhgkcsWrPgJcDRbAYloWYfKCbobMc
         Z564vXy1NtfQPnY74K3hpRGfvx10mZCbDZ8vXiGtC1S4hrahu8D2vDEd+XnyzCKtpF2K
         uYYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272315; x=1789877115;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qvHpZ4p+GIyvL8ZBW88R4SfXXqB8aP1HME4Kv/dMBls=;
        b=QyaUSVrH470MaaSHkO1+UeGM9nR5DVvuv8UY6WPWKBXCmlMHvHUEcmRPiN1sQoM1t0
         ddbH8MChzg2nDev76UU/SrKc6rx6Gnx0boQZLVvNE1yM8usNaZZYLL46GZYbpB6pbaCV
         oRPNdqWzPbdoru89A5MB1rbln9mCo2waVKLr77MbD53JYlfciG6gUbo90R4NUVYYhLrM
         KzQYQlr4RgbCy5OvOtOswl0YagVNaI0oX0/jETvrPaIi5HQo/hSc75Ip4lIk7H/M1L9y
         iuRi5/JBr2w9g6NLV0BBi1lppOx2DhDVToVsWxP5GWk4jhnzjWqH1KzgSsog6jIpzB06
         q9Mg==
X-Forwarded-Encrypted: i=1; AKwUvBx8YmoqiZYRnKzjC639R52ALdzs8oWAQIbPYd/SkKr+oHG0MTJii14dEL3iR5gFO8ekXyn2H7jdfTCyRA==@lists.linux.dev
X-Gm-Message-State: AFuF++lwE5QYX31IGdoJpa5ED2KwDkMKZbHbNyJBSmeD90W+EmRG36BE
	H+yvSy53fjZHEEisgCZEZIvvG/p56CtqRhmeUC/oUju+QQ6FUxwfTH1q
X-Gm-Gg: AYBFou0tHKrBlhXGbEa4B0jnrZEfnb2h8fr5WEZvm8NOQBvqO+GRf6O0A8tEASt5w1B
	NpMEHeKbjCZvvrzaxYrAikh+f7UoC6gPACIuSrpdGekxCRdU0VykoYGHKnOAbCEue3Z4rhVMFY9
	xFuzDuxNm/0cgOmCqqItQINQydducYDUPgIAhN10beLuZDjIE1XnCUMNXyP5SO3Tf5/ci/y7YOL
	kD9BBXJKKyei/UyL6YW8H4iz6U4RrvHSm6aS9uFk276R+xD68LLbCV1A9OCpOuhObkFpvtMhtqj
	+4a+aPD8h4dSCP6NxO75lilc3fv+qCvbRaD9eV2vt9anu1qlo0hSaJuqOgAi4WDJwwE8RLzwQKR
	63qRMBIkuqCOxSj9GhgW5zm/3ydAp6kAV5MWvPyzBAm+UAMSXobIa/Ud22OzvzcZi0XM2+ngxqv
	f0ETnVtmKakU0PbhRBgOx29Shqu+0KG9jdGdlGbcejijWWKrs7ZEaVWI0rPZI0GTHoSWQ8GCI1N
	2k68/GdgjqTeL/tDZn+DpVW0gjyKaIx8X0ehPnNZ98s4DiWoA2FJTtChLz4lRCIKLgrCRs51AV6
	2Od9erghlA5MLn8MOAJmyJ+rm1Uqesx6kxU4TpSw1gX4Xm58SgoUg/I29yp5qmuXy6CM7fyBd8Z
	5fXRNdPTF+AjzXeO3CQ6Uk+FY/uOgbw==
X-Received: by 2002:a05:6808:d4c:b0:4b9:e5fa:8907 with SMTP id 5614622812f47-4c31b4c5e8amr7737916b6e.26.1789272314888;
        Sat, 12 Sep 2026 21:05:14 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699647sm6011535fac.5.2026.09.12.21.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 21:05:13 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 12 Sep 2026 22:04:56 -0600
Subject: [PATCH v4 05/17] mtd: rawnand: sunxi: select the pattern ID for
 the current ECC step
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-5-4a64bed94229@gmail.com>
References: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-0-4a64bed94229@gmail.com>
In-Reply-To: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-0-4a64bed94229@gmail.com>
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
index 5d88ad3b8f70..3f506d0666a1 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1117,7 +1117,7 @@ static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 	if (pattern_found & BIT(step)) {
 		u8 pattern;
 
-		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & 0x1))) {
+		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & BIT(step)))) {
 			pattern = 0x0;
 		} else {
 			pattern = 0xff;

-- 
2.53.0

