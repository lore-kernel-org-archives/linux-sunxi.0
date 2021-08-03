Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1690270
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Aug 2021 06:32:08 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id d1so22517246pll.1
        for <linux-sunxi@lists.linux.dev>; Mon, 02 Aug 2021 23:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yU/myYHh2vReN4tRl5M0xqMvdpICyJtLf/+F4kJ0R+M=;
        b=TZtD0oQ73gj9v7Da7Y/ZSJEVOvJiUczdZ0KYyXvZV8m1yErq8P6aEiyn4MUt8J8glv
         1eYnR7hKsRmo8IurIe3j2XLp7G5dCoKMYRbdceZvaCY5o5jhN+oi9SjhJXVKJHTQadvw
         8X6FQOXGr9Wtmkb0/Kw20RdY3En5TkDk0v3ZjGTSeYauvd6PVFl5RbCE14DTFbjk9O92
         FLUTEG8kEVlxfuGhYAxjHZ99zzuwYLlX1ei4Sl8/WjR56wz/sEpRld4vcqjNsynYsELk
         csZDKukeBrZEYuh4qr40cyuFEFqJ+Rgd7ArDFXdTNE3Pw4+dyOJd50xwzcOrTO4B2XQB
         e2Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yU/myYHh2vReN4tRl5M0xqMvdpICyJtLf/+F4kJ0R+M=;
        b=a0cteDc0A6zNpx+PHPNJKiZBJovZRIH8bCJj+U0Nj4LigpnDKvbfmL0GSCkSDp5927
         piaKDMP0omonr9dDrhTkjfCAsV1MTJ0G005r5r+42aHUJU1NDP+P0Q9SQBSQND4n6hye
         Y5g/XEjW2ClgtXc64uXJJjTQW4IM+pqET+Uvo9Dt1it4HYozMl8PggGpiiFwNleZEmzC
         0ssi2OSnaQ3eFkKB7qeryUFrD0kGVNNalhQpCcQZmhb01AYhFTec2vu9wr5RFwjNs0A3
         3dVOPVuyFEJ5VtzWyhayIRwsV90Z4tWzfou0cdeCVoV2IQ+T6EE1WpSRMnZTGyRSfpet
         ULHg==
X-Gm-Message-State: AOAM533pPO577fxx+viYk2VNHzT+gSYQ94QxTf7E223Y5vZpBQYn3l1x
	386e0wlhj+Y8jtnHnNu7Zzs=
X-Google-Smtp-Source: ABdhPJzdhyt16qsZxVu9D9Au4hF2N/SKOZjyWadJzIJxW87rj0ZSLZBnXxtkqiSoJoUHtrimXw0tJw==
X-Received: by 2002:a63:5c04:: with SMTP id q4mr1699247pgb.127.1627972327547;
        Mon, 02 Aug 2021 23:32:07 -0700 (PDT)
Received: from localhost.localdomain ([154.16.166.234])
        by smtp.gmail.com with ESMTPSA id l10sm12529401pjg.11.2021.08.02.23.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 23:32:07 -0700 (PDT)
From: Dongliang Mu <mudongliangabcd@gmail.com>
To: Corentin Labbe <clabbe.montjoie@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Eric Biggers <ebiggers@google.com>,
	Xiang Chen <chenxiang66@hisilicon.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Dongliang Mu <mudongliangabcd@gmail.com>
Cc: Corentin Labbe <clabbe@baylibre.com>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] crypto: sun8i-ce: fix multiple memory leaks in sun8i_ce_hash_run
Date: Tue,  3 Aug 2021 14:31:38 +0800
Message-Id: <20210803063149.2821093-1-mudongliangabcd@gmail.com>
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

Fix this by freeing the objects allocated bydma_mmap_sg/single
when errors occur.

Fixes: 56f6d5aee88d ("crypto: sun8i-ce - support hash algorithms")
Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
---
v1->v2: fix some wording and keep error handling code consistent
 .../crypto/allwinner/sun8i-ce/sun8i-ce-hash.c | 27 ++++++++++---------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
index 88194718a806..05bb781da701 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
@@ -288,14 +288,14 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 	buf = kzalloc(bs * 2, GFP_KERNEL | GFP_DMA);
 	if (!buf) {
 		err = -ENOMEM;
-		goto theend;
+		goto out;
 	}
 	bf = (__le32 *)buf;
 
 	result = kzalloc(digestsize, GFP_KERNEL | GFP_DMA);
 	if (!result) {
 		err = -ENOMEM;
-		goto theend;
+		goto err_buf;
 	}
 
 	flow = rctx->flow;
@@ -321,7 +321,7 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 	if (nr_sgs <= 0 || nr_sgs > MAX_SG) {
 		dev_err(ce->dev, "Invalid sg number %d\n", nr_sgs);
 		err = -EINVAL;
-		goto theend;
+		goto err_result;
 	}
 
 	len = areq->nbytes;
@@ -334,7 +334,7 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 	if (len > 0) {
 		dev_err(ce->dev, "remaining len %d\n", len);
 		err = -EINVAL;
-		goto theend;
+		goto err_unmap_sg;
 	}
 	addr_res = dma_map_single(ce->dev, result, digestsize, DMA_FROM_DEVICE);
 	cet->t_dst[0].addr = cpu_to_le32(addr_res);
@@ -342,7 +342,7 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 	if (dma_mapping_error(ce->dev, addr_res)) {
 		dev_err(ce->dev, "DMA map dest\n");
 		err = -EINVAL;
-		goto theend;
+		goto err_unmap_sg;
 	}
 
 	byte_count = areq->nbytes;
@@ -392,7 +392,7 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 	if (dma_mapping_error(ce->dev, addr_pad)) {
 		dev_err(ce->dev, "DMA error on padding SG\n");
 		err = -EINVAL;
-		goto theend;
+		goto err_addr_res;
 	}
 
 	if (ce->variant->hash_t_dlen_in_bits)
@@ -405,15 +405,18 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 	err = sun8i_ce_run_task(ce, flow, crypto_tfm_alg_name(areq->base.tfm));
 
 	dma_unmap_single(ce->dev, addr_pad, j * 4, DMA_TO_DEVICE);
+err_addr_res:
+	dma_unmap_single(ce->dev, addr_res, digestsize, DMA_FROM_DEVICE);
+err_unmap_sg:
 	dma_unmap_sg(ce->dev, areq->src, sg_nents(areq->src),
 		     DMA_TO_DEVICE);
-	dma_unmap_single(ce->dev, addr_res, digestsize, DMA_FROM_DEVICE);
-
-
 	memcpy(areq->result, result, algt->alg.hash.halg.digestsize);
-theend:
-	kfree(buf);
+err_result:
 	kfree(result);
-	crypto_finalize_hash_request(engine, breq, err);
+err_buf:
+	kfree(buf);
+out:
+	if (!err)
+		crypto_finalize_hash_request(engine, breq, err);
 	return 0;
 }
-- 
2.25.1

