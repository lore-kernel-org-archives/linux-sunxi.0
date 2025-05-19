Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF56285412
	for <linux-sunxi@lists.linux.dev>; Mon, 19 May 2025 15:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747667674; cv=none; b=PCbMiMd7XAJhOBJeBuQCv4vbvCDuN5ZfCdIimOFzKfhes6JD+N3XD2c9Ty3JqlBRg4TBTsvaw5J+CYyB/m3X+VBeOTU/QwyRDYZMlJpEfWlBWZTPSDBgMX25l8Kd/XfOePDrc1zNl2lxcJyBEn0vK2/w/5kUAgnFHjZr/5Qrk8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747667674; c=relaxed/simple;
	bh=jBoiZ2GaWcghwbS8pyGx4WZcTi5x2cK8RY/sPEKxu5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VOYKJFFyOpn9XRN06qTfvIAlyC/gEOPSYxVs8inQ5z8xrHviOzjKridzdNH/Mq1Kyz11deHWysiB9sbrGum47BwxAwwahK2ncKFL2MioZQSiijsncdNdM5HbztgRqnYVfyussRYpA6UOr6RBg6dK+FELJd9Zi9Hx0tNnjbQa1uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nkj2bqd9; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nkj2bqd9"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-601afe51106so2432573a12.1
        for <linux-sunxi@lists.linux.dev>; Mon, 19 May 2025 08:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747667671; x=1748272471; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AzPLTyR8BLY/EVNJO6GgeWhpConHv27PYp6Y5vYD5J0=;
        b=nkj2bqd9OnQHh8gB2JO6rYNZjjbuIvxwrToKued5DW3qmGGS2i0HyEzNCfob7Jl5b2
         98gYsBo8a94FXH0IBFrD9qtsVsekZU7tsbEb1EfF0RhmnRZEHQJNcjcBUqqXDA2y7mp+
         xIOWRqZha/m5QWKSncSpzwlcw60F+ERViBmLvbzxOILdAmrZczW7/0V/CGpaHdX56sNH
         XECKvEcQKkmkpxDD3rjqIdskJyErZhiJ5FPPxnzDK54a5tMYcWemAgVBQmjLAJ/VCYIv
         bnA+og4KQvtjg5Zql1Bh+UFaB4wIitxWXX7283SLhFd95Eox8/DLWJhD+CJV5zix4Pk/
         fCOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747667671; x=1748272471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AzPLTyR8BLY/EVNJO6GgeWhpConHv27PYp6Y5vYD5J0=;
        b=wl0pYQGSrvngnhRaTnLm4jVfenRJUovlbx3VcRAhqDxdQgDwkTdLM3pP9NgakdpSyM
         BezdTaC2cQmy6LCcwu0tCbMaAKY37HJeU5QMsxYxy+jSZ0ZNc3ACMMJmRTeFd8KwcHNY
         QaqpRagDqNEQFppAJJMbWSciqjC1yPO4cN7G7JJVsYg5ZJG8T+GBChQK5180htutVln/
         g/pFKhO40iLw2puyJWJ1oL8WY+fglEPvU61UVfSyts2SB2DIf6bAuYcxaCqBaMYwTU4H
         pSo6Bli8lhzpUHDKawfx2KUQ+r6Brc2sK2Irf8VXYVkDhPZA1Cjf72vD/1svUHzTfE0S
         ieOg==
X-Forwarded-Encrypted: i=1; AJvYcCXOChHCOryhYVtU12qde2G7KzibQaHNRdFryNvtPLE3aBQVFLEqnk9U2MHK3lE+jKWHXQF2rv+h6rnIig==@lists.linux.dev
X-Gm-Message-State: AOJu0YyekXajuhtADNI7WaSm/KQtqFuk7WzjwhntwmNo9mA7uc72IINd
	0/XPq2Sgt20MvaXoVu7nWZQMN9++W+iWaDNITLlUpdsfSBwdziKv4guP
X-Gm-Gg: ASbGnctUskHtanWYVnrnR9UcAuSVOP57xe8EakFm6jCh7nuOkuAtxa4f4osEQ+LoyyF
	YUnAxPsPkxtm1qi+gTXLW7/EOEXlTpqckk11hAgk/aAMpLPr94Uvrl/IROE+KYG9L6+XN2Zk6/h
	JttcbBSyJllb5u5GwQ6Mtb136vBs4opRJgKIrENJ12oCeEVJFMCFVRrPKGn64HNPiFCY6zThwTq
	LHbYl3EAXq9GSZyPNyXcMEIkjYys4YehaDFVkI+k7gWTMzzy5ajf9tZu8Ag0fPNmxaAsbiC44E9
	t/f0OH5E+NT0Gg921VAaPrwL2yZPKlX1U8G8jamPlffKd/4OMVXDpAAXWmbbku4Av7cYWjWceS5
	OC8k=
X-Google-Smtp-Source: AGHT+IHgJ+seY57z+XoTNGawx66JWeSgri2TnpAdEN3iSpX2I08ljlzJynMEjU7v1ngmRpqeLCLRKA==
X-Received: by 2002:a17:906:dc93:b0:ad5:6ca3:c795 with SMTP id a640c23a62f3a-ad56ca3cb15mr472987066b.33.1747667671489;
        Mon, 19 May 2025 08:14:31 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f07:610b:a400:6472:d2f9:d536:4c30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d04b08bsm608522566b.13.2025.05.19.08.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 08:14:31 -0700 (PDT)
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
To: clabbe.montjoie@gmail.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	linux-crypto@vger.kernel.org
Cc: wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Subject: [PATCH 3/3] crypto: sun8i-ce - use helpers to get hash block and digest sizes
Date: Mon, 19 May 2025 18:13:50 +0300
Message-ID: <20250519151350.3442981-3-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250519151350.3442981-1-ovidiu.panait.oss@gmail.com>
References: <20250519151350.3442981-1-ovidiu.panait.oss@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use crypto_ahash_blocksize() and crypto_ahash_digestsize() helpers instead
of directly accessing 'struct ahash_alg' members.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
index bef44f350167..13bdfb8a2c62 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
@@ -342,8 +342,8 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 	algt = container_of(alg, struct sun8i_ce_alg_template, alg.hash.base);
 	ce = algt->ce;
 
-	bs = algt->alg.hash.base.halg.base.cra_blocksize;
-	digestsize = algt->alg.hash.base.halg.digestsize;
+	bs = crypto_ahash_blocksize(tfm);
+	digestsize = crypto_ahash_digestsize(tfm);
 	if (digestsize == SHA224_DIGEST_SIZE)
 		digestsize = SHA256_DIGEST_SIZE;
 	if (digestsize == SHA384_DIGEST_SIZE)
@@ -455,7 +455,7 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 err_unmap_result:
 	dma_unmap_single(ce->dev, addr_res, digestsize, DMA_FROM_DEVICE);
 	if (!err)
-		memcpy(areq->result, result, algt->alg.hash.base.halg.digestsize);
+		memcpy(areq->result, result, crypto_ahash_digestsize(tfm));
 
 err_unmap_src:
 	dma_unmap_sg(ce->dev, areq->src, ns, DMA_TO_DEVICE);
-- 
2.48.1

