Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7332236FA
	for <linux-sunxi@lists.linux.dev>; Thu,  1 May 2025 19:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746126461; cv=none; b=oqKdlYGYNDERJvLh1yYh+3iKsUiNHgI+8h5tJCl+niquRS3PY6O4FOkEFymmH7lNNFIQEnsUY/AysHgcdnWoBSKBLBXH6zpYNQmqjzLyfevZdFU4ihHk/qvz4ahXqbEBy02DbWehzdGXdtee8ss6HasZpI0GOpccHsE3yH43HCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746126461; c=relaxed/simple;
	bh=2PjYxqC2TvoFNeTYXNE58FNx+yDrrBK7F/NyaMPn/rE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uZx9cVFScaAjxzrABM5RbTxg5USJmMQC4mPQJShsfpvMFoJNCU2Ihi5NQ89VfiWTsVu9s2NEthap6bmgjzyy0ToFos2asX+E7mMXaw/c0jXKmmE8QRp6jHwuKDnbEg0rbKNGmCqLBDnRQY7rWcJD+tkGWx8O5AgbKlHrzob9WoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fY3SnDVI; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fY3SnDVI"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac3fcf5ab0dso194506566b.3
        for <linux-sunxi@lists.linux.dev>; Thu, 01 May 2025 12:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746126458; x=1746731258; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xYcnJfHyu9Qya9nm0+iaohPyzIhpcE4qtAIXaJuOv9M=;
        b=fY3SnDVISiC6ZSi4DyZBGo4Czy1ljacOp8WVrUNtUHPq2xyExsi8s0P6JBDiqolOGd
         3EaewdsfkBubdzX9cku6qFQIJpneAtoD/xA862H+eDiwJfIxyiJwT3Yo4GGFKWzz2maF
         QVjLou4AaUO32jD3cq3FsELHFfG5pzfXrhD+VANDXpLjkUnq6PLP4cFAjsd5ekwfSgiA
         RLQyEPl0DyxGtKVXXuGla226MHdv7AQlaCR/V4oxDNWRDTMgalwB6Eb40MyHUvNTA1x7
         vn2nq423Kcr7pp89Dta8C1cD6zGrSA+T4kQ8zdYm0Cxq+UPmZIskOBdNTZnwU5XMpzXj
         zWlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746126458; x=1746731258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xYcnJfHyu9Qya9nm0+iaohPyzIhpcE4qtAIXaJuOv9M=;
        b=EKnq86I5RCmevkjlH3fABXJ7sb9e3JGE9DN13oQmTn2NIG2ucgUu24IdThB4vX09Wg
         CjimEjaINoea6kx4f+aQ8q+kI7fg10TOYha71WBh6f+tB0tkl5E7HLW3RoG4Tgl9UYt5
         DeHk7S2+sxqLexTgZ80LqhGIi85zCk6ad+UdC/fUNj2pwZlvA3Nlx0crPkMuKqM8Ne+o
         0p1TNNx7DDGVUlbJwHgaeBJyKseuAE9Ln+s7ElRDKFeaXIBvel3+0iU9C11E328Vck4o
         bHlo0YN0SObbH1ia4/hjZ6YgSkk8mD0Fbe4AwyEg+5CwPhV5ErVbPMQwm7OV4UIocLc0
         I2Hw==
X-Forwarded-Encrypted: i=1; AJvYcCVscO2Lx6bw9lDbK6aDUPG/5QSYcHMrYybweeVN3RrRg2VY0jvEPdAhCruD4uWGW54vSOmtpG7Ebh4w6g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxVhdU2Ta0aqVGRzsK+m7l7bpwnJF4mv6/MDJCY+ghGm8VpLqEw
	iP2jlNdS7dcVg28HINNG2D5tK8Ao67sec6+x2omBU1gLJhJPfzrd
X-Gm-Gg: ASbGnctL3idpv2ts5nC26ZgvTN97n2PkvIX63JgKuCuf+5/PXEQFL9AP4lIUh5yCG6x
	/FQcFUdOf3rz5qkfQVxb42MXM+hS2xFe5iRR8BPMR2h/ov10VFQ/utEwL71b7XNwP8QiyovRrqu
	vi27lsS1bc4dPXuaA67qe+OoolDxjJ/Ul90d+mNuC0mslTaHyUnBerh+43Y+dTdxdLVvJr0id5g
	Dkw1uydt4vH11G2IJy+u6llfnxxAICG4Qpk3SvRcMegMZSECWR7RL4YEGCx8h5WCZ/fiHW5lyHX
	LuqglXaI5so2eI3frD41C0C8m3ynVwgVuks9MeYQumDxPU7TGO1us3kxsPQJ5HS0Csay
X-Google-Smtp-Source: AGHT+IHfDMVIQ26ycHG3NCY+1odFkBcAwHTLJ2hCKHMBoEhxiuT8ZDLFmo0kkKjR+EXlLecp/8T5kw==
X-Received: by 2002:a17:907:1b17:b0:ace:37d6:a5ce with SMTP id a640c23a62f3a-ad17ad819e2mr39669966b.19.1746126458067;
        Thu, 01 May 2025 12:07:38 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:c50a:8800:cf9e:ee0b:4a01:37f6])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad0c70c6917sm80349266b.4.2025.05.01.12.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 12:07:37 -0700 (PDT)
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
Subject: [PATCH 1/2] crypto: sun8i-ce: undo runtime PM changes during driver removal
Date: Thu,  1 May 2025 22:06:50 +0300
Message-ID: <20250501190651.3863582-1-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pm_runtime_use_autosuspend() call must be undone with
pm_runtime_dont_use_autosuspend() at driver exit, but this is not
currently handled in the driver.

To fix this issue and at the same time simplify error handling, switch
to devm_pm_runtime_enable(). It will call both pm_runtime_disable() and
pm_runtime_dont_use_autosuspend() during driver removal.

Fixes: 06f751b61329 ("crypto: allwinner - Add sun8i-ce Crypto Engine")
Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 .../crypto/allwinner/sun8i-ce/sun8i-ce-core.c   | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
index ec1ffda9ea32..658f520cee0c 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
@@ -832,13 +832,12 @@ static int sun8i_ce_pm_init(struct sun8i_ce_dev *ce)
 	err = pm_runtime_set_suspended(ce->dev);
 	if (err)
 		return err;
-	pm_runtime_enable(ce->dev);
-	return err;
-}
 
-static void sun8i_ce_pm_exit(struct sun8i_ce_dev *ce)
-{
-	pm_runtime_disable(ce->dev);
+	err = devm_pm_runtime_enable(ce->dev);
+	if (err)
+		return err;
+
+	return 0;
 }
 
 static int sun8i_ce_get_clks(struct sun8i_ce_dev *ce)
@@ -1041,7 +1040,7 @@ static int sun8i_ce_probe(struct platform_device *pdev)
 			       "sun8i-ce-ns", ce);
 	if (err) {
 		dev_err(ce->dev, "Cannot request CryptoEngine Non-secure IRQ (err=%d)\n", err);
-		goto error_irq;
+		goto error_pm;
 	}
 
 	err = sun8i_ce_register_algs(ce);
@@ -1082,8 +1081,6 @@ static int sun8i_ce_probe(struct platform_device *pdev)
 	return 0;
 error_alg:
 	sun8i_ce_unregister_algs(ce);
-error_irq:
-	sun8i_ce_pm_exit(ce);
 error_pm:
 	sun8i_ce_free_chanlist(ce, MAXFLOW - 1);
 	return err;
@@ -1104,8 +1101,6 @@ static void sun8i_ce_remove(struct platform_device *pdev)
 #endif
 
 	sun8i_ce_free_chanlist(ce, MAXFLOW - 1);
-
-	sun8i_ce_pm_exit(ce);
 }
 
 static const struct of_device_id sun8i_ce_crypto_of_match_table[] = {
-- 
2.48.1

