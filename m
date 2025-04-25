Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC6124DFFD
	for <linux-sunxi@lists.linux.dev>; Fri, 25 Apr 2025 12:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745585152; cv=none; b=DGiGtf0NrPnIsEa54ve6lqa+x+gNU2l2oqkbf1ECnf2q6FHDVekwkAGyYbjGJg0BMvMIWV8MkoE+K3AfvjJvbAbKTRqkeaQxjWK72S1kZeAE6iYYWRPVlPs7a86UOIrb+PflSNlyOTdi23rtJp753qP6jpWwmMS/xACy7RJattw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745585152; c=relaxed/simple;
	bh=1u4Z29Anp5j72oBtUya4T+wvp68KB3fipULiInA7Juw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rzl7RXeNYDDa51PE6GO5xrxMzYpQ+BsgQrEMnAKlP/umultzEdfBkEO+4UE0j1x8/5Hu3RzZGSppDkJeg8jlslhFFa1umpKd/0XIr4vOg4Gy1wJupEgrT8zS2Uq5kcbpG74s/vUbGLDaWQ/mJYtg6GSWrjX66dZ6pB/elyyqekw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L7BjVXIK; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L7BjVXIK"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac7bd86f637so646486466b.1
        for <linux-sunxi@lists.linux.dev>; Fri, 25 Apr 2025 05:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745585149; x=1746189949; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QlIhz0JB5sRSfAD0HIOOevrgWFZ2yotgxE/TDOX4uAU=;
        b=L7BjVXIKMsS6i3a1P44WqDLvIfMi+R4VNRAoRzEmm4HU/PkGgPwF8qAgXkDVC9abxE
         hDeggXKizdm5vfjB05DmkOIzyrq//vfOG82dmWzsNgCAhhVwAxinx6toRgSy9I6Yxam5
         gL/ECv+6uaQwv3iH5sktg/iiMPLd9KTSqiURs4dZJaI3IjJSs2xODKag7f4q8SlFASkC
         rL/B12rKOrRclrrQxT2SxykWYlEC0/S8sngkHmefADEvo1jIwuH6dy92I+msuFmd1sv4
         rYbXdHBHM5ZYfr0tKzXrxToW7WYcAWgrtgNdwNCO7uNyxzq4mHBQm0T90i3YKEtiOcSe
         ibfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745585149; x=1746189949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QlIhz0JB5sRSfAD0HIOOevrgWFZ2yotgxE/TDOX4uAU=;
        b=EySJIIJykvIYmdFNYZxR7rGKZabBYEWB6hXwHr9NLkk5DfSnhFOqCoVHyv23t029PW
         tV0Ab3NCM6ev3BTCXIPonryBhjENSmNBIfEE9aydHRM22S0X2iWJxcFrKtLmam3Wb5MU
         YuXuXBWRKv1vV0ykhusB9Lr/kcexALIHVEkMhGBD/7EiY9jRtmqMC7OXeVOaGfw8Mvvc
         f/oqMalJR0u62xFHu4RzGp6QPIctj1a7JeRMIvKLQn2pZ6PK1Gr0GvSg/iikOwWXtPRs
         jdX5mEnOnwHfhxcWbJ9Z5VtWotAXnTdTxVT3opKDso2dtibANOjb1aXL4S/ucL205+O2
         EoCw==
X-Forwarded-Encrypted: i=1; AJvYcCVv5WTQyrP8ivmxojlIhU6hz+xIPe8niRgvNhF7GxWxyz3AzBMdjQLhq6f8KoAzx0kOqztGIwnAtixLwA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyXHaENksPSd4yJSm62X3qJ1dx+2IFSVX3U5ik0hAzolpkC8X67
	5AfRWztiziYueFUxuKXUO755Lhlc3i3JiEX7ecL0SJvqqo7Y0LYr
X-Gm-Gg: ASbGncsE7eXcFYM4ODjLhB4JEuN2hgDZ6DkFQPx28I+tCs2sZICkXdSu+r8cVDrJjbE
	kKeYQOMq2nIH0/zBioOdzV9jgXVHjGuZrKne8jvdfGd77AHiWyr7c1Ys3YwprYi8QP87tBmuztI
	yaL56gtVSJrK5lpVkTwZae/k5DBtF/W70hRrGDLdMGzR55H8k0lf115lj/p38hw0dl44sm5QWs1
	vioOke86pKEvp9iZyFSdC7zocGONU3ymJkHOmP4v5hNr0LZxG5m8YZX9h8Cqp6dUGjex9axf7UT
	H8/3Y12TK6WpAYIaknzcIalCzTg974R63kfzBd3t5LTyjUjBZfj+Ow70JkN70CvRxo9o
X-Google-Smtp-Source: AGHT+IHsRkfW4z8AS9Sjh3HauYzSDV+j3U5Ovg8Y3HzMxW6/Vp1c2OsJ8tuja5lsWTGyHhQu5GJEEA==
X-Received: by 2002:a17:907:cd0d:b0:ace:3291:751 with SMTP id a640c23a62f3a-ace5a2a87c2mr526981066b.14.1745585148502;
        Fri, 25 Apr 2025 05:45:48 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:c50a:8800:cf9e:ee0b:4a01:37f6])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4e7094sm134641766b.56.2025.04.25.05.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 05:45:48 -0700 (PDT)
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
Subject: [PATCH 3/4] crypto: sun8i-ce-cipher - use IS_ENABLED() checks for debugfs stats
Date: Fri, 25 Apr 2025 15:45:16 +0300
Message-ID: <20250425124517.2225963-3-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250425124517.2225963-1-ovidiu.panait.oss@gmail.com>
References: <20250425124517.2225963-1-ovidiu.panait.oss@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG) checks before the
fallback counter updates to make sure the code is not included when
debugfs statistics support is not enabled.

Also, drop the existing ifdef guards, since 'struct sun8i_ce_alg_template'
is always defined, even with CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG disabled.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 .../allwinner/sun8i-ce/sun8i-ce-cipher.c      | 46 ++++++++++++-------
 1 file changed, 30 insertions(+), 16 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
index f03a8fa7bfa2..433cd18f0b5b 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
@@ -34,22 +34,30 @@ static int sun8i_ce_cipher_need_fallback(struct skcipher_request *areq)
 
 	if (sg_nents_for_len(areq->src, areq->cryptlen) > MAX_SG ||
 	    sg_nents_for_len(areq->dst, areq->cryptlen) > MAX_SG) {
-		algt->stat_fb_maxsg++;
+		if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG))
+			algt->stat_fb_maxsg++;
+
 		return true;
 	}
 
 	if (areq->cryptlen < crypto_skcipher_ivsize(tfm)) {
-		algt->stat_fb_leniv++;
+		if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG))
+			algt->stat_fb_leniv++;
+
 		return true;
 	}
 
 	if (areq->cryptlen == 0) {
-		algt->stat_fb_len0++;
+		if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG))
+			algt->stat_fb_len0++;
+
 		return true;
 	}
 
 	if (areq->cryptlen % 16) {
-		algt->stat_fb_mod16++;
+		if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG))
+			algt->stat_fb_mod16++;
+
 		return true;
 	}
 
@@ -57,12 +65,16 @@ static int sun8i_ce_cipher_need_fallback(struct skcipher_request *areq)
 	sg = areq->src;
 	while (sg) {
 		if (!IS_ALIGNED(sg->offset, sizeof(u32))) {
-			algt->stat_fb_srcali++;
+			if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG))
+				algt->stat_fb_srcali++;
+
 			return true;
 		}
 		todo = min(len, sg->length);
 		if (todo % 4) {
-			algt->stat_fb_srclen++;
+			if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG))
+				algt->stat_fb_srclen++;
+
 			return true;
 		}
 		len -= todo;
@@ -73,12 +85,16 @@ static int sun8i_ce_cipher_need_fallback(struct skcipher_request *areq)
 	sg = areq->dst;
 	while (sg) {
 		if (!IS_ALIGNED(sg->offset, sizeof(u32))) {
-			algt->stat_fb_dstali++;
+			if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG))
+				algt->stat_fb_dstali++;
+
 			return true;
 		}
 		todo = min(len, sg->length);
 		if (todo % 4) {
-			algt->stat_fb_dstlen++;
+			if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG))
+				algt->stat_fb_dstlen++;
+
 			return true;
 		}
 		len -= todo;
@@ -101,9 +117,7 @@ static int sun8i_ce_cipher_fallback(struct skcipher_request *areq)
 		algt = container_of(alg, struct sun8i_ce_alg_template,
 				    alg.skcipher.base);
 
-#ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG
 		algt->stat_fb++;
-#endif
 	}
 
 	skcipher_request_set_tfm(&rctx->fallback_req, op->fallback_tfm);
@@ -147,9 +161,8 @@ static int sun8i_ce_cipher_prepare(struct crypto_engine *engine, void *async_req
 		rctx->op_dir, areq->iv, crypto_skcipher_ivsize(tfm),
 		op->keylen);
 
-#ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG
-	algt->stat_req++;
-#endif
+	if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG))
+		algt->stat_req++;
 
 	flow = rctx->flow;
 
@@ -438,9 +451,10 @@ int sun8i_ce_cipher_init(struct crypto_tfm *tfm)
 	crypto_skcipher_set_reqsize(sktfm, sizeof(struct sun8i_cipher_req_ctx) +
 				    crypto_skcipher_reqsize(op->fallback_tfm));
 
-	memcpy(algt->fbname,
-	       crypto_skcipher_driver_name(op->fallback_tfm),
-	       CRYPTO_MAX_ALG_NAME);
+	if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG))
+		memcpy(algt->fbname,
+		       crypto_skcipher_driver_name(op->fallback_tfm),
+		       CRYPTO_MAX_ALG_NAME);
 
 	err = pm_runtime_get_sync(op->ce->dev);
 	if (err < 0)
-- 
2.48.1

