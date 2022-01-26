Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3C23FCE
	for <linux-sunxi@lists.linux.dev>; Wed, 26 Jan 2022 21:04:53 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id c190-20020a1c9ac7000000b0035081bc722dso602933wme.5
        for <linux-sunxi@lists.linux.dev>; Wed, 26 Jan 2022 13:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UxtlnkkXzgY9MYBwxijbABK2S3Zir1EPcNhEeIERW3k=;
        b=uVMO09/XOuXmt4x6PARdjy4vvpLXI1ZXFgAAaumTVy2NmU1V9Si3lx4byYIB3x7chj
         08qFPwH2UMUkXhDW5u4nBlrpLnp9pJ5dKEJRvTCu5PlK24n+cqMnrU1o2WPb+NzFb3Vl
         sGcbk/v5Z3EN1mJu2s8+S0gzCNlEQNLja4JS9JsNNN6W+KCkLOPDnOl8dLK9HRLp5HJq
         IEIX7k6TCn8B/7LseEBCNhhkj9RLE5ZhE5GJOmvu5iBtjGO6ObKMmENvmsLW3Q5c0lZb
         3l24cLpAD2OWv0E3s/wj9x85O/+hfBZdd7q9//l/qodAgHe2kl7Exi/VFCBjTsTVx9tx
         Es+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UxtlnkkXzgY9MYBwxijbABK2S3Zir1EPcNhEeIERW3k=;
        b=rjTV9hwMkxupSlr/8rcK27B2xRMaF5TEcxOvZnCW74oC53TnAdMyc7tCZ0qmmR8GX+
         snE2RmhaJmVpGfnJdFYXLTOxuGhmxdg4kzqqvc5+I+2XInr5TEQ4aIARS2pt/ja4gUus
         W56Qqaj7TcLiCNKi9tLLsoJxyVgjoKKI1TeU69+0GWdG9HN812oT9NhZMMgAHPHp9KCK
         kI/E37MKk3hNo4rJJG86mCE8+9VKGS4+9D9Qdn34diz9JDTZzkqS/caDcPGaiqwMtfR2
         oKH6B08zHJ94OhpwTnIrwb69r++jj7JecyQpCSsBccyVC628PATDZOyLwH5QukeRekz+
         EP5Q==
X-Gm-Message-State: AOAM5333uv1kuGV/X7bvBhvG0FJyQq2QLNtqagLrS2Ph3otEO0bq71VJ
	iup1TaoRjkNp+4yomIKr85Berg==
X-Google-Smtp-Source: ABdhPJyp6AGL1pT2Yn3YZ1lp/S6Ybp9E/UyigNbrZETxbAsiW7nMj83b0b2T42c9NT/o4PKPzyokVw==
X-Received: by 2002:a05:600c:35c5:: with SMTP id r5mr435934wmq.195.1643231092344;
        Wed, 26 Jan 2022 13:04:52 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id j19sm4948611wmq.17.2022.01.26.13.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 13:04:51 -0800 (PST)
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
Subject: [PATCH 3/8] crypto: sun8i-ss: handle zero sized sg
Date: Wed, 26 Jan 2022 21:04:36 +0000
Message-Id: <20220126210441.3661782-4-clabbe@baylibre.com>
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

sun8i-ss does not handle well the possible zero sized sg.

Fixes: d9b45418a917 ("crypto: sun8i-ss - support hash algorithms")
Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
index 3c073eb3db03..2557bb3fe7aa 100644
--- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
@@ -379,13 +379,21 @@ int sun8i_ss_hash_run(struct crypto_engine *engine, void *breq)
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

