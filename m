Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1792565E
	for <linux-sunxi@lists.linux.dev>; Tue, 27 Sep 2022 08:56:05 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id iv17so6070556wmb.4
        for <linux-sunxi@lists.linux.dev>; Tue, 27 Sep 2022 01:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=bEQ+cO4PtSvPHzqNY25Rk57cl8sc42zs+u1n/Vf8KZg=;
        b=XOIvxDxpY8g1tcDM9f3ZfJNAfiXKalsyBRMkO6YU1eeQ2kIfWL9DQ/j4zmvwazNZXd
         UNhVd6jnOgv6MD0rqH548Mf7l5ZwaPA+gZcqeoo11t+0ZSW48HUgNQCUqLYNXP4D3ApU
         rK5ZKovFnxJcUiwkzVx5J3oyBaGbsA/tY8pIDSvvHhtye8mlL0iQCBEocGUALy5WNhLF
         81ZbVXHb6EHFRL6r56Xw204S7+CQghY04kYmyHf4Xku82mUumsYbb/Vgq75I3NSA7/D+
         FFGBUbdvbGmUgZPuvD2FNKg2Z2sXHjsrYEmgiudPo0+Vp/mQU8D/Xs57iktslVuXYj/n
         AmvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=bEQ+cO4PtSvPHzqNY25Rk57cl8sc42zs+u1n/Vf8KZg=;
        b=owFR75K6UzVJtX6o7fgoMbPt7cH4CNY/jkgQ1SKeyrhuB7hBf0mLKEfBZJ1dkKNCSK
         Y48M70dbfYkN/3Rh16Zj2Cyao8rNACJQbUJoDXVDJidN5uXeQ3VkcLOlghOh8CI2jd6l
         VqNzL3hVrEQjEbz0PJ8bsie5aMH3Mj95CQfzfCltKOAE27rqlj9yeNXux5smt2LNj2KI
         +JqAKpS2hYAGxGKdWHKjwnvlWP9WkfoTvWVx4avkDuJNgiRlhRXpxEblW0h2jzFO/i0z
         AWbymr7kJ4AjxxMO8VD2wauzl5VTPqO7UEqyyeg0aK/Q2Zrnh4TSkp1p2TdaP4qHLwQ3
         szFg==
X-Gm-Message-State: ACrzQf0Fi34m011MTmkSzQ7/V0/6uMhs7t6p2235CinYlnrBOA4OApJ8
	jm4iO351dkUVJ/OawcN2vDChVg==
X-Google-Smtp-Source: AMsMyM6dnWsD/C8sFek13thSn84HTvLHGHHhfLDclUX5OEqJ+U7Jyg5vYkgBcr7E1Hl6m25sd9Tbcw==
X-Received: by 2002:a05:600c:310b:b0:3b4:c618:180d with SMTP id g11-20020a05600c310b00b003b4c618180dmr1773755wmo.25.1664268964293;
        Tue, 27 Sep 2022 01:56:04 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id t126-20020a1c4684000000b003b505d26776sm13183734wma.5.2022.09.27.01.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 01:56:03 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
To: dan.carpenter@oracle.com,
	davem@davemloft.net,
	herbert@gondor.apana.org.au,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	wens@csie.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-sunxi@googlegroups.com,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH] crypto: allwinner: sun8i-ss: use dma_addr instead u32
Date: Tue, 27 Sep 2022 08:55:55 +0000
Message-Id: <20220927085555.3196257-1-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DMA address need to be stored in a dma_addr_t

Fixes: 359e893e8af4 ("crypto: sun8i-ss - rework handling of IV")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
index 910d6751644c..902f6be057ec 100644
--- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
@@ -124,7 +124,7 @@ static int sun8i_ss_setup_ivs(struct skcipher_request *areq)
 	unsigned int ivsize = crypto_skcipher_ivsize(tfm);
 	struct sun8i_ss_flow *sf = &ss->flows[rctx->flow];
 	int i = 0;
-	u32 a;
+	dma_addr_t a;
 	int err;
 
 	rctx->ivlen = ivsize;
-- 
2.35.1

