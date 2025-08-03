Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575F8210F59
	for <linux-sunxi@lists.linux.dev>; Sun,  3 Aug 2025 19:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754248273; cv=none; b=GoNjxp5W52OMnIYu1MqNC/V862NtfP5ofifmqt5K505hpD75VO4JHCKjuV48t3jrD5yKyji/A7DrOzV2xkmWz8aeck+A8dC4Sv5jXh9D6Clx0S0apQhuoNQQ1pk0i8Y6NHZ+2Pldq7V5C2aw1F3OEzWbFHlJS7S51xo8XUHOpQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754248273; c=relaxed/simple;
	bh=VLxVkCzDUptZN3MLV6XyYZWlwBVycUnPTFTRKmIikGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WQLksJp6nozVydBVY7kDKlnV8eda9GLJILGdGznRASCKU/QGHBbAriEGjqr9mV5KxWlbuiYyoOgav4G9to/1MQ153aMepD8phPWbTqI2u/QUXbT8DjIFjwelt9SSv/OFzrFy6IBm8orB/ANmvJq6zao1DVTqoCbwmIx3nnc59+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dru8Zq8r; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dru8Zq8r"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-455b00339c8so23407885e9.3
        for <linux-sunxi@lists.linux.dev>; Sun, 03 Aug 2025 12:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754248270; x=1754853070; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dlcibDkuEhs59MfzxPNpL2Xe4LDD/D/d8iw52Y6RVVM=;
        b=Dru8Zq8rxzjLXwqcLKnORahYZ8KeyxTlq79XR53L43ZrxcemCvWB699m0aQskXxA8x
         oMM7nvzUtT+wMFiKd08cU2m4XTpjg6nVgSezUSNI3Kgxau1rrdUY8CFoof5FQRABXJ8O
         TVBKQKH0cbjjDtLog1CxRCVqgiSNEpw6jJgMyiwSG4nJlICtYVflKcJD29YgtJ8W62Qi
         XcDqqkCb6crWqg54/4VZSXgtMv9pD5lVACO2jxZxXR9PjLPPDiIXOiNOC3N2f6XZw8G/
         LFOH2czHB/2zUss8bAh6VoexHM+5CrrkGBCvICKaJ9zK8pqVeCj6todIFWwlb9iP3FYe
         RAMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754248270; x=1754853070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dlcibDkuEhs59MfzxPNpL2Xe4LDD/D/d8iw52Y6RVVM=;
        b=vmwvF2RH1r1n5ZMtnvzVK8Nzo2mXNAOpVu4Tu98vbdjkSANjsll6x0MKVMlYEf9FDh
         9r5gk3wi4IKlBb/iE3LsqAH0H2ma8PfUGY7VHKnTXRcNqXGpxWGWUTBmeZL+LjYmY7uX
         pWBLPnMfMk1e2dIKjMOpSVi156TVcn2ABq0h1/2SjVZvMwOyvx5GxhCRdTqZkCopq8k/
         X8ibg/uNK+B4buEk5o9RNRfiXkf43iimm3KmAVcBSeXOW2kZWbfJEigHCq1rTeb72tK0
         XfZvYMKkOmcLtn0X5QQftJaBQBe/RlAgoLd6np9KWvu5K7CE+0qmPkTRRi+ggMLpiqz1
         J03w==
X-Forwarded-Encrypted: i=1; AJvYcCUQfO8wDETv+9bcTNKhkM71An2CwsyHjIsLI7IBuCRAbOFWbbnuFsvREErfp6tOZFtOZpHCClHXRAQAZA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxNPl0SzyFgw9cPrpKt1juCaX+gMcii4XKQX2A9Xo/fQOHjcY/V
	Y70tsXOsyKusxBu1jQFKbsfZRD/WEF48oa3OuRzpOCKO7UbLuALtxbYy91K4mw==
X-Gm-Gg: ASbGncvm4wqf9fEAHLU+VUFItX2aQ3htXVgC0UO62viQoykuw7xoTfqe7otkFwTR/k4
	hrkYgmsDVcYhkEYoVdZ+djfIWUtfRhkWXaXtjQdgj5DHbIFqla0PDMAYP2kPQy14188dX5tfhph
	ektoF41bf5Qd/zsdc0p0CrQ5zq9NoqZw76rtEoWsUmwk+HnSw9MWiO1kYwRmdKOgoMeZcpMf0CE
	hHBEJLW6IYnb1lFX9VOGnJ3XOqoLp3PEmyOouGZ13PEkAZFW7QtyrqcMjwEQXERmaUDcuOlRnE0
	28IIAey2yJ1Km3uahxPCDpYJa7jLV4g//BFQ7dxs0tslGBdM1ugUec0m/zSZzPznPtiHwpIyiLz
	OPlZlUxzXWKSte2oiIq1YzVbfxNpMAgUy0hzrKSKnpyDw
X-Google-Smtp-Source: AGHT+IHtfKq4zUbwXfC6aQHk7cG+DjOfnqmfBGllrsesIhnmsE+kULjZ44WqEg9ZZudwAxTaMk52SA==
X-Received: by 2002:a05:600c:19c9:b0:459:d494:faf9 with SMTP id 5b1f17b1804b1-459d494fd04mr22075015e9.10.1754248269489;
        Sun, 03 Aug 2025 12:11:09 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:ca0d:f700:1210:b727:adc8:716])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c45346asm13099210f8f.39.2025.08.03.12.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 12:11:09 -0700 (PDT)
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
Subject: [PATCH v2 6/9] crypto: sun8i-ce - fold sun8i_ce_cipher_run() into sun8i_ce_cipher_do_one()
Date: Sun,  3 Aug 2025 22:10:26 +0300
Message-ID: <20250803191029.3592987-7-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250803191029.3592987-1-ovidiu.panait.oss@gmail.com>
References: <20250803191029.3592987-1-ovidiu.panait.oss@gmail.com>
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

