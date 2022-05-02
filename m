Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60CF3210
	for <linux-sunxi@lists.linux.dev>; Mon,  2 May 2022 20:19:47 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id k126so5425501wme.2
        for <linux-sunxi@lists.linux.dev>; Mon, 02 May 2022 13:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=J7Xtal5iImj+Z51acJrJe79yB1r8z7s4am9aOqW5Wb8=;
        b=TYO8UR3UezMgzO0rfp1BJKTfy2y89Vk6AjNPv0Dgo6jr/ccEobuzl/+QmY6SXe8N8z
         +89fsh+aUNOxZaIxqQWH0+dMhPdbIQfKpdq2U7/NHmCXbhuHhTr85rP1+IWvRfzmWiov
         4k/0cRveDPbLjHsqJNy/7DjDCidELdxWLljS+VasJkl3RLjUbIUtttKe+lYi0kw2Nd2B
         69KsRwbgqvhx6/U9DS+AYkCllLuxPh4amIESu45mT5iMrwOlr3QGBYKXWVl2ddV9cD+3
         771NBhzu0f3NqbefCed6v7WRLPBAfizOZR8/N104ggNY/4gbRezYvV48VsbLeQ9vqHwH
         unoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J7Xtal5iImj+Z51acJrJe79yB1r8z7s4am9aOqW5Wb8=;
        b=U9ediTWJyV8KIZP7ssWto0ZZ2YkDrGUx3O5xFtxq4pGcG1omFJbYc4x87Mz8U2O24H
         G3HVkK6T5DdQQZ1Lacz6KBBUlxN6N67KPt8VB2lQW3mCkaqukQUVQAaHBbxfSP9jkQ0U
         VatOeGDg11/1A5mzpLK2mCuzT7Rvc8guxOJHR/DOkqsc2RwXTv17nVMORY6+0khK7xs4
         rgKwqc5klXZ/JYXZsWi4zNeMdCWaZF38SwG/zYaLPd/VqhDZN8lSyVElc9E5qQH3pCtI
         BelG9KUZfDvhohUHlK9JUyKC5bQ8Ube8XJFn82rF+vZ/1sMzbSaq1x/TfKVkgpTCZvcN
         aHOQ==
X-Gm-Message-State: AOAM533JY6odticV/Hxf0MW7gs5t+82G27nypG6xbgt7D5duBQMR7cu4
	UYvojb4FbZM54AYQrEoS5IRVtA==
X-Google-Smtp-Source: ABdhPJwPj7ya0ul9Pb7RjiDxC4/249zRQPxN5ij1KoY2SJztutO6o887eeZLU0sjR6MRJTI0eI7p8Q==
X-Received: by 2002:a05:600c:601d:b0:393:fbe9:3596 with SMTP id az29-20020a05600c601d00b00393fbe93596mr577879wmb.141.1651522786075;
        Mon, 02 May 2022 13:19:46 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id l2-20020adfb102000000b0020c547f75easm7238183wra.101.2022.05.02.13.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 13:19:45 -0700 (PDT)
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
Subject: [PATCH v2 06/19] crypto: sun8i-ss: remove redundant test
Date: Mon,  2 May 2022 20:19:16 +0000
Message-Id: <20220502201929.843194-7-clabbe@baylibre.com>
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

Some fallback tests were redundant with what sun8i_ss_hash_need_fallback() already do.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
index ca4f280af35d..eaa0bbaf5581 100644
--- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
@@ -288,21 +288,11 @@ int sun8i_ss_hash_digest(struct ahash_request *areq)
 	struct sun8i_ss_alg_template *algt;
 	struct sun8i_ss_dev *ss;
 	struct crypto_engine *engine;
-	struct scatterlist *sg;
-	int nr_sgs, e, i;
+	int e;
 
 	if (sun8i_ss_hash_need_fallback(areq))
 		return sun8i_ss_hash_digest_fb(areq);
 
-	nr_sgs = sg_nents(areq->src);
-	if (nr_sgs > MAX_SG - 1)
-		return sun8i_ss_hash_digest_fb(areq);
-
-	for_each_sg(areq->src, sg, nr_sgs, i) {
-		if (sg->length % 4 || !IS_ALIGNED(sg->offset, sizeof(u32)))
-			return sun8i_ss_hash_digest_fb(areq);
-	}
-
 	algt = container_of(alg, struct sun8i_ss_alg_template, alg.hash);
 	ss = algt->ss;
 
-- 
2.35.1

