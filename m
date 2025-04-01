Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D478B20F07E
	for <linux-sunxi@lists.linux.dev>; Tue,  1 Apr 2025 19:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743535443; cv=none; b=kIbVIIrUhbRRyZtTcRaYQd3L2XjCVLs9SXqNavgdBNVS9tz3ICGKIU9BRJoj3FLy1clF7g1bQlB9J2pC+iwibCfQurDCG+SyksONdh0oQKfkApAx+C3JKUI9DIEhKs8YR/m96d2GF08ZVg9w/fjiNUTU4+nX4Kfh2yiIUf3gz3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743535443; c=relaxed/simple;
	bh=ujIPapzlL7mjHgW3aviWBgtecWjNM0nt1PjVn8npb/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ua7pw6aqAw10CdmKPtRfDDA+3xHJTC7POc5NqKZ0IXgwHw5ikxx5jnRoCGRzVk99/DWxUyQZu7tKg/aus1qJRAeMCxCDaWLpWFmqAInkyLCHbPbEt4tw+kAV3uQZaMOrMxqzUzK4WyiQgZ75HvIno6eGsh1wwNnCNzrLGTHBBD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OJU8uGN3; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OJU8uGN3"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3965c995151so3253184f8f.1
        for <linux-sunxi@lists.linux.dev>; Tue, 01 Apr 2025 12:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743535440; x=1744140240; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/+iZ7oXBPhE3cNOeJn0BX2fJsfTTe1JAGSbvb0XfLY=;
        b=OJU8uGN3rUvOte7YnJHMvfT42SBtlpe+Me0DvfABYkxV7LfbAqolVsr9EV58YnZLUQ
         Mmezm/gbSU8AD1rOyk8KWIMKxf1qpdI1h/xoWZhIa4xClo66UBlrKYcDipukOTet5/Wt
         Ojb19sWQEVAh5UbCdRaIJGKwuqjn+7T+o1LPT85uPiLQem2FpgKPqiBpXgLgQs+7Kzje
         MeuQ0uLuKroYovZ0DqDXulk4KNitkzYGyvQ4KcXBc9Gk9eaMWXFJ5eo8JjeIcFuuMQ1Q
         WVcJSJxTwlQRRETUSMIs6dOzMpHcOsundqh9IRmDZu20TKXfqwFPFzfb5J6N7hNZ1J8S
         PYsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743535440; x=1744140240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I/+iZ7oXBPhE3cNOeJn0BX2fJsfTTe1JAGSbvb0XfLY=;
        b=eZNDUP534TR0a9JblV2k+7zhMuecn7ZZEfCd7ofxeDc38k2YjTD6D4HEgW5lG8rkZo
         5yftvazZhsrX2E60hn3uWzPcvYt+d8muBpgr1qvfzfSJl6wkV6PxKPcIwk2QrRU9FUVS
         dVOhO78X1S8glXmMWln+HasV14tjYc9VdiO/l5ky2UjRhpH9+3c5H43OJnMkPHD54Tdn
         OrS1Ssj2TMqEENTqhVa/mJyRudzYweFltx8QHUNGxzsKZHxcjlGoyCnDIuFCiOvb2pU0
         IHqYfrTV+EicXepsxRKqk4WCvYgl1YA8BvEsFA6F7MyZbGEuu0uhAR/UYUHg2i5aLgNP
         yQMg==
X-Forwarded-Encrypted: i=1; AJvYcCVNevHafxoFX2TO6Q6HY7Cz6kzz1Uk7m3DpLTUUnTigi9HfU+b2pPOJbFCPAs7nbxQQERA3INhAQtF2Mw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzXuSXEz0dbk+eZbcp3hHohwO0L+72Q4H+ijYlpQ6WIVdRs4lmw
	7NQd5ZJSDrO2DY94eZIMvFJo2f4sOHe7/SvvdW260T6oVUEbxq00
X-Gm-Gg: ASbGncs+kSsfr7JnTDxvc/c/ABPEnm9E5+aMVqGVAcdhlTTFrJ8Z/leU7WsmL8ZyDCw
	GSz4ESANuKSRu8cEeDzhaXfzd+EXtV2R/mJpkgI4LmX65QD8rnHRTVeg2B4aizMxdB22I0Crvlq
	34n0v0Sux18pnFasyLmQpha3KDUQdXKgs4TRJUBgKZCVHfomXOsq7KSMzfGiymrTr4cMCWwjiYj
	jY791MwGMMdo4+1BTWgXzF9WEClN+zQQ9zk1FrlQUSO0IUPmgoDu3HpfBFJNSCCWarAX23IUpii
	vs/Ycd8p1opr2CXRgR8CZvzVFRBJ38fbqr4p+Ol4MpK9gM8WvklA7PXl1ThQNqMHBogS8LaO
X-Google-Smtp-Source: AGHT+IEroLhlH55Nn0a2Cu0BMYw27BSdC4OLp0dlkWXs82H+dhWwczs/WCChC+qm41GDorZgNFvJwA==
X-Received: by 2002:a05:6000:40ce:b0:399:6ad6:34 with SMTP id ffacd0b85a97d-39c12118e33mr11160301f8f.35.1743535440077;
        Tue, 01 Apr 2025 12:24:00 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:c50a:8800:cf9e:ee0b:4a01:37f6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b66aa32sm15353438f8f.50.2025.04.01.12.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 12:23:59 -0700 (PDT)
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
Subject: [PATCH 4/6] crypto: sun8i-ce-hash - drop CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG ifdefs
Date: Tue,  1 Apr 2025 22:23:19 +0300
Message-ID: <20250401192321.3370188-4-ovidiu.panait.oss@gmail.com>
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

'struct sun8i_ce_alg_template' is always defined, even with
CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG disabled, so the ifdef guards
are not needed.

Make sure the statistics have IS_ENABLED() checks instead.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
index b0959d8218cb..530c5181d73c 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
@@ -31,9 +31,7 @@ static void sun8i_ce_hash_stat_fb_inc(struct crypto_ahash *tfm)
 
 		algt = container_of(alg, struct sun8i_ce_alg_template,
 				    alg.hash.base);
-#ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG
 		algt->stat_fb++;
-#endif
 	}
 }
 
@@ -354,9 +352,9 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 	flow = rctx->flow;
 	chan = &ce->chanlist[flow];
 
-#ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG
-	algt->stat_req++;
-#endif
+	if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG))
+		algt->stat_req++;
+
 	dev_dbg(ce->dev, "%s %s len=%d\n", __func__, crypto_tfm_alg_name(areq->base.tfm), areq->nbytes);
 
 	cet = chan->tl;
-- 
2.48.1

