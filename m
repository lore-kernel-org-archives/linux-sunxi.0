Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84F72500DF
	for <linux-sunxi@lists.linux.dev>; Fri, 25 Apr 2025 12:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745585153; cv=none; b=aYLw8M9nHCgamVBMCUxMsXGiyvsJQS1z5ttcm1QI1wbpbhNPp1PNf+1HQ5tDntBzbHZO9Dn7XEgNsM2uSn4Iq7O7fbOyB3eZ2f10RzWtlwcahEOlhx5TQh45OGcOlOkmZtf75xXkq5AnSX29JIvucsuKGUGgIxLSwj6NV2pG2Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745585153; c=relaxed/simple;
	bh=exRkwnVeS/Cdsai2sezNI/oSufx/K7jdx/8Kohn6yVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cBj2xt2XWFl6o+UPNZ0rJT2ow6Mh6ZQk0EyeryZEGhP0uD4Tl5QxsXugVyEnqNsJeNd29pw6JM3tJDQoFIRNb9OKWUhNZNuWxT8oyXlFdOOUnzv87V/RHVDwSrZc4pqwfccxRoGy0n+d2f2cqSXruH3N5W5imRskQBx9FEleryk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kXQ8Dmf0; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kXQ8Dmf0"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-acb415dd8faso324137466b.2
        for <linux-sunxi@lists.linux.dev>; Fri, 25 Apr 2025 05:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745585150; x=1746189950; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zJZkOqtqIFJNQlkOlUTiGoivFhrWHNceh/fOrvQbc9Q=;
        b=kXQ8Dmf0hVuqzsDul/lsG2+y0AnUuJHuFa4DktsEUBY7xTNChLEV0ALo+Xi76D8cs9
         2Qpu1DhgmzIf6zJ79/y1TIodzNO5BV1EzlIoEQFzeMdB1RChPyU3cckg1G9pPxawzFL6
         6SB0RdH+G7HGF383hGeI1A+3g1o4HLQo4g34I17RrjSaQudX7otzknNRwXeOm9q+kkum
         frUyO/y7dccFXwx6+P0NX0/2mceI7thITjQTHs22CQSYqEOLGdxXMhrQgZ2WsGk/UA07
         hc7IH0zsUvjdhNXtrqz5KkRe1LZy6ZAX5xRVDerwg6p3IBXjCziojViaBbPkKqSto/Ht
         cSuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745585150; x=1746189950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zJZkOqtqIFJNQlkOlUTiGoivFhrWHNceh/fOrvQbc9Q=;
        b=oQpZhBUiZYECeWtuMeZICcW9aUXZV6WNelssNHi4e1aLvARLs8LocJlPT+P3b/RoE4
         QHzVzQvrKyRtr8Rt8atuD+vDpRDF7PmMgT+j1CS7uLmE8VTXvsABqh0SPsBjYGdIXV3f
         JDILtnTEeusztvRmezSwyWg6M3dZUgEbLYyf+b4fc4lZWrpu1P0wWiVLU1BP4IjZPdsW
         WmFoRAIzn7DPX3aog+uxkkVtSC9GKvQBWTHZLoc1Pboaazt/OWxQ5W30Q5+4p/CUtwAE
         aWP/bAEEWSUgyaiJLLW61KK5WeusyjW5QV0fO93RiWJkLaI2uth+bazTOcA71ykvreir
         6LWg==
X-Forwarded-Encrypted: i=1; AJvYcCXg7aAP9UealgvVt7cViBAddlpE5TZiel7m5ZabXMzJrkoLXVRMk/FQwcxaxkdpockSjv29er2IzEAkQQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzSwTirLzdgukWeqdVOv5ob++l9JjUFhGoGQJ3OqlcQZBHi5UCN
	KvPD0ghSTLr7WLDgyclTAhVX+lPfMaExeccQMjTnPT06Yw0fLlAB
X-Gm-Gg: ASbGnctCd5j8V/fq58P9xzlU2P1W+s9pbjFArTHYJ96nEUu4yK2biTVGx25BWTJ7EpO
	On1vSCBoi0QMbOMhNVbyWSw/IJBoyOQukUxgZw2PIiHCvGVaqzd+HTeDEWt9k3su49nseQQ5PxA
	WLKP+4F+mkBhbanLfK55hpB5ba4OEsOJPgk4Ia+mkVjUWkjuN6BmuqxPnEMpWFhaimjy/CY98vN
	MMjCgdvBfm1pajO6YKYb7DrubHFqAbKKd0fdORLLkGBy1rocGT0koUOijrODxQphpDBtNNw59k7
	02u5zd5eBk3IB0D0yvaFvfhwXRfxeO2yiUFSgZLyafqXY/gTjaucGpV6nypJX1siN2tL
X-Google-Smtp-Source: AGHT+IHX1fUvg5R4L0dWk/e/ZPWlYj/hBTwXn2LGbh3X7N19EfXlUA+lvP4IWHRCaDEIAuZ5mEtnsQ==
X-Received: by 2002:a17:907:7ba7:b0:ac7:cfcb:c3e3 with SMTP id a640c23a62f3a-ace7136ccadmr194648166b.45.1745585149643;
        Fri, 25 Apr 2025 05:45:49 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:c50a:8800:cf9e:ee0b:4a01:37f6])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4e7094sm134641766b.56.2025.04.25.05.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 05:45:49 -0700 (PDT)
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
Subject: [PATCH 4/4] crypto: sun8i-ce-cipher - use pm_runtime_resume_and_get()
Date: Fri, 25 Apr 2025 15:45:17 +0300
Message-ID: <20250425124517.2225963-4-ovidiu.panait.oss@gmail.com>
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

Replace pm_runtime_get_sync() usage with pm_runtime_resume_and_get() to
simplify error handling.

This is recommended in the documentation of pm_runtime_get_sync():
/**
 * pm_runtime_get_sync - Bump up usage counter of a device and resume it.
...
 * Consider using pm_runtime_resume_and_get() instead of it, especially
 * if its return value is checked by the caller, as this is likely to result
 * in cleaner code.
...
 */

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
index 433cd18f0b5b..471eec743f1c 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
@@ -456,13 +456,12 @@ int sun8i_ce_cipher_init(struct crypto_tfm *tfm)
 		       crypto_skcipher_driver_name(op->fallback_tfm),
 		       CRYPTO_MAX_ALG_NAME);
 
-	err = pm_runtime_get_sync(op->ce->dev);
+	err = pm_runtime_resume_and_get(op->ce->dev);
 	if (err < 0)
 		goto error_pm;
 
 	return 0;
 error_pm:
-	pm_runtime_put_noidle(op->ce->dev);
 	crypto_free_skcipher(op->fallback_tfm);
 	return err;
 }
-- 
2.48.1

