Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C92238152
	for <linux-sunxi@lists.linux.dev>; Thu, 19 Jun 2025 12:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750335854; cv=none; b=o54OIcJ9KgM5O3TnQXtIuK2USzbsy8tDAS0lR+7BZR8j4ERztExn8dyoTeJ7uZawGQjhoYTR9oJhw5PYkXcXg6lCljL3t73dbxK6emqWEMy5s6IVs+jD9TzjOoHcfTIce/dpHqGJBksbE4ysStGKuZY+iJwfzpJtTMi/LEMHPIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750335854; c=relaxed/simple;
	bh=kF4mqyMuFNETsSBSsiMuZaX3ir9TKuI7/fc7yO4ctGs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IAfmFLLrWu+6k7lbN6BrmBjmP1IfuZ3oskE/VYWF31DzWqFPvGyciP2BNnggwEGji87NaDWijVStLyO24mRbIzlUIB2ZpUont1DnvRdQxcsI1xhhiL5HqCwPHh0FHGy38kUcYbt8jv8j02kGWD/HUNL20Zz6gB0HOK0Kw1Casfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Doa6HkDr; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Doa6HkDr"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ade5a0442dfso137730166b.1
        for <linux-sunxi@lists.linux.dev>; Thu, 19 Jun 2025 05:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750335851; x=1750940651; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CCfcfq8X1qJYhuZKNPdQznstE+FhOnktsIaudCrihyE=;
        b=Doa6HkDrH9BfrSLaALFIQZNp0CKNusVvACA9ebpW0T+FGmueLn+1xD2+PikUY8XtxJ
         4h62Jh6Bcd1I03sKLr8uY2Gfy8hxvi0fulKrxjuExNtq6VL6ipWH3j9TiEGi3HDVGv4s
         JDEMtO/9QY2f57lL7c6vBxxZurzkBoTtcoS2xzru0aHSeArlpPL1kEuTg5S8NT6ZGmGc
         T9f/QF2JwV+jmxKqvjjY4BmFK7a4NJeNFrcjAoA6GJhCcUZ8mIOml4Cbc5c2APEtpu2N
         Wiw0Id30CphV0OPBnwofSpjqb0+7vszq7G4e9ffWxhEO7Sxn3BgV9Sji0cyy9TsckAlZ
         HWYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750335851; x=1750940651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CCfcfq8X1qJYhuZKNPdQznstE+FhOnktsIaudCrihyE=;
        b=E1XOROB97UJESMTI0QaiGbiz0YmN8vRGEUievwejii6TNxom+wB4yn2jeLQgr3pjiy
         nfePYo4gIhYpY1sTisQw1RfOSSWP5+KoogKO0Zcz+1+C3lQYI7oBgu03V8IOS/7ynQeC
         50j03aOle6zP53qsbPv7ReulJbXSH+lY4g/nSHhwJekehwo9O5mA5rEPQoaJ8lswmtmo
         U9/m+fJyBBtEhlTJSHZuRBta9WPe9/vWQRyBF/klLEWMpmI3Nm6xVd+HOG0ZyHUmGOwS
         XpErWLoqVUj/oJJX8kXksANjoaaPdKpG3H2jjpmmc36zesfFaE5EySWkECevPXfRVcjM
         07hQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTQCfUKeA1S4Of+RJcqSWWdIjknFpH+qTBMQBzAGcTfQDSC5Ek1hb9e1VZl7QYRGS9wbC3kWVuiAuAzA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyV5/gVzegCFOZhbTth4Z3hGnRS/PWb14hjYEwQrvEp5EGDJneX
	/4mT0i3E+At/mengPp7xsD7HKGoF4+8SrQOzm9OSb/NLeSxR18jXdpBP
X-Gm-Gg: ASbGnctKkcrGT6gbaR6J5VCaASDyzkM3GbZPYSig4yS05XIx/Uqk5mICZfJV9PBasRJ
	g5aH2a7wES0oWwlZp6lcjVNSPh3w7gOSRUPcMgdxT+Vi6Id/17V5BdHG12bNatlR0qCtj/XkxQq
	EklawhTHF7jQ4SXIIm2wnuSSMmYmBBUb5RKz+RDxKnPTOdIfbVG0Bn65O03EWofObtzsGZNxKL8
	mUT3KTQ38RCAyI6w/KupuDvNmagZ/6rO5U43wqdL4GpqjpaXOOJJgtDMaoO9Pk11EjQDXdOox0u
	87/Em4xt9HRbUXtp0aFQba2z3X4su5bzSztY+oKQ5GZJC3Ppeb7Z51UVRNsm0/SaBJlfxxVN47q
	9Trf/cvet2hss3A==
X-Google-Smtp-Source: AGHT+IHUuqtHwS6ePSREPoIXcxb7Gs3mBMp2owjvf/lJwUZbFDI75gzoaIsc4V4vaYVxfg5C/ZKVLg==
X-Received: by 2002:a17:907:3dac:b0:ade:198c:4b6f with SMTP id a640c23a62f3a-adfad364957mr2158168666b.1.1750335850583;
        Thu, 19 Jun 2025 05:24:10 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:c51b:8900:a03f:12cb:72f7:9069])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae000b02bd3sm504688066b.3.2025.06.19.05.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 05:24:10 -0700 (PDT)
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
Subject: [PATCH 00/10] crypto: sun8i-ce - implement request batching
Date: Thu, 19 Jun 2025 15:23:06 +0300
Message-ID: <20250619122316.2587236-1-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner crypto engine can process multiple requests at a time,
if they are chained together using the task descriptor's 'next' field.
Having multiple requests processed in one go can reduce the number
of interrupts generated and also improve throughput.

When compared to the existing non-batching implementation, the tcrypt
multibuffer benchmark shows an increase in throughput of ~85% for 16 byte
AES blocks (when testing with 8 data streams on the OrangePi Zero2 board).

Patches 1-9 perform refactoring work on the existing do_one_request()
callbacks, to make them more modular and easier to integrate with the
request batching workflow.

Patch 10 implements the actual request batching.

Ovidiu Panait (10):
  crypto: sun8i-ce - remove channel timeout field
  crypto: sun8i-ce - remove boilerplate in sun8i_ce_hash_digest()
  crypto: sun8i-ce - move bounce_iv and backup_iv to request context
  crypto: sun8i-ce - save hash buffers and dma info to request context
  crytpo: sun8i-ce - factor out prepare/unprepare code from ahash
    do_one_request
  crypto: sun8i-ce - fold sun8i_ce_cipher_run() into
    sun8i_ce_cipher_do_one()
  crypto: sun8i-ce - pass task descriptor to cipher prepare/unprepare
  crypto: sun8i-ce - factor out public versions of finalize request
  crypto: sun8i-ce - add a new function for dumping task descriptors
  crypto: sun8i-ce - implement request batching

 .../allwinner/sun8i-ce/sun8i-ce-cipher.c      |  90 +++++------
 .../crypto/allwinner/sun8i-ce/sun8i-ce-core.c | 152 ++++++++++++++----
 .../crypto/allwinner/sun8i-ce/sun8i-ce-hash.c | 140 +++++++++-------
 .../crypto/allwinner/sun8i-ce/sun8i-ce-prng.c |   1 -
 .../crypto/allwinner/sun8i-ce/sun8i-ce-trng.c |   1 -
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h  |  84 +++++++++-
 6 files changed, 327 insertions(+), 141 deletions(-)

-- 
2.49.0

