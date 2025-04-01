Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8306203714
	for <linux-sunxi@lists.linux.dev>; Tue,  1 Apr 2025 19:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743535442; cv=none; b=s+bH/LT6e1YqRuV8Su02vh9fTmf2PX4RtRU9vOB+ytKXtf4/mjDYIbqFwOwaIvUHBIheRxhKvV5cWlgtGDdr7bSoiIYv/PrdKEKXFLsIOUUFWNhKrs4Vh+8NY4l7kvWFTrEevHwlecND9t82mhQJYnOAx49CS6HAwVjdlStaefY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743535442; c=relaxed/simple;
	bh=ijYhgMFPW0GwZbvTlvUWZO6qB0iZ1PV0+yjxL+ZbDOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WvOpf6/8C1uNMitnoAg25YdFznSicuqBVwFMS8hkJxjCO8V1WVvq46ARJIJ6rswHhVHjtwiNTb2WhBJUkNrkXzYerPUfPK//Qoyqv2ITPoNWzBN2UV9cb2/B1ri/VKKGH6NqHc4Pov48Ydg67PCs0tbFZDmZTMSqTeTePiqg3KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g6NPuu1H; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g6NPuu1H"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so3050625f8f.0
        for <linux-sunxi@lists.linux.dev>; Tue, 01 Apr 2025 12:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743535439; x=1744140239; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZzBkugdw4gdptdF8hF2WvHzloU2qygLTygvgXH5F5js=;
        b=g6NPuu1H0gBKsMrII/bMUYYWoqBPuhnVskvxaf7h0D38GcAhCX4kbjfnVepigx4nO2
         UPZVBvLoAutYaMU6v0v9tTDofpkt2NmFGoU9hJwmM6HkNikSoldMXTYVJEkMtbrEK74u
         PYVKinwD2ohXhZhcVLyscJvo/HwlnXN94Hk0FjzGqduk/sQM/ZlxshdgZ+Ttf8ZKDEnp
         1//5fGeINIZFpXNSj4SpyYJngAdpafnggDaKLE3KmAWBJ2D/0w4+RQVdMut4lNlH8hRE
         DHwOnBh/yKZDcVw0wsZC2cgOWIeCNckb3/YKVDmXPy5H7f6s6zTB4xoWcNhsbqExE7Ze
         78oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743535439; x=1744140239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZzBkugdw4gdptdF8hF2WvHzloU2qygLTygvgXH5F5js=;
        b=wFra/yjWvAKYojtwqKNuVXf4EmFa7mgH/2iNfSdOic8668fPrWmr3qs9FGX3OKFx26
         rPL0A+VfNWqwDmNktJTpO2MldQSdv2FCl/xneB18Vv8gcjT+T1/RFNw8Eg5u52Zki6YD
         DL0VgJzMxBbAdgqVmBfJbToWFHxGZNNIu7Qwja1Mi7O+L32Q9LLopiSWd+WhYr8X9JyX
         MpQp3Xym7nTBsxO4OV1lOvXmGZnwGifNDO4zOCsYUoSPPSJE3FHdm+YEQF5eyUMwBY8d
         GctL2gG/4z9cWzUXaEx2rTDVhoXHE9T50SIVY77UL7ac2XIbHcV6b3WhLKGZ12I0aa00
         xhbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXA7rdHmnscH8YiGCKemORUQCJUin2t7BXYnUDX+mK9CDotZBtopOmOSycYy2e74sPGiB8tacMboVWIZQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzQn+O6A4I4dJ8FaBCCjMxDPrJrJX2HmZJWrjxzML9FWEMmhfxX
	cnt737tE0jqM7RP0aCBV5u8nR//kkgFxrlOyweE6+BC1f87rHipONKWgbQ==
X-Gm-Gg: ASbGncsIXJOwXs7YI+HumY0ggUc5zphFH6bL6dDvFPDk4D0wEpt2UaM+9Ng0HK/K6xE
	GxucKnZLNUMbGIWfcfjg9qUFzBBJ/zbcm3qvAYQZT6KMK8RpwMI7iMeniOlGQeXwk+eiOwGAsSj
	J94ldy/SoOSctpMgS14XGxUB/5sWAH209yMtN9JJRwk128tdMWLYdWF75/Ct+MZInS8Z4qJDyh1
	70yjGgRf1bd5VSOl9Ble9PEuVKGon01lCFauWXoz+h/bjVcP02THvWj8YRJ4QtuVvQwRL80fAlN
	d/EqwIpxEeIJ0P53pR6MOAaqsdCqpTaa/eprn6QJ4FRjeWO10VkisC164KIBPl/Qv2ElM2kd
X-Google-Smtp-Source: AGHT+IHdVEsoyIGdrpYCryCmSoxbMMM8oYYvuj+OQEED1lz5k318eW2R/hcBuIk9AkMR8eZjNXUkHQ==
X-Received: by 2002:a05:6000:381:b0:39c:1f0a:ee0 with SMTP id ffacd0b85a97d-39c1f0a0f69mr5763858f8f.2.1743535438907;
        Tue, 01 Apr 2025 12:23:58 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:c50a:8800:cf9e:ee0b:4a01:37f6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b66aa32sm15353438f8f.50.2025.04.01.12.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 12:23:58 -0700 (PDT)
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
To: clabbe.montjoie@gmail.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	linux-crypto@vger.kernel.org
Cc: wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Subject: [PATCH 3/6] crypto: sun8i-ce-hash - factor out debugfs fallback statistics
Date: Tue,  1 Apr 2025 22:23:18 +0300
Message-ID: <20250401192321.3370188-3-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250401192321.3370188-1-ovidiu.panait.oss@gmail.com>
References: <20250401192321.3370188-1-ovidiu.panait.oss@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to reduce code duplication, factor out to a separate function
the codepath that increments debugfs fallback stats.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 .../crypto/allwinner/sun8i-ce/sun8i-ce-hash.c | 53 +++++++------------
 1 file changed, 20 insertions(+), 33 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
index 2c2d285de154..b0959d8218cb 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
@@ -23,6 +23,20 @@
 #include <linux/string.h>
 #include "sun8i-ce.h"
 
+static void sun8i_ce_hash_stat_fb_inc(struct crypto_ahash *tfm)
+{
+	if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG)) {
+		struct sun8i_ce_alg_template *algt __maybe_unused;
+		struct ahash_alg *alg = crypto_ahash_alg(tfm);
+
+		algt = container_of(alg, struct sun8i_ce_alg_template,
+				    alg.hash.base);
+#ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG
+		algt->stat_fb++;
+#endif
+	}
+}
+
 int sun8i_ce_hash_init_tfm(struct crypto_ahash *tfm)
 {
 	struct sun8i_ce_hash_tfm_ctx *op = crypto_ahash_ctx(tfm);
@@ -113,22 +127,13 @@ int sun8i_ce_hash_final(struct ahash_request *areq)
 	struct crypto_ahash *tfm = crypto_ahash_reqtfm(areq);
 	struct sun8i_ce_hash_tfm_ctx *tfmctx = crypto_ahash_ctx(tfm);
 
+	sun8i_ce_hash_stat_fb_inc(tfm);
+
 	ahash_request_set_tfm(&rctx->fallback_req, tfmctx->fallback_tfm);
 	rctx->fallback_req.base.flags = areq->base.flags &
 					CRYPTO_TFM_REQ_MAY_SLEEP;
 	rctx->fallback_req.result = areq->result;
 
-	if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG)) {
-		struct sun8i_ce_alg_template *algt __maybe_unused;
-		struct ahash_alg *alg = crypto_ahash_alg(tfm);
-
-		algt = container_of(alg, struct sun8i_ce_alg_template,
-				    alg.hash.base);
-#ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG
-		algt->stat_fb++;
-#endif
-	}
-
 	return crypto_ahash_final(&rctx->fallback_req);
 }
 
@@ -153,6 +158,8 @@ int sun8i_ce_hash_finup(struct ahash_request *areq)
 	struct crypto_ahash *tfm = crypto_ahash_reqtfm(areq);
 	struct sun8i_ce_hash_tfm_ctx *tfmctx = crypto_ahash_ctx(tfm);
 
+	sun8i_ce_hash_stat_fb_inc(tfm);
+
 	ahash_request_set_tfm(&rctx->fallback_req, tfmctx->fallback_tfm);
 	rctx->fallback_req.base.flags = areq->base.flags &
 					CRYPTO_TFM_REQ_MAY_SLEEP;
@@ -161,17 +168,6 @@ int sun8i_ce_hash_finup(struct ahash_request *areq)
 	rctx->fallback_req.src = areq->src;
 	rctx->fallback_req.result = areq->result;
 
-	if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG)) {
-		struct sun8i_ce_alg_template *algt __maybe_unused;
-		struct ahash_alg *alg = crypto_ahash_alg(tfm);
-
-		algt = container_of(alg, struct sun8i_ce_alg_template,
-				    alg.hash.base);
-#ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG
-		algt->stat_fb++;
-#endif
-	}
-
 	return crypto_ahash_finup(&rctx->fallback_req);
 }
 
@@ -181,6 +177,8 @@ static int sun8i_ce_hash_digest_fb(struct ahash_request *areq)
 	struct crypto_ahash *tfm = crypto_ahash_reqtfm(areq);
 	struct sun8i_ce_hash_tfm_ctx *tfmctx = crypto_ahash_ctx(tfm);
 
+	sun8i_ce_hash_stat_fb_inc(tfm);
+
 	ahash_request_set_tfm(&rctx->fallback_req, tfmctx->fallback_tfm);
 	rctx->fallback_req.base.flags = areq->base.flags &
 					CRYPTO_TFM_REQ_MAY_SLEEP;
@@ -189,17 +187,6 @@ static int sun8i_ce_hash_digest_fb(struct ahash_request *areq)
 	rctx->fallback_req.src = areq->src;
 	rctx->fallback_req.result = areq->result;
 
-	if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG)) {
-		struct sun8i_ce_alg_template *algt __maybe_unused;
-		struct ahash_alg *alg = crypto_ahash_alg(tfm);
-
-		algt = container_of(alg, struct sun8i_ce_alg_template,
-				    alg.hash.base);
-#ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG
-		algt->stat_fb++;
-#endif
-	}
-
 	return crypto_ahash_digest(&rctx->fallback_req);
 }
 
-- 
2.48.1

