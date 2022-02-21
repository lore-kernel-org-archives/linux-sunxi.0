Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37A82596
	for <linux-sunxi@lists.linux.dev>; Mon, 21 Feb 2022 12:08:43 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id f17so1808633wrh.7
        for <linux-sunxi@lists.linux.dev>; Mon, 21 Feb 2022 04:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tbukRrC7Ov9F7pBcIG9IeTY2nydApA5tOh+cl5c9cGc=;
        b=SdKLSu27cu2/hHwLhVv7Jo5NLGz2GrSxYcsgEyyOgzdrRUyITQbKY4U4C1U7WkLqFC
         qe6XvaUjxo8J+U50MFASy3E1yA0PwR15dPQnsDWRTVAC+ricUxOKvuthq3wG3aDjC6tK
         dKTfpKygLdl7yWXFNyH0r0r2OoqY6poyYz2Q1LAoIjmPuaK9OFuJBAJ79aGvmHNnaO7V
         KCLzl7lZC1NEBrYXotzVKPVaYafTQB2+4MY96hhBOrR6G4EXfebubkZlfg7Vz5DTDxCV
         PdxZovQ+CBNr264//qDUeHDh8VLnbSD7TSMK1D9etdED/q6eWCNJ04f6eI6/N5DmSQvQ
         Jb6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tbukRrC7Ov9F7pBcIG9IeTY2nydApA5tOh+cl5c9cGc=;
        b=7mvpORBcnIOgs9gMtI0wS/QhgqElslOa5DfS76uqZFGubUZHz7WVkNFk4S4JSaNVJB
         9dHORjyJzBhdclKs5v1nc2AqZTozgU7bj74THQ/r/X1hobR3yp5txRYj5cpUJUiTQFV+
         cK8VNOkhUVQu7l9GohqaGXZX5sA78tdEQ0tITnq7aIUWcnh1CH5F/sEwRxZHnKy1vdUm
         RxpGzuIFH50SuJyKjZiQ/62YKYWsZZv+0BvTywmdA/jQjIb0r2GJO4sCnL9O0F3NCQJF
         s0Oom4SsuN86eI+KBehRrNTlOBuT1tEMcjWCGNvsXUkQ94zCKWTWNxfveqKX7bGfNpG2
         wKrA==
X-Gm-Message-State: AOAM532Pt8ZhYHsxsWz7bEQWbK3L00XKHQsP0C7H5gP0lqhPQ0E96L8C
	tNwkzrecHVRjcjE0DUr1T3ZUTA==
X-Google-Smtp-Source: ABdhPJy/cSnpe98uh3pMY3LAxU5hDt1WIksiv02kviAW0TkeCF3/8ErsTgLm6Koq7SSLTrdT4sgkuw==
X-Received: by 2002:adf:f312:0:b0:1e8:f4bb:5a5c with SMTP id i18-20020adff312000000b001e8f4bb5a5cmr14695631wro.668.1645445321994;
        Mon, 21 Feb 2022 04:08:41 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id a8sm11821546wra.0.2022.02.21.04.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 04:08:41 -0800 (PST)
From: Corentin Labbe <clabbe@baylibre.com>
To: herbert@gondor.apana.org.au,
	jernej.skrabec@gmail.com,
	linus.walleij@linaro.org,
	narmstrong@baylibre.com,
	ulli.kroll@googlemail.com,
	wens@csie.org
Cc: linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 2/5] crypto: sun8i-ce: call finalize with bh disabled
Date: Mon, 21 Feb 2022 12:08:30 +0000
Message-Id: <20220221120833.2618733-3-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220221120833.2618733-1-clabbe@baylibre.com>
References: <20220221120833.2618733-1-clabbe@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Doing ipsec produces a spinlock recursion warning.
This is due to not disabling BH during crypto completion function.

Fixes: 06f751b61329 ("crypto: allwinner - Add sun8i-ce Crypto Engine")
Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c | 3 +++
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c   | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
index 7cc496c03084..0b1ce58bdeb9 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
@@ -11,6 +11,7 @@
  * You could find a link for the datasheet in Documentation/arm/sunxi.rst
  */
 
+#include <linux/bottom_half.h>
 #include <linux/crypto.h>
 #include <linux/dma-mapping.h>
 #include <linux/io.h>
@@ -272,7 +273,9 @@ static int sun8i_ce_cipher_run(struct crypto_engine *engine, void *areq)
 
 	flow = rctx->flow;
 	err = sun8i_ce_run_task(ce, flow, crypto_tfm_alg_name(breq->base.tfm));
+	local_bh_disable();
 	crypto_finalize_skcipher_request(engine, breq, err);
+	local_bh_enable();
 	return 0;
 }
 
diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
index fd7f1db863d9..5b6c51b78dde 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
@@ -9,6 +9,7 @@
  *
  * You could find the datasheet in Documentation/arm/sunxi.rst
  */
+#include <linux/bottom_half.h>
 #include <linux/dma-mapping.h>
 #include <linux/pm_runtime.h>
 #include <linux/scatterlist.h>
@@ -472,6 +473,8 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 theend:
 	kfree(buf);
 	kfree(result);
+	local_bh_disable();
 	crypto_finalize_hash_request(engine, breq, err);
+	local_bh_enable();
 	return 0;
 }
-- 
2.34.1

