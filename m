Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5234A9F
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Mar 2022 20:56:17 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id bi13-20020a05600c3d8d00b0038c2c33d8f3so2977319wmb.4
        for <linux-sunxi@lists.linux.dev>; Thu, 17 Mar 2022 13:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rDd6Lum4WVHK2qnq9j8fS4muA5cEDXa7xMcM4rmC0VU=;
        b=bQxQxJAopjBa0cH3DEA/wH7NmBNJs68v3ttaUHN/+kGRSs6CQsIpqCvzQQN2lyiZa5
         O9dMEpnnsSy4JfQpypICumZkQ/hfGH9OX3mg4mdQbuAAS0E+BjA+6mbMnUOanIeTVNmP
         KHpuqC9s2au36N2guRPz4Q5RluOow2CMFqhnPmaCuhE69JVLbrCaxtYcqg5q18QeuJ4s
         MaK6NCzRLP/CRb74vXmwyBHCN6mQc44u7+4d8P8rU+iSIduD1scckg/ESB2SFEJ1GVSN
         WwuAdMYz6HZJhzuD/xRei98D5eYjbgGxlPMNoCoQkBKCfdZvip7YoM0SD4XpebERtwpg
         eu1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rDd6Lum4WVHK2qnq9j8fS4muA5cEDXa7xMcM4rmC0VU=;
        b=iS0kI5sr2Pk1zLhUwVQ1Zc86JvlXHRDALIa4c+JUFTt7XTzSnEPE1wbsK32gE1ytLG
         SQqjiPY16eif000KC2Y4FrMGlLV/9ngYwlEM2z/j2lbsB0SROIWpYKv8ng/UZmuW80o3
         uPZpjBUklg3AFIBIhKlT882RD+2VnvjB0l7hRHh1uXWdV68EPXpnQR2yUfYz9KyDaT9/
         0JD9IkFA4H2Hm+so0+qIvIjNJVuRYByj+mXs4PDT+uu+80TAsfre8zGc34qW+1mFVdhJ
         xFcpLrkDjYImYgrjlllTLoKYBpONEWFy8YNls6OAOy16RTDgkgjcNxpgF5GjZsyytCzS
         H+iw==
X-Gm-Message-State: AOAM532WxUDy34PKwu0JTFPTwV1eol5/Goebjbilq5oGCYctxvZM5fW0
	9r3M9oXNgFfWfxiwtx+uuxW/2Q==
X-Google-Smtp-Source: ABdhPJyQHkhV6+UUIW8gnu0AAX3hcWcWqqY3Ps0tnLgGEr/efCECgC8g9vsbSOUGQX3PgDIA0DNkUg==
X-Received: by 2002:a05:600c:4e07:b0:38c:8187:13c3 with SMTP id b7-20020a05600c4e0700b0038c818713c3mr3010470wmq.11.1647550576305;
        Thu, 17 Mar 2022 13:56:16 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id r4-20020a05600c35c400b00389f368cf1esm3695424wmq.40.2022.03.17.13.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 13:56:16 -0700 (PDT)
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
Subject: [PATCH 07/19] crypto: sun8i-ss: test error before assigning
Date: Thu, 17 Mar 2022 20:55:53 +0000
Message-Id: <20220317205605.3924836-8-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317205605.3924836-1-clabbe@baylibre.com>
References: <20220317205605.3924836-1-clabbe@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The first thing we should do after dma_map_single() is to test the
result.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
index eaa0bbaf5581..49e2e947b36b 100644
--- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
@@ -420,15 +420,15 @@ int sun8i_ss_hash_run(struct crypto_engine *engine, void *breq)
 	}
 
 	addr_pad = dma_map_single(ss->dev, pad, j * 4, DMA_TO_DEVICE);
-	rctx->t_src[i].addr = addr_pad;
-	rctx->t_src[i].len = j;
-	rctx->t_dst[i].addr = addr_res;
-	rctx->t_dst[i].len = digestsize / 4;
 	if (dma_mapping_error(ss->dev, addr_pad)) {
 		dev_err(ss->dev, "DMA error on padding SG\n");
 		err = -EINVAL;
 		goto theend;
 	}
+	rctx->t_src[i].addr = addr_pad;
+	rctx->t_src[i].len = j;
+	rctx->t_dst[i].addr = addr_res;
+	rctx->t_dst[i].len = digestsize / 4;
 
 	err = sun8i_ss_run_hash_task(ss, rctx, crypto_tfm_alg_name(areq->base.tfm));
 
-- 
2.34.1

