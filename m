Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B06B37C903
	for <linux-sunxi@lists.linux.dev>; Tue, 11 Aug 2026 06:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786428433; cv=none; b=WBh8mGx9aTB4RaHrikoSZ/J8nBOnmqXPmMu7/a3I653ZpvCstBdOf1h4zJRSRX5Cl2mRMAETnj0M/JZJ0J0Njx/H9amSG4QLNWL6HQBJ7PIqI2Tl4dnn9XITg2bIV1DaQ0NSKNxYzqU+m4uh7w+sj2EbaAenVBBVK2jh5YuQXBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786428433; c=relaxed/simple;
	bh=cO0EPT1bPIG49AtzxircCgFULQ+dKdZXtNn1BWqEQV0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IVVDUx3NaVHzx/SXrTLg39RgKZkEu+3YvUAF6zJgMxm0yGD/n5ZudrnYvCXtF2NUWCllCtJd8gRHOdh8KNJV1iCpOmvptWKBl7687Wd0UJDHZRAPA7d6teeWYuS5D9w2Hkgb1GmXRuPywGePVS5inJTkzJ5dNjWjagg8RnwqWb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cftlmv3R; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cftlmv3R"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-4472500e25fso1167025fac.1
        for <linux-sunxi@lists.linux.dev>; Mon, 10 Aug 2026 23:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786428430; x=1787033230; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PQogJxVcWHF2/s1gpFEzMjsDacnUmvO1LDzMrn00kZM=;
        b=cftlmv3R0RX/fFX73P2loSBIFUZcJTKhelx+S6SAQVEeQfNfnJpoXoU+buCWnYy1sb
         atJNvOxRdFG6vvEyImH4k/49avjLjy3KPS7K7k7bq6jFyoIrkP0eUq07e5FO+Kaswfzr
         lDWwSMjL1BOkjZrAQHN6KNNi6Q7dQmY/m3idPp7UL3aOxJC4GfYaXSQyTnG6ywnaEWkn
         /fjEFIHir5hA53iUNQb7mbKebuFUe8UoeFKfxk6+v6iT/Zn7itfCKRBr9uIowk4nCk2g
         VB+dQZEpdOUpyFthP6To8CcGEEzGVkIqX75NnKmroSp5t2CCj6vBjIiITNyHjaWQBpwn
         4pVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786428430; x=1787033230;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PQogJxVcWHF2/s1gpFEzMjsDacnUmvO1LDzMrn00kZM=;
        b=MbClYBkkGrzFZfTCBfndGCjF2Ymc54nqD9sQd8sKUjYEbA/wKhuvUxanVc42OXWlJ7
         EWQM4q2axTKMIGbBDAajOl0tL26+baI87m5JMMJWrMsaYOGwCrRyBvDEQwQIRD1h2xxk
         9Ahc7FB2aH39irOY6TVLptvv2I4DDFUJ+7UxeZlatwqbJv4tzfeLJpGRP6vNJ25swzc2
         zlnY7v7ElfKWmYjG1c3Mg/9JeVKTrtYXAfdu7XnZsK5QP5WT9ozfgPm/cqAOujVBU8eP
         yKZtycShaoJ39WRMDE+3/okflDjlsaC15j/Q5cqRv06GlNbE+rG27Pbu6NagLVTWHLlz
         wdwA==
X-Forwarded-Encrypted: i=1; AHgh+RoQgMzTotpHwLy42E224iQajCSkGSuXZGiYpSZEW2CRgwVIg3CbhfgS4FSgHCFE+kHvNAyGONlR67smUw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyxdcpFGDozLbM8QqLJ78rTgBzHezL125NoeFcQLI9lT+N30941
	y0tbAMj/Qj8TY/2xr0UK4+b1/jpolFIWkkmgeF/o3NA2cqQqJqFqAJcj
X-Gm-Gg: AR+sD114zyXGIpmO1Byqr+YL7o0C8K5LDGjygG1X+imNWBeV7AN2x1eXo/XhYIOb4U9
	QU30WcqNJ0Ef0Ty4G0g3DDGcTJE+runtsDmbrAKV8vBcvzRYa5Az3m5q4WtYDYhCYUfrM4XjLk7
	MZcmaDjNh1UPHT1GNZ4+yBbOenkTx1mndQwvts7PYVsdZs1/nXd5K0CPtX3CBt7CcZ9AG6968ld
	iF3Z011zVxM2ZaESnt6gwTcUXGpCUwDV6r52DbW/3J1fbX5fdk7LoNMCBGcVGMxH6QmfwVE3+HB
	NlJZTy5Aa4l+TJnR+C3qIVxnF0/orU6Yk/FQ0J59bfF+r8LPID4XELeYyWCJ2EIksznBWa0VF9/
	6OQjQryVSRffpAoz0NQx/luj2uUFMsEM+yLW3pKvAMBpkMYk39iUl5mnhJOS0aBTa7W/PNwd1DH
	IVI2O6dB37wyZuQQY09C0lo4ckrwuIt67B4GE7XGcgUyItnbuWm/4sDWPwOFUPZ8v2soikfLL3Q
	EAXCEG7aPhCFNQgufCZF8mgNzbUyYOxMkG9Pl0O4gE6xMHs0OFELtssttfGPVtG6YNjgXCdmDWf
	pS7jFMxJ6cqHFMGXy7sDLNW1/DTmEErQ1A5x7KLwF33kWipdrF6uCrGZpXv+KUBW9yRyj6WmmBm
	1G+11K8hgSFcXNq0UNIg8X6TB30gFrYo0cG1Exg==
X-Received: by 2002:a05:6808:f01:b0:496:2b3:ae71 with SMTP id 5614622812f47-4b1fd9d2e1amr577795b6e.18.1786428430385;
        Mon, 10 Aug 2026 23:07:10 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b2001331d2sm98211b6e.11.2026.08.10.23.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 23:07:08 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: linux-mtd@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: James Hilliard <james.hilliard1@gmail.com>,
	stable@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Boris Brezillon <bbrezillon@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: rawnand: sunxi: reject invalid ECC step sizes
Date: Tue, 11 Aug 2026 00:06:48 -0600
Message-ID: <20260811060651.227431-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ECC maximization forces a 1024-byte ECC step and divides the
available OOB bytes by the number of steps. A NAND with a smaller
page therefore produces zero steps and a division by zero.

An explicitly configured ECC step which is larger than, or does not
divide, the page also produces an unusable step count before the NAND
core can diagnose the configuration.

Validate the step size at both points where the driver derives the
number of sectors and reject invalid geometries.

Fixes: 4796d8655915 ("mtd: nand: sunxi: Support ECC maximization")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 45ccbce91551..ad314c0e30b2 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -2032,6 +2032,15 @@ static void sunxi_nand_detach_chip(struct nand_chip *nand)
 	sunxi_nand->user_data_bytes = NULL;
 }
 
+static int sunxi_nfc_ecc_steps(struct mtd_info *mtd, unsigned int step_size)
+{
+	if (!step_size || mtd->writesize < step_size ||
+	    mtd->writesize % step_size)
+		return -EINVAL;
+
+	return mtd->writesize / step_size;
+}
+
 static int sunxi_nfc_maximize_user_data(struct nand_chip *nand, uint32_t oobsize,
 					int ecc_bytes, int nsectors)
 {
@@ -2078,7 +2087,9 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 		int bytes = mtd->oobsize;
 
 		ecc->size = 1024;
-		nsectors = mtd->writesize / ecc->size;
+		nsectors = sunxi_nfc_ecc_steps(mtd, ecc->size);
+		if (nsectors < 0)
+			return nsectors;
 
 		if (!nfc->caps->reg_user_data_len) {
 			/*
@@ -2163,7 +2174,9 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	/* HW ECC always work with even numbers of ECC bytes */
 	ecc->bytes = ALIGN(ecc->bytes, 2);
 
-	nsectors = mtd->writesize / ecc->size;
+	nsectors = sunxi_nfc_ecc_steps(mtd, ecc->size);
+	if (nsectors < 0)
+		return nsectors;
 
 	/*
 	 * The rationale for variable data length is to prioritize maximum ECC
-- 
2.53.0

