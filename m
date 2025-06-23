Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F10230BDC
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Jun 2025 09:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750669870; cv=none; b=HZmyAwPYW+79SdVCS0wujBTDubHqNfwOdVMXX2Z89jkP471D2QUY3lK64BMJlF4VtHQZk9Z0188HzXHfcVJ0v7QBaiAfhGf5+Of1ruSdKJb1FgHOA+LU7orlJotnzJuD34Lx0+vCdmfBPQjP7VY88W/ixNIyxvgklHN0NKfnxyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750669870; c=relaxed/simple;
	bh=jgDGs6S8aBeEsYJh3stb90SoB64xktcDYB4e9GaxcnA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PPnbaig+RukTqxLYpUeSLDBIJWkmbL1lASyQGjHNKrE4bQZJNX4Te+sSOqwcAg2hVl0MJps5Zkrg3n9/LIAFqYHcSWfQtp5OZ0tnauL46pqb21TkK2Xmi0wkAcb2NQDVzzqgdJIg2ZzR2J12ttt7PKOIXTDcVgZPPrHQ9lJK22I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m+oqVY16; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m+oqVY16"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45364971d62so390005e9.0
        for <linux-sunxi@lists.linux.dev>; Mon, 23 Jun 2025 02:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750669867; x=1751274667; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gz8t2oZkkwfZO8pX28gYQB4KOa728jeU/jhzTTj6UZc=;
        b=m+oqVY16rDSJ38026AAquhV45a93sTqgGJBBoh5cY5g4koM1JpMVFCVI3pP8J2csIU
         u1t4CtGbqaIRFnFJurZgXpHlwHBc+TLatsYmdqVPIPqBuNdAfXvfwYXFR9z7Dpyd/p2W
         pzziF2Yw1gqLLgrSFg4CbtwezSL5wtpv9/rX6a9TaumGkx3sWx2fivlGJBQFq1OWGAIj
         H8Z/Mesc2JFjw6s509R32g09FV+WOcpu+JfQwhRAPcZuJctoQ/BcMeaQPDzYVYJSFCsx
         QJc+JQivnUaQoRHWxpdSAYHe8Ay/sghbK9jTRGUKTS9DnMLNtS9trnRzQS7FKz4zHDvS
         DE4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750669867; x=1751274667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gz8t2oZkkwfZO8pX28gYQB4KOa728jeU/jhzTTj6UZc=;
        b=ZEaz4+OULehzzCXPBNBVntQdgJMc0GlOPSXavEervwBcM0L4j0KpmqZJlknT/e+DFx
         T/XSJ5C4a2yTHj2I+uOtTpTyg1C2/3OgQ3YAZjUZg4r5KX3k2Zo/fY0ifccDEy2Qkl6R
         NoGR7FFY5Kg10s9Eh0T/NipnYwvnhQ+KPUwQYb8zhQiybdNsEgKLjOFNu24+XC0SW69C
         u7oqeZPRy8AwYgIS0HJNxPAyptRL3aD/QjgfVxEYUKNoEs8eRm6c5dXJ4cV5gwyFTJHJ
         OSl3Ze7teQwNYudb+BuBjVjCVanjg8X0OiENfYY6ZYCUMXNrEnPXHNaFgytDKtxJqxDc
         B4JA==
X-Forwarded-Encrypted: i=1; AJvYcCVrzWABsrgvxcOlSr1rWuiTRZNTycORRwwtsNh7emVyyygU4CBqljY/tBwX4Z6OfgHKoAjE9un/J/QnkQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzAMudGetnfh/xtkbTEd6JLpBuxzvkTAPKneclBUTaydjkza1VH
	GI9o9tLQGWaGCS6nP8JCfhjyGDLDMkfbglLB3VyRqO69aK4Q9VSkGDsE
X-Gm-Gg: ASbGncvn2spsMk3zmAI3bv6onNYqkqyqUoBnfvR3s3ebD/TG34tStftqbOJw6UHEL8h
	7anx5b4px2DsY6yZGp43oYDAPyJ2Eu03puEtNYCtsQfo62oMdnbAfTQeGykwdLGPypBZq2KMtdh
	vfuL0vDHUFPWmQWSYumncMdPOSmhAk3ABGuPLze5dK/X33JtH+YEiSRWMTE+lRXunxJjyKP+Jt2
	DQDphmFS6Lcd1+tEq1WNI08hWBELOqhcbsFuWMyeGy+XruJ6BeVxS74Qp2s4uykwCTWg9WYWeKd
	Qb7LkJDTWgY2joGZnfEdm60nO9HSEXPJzf7bOpIDPd7s/IddUJJYEoQNjy43DKMJniF87/M1nZU
	QR7CcyJcA2jVNWw5lIwt8uBcGJg==
X-Google-Smtp-Source: AGHT+IGDWWZaT403xBnNIukKkNikvHSsmJYoL9MI3srvKJv2z/ou2KLsn00R7ev+p8rY646+IShMCw==
X-Received: by 2002:a05:600c:4685:b0:442:e608:12a6 with SMTP id 5b1f17b1804b1-453653d3d5cmr41354345e9.1.1750669866408;
        Mon, 23 Jun 2025 02:11:06 -0700 (PDT)
Received: from thomas-precision3591.imag.fr ([2001:660:5301:24:9a26:612f:7b52:ee76])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4536466596asm107683615e9.0.2025.06.23.02.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 02:11:06 -0700 (PDT)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	Corentin Labbe <clabbe.montjoie@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] crypto: sun8i-ce: Fix `dma_unmap_sg()` nents value
Date: Mon, 23 Jun 2025 11:10:06 +0200
Message-ID: <20250623091009.65436-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `dma_unmap_sg()` functions should be called with the same nents as the
`dma_map_sg()`, not the value the map function returned.

Fixes: 0605fa0f7826 ("crypto: sun8i-ce - split into prepare/run/unprepare")
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
index f9cf00d690e2..ce9d071f5693 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
@@ -326,8 +326,8 @@ static void sun8i_ce_cipher_unprepare(struct crypto_engine *engine,
 	struct sun8i_ce_flow *chan;
 	struct ce_task *cet;
 	unsigned int ivsize, offset;
-	int nr_sgs = rctx->nr_sgs;
-	int nr_sgd = rctx->nr_sgd;
+	int ns = sg_nents_for_len(areq->src, areq->cryptlen);
+	int nd = sg_nents_for_len(areq->dst, areq->cryptlen);
 	int flow;
 
 	flow = rctx->flow;
@@ -336,11 +336,11 @@ static void sun8i_ce_cipher_unprepare(struct crypto_engine *engine,
 	ivsize = crypto_skcipher_ivsize(tfm);
 
 	if (areq->src == areq->dst) {
-		dma_unmap_sg(ce->dev, areq->src, nr_sgs, DMA_BIDIRECTIONAL);
+		dma_unmap_sg(ce->dev, areq->src, ns, DMA_BIDIRECTIONAL);
 	} else {
-		if (nr_sgs > 0)
-			dma_unmap_sg(ce->dev, areq->src, nr_sgs, DMA_TO_DEVICE);
-		dma_unmap_sg(ce->dev, areq->dst, nr_sgd, DMA_FROM_DEVICE);
+		if (rctx->nr_sgs > 0)
+			dma_unmap_sg(ce->dev, areq->src, ns, DMA_TO_DEVICE);
+		dma_unmap_sg(ce->dev, areq->dst, nd, DMA_FROM_DEVICE);
 	}
 
 	if (areq->iv && ivsize > 0) {
-- 
2.43.0

