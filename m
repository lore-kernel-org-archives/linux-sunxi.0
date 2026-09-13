Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFA338A718
	for <linux-sunxi@lists.linux.dev>; Sun, 13 Sep 2026 04:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789272326; cv=none; b=UmnZruFAsBWp6R1K2gwVQFZvX2RqySvmtdVFV2+vBlGUyU4eucflli9HlMfN6xypaZhD7GYRIEyD59B1OPjI2ae7FUaucBppeq8jGTERZ4xnEXTooKQKPrRlws2vr119HcPCLZADoJoYfiOJr7z8FZvzIDTGXpbcQLJWclrpeGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789272326; c=relaxed/simple;
	bh=YbBF9laHAErhZzSaGZGDzYG7q1LarpeBoJ8ap1tchQo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ozWJFS3aVd6Z+bbRZK7ETG66PH/tn0Pl0A2sBv0HTXV4WE2Q0oot8lbHGpagxeY+YOgbSnUewN9ZdkB7FqyK1RRBlOjI5M3KMdKkuwrObs0loswKJIVN2NVBa3eeHBXMMFRJASUJrGNvn5l0NfhjffxAw83+JHEyhmyFwUU8304=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SWoEdC8n; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SWoEdC8n"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-469fdb78b1cso627129fac.0
        for <linux-sunxi@lists.linux.dev>; Sat, 12 Sep 2026 21:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272319; x=1789877119; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A0CrISCG3enxLUNERhlMVwT+4sBOgXXXdTBmRqqtC4g=;
        b=SWoEdC8nwKfkImJIKTBCuCxiXLZIevvPQnAx2tyIUCeUfk2yB0ExFvELfXDI3hsfjA
         iJ3IOXJxWz9HuPwCUaqpm5PttqJYzHgMMbbNFBnO4C5vEwFHyA8sBdwv+TzVFYZqC8aB
         0BV/pWLdYXOCxwgWQ6UYHHBEn0Iz+3UWAyFKcbhK7nRq84GhfJ55kkGwLdYkfFMw/ehA
         v3BwpuopRLiy16yAZgiUt3Tvzm9uQhSAGjBl2g06KR5Sn3lI835741anLc3W0P3oae4i
         ZpctNhv+5c1oDzT15WuG+DPovibGT2YVstZyJLy73piPNafnf2FbNEQbh4t41eu3qZew
         4zRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272319; x=1789877119;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A0CrISCG3enxLUNERhlMVwT+4sBOgXXXdTBmRqqtC4g=;
        b=mwMGwT+nyTyTmnuszAoZyKiCChjEgXPVJV9GUmdM2QxfLejswNObvlePpm6fX8SD99
         +R/wSweDQx8PKArufSajCe9aqkJamTQKy+XmjyQ0N3L+HAMvcqesGi3VGm/iXqHqFgMi
         1E3cAAn7ZfITgYU/oHbj0VxsyZceErxnC/iiqY4aF8SP9Vkbi2z7Bb+sa3yzMwPHmYG4
         I6BwAo92ay77Xxeh0c6jbmB0rPRs5L1ranT0Ib7USg90RvhWUNsMXhWTrpw48z2CShOr
         32KFU+caAmdF7zhn3+9H3sLn/WOLB/XlSlICL5PUnaJHw/oig13O12kXP1TUxu8jagZm
         0ECw==
X-Forwarded-Encrypted: i=1; AKwUvBybgIUXKBbiZp76AY9og0t+MP8Ffn2gU3ggciCeW7XrhT/cWwnDm7hzbcLb5SZyJkE61C+0VoYFVtN8Wg==@lists.linux.dev
X-Gm-Message-State: AFuF++nia0euDA/4vkPaQuWSAFmIlL2F8egsDL2vFgCOECiO8JvfjHEq
	4e+E0SGZpFQ9lwwjyKggWGjkTLnV+EXBKLuWV2qlFq/mchWO+oHDDUmD
X-Gm-Gg: AYBFou0Gi2hUm13OOwx2qjASJK5k0VdDOLeLBt7TOvQnMH/syH4P5QpYMLtMai/3mk+
	0zBZFS1FA3dn5IEVdXXheAyhh2BMieqquaKVKTdhswsL4gMH4R6wJXfzNp3guVsiiQ7Cpo0m1AT
	I0xkBeqGucrH1Ku6F9MDuY1BYtoMz5QcQ44sdx4zqp8aVquYCwYa9tTA2I+4I+Kr4pt6D4DO+nG
	pWi0Nt7aNvc1TMjH6rcp6qP0qxfQhxPXf8dodKL+XbnJUyEjUnB1rxdpCpHAp2BeALwh8Bm2heA
	WiYMvOxE0hjQo/a8cOu5+HI9EOa977NizjQybzEaRe7wzgs8w9yq+bLIpl8WFvfhSeDlbuzbErB
	1sepLOds3v8REEMyTHh0Tps6fSGYBi7ClV95qDwh7I5jyhRc4FHALaGH4IHNCvlkJcEzPAzTT+w
	I1esVzhw1qF02t1lRmLs5B1WzNZWolftBlf/gCLdAClMML+9Ri0Zf7Q2b27++Lu5lGt8fzuC2ro
	1zY6Wj2MUqZiclDdB7fqYWCGYSAzyDO7QEl+XRVDbHv2q+0zdwliM/UHDb2D2+rO/NL7uVspyHO
	9W3Vyw4Qi7asOTEziFgL5ptshF+Rg9kdpqH8hgp+txPtvJXxsjeerSNYKi+BjhEspeEf8MMQyQO
	YZvhrcFhS8kQfuMJP5wteqQxLYOJcgLyqdKCJ2JC6
X-Received: by 2002:a05:6870:9386:b0:47b:7862:c1c6 with SMTP id 586e51a60fabf-47f59a2cc34mr2957205fac.23.1789272319247;
        Sat, 12 Sep 2026 21:05:19 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699647sm6011535fac.5.2026.09.12.21.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 21:05:18 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 12 Sep 2026 22:04:59 -0600
Subject: [PATCH v4 08/17] mtd: rawnand: sunxi: avoid redundant column
 changes for extra OOB
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-8-4a64bed94229@gmail.com>
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
index 41d6560d7df7..13dc0af56eb3 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1509,7 +1509,7 @@ static int sunxi_nfc_hw_ecc_write_extra_oob(struct nand_chip *nand,
 	if (len <= 0)
 		return 0;
 
-	if (!cur_off || *cur_off != offset) {
+	if (!cur_off || *cur_off != (offset + mtd->writesize)) {
 		ret = nand_change_write_column_op(nand, offset + mtd->writesize,
 						  NULL, 0, false);
 		if (ret)

-- 
2.53.0

