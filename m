Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777372D97BC
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Jun 2025 09:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750931971; cv=none; b=GXVly7bcX52CNpuwaY4sfJCJFDJ2p2I1THvakfTFuFB78GAGK4mObf0sb8Wy3Kc8LJ/4GkrZ2Yw1JsTmPuDJsuDGyK6IUMeHoBSXcT8kZUJJpzv9QXXzAqhSik1ZiVaF7VwNJcwuK6xa9DBu64s3l4JtRnijZYCx8xvNb3OJVG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750931971; c=relaxed/simple;
	bh=SV17SgqAFM/CwgJKb43KYYELjIo00ELjwm2XuaeiHoY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kT2dur1UI8gOgDPTW/hEzKlTaa32DYQRzk0XpfOX6MHK5stzpDp8a9VKKYvr+U9hFrHggqQjqrf2pVV71oO2dZJjJ4ySFTQgY1FzyE17Pa8PsA2ftK9zrhUpPc1L9JtqpRRnc1nFR5HmMS0kFGewoq6kQoQlUqBcKVIassBAqLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZX2zs+Vs; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZX2zs+Vs"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ae0e0271d82so22473766b.3
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Jun 2025 02:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750931968; x=1751536768; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TntJfTNuRfw8H9ywL1n4IQi1UH/CB2DPSoGeEkzsKwc=;
        b=ZX2zs+VsN+dojHTTeVGcNTw23aqk5wHpHIHUAnTBruE1T7iziiwRn0Cwk3oeQeCXEy
         ukXcmlySYT7dRpRZIvm9kRUo1Ra1GzJWz62gEv3XRig8uWftI5J/BLB4+cNiq+t1mXQj
         9hUDLxRN7DZgjBST8DibkmQy+/oZJinaORf1ufcx2qr+xlOgjOV4NYzXhr2AR9URqEhu
         7SZb0Zm9OKjxQ6pyAZA38Eq6UH1tK94qkw9HzDr0JR0eat5rhSXpWL8U8MfsnxMtuWR4
         k9kN3H8XxDIz7CgLfPaN5TMNeASMOGfyOMByQjbjRCS/5EZg/kBYhnKe7cyNMpdJBhTa
         h7fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750931968; x=1751536768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TntJfTNuRfw8H9ywL1n4IQi1UH/CB2DPSoGeEkzsKwc=;
        b=M/VYbAGOvq9auNLLEIhpzwPyLUQEuBIh3B6tWfjjhTo7bJUT41HhUvQyYfQoFXul4N
         e9hy1kDi+M1FHEE4CIibM7iLrB9f9HjEAofJAH+jMI/mVUsl5atdYKu6weZZofMbx0as
         Z7kfkk5gvLBS8E/KXuHdOvYEea4aWN884/fWH/Tyb7VA2ICCw1aMUq3tLyv4rAa18qZj
         pl1EnZ9xIlIrHaUrFDPSa+JejJpBMaR0LbZGUN+jgkIa/Ezk45lvdlDUrPm4YHVjzl2+
         c0GmZBoVVaQbhVSQv+slrdEZe8VlEN6+/Sw+8hHzbdSGdsPvHn39xsLo6HmmhGhPybOV
         C/GQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzJfGRPQwdYtDuz5nq4+FF5793roiRFC7np91CTj54OioaNzHqzCFaUuzy2wC/vAQtYIG+z7Zjh0CWSg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyzuenHCcsgrGpoZ9PRAk6JlsrTVqzy5/Haz7h4sj1uMZSs1tCg
	1N9H/fs//xADSJi8q5BBpOMClh1f7zVsKErDtiunAd8SF6SJ/R3R3LXN
X-Gm-Gg: ASbGncu5AFDCBQd8JdU4IM2dqq5/UPP1wHhSL3oXDcebFnA22h8FDsRGuMi+sUTVr3p
	joYws7IiSpz+PwWNcC9I6AUkIX+lVjFg86nUhtjcoTRlPEHhHND54xwjgBRP/b/rgefcwUfv2mG
	waGvqeu6lEmxpOd6YkgrT+JbWSuEgpwCFRd9NqijyDv8sbnZAdE5trgAZVWxK49O39ikLVEFGrB
	cX2+0VNSovM4SMsTWsDJF2YRsB8OMHNLJrJ8O+dGgiWQe5QX7yl9okRYbN0mWiwQ+plk3TF2wpl
	kktt++nRVUpJ82JWId5N/1h7vVvg072iiLhtI1T0qacxwok1RrQJo6oh6KJol2jam5Is20A8v9k
	S1J/5cFulm/+rlA==
X-Google-Smtp-Source: AGHT+IFyb5bPq7coEij2ylBbwkujWU2PveIvkYkjw2FajzUHkMcuMAgQb7EBUOsbFoZBWzMPaDgZYA==
X-Received: by 2002:a17:906:7308:b0:ade:9fb:b07d with SMTP id a640c23a62f3a-ae0be7fe523mr687847466b.4.1750931967528;
        Thu, 26 Jun 2025 02:59:27 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:c51b:8900:a03f:12cb:72f7:9069])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae06aa5ff34sm1014106166b.40.2025.06.26.02.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 02:59:27 -0700 (PDT)
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
Subject: [PATCH v2 08/10] crypto: sun8i-ce - factor out public versions of finalize request
Date: Thu, 26 Jun 2025 12:58:11 +0300
Message-ID: <20250626095813.83963-9-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250626095813.83963-1-ovidiu.panait.oss@gmail.com>
References: <20250626095813.83963-1-ovidiu.panait.oss@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Factor out hash and cipher finalize routines so that they can be used in
the next commits during do_batch_requests() callback.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 .../allwinner/sun8i-ce/sun8i-ce-cipher.c      | 23 ++++++++++---
 .../crypto/allwinner/sun8i-ce/sun8i-ce-hash.c | 33 ++++++++++++++-----
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h  | 26 +++++++++++++++
 3 files changed, 69 insertions(+), 13 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
index d206b4fb5084..22b1fe72aa71 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
@@ -346,6 +346,24 @@ static void sun8i_ce_cipher_unprepare(struct skcipher_request *areq,
 	dma_unmap_single(ce->dev, rctx->addr_key, op->keylen, DMA_TO_DEVICE);
 }
 
+void sun8i_ce_cipher_finalize_req(struct crypto_async_request *async_req,
+				  struct ce_task *cet, int err)
+{
+	struct skcipher_request *req = skcipher_request_cast(async_req);
+	struct sun8i_cipher_req_ctx *rctx = skcipher_request_ctx(req);
+	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
+	struct sun8i_cipher_tfm_ctx *ctx = crypto_skcipher_ctx(tfm);
+	struct sun8i_ce_flow *chan;
+
+	chan = &ctx->ce->chanlist[rctx->flow];
+
+	sun8i_ce_cipher_unprepare(req, cet);
+
+	local_bh_disable();
+	crypto_finalize_skcipher_request(chan->engine, req, err);
+	local_bh_enable();
+}
+
 int sun8i_ce_cipher_do_one(struct crypto_engine *engine, void *areq)
 {
 	struct skcipher_request *req = skcipher_request_cast(areq);
@@ -366,11 +384,8 @@ int sun8i_ce_cipher_do_one(struct crypto_engine *engine, void *areq)
 
 	err = sun8i_ce_run_task(ce, rctx->flow,
 				crypto_tfm_alg_name(req->base.tfm));
-	sun8i_ce_cipher_unprepare(req, cet);
 
-	local_bh_disable();
-	crypto_finalize_skcipher_request(engine, req, err);
-	local_bh_enable();
+	sun8i_ce_cipher_finalize_req(areq, cet, err);
 
 	return 0;
 }
diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
index 7811fa17388c..5d8ac1394c0c 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
@@ -453,6 +453,29 @@ static void sun8i_ce_hash_unprepare(struct ahash_request *areq,
 	dma_unmap_sg(ce->dev, areq->src, rctx->nr_sgs, DMA_TO_DEVICE);
 }
 
+void sun8i_ce_hash_finalize_req(struct crypto_async_request *async_req,
+				struct ce_task *cet,
+				int err)
+{
+	struct ahash_request *areq = ahash_request_cast(async_req);
+	struct sun8i_ce_hash_reqctx *rctx = ahash_request_ctx(areq);
+	struct crypto_ahash *tfm = crypto_ahash_reqtfm(areq);
+	struct sun8i_ce_hash_tfm_ctx *ctx = crypto_ahash_ctx(tfm);
+	struct sun8i_ce_flow *chan;
+
+	chan = &ctx->ce->chanlist[rctx->flow];
+
+	sun8i_ce_hash_unprepare(areq, cet);
+
+	if (!err)
+		memcpy(areq->result, rctx->result,
+		       crypto_ahash_digestsize(tfm));
+
+	local_bh_disable();
+	crypto_finalize_hash_request(chan->engine, areq, err);
+	local_bh_enable();
+}
+
 int sun8i_ce_hash_run(struct crypto_engine *engine, void *async_req)
 {
 	struct ahash_request *areq = ahash_request_cast(async_req);
@@ -473,15 +496,7 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *async_req)
 
 	err = sun8i_ce_run_task(ce, rctx->flow, crypto_ahash_alg_name(tfm));
 
-	sun8i_ce_hash_unprepare(areq, cet);
-
-	if (!err)
-		memcpy(areq->result, rctx->result,
-		       crypto_ahash_digestsize(tfm));
-
-	local_bh_disable();
-	crypto_finalize_hash_request(engine, async_req, err);
-	local_bh_enable();
+	sun8i_ce_hash_finalize_req(async_req, cet, err);
 
 	return 0;
 }
diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
index 90b955787d37..1022fd590256 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
@@ -383,6 +383,19 @@ int sun8i_ce_cipher_do_one(struct crypto_engine *engine, void *areq);
 int sun8i_ce_skdecrypt(struct skcipher_request *areq);
 int sun8i_ce_skencrypt(struct skcipher_request *areq);
 
+/**
+ * sun8i_ce_cipher_finalize_req - finalize cipher request
+ * @async_req: request to be finalized
+ * @cet: task descriptor associated with @async_req
+ * @err: error code indicating if request was executed successfully
+ *
+ * This function does the final cleanups for request @async_req and
+ * finalizes the request.
+ */
+void sun8i_ce_cipher_finalize_req(struct crypto_async_request *async_req,
+				  struct ce_task *cet,
+				  int err);
+
 int sun8i_ce_get_engine_number(struct sun8i_ce_dev *ce);
 
 int sun8i_ce_run_task(struct sun8i_ce_dev *ce, int flow, const char *name);
@@ -398,6 +411,19 @@ int sun8i_ce_hash_finup(struct ahash_request *areq);
 int sun8i_ce_hash_digest(struct ahash_request *areq);
 int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq);
 
+/**
+ * sun8i_ce_hash_finalize_req - finalize hash request
+ * @async_req: request to be finalized
+ * @cet: task descriptor associated with @async_req
+ * @err: error code indicating if request was executed successfully
+ *
+ * This function does the final cleanups for request @async_req and
+ * finalizes the request.
+ */
+void sun8i_ce_hash_finalize_req(struct crypto_async_request *async_req,
+				struct ce_task *cet,
+				int err);
+
 int sun8i_ce_prng_generate(struct crypto_rng *tfm, const u8 *src,
 			   unsigned int slen, u8 *dst, unsigned int dlen);
 int sun8i_ce_prng_seed(struct crypto_rng *tfm, const u8 *seed, unsigned int slen);
-- 
2.49.0

