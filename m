Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A65FC2C6
	for <linux-sunxi@lists.linux.dev>; Tue,  1 Apr 2025 19:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743535440; cv=none; b=B93rGrjovZ9JM/Zd6YTQrFlzDUwyss4FvRoWFuE/1hQCJNHKu4zDp+ebcieI4oN5cKN9iRsztZs6dkzh3ShLyPoNpxDWvnIihLE7Es1kFnRvJnpsjRCx0QXJ8mqvbrAO7ZSu+gN1zE+htbOEiaRPsaUZ4GfHgDKY85ZDNdT//Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743535440; c=relaxed/simple;
	bh=/4EojNlyd9dMoLRzf5Mm/q8bty3ZBw5BXSWBsU/clpE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EjPTIaDbfXs9I+h4GoANZS/A8yjY4Y1t+fccMmFP5DHqMFvTEWm1gNeP43Yw4MyIgLazRlGhPUws3O6aVAoukuZcCusXQz14xUOinzGHr7uaHl1eQ10I4sSi/phymQ5s6BBeGyeuJH8Zrg+t5Vipt1FHAOI/EVUtu9kmmrS6z74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W62SlcmM; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W62SlcmM"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39c0dfba946so2494963f8f.3
        for <linux-sunxi@lists.linux.dev>; Tue, 01 Apr 2025 12:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743535437; x=1744140237; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nierB4LEgce+4kZQOSa3FNbylwS0gDWPVPBM7TYut2U=;
        b=W62SlcmMR9yeq02SHX6oa6LzP7AfPeiU6YebnglTFIBc8TRG1m/RlZX69ZJniOFf7D
         Yn2kXH2kLw5neJpMBkdXsQturoom77EVa2XkLGs65Wup9l8xPKiVvULqmajN/JHMK+3q
         EbjaT2RrTUo8W/6tuDLdosq1flJlpz39v88TAp6m+jyLEmsM2qZTs+JAUSi4Oogf+eTJ
         ADu6jz4cQHWEKsXVMVXQmX7KIr3A6Zv2OHub7DHezdIpg2IRrdlBoo23nNLiYOUwRDuW
         EgHUInMFllC514/B8mias2Nd66KKGH6Y5XEZ8+NcqDuh3i3zjDHOIK14kJ/XX1KPFaj2
         GlZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743535437; x=1744140237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nierB4LEgce+4kZQOSa3FNbylwS0gDWPVPBM7TYut2U=;
        b=o5iEhxJVFyXxAxSFDvDhC4tq8xDJvjLHVc4avq1WRFc/O/5kJv5+pyiibDIGRY0ZUP
         R6r1JtZ6fSRkOz1cjj+ZoA/WrwJUw+5d/hDUlH84ywhivsFpKG77uoGZhH+y2VaHWX2F
         H1vmuSfFljKEzPQ8qvdqbRf3o3nlZgIDqSdAwcj1dk/7+Aj8fC7mX8h3U7ty0d/smqn5
         bwuRKNvcUepIF+M/HpsY1o+GkOQttNHy6T2LU1RM9X/GXKr60oPUSYT7vFOmGDaREoHI
         Z7ZP1coBq5Xc1UpOGHAK8LonVeRzaBcYNm7yL0XeY+5QFEjuLoZJqjX4bwCXp9ijV1K+
         Rclw==
X-Forwarded-Encrypted: i=1; AJvYcCVd3U3ebOu/wZP5aimjqIhmBCzriiQchLtcqfBj68YT8qEGkY9qkSnYxrJcnNTqfJbueIjA1wBP/PHtCw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5fUSJNglcV275U1sMZd6VLUsKAQr//uKBIWRGnMg1rqwbLUpd
	kuD3uei63hkMxDDw0kA5v3kynCkH13uXKPtRjniWTmsH/gEf0gpkuFervw==
X-Gm-Gg: ASbGncv1bV+KmacVZBGn3QSLz1L0s1vn5zHapfdUlHtnvc1nrvyBtHURQpaeYufUdlN
	wbyswmcqmYKISeWeFIlzmlI+SNxTzUHdD8zRp9qgXQubk/U4vY/xhVeKP2nNySoREeAEUf3Wd+3
	+jcP0vkVEZ1PIPkUUzV7hkstcrKpxMMfcl3N2iBQb7VAQojlRrRlPm4ZO1dHvnnEwKx9f17GcqT
	4RJ0JP08QWWq3dL5dbKE1XeRd+EB/Ko+o2OjsAXfBu/J9jHLUQzeyOaoXK5oKMdmCMVAzqOWKyi
	cugPuxx5eQRrYn6VNMr3R8yxDZysTOd+LPsXJHr/S5ESm6rO6IwbvrZz8ub47cSGYoxJsWLD
X-Google-Smtp-Source: AGHT+IGHyzi31e3692ONFiGCVRk0AOakCuPS3Q8lpPUYekXyBseRhASvcdujfWAcxWGfSdab5h7ydg==
X-Received: by 2002:a5d:64c7:0:b0:391:4bfd:6d5 with SMTP id ffacd0b85a97d-39c1211d5c8mr11428784f8f.52.1743535436607;
        Tue, 01 Apr 2025 12:23:56 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:c50a:8800:cf9e:ee0b:4a01:37f6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b66aa32sm15353438f8f.50.2025.04.01.12.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 12:23:56 -0700 (PDT)
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
Subject: [PATCH 1/6] crypto: sun8i-ce-hash - fix error handling in sun8i_ce_hash_run()
Date: Tue,  1 Apr 2025 22:23:16 +0300
Message-ID: <20250401192321.3370188-1-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rework error handling in sun8i_ce_hash_run() to unmap the dma buffers in
case of failure. Currently, the dma unmap functions are not called if the
function errors out at various points.

Fixes: 56f6d5aee88d1 ("crypto: sun8i-ce - support hash algorithms")
Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 .../crypto/allwinner/sun8i-ce/sun8i-ce-hash.c | 34 ++++++++++++-------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
index 6072dd9f390b..3f9d79ea01aa 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
@@ -343,9 +343,8 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 	u32 common;
 	u64 byte_count;
 	__le32 *bf;
-	void *buf = NULL;
+	void *buf, *result;
 	int j, i, todo;
-	void *result = NULL;
 	u64 bs;
 	int digestsize;
 	dma_addr_t addr_res, addr_pad;
@@ -365,14 +364,14 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 	buf = kcalloc(2, bs, GFP_KERNEL | GFP_DMA);
 	if (!buf) {
 		err = -ENOMEM;
-		goto theend;
+		goto err_out;
 	}
 	bf = (__le32 *)buf;
 
 	result = kzalloc(digestsize, GFP_KERNEL | GFP_DMA);
 	if (!result) {
 		err = -ENOMEM;
-		goto theend;
+		goto err_free_buf;
 	}
 
 	flow = rctx->flow;
@@ -398,7 +397,7 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 	if (nr_sgs <= 0 || nr_sgs > MAX_SG) {
 		dev_err(ce->dev, "Invalid sg number %d\n", nr_sgs);
 		err = -EINVAL;
-		goto theend;
+		goto err_free_result;
 	}
 
 	len = areq->nbytes;
@@ -411,7 +410,7 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 	if (len > 0) {
 		dev_err(ce->dev, "remaining len %d\n", len);
 		err = -EINVAL;
-		goto theend;
+		goto err_unmap_src;
 	}
 	addr_res = dma_map_single(ce->dev, result, digestsize, DMA_FROM_DEVICE);
 	cet->t_dst[0].addr = desc_addr_val_le32(ce, addr_res);
@@ -419,7 +418,7 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 	if (dma_mapping_error(ce->dev, addr_res)) {
 		dev_err(ce->dev, "DMA map dest\n");
 		err = -EINVAL;
-		goto theend;
+		goto err_unmap_src;
 	}
 
 	byte_count = areq->nbytes;
@@ -441,7 +440,7 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 	}
 	if (!j) {
 		err = -EINVAL;
-		goto theend;
+		goto err_unmap_result;
 	}
 
 	addr_pad = dma_map_single(ce->dev, buf, j * 4, DMA_TO_DEVICE);
@@ -450,7 +449,7 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 	if (dma_mapping_error(ce->dev, addr_pad)) {
 		dev_err(ce->dev, "DMA error on padding SG\n");
 		err = -EINVAL;
-		goto theend;
+		goto err_unmap_result;
 	}
 
 	if (ce->variant->hash_t_dlen_in_bits)
@@ -463,16 +462,25 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 	err = sun8i_ce_run_task(ce, flow, crypto_ahash_alg_name(tfm));
 
 	dma_unmap_single(ce->dev, addr_pad, j * 4, DMA_TO_DEVICE);
-	dma_unmap_sg(ce->dev, areq->src, ns, DMA_TO_DEVICE);
+
+err_unmap_result:
 	dma_unmap_single(ce->dev, addr_res, digestsize, DMA_FROM_DEVICE);
+	if (!err)
+		memcpy(areq->result, result, algt->alg.hash.base.halg.digestsize);
 
+err_unmap_src:
+	dma_unmap_sg(ce->dev, areq->src, ns, DMA_TO_DEVICE);
 
-	memcpy(areq->result, result, algt->alg.hash.base.halg.digestsize);
-theend:
-	kfree(buf);
+err_free_result:
 	kfree(result);
+
+err_free_buf:
+	kfree(buf);
+
+err_out:
 	local_bh_disable();
 	crypto_finalize_hash_request(engine, breq, err);
 	local_bh_enable();
+
 	return 0;
 }
-- 
2.48.1

