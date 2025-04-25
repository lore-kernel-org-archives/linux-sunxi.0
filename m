Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314681F4626
	for <linux-sunxi@lists.linux.dev>; Fri, 25 Apr 2025 12:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745585150; cv=none; b=ozCRrxkvJ59BFVLufPKFjmh95P+vDCJfvsacuJEJnESVdSgC94U5ccq3g7nH52tn2hPuHHaADhlapSZBFZ6Ttv6XDomvK3MmCyovFbO1Qp5vjJls2A1sPSMvfV8/rkPmbPR8WOHbokTSIUzH8MLB320v2aXKr4BwaGL+rwkvxW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745585150; c=relaxed/simple;
	bh=N1JqJa/Thtcgbai7AXn0UM396DEB6usJBO8fHeX8CeQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TbU2Cyqvf6egm+YUVzXDJ7GlUYeoIXOK7vUMDkIA0uoxi/ikH+A9ENATeHtzAcZFdY8dQ6BhC1dxgh88tGeWBW4cp+AeA7jBUH11SYE1HqFO+M4Ll5dNFhxogDcGhwPZHovjIJAXeRiXFrl2eYmxbc5aWFrbLSvIAmD9NE+Kk0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cirj4Daw; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cirj4Daw"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-acae7e7587dso342233066b.2
        for <linux-sunxi@lists.linux.dev>; Fri, 25 Apr 2025 05:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745585146; x=1746189946; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l3BCALyVfXKt+WZYBHxbyWx+XxVRkGCfaI97XHpd+pY=;
        b=cirj4DawidzPy4MmxWSZagM6Sq9s9OuUE/s3pT2LCukaEQ9yKFwaKIBapX4z+zvD+2
         85wElBW48tmGN6cUS/G81SIDM5KwFpULw295YVfOD8PaGqvCiWyCXjOGoTLOvCMI1H5b
         lrKbwYuDfHNqLs+fDLALw+vSrL/1fre6k8DLHWtszgYqCK21dTH/YK9690TSs/a1Frmv
         VA9z3tOkiLSG5Iow3pU9dv5VEKnR5g38Fu9zOilezb9qVECZivbLeHYajcnqYdnpLhmm
         kZ9Dx27yTNNg0MxTe4Nw3UB2WnH7DatI+2hOuv6CfqIkw9CWvdhFxO8ApX3/UZ0WdUQw
         pmUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745585146; x=1746189946;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l3BCALyVfXKt+WZYBHxbyWx+XxVRkGCfaI97XHpd+pY=;
        b=LwxiITo5L4Ux3jqoIMR6YnQpGRLsSUxsnd7T1T48lsXrqe5OY6PI8W7d8Rtp/Z6klg
         FJhtvBBLjxi2yyttD4G6zEUjfCQS2q9QLH3rRTTKsk6/vBFlWH21nmVby2RcR7EAxxJy
         Gslz0+NMnquiOJihvP2BuaVBN/TdzFdJXUnpyYTyj++V/PbbB4WCKWephMMYkOqK4zKC
         JL2dt0QrPmQT+9C9w6Tpt3SQMZISb4MjzeXrIUvU0Izq0mE8WIlNhYj7mdoE7MNtgEoM
         zgxlJv3fWnBWtVpdxlvtEiijqKjGb1sdqTAukviCTshcnejadZeaOYxAqzIthSpJv9yN
         AIrg==
X-Forwarded-Encrypted: i=1; AJvYcCVOG+5nKiFAS4eMeq/i5WPRJmI8XAhx9Gn4S/qOk2z72YFjUwORrxmlc68Yj3G+m+MhSxoUGe+jYwJ62Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzLMxQNx/dxehTwyeJYMVGXe90Ipdt+oH6UWUm3v8plxYLsN8L1
	eFBTjxs4pM9E4aB8/GeTNy+JptSf6TJNs1oGPEPhfBgd+dmlFBWT
X-Gm-Gg: ASbGncvmkXKTFw2JMBtouRc1nVfMgEkaYZuqb0gO1JV4i3xUYB2Slbc9CmuVrxWGAay
	Anpei2fuEFhSeveWEPxZAD3DF1xRmOsMNRR6r3I9Z4dZga3tzpa3LE1JGFXsAZyLrTah1aIYpJQ
	z/aXrr1yW/RvILQhavbV2yWTXcxZFIYaMFa1RJ1mL9ONdGPJQBGlVdN0Z3jxAG23+19e/WUL7MA
	5DRRQv34IurdIjowORf7Xo4z5TU/dTlk9MHrBYbWfDlnj3ODQlLTYShjWzs9jtRjndspxiIG6cX
	vwfB+NgaErhWm50hr8uqmGnG7rg4DwOy62pJI4hMFt20Df1BALB23e7arDSgP1dP4BMZFfmVHiY
	ziy0=
X-Google-Smtp-Source: AGHT+IF6lACxg5XQV9zx3XY5JZvnZc0emetlxi1pM+qXxla8Kdp3t0Y/dF93JbbLv9LE6OFyvzm8+A==
X-Received: by 2002:a17:907:1c29:b0:aca:95e7:9977 with SMTP id a640c23a62f3a-ace7113336fmr191137166b.28.1745585146266;
        Fri, 25 Apr 2025 05:45:46 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:c50a:8800:cf9e:ee0b:4a01:37f6])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4e7094sm134641766b.56.2025.04.25.05.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 05:45:45 -0700 (PDT)
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
Subject: [PATCH 1/4] crypto: sun8i-ce-cipher - fix error handling in sun8i_ce_cipher_prepare()
Date: Fri, 25 Apr 2025 15:45:14 +0300
Message-ID: <20250425124517.2225963-1-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix two DMA cleanup issues on the error path in sun8i_ce_cipher_prepare():

1] If dma_map_sg() fails for areq->dst, the device driver would try to free
   DMA memory it has not allocated in the first place. To fix this, on the
   "theend_sgs" error path, call dma unmap only if the corresponding dma
   map was successful.

2] If the dma_map_single() call for the IV fails, the device driver would
   try to free an invalid DMA memory address on the "theend_iv" path:
   ------------[ cut here ]------------
   DMA-API: sun8i-ce 1904000.crypto: device driver tries to free an invalid DMA memory address
   WARNING: CPU: 2 PID: 69 at kernel/dma/debug.c:968 check_unmap+0x123c/0x1b90
   Modules linked in: skcipher_example(O+)
   CPU: 2 UID: 0 PID: 69 Comm: 1904000.crypto- Tainted: G           O        6.15.0-rc3+ #24 PREEMPT
   Tainted: [O]=OOT_MODULE
   Hardware name: OrangePi Zero2 (DT)
   pc : check_unmap+0x123c/0x1b90
   lr : check_unmap+0x123c/0x1b90
   ...
   Call trace:
    check_unmap+0x123c/0x1b90 (P)
    debug_dma_unmap_page+0xac/0xc0
    dma_unmap_page_attrs+0x1f4/0x5fc
    sun8i_ce_cipher_do_one+0x1bd4/0x1f40
    crypto_pump_work+0x334/0x6e0
    kthread_worker_fn+0x21c/0x438
    kthread+0x374/0x664
    ret_from_fork+0x10/0x20
   ---[ end trace 0000000000000000 ]---

To fix this, check for !dma_mapping_error() before calling
dma_unmap_single() on the "theend_iv" path.

Fixes: 06f751b61329 ("crypto: allwinner - Add sun8i-ce Crypto Engine")
Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
index 19b7fb4a93e8..05f67661553c 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
@@ -275,13 +275,16 @@ static int sun8i_ce_cipher_prepare(struct crypto_engine *engine, void *async_req
 	} else {
 		if (nr_sgs > 0)
 			dma_unmap_sg(ce->dev, areq->src, ns, DMA_TO_DEVICE);
-		dma_unmap_sg(ce->dev, areq->dst, nd, DMA_FROM_DEVICE);
+
+		if (nr_sgd > 0)
+			dma_unmap_sg(ce->dev, areq->dst, nd, DMA_FROM_DEVICE);
 	}
 
 theend_iv:
 	if (areq->iv && ivsize > 0) {
-		if (rctx->addr_iv)
+		if (!dma_mapping_error(ce->dev, rctx->addr_iv))
 			dma_unmap_single(ce->dev, rctx->addr_iv, rctx->ivlen, DMA_TO_DEVICE);
+
 		offset = areq->cryptlen - ivsize;
 		if (rctx->op_dir & CE_DECRYPTION) {
 			memcpy(areq->iv, chan->backup_iv, ivsize);
-- 
2.48.1

