Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91F52581
	for <linux-sunxi@lists.linux.dev>; Mon, 21 Feb 2022 12:08:44 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id k41so9405347wms.0
        for <linux-sunxi@lists.linux.dev>; Mon, 21 Feb 2022 04:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wZFWsyzx/jHMsWPxyPrQm5lf1ZD0aMT85ez0uftjp7E=;
        b=1PGtPPDp+XFtVSREdW90iUbBSR6N4gGIyYK9a0b8MHbK/Qkq1UH2wOhpNzD7hyTVtA
         6B0QWQnBoukyAnTHYkmmddBYf0sa26knc7O5Kx9X6uxs/H7QHr7zPA2/BzmboSv2pTh/
         GhZ8Q5dfBViX2AvCAPLUNbiRQuPHwq5tS0CrZwqj5Z8gpiSVq/rYF2MMveY7EIGO+JSz
         vEePq/DY+or1APvewtFco3JsmXAZbCmvzQHZ8hetzHBpaTvjqTXZrZc9Vy2gOlSElOq/
         9be2oV+LKSHqtwqJXl/m9+UIKdFVb44sEBA0HKyq+KNsl427a4yhdZEtb4/8jwnNkMsz
         9tmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wZFWsyzx/jHMsWPxyPrQm5lf1ZD0aMT85ez0uftjp7E=;
        b=PRDlIKkHKBT6khCvvO0d8exqfG8X9lEjba9IHx1MUjlQAMPM68mz4GtA5TVl+2p6B/
         ooYvlG5Atqfwr5SwwfR3TWUByeTBZJqwB5SJ7geqz4RZCtu906RwEBxXEth1AjJHquCk
         ozoQcmeyBvyosCp0wQaK0jLkvk6SXIXw6tzjNnMAhaWS1Z4B522nVL+JlMbg5QVjY0Xw
         XtH/MQXxj7M4nQ+t2K+R/k1dUI1x6yINJVVT4wKxo8jTtsUU0BaQWB6ANnjJoVnBjHoZ
         3fmnDoVAUtcY6DUgif8ZMZlC0l+MliVsPSRKBWGJBZbcsjJIa7TsE5m/OR/gKUxHtKdu
         zZjA==
X-Gm-Message-State: AOAM531qNymzo2eAsBzjOfLLhgpaV+uZdnibB1oMJ2zKuVSJCPxyv+ph
	ex/SbfIavaGgsRApijGUMxMY6Q==
X-Google-Smtp-Source: ABdhPJyFGzoL8/nsVuES11PLDKB1Nir+e3TPvcagEp/HBZSmVCZxbZuibRi7efMk2RlWfpuAwsMcxw==
X-Received: by 2002:a05:600c:2b94:b0:355:1695:e8c5 with SMTP id j20-20020a05600c2b9400b003551695e8c5mr17921665wmc.142.1645445323024;
        Mon, 21 Feb 2022 04:08:43 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id a8sm11821546wra.0.2022.02.21.04.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 04:08:42 -0800 (PST)
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
Subject: [PATCH 3/5] crypto: amlogic: call finalize with bh disabled
Date: Mon, 21 Feb 2022 12:08:31 +0000
Message-Id: <20220221120833.2618733-4-clabbe@baylibre.com>
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

Fixes: 48fe583fe541 ("crypto: amlogic - Add crypto accelerator for amlogic GXL")
Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index c6865cbd334b..e79514fce731 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -265,7 +265,9 @@ static int meson_handle_cipher_request(struct crypto_engine *engine,
 	struct skcipher_request *breq = container_of(areq, struct skcipher_request, base);
 
 	err = meson_cipher(breq);
+	local_bh_disable();
 	crypto_finalize_skcipher_request(engine, breq, err);
+	local_bh_enable();
 
 	return 0;
 }
-- 
2.34.1

