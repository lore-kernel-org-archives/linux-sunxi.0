Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23946221FBC
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Jun 2025 09:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750931960; cv=none; b=aezoqqtjT0BDBitmXyJkor1u+Cx15GKifAMFo9yviSxoQ+WeINLJU7KQu7bNspi4qJGpwg/6UtObvGz7BGyV3eAPgqSxHlkKUiVgUgy0xpOzJtvQjnJ/O1wURxlO0fBXGGjQGOeQewSenDtWMLeRv3PZr+cQGFnDndP32FOZdCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750931960; c=relaxed/simple;
	bh=46hpWcPcGG9Wv6bjJq58rxcOTw0GpeHkRsTdMhSB6ek=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a4ieMOO9PVLEDkAjAqF5cqte4OjS5PowEJShIeAO/AtNY0bfrGhEjnLoEnF9gp8nU62OWHOw6HdgH3nakscRoVNCwHKMNficXO37jIim0LiamViFKsZdF4tENngQIL7MPuH/9w/WUr3UyMUYMYbVPf4D2KpTsG3D640nsHlu8Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hBJbcmMq; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hBJbcmMq"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ae0d4451a3fso127436766b.1
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Jun 2025 02:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750931957; x=1751536757; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CjO/ptLW3b4rtGhdm7irBfUpl4TyUoEIOLpVLAH9NO4=;
        b=hBJbcmMqKJD+K2lcXF/5afnizz19X30FEDSOQ1eVSXiJ+jm3ygHI031Alz7lndKNqS
         UaOLH5myZN1fYjuZ99CjUMDF9cx1H3XpyJRqGoxZpM6LFPUxjUlVYQWiOGU4eLFLeCnj
         2Lxhwn+8nUwWRAUoayrk3je8oJQzIa1tKVKcOCiTidHX4/DKKQ9xoAWudAoltpKEVcfa
         /VChGQ2G9mKCPI4iV+yhxveKcpbrgd7RRLqurP2ZDNDJ+QqFCuxD4A5SyG4Vap1sMdiy
         jjpHfqMVN5vcIgXV+EPqjIIOs8GDfVnutBfNgt+WogUN+/L/VK18mcMe4NdrAfwMl+mI
         huLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750931957; x=1751536757;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CjO/ptLW3b4rtGhdm7irBfUpl4TyUoEIOLpVLAH9NO4=;
        b=Aj4f6mAEzTGG0pkTxfEUCHeD5QmQcJj0JooBwIH8SRXYyP80Cpnup2Q+sZf738aqEv
         ookjH3FYop3DPwC3AOEtYYyxp/oiEMU8IdiSS6GEn4LWtBJbs1frooInFJF3J7LH2uZH
         f5QEMBBuaakE/mG3rFov3+hCWfLo2Z9hmKs+T3JjXbkrg8r+OqHab7Cb+ylJICTPycoS
         xVwCPmnccy/mMSoiD+x59BrHCX3R7x9yIwMEjynXDebg0uORc637DO/smcgmoLbnEdyS
         2jfbvCyMgn9VXMMAQFWhdeLqYskR6l/jyOoAyH/PcR2YGvcWTd8E3XsBOOVCPH8hOvgL
         ESaA==
X-Forwarded-Encrypted: i=1; AJvYcCXKXeRcrJejSP3e+l+6m4qCTX3q2e3ZAZmqWJsadl9opq1JNLC3hoCOLx/mlmxZvQdwIm7wIp2gHaxJVw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzzc1v7HypvoaQ+zHbMCQCtxPhalj19LJpm7rrCu9kQQ1BIJPNY
	AUSlgjR7IlGrlXqsYGKCWgw+wm1X9mFLAkaDaMjNv0aC2jtH3bCMwnPO
X-Gm-Gg: ASbGncvLbxl9idjvl7tnlIvoeEqXjtfkB4FdIIQNnNQqMg1K4cajRMIEnV+YK1N6fiQ
	wvncNj0JUX28dp/9oneARf6t6CfNNdUxFX3F9yyAdz2TQvmPohOZgl4NkT87HNLmxP1sEogYIjt
	fudCGdi+HUPIkV0QV0xsJn2qjHHQ+Fy9+YtAaVwO3GgT7ge0lRYMwr7pKPPCiEdDpvux68+3mTy
	7CgzExz1FbmFQz+zlVIOB+0uc/l0dD3z+IXOLiqmR8Cgf7jV2lEUgH85/1TMa9EZ+LdqP51H9De
	5nnbL54IGXmfL6Z3Ip7Lo6LWCpH1S2jox0va9zUiJtM7ok2mHxPncJ+Cl5OtJ8ce9JPwIjtr1Wp
	eN/wgWWZ2y2y+VOqL0ftw4gdJ
X-Google-Smtp-Source: AGHT+IFulE9JLwWYfiP6+EbStasn8y1TExIFDY+mxNKb98YrHL6j30fB+s7fixY8YLajpv4J85GFbg==
X-Received: by 2002:a17:906:cada:b0:ae0:54b9:dc17 with SMTP id a640c23a62f3a-ae0bea9382amr639642666b.11.1750931957054;
        Thu, 26 Jun 2025 02:59:17 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:c51b:8900:a03f:12cb:72f7:9069])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae06aa5ff34sm1014106166b.40.2025.06.26.02.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 02:59:16 -0700 (PDT)
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
Subject: [PATCH v2 00/10] crypto: sun8i-ce - implement request batching
Date: Thu, 26 Jun 2025 12:58:03 +0300
Message-ID: <20250626095813.83963-1-ovidiu.panait.oss@gmail.com>
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

Changes in v2:
   - fixed [-Wformat-truncation=] warning reported by kernel test robot


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

