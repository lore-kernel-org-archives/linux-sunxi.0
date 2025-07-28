Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E724D231A4D
	for <linux-sunxi@lists.linux.dev>; Mon, 28 Jul 2025 06:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753682886; cv=none; b=DLgQFTdWqXAKjxf0R8a9dSFAN8QXpQHKNzlycTmsjTedmS6pF5mQvZoI5nPfnFihTlyYz9wf/uKY7NvrG2Um1o/oPApfeV/dX+psHar/MVUmYyA/x8iMRz3wJ03IFcDaL1BPMEXjUWlR8JoE+ax5nMKLX52kPzWUVOIGIjiDW1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753682886; c=relaxed/simple;
	bh=f6FBfJ2O2GQ3lk7rvtQvn1UblRaOsewFE81eXurpKa8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SFtFkkSwvvivhFhXlqHjKMbwJuOUodCyFTy8jUIdOV+VXEOvcyPC2zbwlvgh8MLPMJOF8wJgMddoCC9cH2HCRqAE37SSTpDWX69juRUIqIHIBlMG+RSXHQVVw2fCH5f5NhxZAvWWMJAU0jKv9c7PE11tj8XRs33x79xpjzdpSDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aKDUOxZC; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aKDUOxZC"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4550709f2c1so32242845e9.3
        for <linux-sunxi@lists.linux.dev>; Sun, 27 Jul 2025 23:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753682883; x=1754287683; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XM9OSoT7EEhuPBZA6neX1BQbhTIUd6+o400NZdJKrYY=;
        b=aKDUOxZC9pZy0BS9LDNJGGfiGxCyrvwjrBrgEVNAL+YI+5q2gouehswIuMsUak3Y5F
         c7RuREi7SawWmBYD1q04mG0N6VcH+eJobXcMVvbxN+AeQHtnDaZUqbJUjmXZ/PezlJSE
         c7Dw+oP7TChKBudhNPGhvwgVM70wlCIxVhl4zOYSYKykg1wECfH/bhWBjouYaz/7QqmQ
         7qKQ5obCrjT47nTzEDLXy56nVWr8n672uf/Tgx3mXdOu5zc0RJX9lzMvODzMcwtp3WR0
         uwP2MnVFiNUnly8dVTISvnyUxkNKSXX3JsVlaPDO55pCLDDOb4bIXuuOD81IQr/530HJ
         fiIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753682883; x=1754287683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XM9OSoT7EEhuPBZA6neX1BQbhTIUd6+o400NZdJKrYY=;
        b=Es6CUPpqM5wzq3GxllVLv/zBlwHgOwS3uy0a8IzGZEly2CnkOWQrPDZecj4bongBeX
         8RJiK0WKq8NA2eUT5mCnTpLoEFBZs7IG822sh8QqtaRfD5ZrXOuDMdyLMNSln4MWJMQp
         I+GeNdFrksy0oBiTuZsx+l4c5Ra485T4DiGFuZzRpl5ZpB0rgwwCG7WT7Xxuu6gp/60g
         ZkaeYIfekmXWjcUmgF9HIMgmUFm7z0wCeYpx27ASbxMaZEycO9/4vxQLOFRQVyCX0ozX
         3P1oAwBFahqyWb4F1Z/ZkBkImBPix4cSLIoATxu3wLs5wbjnDqno2VFpH0AR6dnxe/Lz
         jI1g==
X-Forwarded-Encrypted: i=1; AJvYcCX3HMtnlKgTN4LKV6sT7+efXwHdgk79kgr5757DypIpI3n4IwxyrAGO9Y7wiyIIN4zRgHTXSgJjC8GMvQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1y3yzt9SPVuxQcAb8cQYr5uSLI9+e7cf64AQC9NpHv97zzLnm
	D9lMFnzCHvpJIHSukZ+IcsVtE2zhHvskatg6acM5LOHHVQMB4PsC5A2p
X-Gm-Gg: ASbGncvyj+Oirr3f4Ix6F1qu1MmY71UWiiOjpMfH08lWt2lHY4ot2DRbXr8Td/KeNaH
	HrtLUoBRtHyWRgXLetdmkiGOnslz1aThXPgADtvwleL8qsbTeDL2gH/UdGysvZDSLN3kbwKQASZ
	7YF5RKx0n8AS+dF+KglraalYb0MqHBLX7C2v31ht54xLhFO38L1+94Zr50fVAt/lAS0DC7eZE0b
	2dFeMjsfRJ4s3eOcp9y7lDTCWYVj0u3N2DUKXH/m1r6p0DN/RId5arh3GnQnne7jFORn3Rd0NnP
	b/yO4UEnRB75IuHo/aMOV++GDcrtKOKP/jk6rZYnzWeHAWq/UlkdP5WGTSWe3J+dvkAjc2tkFkI
	MKUAwuu4UFJ1/mLJDENYEu46Ivu9WJa5/DQ==
X-Google-Smtp-Source: AGHT+IF4uUDpr1nH7CAsFxI85U0J21VbGx+Pa4bqECbTdmTZSrvcjVZKnUakIVKf5iSA2kR6TptSZw==
X-Received: by 2002:a05:600c:6309:b0:456:207e:fd86 with SMTP id 5b1f17b1804b1-4588459921cmr31627685e9.2.1753682883194;
        Sun, 27 Jul 2025 23:08:03 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:ca0d:f700:1210:b727:adc8:716])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587abe6ba0sm86195215e9.9.2025.07.27.23.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 23:08:02 -0700 (PDT)
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
Subject: [PATCH 7/9] crypto: sun8i-ce - pass task descriptor to cipher prepare/unprepare
Date: Mon, 28 Jul 2025 09:06:59 +0300
Message-ID: <20250728060701.1787607-8-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250728060701.1787607-1-ovidiu.panait.oss@gmail.com>
References: <20250728060701.1787607-1-ovidiu.panait.oss@gmail.com>
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

