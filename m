Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432022D979B
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Jun 2025 09:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750931970; cv=none; b=Mj5aFElHoLG8H4T9CQinrhi66yvChohZeEe767Isjz2nFKCBrTzWdURrIrhOo2ADOq0nsmKl02vHRsG8XG2h8XQ/PFo1l10OlpdyAG3vV3XWkYheKaflFiNRXhp4TO60HL9MvKA/z6O4lpnfF5D8TuclwGpbw8upRjnNywj6OF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750931970; c=relaxed/simple;
	bh=kINjivbB1+ylLn7tV9af00mOK273H9HJI0nMG3aaa1c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oKS0bryux0eawA1yFkeyPn05fbmF5vL4aaqFCx4HvMI+csrJnYDhYsHks3C1Gp0hvSMAZFL0QGFRXfEaHr9cygyvKn4Ooha5UBVMnGnzC6sCF3plHV+BvOYJPjl4E3fwH5qY+G7rbbhOIWL4JzfTWKU/BT5fvGAyQh9yjLXvtxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g40cgvpi; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g40cgvpi"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-addda47ebeaso168774966b.1
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Jun 2025 02:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750931966; x=1751536766; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SfOFmSReN1wX8YEf6gXPwdHyf/C+wiQacKthqWE/o4Y=;
        b=g40cgvpiiYSrNMcHjIztfbVI3wkL5isNrNWMArSatHMoV8WJ52r6tziW06P2hzegfS
         iXhH7jVbdP7OnLpZWJLYziHcK0X9j9nsFIUGm3CdLdR5bPUjRT77rhKMLU+R/owPSIva
         qD7oVvVAgKUh4pgSMjgORMoyaNDrneeGfRh0Nu4IZ8riH5evkAddOfNDVlPJ8Bee+0cI
         M4xtJept2rmNOhj/J8W/tHyhQBUmanPejjMdz4o0Bdm7L/+MizOQF88TXlREVZ6rANQ+
         Pq/v9dysOWoDqoNbTcl04MIw0l9NDeoOq5zkrIrAMmMG9LzWo/644v14mT7krk2DfbTr
         fHzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750931966; x=1751536766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SfOFmSReN1wX8YEf6gXPwdHyf/C+wiQacKthqWE/o4Y=;
        b=qXjdH8LwbWaxRuhm9+JxmBQmvKn9BZZFwpTsySAIJpRupZ0F0dHUob1WFO2x5r1r19
         51RY7t7WO2PaNSxi4/hG66SOAiHucqcj8QILr4BIQdgxHpE2SH8aXa1AS2CIB31J9sya
         poSFrsckvcxV3hwgGvGzKO0UZjflGopLrWuUcFi6kNvspou+oYZJpPGKvqGUOOoyztzz
         h5ZZbJSECwIZfmKcVFvU2vsMx6hUDfjGyLpwVwEEUV39VIpBNDoG2TfpESX3dhx3zdpq
         SV8O6VXQN9iZlVhMiqXPsKdnQYVzpvtrnoe5syPsv2i39afA0puuOaqe9GQ/vA4h/PDy
         Gikg==
X-Forwarded-Encrypted: i=1; AJvYcCU6tflcZKkLR1fnVfwxMbn0JzszaLeMiRLpcZokcT3T+yGuwy9y49CVZn0+2/Jl2pZzkMpQi9oU3SYNyA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyqVZUyLDUT1pNwlwn8sX2AwGtsOKjhTMyi1JpJDKRgxZkvzB4U
	bTR3+F9ITE/xOyNuJdG154OeH+El954Uk9S4kUdzXz70AIk4JeM+SorR
X-Gm-Gg: ASbGnctbHpmcsBXjgdijiQxpCm6qt/DTxRMUBeKr5E7BvRSsmP5QHk/ONCsqG8dxgcF
	lHRWlkkOYnCZl+1wzB1ARN8xVqTxkLzbgS+7jA0Uw3f3J/d7sjzsakZ4zrNkCWkEtIEo1bsEvY8
	SMtVBlQQSxpUYMAOOSfyD0nluXQFwx7FfEISibCTVqJ4y5TpCCDP03v4C7GOvKCk62NrVYgJazr
	MKIBeJJmv6ZxWJYpaJ7BseUDkxjQMfWtIWxHq/OTH9JwjH+1F+9J8OkNBorqe1ek8HDx3w1jHn8
	T3OPOTz8IE0pdLiTNUa45QkGdMspguRn7T+pDGSdVqg+6a+mhtjsmYxufK3dzvJSLyhO/q63GuS
	IrxFEAD7YoWuN7PqReHLC//3s
X-Google-Smtp-Source: AGHT+IHpLn6aCPnOPWyRWC4lX3V76l2fWHzGHcZP/K3tw1wy0XjyFByxeww30mlPPfNzoaWZ+4XQ7Q==
X-Received: by 2002:a17:906:390e:b0:acf:15d:2385 with SMTP id a640c23a62f3a-ae0be84ee1amr611692566b.16.1750931966229;
        Thu, 26 Jun 2025 02:59:26 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:c51b:8900:a03f:12cb:72f7:9069])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae06aa5ff34sm1014106166b.40.2025.06.26.02.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 02:59:25 -0700 (PDT)
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
Subject: [PATCH v2 07/10] crypto: sun8i-ce - pass task descriptor to cipher prepare/unprepare
Date: Thu, 26 Jun 2025 12:58:10 +0300
Message-ID: <20250626095813.83963-8-ovidiu.panait.oss@gmail.com>
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

Rework sun8i_ce_cipher_prepare() and sun8i_ce_cipher_unprepare() to take a
task descriptor pointer as a parameter. Move common flow setup code to
sun8i_ce_cipher_do_one() and also remove the crypto_engine parameter, as it
was not used anyway.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 .../allwinner/sun8i-ce/sun8i-ce-cipher.c      | 37 +++++++------------
 1 file changed, 14 insertions(+), 23 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
index 5fdb6a986b1f..d206b4fb5084 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
@@ -131,21 +131,19 @@ static int sun8i_ce_cipher_fallback(struct skcipher_request *areq)
 	return err;
 }
 
-static int sun8i_ce_cipher_prepare(struct crypto_engine *engine, void *async_req)
+static int sun8i_ce_cipher_prepare(struct skcipher_request *areq,
+				   struct ce_task *cet)
 {
-	struct skcipher_request *areq = container_of(async_req, struct skcipher_request, base);
 	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(areq);
 	struct sun8i_cipher_tfm_ctx *op = crypto_skcipher_ctx(tfm);
 	struct sun8i_ce_dev *ce = op->ce;
 	struct sun8i_cipher_req_ctx *rctx = skcipher_request_ctx(areq);
 	struct skcipher_alg *alg = crypto_skcipher_alg(tfm);
 	struct sun8i_ce_alg_template *algt;
-	struct sun8i_ce_flow *chan;
-	struct ce_task *cet;
 	struct scatterlist *sg;
 	unsigned int todo, len, offset, ivsize;
 	u32 common, sym;
-	int flow, i;
+	int i;
 	int nr_sgs = 0;
 	int nr_sgd = 0;
 	int err = 0;
@@ -163,14 +161,9 @@ static int sun8i_ce_cipher_prepare(struct crypto_engine *engine, void *async_req
 	if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG))
 		algt->stat_req++;
 
-	flow = rctx->flow;
-
-	chan = &ce->chanlist[flow];
-
-	cet = chan->tl;
 	memset(cet, 0, sizeof(struct ce_task));
 
-	cet->t_id = cpu_to_le32(flow);
+	cet->t_id = cpu_to_le32(rctx->flow);
 	common = ce->variant->alg_cipher[algt->ce_algo_id];
 	common |= rctx->op_dir | CE_COMM_INT;
 	cet->t_common_ctl = cpu_to_le32(common);
@@ -314,24 +307,17 @@ static int sun8i_ce_cipher_prepare(struct crypto_engine *engine, void *async_req
 	return err;
 }
 
-static void sun8i_ce_cipher_unprepare(struct crypto_engine *engine,
-				      void *async_req)
+static void sun8i_ce_cipher_unprepare(struct skcipher_request *areq,
+				      struct ce_task *cet)
 {
-	struct skcipher_request *areq = container_of(async_req, struct skcipher_request, base);
 	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(areq);
 	struct sun8i_cipher_tfm_ctx *op = crypto_skcipher_ctx(tfm);
 	struct sun8i_ce_dev *ce = op->ce;
 	struct sun8i_cipher_req_ctx *rctx = skcipher_request_ctx(areq);
-	struct sun8i_ce_flow *chan;
-	struct ce_task *cet;
 	unsigned int ivsize, offset;
 	int nr_sgs = rctx->nr_sgs;
 	int nr_sgd = rctx->nr_sgd;
-	int flow;
 
-	flow = rctx->flow;
-	chan = &ce->chanlist[flow];
-	cet = chan->tl;
 	ivsize = crypto_skcipher_ivsize(tfm);
 
 	if (areq->src == areq->dst) {
@@ -362,20 +348,25 @@ static void sun8i_ce_cipher_unprepare(struct crypto_engine *engine,
 
 int sun8i_ce_cipher_do_one(struct crypto_engine *engine, void *areq)
 {
-	struct sun8i_cipher_req_ctx *rctx = skcipher_request_ctx(areq);
 	struct skcipher_request *req = skcipher_request_cast(areq);
+	struct sun8i_cipher_req_ctx *rctx = skcipher_request_ctx(req);
 	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
 	struct sun8i_cipher_tfm_ctx *ctx = crypto_skcipher_ctx(tfm);
 	struct sun8i_ce_dev *ce = ctx->ce;
+	struct sun8i_ce_flow *chan;
+	struct ce_task *cet;
 	int err;
 
-	err = sun8i_ce_cipher_prepare(engine, areq);
+	chan = &ce->chanlist[rctx->flow];
+	cet = chan->tl;
+
+	err = sun8i_ce_cipher_prepare(req, cet);
 	if (err)
 		return err;
 
 	err = sun8i_ce_run_task(ce, rctx->flow,
 				crypto_tfm_alg_name(req->base.tfm));
-	sun8i_ce_cipher_unprepare(engine, areq);
+	sun8i_ce_cipher_unprepare(req, cet);
 
 	local_bh_disable();
 	crypto_finalize_skcipher_request(engine, req, err);
-- 
2.49.0

