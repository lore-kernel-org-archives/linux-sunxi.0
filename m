Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C841410ED
	for <linux-sunxi@lists.linux.dev>; Wed, 20 Apr 2022 03:02:26 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id e128so357407qkd.7
        for <linux-sunxi@lists.linux.dev>; Tue, 19 Apr 2022 20:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KavF0KS5KLJOY2dExE8lwinSJ4LN/Ebtbb6yL/bzNzQ=;
        b=HUVQ9hYwgHZNg5WnRMOni56Ap1MZ70xEe/27UfralAfuzxuhGwVEV7sWnzKU7PE4VI
         mnKA/Syzu4UHEK8i3A3VZhFq4N884cadqvoFjq9hasIXcxROpbhLDufXszewlNUNUprm
         SC2zMIdzeDG70E8tfF8MaTn9yYZ+ux+BVsWNxDqT/iWCu961dXsxBo8lhVnJVGd+LblU
         T6NZM6wNYsriaZFLgU0RhtFvlK0We6tBHyraDAUTUpXFAIzwmBOy+3j6uB9PUncT1aYG
         pq1v1yQmpd/dhl8kM2xtD7kbhDfM/EB6D63MeBdhvRcguPoJqzVO0LTfo5DlVs2IP3ZV
         y4GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KavF0KS5KLJOY2dExE8lwinSJ4LN/Ebtbb6yL/bzNzQ=;
        b=Vl69Qd3X/8p/bjbLU02sNZlIr7XMLwen5BwbpX75jx8vr9XPbVwryP6zltZ7S+pC9+
         wz3hwpkPn1MKedAoGL3RWT9RxX5XynJAgIlBzW/ZdbjP3/UuRaZO6i5udqTDiCNJ7LyJ
         BfGcpAhhAr+diKyNjUBNOHL+ol2DJzPaprNTxwIWpHm5Oo6vAEKUHWihr2F42PfKqi13
         j6Gk2LQr/3Fpq8qwNNml08tNBgTZP0MZVEVGkQHaXISlNsLL5fQdsRxyFVgUoOnBQEtP
         wip44rtGwtiqgVrgXuhqhhLBihwGVPyZdnFVtX7grdjv7+KB0DfNEw1pdwl5WZr6/lmu
         PFaw==
X-Gm-Message-State: AOAM530LoFM38/+3twkLVlPWnzM7NbSDApbvYSsy6zkmrMw/4+BUBSH/
	Ink/MW6p0vvX98K7on5zTbE=
X-Google-Smtp-Source: ABdhPJze4x0EooB6fj4coS6yKRAfPwsXGsHPWMbc2mEf9a1fZVmbOKI/UVTTi1Cheg3zVUKCLBbzEw==
X-Received: by 2002:a37:88c2:0:b0:69b:f243:b5c7 with SMTP id k185-20020a3788c2000000b0069bf243b5c7mr11102150qkd.758.1650423745722;
        Tue, 19 Apr 2022 20:02:25 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id q139-20020a37a791000000b0069e88513517sm947132qke.91.2022.04.19.20.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 20:02:24 -0700 (PDT)
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
Subject: [PATCH] crypto: sun8i-ce: using pm_runtime_resume_and_get instead of pm_runtime_get_sync
Date: Wed, 20 Apr 2022 03:02:18 +0000
Message-Id: <20220420030218.2575565-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Minghao Chi <chi.minghao@zte.com.cn>

Using pm_runtime_resume_and_get() to replace pm_runtime_get_sync and
pm_runtime_put_noidle. This change is just to simplify the code, no
actual functional changes.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-prng.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-prng.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-prng.c
index b3a9bbfb8831..b3cc43ea6c8a 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-prng.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-prng.c
@@ -108,11 +108,9 @@ int sun8i_ce_prng_generate(struct crypto_rng *tfm, const u8 *src,
 		goto err_dst;
 	}
 
-	err = pm_runtime_get_sync(ce->dev);
-	if (err < 0) {
-		pm_runtime_put_noidle(ce->dev);
+	err = pm_runtime_resume_and_get(ce->dev);
+	if (err < 0)
 		goto err_pm;
-	}
 
 	mutex_lock(&ce->rnglock);
 	chan = &ce->chanlist[flow];
-- 
2.25.1


