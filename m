Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699223FCF
	for <linux-sunxi@lists.linux.dev>; Wed, 26 Jan 2022 21:04:57 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id q9-20020a7bce89000000b00349e697f2fbso4590362wmj.0
        for <linux-sunxi@lists.linux.dev>; Wed, 26 Jan 2022 13:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=snYrFJ12aUfxHMb2aqbQr58aBrO9I7pzj7+8V1Dw+/A=;
        b=4ulCosohtZpKHKk1OWZvg15RfCT5UKS1+RX7vVL4SOremHHI031JCQQpK4rmR26rrz
         sncnRcjqlcn/aNLuhLe4gpkJdGxAwSaAVhujtXACxeo0tMhyIzkskAWEDshjgajbUUoL
         MbRYqeK7HlPbBOuLGz2L6FtBtVuHO34J9qm0UEcmJkTXsxGQbUKvq+K8PWToMHofCpNG
         wd+ln/PqR7hEzYAsc9qOup9JfzLBm7EN+RLBDTgA+lb5G0AnXlIjaGZhzAMnW5gxEoKx
         c/dstabSdqeOY1eOIDthWf6qFk12kiX5Hfz5wlAg5/tyBbYSkbpR6JTqUYSVEBVkWTh3
         zOkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=snYrFJ12aUfxHMb2aqbQr58aBrO9I7pzj7+8V1Dw+/A=;
        b=Z37MUtBezF8FrdraqiXaunK8C1iwFLNnKTkP4TclmLHRSaBZaXmkh41GjNf1cmh0rv
         F1lg3strEUjV3GiQxSG+3dNXJkD9+DMBMAtvLp9UJBWMZW/WLf47Khe5vt2/Vb9VFF0W
         bsEC22rP6dvaZKe/6L7X6vxagLpP75gjhBuBSZnDfKUm6mYIQvEuv7nkb5T4GFOk68I8
         dPwbLGRRZdYKY1dsV/KZO3oiVT4gyGSMbfmVpJjV3EJQJJ5DlqnffgmruqtfsbV2Z6CX
         KQqYE7+W1lsp2KXG0aTxM1UFw/WYhNmMnfxJgC5BTj4hY5xrXDrbL5/pzoClMzH8C429
         TFXA==
X-Gm-Message-State: AOAM53206Bv8EGDz05IG6hcHQuYWLY9oDZpjz6QZyppWh+jmK8QG8/7N
	7QaaVRFlPOAHPCh+EccozT2fzQ==
X-Google-Smtp-Source: ABdhPJw+yWKxm6iGT9HIPz6Vr8isQ+lpFIiKvyXZgf1R+aoAldml+w5ZXDElVXNYI3y5J0Jnqz5IVA==
X-Received: by 2002:a7b:c3c3:: with SMTP id t3mr488729wmj.94.1643231095799;
        Wed, 26 Jan 2022 13:04:55 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id j19sm4948611wmq.17.2022.01.26.13.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 13:04:55 -0800 (PST)
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
Subject: [PATCH 6/8] crypto: sun8i-ss: remove redundant test
Date: Wed, 26 Jan 2022 21:04:39 +0000
Message-Id: <20220126210441.3661782-7-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220126210441.3661782-1-clabbe@baylibre.com>
References: <20220126210441.3661782-1-clabbe@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some fallback tests were redundant with what sun8i_ss_hash_need_fallback() already do.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
index ef3020bc9547..7ebd11d3ff7d 100644
--- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
@@ -287,21 +287,11 @@ int sun8i_ss_hash_digest(struct ahash_request *areq)
 	struct sun8i_ss_alg_template *algt;
 	struct sun8i_ss_dev *ss;
 	struct crypto_engine *engine;
-	struct scatterlist *sg;
-	int nr_sgs, e, i;
+	int e;
 
 	if (sun8i_ss_hash_need_fallback(areq))
 		return sun8i_ss_hash_digest_fb(areq);
 
-	nr_sgs = sg_nents(areq->src);
-	if (nr_sgs > MAX_SG - 1)
-		return sun8i_ss_hash_digest_fb(areq);
-
-	for_each_sg(areq->src, sg, nr_sgs, i) {
-		if (sg->length % 4 || !IS_ALIGNED(sg->offset, sizeof(u32)))
-			return sun8i_ss_hash_digest_fb(areq);
-	}
-
 	algt = container_of(alg, struct sun8i_ss_alg_template, alg.hash);
 	ss = algt->ss;
 
-- 
2.34.1

