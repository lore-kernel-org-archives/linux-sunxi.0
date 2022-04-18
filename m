Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66346801
	for <linux-sunxi@lists.linux.dev>; Mon, 18 Apr 2022 11:05:44 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id b17so10676268qvp.6
        for <linux-sunxi@lists.linux.dev>; Mon, 18 Apr 2022 04:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HPUttj4kngshxe6tgSoij7Hk/MCoacGhY2Ysb5anUQU=;
        b=bNVqIeTJhXUKv7SROKyONwvaOF9eOB5ackpIHf/JM7ejwo+s0rpddHWyN0u7BmQL5N
         2tKUMTi6+A35MkpR3Ir1U/b1rlm68VVdZqxMgNSlPIpli6518tPzs5OaFGplP0PkHpy8
         V56uxiBvT4lQcdWcGr9yJTSyI4UfDrqSciiDdU+JJecJiFivOZ1bXJotVGaCvxstYouv
         /i9Vw9ybQBwSnxcyZYXKwMrUihc4W4wiSI0U9XRVVJssfxjzmn83BS1PI6fTUZk8aGec
         T0HW60dvfyqU4tJjA81/xUt+bZK0ZeldtejTSQ34/avyaaM6/Wr7f/RYBomiAxTz4nsp
         UfnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HPUttj4kngshxe6tgSoij7Hk/MCoacGhY2Ysb5anUQU=;
        b=ev8mH6k50YcsaniL/luMDpnJ2HAGX0n4NoIj/gBuBkKholY4cEdRHlKkNosLtMIn2w
         g51Tr37CoGi1D7Z6Tu2bKUtFRDSov8GHMH0INClRdmtesqK72oMtZbVwahMNwWv1Im0D
         11+g1F4MKqm4IVs4RDkfklW8ETb/53uuBTVoolbDU7qikpVP52qKItA19cMe4n/5yze7
         BWkgTS9OsFdgHAOUPLO7z5VVjch+OVjwWi07xSNYow9cxopmzpns1SfAvaNelEMYUDHR
         DKjUsbseSUsoyzCoEfquzuP++eMUSOAPlgEpBhgtigJ13Ts0mkhBU+7U6IU2IcbFew0B
         deZA==
X-Gm-Message-State: AOAM532XZmYMytjkAeDMStwAd/6tNh7Po+GlMV9EJ09RZ6ioAAVH8Sur
	YwUoSUmhXZuQGUVELdNSbhU=
X-Google-Smtp-Source: ABdhPJwoxQ1cwLQXeEj76PhEnDL5f/1HxC5Ox2h9pUYvdXrJ/M841zaE58ZGLXSpluZ2nA4PKgI8PQ==
X-Received: by 2002:a05:6214:3006:b0:443:cf1e:58d7 with SMTP id ke6-20020a056214300600b00443cf1e58d7mr7517072qvb.53.1650279943356;
        Mon, 18 Apr 2022 04:05:43 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id a76-20020ae9e84f000000b0069e80daa17asm2952482qkg.113.2022.04.18.04.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Apr 2022 04:05:43 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: clabbe.montjoie@gmail.com
Cc: herbert@gondor.apana.org.au,
	davem@davemloft.net,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Minghao Chi <chi.minghao@zte.com.cn>,
	Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH] crypto: sun8i-ss: using pm_runtime_resume_and_get instead of pm_runtime_get_sync
Date: Mon, 18 Apr 2022 11:05:37 +0000
Message-Id: <20220418110537.2559328-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Minghao Chi <chi.minghao@zte.com.cn>

Using pm_runtime_resume_and_get is more appropriate
for simplifing code

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
 drivers/crypto/allwinner/sun8i-ss/sun8i-ss-prng.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-prng.c b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-prng.c
index 246a6782674c..dd677e9ed06f 100644
--- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-prng.c
+++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-prng.c
@@ -112,11 +112,9 @@ int sun8i_ss_prng_generate(struct crypto_rng *tfm, const u8 *src,
 		goto err_iv;
 	}
 
-	err = pm_runtime_get_sync(ss->dev);
-	if (err < 0) {
-		pm_runtime_put_noidle(ss->dev);
+	err = pm_runtime_resume_and_get(ss->dev);
+	if (err < 0)
 		goto err_pm;
-	}
 	err = 0;
 
 	mutex_lock(&ss->mlock);
-- 
2.25.1


