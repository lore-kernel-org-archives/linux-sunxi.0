Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49E23204
	for <linux-sunxi@lists.linux.dev>; Mon,  2 May 2022 20:19:57 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id m2-20020a1ca302000000b003943bc63f98so197583wme.4
        for <linux-sunxi@lists.linux.dev>; Mon, 02 May 2022 13:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oIeqhKRxF0U5tRj3NnGKzyz6xK4sM71zOrP1ZT9hTbY=;
        b=yvV6JIXPcOiaU2VTjW9zgzCvbarMzyhovA3J1IuLDT2IK5eyTD5UzGBCyc1mI9WcSZ
         /mtXCmy9KKa09MqJv1z8LFluLsUy7nlpVjts9/swVbgAV5BWxE4HZxnlTeBwoUjP90PV
         ZsEbyzJCwn91d99oL5k/uSWNuKGca3J81nJUb4o9/tKBbrb8oMAEV2ZL0sBwOjfj0lVa
         rAGHSAX1pdd/C8Q94q427LmmkPPBNwoe/jEiM7sh32JkojixN9VLb1KzmfnaOHFbMbgn
         9KiAWwAHOvMCn5bM+AageKYsNM/JGHty4SUUSqrB1eoF5206muMHWB3ROgpTzxRm6iu7
         5Hlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oIeqhKRxF0U5tRj3NnGKzyz6xK4sM71zOrP1ZT9hTbY=;
        b=7Ow6elzEvF53EMMF9i1lfO5RzI9K+KS+FEfSEsX6mxt/OD/6hIzpZi1MR6hSzZadg8
         QpIIcsCf87b9BDjrHDEkXeagFh0TpuF64QlbqxZehww9KkVxLHEFlk34K8BZMsxBv/II
         uIk2C+X4FyRcDpYeHvh/fM9pum/Jy/xwaNeBXex+rM2dHV0aIg6WPT9SSTMUhJ5CLhDs
         hAaAuTUE4kljXIkgZ2huIy+lwnt7oDPWs9dJCiSAXLpEV1N8usr7U84EehugH9AR4Nl5
         Zl+abDRAEwTAABEeCx0spiVU3kjDWhE4YZBav54GxIcejQMondHjjNZdNtrwgyBWZMlO
         gM7g==
X-Gm-Message-State: AOAM5302ydkcdrvjn07+W1ZST1HiQOlvcXiEWwdZR18W1vrzUkb0N1FX
	6am0Bf0ygGSlXC4AiVLOgUmzPg==
X-Google-Smtp-Source: ABdhPJzKNGeALqIKJ177u6e7uPs+Fezgg1LY8eg9s30A9Ei0ycHJlgHW13RpuwO//tLsJDHW3V2dUQ==
X-Received: by 2002:a05:600c:35c5:b0:390:9982:73ec with SMTP id r5-20020a05600c35c500b00390998273ecmr583242wmq.196.1651522795957;
        Mon, 02 May 2022 13:19:55 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id l2-20020adfb102000000b0020c547f75easm7238183wra.101.2022.05.02.13.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 13:19:55 -0700 (PDT)
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
Subject: [PATCH v2 15/19] crypto: sun8i-ss: do not fallback if cryptlen is less than sg length
Date: Mon,  2 May 2022 20:19:25 +0000
Message-Id: <20220502201929.843194-16-clabbe@baylibre.com>
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

The sg length could be more than remaining data on it.
So check the length requirement against the minimum between those two
values.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 .../allwinner/sun8i-ss/sun8i-ss-cipher.c      | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
index 7f1940c6cc41..5bb950182026 100644
--- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
@@ -28,6 +28,7 @@ static bool sun8i_ss_need_fallback(struct skcipher_request *areq)
 	struct scatterlist *in_sg = areq->src;
 	struct scatterlist *out_sg = areq->dst;
 	struct scatterlist *sg;
+	unsigned int todo, len;
 
 	if (areq->cryptlen == 0 || areq->cryptlen % 16) {
 		algt->stat_fb_len++;
@@ -40,13 +41,11 @@ static bool sun8i_ss_need_fallback(struct skcipher_request *areq)
 		return true;
 	}
 
+	len = areq->cryptlen;
 	sg = areq->src;
 	while (sg) {
-		if ((sg->length % 16) != 0) {
-			algt->stat_fb_sglen++;
-			return true;
-		}
-		if ((sg_dma_len(sg) % 16) != 0) {
+		todo = min(len, sg->length);
+		if ((todo % 16) != 0) {
 			algt->stat_fb_sglen++;
 			return true;
 		}
@@ -54,15 +53,14 @@ static bool sun8i_ss_need_fallback(struct skcipher_request *areq)
 			algt->stat_fb_align++;
 			return true;
 		}
+		len -= todo;
 		sg = sg_next(sg);
 	}
+	len = areq->cryptlen;
 	sg = areq->dst;
 	while (sg) {
-		if ((sg->length % 16) != 0) {
-			algt->stat_fb_sglen++;
-			return true;
-		}
-		if ((sg_dma_len(sg) % 16) != 0) {
+		todo = min(len, sg->length);
+		if ((todo % 16) != 0) {
 			algt->stat_fb_sglen++;
 			return true;
 		}
@@ -70,6 +68,7 @@ static bool sun8i_ss_need_fallback(struct skcipher_request *areq)
 			algt->stat_fb_align++;
 			return true;
 		}
+		len -= todo;
 		sg = sg_next(sg);
 	}
 
-- 
2.35.1

