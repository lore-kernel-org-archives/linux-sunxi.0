Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AF13E6DF7
	for <linux-sunxi@lists.linux.dev>; Fri,  4 Sep 2026 22:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788561574; cv=none; b=GJvD2VIjGl/olmJnC8ftwirVL8fr+TujenAKZE2u1rVYQC2YWnKdSsDaSfOsSQHtZi3OGaR5GXNPYGKS0LaeIhsaZUuHK6A5Dku1sTsx9WERVWz1z6bMq9RvPsEvZzoLvlZYa1IkfpvsbSz6SIVDFzbS05tfeNR2g+ms46Tcaio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788561574; c=relaxed/simple;
	bh=iBM2Aon1Yd8l6bN24Yt2ji5Rw3iayumL16MfoDmzTJ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=R1n252i8c6VbSvR3/IHAe6+l/7K4dlENRl9fK35JihVfrCRjgxkwcxImjth3z+qXZVTtHGpDn4SAqKhmKQHmG2SSMqexdWdBMchoiMb9tswh9qBEu37z84QFljqg1rOLdH7xEbxi/loHss72lG+em+g/28yMZxNoSSG7VwiTMSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cQ6tl30G; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cQ6tl30G"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6b145a9623fso861185eaf.3
        for <linux-sunxi@lists.linux.dev>; Fri, 04 Sep 2026 15:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788561572; x=1789166372; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5YxDY3gpgXUEyHB4LKpf5sbAqmUcywMUpLTIkNPDeQo=;
        b=cQ6tl30GsR7z4FOmOqhc0j3irQOh51Gx2+hIbqZ/35+UeLKMtp5oGvUy12cMGYFpDj
         0w0xJdvqkNp6YZPkOJ44HHwxfViI2kzqTDlQRvz9dxYY8UHtm90W4tjtZryW8zAkYoOI
         jKkuGQQ32jBpUkMVtHkYRBwKnt4OAumgiaAeBElsveEyyuP28LhZQaGhPhATPYAFdKM8
         EIQl7xJwx5HQ5xR56qkHDe5YXKmxBuAF0UrYST6JW+IKtRBxQ1sPFRLcONpvTgOnAP5h
         cabTiK1y13CtPvlgDchksefslprUZlRNgwWJp8F4k30pKnlBsY8UE5ywE/I750u/CuZb
         qjGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788561572; x=1789166372;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5YxDY3gpgXUEyHB4LKpf5sbAqmUcywMUpLTIkNPDeQo=;
        b=OYpLeolPg/PuTlnALXmDTNkTVcgilh3k/N4fe7UJhx7zeQ5fZQkSuP9e1VjLDZYs7m
         155Qkc73cQKkPABEZt/1FjHIx0bosjPnvFxtUEoItskBWqCctpeJs/OynJOCrw81g3dx
         CIc1J6Fqf5T40aieGjFYUxvnP1eGRnWkWyGUtXKcq0WfS/ADQ2SCuoLjNVRj9+ebppQU
         wFMG84lRDEek+FClZ42UY0pDtTyrniS9S4KGCURAsZnNGe+5UEm5ybljjrgjtJD3Yp9B
         2/FImTsoD2cr9ZiXSB6u5biMpeGmq8r9ucyoW6v59hidadmF7SiU2gLnf6MT6WukwTeI
         adjw==
X-Forwarded-Encrypted: i=1; AKwUvBxrc8unDcC63OcwetUpZVvuxiEdB5WhuNY9+0b0xLWW7hcQMYqXisqx4k0PaGwlXxvtSSJg8KLlLT5+dQ==@lists.linux.dev
X-Gm-Message-State: AFuF++m25oYPP3dAuTHR66fXDzOPj9HT5Ec4CTosreOGKZrbidqZV/A+
	iVY+SS7dJ5g4ZOFzXwQ6XoRKRwBSkoeXU+v1sK8pzoEkafEOxXgz3vC6YtEk1w==
X-Gm-Gg: AYBFou1H84iADmHGMc0tVU6kvtPjWvU5cJAgejN574rQYabjLuqCRM3RoVnsbMFtAc6
	3P3BOD3LliczqDwxw8tTxUbVPoyy0877H9lXGh2749jqSmpe9UY3IAnXeAkTIdvFCwLvBhsZRD+
	IWXDpnpWO/w6RfA3tfmlI6dS40vCU+jkRC69Iv7HwhP4iixC9oFIqSq+gki5/3+MkyMGcloffxF
	NNoBH9Sy7qEVr0EUVt7gFCclnQXFLEqxWXKlDRTLmZDOXqSvFh0WAVsELxR1iZMiiWqOdBaLHlH
	syjrblLrlVDKrG9veMo9AyDooPLTox1eYRpyYDn9sXEKSaRFOBGghAg12T3Z6JhudTQWT8Ib77L
	YOUS6L/TaKJQ7rla4q9TqFCABEDJYKsfB+JgnjYOuJgbG1qtduzebE0Rf9Baxy2u6PUqYk/5Rx9
	7y7dHVaw/NJC6GFbo8S+boTji0yOAB4eGEak+KqfHF7erCsw/3q6paF2D4X2tl0EKyWiNjt0bx/
	UAykyTWhhRdkvTsqf93m069jmgqgqvsH+FTjRLoZ68ko6fRmhYaQ5zFDt51rwlCmu1242c99pWj
	9WX1Zk00oNwmVE9YogQ/61LuRpKMcg2ucFf8ydzy0GfuPFwWrReIxisxp1l7oMzkhmCq2HDYnpf
	waF6acJKH/88NaK0Nexw=
X-Received: by 2002:a05:6820:1c87:b0:6a1:8192:4d89 with SMTP id 006d021491bc7-6b6fe2b1023mr6553755eaf.29.1788561572187;
        Fri, 04 Sep 2026 15:39:32 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-475523da013sm3488655fac.1.2026.09.04.15.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 15:39:31 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 04 Sep 2026 16:39:27 -0600
Subject: [PATCH v2] mtd: rawnand: sunxi: fit maximized ECC step to page
 size
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-submit-sunxi-nand-ecc-step-validation-v2-1-6e3ba6200948@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQrCQAyF4auUrA3EwdrqVcTFdCZqRGOZjKVQe
 nejrh7/5nsLGBdhg2OzQOFJTF7qETYNpFvUK6NkbwgU9nSgHdp7eEr10VlQo2bklNAqjzjFh+R
 YXUDitttS3w8td+DWWPgi8+/ndP63Q3dO9YvDun4AApqGjokAAAA=
X-Change-ID: 20260904-submit-sunxi-nand-ecc-step-validation-0e571088b5e7
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

When nand-ecc-maximize is set, the driver unconditionally selects a
1024-byte ECC step. A NAND with a 512-byte page consequently produces
zero ECC steps before the available OOB bytes are divided by the step
count.

The older sunxi NAND controllers support 512-byte ECC blocks. Select the
smaller of the page size and the preferred 1024-byte step, using a
512-byte step for a 512-byte page while retaining 1024-byte steps for
larger pages. Unsupported smaller steps and controllers without
512-byte support continue to be rejected by the existing checks.

Fixes: 4796d8655915 ("mtd: nand: sunxi: Support ECC maximization")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v2:
- fix ECC maximization at its source by selecting a 512-byte step for
  512-byte pages instead of validating the derived step count
- retain 1024-byte steps for larger pages and the existing capability checks
- rebase on the current MTD nand/next branch
- Link to v1: https://patch.msgid.link/20260811060651.227431-1-james.hilliard1@gmail.com
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 83666dd6cb2a..de1e6b49f79a 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -2084,7 +2084,7 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	if (nanddev->ecc.user_conf.flags & NAND_ECC_MAXIMIZE_STRENGTH) {
 		int bytes = mtd->oobsize;
 
-		ecc->size = 1024;
+		ecc->size = min_t(unsigned int, mtd->writesize, 1024);
 		nsectors = mtd->writesize / ecc->size;
 
 		if (!nfc->caps->reg_user_data_len) {

---
base-commit: def559a215699aa2f2d8ef98f30156b9d562a154
change-id: 20260904-submit-sunxi-nand-ecc-step-validation-0e571088b5e7

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

