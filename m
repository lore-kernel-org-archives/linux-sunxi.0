Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972BB1E5B64
	for <linux-sunxi@lists.linux.dev>; Tue,  1 Apr 2025 19:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743535441; cv=none; b=lT24oMIzHYbdzv0/6HiDtTrk436ZYWCnEogGk4N4PLy3okKDUhwAhDdxStoZzh9zWavxuaBk9zY8Ez91IuM5+iJxd76zZ25s40rzrCjbgDsE67UOGvIfLPcyLI+/wywAN+1H4aVgzI1o5AnbBQ5SkpK4zKuzFglWKprkfJKDLA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743535441; c=relaxed/simple;
	bh=C4U1jwV2UTE3RqFfFsVaxqmVcfNk30K3AoLQSuFxdSo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ra3+JFpKlRP/YeIwYGCOwMPekgfjIpqoqiZqCmNgKi4nLca5+Eq6C84gzu/lTXnhGROIoSdY3xiCpxkJ713JGLa6YSXNOQlT8DVJSll2XzYaYqUqxjfYPf9Ffop4otc62LXLG0OSw07bvuzad6QpOLNggRmY2MZxFHjUSPvhGSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JV73NHf6; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JV73NHf6"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39c13fa05ebso1526135f8f.0
        for <linux-sunxi@lists.linux.dev>; Tue, 01 Apr 2025 12:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743535438; x=1744140238; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bH5VLtP+seSAMs8ZXZEEtVjeNgw0O+SRzuS1o+Cett4=;
        b=JV73NHf6YLf43qt04OSZhw/fn8op8EymlicH3cuXLXyXZN/tpCAi7KpWpn0T+lPBUk
         ZFOm60mSRUusAy0oCjwO85wew/eoU7Ati/4PsJGpD4qMpgj8Lwe+Pxu6hpHhhv49/8NN
         zEMwBfKbX46v8sMcpjLGUNsIvmCnEBmpxYJ2zmv1/ptdj25RZIOcv8g3fgf3zOuYDZt8
         seckFScL5nZGXAD7uir9vZMoRr1wkZEU7I/5wpVpQ3nfI0Bay8aWmzpYIDWjiqFTB1Nb
         FoxQp6d+fuuKvZeYGveLQZ3jviI17V8Q3qmWv6Aj0FsD9JcYWUcKcqylF8Y6rF0dPLzh
         kkeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743535438; x=1744140238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bH5VLtP+seSAMs8ZXZEEtVjeNgw0O+SRzuS1o+Cett4=;
        b=FHBMjClLsNnV4rdtxv6Wo+wOpkbQmC3WPMI7t4fPCJYGfZfKtYVtlTMngJYvkFQ28v
         C0YCKI6GHwtU0q6z4jhVV+On2SDDNvPfwGrrN8KaLuQ5qkL6CXbJ+C/Wp15xPq6qzWRL
         UP9It2HzRif91d4rJm3GU88w7aU1SXRzZd818uJBENLBjCV8in4wrcHT7Twpc4zYWdv5
         zm4Ku13NsJguqFE8Rt1RI5xRde7wtZE3K35PKVHejrgg6CPWp0RDoUK0kf+upgCM9T0x
         zV8pcGyO+WU5xfJjXMK+kda+tFGomiABsIAWkk7X9nM+wEyZ4YIQ2JbdPqhNRkUNY1kq
         1Ecg==
X-Forwarded-Encrypted: i=1; AJvYcCVJCyEvu0qyAes33HDXsuWpC7mxHvaOmOOJat70Q0Q3J1QPwmARRhV2YIQH1MTbbUydiejxvokb5Z6rpw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxIlDm/Ht8GClUMwHA5UOFmmT6sL3MW3dY51PXRrjuoLsuKtF/q
	N1mYbaw8rqyK491kvqpnUnqzW2uACw9qzJX2Gs5F47y7agaQxl8B
X-Gm-Gg: ASbGncsV2aOHSJNihrF1J33yy6ybg3RVhjobdY84Zb7mGKl8oilI6Zc3nO3lA9bK5nt
	JwJVltH2dCcHyOBZ+cy/QvJI/673TyvhSHJMwTfeVBeZW/UlAVFCllzakrIu+T4347xHwAItOfm
	i9ymjRl/Mn/XmBop7UJ8AkECC0Ba9/Y5KEJKaZbiceQYRqFQ4QYLA+9Tr7g0eteHQ+QNd1BGire
	aE7LwJRGWyI+3cQQ6KtrLVPeeUk1VFAKLCJkngQwWB4pv9/vbT1HedeZAswBFGvCxnDhI59JZDq
	7DOSKdE6iyB1Jx2BDpwAefmzyvLGjNB2V0m63JCIaOgHBvTmqVvSZfGSS/r2odu5Jl+oTNCBCAn
	USFy3gJY=
X-Google-Smtp-Source: AGHT+IEeNatuio+GXvnz6jtis2Ifu8CXZWb0U2xpbF/9zUj/YkR/FHukm5fxlTJZb1XZQEdPrISlBQ==
X-Received: by 2002:a05:6000:40cf:b0:391:2e6a:30fe with SMTP id ffacd0b85a97d-39c121188b9mr9767506f8f.39.1743535437739;
        Tue, 01 Apr 2025 12:23:57 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:c50a:8800:cf9e:ee0b:4a01:37f6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b66aa32sm15353438f8f.50.2025.04.01.12.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 12:23:57 -0700 (PDT)
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
Subject: [PATCH 2/6] crypto: sun8i-ce-hash - remove duplicated fallback checks
Date: Tue,  1 Apr 2025 22:23:17 +0300
Message-ID: <20250401192321.3370188-2-ovidiu.panait.oss@gmail.com>
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

Remove duplicated fallback checks in sun8i_ce_hash_digest(). The same
checks are already done previously in sun8i_ce_hash_need_fallback().

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
index 3f9d79ea01aa..2c2d285de154 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
@@ -244,21 +244,11 @@ int sun8i_ce_hash_digest(struct ahash_request *areq)
 	struct sun8i_ce_alg_template *algt;
 	struct sun8i_ce_dev *ce;
 	struct crypto_engine *engine;
-	struct scatterlist *sg;
-	int nr_sgs, e, i;
+	int e;
 
 	if (sun8i_ce_hash_need_fallback(areq))
 		return sun8i_ce_hash_digest_fb(areq);
 
-	nr_sgs = sg_nents_for_len(areq->src, areq->nbytes);
-	if (nr_sgs > MAX_SG - 1)
-		return sun8i_ce_hash_digest_fb(areq);
-
-	for_each_sg(areq->src, sg, nr_sgs, i) {
-		if (sg->length % 4 || !IS_ALIGNED(sg->offset, sizeof(u32)))
-			return sun8i_ce_hash_digest_fb(areq);
-	}
-
 	algt = container_of(alg, struct sun8i_ce_alg_template, alg.hash.base);
 	ce = algt->ce;
 
-- 
2.48.1

