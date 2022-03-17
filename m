Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895DB4AA2
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Mar 2022 20:56:26 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id 7-20020a05600c228700b00385fd860f49so3843538wmf.0
        for <linux-sunxi@lists.linux.dev>; Thu, 17 Mar 2022 13:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yMC+ddjQPLnvzb+n1/4Ts9zoTDjixdfTxcHcLgl33UM=;
        b=0CIZRGHtGC+7ZNfshBRNIorBMTFaTzUItSMm9flIfgEQtyei5aamXvRFhIFv0f/dnz
         WFmo/OQhZMS5KR1CpDHcNjF6PQ7UUV+zU017QfARGo0uJyGybflPrJWGheh3aZf1TL6g
         uh54FBaGPk8Buw9te2MtQLs0I5nZ4dJiMYXx0hMgEW5TczsGQMvzz2VVF328NZjj2iUA
         hQ+76kulz9SbmNUTIuhV3KPzBqna5kpmnxtNhDjlnT3Ez1urC300tcjycDIKM8ydbSHc
         ypjHqm4EwMdHHmMxR5fq7Eg1fb9FnjEBcMpATCNijtX+fpCIj4DIsdvWw6THNEetzQ8I
         wHtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yMC+ddjQPLnvzb+n1/4Ts9zoTDjixdfTxcHcLgl33UM=;
        b=ZXa0MMYOr6XLln9voXF2470tlZIYhrDMoAt1JfOZp1+M+3jP6aIzIvg0gT7ix29G/K
         3zdf3JfHUBlknzvI53ek8fUrNHtjD3dDd9Vbj80yAyRP19+m3gAKPkNmdvs00rhYdgGc
         dczY5iZNCK6HqnEhFPedythvS537ZDmaO9lXsOg5IEQ/g/r+TBWmmEJ0mZSCzcasWp6O
         FZnFhJS6WOT9hsNSJ4hrCX/J3DhKtIYCOl86W9TlPGZHXDrd+lFNdqH1ZGH6ZkSmBAOx
         gjaVgBuBzFG5Peys7CCba8mA49kkGUyCAp1R/Vg9spCW6abkUPL1Q0s4M9Hb93Myi6ia
         oo2g==
X-Gm-Message-State: AOAM5310+d2AsA7K2jD6yv7/YoS7wu2tpaAdWQ687aeGIo65FZGXSRLz
	v22x/S3awZNBkiKJ//wUv8GcMQ==
X-Google-Smtp-Source: ABdhPJxhBy+ga+OR2knzwzfaH3Ag55V5bJUEjozloT1VOBQ8RI9oyfw3GvZMpsj4lLpVuQGNPlsfWg==
X-Received: by 2002:a1c:2544:0:b0:381:18a:a46d with SMTP id l65-20020a1c2544000000b00381018aa46dmr5644185wml.26.1647550584874;
        Thu, 17 Mar 2022 13:56:24 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id r4-20020a05600c35c400b00389f368cf1esm3695424wmq.40.2022.03.17.13.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 13:56:24 -0700 (PDT)
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
Subject: [PATCH 19/19] crypto: sun8i-ce: do not fallback if cryptlen is less than sg length
Date: Thu, 17 Mar 2022 20:56:05 +0000
Message-Id: <20220317205605.3924836-20-clabbe@baylibre.com>
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

The sg length could be more than remaining data on it.
So check the length requirement against the minimum between those two
values.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
index 315a62e424d6..74b4e910a38d 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
@@ -27,6 +27,7 @@ static int sun8i_ce_cipher_need_fallback(struct skcipher_request *areq)
 	struct scatterlist *sg;
 	struct skcipher_alg *alg = crypto_skcipher_alg(tfm);
 	struct sun8i_ce_alg_template *algt;
+	unsigned int todo, len;
 
 	algt = container_of(alg, struct sun8i_ce_alg_template, alg.skcipher);
 
@@ -51,28 +52,35 @@ static int sun8i_ce_cipher_need_fallback(struct skcipher_request *areq)
 		return true;
 	}
 
+	len = areq->cryptlen;
 	sg = areq->src;
 	while (sg) {
 		if (!IS_ALIGNED(sg->offset, sizeof(u32))) {
 			algt->stat_fb_srcali++;
 			return true;
 		}
-		if (sg->length % 4) {
+		todo = min(len, sg->length);
+		if (todo % 4) {
 			algt->stat_fb_srclen++;
 			return true;
 		}
+		len -= todo;
 		sg = sg_next(sg);
 	}
+
+	len = areq->cryptlen;
 	sg = areq->dst;
 	while (sg) {
 		if (!IS_ALIGNED(sg->offset, sizeof(u32))) {
 			algt->stat_fb_dstali++;
 			return true;
 		}
-		if (sg->length % 4) {
+		todo = min(len, sg->length);
+		if (todo % 4) {
 			algt->stat_fb_dstlen++;
 			return true;
 		}
+		len -= todo;
 		sg = sg_next(sg);
 	}
 	return false;
-- 
2.34.1

