Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC21F21CC44
	for <linux-sunxi@lists.linux.dev>; Mon, 28 Jul 2025 06:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753682877; cv=none; b=afnleocKzmEGZj4Oh9v5V//YLb/xvcNgSb6RhVERs5zabcu1+q34js2T0pmE/g4yFlnaKJ0NSHGf2ddTXVSFlBbWqfIwjm4P+dE3pEGGRC4QQVZb8AxdJQJoDyY4sezBdaxwTvpoaYfw1VGQUnJztbQXL9OQspcovt0sdr24Tw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753682877; c=relaxed/simple;
	bh=Ps2TqZoQRyQLblkSoFX3ufLH04yJchIw5x3kr15RME0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jIi+/BigPrXV4hoVshkVC8+ToYIfBr6k3LCD+nXBmy/wvhkOM1v4W7eCP4uiOnJk5BJnT5aRxRCIfFOCnciPgZSt5peKQj3MC/zr+g/z1IVnvPYWV25AwGfNxl3hxxRkgWpO/tiXr/R9k9hM4GEoKV9zkEbrhjtHuGeM15AwK08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YrBOpCPf; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YrBOpCPf"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-451d41e1ad1so24861835e9.1
        for <linux-sunxi@lists.linux.dev>; Sun, 27 Jul 2025 23:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753682874; x=1754287674; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lQRkEBKSX0KDbt2DjDVCCEOOHuJVKF3PYKVmG7o05vY=;
        b=YrBOpCPfGDsSuWzABmriexYd8yx+weqoYBXZTzAhZLjx4A8lPLnS940ezDVq6qH0nJ
         Nm/EfgKxaL9pIPwmNBadNLp7IlhZYvzv/7Fm6JbTKHWvkSa81B8P51HISjkFwTvMN0Zr
         TJ16wJU9IhgVR9a//PlW6KWG3nyrhHrwP+WX40cPPLiFttL9y6lhOVkbu3bEUng29T0o
         42MM5OhuqKPByKUdAf7IdOOF46BLb0wMtyLX0wbKTDFrLOWtz/Prg/TM8yyP2wW8Rnoa
         AvxSkWE1ACNl64Q9KNobtHMgAhZ+dVKWXHPH4UCliZBGB7EKr7qgLIJ7VQYki2m/ztZv
         +Z0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753682874; x=1754287674;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lQRkEBKSX0KDbt2DjDVCCEOOHuJVKF3PYKVmG7o05vY=;
        b=KiKpSbwgzVWeVY/daZSSLZTgdUX/irVxCGydw29C09e8sGy/+2fVg0+cEGDq8LhfDO
         DV/7kYDzYENMrjT1gBtzfeAylPCxo+hAI97riuJ5DuBy/ZqilaqlkxcA2lIzlg9hcYjl
         VMgUtkpO0xqUWlV4wLcLTIgUgFaCaXmO9w+LTegUBHs6/X0LgZYKXBecnvHtFCTOQ8Qm
         fYBxUfLCPdSivXy1cyhc7crGkQrpet+OvUM2un5krSpjynxfizyuVnwKKkG0zVjfTV4L
         kGpwqtGifyFpLacsGbZRjvtI7fWl3X9UQHqa3Zz9YqL9qy3BQA2+QMdLRw3OjJ3/CHE6
         jlKg==
X-Forwarded-Encrypted: i=1; AJvYcCUXIXIh3fGG9G0N+xfMTDR6F8jBPtaQENGLgo6b9jmYVtzwurcnj1fY74NmZW0tfVxEHM/UjutwSJFU+Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxgLV9hzdW81oNhuG23cK58kA7i+qXiSW6UKPzURHZ7EkThxnWy
	qafuiBxVszC8Wx7kSACqa4A3ypzTXGI0omeWbbGMPLexy6r3pgfBKT5I
X-Gm-Gg: ASbGnctnK5p0l3mIArkSatfFxrrppmFAuLy/4hKzbSMCA3Yha894VNfmi8IItFJ7l4U
	tX1+4XgxEQOK+c2w1/mJ4ZqKoTCcR/5ZwdlLfJKLnbMMp6Ei75DrYq8IMHfxnFNHf4IPnHDlkwk
	CYYRd2nZlE+Dm6sRnFvybbR/CiXRhoQrEP0YpEJgItEIn4MVvl/OvPXO4NiBhrm7BjFDW+PEbf8
	JjrLq61CHwNzqjhLoQL+oUMXRfD+uAwvSsdipY3Wih39awE5VMdqCOkLfAsYJAboA/2bkB7Nu1t
	nHbzFZH4yHxTOAxnLHbjzwwMUEzqeyAEyp6517/ldd6/oPzc/1eiOF+9XBHidDCUoCDNprhJ2wU
	ncJP6bNH0z3QD83N09FjWfb7iBBYjHHr5zA==
X-Google-Smtp-Source: AGHT+IF3AC+lhboN+bDd3GTIQsZ/ijxMvRWFI70HfU8zkixbqEtidrdFYobTIDcSbPLWc1dA/skPGg==
X-Received: by 2002:a05:600c:1e2a:b0:456:2832:f98d with SMTP id 5b1f17b1804b1-45876556361mr80069655e9.27.1753682873906;
        Sun, 27 Jul 2025 23:07:53 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:ca0d:f700:1210:b727:adc8:716])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587abe6ba0sm86195215e9.9.2025.07.27.23.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 23:07:53 -0700 (PDT)
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
Subject: [PATCH 0/9] sun8i-ce: small cleanups/refactoring
Date: Mon, 28 Jul 2025 09:06:52 +0300
Message-ID: <20250728060701.1787607-1-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series includes only the refactoring commits from [1]. The batching
related changes were dropped since they are no longer relevant (batching
support in crypto_engine was retired in [2]).

This series includes various small cleanups and refactoring:
- move request-specific skcipher and hash data to request context,
  eliminating the need to allocate extra memory in the digest path
- make the hashing code more clear and modular
- reduce a bit of boilerplate/duplicated code

[1] https://lore.kernel.org/linux-crypto/20250626095813.83963-1-ovidiu.panait.oss@gmail.com/
[2] c470ffa6f486 ("crypto: engine - remove request batching support")

Ovidiu Panait (9):
  crypto: sun8i-ce - remove channel timeout field
  crypto: sun8i-ce - remove boilerplate in sun8i_ce_hash_digest()
  crypto: sun8i-ce - remove unnecessary __maybe_unused annotations
  crypto: sun8i-ce - add a new function for dumping task descriptors
  crypto: sun8i-ce - move bounce_iv and backup_iv to request context
  crypto: sun8i-ce - fold sun8i_ce_cipher_run() into
    sun8i_ce_cipher_do_one()
  crypto: sun8i-ce - pass task descriptor to cipher prepare/unprepare
  crypto: sun8i-ce - save hash buffers and dma info to request context
  crytpo: sun8i-ce - factor out prepare/unprepare from
    sun8i_ce_hash_run()

 .../allwinner/sun8i-ce/sun8i-ce-cipher.c      |  85 +++++-------
 .../crypto/allwinner/sun8i-ce/sun8i-ce-core.c |  37 ++----
 .../crypto/allwinner/sun8i-ce/sun8i-ce-hash.c | 124 ++++++++++--------
 .../crypto/allwinner/sun8i-ce/sun8i-ce-prng.c |   1 -
 .../crypto/allwinner/sun8i-ce/sun8i-ce-trng.c |   1 -
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h  |  27 +++-
 6 files changed, 137 insertions(+), 138 deletions(-)

-- 
2.50.0

