Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426F6215045
	for <linux-sunxi@lists.linux.dev>; Tue,  1 Apr 2025 19:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743535446; cv=none; b=HIf7synM92Lj3nm5OHhVNAvp5q6X/LfUNQA9eOWQXTew9jOLyHlEQ+vQbFeYbGjX8YH+opYe/QuWPspjA1BIkcjLH3bMwIDq/OW8oIm/vOvx2U7skd0XGjdcHTb9tJlPEywUduPwBMk/V2FREMDoQaUd0I/j0oixbPWci4hThg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743535446; c=relaxed/simple;
	bh=NRVhERk2BAR2xqBjMJivMm5iv64usDIZsZsw3SPAVmI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rjNtLJG9VGukvgCKa0oupprkMzxNpjyUsPJMFr4k42Ea38GXTwCf91urzaMv4BZ79NA24gTrgu0VhsnDJN9eIl4KkBm8tb0bb2HTYBvySEx8IyT71UmNQ9S5ll9+58eqpVXbWPDb0xIutgB41zq/JEPeNS2oKEr0fYn/5U4Yw7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ERDQCu+t; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ERDQCu+t"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-399749152b4so2722924f8f.3
        for <linux-sunxi@lists.linux.dev>; Tue, 01 Apr 2025 12:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743535443; x=1744140243; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FPD+7okMltc/dAuqJI3eHLzfTcaBka9M3a4LKpm2uhg=;
        b=ERDQCu+tDsMxzQaYH5kkw3iaXDY7OzmZVn6BxFpbU9uZiGvDGBBJ2TTx3jmCEHo1xQ
         lfdcMG9sMCBYw/wtUOImBkMSC33epXMs2/iKZYCtaXK8LFdNBbJCEaip4mI4Xc55hhgQ
         ENwYWR23cCn+jzzYaXOtEoLyV1Nai+7ZGDmgGnIqSJdPlWzSWSdEtL3TZM2svr2ieA8A
         qS+Ul9gs2SWw1lHPZ4UfYXcjvkoGvvi8Hv5cgI71OPBIBJ+I2AhlA0hDErG2p7i2kYXI
         p0B4oAJtCeUSVbdh+t5b4/e4il2TgTNHt1A9B00tOX6DVcwCHC9HbZh9sD9PzbFZu41g
         esFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743535443; x=1744140243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FPD+7okMltc/dAuqJI3eHLzfTcaBka9M3a4LKpm2uhg=;
        b=KjJ4zovf5khA4VmeqSDvg0aOTATdXhPzpWgDvOks2ngSKFrRf4mqWRFoW9BiHUDSAD
         DsqmO3oC/uSq8tEBF2xp8rVlc37N+7CpBk+i8UHgPtArKcOjfACqzLoyX5EPmT2WWvYY
         +3TrvwWNbBR+4EUJ9sPluUxhFL2AbohlDnhSPxPN07aejOZ/e0ZBhgoFSZxLdfkyoww+
         oc5yuKSywyCzQTwIjBiv97/ofaL9gkURZF8UcUExeD/dZBKVFzLYCVqPYe7sSV4a6xii
         Jw5xugzFL3R4AgRmlhdKPCBkQzAUlbQdmqcBjztUTTi16ERyS4Edl74ORD9YzsLayPN7
         LuOg==
X-Forwarded-Encrypted: i=1; AJvYcCUm4YuctjRHQRMJh0BVLXhk+yU4x7qMwe3xsv+IghK+7ZT1tUjN3O188E2fkX1n8YoZdDrUDemxmi2CNg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwbhVRvKh9Q59dTgBAjk17ZOlXJF0x/QUqn4/afKlaCYyN89IrD
	UZWMmv1EaFxTeVnjZTw7GXLU8YaNTZSf6ygp4IfkvL1XmD1PWERY
X-Gm-Gg: ASbGnct19x8H8E10QCA2dodCyxdHxpbd/PpY0TJhfznZ7Q+OaI1Nxj8iZmzc4ziSDGL
	RwgXBnI1S9Zy9uSHtuoQn3Byyx/snfLy2BjSLaChB7ZYNj07Dk2HfYIuB9tg0dxYHk6VYQJfWTt
	9lkx+Qdl/gcLy8MYfUp6l/4tyhtH828K8t0DIXFtHwBKbx0OQg/xXuvpBR6/gzseFBTqeK0X1Pw
	KuM1RmmALVDFBYwZwbeWT7OF0Pex9oxnWJvdPY69k+9AStobxTsKVOosw0LKFT1gsa8xbZvt7H/
	anP549M4+p/lI/93d20z1TV9UC9/iFZy3j7IdKfRLxyGsLeWppXl7o4iDCMi4CWP0Ba7ukZI
X-Google-Smtp-Source: AGHT+IEaiKwLn7JsnD/3lJiU7PGrasf+3+s7Prm3UNAJkOHPWOkOwYJ5/33v9GOGEA2VI8+dpTqX0g==
X-Received: by 2002:a05:6000:1a8b:b0:39a:c9c1:5453 with SMTP id ffacd0b85a97d-39c2367439dmr3498181f8f.49.1743535442768;
        Tue, 01 Apr 2025 12:24:02 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:c50a:8800:cf9e:ee0b:4a01:37f6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b66aa32sm15353438f8f.50.2025.04.01.12.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 12:24:02 -0700 (PDT)
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
Subject: [PATCH 6/6] crypto: sun8i-ce-hash - use API helpers to setup fallback request
Date: Tue,  1 Apr 2025 22:23:21 +0300
Message-ID: <20250401192321.3370188-6-ovidiu.panait.oss@gmail.com>
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

Rather than setting up the fallback request by hand, use
ahash_request_set_callback() and ahash_request_set_crypt() API helpers
to properly setup the new request.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 .../crypto/allwinner/sun8i-ce/sun8i-ce-hash.c | 49 ++++++++++---------
 1 file changed, 27 insertions(+), 22 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
index f2481e1585ba..ba13fb75c05d 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
@@ -92,7 +92,9 @@ int sun8i_ce_hash_init(struct ahash_request *areq)
 	memset(rctx, 0, sizeof(struct sun8i_ce_hash_reqctx));
 
 	ahash_request_set_tfm(&rctx->fallback_req, tfmctx->fallback_tfm);
-	rctx->fallback_req.base.flags = areq->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP;
+	ahash_request_set_callback(&rctx->fallback_req,
+				   areq->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP,
+				   areq->base.complete, areq->base.data);
 
 	return crypto_ahash_init(&rctx->fallback_req);
 }
@@ -104,7 +106,9 @@ int sun8i_ce_hash_export(struct ahash_request *areq, void *out)
 	struct sun8i_ce_hash_tfm_ctx *tfmctx = crypto_ahash_ctx(tfm);
 
 	ahash_request_set_tfm(&rctx->fallback_req, tfmctx->fallback_tfm);
-	rctx->fallback_req.base.flags = areq->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP;
+	ahash_request_set_callback(&rctx->fallback_req,
+				   areq->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP,
+				   areq->base.complete, areq->base.data);
 
 	return crypto_ahash_export(&rctx->fallback_req, out);
 }
@@ -116,7 +120,9 @@ int sun8i_ce_hash_import(struct ahash_request *areq, const void *in)
 	struct sun8i_ce_hash_tfm_ctx *tfmctx = crypto_ahash_ctx(tfm);
 
 	ahash_request_set_tfm(&rctx->fallback_req, tfmctx->fallback_tfm);
-	rctx->fallback_req.base.flags = areq->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP;
+	ahash_request_set_callback(&rctx->fallback_req,
+				   areq->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP,
+				   areq->base.complete, areq->base.data);
 
 	return crypto_ahash_import(&rctx->fallback_req, in);
 }
@@ -130,9 +136,10 @@ int sun8i_ce_hash_final(struct ahash_request *areq)
 	sun8i_ce_hash_stat_fb_inc(tfm);
 
 	ahash_request_set_tfm(&rctx->fallback_req, tfmctx->fallback_tfm);
-	rctx->fallback_req.base.flags = areq->base.flags &
-					CRYPTO_TFM_REQ_MAY_SLEEP;
-	rctx->fallback_req.result = areq->result;
+	ahash_request_set_callback(&rctx->fallback_req,
+				   areq->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP,
+				   areq->base.complete, areq->base.data);
+	ahash_request_set_crypt(&rctx->fallback_req, NULL, areq->result, 0);
 
 	return crypto_ahash_final(&rctx->fallback_req);
 }
@@ -144,10 +151,10 @@ int sun8i_ce_hash_update(struct ahash_request *areq)
 	struct sun8i_ce_hash_tfm_ctx *tfmctx = crypto_ahash_ctx(tfm);
 
 	ahash_request_set_tfm(&rctx->fallback_req, tfmctx->fallback_tfm);
-	rctx->fallback_req.base.flags = areq->base.flags &
-					CRYPTO_TFM_REQ_MAY_SLEEP;
-	rctx->fallback_req.nbytes = areq->nbytes;
-	rctx->fallback_req.src = areq->src;
+	ahash_request_set_callback(&rctx->fallback_req,
+				   areq->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP,
+				   areq->base.complete, areq->base.data);
+	ahash_request_set_crypt(&rctx->fallback_req, areq->src, NULL, areq->nbytes);
 
 	return crypto_ahash_update(&rctx->fallback_req);
 }
@@ -161,12 +168,11 @@ int sun8i_ce_hash_finup(struct ahash_request *areq)
 	sun8i_ce_hash_stat_fb_inc(tfm);
 
 	ahash_request_set_tfm(&rctx->fallback_req, tfmctx->fallback_tfm);
-	rctx->fallback_req.base.flags = areq->base.flags &
-					CRYPTO_TFM_REQ_MAY_SLEEP;
-
-	rctx->fallback_req.nbytes = areq->nbytes;
-	rctx->fallback_req.src = areq->src;
-	rctx->fallback_req.result = areq->result;
+	ahash_request_set_callback(&rctx->fallback_req,
+				   areq->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP,
+				   areq->base.complete, areq->base.data);
+	ahash_request_set_crypt(&rctx->fallback_req, areq->src, areq->result,
+				areq->nbytes);
 
 	return crypto_ahash_finup(&rctx->fallback_req);
 }
@@ -180,12 +186,11 @@ static int sun8i_ce_hash_digest_fb(struct ahash_request *areq)
 	sun8i_ce_hash_stat_fb_inc(tfm);
 
 	ahash_request_set_tfm(&rctx->fallback_req, tfmctx->fallback_tfm);
-	rctx->fallback_req.base.flags = areq->base.flags &
-					CRYPTO_TFM_REQ_MAY_SLEEP;
-
-	rctx->fallback_req.nbytes = areq->nbytes;
-	rctx->fallback_req.src = areq->src;
-	rctx->fallback_req.result = areq->result;
+	ahash_request_set_callback(&rctx->fallback_req,
+				   areq->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP,
+				   areq->base.complete, areq->base.data);
+	ahash_request_set_crypt(&rctx->fallback_req, areq->src, areq->result,
+				areq->nbytes);
 
 	return crypto_ahash_digest(&rctx->fallback_req);
 }
-- 
2.48.1

