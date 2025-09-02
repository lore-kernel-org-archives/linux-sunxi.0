Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960E9307AC0
	for <linux-sunxi@lists.linux.dev>; Tue,  2 Sep 2025 13:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756819382; cv=none; b=BG+dXF/JVzhBah1OAoOUss1dmAOlmRlFYNnpRVQlTAO12x8SjOfmQZfrNXXeQZETNhejR6sZI3sIAdmi21pXEla6I1LiN7vQXXkrWn6Ui+xiDp0pp6SzxUUWcQludLnG+yOYHtE/42UYR86iAt7QmHuIVC0Hy5FMKYOPcWQgIZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756819382; c=relaxed/simple;
	bh=bsrtN/UNG9iIkOTFtbf/aBs98lsRgQ3mXT6PfL4G5aE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rOvW11vfMprElTNdPf7g0/pH1RzXm4NfZAga3s/juyVToghn3mqOfbTQ5R68A0h0JugbLnjbYgQMRT92DmZ8XNts+aIcPhEe27jE2kGqEUlUINkeKZ9NCou36PosLD2sit7u8SoDplsqy5fVCmecAXgf21A0CR+uspL9wdoSZ2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dusCXfUS; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dusCXfUS"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45b9c35bc0aso3561515e9.2
        for <linux-sunxi@lists.linux.dev>; Tue, 02 Sep 2025 06:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756819379; x=1757424179; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9SQo1VWDa8L0gOXuwTFV8cUa7G4/T2C+1QUOVeEgYOo=;
        b=dusCXfUSrlfQMTrn+0vbKQ1CkIepM3M/NNoY38iP13MSknxbHtHjvSrQkYKDXZWgB6
         9C+wKpR62HqcxDf2NvnSKyWQjCsAxUASvTd41HhOW//0CPabPTxIIY+TxGyi8TGroUe/
         ZWqs/OsRqCnuCgAuE3UPA6NLKrah1/QMlVWpLIS+rjOKsRH+C61Hy4BDeY0SCAF0yTU8
         V4AMHNnQYIivRzk5iVoyZ4P4tfN1m9uh7Y4V/F08cG2rfEdM4Mo+uJEMGPvJhAMzRoeZ
         2Lq7o1B2koTD5fP24vFV7zj9TiGHvLeJ0hdbjrqC2enu6Fvz8qnJEIfxZJPsnbMOnIh9
         AqAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756819379; x=1757424179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9SQo1VWDa8L0gOXuwTFV8cUa7G4/T2C+1QUOVeEgYOo=;
        b=sCHF2LeCvJG7XJ2Yzboc89BcULZZBTO5YY2BpPrDMZIDVQ8SFJVkMZhWEglOdLf0p4
         SRzcGxmMSuPsphjQXBOsTmiqhEzFuVVcGumxYfqoayvw1ip1kNqPJa3tLYr6rDjUhAMO
         Kjsi/vXDlBVCYWllGoXnPK+pCL+hG2o6lEYdfWLjm0X+43ddSXsWp3wwF9ZrdYyhHfYu
         AYDgAG37P1Z0Lzuc1NqN9p7imyP75p/pjqa6ga7HXyT0vcPOnZPLhwPj1ASJ8kiBtjT0
         4vHB6hdkHlRhzyvYZmwocmnH18FCRqIWfNYu6DnbPmO8r/VLQt/voAT5p1Vor/UiI62Y
         Es0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVtlK/gMfsFet0B4uns2BLwOkvFOLP4Lw7+j2fppi560OSeG2Sz0RRLeQEOTsJk/zEtMBNUngpxpZxjOw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxAb8kuYF3iCS5E9n7vrbczHAv0tCb3hD1tl9f//a9n3QTX7QTV
	bhKDXelynzQRtY5XTwfOUfN5YOxBrWNQlSmn64u63QxqPz0WllR/oVIY
X-Gm-Gg: ASbGnctaYsbCeESV44DPmRf6lX8LAfjfap11Ae4NYLyUPDR6vpPJncLdyzYS2G7yIC3
	Iry77d7u7oiD1jxb8KkOgFATpIN+dWm/+qT0pqpn0rFkF1K16h//Hp33vZBIvCv2H0iA5TD+XTu
	VYTwaAja0IE4UniQDhkoT+ncBD/yoXtd4UmQpMHWnS+IbQ+mi93NhQX5zrVdC8PkcUm/fl5z8s8
	yD0vlmyqD65Kw+auRK5Ewxw6NUI6WHAmY+dXBgyn4yYaQYFmGN2s+K7lTvttX4j4Zot7JJtzMvC
	1Lrag70YW4OJdI5Mod6a1miwqmcD9u7auzGVThsO4sxaVvLgdefQDbU+dtV4EEFhT+PFvp44jnO
	/tkWHcoWZOwDvX3BX6vTdACJE+KG+OJ2Z4Q==
X-Google-Smtp-Source: AGHT+IFCIE32gRqXCK2cxP5jJ0umVullIbqtBAeMOiAN/1dBA/vOuBTNpHuGFamrKvDjEfmo1r30gg==
X-Received: by 2002:a05:600c:1e87:b0:45b:47e1:f5fe with SMTP id 5b1f17b1804b1-45b855c0d3dmr80790615e9.34.1756819378791;
        Tue, 02 Sep 2025 06:22:58 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:c207:b600:978:f6fa:583e:b091])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b945332adsm44452155e9.4.2025.09.02.06.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 06:22:58 -0700 (PDT)
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
Subject: [PATCH v3 3/9] crypto: sun8i-ce - remove unnecessary __maybe_unused annotations
Date: Tue,  2 Sep 2025 16:21:28 +0300
Message-ID: <20250902132134.3287515-4-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250902132134.3287515-1-ovidiu.panait.oss@gmail.com>
References: <20250902132134.3287515-1-ovidiu.panait.oss@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are 3 instances of '__maybe_unused' annotations that are not needed,
as the variables are always used, so remove them.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c | 2 +-
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c   | 2 +-
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
index 113a1100f2ae..c57c64a1a388 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
@@ -111,7 +111,7 @@ static int sun8i_ce_cipher_fallback(struct skcipher_request *areq)
 
 	if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG)) {
 		struct skcipher_alg *alg = crypto_skcipher_alg(tfm);
-		struct sun8i_ce_alg_template *algt __maybe_unused;
+		struct sun8i_ce_alg_template *algt;
 
 		algt = container_of(alg, struct sun8i_ce_alg_template,
 				    alg.skcipher.base);
diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
index 79ec172e5c99..ba30859e749c 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
@@ -1062,7 +1062,7 @@ static int sun8i_ce_probe(struct platform_device *pdev)
 	pm_runtime_put_sync(ce->dev);
 
 	if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG)) {
-		struct dentry *dbgfs_dir __maybe_unused;
+		struct dentry *dbgfs_dir;
 		struct dentry *dbgfs_stats __maybe_unused;
 
 		/* Ignore error of debugfs */
diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
index 61e8d968fdcc..df2acef9c679 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
@@ -26,7 +26,7 @@
 static void sun8i_ce_hash_stat_fb_inc(struct crypto_ahash *tfm)
 {
 	if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG)) {
-		struct sun8i_ce_alg_template *algt __maybe_unused;
+		struct sun8i_ce_alg_template *algt;
 		struct ahash_alg *alg = crypto_ahash_alg(tfm);
 
 		algt = container_of(alg, struct sun8i_ce_alg_template,
-- 
2.50.0

