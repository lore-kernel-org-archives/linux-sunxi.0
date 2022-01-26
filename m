Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FF13FCE
	for <linux-sunxi@lists.linux.dev>; Wed, 26 Jan 2022 21:04:51 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id v123so524096wme.2
        for <linux-sunxi@lists.linux.dev>; Wed, 26 Jan 2022 13:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DMvBRIpA0/pHSEkKz7ZQmVefisxCnIB7c3bp5JfnGsI=;
        b=L57gwERWThKBhvaTL9wZxDoT9Uhvyw8ANdyTtCWnAuSsuaNszVO/1RbEqab0HZfJ2c
         wS6kqxR/hfcodFA4B62COohudajaOF5MxYXGJUz2u7iJw0JgJ0Fum4LqCbox1EUwHp0Y
         1gYvm+qONdkKKp8cUdKq4f8O6PMhVNucnlCk+ojbLATN0YrFYEqyHFpF/uUvgb1k1kBu
         RIj4UPWfiGVL2MdCALyXFcUjY5Qljo8afk10M7vuGP7xGggLVS2ugt1RsZtbQS0+Os5n
         21788Z6ANCX263OseF9RFedtWrRq2dys6NRUDdxZEVpbzkKc8q+lDL00GEIVstWyhUAM
         lisA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DMvBRIpA0/pHSEkKz7ZQmVefisxCnIB7c3bp5JfnGsI=;
        b=uxZHKDqe9cFt1B0FGK/YRp4qdnHuu4qWRCuPBa7LttUHPR0mZ+JvBSX1mWR+GtN9hN
         VAVfZeqq7SY9MTewyFwcSASIPLJAeMGPt3JIOZFNaGO6t6xbnaqhrY3UH5mmeGmPRqaG
         puaFQ3X9jfIxxA83PvlUqTHWJcHzx9SyZ5D1cbjEErYUgDxuHAhFfbCimV1uwVGj34zI
         BOa0HxBVSFND9HsPx8Czgey4yZAvKTaCAy8y0eIo/Z+BlXTuYkZTIQ+D67SkZR9C+YOL
         5BWSBEJ552lTvfNLBkQxzqhANaGLUCCPGJzL7qzmqzx/cK4cp8SmyovoELxDuaHoyegU
         Msdw==
X-Gm-Message-State: AOAM532mvY4JiDrYSC9zuAgsADHCWVMHoto1F9iKaHkPrKvr0Furuj0B
	uYrxEh0VQW7Xfqok4ltR0EbaJw==
X-Google-Smtp-Source: ABdhPJxxTiJUsakyD/bKlH9lLMOR6zqVufOIQclFGT9QW+h9m5/4JkNUq6391sN7S8QoXfZJZGsH6A==
X-Received: by 2002:a05:600c:350e:: with SMTP id h14mr448174wmq.166.1643231089360;
        Wed, 26 Jan 2022 13:04:49 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id j19sm4948611wmq.17.2022.01.26.13.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 13:04:48 -0800 (PST)
From: Corentin Labbe <clabbe@baylibre.com>
To: davem@davemloft.net,
	herbert@gondor.apana.org.au,
	jernej.skrabec@gmail.com,
	mripard@kernel.org,
	wens@csie.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-sunxi@googlegroups.com,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 0/8] crypto: allwinner: various improvments
Date: Wed, 26 Jan 2022 21:04:33 +0000
Message-Id: <20220126210441.3661782-1-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello

The main topic was to remove memory allocation from requests function.
Doing this on sun8i-ss, lead to some extra fixes to be found.

Regards

Corentin Labbe (8):
  crypto: sun8i-ce: do not allocate memory when handling requests
  crypto: sun4i-ss: do not allocate backup IV on requests
  crypto: sun8i-ss: handle zero sized sg
  crypto: sun8i-ss: do not allocate memory when handling hash requests
  crypto: sun8i-ss: do not zeroize all pad
  crypto: sun8i-ss: remove redundant test
  crypto: sun8i-ss: test error before assigning
  crypto: sun8i-ss: handle requests if last block is not modulo 64

 .../allwinner/sun4i-ss/sun4i-ss-cipher.c      | 22 ++---
 drivers/crypto/allwinner/sun4i-ss/sun4i-ss.h  |  1 +
 .../allwinner/sun8i-ce/sun8i-ce-cipher.c      | 28 ++-----
 .../crypto/allwinner/sun8i-ce/sun8i-ce-core.c | 20 ++++-
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h  |  8 +-
 .../crypto/allwinner/sun8i-ss/sun8i-ss-core.c | 10 +++
 .../crypto/allwinner/sun8i-ss/sun8i-ss-hash.c | 84 ++++++++++---------
 drivers/crypto/allwinner/sun8i-ss/sun8i-ss.h  |  6 ++
 8 files changed, 100 insertions(+), 79 deletions(-)

-- 
2.34.1

