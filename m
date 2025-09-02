Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC09307489
	for <linux-sunxi@lists.linux.dev>; Tue,  2 Sep 2025 13:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756819381; cv=none; b=bXz3mJtJizq4J13VV8p/Gm/diZIrruw624OHMqwS4v/7Bp3g7WsirN0g1ynmrqOTUkisxwBNozbRwdh1/WQmO5wqXYe9vPiqwN+xXjh69RNBDm90sxKYey5FrwORMVT98sNBkHQiopoD98J9hNYi9srqSw5jZaDoUWbxun7B3W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756819381; c=relaxed/simple;
	bh=kyASvvV0C6502P156s4uvhgiJ2anCkqmkQU+DPnmJLM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g3FdYD5u3CB1w5B8Bx7cQ4j3k3sViSkTbDKx6wgpEhGPD8qyvZ+WnBckXqCkzPGnsOBkxX+iT1Gb6GNCUzT9Pp3wxyfed57lXHJRhmxXUInNYzh3tbtpOh1ZqJu3EYh2CxAWBCTHBRmVaA48jSHY2bEh4bAFRkiTdfTwtCx/2bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fw4xojRa; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fw4xojRa"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45b883aa3c9so16690525e9.2
        for <linux-sunxi@lists.linux.dev>; Tue, 02 Sep 2025 06:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756819378; x=1757424178; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ElWdGUyg9Q9uvasE/0knQrvGqeT+AHFO5zlC/AHADc=;
        b=fw4xojRaBWMUqUa3ai7hGKv+qp4Rw6FR93H/HEZZaNSiului/bwQwQDpnODeFtHI1b
         eLrcWvyLkmbw/KKV+Qj838J9rs6YaXxrTek+QeKaG7WI5Z9ax2fJ7H2o/BkqKCPJ0ON2
         +1i5htwvW/nBJz4+HjXnRobFdVTIL4kQKHLSz+tIQ9CDvCozZ+eTQORSH98/i62/eHdA
         UYk3KXRZ1eJ7BfNl9J0Er5wGCGClsjRzY81VpWo4VFDLV2OdxkcYw0X4qECh7CTIUgir
         uIKxHrZAnFYV3sSz3o8kLdN/4eAQaHo/NauC3tgMboncvZ2JHDNr6vZ5KA+20kuxBiBy
         +a+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756819378; x=1757424178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ElWdGUyg9Q9uvasE/0knQrvGqeT+AHFO5zlC/AHADc=;
        b=Z3p8sz7Rsi76Jkt2902zwl7+Sikv8l9UNY66mkbI0A8VBX0dtjcW++O1iKB75SPQsc
         RP+4RTNxpxRygCopYi/8h5DUCXe4yeLbyV/qElva4WYZfiGz+gYvI6KujgeZ3CC1uq18
         2HXc6J+UwVlcw7bDEAaJztnbNKD5UjTHRosufJ/Yi3biB2PJ3agwPuHCec4pG8jvoaOu
         BpLNxof6CA9/9JwSfqi0ba8xtpgs6za9oTHQ/hgWRNTIRAvTTVkDRXiJQ0fmUiD5d1Lr
         zSy5ZkAZ3DlrbjH2y7x2+011pOfm6VjhiwMmw/nTJ4gzTXNlZlrJI5qqL44AP+AQX3n2
         fPrA==
X-Forwarded-Encrypted: i=1; AJvYcCVTdsz6XcoSWoZEq8TROZzhH8ICijjguES+WdSyHfFN+ZsqLGcUQxf5bYJVgdviIgjSGLvkRYltGiVy3w==@lists.linux.dev
X-Gm-Message-State: AOJu0YxSS7aKd/XtJzuv8tt3B5sAdiL4GgHyYAUiJz5jtzPu2zHDDRlt
	Ph5nsEBsCt69UrBKFTxQ3l55I+6JhpU7P2CylJumiIgMIMD5TiZxjvpX
X-Gm-Gg: ASbGncva+TO9JP8h7Da+r0FoRcBoU9fdoj4HgCAT10mcis1l7v2sAB4RqevE0KZSEJi
	8odQFygYJtwUuClUH7ppBI9F36E0Xu02F9D45dz9vUD87p7CXqzcS5JY0X+5BoF9QApgMJHhDNb
	ChpJ4ELCLC1E90O2RQXpTVDUqI9uKf59m0NI7oa3LQP54r/rJYHEeg3bvGrJVe21O8LZPucZ0+u
	TuL2HD1CgvsmEo2ZjWnBS8n3MXM6zIhKF3HMbf06P7T21kkiz9MxYWKnQ7KjBXaevAofNyiIzxD
	60iA+XkERogIXwsnxrgAYsAXo0cBQkh0y4F75mrNOCBXQBbCMaY7BTZb2sx+pV1oNqIqRlCx8oK
	Np/XpxAvi5NLr9W+pdsd05LZlQUPaVfsHvQ==
X-Google-Smtp-Source: AGHT+IHcyDVYiBnpcbLNKDERC0dfFteGZiJ+qGt3KiUljAkJChMcYHaPXwrQyaik6ZY9zKUEaa9wZw==
X-Received: by 2002:a05:600c:4c06:b0:45c:4470:270a with SMTP id 5b1f17b1804b1-45c447028b8mr66195e9.9.1756819377579;
        Tue, 02 Sep 2025 06:22:57 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:c207:b600:978:f6fa:583e:b091])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b945332adsm44452155e9.4.2025.09.02.06.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 06:22:57 -0700 (PDT)
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
Subject: [PATCH v3 2/9] crypto: sun8i-ce - remove boilerplate in sun8i_ce_hash_digest()
Date: Tue,  2 Sep 2025 16:21:27 +0300
Message-ID: <20250902132134.3287515-3-ovidiu.panait.oss@gmail.com>
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

Retrieve the dev pointer from tfm context to eliminate some boilerplate
code in sun8i_ce_hash_digest().

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Tested-by: Corentin LABBE <clabbe.montjoie@gmail.com>
Reviewed-by: Corentin LABBE <clabbe.montjoie@gmail.com>
---
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
index b26f5427c1e0..61e8d968fdcc 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
@@ -238,19 +238,15 @@ static bool sun8i_ce_hash_need_fallback(struct ahash_request *areq)
 int sun8i_ce_hash_digest(struct ahash_request *areq)
 {
 	struct crypto_ahash *tfm = crypto_ahash_reqtfm(areq);
-	struct ahash_alg *alg = __crypto_ahash_alg(tfm->base.__crt_alg);
+	struct sun8i_ce_hash_tfm_ctx *ctx = crypto_ahash_ctx(tfm);
 	struct sun8i_ce_hash_reqctx *rctx = ahash_request_ctx(areq);
-	struct sun8i_ce_alg_template *algt;
-	struct sun8i_ce_dev *ce;
+	struct sun8i_ce_dev *ce = ctx->ce;
 	struct crypto_engine *engine;
 	int e;
 
 	if (sun8i_ce_hash_need_fallback(areq))
 		return sun8i_ce_hash_digest_fb(areq);
 
-	algt = container_of(alg, struct sun8i_ce_alg_template, alg.hash.base);
-	ce = algt->ce;
-
 	e = sun8i_ce_get_engine_number(ce);
 	rctx->flow = e;
 	engine = ce->chanlist[e].engine;
-- 
2.50.0

