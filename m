Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34D94AA7
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Mar 2022 20:56:18 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id b19so8992417wrh.11
        for <linux-sunxi@lists.linux.dev>; Thu, 17 Mar 2022 13:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KVarozbo8w/gM70D0PL891uqqAo12SoX/yxC3xRA40c=;
        b=Tnjjddm0NgIT0JYpNnjOW41FLjbKi+MKBXvwjCLe1H3U6tRye09O0M/Fb4++FVIaYl
         y1jRGvadigSE4VKID6Tqu/y4+/njgQ3pqKFJhapJCYWsRzMep+WTmTol7cwHTDYG5LdL
         5GppMt73TXKbqG8VyOvq2NOO3iv0rHHQKfC6wTxyP54N4r/Zj9ewSGPQ4zO4D1/lGAbj
         EQA0cQgdLp5TKiKrcOoHgCHAemr8HChWPkgM8o9mhwXbwijGGYkZCFz3qynfgdddD8nY
         CtexAZ54blhWaJ3WCVnTAlYN8syLBX7Mci98TnZxG7YSEaV5vVoJljSODU+IEZIJfPBv
         7xEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KVarozbo8w/gM70D0PL891uqqAo12SoX/yxC3xRA40c=;
        b=yxgSc3sHQR+wam7chf7p2KZkTzDMuiRNi6llD/4NvPqlfA5sKr5pqH+6v8UJOzFj1p
         T468CzGabBaCADJe5uVfKm1nITDUdX3IxAijfU8YvAFEjtZ6EnAIhsXd2wgqplZH68Z2
         7+yOG3J4HgpYQ57ghbJfMPFujqRGj8FomYo+6AU/kag8VQNdOJr7VW8LpkO5cZwNDsxn
         1kae99HJNITUeM9b5i3DVwJGL/o2ly9xQKfQ1L3IjouVJjFtUVo+UxHF0hCGxRvbJn6+
         BCw1O8foAPlD0pCBU0P8SV6tB9vF/emSa1FEztgElXMWpoq/WpZ3XIkYfQV2/zNFyq44
         mwMg==
X-Gm-Message-State: AOAM531hB44M0uEjVwGTYKOFDw95hRzEvGz9Jg0pdz5gWc6SgQViEUwE
	quOvlTHS7AAG567JW1zYNI5LZtVL9+uOnQ==
X-Google-Smtp-Source: ABdhPJxlHhmFvPL6T9xqEKIe7Bfz9Qmpo8RrtekTWLK0GB2UwP0mtamJLEgkZi8J8WIWbYm3ytHxaA==
X-Received: by 2002:a5d:4c4a:0:b0:1f1:e43d:c9ba with SMTP id n10-20020a5d4c4a000000b001f1e43dc9bamr5395137wrt.677.1647550577031;
        Thu, 17 Mar 2022 13:56:17 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id r4-20020a05600c35c400b00389f368cf1esm3695424wmq.40.2022.03.17.13.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 13:56:16 -0700 (PDT)
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
Subject: [PATCH 08/19] crypto: sun8i-ss: use sg_nents_for_len
Date: Thu, 17 Mar 2022 20:55:54 +0000
Message-Id: <20220317205605.3924836-9-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317205605.3924836-1-clabbe@baylibre.com>
References: <20220317205605.3924836-1-clabbe@baylibre.com>
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
2.34.1

