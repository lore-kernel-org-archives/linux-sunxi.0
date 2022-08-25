Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F98C1FA7
	for <linux-sunxi@lists.linux.dev>; Thu, 25 Aug 2022 07:24:28 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id j21so32408859ejs.0
        for <linux-sunxi@lists.linux.dev>; Thu, 25 Aug 2022 00:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=0aI67loF6W941kI2a1qaBc4yuTiPkE24GFlkzf9zIho=;
        b=QPl4SOPBQw60gvX7h0UoMpZmM2OSEprGYploWhAzSt6mBzL2z9vEent7QQXZ3+1xmy
         HqF4UYz6+6fAECcM+STV+da9h/RiSSJAemL48vFgbR4BH9tbivSC34p+TwKS3B+w6SRq
         CsrZEyIDEgfFtpms63VWVs6r5+rjlLzeaPR8oVi2+TqIxZOQvCMNcddtRwAKlTbngzRl
         NVwWylsVqD8JgKPKNX2jO8LO44xYoAnredLcWMyvv3g/NzlsBpvR7dkXfQHuq64Q8OrU
         b/J/TxqeepLi7DQou6bSb2Ik7rViFBzCbIgqqngTw6KfCFJr6d7fbIlEZdqFy66dRDMR
         4AHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=0aI67loF6W941kI2a1qaBc4yuTiPkE24GFlkzf9zIho=;
        b=h2CVwvOHzp6vKWLazOJA6d2YQGbzFiPa78JVWoG/AOVfEPCS9/1oMGQRkhwYzCRkyX
         +QPTF3JW1oF+t9e3L33ts41gE5MtCERz1Yx7Kzsaw00RWR40wBMfFG1PP2vfAGViSybV
         uce6cvk9G+jdUWlyTRB6vy2I4EbQ3DVk1Gy2kLxgwYx9E9MWM/y5+dXrS5K/QTs54dUL
         OZKgQErUFD28brS/D4FkhPiuY8I4gFjYlEdpggwjlBQuo1sBoBGlHn/sk6v6EcUEDMOb
         9FR1TwWkQReSvdx0+f0JAfk+8Vd6U4doTykfMPOznIBrQWlkasvI0xbtKmmdUANIMRqJ
         WuRw==
X-Gm-Message-State: ACgBeo1phkx7wnON+aFp7OHGaQQHVXWPx5yV51Im2zxw+mmesK85DiVo
	gFTcaRaXNk5SrOY/u0ZZ93tCFg==
X-Google-Smtp-Source: AA6agR7xq8lmYOHdm2trDOmp773MnIQKIRGV6RNdLdjKo1apjifY0yvtQQQxkInQ28TGgxYGLbf78w==
X-Received: by 2002:a17:907:b17:b0:72a:edb8:7529 with SMTP id h23-20020a1709070b1700b0072aedb87529mr1529339ejl.749.1661412266376;
        Thu, 25 Aug 2022 00:24:26 -0700 (PDT)
Received: from lb02065.fritz.box ([2001:9e8:142d:a900:eab:b5b1:a064:1d0d])
        by smtp.gmail.com with ESMTPSA id ky12-20020a170907778c00b0073ce4abf093sm2032281ejc.214.2022.08.25.00.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 00:24:26 -0700 (PDT)
From: Jack Wang <jinpu.wang@ionos.com>
To: herbert@gondor.apana.org.au,
	linux-crypto@vger.kernel.org
Cc: Corentin Labbe <clabbe.montjoie@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Minghao Chi <chi.minghao@zte.com.cn>,
	Peng Wu <wupeng58@huawei.com>,
	Alexey Khoroshilov <khoroshilov@ispras.ru>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] crypto: allwinner: Fix dma_map_sg error check
Date: Thu, 25 Aug 2022 09:24:20 +0200
Message-Id: <20220825072421.29020-6-jinpu.wang@ionos.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220825072421.29020-1-jinpu.wang@ionos.com>
References: <20220825072421.29020-1-jinpu.wang@ionos.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dma_map_sg return 0 on error.

Cc: Corentin Labbe <clabbe.montjoie@gmail.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Minghao Chi <chi.minghao@zte.com.cn>
Cc: Peng Wu <wupeng58@huawei.com>
Cc: Alexey Khoroshilov <khoroshilov@ispras.ru>
Cc: linux-crypto@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Fixes: 06f751b61329 ("crypto: allwinner - Add sun8i-ce Crypto Engine")
Fixes: d9b45418a917 ("crypto: sun8i-ss - support hash algorithms")
Signed-off-by: Jack Wang <jinpu.wang@ionos.com>
---
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c | 6 +++---
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c   | 2 +-
 drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c | 4 ++--
 drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c   | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
index 74b4e910a38d..be7f46faef7e 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
@@ -208,7 +208,7 @@ static int sun8i_ce_cipher_prepare(struct crypto_engine *engine, void *async_req
 
 	if (areq->src == areq->dst) {
 		nr_sgs = dma_map_sg(ce->dev, areq->src, ns, DMA_BIDIRECTIONAL);
-		if (nr_sgs <= 0 || nr_sgs > MAX_SG) {
+		if (!nr_sgs || nr_sgs > MAX_SG) {
 			dev_err(ce->dev, "Invalid sg number %d\n", nr_sgs);
 			err = -EINVAL;
 			goto theend_iv;
@@ -216,13 +216,13 @@ static int sun8i_ce_cipher_prepare(struct crypto_engine *engine, void *async_req
 		nr_sgd = nr_sgs;
 	} else {
 		nr_sgs = dma_map_sg(ce->dev, areq->src, ns, DMA_TO_DEVICE);
-		if (nr_sgs <= 0 || nr_sgs > MAX_SG) {
+		if (!nr_sgs || nr_sgs > MAX_SG) {
 			dev_err(ce->dev, "Invalid sg number %d\n", nr_sgs);
 			err = -EINVAL;
 			goto theend_iv;
 		}
 		nr_sgd = dma_map_sg(ce->dev, areq->dst, nd, DMA_FROM_DEVICE);
-		if (nr_sgd <= 0 || nr_sgd > MAX_SG) {
+		if (!nr_sgd || nr_sgd > MAX_SG) {
 			dev_err(ce->dev, "Invalid sg number %d\n", nr_sgd);
 			err = -EINVAL;
 			goto theend_sgs;
diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
index 8b5b9b9d04c3..0e6843ec197f 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
@@ -389,7 +389,7 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 	cet->t_asym_ctl = 0;
 
 	nr_sgs = dma_map_sg(ce->dev, areq->src, ns, DMA_TO_DEVICE);
-	if (nr_sgs <= 0 || nr_sgs > MAX_SG) {
+	if (!nr_sgs || nr_sgs > MAX_SG) {
 		dev_err(ce->dev, "Invalid sg number %d\n", nr_sgs);
 		err = -EINVAL;
 		goto theend;
diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
index 910d6751644c..fdcc98cdecaa 100644
--- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
@@ -232,13 +232,13 @@ static int sun8i_ss_cipher(struct skcipher_request *areq)
 		nr_sgd = nr_sgs;
 	} else {
 		nr_sgs = dma_map_sg(ss->dev, areq->src, nsgs, DMA_TO_DEVICE);
-		if (nr_sgs <= 0 || nr_sgs > 8) {
+		if (!nr_sgs || nr_sgs > 8) {
 			dev_err(ss->dev, "Invalid sg number %d\n", nr_sgs);
 			err = -EINVAL;
 			goto theend_iv;
 		}
 		nr_sgd = dma_map_sg(ss->dev, areq->dst, nsgd, DMA_FROM_DEVICE);
-		if (nr_sgd <= 0 || nr_sgd > 8) {
+		if (!nr_sgd || nr_sgd > 8) {
 			dev_err(ss->dev, "Invalid sg number %d\n", nr_sgd);
 			err = -EINVAL;
 			goto theend_sgs;
diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
index 36a82b22953c..fcb8c41cc957 100644
--- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
@@ -527,7 +527,7 @@ int sun8i_ss_hash_run(struct crypto_engine *engine, void *breq)
 	rctx->method = ss->variant->alg_hash[algt->ss_algo_id];
 
 	nr_sgs = dma_map_sg(ss->dev, areq->src, sg_nents(areq->src), DMA_TO_DEVICE);
-	if (nr_sgs <= 0 || nr_sgs > MAX_SG) {
+	if (!nr_sgs || nr_sgs > MAX_SG) {
 		dev_err(ss->dev, "Invalid sg number %d\n", nr_sgs);
 		err = -EINVAL;
 		goto theend;
-- 
2.34.1

