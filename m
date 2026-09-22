Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A793B7B93
	for <linux-sunxi@lists.linux.dev>; Tue, 22 Sep 2026 03:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790047253; cv=none; b=sP5egc/oIbFnTubEj44GiJ94K3juhO5SlDTmAgmiCgo6poIAum+FLnlffac2xm+FlVNKbc8ZR8RvrKKg8TzKUjqMAn8tJQG/shmOzr0cn6aFexGdtbUg7K0X+wcoo7EGmzA2oKb4iAlPXMJH+IWEGsKxNTzBLjNIOa1H6pGTHhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790047253; c=relaxed/simple;
	bh=8A5lbFX7jPgNjHXFUP9sZMZQ7/uPse/Wza7yZTZRNrc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dPJH3+I9K5raVTFgdsKm8CAcqxuZAq6BAj2SbxmLWyOjMjIl0E7ZKOKsKfLo3wEMStFBdesG3BflDBAWbONEon9feWe++oIJniFpZXIXPV4Ac8KEJy3JBa0HpqzOjWaghYCQbMeRpK56m5FyVg1pe+tBdPmASG00tebbf72NLb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jwglAlVA; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jwglAlVA"
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2df4aa80a73so14901245ad.3
        for <linux-sunxi@lists.linux.dev>; Mon, 21 Sep 2026 20:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790047251; x=1790652051; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z7TxIVacK4CiPP85Zm/zWINHMIm3Lw/0BaBVswTN6EM=;
        b=jwglAlVAR93Hj871Rl6Rhe5Plx4FW9R256uhjYrxJljyggdZOfU39RXZ2HBQkm++V9
         nERexMAqbv81Jl0OUUiNpxXt7UEZky9yXL4TczeZeIWkLy6qKe9TGrCFB6VtRa13zS26
         lHn+Pu+fBuGct8Joi/zCpBOsP5eBWByBNVAnG7lZ1bSf3n9FkcFcJgYPA1929oRiJZX2
         +TLwUu3JvOM4TgEEvWStc9QqyVDgUwdLwMO9DCOoGObyg2z3Azf+NlXEFYfWtJ7gh9+z
         vS4SY1sxHOjYBG5bF6YH2i7xBFUB7Bfr4219d2rmcPtJNJV8oZEZfCLbCyKlWjIUO7AP
         E64A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790047251; x=1790652051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z7TxIVacK4CiPP85Zm/zWINHMIm3Lw/0BaBVswTN6EM=;
        b=OQgF2nwyxBBrWRgEac2nBuHxtg3ZKWX1C7tJ3+m0rsl+xm0/OxN9YSkUAOMqI7QLbl
         LV/lyr4PCMO5VzN6BdmWe2/zuKS6b+/Qzro376TkShSGrlgVulpvnQy3udKnuKSgDfiO
         OtUv3RfbgD5Iy8QBMlrH9XHXL1/3VxO/Jt75ccv279ja6cFoj1ABOBwa0FDlAHcV+JUa
         oMes8SNbnP3pwqf7ATNFbX8XbGso+ZiFVMDEoTO4z33E8myTT9X1DgDTkNk4D39XhEAj
         gfyv52VXrKaxwLvw2JEUf0Z5g0WANEP9DH6e5Pcf85OqxZvtJLTdOjaxLDag5xwhqR3e
         qG6Q==
X-Gm-Message-State: AFuF++ld0ilZtDOwmjuvTxyaFa1//f/uyvObiRt3nHLXBWa+5wL9m2x+
	8FLM/Ubpozcjn43nSGP7oACitN1lRoNmesV/Lr/oo0rVut9ONDQRJM2G
X-Gm-Gg: AYBFou2YL85M4s/7nA4gnYQO/6HUKL36ThE+i+d1TmB3i+I6bI8kCsmO0sX2tPpE69+
	yvh3TP2WLWuobTrGNntcIdtjDNazKzLQVBz3dwbadVX2bPIaWNecK+/vfV9aD0wvkIK0PepYKBX
	Qmz0tCnaO8VDxC/A4tCJ+OElFUr+5hCfaDkeW+zT1GtaY0CneklCwfv4h/Z5++Q5bGEpiSWL9R4
	QUDuUJ0pgIjiROUtoG8NQ5qDi6F5EO6hoxdiVAceF0G1ywy1gOYDX9TJNs/BfUMzwBaB/VEtZ2W
	FbUjPrkWEA64ARg6Qi6RLiy1ZidP6msX7nDc/cWBh7DnFPqHBlqNDK0Zb8T5A6eSEB8TYm8z8C0
	osPMK8KDfnd4FAw6Zkqw/gD5AD4rf6b8OLYu1QIzys89BuOsFKFvrG36vvU7c5chQ2zbsErMAyR
	IzOp0EIXVarAQ21D20ugWDxxSyMacjRwNjfn591NSrYTv20mzNDF6dzCoIERhKR+3fjHYqgU8VP
	FnN+sH3hhIyEs4Y88GSU23PsMXt3Y5v9+RBmUWYcegSMdCoPWHimJ0MXw5mDH/gAZzwNr4rk/cy
	f8fo2BH2A38AvedDPK69Rcly
X-Received: by 2002:a17:903:b84:b0:2dd:c053:82fa with SMTP id d9443c01a7336-2ddc053843cmr122847195ad.49.1790047250783;
        Mon, 21 Sep 2026 20:20:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5cf83512sm1940355ad.5.2026.09.21.20.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 20:20:50 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Corentin Labbe <clabbe.montjoie@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	davem@davemloft.net,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Gilad Ben-Yossef <gilad@benyossef.com>,
	Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Linus Walleij <linusw@kernel.org>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/3] crypto: sl3516 - Use pm_runtime_resume_and_get()
Date: Tue, 22 Sep 2026 10:19:54 +0700
Message-ID: <20260922031954.320895-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922031954.320895-1-phucduc.bui@gmail.com>
References: <20260922031954.320895-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Replace the open-coded pm_runtime_get_sync() + pm_runtime_put_noidle()
error handling pattern with pm_runtime_resume_and_get(), which already
does this internally.

No functional change.

Found by manual code inspection.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/crypto/gemini/sl3516-ce-cipher.c | 3 +--
 drivers/crypto/gemini/sl3516-ce-rng.c    | 6 ++----
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/crypto/gemini/sl3516-ce-cipher.c b/drivers/crypto/gemini/sl3516-ce-cipher.c
index 02ec4282333b..eba46aebf176 100644
--- a/drivers/crypto/gemini/sl3516-ce-cipher.c
+++ b/drivers/crypto/gemini/sl3516-ce-cipher.c
@@ -331,13 +331,12 @@ int sl3516_ce_cipher_init(struct crypto_tfm *tfm)
 		 crypto_tfm_alg_driver_name(&sktfm->base),
 		 crypto_tfm_alg_driver_name(crypto_skcipher_tfm(op->fallback_tfm)));
 
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
diff --git a/drivers/crypto/gemini/sl3516-ce-rng.c b/drivers/crypto/gemini/sl3516-ce-rng.c
index 76931ec1cec5..19af03b03e42 100644
--- a/drivers/crypto/gemini/sl3516-ce-rng.c
+++ b/drivers/crypto/gemini/sl3516-ce-rng.c
@@ -24,11 +24,9 @@ static int sl3516_ce_rng_read(struct hwrng *rng, void *buf, size_t max, bool wai
 	ce->hwrng_stat_bytes += max;
 #endif
 
-	err = pm_runtime_get_sync(ce->dev);
-	if (err < 0) {
-		pm_runtime_put_noidle(ce->dev);
+	err = pm_runtime_resume_and_get(ce->dev);
+	if (err < 0)
 		return err;
-	}
 
 	while (read < max) {
 		*data = readl(ce->base + IPSEC_RAND_NUM_REG);
-- 
2.43.0

