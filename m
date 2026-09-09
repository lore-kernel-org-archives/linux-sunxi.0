Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13A84766B5
	for <linux-sunxi@lists.linux.dev>; Wed,  9 Sep 2026 08:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942666; cv=none; b=VNbykGdseD/YpMxw6yw15U7tNVNPL0NyJwd+kBwRETrzlCvWtixOg9rtQBB4CuR+X/jObNSVbtRN5DZeoAUtf5732k623RxUIA7BPj52DNEA2lqGljIDKu3JtFK3xnUm+0/r3d55ky56/0O8vjy6Z50aEhLU9F8FBQ8sKtH+5pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942666; c=relaxed/simple;
	bh=E0Hu13NVGjVcdOOasuN/FpRSk1aK5eY3ouDDcya/TIg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eiOSOYHYHIl9NSvkan7rPzj8x5uKA28VKPQ4ERzqgAnhhsV3cZGy2F8apgELNLNao0D6LemhLk43cVxwCo5HDlNoWpy5LlvGfoPDVpFPmYfkZi/9sqNhsiULgxXoX80S6zp+1+Lj+LMUZPgAO6UyPsrgyjaCMQUMVAq2w3EGaCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=InPfwOaN; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="InPfwOaN"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7f69672e369so3673350a34.0
        for <linux-sunxi@lists.linux.dev>; Wed, 09 Sep 2026 01:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942662; x=1789547462; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Y8ZddL9dHiRh8qGBH1XBVf3Fk4YPspd9rKTcsO7FCo=;
        b=InPfwOaNKNavvB5FKiAKT+7OXxgd18HcZFJs0Z7f0yGRECCgbfq5tk4PgFuBivPOpl
         DxCqdhagW0a+pEjCZ/oAcryvlQbY38u0pzJTzg7Tho/HyO4j0eA78/0t2jpMHBlbVVw2
         rKUoqS1ErAUbRDDLedqn3kxqs2fOUGRPcB3dDbFStdYhaM85KLq11SHm4pDMuaCKFghw
         8flfol0lATWbXkDC1RzqlBNT1GMJzwQkg5mT2tWi3r87zBTmITvUMk1JjzO/9ufSiI8G
         Fpm+ZiIXV7VsoL5+tK0P8a4U2hJKAOCZvrzA3gGZxizEXt39UPEG3FiuCjPS1CPvAI2O
         DgSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942662; x=1789547462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Y8ZddL9dHiRh8qGBH1XBVf3Fk4YPspd9rKTcsO7FCo=;
        b=MellkAtJI2b+j27SA3czcVZcFPwAm92rMykwFev6fq4hoHjaVXEzrFN3TVXfNGzUeV
         2jSVjfpkr3M1AIM4J7l4G1+EjYglxkBiFBYsWroasqNoav6wOyqwdukWzkQmJJhH1OVK
         heuzQIR6z5JUKlXq9n3atEqWks7+/4d9flBRl5NdAvtHDQQA3ulYxXtdZmALjkRgVeie
         6mSC3a5rYfY2of3ZK8YxQ9PRe8fqAwWU+4f1glcwinyuyVR5rrWyEy5T/bl4cQHHrCxS
         tk74oES+k8Zjz5U914HWS7edEvouYpEEsYwRBZI1JFN6phlXH9EX9BO2tkxLRgCnCOJ3
         8GZA==
X-Forwarded-Encrypted: i=1; AKwUvByHdpEVL6fmj5quDgrR0UPFuZXFmGKLZFCnNEQ3PZTW59Z1U/KlnEsUAXIl8G4Bm5l9UIZsAwo9DUTTNQ==@lists.linux.dev
X-Gm-Message-State: AFuF++kMQJOUvvz0lLkR1qgegUR/Gwbofg2zVAPOBfQTGq9NHVl9u57M
	lmW2bFuTaUiptvWstzYjuS4RSKNC8a3lYQcERW11uqOgogN1frkGsPqW
X-Gm-Gg: AYBFou0t/yA5CLJ+A4OTtkLszwBwNHSoK9OXZK76vP4OZyYY3H7ylVdb4RqvIhbLM9s
	HK4JjP1vqvUjJUvygm867Mcedr+f0/8Af8rw/FeT2S5jmXDDmzFPQmpBhMswKEYsU4ebme9FOiA
	T2AwLcAvQdGqJEzhnTDLYiecnvxy96GmqAUDZ+qRnIDGOAkJxRTUNjQa9hc51cch0CN4It6Oy/X
	3m6t33LnfbHdUvX7pTa8Z0mzEHjFKSo9KoPTLA07UnsYLD5N2At+yvVKxo+MaxDAUpIXhqb6bPl
	ruh2+BRjeNZobpClw6c6GqpYd1XIbug26iKjFM7jEXAr7Ecc9ARKxZQDs8E7aGzvUuLHc2pgAk5
	kXmrNOvmooBsPHRfm9DogCmsPOO0kzl87DsWovv9GID305in8DEQIQmEM0mdS/0cQgFy1uhTGHb
	3dle1gTbql5th3Ja+eV+tShrSj77EDUxwkDeAaOkGFXHFVOjKzghAEdEfQLUkr2MpH7z38+Kiln
	ZabsMI6M3fpHdDgmR6GARDRWBOhoTvOPXkBxf7HHlw5nRpL7VdsLalFGlKlPIGSrA2rN1/MeQ+o
	nd09N8xYHXXLanrv1tw2xo84rBixQ6c0tWZpk5w0soN3q6ET0OiwXlgIFR1RimMOlNrohp0Y+nN
	QIFb1xQytfiq62QK1qUSD//Hf2wxU
X-Received: by 2002:a05:6820:162b:b0:6b6:f16d:d672 with SMTP id 006d021491bc7-6b6fdfb6581mr30282006eaf.16.1788942662447;
        Wed, 09 Sep 2026 01:31:02 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6a0sm19031004eaf.5.2026.09.09.01.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:31:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 09 Sep 2026 02:30:40 -0600
Subject: [PATCH v3 07/15] mtd: rawnand: sunxi: avoid redundant column
 changes for extra OOB
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-7-838cb0ba1547@gmail.com>
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

The PIO write loop tracks the absolute NAND column in cur_off, while the
extra-OOB helper computes an offset relative to the start of OOB. Comparing
these values directly always requests a column change, even when the last
ECC step has already left the cursor at the start of the extra OOB bytes.

Include the page size in the comparison, matching the extra-OOB read
helper. Keep the explicit column change when the caller does not track the
cursor, as in the DMA path, or when the current column differs.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 545da54b8908..16b2b39524a7 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1497,7 +1497,7 @@ static int sunxi_nfc_hw_ecc_write_extra_oob(struct nand_chip *nand,
 	if (len <= 0)
 		return 0;
 
-	if (!cur_off || *cur_off != offset) {
+	if (!cur_off || *cur_off != (offset + mtd->writesize)) {
 		ret = nand_change_write_column_op(nand, offset + mtd->writesize,
 						  NULL, 0, false);
 		if (ret)

-- 
2.53.0

