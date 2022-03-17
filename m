Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549894A9F
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Mar 2022 20:56:13 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id j17so9107738wrc.0
        for <linux-sunxi@lists.linux.dev>; Thu, 17 Mar 2022 13:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xxLigyYubLEfmpzYjesUYMDr681KbgpjvGFg62V3uuo=;
        b=q43mTTbnckKvjJEG6SpmkOL75jCyN+O53AbqkF2sH5XMTWnKY3PtwkqyaFIEcLXBim
         3a5P9Yat03SsVCxysdY+Vius+9jF0kAGvK2I/n8oARjFd3FY/RlfrpMJhteTpo/lMTsb
         Mn0St1xk/mewvcj3k7LJsveBJuz9x+Y2D+9NDvVegPO0tuByXsWqKUec8lQof/z9+E6n
         hrEjrRVUcIeUQ6ZtwLDDoFLlisG/7IFWts55uGoEIvY/8CKvEv4ZJZvPu0PniNQhSGRp
         uPLSb+EBMMR8u5Q3XBqaRUKhL0Y5QN/kudoZl5PEJWeEJC/l+kGAbUjl52UsF3pgIr0+
         Lmxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xxLigyYubLEfmpzYjesUYMDr681KbgpjvGFg62V3uuo=;
        b=AqXWJImasdU7+Vd4eMoZqUbRa+UQCXpcYFfxUzogPqmQ41R4eMNZl1CQiDnLJERPSa
         75Y7uwWHFRSzh1ZBVHwvQPtKcx6XzkJ00WphXa+1+b3XCavrzn/zksB0jGlx8yVQsP1f
         2ZFVm2jOASDpktBS9WJK0Gqkux1IQKPAQZmVHZX0V+AGxfHU5cZfQyOGlcbJlIxBKN/+
         I4gVkkmjfdD+wZX1ogAc8uIYkD+ZkTbNWvTBg6t3HR23k43+2SL2B8R8xxk0pj+wH73l
         k8D17+61nfVIZbVhfWy0Ni9WBxgcUkT+vt/uWlNbGVeyXPeNuFvNTJIFh7oVrMCnIlLZ
         fAUg==
X-Gm-Message-State: AOAM531hO2ph693+91Jw6lXFAnUYCZhzHpJlCdv3IgAgVWRtu+VoncA/
	A9CmGLnGe8Yd1vSBY96G3/UJyw==
X-Google-Smtp-Source: ABdhPJwnwLdUdvOyaa98IK90oH6uDYzGms32CnUFdkUB2BE7Anl0fygB88gDwIBMvxdSPZP7d0z/vQ==
X-Received: by 2002:adf:9581:0:b0:1ed:c341:4ed1 with SMTP id p1-20020adf9581000000b001edc3414ed1mr5616024wrp.299.1647550571570;
        Thu, 17 Mar 2022 13:56:11 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id r4-20020a05600c35c400b00389f368cf1esm3695424wmq.40.2022.03.17.13.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 13:56:11 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
To: herbert@gondor.apana.org.au,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	wens@csie.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 00/19] crypto: allwinner: lots of fixes
Date: Thu, 17 Mar 2022 20:55:46 +0000
Message-Id: <20220317205605.3924836-1-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello

This series is all fixes which I found on allwinner crypto drivers.

Regards

Corentin Labbe (19):
  crypto: sun8i-ce: Fix minor style issue
  crypto: sun8i-ce: do not allocate memory when handling requests
  crypto: sun4i-ss: do not allocate backup IV on requests
  crypto: sun8i-ss: rework handling of IV
  crypto: sun8i-ss: handle zero sized sg
  crypto: sun8i-ss: remove redundant test
  crypto: sun8i-ss: test error before assigning
  crypto: sun8i-ss: use sg_nents_for_len
  crypto: sun8i-ss: do not allocate memory when handling hash requests
  crypto: sun8i-ss: do not zeroize all pad
  crypto: sun8i-ss: handle requests if last block is not modulo 64
  crypto: sun8i-ss: rework debugging
  crypto: sun8i-ss: Add function for handling hash padding
  crypto: sun8i-ss: add hmac(sha1)
  crypto: sun8i-ss: do not fallback if cryptlen is less than sg length
  crypto: sun8i-ce: Add function for handling hash padding
  crypto: sun8i-ce: use sg_nents_for_len
  crypto: sun8i-ce: rework debugging
  crypto: sun8i-ce: do not fallback if cryptlen is less than sg length

 .../allwinner/sun4i-ss/sun4i-ss-cipher.c      |  22 +-
 drivers/crypto/allwinner/sun4i-ss/sun4i-ss.h  |   1 +
 .../allwinner/sun8i-ce/sun8i-ce-cipher.c      | 102 +++--
 .../crypto/allwinner/sun8i-ce/sun8i-ce-core.c |  54 ++-
 .../crypto/allwinner/sun8i-ce/sun8i-ce-hash.c | 130 ++++--
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h  |  19 +-
 .../allwinner/sun8i-ss/sun8i-ss-cipher.c      | 180 +++++---
 .../crypto/allwinner/sun8i-ss/sun8i-ss-core.c |  92 ++++-
 .../crypto/allwinner/sun8i-ss/sun8i-ss-hash.c | 385 +++++++++++++++---
 drivers/crypto/allwinner/sun8i-ss/sun8i-ss.h  |  33 +-
 10 files changed, 767 insertions(+), 251 deletions(-)

-- 
2.34.1

