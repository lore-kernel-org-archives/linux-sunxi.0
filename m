Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B212930BF6B
	for <linux-sunxi@lists.linux.dev>; Tue,  2 Sep 2025 13:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756819387; cv=none; b=N0WXLLOjFvknn5HfFpdreRLiLgxwF6GbNelnYy0bLokVEfeuqW4Ypg5XrouONe7eMmt/II+bNtjiAxTx6DgyzkesfJoV2RnG6AM/0i5qhPgtYsqK3Dox5n57hSgXtsm6W6nZBaLj3oU6T7IwZyIijC+b/bRIPmTNTOK1avUyhME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756819387; c=relaxed/simple;
	bh=f6FBfJ2O2GQ3lk7rvtQvn1UblRaOsewFE81eXurpKa8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RBgtfOxfRmdEsmAF1T4MjLAdLqelfoMwYmdpH42KjLrsYmKdD7qUxdR5Nq3DsdCpf0vGA7cF60qYaEaOF0mXgDqopJKZ/nrX/cR7PT0PtsE6bPGhrM33RzpgFhaXPmzA4Jis4eQu1E+2heIxmqyxSIsUZfbpngC9L92pjYEaYY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZnBwJ+OB; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZnBwJ+OB"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45a1b065d59so37112105e9.1
        for <linux-sunxi@lists.linux.dev>; Tue, 02 Sep 2025 06:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756819384; x=1757424184; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XM9OSoT7EEhuPBZA6neX1BQbhTIUd6+o400NZdJKrYY=;
        b=ZnBwJ+OBCTGr9nF6G4MsmuiiTodf4xGnfgKhgK3QqrrAS7/VH211H8b7IOYAapeynk
         Hn0q6I7atXd3K5m/aRRBVRtiSoDAn0xYUKH6kngK8V9m75gQ6+7bcFTp6Bvw64da8cnx
         EJtoTKXBDw7viQbDTw9RS3flaEgN770yuVrToqlrDUZVFkLxk0lkFxPAe9xzwCr77MBi
         1XOfg+7RwV/cgFFnPo8vMEjLuGepVFg0jkCrXbEpoRbbMGUMUt1Yl8c8ZvBq/rhaSDfD
         IGuYNaYPp179tOoyudjubcwU9niW3wE8Gv7K8OjfLkYbrLMO+9+YJQ05Bq4ojGqf6PKh
         QCfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756819384; x=1757424184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XM9OSoT7EEhuPBZA6neX1BQbhTIUd6+o400NZdJKrYY=;
        b=bcUDG2LIZd+6hSndGUXh//w/BVy7dKn21tatpJDxrZAICVqTLXWa4Fz5sD9Yfpd9uB
         tVXl0L08sHsuRNy7XJ+ri6em80ZBq4bV+TRHoUp0eEhqx+bw6JP5GRe7b8lY/q8SPvmS
         hVbn9RCwOejaHwiRsmy+mZy6kJln3TRdBjWkP1O02F8QGZPWcaycbTIu3U2vHt/6dJi7
         KBxtZ4jhQbxo8rRwYh2lye44Dm/FOewbStHDmlwbHkd/xi3hnqD1JHw/b36vfUaOMDqH
         QMOKUcHtaseqd91QVtS72t8DXi66vvSnz1z/Mz3zyol40ZucINnNPKYuZOzskeOSNp3k
         M1Sw==
X-Forwarded-Encrypted: i=1; AJvYcCUz0a5sQiwyQzU0vuERuMmU3iMgWbgmIxZOiueEtB/kfNDOiTa2dSi2Qoq1CgPfu0nCaIpctjYUQZJzCQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyJMde2AdcXmxzKQUaBZBMx/UE/nZZz6zMGq9T3nBPVAuBi7Myc
	eS6ihIPLS1kOuNMwibV9Gyd+Z1F6romba7Qe/ZcYaUhunRKa8cN5EgKe
X-Gm-Gg: ASbGnct/1tU8zGWUs7/uYqLsEB959ec1XS+uhCpyCDZPDIDpzPjY7iRjGYxSpQaLjzv
	zLE+3d/iwrMt5y4OGZ6LDZe3bhPbSFXr+shtkhGLIEh10waVvqddrxq5bpKF5RmAgiXizIsIcNk
	5UXD5pE58V4DqhNMAxl3E2hM18/9hJ8jLTLXpDcnk0zIVhmPnHAastqxdhcFHMHiU3GNwPdU6EK
	awqtqzjzHHmhItkVqx1ymM3buwRX7rndZGC0RAn9FxA2N04BLA0sQONs81wJZvIHayS4QHUmc4t
	l10LJCNP/MO5PHmzveB4qO/6cMY6r2OkAexzqNgOjoEe0GFQY6ustyNIHwpE3my7Z+hTl6m9XJ7
	mBclIm0HEon0GoASDMim/edkBk0KqUDnU+g==
X-Google-Smtp-Source: AGHT+IHcOusuOZbxetLEUJAQpcS9Gkujl1YTX1DeE+tYFW/iEjj3AZ0hRgYLZeeDGlNURGNUHbKE/g==
X-Received: by 2002:a05:600c:1f1a:b0:456:1560:7c5f with SMTP id 5b1f17b1804b1-45b8554f88fmr83630355e9.14.1756819383829;
        Tue, 02 Sep 2025 06:23:03 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:c207:b600:978:f6fa:583e:b091])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b945332adsm44452155e9.4.2025.09.02.06.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 06:23:03 -0700 (PDT)
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
Subject: [PATCH v3 7/9] crypto: sun8i-ce - pass task descriptor to cipher prepare/unprepare
Date: Tue,  2 Sep 2025 16:21:32 +0300
Message-ID: <20250902132134.3287515-8-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250902132134.3287515-1-ovidiu.panait.oss@gmail.com>
References: <20250902132134.3287515-1-ovidiu.panait.oss@gmail.com>
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

