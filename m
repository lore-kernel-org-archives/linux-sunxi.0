Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A04242D96
	for <linux-sunxi@lists.linux.dev>; Thu, 19 Jun 2025 12:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750335862; cv=none; b=uFhcYcODA5Oh9FtZH6D0y33fuE2hYcxsjsCQu2gGnNdPiqEGag3kDYez78X6zJSkX3x+hphPnVpDjL26C/7P/fEZKXxiq9R9fdz0HbSxjU2TlGcizyQHySoT2B52C61StwcQlCIjPtUd2DgGbYnRQlhC3Pd2+fFg7VYxH04c+fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750335862; c=relaxed/simple;
	bh=kINjivbB1+ylLn7tV9af00mOK273H9HJI0nMG3aaa1c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WlPUTnkRued/pK8DmBlPCTPGXdyDje/rSlHX68ePlYV84/Z5aPGcTB8Pxdm1mZ9mX7UqwfYuZGrfg/+PdYyTjByteI73Zq7blJwO0CQFDEBtz7y0MVlgtDWEvI3qAt2d/JDpTvyGVeAJ9PlttMjXe0biWwkv0YCUq+Yq9kfy0H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DKtSM7S3; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DKtSM7S3"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-addda47ebeaso145459866b.1
        for <linux-sunxi@lists.linux.dev>; Thu, 19 Jun 2025 05:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750335859; x=1750940659; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SfOFmSReN1wX8YEf6gXPwdHyf/C+wiQacKthqWE/o4Y=;
        b=DKtSM7S3mgaxW93QAU2jApcUd1+mMEqGbs9mnR5O4TwNGL6abfKx3hzS+j5qKkXmRT
         CUyN8uyuOANnp990fRM1v/LgMfGcwouk8EbDzLUpeN4zHUv5m8rrqlC6//0E0pKmpGI2
         GRLy32RJAoU7XLsiXqcLqEDB0S9wnUsLxMz4iy1QmjwKMN2ZSKwwloav3/N0RzrfElwe
         vQ7baGJQD6pbYEE/clFq/WEz+pIBFIcHzkrWdVAvUsNg0Ds1rspwmqPOvCQ9sYlnemRW
         PfL5/+loypu8SB7dgAlOSjDDdCnzYg4zvXfiQFToDGBAa6JpIU6s0soV6eQU8EB+eHPU
         cLug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750335859; x=1750940659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SfOFmSReN1wX8YEf6gXPwdHyf/C+wiQacKthqWE/o4Y=;
        b=ke0ajxKW9rnMkvkfiVUJHkAJTZZ91r7iucgJ9c3Uhuiwl6Xeq/vf/PTiQcHnFOjZWm
         va9Gmpnj6HxreO1CQc9LFiYgdOnMIQR7YcWW5Pxwx2mnFQbTGm1zZopd9lgLl5Wa/52s
         eMtOHDeQJUy2d6Crs81hQ4SSMpeMMNkA6vSlsfO3KzN97QfgiO5HW+zC2cZG9vo0Qvpu
         uzEFPNW8kcDGH7aEktHR1QVxcB+Y0ffcRFSnKHgQ+sUzR8d/hdBwue3PZbsoHAg4PsS/
         aYF45OgjC3PuiYAGcjOeCcPy/tuTAQJxSXIJgGWdzeCe1c94uxrw23UDDQL9ypV7W9xs
         uqig==
X-Forwarded-Encrypted: i=1; AJvYcCVVXHuCYj3Gt+pjz9LbFmzRdy3C/TpBQq8ZD0qwbFmy54VhwmvNYnoznYYsLHCjBXMwA1oAYWeItaRe2A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5W44XOZAKknPb39Mo8338R/68bQAs9iDIDY3WuxDu1VogrNlV
	oiT8Q/ei0mRoH3sW8cH9g4WYhl/dLErHWzRS4hehJzVh1lfg91vAowf+
X-Gm-Gg: ASbGncsgRNoaI/izpWxPQCaMxgcfWLi3FSIIuiKPI/naVDGUWz6beUVmxnaPGy2WF+N
	fhOrpcMP9Sf5mD1wXj/fSlJu6GZYTtvFSm6rSOV0ycus759qQnbJuy+UhO4R8HyPmkJFC4CmXgd
	9h1A9+iCCOwxP8DVOs6QDdnS1pdZchstIMBVEMGS3W0g8NbjqMcxM76VuErFd/kpjnKAGTA44qb
	3qbHMV6UQzDh8HfYTiCGrubGY678/K9MGOM0QraNgF1TUs5oHcQZ6IfM2s/UmEmp6MSintmXrqS
	IlP4oplbyN7/gW2ZN7fovrwdqp1lydDZrPFEhRbmc1qPQsCXgB26WwUJa9O7YfqCpXLuRloyCuV
	AQeAUpIvuNyWeWw==
X-Google-Smtp-Source: AGHT+IGEPeo5IOklcxib13+gmY/mAxR132u//d0bSaTarIv0yq4bk3Wfepb86FCqZ57HZAhqV1/TKw==
X-Received: by 2002:a17:906:c10f:b0:adb:3345:7594 with SMTP id a640c23a62f3a-adfad31e10cmr1852773366b.9.1750335858569;
        Thu, 19 Jun 2025 05:24:18 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:c51b:8900:a03f:12cb:72f7:9069])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae000b02bd3sm504688066b.3.2025.06.19.05.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 05:24:18 -0700 (PDT)
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
Subject: [PATCH 07/10] crypto: sun8i-ce - pass task descriptor to cipher prepare/unprepare
Date: Thu, 19 Jun 2025 15:23:13 +0300
Message-ID: <20250619122316.2587236-8-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619122316.2587236-1-ovidiu.panait.oss@gmail.com>
References: <20250619122316.2587236-1-ovidiu.panait.oss@gmail.com>
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

