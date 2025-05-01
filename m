Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE58224B15
	for <linux-sunxi@lists.linux.dev>; Thu,  1 May 2025 19:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746126463; cv=none; b=MXn6POw9G5kpJ0gE555vmtpkbnQj0QO5TqSjrI6DtTFyZyKYF+EBh/scf80Y+TuFNl+qof/tZhvtnzOEv7loU1v1byZhffvmqluNrkaqPtuZW1gADWD3vNyz6sbMNV/LBNjTrCHMh0mvgPnx69DKmoBWcilf0WTSM1tVTI2jhaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746126463; c=relaxed/simple;
	bh=YXKPVxRR7Upwwq5LKZvZEYOzYl8UfelO+cPhSJKCGp4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lMARKkSt2OoZqvagynNR3dxzczovDw6amFX/gO1/0OHvIT8qd8k0yXTfcsia0xP3xsmNdA86kWmdWQUCcpQyy+Ppwzd0Kojb+9wt9KyyhNsInnEswjBCyZSkW1w5Jj9zfl0EnSZYDnCLZzw6vNcH65WCPeyDWK6EzIDaSXcHeJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fk+tyrOo; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fk+tyrOo"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac2aeada833so246971766b.0
        for <linux-sunxi@lists.linux.dev>; Thu, 01 May 2025 12:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746126459; x=1746731259; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qsp9CaqkI2nnPLo+C7isQc9cYVKQaKUwpPDF4hWhLBE=;
        b=fk+tyrOorac6vNphInLGlfGzSOjmh6DR301Ey29mHT1Bo7Nm4uWx7bVYVfm0brhqtL
         2Uklxp/vk4vT+JC1qP+oAX6jZbcUp+o/itA9tcjFRa/Zq3muPYSQPtyzFafvwrW4OGN0
         vq5jyoERHcJZ3PP5xwHvd8QKtfBK9Ddrwq315kLVORL7GLL5FfGudB3yvQyYipEUJ6oP
         sS2TKGh+p27zxGiuDiTeNE8rvfFzJ/rAq53rrDBwLRx/uAOB1JfadwT+4qXv2U2WlIJx
         fr6mrd8oBQRAivChodfvHU5k1LUQ+p+SMdH6rEU1TXNOg1NXCDF1EzPtOkezaGppfP0U
         KEjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746126459; x=1746731259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qsp9CaqkI2nnPLo+C7isQc9cYVKQaKUwpPDF4hWhLBE=;
        b=oq+77aGyjyaaBiHB6MhsGgXXhG63sRQi+tqLF2OoydvliP05wGGF+DR6WbasDTMLOC
         /serLonCSzBoLZCtX0OYrZ92ohfz23ncNqs+nupZGN+CbbStIU8az2QAzJp9AJc8v5oh
         TzlC3KJdQjTdluXfEwWb8Uv2/G75kvd/nG0fdXHgNMVYv3Dg6zuABiWR+GtXd8k7NlrK
         qKsoH+3kcg6KcdD5A2C+gANyU9iBcqJ/Wl78WGr+BJ5Ms7DZIil5cc7TyrkLIURXu7A2
         b3UffHTOvVvkGvn++VFRAUjGazMwabu5dlmftG/HpLwMlx4R+KkT1GTvW3clWro1bZcT
         c0Pw==
X-Forwarded-Encrypted: i=1; AJvYcCWkzhCGaGLUwUjHPgjAqp+I3tx1xY6nVZd7sbyoLPumFUt8f+nJZYzJFcO07foPEioPfPj52NeTyXcFRw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzGZ4tO+RTWpBgYXy23Tbwq2rDOpC9cMQW9v2/tGY4Kz8JjHbg9
	+TUwb2h4qeERq+/CqdWqxROfEDzq7sCO+5yrZvp1TftJPlVn/ztK
X-Gm-Gg: ASbGncssrR1MB+BSWrcmzeiD+dhcDs9Lk4lPkChGkW8ZEe3gl8+TeYZCpOHHobtJGDJ
	ZYdHmsZW8XRLfV/IDYQfkKFdZ9MlF9WK49cxDP5FA/D9c5ECNLLlQ/d+JkmmwVAlIXxJG4OeipE
	SL+F8KO+Ebj2lwy7pl5CgBjFekVWXBKh1NB/Cime4n0EnmUaNPBJD7STc/FIXf3bqeT97+uUBlA
	vCtnP5O+kwius7eh9Aepeoolx2A7+Q4jiyQ9LcYoCCRgX5pb/cHQCjn9pc3c5/6wIIkM3OJ5lv3
	8TvVuEtF5gEyUCnO+I5GD/CUEPfkCLoooE6QVsBDgnb18iucQe2JA8wkYhTxOJahoavX
X-Google-Smtp-Source: AGHT+IFPbjdkqPWUcDwWn3gcKgKCDuCT59+nrEo/GOkvbNTeX+sbsXL7iBibXH8JV2ff9RTUgMaADg==
X-Received: by 2002:a17:906:4fc5:b0:aca:c67d:eac0 with SMTP id a640c23a62f3a-acefe63defemr318866466b.0.1746126459184;
        Thu, 01 May 2025 12:07:39 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:c50a:8800:cf9e:ee0b:4a01:37f6])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad0c70c6917sm80349266b.4.2025.05.01.12.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 12:07:38 -0700 (PDT)
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
Subject: [PATCH 2/2] crypto: sun8i-ce-hash - use pm_runtime_resume_and_get()
Date: Thu,  1 May 2025 22:06:51 +0300
Message-ID: <20250501190651.3863582-2-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250501190651.3863582-1-ovidiu.panait.oss@gmail.com>
References: <20250501190651.3863582-1-ovidiu.panait.oss@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace pm_runtime_get_sync() usage with pm_runtime_resume_and_get() to
simplify error handling.

This is recommended in the documentation of pm_runtime_get_sync().

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
index ba13fb75c05d..bef44f350167 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
@@ -65,12 +65,11 @@ int sun8i_ce_hash_init_tfm(struct crypto_ahash *tfm)
 		       crypto_ahash_driver_name(op->fallback_tfm),
 		       CRYPTO_MAX_ALG_NAME);
 
-	err = pm_runtime_get_sync(op->ce->dev);
+	err = pm_runtime_resume_and_get(op->ce->dev);
 	if (err < 0)
 		goto error_pm;
 	return 0;
 error_pm:
-	pm_runtime_put_noidle(op->ce->dev);
 	crypto_free_ahash(op->fallback_tfm);
 	return err;
 }
-- 
2.48.1

