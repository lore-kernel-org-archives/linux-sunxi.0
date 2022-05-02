Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE3F3210
	for <linux-sunxi@lists.linux.dev>; Mon,  2 May 2022 20:19:49 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id u3so20899266wrg.3
        for <linux-sunxi@lists.linux.dev>; Mon, 02 May 2022 13:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RnRXNVBrNu0gZUzja3H8hBQ5GxF3sLHXexVXlrLV7kM=;
        b=X8fSwKk9SZRgne6mCFt08RJn+hmq7rBZ6PS0Lif5QPtJZlQ/cHfzz0fePdMJeVoEV2
         zyvL1shPlDOhP7u5PUB1+DqnDigLCOfPrleRC1jrVgqFeGA6JfZbpihnOZS8qZ6jX59O
         yQRR3Ef/YOfAgiNOZmbbrm+EHUyXvO0wzB1x/k8lhJSruOvHLpeHyXixqlXvVQKDXCpM
         wAgMek3HRzP8pJX7hZzDEm5FnfCZxCzAXqVgnHT7IgLGxlhiRGCHc21Zbmg74RrYBhgy
         AP6MMmfMlFxTPqfQP+stHDF0r/sBv5lgDW1pewuNM7NazO3Hk/sxtq0oT/FGVKoxNudU
         /VbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RnRXNVBrNu0gZUzja3H8hBQ5GxF3sLHXexVXlrLV7kM=;
        b=bIwXlumYzC3Qz1ZK/2hajImHXgiXBGbi0tjNaWJvke/1uYm2c1SGSPwaOGSM1IGs6E
         BIG0H/XjFetpezIYXElPUd4licFfc6HusaNm2qNIHUmrsfgQ4iURSkWo/E7WZ6hHRkmd
         Bsg1XciVSXZW8f9fhQCyv573/BjB+iGa6+t0j+glZeSs3l9TtQuipnQb31hufaDbP1Lp
         lk+ufTeN5kCqu1bOJ0SuTowOGtqpEngiNW69avSJ23NJXDu2xpV8Rs2fYG47Cd1sv7Km
         mUTwDyBEKAfm2L9pqs1kFGpN+HCwMqbZyT77OuzjWSat73OVzN2bMQDK0kPHGHdnnXRL
         ZSDA==
X-Gm-Message-State: AOAM531vOFc0RI+VJrIwuTub/J2x6NZxTfrpKuFiTNtL5JdTFmHVGvzE
	5HPfTiVnyBchnaTSRSQjC4aDjA==
X-Google-Smtp-Source: ABdhPJzbkAkG2vpxk0wI5E7kifV7WOkLd0rKSFIEP5owheSFK+XfGcbbQ7pSR6xmwCbFCTwOuNafGw==
X-Received: by 2002:a05:6000:188c:b0:20c:563a:aa86 with SMTP id a12-20020a056000188c00b0020c563aaa86mr8982895wri.360.1651522788240;
        Mon, 02 May 2022 13:19:48 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id l2-20020adfb102000000b0020c547f75easm7238183wra.101.2022.05.02.13.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 13:19:47 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
To: herbert@gondor.apana.org.au,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	wens@csie.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v2 08/19] crypto: sun8i-ss: use sg_nents_for_len
Date: Mon,  2 May 2022 20:19:18 +0000
Message-Id: <20220502201929.843194-9-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220502201929.843194-1-clabbe@baylibre.com>
References: <20220502201929.843194-1-clabbe@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When testing with some large SG list, the sun8i-ss drivers always
fallback even if it can handle it.
So use sg_nents_for_len() which permits to see less SGs than needed.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 .../allwinner/sun8i-ss/sun8i-ss-cipher.c      | 23 ++++++++-----------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
index 70e2e6e37389..c4cb1ab1eeaa 100644
--- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
@@ -29,7 +29,8 @@ static bool sun8i_ss_need_fallback(struct skcipher_request *areq)
 	if (areq->cryptlen == 0 || areq->cryptlen % 16)
 		return true;
 
-	if (sg_nents(areq->src) > 8 || sg_nents(areq->dst) > 8)
+	if (sg_nents_for_len(areq->src, areq->cryptlen) > 8 ||
+		sg_nents_for_len(areq->dst, areq->cryptlen) > 8)
 		return true;
 
 	sg = areq->src;
@@ -169,6 +170,8 @@ static int sun8i_ss_cipher(struct skcipher_request *areq)
 	int nr_sgs = 0;
 	int nr_sgd = 0;
 	int err = 0;
+	int nsgs = sg_nents_for_len(areq->src, areq->cryptlen);
+	int nsgd = sg_nents_for_len(areq->dst, areq->cryptlen);
 	int i;
 
 	algt = container_of(alg, struct sun8i_ss_alg_template, alg.skcipher);
@@ -201,8 +204,7 @@ static int sun8i_ss_cipher(struct skcipher_request *areq)
 			goto theend_key;
 	}
 	if (areq->src == areq->dst) {
-		nr_sgs = dma_map_sg(ss->dev, areq->src, sg_nents(areq->src),
-				    DMA_BIDIRECTIONAL);
+		nr_sgs = dma_map_sg(ss->dev, areq->src, nsgs, DMA_BIDIRECTIONAL);
 		if (nr_sgs <= 0 || nr_sgs > 8) {
 			dev_err(ss->dev, "Invalid sg number %d\n", nr_sgs);
 			err = -EINVAL;
@@ -210,15 +212,13 @@ static int sun8i_ss_cipher(struct skcipher_request *areq)
 		}
 		nr_sgd = nr_sgs;
 	} else {
-		nr_sgs = dma_map_sg(ss->dev, areq->src, sg_nents(areq->src),
-				    DMA_TO_DEVICE);
+		nr_sgs = dma_map_sg(ss->dev, areq->src, nsgs, DMA_TO_DEVICE);
 		if (nr_sgs <= 0 || nr_sgs > 8) {
 			dev_err(ss->dev, "Invalid sg number %d\n", nr_sgs);
 			err = -EINVAL;
 			goto theend_iv;
 		}
-		nr_sgd = dma_map_sg(ss->dev, areq->dst, sg_nents(areq->dst),
-				    DMA_FROM_DEVICE);
+		nr_sgd = dma_map_sg(ss->dev, areq->dst, nsgd, DMA_FROM_DEVICE);
 		if (nr_sgd <= 0 || nr_sgd > 8) {
 			dev_err(ss->dev, "Invalid sg number %d\n", nr_sgd);
 			err = -EINVAL;
@@ -274,13 +274,10 @@ static int sun8i_ss_cipher(struct skcipher_request *areq)
 
 theend_sgs:
 	if (areq->src == areq->dst) {
-		dma_unmap_sg(ss->dev, areq->src, sg_nents(areq->src),
-			     DMA_BIDIRECTIONAL);
+		dma_unmap_sg(ss->dev, areq->src, nsgs, DMA_BIDIRECTIONAL);
 	} else {
-		dma_unmap_sg(ss->dev, areq->src, sg_nents(areq->src),
-			     DMA_TO_DEVICE);
-		dma_unmap_sg(ss->dev, areq->dst, sg_nents(areq->dst),
-			     DMA_FROM_DEVICE);
+		dma_unmap_sg(ss->dev, areq->src, nsgs, DMA_TO_DEVICE);
+		dma_unmap_sg(ss->dev, areq->dst, nsgd, DMA_FROM_DEVICE);
 	}
 
 theend_iv:
-- 
2.35.1

