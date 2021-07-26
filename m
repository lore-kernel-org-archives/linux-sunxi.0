Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FF872
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Jul 2021 15:25:48 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id f13so1535611plj.2
        for <linux-sunxi@lists.linux.dev>; Mon, 26 Jul 2021 08:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YJ2wiacers242b03J1VtREz0S4EVBe3CkaiVWqJ9kVg=;
        b=hXQPIflR8ZhFX0feKPijERYg/69KAJPHtc16bQXnx5lGj90ised38lKMXuA3isoLjo
         Fb50Xww5eEsA1wFlnsHLSziCczZE1Jagx9Y8YNEElKJ9qPA88sVm8K8dfT0dnWRS5BBa
         aKK94+bXmAgSdIIza7k3+8Q8vrqK9rKc9OgqYH99Irpn8FwFP0USqQxAefNFiJKtKq4F
         zJw47BcDpvQR/nqjoY9oFLkizYEnsh3ERrDltT3NvLQp2Ma9Bo5Da4ob/Pwme5++Q4ZM
         Zju/5+OCgF0Po3B1EDRpC/L+DU14X7eIbPkPGtbo5VxH3GW7U79ANkpwjL3SAgv1qHnB
         VkRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YJ2wiacers242b03J1VtREz0S4EVBe3CkaiVWqJ9kVg=;
        b=iY20ht6e5EarJwWi8IU3pWrO606sqQxvIoH8o6KQhUg4w8oewQ7lddaPSQ+AD3o5pH
         nknCt24U4VUtLoz7Zo7GS7B6YtMjpn4T7sgTE6o5Ne3n3iQtKcpVSEF0qlRRrBMwXWNT
         GMws6DGBZN3y3F7/21xu/lbhpCMucBE9oQeDcFddRpgJAUdup5spZoIzGrY6aAo5Nisz
         QnuAKZEI2zmp9MpGlSoVQ0FKk5Pxu2f7xRPf+704ZHRhsYKxc2mgcPza057o9e86GyQi
         QWAAI/fm+4CL1imp4aL2C1tiTYTy9PUnwnHyFB9axZZKnOJA8tLtIxQI3OYIMebhJaKQ
         4Zdw==
X-Gm-Message-State: AOAM533PUl6KMRmxxX9djoZHqCGTaj0SMgEuT63kDnmspWV+68c0WlcY
	+K9lLDVFMVMZpZNG7fvQe4A=
X-Google-Smtp-Source: ABdhPJz9jcD2Df8C8OTsG5zvot3I4VXhYSaUTGjdkxXuICoBM5u5IMzBo9TCZcXaWwQ1mgTN5C2Ltw==
X-Received: by 2002:aa7:9541:0:b029:32c:cefa:123f with SMTP id w1-20020aa795410000b029032ccefa123fmr18103572pfq.24.1627313147752;
        Mon, 26 Jul 2021 08:25:47 -0700 (PDT)
Received: from localhost.localdomain ([154.16.166.171])
        by smtp.gmail.com with ESMTPSA id x14sm307079pfu.200.2021.07.26.08.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 08:25:47 -0700 (PDT)
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
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] crypto: sun8i-ss: fix multiple memory leaks in sun8i_ss_hash_run
Date: Mon, 26 Jul 2021 23:25:21 +0800
Message-Id: <20210726152533.2281139-1-mudongliangabcd@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In sun8i_ss_hash_run, all the dma_mmap_sg/single will cause memory leak
due to no corresponding unmap operation if errors happen.

Fix this by adding error handling part for all the dma_mmap_sg/single.

Fixes: d9b45418a917 ("crypto: sun8i-ss - support hash algorithms")
Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
---
v1->v2: move crypto_finalize_hash_request to the end of function; move
the memcpy after the dma_mmap_sg/single functions.
v2->v3: remove some unrelated code changes; delete the fix of return value
since there is no corresponding handling code
v3->v4: change sun8i_ce to sun8i_ss
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

