Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5005035A3BF
	for <linux-sunxi@lists.linux.dev>; Tue, 22 Sep 2026 03:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790047244; cv=none; b=gU6M6T6bRDGuQ+qf9BRMto/K0CR8/A25GsNtJ6g3duwoZ9N9mTEIYgHVwKbN4/msSli/uQllmBdlS9bbwwa8dJmB8Tt4kMak842IpFH9kl2x+iOEj1Or3Ox3Z/7FoXXldmw9WsTYW3+BmoVrH+JCOcRYzBj4wVpSPqa5XhYzybA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790047244; c=relaxed/simple;
	bh=NFYkVXj5Q4rmSY6sxTmyvaVX6rt1lQAF/FvmjxKOyxc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TsFME9w9LwsqCeFFtmxGovtl1D+lKBAl/b110Db6x6nWuuTYCFLQq78GTrcMcW5Ebfp09ZnNyxCOlY73Dgqr/gp7rqWFr7ybN/knwiMd2KiDIfc9RujhlGLoektk7ssoiy5OSisIemQ6TP6plSM8YKIXgIFrWCjv9GOOrVAGKps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ebeeYF9m; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ebeeYF9m"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2db710396ffso4494955ad.1
        for <linux-sunxi@lists.linux.dev>; Mon, 21 Sep 2026 20:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790047243; x=1790652043; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kzO8DkUvhWLKnOUfdtsb9HGsluFZoqS1EuEZMi0Rqzw=;
        b=ebeeYF9m2RC0URhpeM37aC+6oocnTjfvGKubLrY4Xr0CChh7fd2/MPKGeGqIVfvf/t
         w3GNldoSC1dvrVoJfp6sgotqIcIZqwhmS4olPYiyso/MHhcJaRzn+2azakxzik8GfdTp
         d+3GUlFR4cGc4UV2XPDj1Hglmb073fm5T5y5MuDG6VfESIAJzs/xhCKT/OAW8OyIMlQi
         P2pN7Yfgv/6R++pp23rCTWlCSwSXr9tw4nrcYV6ffUNR2QXCFK9xZ8OiVBXZzbNSNuYj
         oNfbr8EgT3RgUy90V5FKLIm1C5JzmXBwbN+Kb3Rlo3LszCEU9iqActUerBlKPWlTSzwg
         uPJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790047243; x=1790652043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kzO8DkUvhWLKnOUfdtsb9HGsluFZoqS1EuEZMi0Rqzw=;
        b=2v7K/INl67GXlKVIr01S/JHwp/S3gDbkrh7EzoJ3TSRtIuqJMmhsXyQ1EyTFXn7BWY
         KHumgDINlkG3p0aFKiSaBUVzQMntPYm7DU8Ni//Vu2E3swQNpha0l4ZmP3QKIo/SUAyT
         MVhgbs0uUMVKadcDcmGVQpo3ScMXUcKHQX90f5z1PxRPnrZSIWywfT3mGzOBhLO1IwDx
         riPeujc/jsHKq6OMFQNGwVafZV30q2Gvi3/V3kxnd8xqOV7FsreXJVMwkkfT3NzZZA6A
         0C5/6dUYts8HwOJVkIwDFWPA7+vV42qT/34L3x++hgZlFkhLuEUXCIeKgqe/5VGieFBe
         opmQ==
X-Gm-Message-State: AFuF++mWpQCUc5LQQwj8wyPEO6NZn+oGLL0UQJNivnMGfENcOO+fO09y
	+4aYhin44LdleRoluC0As2o6lMDeXIsZnWtwwyT6HSlloNCI0MeWvwyo
X-Gm-Gg: AYBFou2jFi/NQNAuwUMD78Tnp/qLPDISAwDXQ29TTnp40dhNBmILD8uWvavfbPOhfIv
	zXIzHQ453nO4JeB/ONjny4cmxWJ6bxB9YfIe2icJ3Lc86+H4tsPgRG9/NZHAjuAQlAODhri8p8z
	oQUpvcaSKunZIWKJTO/JnFKfCmWx/QpTlfu9W7vRmIpEHLvoUSp9TnNrQNtbMEljAYSsOxxaWJD
	IdfxG3zbedVMUGRksoe3weO+yoZcgqt+uTyY6Sv0gwWXFEH5rRZZLQO+6hUopJPxjSIk+/vHwqL
	s3aZ4qTgI1qgGuVLXItgB9VKPak+yuEbTuOG/6vtnFM4Wzys4VhrgIXfTxHtu4KlMpknaxYiNfd
	g2vtbPB3lXFSSRDVn/D7CS6NKh407Ve2jBqr+OsRmWxQyZLnAG4LKqxIWvY3tCCSiJLUgMECCFG
	6pgkK3mCRM9DPTPh/xEo/iEbcHYMKwH61TI734T5wBH0TVu6pBscqLowoUYSSIqjPSilT6docMS
	5utwP9X+NqA7OAKlxSfz36A/xnzMSfbf/NsMaIm90+QGDXh2u5VTR0l04enFebFkU3sRlAX2tWU
	Tw65zeLcTKuKw4A=
X-Received: by 2002:a17:903:1983:b0:2dd:a937:9bfb with SMTP id d9443c01a7336-2df597ad4d4mr12177235ad.10.1790047242649;
        Mon, 21 Sep 2026 20:20:42 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5cf83512sm1940355ad.5.2026.09.21.20.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 20:20:42 -0700 (PDT)
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
Subject: [PATCH 1/3] crypto: sun8i-ss - Use pm_runtime_resume_and_get()
Date: Tue, 22 Sep 2026 10:19:52 +0700
Message-ID: <20260922031954.320895-2-phucduc.bui@gmail.com>
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
 drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
index 36a1ebca2e70..56ba4ff6d5ff 100644
--- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
@@ -120,12 +120,11 @@ int sun8i_ss_hash_init_tfm(struct crypto_ahash *tfm)
 	memcpy(algt->fbname, crypto_ahash_driver_name(op->fallback_tfm),
 	       CRYPTO_MAX_ALG_NAME);
 
-	err = pm_runtime_get_sync(op->ss->dev);
+	err = pm_runtime_resume_and_get(op->ss->dev);
 	if (err < 0)
 		goto error_pm;
 	return 0;
 error_pm:
-	pm_runtime_put_noidle(op->ss->dev);
 	crypto_free_ahash(op->fallback_tfm);
 	return err;
 }
-- 
2.43.0

