Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06732595
	for <linux-sunxi@lists.linux.dev>; Mon, 21 Feb 2022 12:08:42 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id x3-20020a05600c21c300b0037c01ad715bso11049338wmj.2
        for <linux-sunxi@lists.linux.dev>; Mon, 21 Feb 2022 04:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mrY/YH1b9s1O9jMerN3hmkMMZmwmjWK0cZUfx1sY+dQ=;
        b=EHxIl7XNaoQqifbAvm4pywi+Wi6IHmxkBODFSm+hpEkuqO2pcABRHVqZhfTEPj1C/x
         qh6elN871Df9GMwQuyaZdPJC3DxREktLEXIZvvlF0OV8gP3GwT0NsKoTwz65WJst/8T+
         Jc6I9zU5zpMgjdlDS5KnRSSt+Pqg+BmmfkewzG/0DiGhzUSgxV0HMYXTaOW8wULF3qPX
         ZlGHJKkX0klQhkX6VeZciYbt82ixAoV6ySkls8QVrWpDNVBDuSBnlgHxWIJO0XM0hqLG
         4CM/AUl9hfEj+n4UcteK6q2IVldLU4dmeJWbD1pH+2+6uaTjbF4hpUtFn66Vvd/UVwvy
         JWOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mrY/YH1b9s1O9jMerN3hmkMMZmwmjWK0cZUfx1sY+dQ=;
        b=X9wzoVD2gbhULUXvPIAwYntLtr8sLaL8HKy76Ytk70iOXu8/ILvjOzoBH31idq8kWi
         CTJvyA7U8HEK7hfSwrneX61qgRuSzW12nMClil+OGjEYmr7ybR22EqfA46Kfc1JO7cuZ
         LNcEYXEdTqBq5lW2bE6Vug93dDXMbENkR7l0KuyGW8NSmGgxADaJncbXAw9/o9ujUmQ7
         bOKgNLtGIjvjcY7N1xdDV4nXNfGWSZanl6DxjWsrNz9YIPovjQarqupELhvmNd+CKL6v
         99oDtGhBni8PInSa2MryqAFdIE6YmUsDk4xDCCEFx2InFXsOaYOGN67zlWKlzDKDpaF6
         PuQA==
X-Gm-Message-State: AOAM533c1/1Ku6juXMXCEc8H2eBAmSjB9SD0YaM3D95mwQZhzNKcxOZl
	f3QtFNHtfBYU4HdwvRGQOe4YwA==
X-Google-Smtp-Source: ABdhPJxZOj3bAaqzQpMpwIZwq1rULq8jrXuaL/D3GX2+h/JhGdZn8tGDnxnawe+BhPseDP53wiUJlg==
X-Received: by 2002:a05:600c:1f16:b0:37b:c7f2:fbb4 with SMTP id bd22-20020a05600c1f1600b0037bc7f2fbb4mr20467582wmb.47.1645445321196;
        Mon, 21 Feb 2022 04:08:41 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id a8sm11821546wra.0.2022.02.21.04.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 04:08:40 -0800 (PST)
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
Subject: [PATCH 1/5] crypto: sun8i-ss: call finalize with bh disabled
Date: Mon, 21 Feb 2022 12:08:29 +0000
Message-Id: <20220221120833.2618733-2-clabbe@baylibre.com>
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

Fixes: f08fcced6d00 ("crypto: allwinner - Add sun8i-ss cryptographic offloader")
Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c | 3 +++
 drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c   | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
index 9ef1c85c4aaa..554e400d41ca 100644
--- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
@@ -11,6 +11,7 @@
  * You could find a link for the datasheet in Documentation/arm/sunxi.rst
  */
 
+#include <linux/bottom_half.h>
 #include <linux/crypto.h>
 #include <linux/dma-mapping.h>
 #include <linux/io.h>
@@ -274,7 +275,9 @@ static int sun8i_ss_handle_cipher_request(struct crypto_engine *engine, void *ar
 	struct skcipher_request *breq = container_of(areq, struct skcipher_request, base);
 
 	err = sun8i_ss_cipher(breq);
+	local_bh_disable();
 	crypto_finalize_skcipher_request(engine, breq, err);
+	local_bh_enable();
 
 	return 0;
 }
diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
index d8c333fe5eb2..0c2ca296bede 100644
--- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
@@ -9,6 +9,7 @@
  *
  * You could find the datasheet in Documentation/arm/sunxi.rst
  */
+#include <linux/bottom_half.h>
 #include <linux/dma-mapping.h>
 #include <linux/pm_runtime.h>
 #include <linux/scatterlist.h>
@@ -633,6 +634,8 @@ int sun8i_ss_hash_run(struct crypto_engine *engine, void *breq)
 
 	memcpy(areq->result, result, algt->alg.hash.halg.digestsize);
 theend:
+	local_bh_disable();
 	crypto_finalize_hash_request(engine, breq, err);
+	local_bh_enable();
 	return 0;
 }
-- 
2.34.1

