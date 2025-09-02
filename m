Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB2430AAB4
	for <linux-sunxi@lists.linux.dev>; Tue,  2 Sep 2025 13:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756819385; cv=none; b=JF0Chv17tINmzLWLOkbVw77FPaSGo4zaWFGeUaheRvkTST4mp1coYPdrX1jY7Z3cc44Y6MYSgOTCmcy0hmpSKB3HDdpOjq/OBtLQ0qcHdxJGUnJ2XuJJDWfEkuEBW7h93xT9s+F3roonbvtNu5XZ3Wmb+mj9oleeu9ot4bUZoV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756819385; c=relaxed/simple;
	bh=VLxVkCzDUptZN3MLV6XyYZWlwBVycUnPTFTRKmIikGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k8DOkyL7sWpNuNRCH5NgnaBpVnKpS3NznE4QoT7hwW9bTZXSLpDFgFBVRsNurhruLjwUPAEKWXVwaqpss+T/MVEc9B635gupaxPeDGFIyCprcWVupXtes+AnQLTg20pT/3Z8H8xN9C+myodlyg8P6YLGG1ch1ba2uNbW2ZIHN3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZRImtAPs; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZRImtAPs"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3d1bf79d7acso1868080f8f.0
        for <linux-sunxi@lists.linux.dev>; Tue, 02 Sep 2025 06:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756819383; x=1757424183; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dlcibDkuEhs59MfzxPNpL2Xe4LDD/D/d8iw52Y6RVVM=;
        b=ZRImtAPsBwzaEP6dKG8GHjsKTDgRjgxkuB/qA/miMoY0q/9V6V6/DStM+q8/05PX62
         1gmqGgN3j8735LJRk/6qrOV72nNsZq5OZn3DcdvAo5ls5jHUVYT/PTwyLW3qfwDR4r51
         1re5Y9eFdq/KSpKyF9cftvk3YycGCBcOQxVjKvpOhUUp6pGqlwam1gH+4HzHZLqe+zZW
         jxA8jMYne6SzJrX95Q+xBeTw8v4J/WYRQFMK/OxDXpdluOocwBAs/e7u64KKpY7sRoay
         trL0Ht9e3EC5KBY/lyvByXy4oHljciki8wukC6huwjgk19W1IDbbemh1w9J12x/Yw5/9
         FTBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756819383; x=1757424183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dlcibDkuEhs59MfzxPNpL2Xe4LDD/D/d8iw52Y6RVVM=;
        b=BudJIniQ4Kx1pIBDgOMw8g2oZoO8EpDmaQ5PG3PeVR8iSAMLRVaCpPjNrj/bjBdqZ5
         +Rtj5XFa+OqTq+USnSSYg+WCk4CiSaVOFoDfNexHd94j2qXo+wWX5mZl2/fZuygs8avz
         Y9w501USBo4WG42iVzmwxQK/dF2L/UFnb4cwa5lLyh/kKy6rAZwclFioCdi/ydH9P9IK
         MdJlE51tQLqWpv2CS11pFLXRcxvnGnQyxmZ/fuEFRrM3j7ErJiILLAEjGPO2gucKtYcl
         vOiUt4nvzfcn6yOIv90Z5K4YhjLfc0oZbp/sXS8didphqHK8eLRXauvV74SWtGw5tzZz
         gNjg==
X-Forwarded-Encrypted: i=1; AJvYcCXB1WiNzRV/eEo2G/i/HrGtRFqyHLI/YjV54JZav1Mej3gECCu6ffEBRI5E3FBf+1573r3fWG1Yhxi42A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzkN/sqbA97HxGX4jvliy1M74UEUBA5kIHtt2SvUB43RFF4Dj5r
	4qgygS2un/DEB0EhQqGAZRA8nKMYvjTCouCbxhe+wL40cdn7QXIIw5h3
X-Gm-Gg: ASbGncv84KDhsKJH1sOtDDJwkp/irOeKe0ltDy1uhplCuSo5/BG0UGSQnkcsT/+AMlO
	Ju9F8raMDhJhBv585c1ExOna3rGuGZmNreyHsN4QXFOJaaRxLrYaiidW/fOUiPgDo74tRoj1wRf
	ehAGH3aQSrssfvUK1rN06KvwdE+mJx15DdHmle8z2dpMnQG1jbRd/8Ck2aAI7K9yp6X29r/PMR+
	oTvE7ezC+7O+BjltOeJ6WPw6woZ4bLqBlBrLjCTgVLP6RQ85zssRYdl1JLvZlZGd7aJjN2RkQKL
	2z6Pqad+cGrsluA7M2F1fBWcDpe5YqugrnR4+oLRz86PaCbJzEjrEINIlp6lhKIt90LJag0Cow/
	96cwMO4NT5vquwwYv7NOyGHdjAz0HH/sSdA==
X-Google-Smtp-Source: AGHT+IHVnaSqlqqL4i33vbnl8DxH3Zomz9ikQnMsjbbKikajW7iV7MsBCgP8xKySewSnOuFEhpUjVQ==
X-Received: by 2002:a05:6000:1ace:b0:3cf:3fe7:2203 with SMTP id ffacd0b85a97d-3d1dd81d0a4mr8042987f8f.7.1756819382532;
        Tue, 02 Sep 2025 06:23:02 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:c207:b600:978:f6fa:583e:b091])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b945332adsm44452155e9.4.2025.09.02.06.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 06:23:02 -0700 (PDT)
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
Subject: [PATCH v3 6/9] crypto: sun8i-ce - fold sun8i_ce_cipher_run() into sun8i_ce_cipher_do_one()
Date: Tue,  2 Sep 2025 16:21:31 +0300
Message-ID: <20250902132134.3287515-7-ovidiu.panait.oss@gmail.com>
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

Fold sun8i_ce_cipher_run() into it's only caller, sun8i_ce_cipher_do_one(),
to eliminate a bit of boilerplate.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 .../allwinner/sun8i-ce/sun8i-ce-cipher.c      | 35 +++++++++----------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
index 69ba8236cf2d..f63d21cd1e52 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
@@ -360,31 +360,28 @@ static void sun8i_ce_cipher_unprepare(struct crypto_engine *engine,
 	dma_unmap_single(ce->dev, rctx->addr_key, op->keylen, DMA_TO_DEVICE);
 }
 
-static void sun8i_ce_cipher_run(struct crypto_engine *engine, void *areq)
-{
-	struct skcipher_request *breq = container_of(areq, struct skcipher_request, base);
-	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(breq);
-	struct sun8i_cipher_tfm_ctx *op = crypto_skcipher_ctx(tfm);
-	struct sun8i_ce_dev *ce = op->ce;
-	struct sun8i_cipher_req_ctx *rctx = skcipher_request_ctx(breq);
-	int flow, err;
-
-	flow = rctx->flow;
-	err = sun8i_ce_run_task(ce, flow, crypto_tfm_alg_name(breq->base.tfm));
-	sun8i_ce_cipher_unprepare(engine, areq);
-	local_bh_disable();
-	crypto_finalize_skcipher_request(engine, breq, err);
-	local_bh_enable();
-}
-
 int sun8i_ce_cipher_do_one(struct crypto_engine *engine, void *areq)
 {
-	int err = sun8i_ce_cipher_prepare(engine, areq);
+	struct skcipher_request *req = skcipher_request_cast(areq);
+	struct sun8i_cipher_req_ctx *rctx = skcipher_request_ctx(req);
+	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
+	struct sun8i_cipher_tfm_ctx *ctx = crypto_skcipher_ctx(tfm);
+	struct sun8i_ce_dev *ce = ctx->ce;
+	int err;
 
+	err = sun8i_ce_cipher_prepare(engine, areq);
 	if (err)
 		return err;
 
-	sun8i_ce_cipher_run(engine, areq);
+	err = sun8i_ce_run_task(ce, rctx->flow,
+				crypto_tfm_alg_name(req->base.tfm));
+
+	sun8i_ce_cipher_unprepare(engine, areq);
+
+	local_bh_disable();
+	crypto_finalize_skcipher_request(engine, req, err);
+	local_bh_enable();
+
 	return 0;
 }
 
-- 
2.50.0

