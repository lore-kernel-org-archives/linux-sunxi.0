Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5210F2144A6
	for <linux-sunxi@lists.linux.dev>; Tue,  1 Apr 2025 19:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743535445; cv=none; b=fWp3dvKRm/3b6SvXFb/fG4o63TN6fMZJr1GO2Ir4HWA8L96B39sx5nUmLAa/pj332aUW3F/w4NctnAceKYekZw/M5OBWKyrQ4Uc0Mubxu10Za7g1u+5frxJDsOvvFrjK4Lgf5bEN1Qr3nbEW6bmp8Vnbe24nxfO4yp3rYBQWj5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743535445; c=relaxed/simple;
	bh=8ZKDGGf8d4/6E2eiXmvJNyK8cfqVo2y1RKH/3zxXGNg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m59d6ZugYhJDpNrX5jVZmJc3M0U0UQxrkkPT2cep2LQw1QLWp5MM33oBtDJsH3gN4gwVMUcPjsQqBO4RoLBTIn8CypM4hZJ3J57hNk9xNE9K/TRSaPJwQC3UtIJGDTsBggRy4hkJP4W5QwKLxOS6+qoNPURzamnzdDG4+1JYceI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MgPivK7x; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MgPivK7x"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso39480015e9.3
        for <linux-sunxi@lists.linux.dev>; Tue, 01 Apr 2025 12:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743535441; x=1744140241; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i8z+fSx5TSn2FrXLNFfU/1u/JP6JDm+uKA06s523rtI=;
        b=MgPivK7xpTLZuIcjtNw8nFMZNXlwG/QBHRYkuduTvfOoG18Lauf9B+mFa5hnUNK9tX
         5o5xwRK0qSzDmhZ6pryyllXU+SEtLED1HwodPKmSwaB2bI5s9NLnkTu05OKVdKFah85m
         bBK7WzRbrbiWBlCgvezxFPudkNeNO8PPRyaJLMYCQI/y6RmjjXx94i9UDXhPY3HhOXD7
         rZ3g8Z72UUl8hNxfdBaIx+iQCYtqgrlGDN4J8XjypmWivodhP5SMkJOQ+OWjqWMkN6dV
         Ox/Qtq6KOZGN1eJot85BBSZkML6c2GkjS8aOKlRnAA4pV/UpDDPVsvSeiQDq2WVgj+Be
         m4aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743535441; x=1744140241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i8z+fSx5TSn2FrXLNFfU/1u/JP6JDm+uKA06s523rtI=;
        b=TkyvIH3zl/j++hVJAgcw4VAP2vgavMAAoyxNFyjt4qyITP5ipFim4APS0aQoQrJ5vS
         Spmtay5MEBdx+feDnOJdxTufupeQvc6kiAsPFYqsBLcdNQuP26JVcGkwTnWSwovO6m8O
         b+0HcuVnXjBY7BsIsOCm/wtYmolY/G0H8FaTC+NqH/YAB8TuLcWYUN7wF9GEAIXwt2u0
         8bhLjZL0k4afU0gS47yvo4uuIeSTpvR0Vodsa4eaFqcRlFLSZJqKHVzHL4m5/n8vwS9O
         UQ1Gy62pllV28AwY+NR7HtjJ+/GMpGJR4wQ2eO+KBZh6dr5DlnHaE5hxHj+z5qZJZsTV
         R1Hw==
X-Forwarded-Encrypted: i=1; AJvYcCWMYkqUny5qmkh6srivyibYjiLCPvOdKSiRugNwtDDUAs6pupyHbMCzy9qncXPyALGVoE9OGU4i0V42Cw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyUUIdtIZ6kXgYbpNR5ckR0FE1aOAqH4lBi+A3aqsP7bewa+eE5
	U1Va7wWGHiYMahJB7DVWCVzyBBjlep58OLKnP7NM3ZC5btViE8Eo
X-Gm-Gg: ASbGnct1AanPIwmwbWR45d/0lGL1iV2IlCnltUO7vtToXZ/xjXgw5JdmRVwlxwlCUyQ
	CKjDapKLoQ8iMzePtN8/Vn5xX6DZ6RcNKlAEg9Yutw9WBL++fSjGhQw9qQMlYkLj84wkylO0T9q
	ygpH56kb+d9SC3G/kvoLPSEKlodzB/h10xkjVN0upwvLq0C/AXVMwvb9EJ27vXSlswYFsyLAAn0
	tLET3vexjxeedfbBVzNx+qQ7v/8wpTwLBYo2Gtil/Hc+UHWHYLoecaGt4cC4XlS6wQNPKtXw2SO
	VnsclCQu+fHkTjEDKRa3gsL9/hybzgyxWZzEb8z8d6l3BGaGAahLUruRaMTIw9Ca/j5zKcfG
X-Google-Smtp-Source: AGHT+IHEh+OGGdBfpbw9Ezhf9HsQaZImvcYBc/BECi3M6V/8EKmHii6CQkGoC7DxQblK6JTqZon8Ig==
X-Received: by 2002:a05:6000:418a:b0:391:22e2:cd21 with SMTP id ffacd0b85a97d-39c12117df4mr9452334f8f.36.1743535441394;
        Tue, 01 Apr 2025 12:24:01 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:c50a:8800:cf9e:ee0b:4a01:37f6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b66aa32sm15353438f8f.50.2025.04.01.12.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 12:24:00 -0700 (PDT)
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
Subject: [PATCH 5/6] crypto: sun8i-ce-hash - add IS_ENABLED() checks to debugfs stats
Date: Tue,  1 Apr 2025 22:23:20 +0300
Message-ID: <20250401192321.3370188-5-ovidiu.panait.oss@gmail.com>
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

Add IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG) checks before the
fallback counter updates to make sure the code is not included when
debugfs statistics support is not enabled.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 .../crypto/allwinner/sun8i-ce/sun8i-ce-hash.c | 22 ++++++++++++++-----
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
index 530c5181d73c..f2481e1585ba 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
@@ -60,8 +60,10 @@ int sun8i_ce_hash_init_tfm(struct crypto_ahash *tfm)
 				 sizeof(struct sun8i_ce_hash_reqctx) +
 				 crypto_ahash_reqsize(op->fallback_tfm));
 
-	memcpy(algt->fbname, crypto_ahash_driver_name(op->fallback_tfm),
-	       CRYPTO_MAX_ALG_NAME);
+	if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG))
+		memcpy(algt->fbname,
+		       crypto_ahash_driver_name(op->fallback_tfm),
+		       CRYPTO_MAX_ALG_NAME);
 
 	err = pm_runtime_get_sync(op->ce->dev);
 	if (err < 0)
@@ -198,22 +200,30 @@ static bool sun8i_ce_hash_need_fallback(struct ahash_request *areq)
 	algt = container_of(alg, struct sun8i_ce_alg_template, alg.hash.base);
 
 	if (areq->nbytes == 0) {
-		algt->stat_fb_len0++;
+		if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG))
+			algt->stat_fb_len0++;
+
 		return true;
 	}
 	/* we need to reserve one SG for padding one */
 	if (sg_nents_for_len(areq->src, areq->nbytes) > MAX_SG - 1) {
-		algt->stat_fb_maxsg++;
+		if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG))
+			algt->stat_fb_maxsg++;
+
 		return true;
 	}
 	sg = areq->src;
 	while (sg) {
 		if (sg->length % 4) {
-			algt->stat_fb_srclen++;
+			if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG))
+				algt->stat_fb_srclen++;
+
 			return true;
 		}
 		if (!IS_ALIGNED(sg->offset, sizeof(u32))) {
-			algt->stat_fb_srcali++;
+			if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG))
+				algt->stat_fb_srcali++;
+
 			return true;
 		}
 		sg = sg_next(sg);
-- 
2.48.1

