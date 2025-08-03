Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AF41F4617
	for <linux-sunxi@lists.linux.dev>; Sun,  3 Aug 2025 19:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754248274; cv=none; b=G6SdeGQEQHLbZWjS2Etc+7P+S2hvDvDTImAvaSlYI4AvW9oWOyunVmD6ZoarfICQmKIpuFOeAGvh90eQjI2HQj1qH0/oZSE0Z1kkpXxmKxsCwhGbdyszinDRXTFQeBeG5iSIkw9EBvklnBpaRrA+E1Ku4mT/kGJicXayPEyCaxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754248274; c=relaxed/simple;
	bh=f6FBfJ2O2GQ3lk7rvtQvn1UblRaOsewFE81eXurpKa8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vb6E9nDg7xD5GU8GUb5d80jXquxOsjAXRgABdkjI2VgbvaKZ4cEkFOWaorOn0jf/XHP7wr81u/56Ziu9xWhXAmmHaUKHbXjhxLUNXA4fPMaGwkCDC+sKQz0LUIALNpk8KBZtDAfaXf5g1Uvc74iVkBCwm5WlEEzOUgW3hweve+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ayBAQ8+3; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ayBAQ8+3"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-458c063baeaso7306385e9.1
        for <linux-sunxi@lists.linux.dev>; Sun, 03 Aug 2025 12:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754248271; x=1754853071; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XM9OSoT7EEhuPBZA6neX1BQbhTIUd6+o400NZdJKrYY=;
        b=ayBAQ8+3fbsSF0JLiwL+aU4FhDoCRU4F0S0BQbAKd4mwFvvT/8DG/PZA6OI/OtIj/c
         FRQ7LaxO/fbdLksnoNiJcOLqinbh9aXy71iXCwwlObQRrLHmFA2G/iH0mh0NcNe68G2q
         eNVPyO4fWab3Qsug84YCvxO+RjgIFl7twmBaaR0CiC2A5Ldtq2vj5IleyKVmGIetMQ85
         gYCsE5TPKnaesAFOqw7gBIGLV+u7YIXDWECLGkw1eHSYjXM+3CmVPGJnJCR8okrzZQbU
         pzMsp2y6x4kurn5tj4SC+Qm32HJsCGhsIi4uM14Hh/KoF9ZOg2tLtdIDw1Y3QnsLqbPO
         Aclg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754248271; x=1754853071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XM9OSoT7EEhuPBZA6neX1BQbhTIUd6+o400NZdJKrYY=;
        b=mOsZ1NujCCvxoxD+IxiNQ8qDTT0+lJXGBzoA22QUNVDRs5XTJSqHWxXHw5+hJrPZJ5
         itARoddrt9yztWAradmtQJe2XS5I9m43rznztTY9hrcpIDcAE2ok1yqRmgqCKNA6GEVF
         XZioQbDq1U0+OR7xc+ciFImN3WA1vzF99lhigaOGEigcQQu75tqjy4id/6YPCgqGz/nd
         X/3h65wEw2Xjlr0OiS8JxqiSF7PgswTDc05jWFaIkwqgXccF0NY+BbZtLMFcPokOV0Ks
         6Usmdygufh0IuX1Hn4bESY6tLAc2u7F95fvg/q22ncICy6ZnGdzsh0lLsZu7V1wehBKb
         3vpg==
X-Forwarded-Encrypted: i=1; AJvYcCWkfJ6s8rzGIddcE31HzCRuy9na0zecYy0SbY2ew285WmrOOGnkTiflLTnvjyF096LqwVcOCyCSK6BDqQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwYQXKSa6dL3kkd7HyCjef/MYpCw+5NsqNqTBBMTpcak1wGjuok
	R+57mIFuL5/SkjCz+YfAOBHI3KeSlSCyS4M6cMtsgvs9LviBXb5Bbu4COnDnbA==
X-Gm-Gg: ASbGnctUYheAo/8mLGdFkWskGW7/PdcATJ0BYivF2Pwz7V8/hNF8+qxQwGBwhxirL4g
	L/2793w+RWUmyFwIGpGSn0eTX7S4NYvSIk2dt94joxaw2hp9BoMGJ5uivPNQ/petftVL4/cKrGC
	wZ4ClJjVsAZpKqMNWL4L9bd3PlJDsFj58SHos78dWiv+Y9Y3CjqMPIC0BPVC5pn0bTf1P4gMDUM
	JZSpjU88pMWKns9NSSzXyM8HFOEpCmxk0guyTXHbEvKVj6K/TzJJdaEGPjVcaynd79s1NnTGUvn
	me24zLy6tPsIRq1/8RvL8FVNWoVySbz1wm0J1OverkQ1nfnQCs8NbxJZDMk+hmkxg3ReHLgtFTy
	ENLMDlMvZ1/B2UOjzKIpBvUbCrPQVPRdPAQ==
X-Google-Smtp-Source: AGHT+IFrM0QM4YzPRURXac5BvBdFWZFGquBGzZldZ3BzPlquCbea+9B7z4XeK2D+7m4BeFHALnhLcg==
X-Received: by 2002:a05:600c:1c25:b0:456:27a4:50ac with SMTP id 5b1f17b1804b1-458b6b3d871mr47422325e9.23.1754248270728;
        Sun, 03 Aug 2025 12:11:10 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:ca0d:f700:1210:b727:adc8:716])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c45346asm13099210f8f.39.2025.08.03.12.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 12:11:10 -0700 (PDT)
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
Subject: [PATCH v2 7/9] crypto: sun8i-ce - pass task descriptor to cipher prepare/unprepare
Date: Sun,  3 Aug 2025 22:10:27 +0300
Message-ID: <20250803191029.3592987-8-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250803191029.3592987-1-ovidiu.panait.oss@gmail.com>
References: <20250803191029.3592987-1-ovidiu.panait.oss@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To remove some duplicated code, directly pass 'struct skcipher_request' and
'struct ce_task' pointers to sun8i_ce_cipher_{prepare,unprepare}.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 .../allwinner/sun8i-ce/sun8i-ce-cipher.c      | 33 +++++++------------
 1 file changed, 11 insertions(+), 22 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
index f63d21cd1e52..021614b65e39 100644
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
@@ -367,16 +353,19 @@ int sun8i_ce_cipher_do_one(struct crypto_engine *engine, void *areq)
 	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
 	struct sun8i_cipher_tfm_ctx *ctx = crypto_skcipher_ctx(tfm);
 	struct sun8i_ce_dev *ce = ctx->ce;
+	struct sun8i_ce_flow *chan;
 	int err;
 
-	err = sun8i_ce_cipher_prepare(engine, areq);
+	chan = &ce->chanlist[rctx->flow];
+
+	err = sun8i_ce_cipher_prepare(req, chan->tl);
 	if (err)
 		return err;
 
 	err = sun8i_ce_run_task(ce, rctx->flow,
 				crypto_tfm_alg_name(req->base.tfm));
 
-	sun8i_ce_cipher_unprepare(engine, areq);
+	sun8i_ce_cipher_unprepare(req, chan->tl);
 
 	local_bh_disable();
 	crypto_finalize_skcipher_request(engine, req, err);
-- 
2.50.0

