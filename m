Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B951DDA09
	for <linux-sunxi@lists.linux.dev>; Sun,  3 Aug 2025 19:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754248266; cv=none; b=GM69uvns+uMDa2QKpKlhcrc4iTheGufj5wCcZ4totq53z+lJuEZ3VFvbdW8YJTO/LwHocJdy6yx1MXivK1KXqJ4YpUtK1s2BIrw+nX3tWJGQUvArWozDyG7rbEFdjuJtRxNg6tUMqiurIIx8wUzobI0cMUCu3E2fVP1/GjZhs1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754248266; c=relaxed/simple;
	bh=9mZm4KHicNT9tn8BitXSK+UbAoZ+f+Nh02nlpXVqkn8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ige2/yMNq5fpAdxv+Qv9cPzLvaLf0R2VPgTYj4BbhO3nGwXKX30RPEIOd0it8mxN/53EsKdUMm5DyMRlZog2XGifGe9QNpe6yF0UNfQW9Z5I0BsnuZsQ7A3fUDtS5kTCvvkYvAX6HPyz45f5lh7NiDLwuWJgS6LE94IDLzDhbnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EZdVJS8v; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EZdVJS8v"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4561607166aso26378755e9.2
        for <linux-sunxi@lists.linux.dev>; Sun, 03 Aug 2025 12:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754248262; x=1754853062; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DZGoofDL/+Drlf7goUQdD7nprWB1U8kykjfu61KEsJM=;
        b=EZdVJS8vT1eBedmrnAjfKKSbKTFl0qDMsJmuQoOw+F0mNyYtcdFlarykay2IVuHeT4
         TK00Jqzp4r8unoNElGHnvV3ZSqjbV5lsRdwnW+vHb4jcEaopTIdLserMIyaa9O7sMMBE
         BtNpkPbZE01yl4kIy+L1j5Wgpxir+M7spAjRbxrAc6V/O5Q5kMrLUJGB+08OpLzSuccP
         4EN7qcqeqHTvU42TaYZ9rkem0Z81cdGDlCWXiMVmThE7Z8KdK7+1EJln+lcX5he0Kxy4
         fVgAHc4q4AUUGc/ule04QWztJxJGAedXSvyoyHqy4QrboIO4+/tTbwoS73CZ7ZwejAtb
         6s+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754248262; x=1754853062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DZGoofDL/+Drlf7goUQdD7nprWB1U8kykjfu61KEsJM=;
        b=LhY7+MGTKk4sfTOIMpSLq/dG98c1Tl8gJhwluEQwS7rKldAwEZMTUVtFbulaGL1BZ9
         wHYKAjth55uLcodMARfhtnf0rJm/I0N2tz68Ho3DZAd6CkAgvl60ymmbUGFdmZ+Wem5A
         BZSoOd6/5LOTBZKwrNmMILuF7kfvwMzq3a5pAQilzWzH1U5GyJ7aYUF+ng/lxH5xpUxt
         f2A8bfH3uVV9u28K+YzvOunoJgEEH9shD5RbHetLX2igXjj5DGomC3csSXB2/kSiML/3
         oLrGwAwx1Vaah5dAyqdPEXByyps8FOJtSBtzHbU5JGZdKV8dgo3WQney1L4m4awILsRa
         6MMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTcMFg2FrksYpjIC0oI3rRKu3hxNuKN0XIRq6x69bFYvd6x0QJcZB7+FfKSrMt7mXKUkOUFvQjov2Aig==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz68y+LIr2L/cBQO5RY0VCabgHuoFul2fP+dfeLKC4KWEePnqyp
	plKoJ0+uJZyk09Pbho7uUFe/wjebkGjf1/WEkZnZNW2jDnS0UEe22OWO
X-Gm-Gg: ASbGnctdzq+Bu1XX1NFhcaTG7DZ4VXX39uKgXtJ8yz2J8PoTjmKZkFvaOuse/8y1igb
	EElY0579up4FATB9bApDqmYdxSLQBdD/WtovUtVuP4OZermDyImtl7bWxbPol3dHVrXi7iPrhXo
	kS4oSh8RsNaImflaqzEo+ZpYtDlykPn1PdEWNgh3i/i70/JGQj/6sEWnszn5QPDeq31tBrwIRPx
	5PW5hK17S+iys1B+Ee3uEE21uVENDN8DJWOspTOu1fEkammC58y/cP16/k/t7TEMMubDKx57+FQ
	0hs5KZuynQKv49XSqJemV5O+o4gHl3xDfx6riDKVjJO/+sYtGv4RqJ4V8E4WWk68jxLltZpcVuV
	kCh1Lt5UY2IYxhqgDpNvHMMYo2jHEHmg78VpWzqryUez8
X-Google-Smtp-Source: AGHT+IGgUWvSHp1oHsFPRY5vogFzYlPyb+X50JGskmXxHEZQ3UsSNv66GsiHuM+9cfxnrA490qRp1w==
X-Received: by 2002:a05:600c:4703:b0:456:1560:7c5f with SMTP id 5b1f17b1804b1-458b69dd754mr58643285e9.14.1754248261562;
        Sun, 03 Aug 2025 12:11:01 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:ca0d:f700:1210:b727:adc8:716])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c45346asm13099210f8f.39.2025.08.03.12.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 12:11:01 -0700 (PDT)
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
Subject: [PATCH v2 0/9] sun8i-ce: small cleanups/refactoring
Date: Sun,  3 Aug 2025 22:10:20 +0300
Message-ID: <20250803191029.3592987-1-ovidiu.panait.oss@gmail.com>
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

Changes in v2:
   - fixed [-Wunused-but-set-variable] warning reported by kernel test robot

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
 .../crypto/allwinner/sun8i-ce/sun8i-ce-core.c |  35 ++---
 .../crypto/allwinner/sun8i-ce/sun8i-ce-hash.c | 124 ++++++++++--------
 .../crypto/allwinner/sun8i-ce/sun8i-ce-prng.c |   1 -
 .../crypto/allwinner/sun8i-ce/sun8i-ce-trng.c |   1 -
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h  |  27 +++-
 6 files changed, 136 insertions(+), 137 deletions(-)

-- 
2.50.0

