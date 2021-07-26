Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B0372
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Jul 2021 09:56:03 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id b1-20020a17090a8001b029017700de3903so559350pjn.1
        for <linux-sunxi@lists.linux.dev>; Mon, 26 Jul 2021 02:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8hq1iwo5Hm1g8aqgoAxXS/EpDF9ENodl1JxcIEWdESM=;
        b=Px3S4BKiazxPjW1E/yyznc3VnwcyyEkBrD1s0NbkzNsa/LlsIyxNSi/IfJUFzOwT+5
         yCNPZdmz0z642AmSQ/YTdyMEGViAedy1Vg6KcM3OeIn7xZT9D4pN6hrA9//BgA4XY3Ma
         LgXK1gXy3Q5pk7BO1oknmAC2kpXmLG27plvFchrn+dljf5CfyalatDyDGkEh8gzDtV7M
         4oxMznO1xd78rIX+qdcHvm7S5IyQWASK5Sdfc+pbhXn+9RdERMIZBOgHSltbXIQ1TPle
         XQDPiJbJUZfeeH0+CHDhs42LnYiC3jjUtvhNxQv96Ucoqcd+dThTCn/Z9VsmHoRy7s15
         b3uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8hq1iwo5Hm1g8aqgoAxXS/EpDF9ENodl1JxcIEWdESM=;
        b=FwDnUX685XlB0s2L7NWTiIaE2cTq8xlrOU+nUi2I64zse/6vOD4ZMXn7+0lbiVEBCI
         MjbWJUfmd0v930a3ZmQ7vXK3W0oqWthSFjL92yvEqKmy9C4focJ3vU8+1sw9xHhdMcfM
         EAV6I+4QETtltVqyZbIyrxrDrWJgyDIX3NzYwVyQAYex4KLaxVTj8ZB6AN+w3/MbbtEM
         LnklW1iKILX/CTmwiqOv5C/JpR2KI3/I+DP4jtCiHZjwNBsvPoQpqRQ48dL9SJ8OUfLN
         dGjGrolMi2kqdZLaAOQDlRaK/BRRUIE6ka4NR9VCg4U7hH4tQYtrWI5rCP9XFH5xQPqx
         UdxQ==
X-Gm-Message-State: AOAM530xwAnC7gSd+k3pL0DNqu+2OQsQTFfbvm93chSQYBxECtw52qbB
	hVCwKIZpE+RZGEZ1F0am3WA=
X-Google-Smtp-Source: ABdhPJzCKM9r4O0HketpP2tZvU8A7c4NgYZXDFv335Gdxhn9JWdsPxJ6xFTlZodmsTONsRKS13lm5A==
X-Received: by 2002:a17:90b:212:: with SMTP id fy18mr5411891pjb.52.1627293363106;
        Mon, 26 Jul 2021 02:56:03 -0700 (PDT)
Received: from localhost.localdomain ([154.16.166.171])
        by smtp.gmail.com with ESMTPSA id r7sm10268304pga.44.2021.07.26.02.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 02:56:02 -0700 (PDT)
From: Dongliang Mu <mudongliangabcd@gmail.com>
To: Corentin Labbe <clabbe.montjoie@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Xiang Chen <chenxiang66@hisilicon.com>,
	Eric Biggers <ebiggers@google.com>,
	Dongliang Mu <mudongliangabcd@gmail.com>,
	Colin Ian King <colin.king@canonical.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] crypto: sun8i-ce: fix memory leak and return value of sun8i_ce_hash_run
Date: Mon, 26 Jul 2021 17:55:13 +0800
Message-Id: <20210726095536.2251860-1-mudongliangabcd@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In sun8i_ce_hash_run, all the dma_mmap_sg/single will cause memory leak
due to no corresponding unmap operation if errors happen.

Fix this by adding error handling part for all the dma_mmap_sg/single.

Fixes: d9b45418a917 ("crypto: sun8i-ss - support hash algorithms")
Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
---
v1->v2: move crypto_finalize_hash_request to the end of function; move
the memcpy after the dma_mmap_sg/single functions.
v2->v3: remove some unrelated code changes; delete the fix of return value
since there is no corresponding handling code 
 drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
index 3c073eb3db03..5448705e8ae1 100644
--- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
@@ -368,14 +368,14 @@ int sun8i_ss_hash_run(struct crypto_engine *engine, void *breq)
 	if (nr_sgs <= 0 || nr_sgs > MAX_SG) {
 		dev_err(ss->dev, "Invalid sg number %d\n", nr_sgs);
 		err = -EINVAL;
-		goto theend;
+		goto err_result;
 	}
 
 	addr_res = dma_map_single(ss->dev, result, digestsize, DMA_FROM_DEVICE);
 	if (dma_mapping_error(ss->dev, addr_res)) {
 		dev_err(ss->dev, "DMA map dest\n");
 		err = -EINVAL;
-		goto theend;
+		goto err_unmap_sg;
 	}
 
 	len = areq->nbytes;
@@ -390,7 +390,7 @@ int sun8i_ss_hash_run(struct crypto_engine *engine, void *breq)
 	if (len > 0) {
 		dev_err(ss->dev, "remaining len %d\n", len);
 		err = -EINVAL;
-		goto theend;
+		goto err_addr_res;
 	}
 
 	byte_count = areq->nbytes;
@@ -428,18 +428,19 @@ int sun8i_ss_hash_run(struct crypto_engine *engine, void *breq)
 	if (dma_mapping_error(ss->dev, addr_pad)) {
 		dev_err(ss->dev, "DMA error on padding SG\n");
 		err = -EINVAL;
-		goto theend;
+		goto err_addr_res;
 	}
 
 	err = sun8i_ss_run_hash_task(ss, rctx, crypto_tfm_alg_name(areq->base.tfm));
 
 	dma_unmap_single(ss->dev, addr_pad, j * 4, DMA_TO_DEVICE);
+err_addr_res:
+	dma_unmap_single(ss->dev, addr_res, digestsize, DMA_FROM_DEVICE);
+err_unmap_sg:
 	dma_unmap_sg(ss->dev, areq->src, sg_nents(areq->src),
 		     DMA_TO_DEVICE);
-	dma_unmap_single(ss->dev, addr_res, digestsize, DMA_FROM_DEVICE);
-
 	memcpy(areq->result, result, algt->alg.hash.halg.digestsize);
-theend:
+err_result:
 	kfree(pad);
 	kfree(result);
 	crypto_finalize_hash_request(engine, breq, err);
-- 
2.25.1

