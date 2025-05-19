Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0196C1DF273
	for <linux-sunxi@lists.linux.dev>; Mon, 19 May 2025 15:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747667672; cv=none; b=EIl0PLh2b9TQ1hl1IdedENMsfK1juZdy8w8mAk4BJwJO+2el/0xir4k/2pOIj2X7mBAB+wScF58qKXw2TnYo34dJ8F/3HKcV9m8NQEkPpTxcyEhWmTP0VXD7N6na2uGLMxAllS35KODDTrkgDCfVAAQlj+yVOjhDc5TJNBoXGbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747667672; c=relaxed/simple;
	bh=tlVXRvNMHzLQ2IjUl++okGPXDqq4MPvOzcHaYSkpS6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JslbY42Doh0LC7d746F5IPDArkc3cw0bqyvvP/HvAhzYT/f8mKaWyyWrYS0XdmSiot0noFMl3LllMutNJpgr7XYCxgreCbRysG7kFIZ7/xTB7wUSOOs+S+SeXu7dHhsYc9ezzoscw89wFv9rsKCr2Czl/wjwje8O3DmULPvatAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dvjqsT52; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dvjqsT52"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-601aa44af77so3360662a12.3
        for <linux-sunxi@lists.linux.dev>; Mon, 19 May 2025 08:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747667669; x=1748272469; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IqcrMvL7TRi/F7iH7e+SW+BnTVjngWX2CY239LaHS6A=;
        b=dvjqsT52uctR9iRDHNYBkLjieKqel8k07Z6Kem7Nv6wgzfwnxH++8wn8OdAS1X16gX
         riTZ+vPijcjnHHU7Q6e9Dbfszyy4iG9x5grdp0c1Ow6P7dzdMnad8C7ssLFzEnAaKxqQ
         OkMAgEfHFMlI9kRtD5HU8b4PhSyGg57Hn5Sj+3FHUvxowHWJeGsptAKkFot64y7j/fOX
         W9eDO/YTt+e/DYvvjFwE/gULfvqrkxkQiHiqdV1zUSwgPlb9KzqUyeNcoFLJpRKGocvK
         ymvl7kGVJc4eWVhZyStl+TdLRPApJRxU9GTjBcWCL3LWzCop0LveGQFbF4TTNMtBdBMp
         6t0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747667669; x=1748272469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IqcrMvL7TRi/F7iH7e+SW+BnTVjngWX2CY239LaHS6A=;
        b=mx47eGbeW3UM1Fuq+yS0HchJNjW1uL3ng2r2RnNy9GEMurlUCY6Ab1cvZvnj9Ok8Cj
         vV5mgiBpr5W4anceBYFIaWhEvGnv1wCjXg5H3gY1Giz5N8gr/t6ttvgRitK68/y0edt9
         M/VXYkah59wOZjpapcR63kpTN9hnDunlQKngDNv05UTgwOZBZQSI3oNLaF0RdwHAfpYi
         mUDS57g7PaL3JJUCXWfRSGRFbhUZ9/d+QwwlouV2oVMBOIz0zUqyrVnQFZv7L2jkSx6y
         v7vXevVQNUr2veMWF4FT8xnqk1Qn8DHV/VkcBB1aC90tySbE8DnyXGMoACbJrdqIug3L
         m+pQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwZ9IZD5RHnX2QTH35/o3VKqBGFZV3AZZbstSrmWPvZlX9OqITAr207cUbqU/WexBBxqefttVK8sCDsQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxTg3SKk9DplH+uDT8fH2Alg8UJdTmxfZHg9Ao2m6xDwKBvVpjR
	QYZMXTf3YvAAvIiCCvD5yfsWSPC/zflYsMhn/OQ2sqhAFxd2yAYEfGqe
X-Gm-Gg: ASbGncuecIld7euG2Dg6yrH4Qcwi/hEbgo6pbJBK/5zPIrBiBkngIRwQJtGYSqVG8Sr
	CwPU4qt3xtyYVPJIA6Y40y69KWDgY+aP9oHoWS2kJ7iBODjN6AYQclBjKPfbY0pegYwOqKNYiwx
	Q6x0WjjRSHf3sIiWcPaNKPRAuMl6Ekqhbea2Vj6Wom7p0mwTlJPKOqB+8+Cydwdw/PAOLyqwf5m
	rXqDfkVHn6YFcJ0KYVDycGL/hIsh6XX+4cIuJfffrv6UMFTCN3PbdLet/33iJP7S98wi1OJPkNj
	xDhJvtM8b8HVyxnWQbMzHQTEp8GtT+QacaviQf+KsKjwL9fs4iwybb3BIlco0UuynYFSexxxMXP
	nGvo=
X-Google-Smtp-Source: AGHT+IEyDWsgk5ZuKcJJnCwuMrygWqmpsdfXmccP5TnaNBnDa5/JU98yEJj7J7lss4EJg1nxvJYFvQ==
X-Received: by 2002:a17:907:1b09:b0:acb:b900:2bca with SMTP id a640c23a62f3a-ad52d07636amr1189789966b.0.1747667669049;
        Mon, 19 May 2025 08:14:29 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f07:610b:a400:6472:d2f9:d536:4c30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d04b08bsm608522566b.13.2025.05.19.08.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 08:14:28 -0700 (PDT)
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
Subject: [PATCH 1/3] crypto: sun8i-ce - fix nents passed to dma_unmap_sg()
Date: Mon, 19 May 2025 18:13:48 +0300
Message-ID: <20250519151350.3442981-1-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In sun8i_ce_cipher_unprepare(), dma_unmap_sg() is incorrectly called with
the number of entries returned by dma_map_sg(), rather than using the
original number of entries passed when mapping the scatterlist.

To fix this, stash the original number of entries passed to dma_map_sg()
in the request context.

Fixes: 0605fa0f7826 ("crypto: sun8i-ce - split into prepare/run/unprepare")
Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
index f9cf00d690e2..7cd3b13f3bdc 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
@@ -278,8 +278,8 @@ static int sun8i_ce_cipher_prepare(struct crypto_engine *engine, void *async_req
 	}
 
 	chan->timeout = areq->cryptlen;
-	rctx->nr_sgs = nr_sgs;
-	rctx->nr_sgd = nr_sgd;
+	rctx->nr_sgs = ns;
+	rctx->nr_sgd = nd;
 	return 0;
 
 theend_sgs:
-- 
2.48.1

