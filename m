Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984C34AA7
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Mar 2022 20:56:16 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id p184-20020a1c29c1000000b0037f76d8b484so3794909wmp.5
        for <linux-sunxi@lists.linux.dev>; Thu, 17 Mar 2022 13:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mu9PNXccAJdhVTexskBbnqVFS7DSWYIvwlxUPxT8X/M=;
        b=20FqSq7+Gz98jUhIdLLoZKY4NQ4nwWdB2FhOdxY4KWxv2Oty4wuU1LzfpgHH32VYrP
         fwhyeMoyXMGQO10ha//eGEFRjCo00OKekoJn2xTX/Omr3n3HhhztcKsVxQTZOxLVj1mN
         BhwAFc5mTOvNF3gN2VqrSDZ3qKycRhHyS6Ov1k/ibiwsd6anmqbbpVaEf/mwaK+o3EyA
         qZE1eCTa1NXz8YZDDGTVaay6NewAnXN3sCRd65ij1xwFV5QlSyCdn5BzHBhWymaEq6DQ
         HO3ZnSH+Kyi5f36IETcEB7sMOHdnMYriahS65OsRs5XEdRALC8faNwXPi6r/E9eXMQ8o
         xUJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mu9PNXccAJdhVTexskBbnqVFS7DSWYIvwlxUPxT8X/M=;
        b=e+Iq4QNQv5GupnJPPhhkkQbOhWKxV8fcPtbHfVp5Kwbusyy5jkTqu8ndUBtMeDqOXq
         EVziXBV/XvPOgIkJoNBmxr/sHrMOEmH46z4JMOYWOGLqJoPziLPBQ5GU6o+6X8S3OgFk
         78G+n37M/9YTbis6rCJA4mh9td9zR7c9keMS2+1kIJHUF6O3w4FvuMW2HL4EIPwRF6Fd
         oIoBFoGvm7Gz6I1NeaYP/ue3+s5/vImjVQVqnERab8TRDxXMYVUemfjzBMG5MmaI8yiS
         AsKSB97YnzzkRmAfsxxX8R17H6ozKROgEaW8kOFI1lbhMwDx9s+00CYUx/9dBaQDLc53
         SnlQ==
X-Gm-Message-State: AOAM533D3I7PsvKVf3orWVgYPf5JlAxYyKigRWlc+VG93HFavtpoDORn
	i4p9aQoN0y+3nqtan9gsZD+Thg==
X-Google-Smtp-Source: ABdhPJwPCZcP/c7dsS44hNuURWEY5qBz3XyOo6LK/OCQ/ZdXbIYkZNYma1Wjm/vCLxwccdX1oQGzCg==
X-Received: by 2002:a05:600c:651:b0:381:3d7b:40e0 with SMTP id p17-20020a05600c065100b003813d7b40e0mr13220460wmm.17.1647550575007;
        Thu, 17 Mar 2022 13:56:15 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id r4-20020a05600c35c400b00389f368cf1esm3695424wmq.40.2022.03.17.13.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 13:56:14 -0700 (PDT)
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
Subject: [PATCH 05/19] crypto: sun8i-ss: handle zero sized sg
Date: Thu, 17 Mar 2022 20:55:51 +0000
Message-Id: <20220317205605.3924836-6-clabbe@baylibre.com>
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

sun8i-ss does not handle well the possible zero sized sg.

Fixes: d9b45418a917 ("crypto: sun8i-ss - support hash algorithms")
Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
index 1a71ed49d233..ca4f280af35d 100644
--- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
@@ -380,13 +380,21 @@ int sun8i_ss_hash_run(struct crypto_engine *engine, void *breq)
 	}
 
 	len = areq->nbytes;
-	for_each_sg(areq->src, sg, nr_sgs, i) {
+	sg = areq->src;
+	i = 0;
+	while (len > 0 && sg) {
+		if (sg_dma_len(sg) == 0) {
+			sg = sg_next(sg);
+			continue;
+		}
 		rctx->t_src[i].addr = sg_dma_address(sg);
 		todo = min(len, sg_dma_len(sg));
 		rctx->t_src[i].len = todo / 4;
 		len -= todo;
 		rctx->t_dst[i].addr = addr_res;
 		rctx->t_dst[i].len = digestsize / 4;
+		sg = sg_next(sg);
+		i++;
 	}
 	if (len > 0) {
 		dev_err(ss->dev, "remaining len %d\n", len);
-- 
2.34.1

