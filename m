Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57EC4457CA
	for <linux-sunxi@lists.linux.dev>; Fri,  4 Sep 2026 22:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788560285; cv=none; b=HtMutWK78FW2CFwoJ7aZ7aclRsiGsyPTQ0jP9IIZByzH3mgkdTsv71g1beaQMlno0UX76fN5Wi52FL8SvEgS37uEntJtFYR4YNFZDqn/joCRyLcymKD0uPCPPGQKUBzrb+tCEfvnBDPk16B5KDC+VA81agFmD8KvCDc4YByrLfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788560285; c=relaxed/simple;
	bh=M3ljDf5cp1LAD/hxypnrKeBycVDg5CrbHCeWC0NTb5Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FKubaTlKRo6JlE1cKXI0TuXmQUZYru77tmVI80DaO3GSSfheJoZ5JtSLyskLRhsvL0DYNKBJ6R8e4alv0PW2HycPPRC82UEsrgWdfxq3aX3A73TtuaT2V1vc1TTvweV5IG44c9s1dIyeIgMwGkfdvfC2BA7Fll+SKuTUMZ4XZbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lp1E18yd; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lp1E18yd"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-4af81963f35so926053b6e.0
        for <linux-sunxi@lists.linux.dev>; Fri, 04 Sep 2026 15:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788560282; x=1789165082; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=937oNA2R/MB70KQ5+NEYQ+AXWnqJFM7/BAjPlSp0cIU=;
        b=Lp1E18ydfgOZ1FwOpzmhebLL3B+ugW9+8oq7aSG9ycdp5Ww34IxM0vajR5yYNx2s9x
         m6mZaFHV0tYml9pkbVTt7QWWghVONG2pxnVD9G8qH/PyfJup4E7pLttKb4vVgBWIyIYj
         +BAUrtUZC30nl9KzY8Mp3M00f/wAgR2DC+JE32Q4rjbBYPjNY3lWnpAh4AunM0wkCeVa
         TnD+7NiHfiYK3ig9G3uHiywpDxmTk2dSG/zg4ECeT9MyIZoPCmEzPLc/khtnXFxA9Jdn
         O8wttCjWXTEpY0oLA13toWrnCuvjAdx+qww+oje7rOuE/ztPqyny+VgiGh0oKhxzrmmy
         y60g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788560282; x=1789165082;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=937oNA2R/MB70KQ5+NEYQ+AXWnqJFM7/BAjPlSp0cIU=;
        b=nZIWE3Zs0FXVLRVAFLm2JI56omGrhLbbkTA1hymNGrFrmHld/ijrJiyCK44LT527NX
         xo/Cc8q5Um3XXL/9q3sv8KUfdCXMVPxR+DA+1BqYDlViaSGkt62GHhAzZpMyogAhiwA4
         bR9zBq1VvGByRuh00rVMCAR/3ZDap0U/+06vXvjd8F58XufQ8bw9JQf5ZidSNWyRUrG9
         /e8/P9kcKHMpphdSmmkJtFL2lvNqFaSVeM5a/SM4KFw38DvPTJETVqEOPIvldmfCfnPG
         DxSk4rHMY0Vtjn+2R2Kps01FHWR57G9wlsbfCtFi+jPIn16d4tnCUY/lN8KnISkWvBke
         y9fg==
X-Forwarded-Encrypted: i=1; AKwUvBxxeoWS7MsZFNnBsXZJXze/QgJa4YzU7khsdMEQzHWb/EdSa6aEOF1CezkUESJrHsvo+1E6F0Ka3QToCw==@lists.linux.dev
X-Gm-Message-State: AFuF++n9txfAuUOnM8JLcnkhmwxg49PMhnADHrfV9UEn6NAbzmBMNnS7
	FNWwaKDOUt54BGvg6ByhqdZwbdAvYVMBePsGlj3inL5XLmXcRlSuWWks
X-Gm-Gg: AYBFou2jD+DBDgHSTdV1TGBbhTeL6W9dEGLOmiMgUvmjJc/lJsNJtnLm9fhxc1AYCN9
	b/DRCB5sahPkAsJZ0XRskRgm40vuxzK1ttCHX9l354JV+OKlBBj5i2fyLLmYksmoSZea/O0z+7x
	R6BGYzwm/oYiMHMZcwRkUEtUxCOfDGUszddQZt84WqiEQeUB1znwJZ5ACUA9kDVODogLd8mnfoR
	7CxfsOOdhBJz+VOjHDXPkWbS/lnIL5mg+U3mCYqNIg6ateGoqI7oNYaJDL4TTbjGriz6Vrdhauo
	M6tO/Ccx/Z0PuMt1UgLsSMEqzPqOIHxdGGP1kmejc5m2NL5Hmx6N+1kfZL/mbc6t5NSWuAtVSlw
	dPbfcxprz5wKexcIaSDyVjCZlkd0qkQA7rhVYCI9SMD8jRO3kcECzhrJmA+q73NqQ6OjC/WHjC3
	bp1g+4glrcCUdBpQTFATabKaI1HAiaB5IO8xXmiF8I5Zc+5wCXxmra3QEyYUWXaMHEpVkS8ULiF
	t4AM01sRzidUl81dh+JULxEfDs/8epkuVqfe+YMqiU6dXPJL9pqNcf4bYwEV48POxJ2xgzrSjxP
	BxmCrEnPw9eifkDcpJq1PKriDhf6gJqzA+CXpNngzlPa0i7l1JLrKpKeKmIR6jPMAoVNMwqZ0Ag
	PV/ly9YyHbFCIGHu81g==
X-Received: by 2002:a05:6808:6807:b0:4a3:fb6c:9adf with SMTP id 5614622812f47-4b9622c35abmr8613617b6e.12.1788560282554;
        Fri, 04 Sep 2026 15:18:02 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b971c8ed6asm3718199b6e.17.2026.09.04.15.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 15:18:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 04 Sep 2026 16:17:58 -0600
Subject: [PATCH] mtd: rawnand: sunxi: fix free OOB section offsets
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-submit-sunxi-nand-free-oob-offset-v1-1-cf389b9ac94c@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWN2wrCMBBEf6Xss0trLC31V8SHXDZ2hW4kiRIo/
 XcTfRrOMJzZIVFkSnDtdoj04cRBKpxPHdhVy4OQXWVQg5qGZRgxvc3GuYYURtHi0EciDMFg8D5
 RRu3GyzIpP89+gep5RfJcfh+3+5+r5Ek2N3FbGJ0ITdRi11Zt2fXN3AuVDMfxBUIgyQelAAAA
X-Change-ID: 20260904-submit-sunxi-nand-free-oob-offset-ad43962f77f9
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Richard Genoud <richard.genoud@bootlin.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The sunxi hardware ECC OOB layout places protected user data before the
ECC bytes for every step. Since variable user-data lengths were
introduced, free sections after the first use sunxi_get_ecc_offset(),
which skips the protected user data and points at the ECC bytes instead.

As a result, the MTD free-OOB interface addresses ECC bytes rather than
the protected user data for those sections. Use sunxi_get_oob_offset() to
point each free section at the beginning of its protected user data. Keep
the special two-byte offset for section zero to reserve the bad block
marker.

Fixes: 54dcd6aa69db ("mtd: rawnand: sunxi: introduce maximize variable user data length")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 83666dd6cb2a..559b42687b1b 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -2013,7 +2013,7 @@ static int sunxi_nand_ooblayout_free(struct mtd_info *mtd, int section,
 		return 0;
 	}
 
-	oobregion->offset = sunxi_get_ecc_offset(sunxi_nand, ecc, section);
+	oobregion->offset = sunxi_get_oob_offset(sunxi_nand, ecc, section);
 	oobregion->length = user_data_sz;
 
 	return 0;

---
base-commit: def559a215699aa2f2d8ef98f30156b9d562a154
change-id: 20260904-submit-sunxi-nand-free-oob-offset-ad43962f77f9

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

