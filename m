Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5563212
	for <linux-sunxi@lists.linux.dev>; Mon,  2 May 2022 20:19:46 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id v12so20852218wrv.10
        for <linux-sunxi@lists.linux.dev>; Mon, 02 May 2022 13:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bhu4eLQiIRL8RKU2XjxwIhN+TQjOmHOSbzeiE02npHs=;
        b=6mXw8hwrlWl+Lkou1IHnPcR77Qj8SjR1rk5xX35wNVTGHj6WtCPHn99tOmMe+TGTN1
         4VgSQgDOlo5/JSZMWl3vs9FdGpgMGgmtkJ9bJahqqI5vps2zSM0H5oVgz/wpO566AzdU
         eprVi0pxD24DKfdZG860cuQbtiA+xHxIaVkbs8ZhFhUoGDl6xOf23Zrri7VG6K10+KPb
         j4TcN8DKkI6RbHnyVc3PD5aHXBx0F+Nm+xJ03cm8+6aLcduNrCeoejmoLfpu92wZ+wdU
         m6rr+1WrTrsF+sE2tq88t9RK7t09r207MGczHOurB27e99Ru0DFBDOjKEbdda7IdROwV
         zofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bhu4eLQiIRL8RKU2XjxwIhN+TQjOmHOSbzeiE02npHs=;
        b=N/2IdW5dz0myzeIRWjr0b6GnU+L88Kk6nomHo68CKN2Jqihw02sqiwjpnSBXqXRplb
         FiTtPEUGK3e1KfdEmYV2JYoyX47NI6JWoVdZyg8QayZdxZx7M5MZUnupwaDgpQu0SWM2
         c+TZj6aoGVPLlh3rojzyhqnDLXTGeGidL7bteYVpF7zuOsnC4CM7/PXIR5UOXfVJQ5O0
         lV8VRY5VhnvFmO6AZXkHiufd08t749PHYc8qE7JLY7uAcm2SLFgQT4sOhv+geW5OgmSH
         EZrJRX6eww5cDddeCuNG0Uyu0Ppjf7l2UWFpp8lHduIpyxrF2LQTLBzzuWSJWcMnaTA1
         m3Ag==
X-Gm-Message-State: AOAM531HTniJpaqyg0GXPZOufQSAtPfG49VmngFYLXxHv7ynHHmyJZFX
	OCrMjWbXNFrQAwn16hfxlhVwyQ==
X-Google-Smtp-Source: ABdhPJwjus7/meUmZC5qIxb4pLGm0uyVjK5FJyqHsJSI5/SMEAf5aF9tfKyoJD0JHpFnkshjg7ehxg==
X-Received: by 2002:a05:6000:1d83:b0:203:ed96:fa4c with SMTP id bk3-20020a0560001d8300b00203ed96fa4cmr10487646wrb.400.1651522785102;
        Mon, 02 May 2022 13:19:45 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id l2-20020adfb102000000b0020c547f75easm7238183wra.101.2022.05.02.13.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 13:19:44 -0700 (PDT)
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
Subject: [PATCH v2 05/19] crypto: sun8i-ss: handle zero sized sg
Date: Mon,  2 May 2022 20:19:15 +0000
Message-Id: <20220502201929.843194-6-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220502201929.843194-1-clabbe@baylibre.com>
References: <20220502201929.843194-1-clabbe@baylibre.com>
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
2.35.1

