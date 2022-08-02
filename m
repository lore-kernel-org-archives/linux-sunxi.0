Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A1D7F
	for <linux-sunxi@lists.linux.dev>; Tue,  2 Aug 2022 07:48:24 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id q16so11696713pgq.6
        for <linux-sunxi@lists.linux.dev>; Tue, 02 Aug 2022 00:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=1MS9pf4ztVbyCKv989qflQ+PxKq3BLF8CrASWzL5Thk=;
        b=lGIiLus4o2SfA2Jxob2Ha+khYgBkKyGJKS+Vcci102rBZUndmRJ5ljsqfYbY9GTCax
         fWGx7ZodJ5lzCXLb6GCJFPY7/I+iY1UgUaNn51Sg/U06fGB47G7uCY9T8SRtPJTgrqw2
         /faFbPbiAoTWKxQTHOGn0IKmjo3IYIDfrgVanrSewmwdfqtoMYrUKA5Jd3LBVEdwYgUa
         kmMbAI2kGntsDeibkuagDFgO++O4jQQfFNwPeB/5bER7mfp9ErYpkOJ1sbabGAJKvQzK
         nzjdxhwuf5JhrNd5fdB8pXKG8/8y9f1BwOJJ6nf60acaDbFu5N5ek7OVT4wf4xGZ2lKO
         1OAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=1MS9pf4ztVbyCKv989qflQ+PxKq3BLF8CrASWzL5Thk=;
        b=Uh5bq7N4bp74Na8+B38TNMOeUniyWdRy8F6v6ZEvTOmo7wAPkYi97b6CDNj3r3kinm
         4rlqJg9dZzFpeeSG70iDFsk6d7fv/9p1X3A+eEpvDO6/qdwY59Eyh+pjZtA4dcnGj7R2
         0SxFbpwUhu0fF8wMmmWhXOeZBG+jeGXejFzOrRKChZCqtubFZk2UW4g8FVBk/NKsSszN
         R6K6Ide9s5PjgvU/wUQHyONGBNUiOtEizbN06ZhKquK+YtyoEWTz2Wd4E9Ac4gbCFVWD
         NX1QRKz8nABfHJURw16gTr9K69hj6CXL/i/s5S/7vXk36/TjxUupBLZm5pbSc7o8j9Kd
         2HVQ==
X-Gm-Message-State: AJIora8dRi+wltcrMONGwBsEYpWG+fJ1JAf4TgaOlBx8WBZdPczQDTo6
	441mZQTeolUv0URB4KjMQj0=
X-Google-Smtp-Source: AGRyM1v1gY2V3nnnptsChGo3jWDB2lLIfhIs+d8gvjTPXPhtu/yYY3HgvYwrtligtEO7ZgSGWqKeoQ==
X-Received: by 2002:a63:f143:0:b0:41a:3744:8639 with SMTP id o3-20020a63f143000000b0041a37448639mr16131973pgk.254.1659426504327;
        Tue, 02 Aug 2022 00:48:24 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id m17-20020a170902db1100b0016ec8286733sm7485135plx.243.2022.08.02.00.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Aug 2022 00:48:24 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: ye.xingchen@zte.com.cn
To: linux-kernel@vger.kernel.org
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	ye xingchen <ye.xingchen@zte.com.cn>,
	Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH linux-next] crypto: sun8i-ce:using the pm_runtime_resume_and_get  to simplify the code
Date: Tue,  2 Aug 2022 07:48:20 +0000
Message-Id: <20220802074820.1648786-1-ye.xingchen@zte.com.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: ye xingchen <ye.xingchen@zte.com.cn>

Using pm_runtime_resume_and_get() to instade of  pm_runtime_get_sync
and pm_runtime_put_noidle.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
---
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-trng.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-trng.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-trng.c
index 19cd2e52f89d..ef9cfc61af32 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-trng.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-trng.c
@@ -54,9 +54,8 @@ static int sun8i_ce_trng_read(struct hwrng *rng, void *data, size_t max, bool wa
 		goto err_dst;
 	}
 
-	err = pm_runtime_get_sync(ce->dev);
+	err = pm_runtime_resume_and_get(ce->dev);
 	if (err < 0) {
-		pm_runtime_put_noidle(ce->dev);
 		goto err_pm;
 	}
 
-- 
2.25.1
