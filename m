Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51CC4AA2
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Mar 2022 20:56:23 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id r10so9048708wrp.3
        for <linux-sunxi@lists.linux.dev>; Thu, 17 Mar 2022 13:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ARb8UCft8wZTG3ENft6+SNbd5rt3s4u0qjOlFXlgvZc=;
        b=fx0R5guHUivEEvei6J61jyHaKeaykiPDMCfMXGBdGkCAGkibpHiJYuUdu9XAZkHrlf
         IiyFbit8PXncJR/wuTmgwVJo8mE81YoMuzaorlyjKoAhJJgWZ/gkLJlucqjR7QZ1OBLg
         JlSJ2x6IhJOa5LdIB5Bny0aO7uIlkM/kUA64DJhQKBjmDGMfM9VXlog4z2u63++0dM3B
         M+vS7zQu3xFK/LMqfQs+GpOExcdZ03S0VL0q7S9qARF4FeaCIoxhshPjzYXsoAQsk18r
         qnBpY2KRW8pQAMqZESQF/SChZ36aYcrKfcQlT6coNChveGUSxUniAA26cXWfnZE6HtBI
         EQbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ARb8UCft8wZTG3ENft6+SNbd5rt3s4u0qjOlFXlgvZc=;
        b=fRn/iVdNqIZzBqjOEXCIqWC3AU9jGzbeGDATBj6QHzuTbfwuTLfy4sExYLENWgonXd
         BpeJvQXz0NqR7SPoPczp7vXqEJph4lCmrtN5Q4aJCmtGcnqA2shrKPQZ5CxM9s38ZGY2
         9IoBUyYnFm2jK0+4DQKmk78i44HkR1vfm74K6/HcVSYLo6O57IjhEQ4Z1Ga6A/bx2tks
         D4jpKZAroIEwlMgsoHFRHWpMNRTR2CqGfo08MC3Lwm84YKNEPUj5XyQf97E2dLZeJ0uJ
         Uv4k4RPCdMHWSP03DBgdtVpjg2SAVN7GmTYQqnsrUmEerD7dTSvsYE4oLMK6TL3PqGg5
         irtg==
X-Gm-Message-State: AOAM532IWGve8EXfjo8gOsqb+I2WtBNhCh3qeW2I4vSEDF8SwyhBGb6/
	/tOw58Fjuhf92OlK48+LRxySrg==
X-Google-Smtp-Source: ABdhPJzbUp4EbFbf+Tpf9PDFDkshIPOWAAe5Rd58ioAXv+xp81K3T4R4aP6JdcFC5/rRv7m2jw7J/Q==
X-Received: by 2002:a05:6000:1842:b0:203:d799:b19b with SMTP id c2-20020a056000184200b00203d799b19bmr5560083wri.416.1647550582171;
        Thu, 17 Mar 2022 13:56:22 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id r4-20020a05600c35c400b00389f368cf1esm3695424wmq.40.2022.03.17.13.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 13:56:21 -0700 (PDT)
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
Subject: [PATCH 15/19] crypto: sun8i-ss: do not fallback if cryptlen is less than sg length
Date: Thu, 17 Mar 2022 20:56:01 +0000
Message-Id: <20220317205605.3924836-16-clabbe@baylibre.com>
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
2.34.1

