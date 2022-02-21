Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F68E2598
	for <linux-sunxi@lists.linux.dev>; Mon, 21 Feb 2022 12:08:45 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id j22so610969wrb.13
        for <linux-sunxi@lists.linux.dev>; Mon, 21 Feb 2022 04:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eRwXQ22zhUvx1o2PZ7ENLpRDM+5TmK2L3Q+xebz6RZg=;
        b=qmw5zddLshVBKDNx9LmeyGeFD06unJdxUalh9qYp20aANFXunS0qfedH7kKreKAi1B
         TuZ66MDF1UKDbxZfJtTct+TBv4WAKrXribxlOnzuChMAnS3sDdKtTRU18+ju9/hFQSxs
         EhLx/h9ZR4eCkZxp1ViV4aDidIOXtwLywqNfVkjll1JeohtBMUWIZN98n1+RDri/GkOj
         vLCnqS9rwSkHDW6XYSZV9Oe834ro/eJCV+XoXF40hYLL4DMMubP/riKiaLy7jIuAEmp7
         wi+n0NwOGdXFC6avheY2YvwGHhX3elgBsAo6php6McGHit+QF9Qq9ovwKve12Rs6xaT7
         cVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eRwXQ22zhUvx1o2PZ7ENLpRDM+5TmK2L3Q+xebz6RZg=;
        b=5ilDa6oenAug7OBC1GBcbBi6YnqUOppVNkkmkR5dVzM7hp0bkUfCr7zMx7y3Ns0LNc
         7sngHLoI1UGzUin9oxHuuyQrOmA0j8eFi9xwejhhJCRTK+U2Q1kcjdAuRU4JQ7dmdi28
         QCkHT55800u3l6MOlpHhAMex3Rw9JQuuxa9/iaoQ7jckJHvFSQgtbK09sFiO/t98QBgm
         ZynkgZZ2u0vkJclROdJbiWsV7FNSK7oHqXlu7tTnhCXLzOO2mN76+hY1gXXwHmW3YJIw
         gGhqSyOJCLMf4Mw5Atk2sXbVMag4rxVXCPxEN/Ca2pw6JZSaDT/+jzhpTKHmuRftMLM1
         wcdA==
X-Gm-Message-State: AOAM533yOpqjP5zZiWWaLQNrrfNyimCRuIOg1gKkIx/qsqCB5G4Z5R7m
	7UYwjI79ns8bBI331jH48KrK1Q==
X-Google-Smtp-Source: ABdhPJy6vbpLlKF2o118HSZXUs4RfBWx6RmuHRbHpvyirVgJKBWwM1e3MmCtrMzPWWHPKMXOLsmeIQ==
X-Received: by 2002:a05:6000:154e:b0:1ea:7622:64ec with SMTP id 14-20020a056000154e00b001ea762264ecmr676608wry.600.1645445323857;
        Mon, 21 Feb 2022 04:08:43 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id a8sm11821546wra.0.2022.02.21.04.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 04:08:43 -0800 (PST)
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
Subject: [PATCH 4/5] crypto: gemini: call finalize with bh disabled
Date: Mon, 21 Feb 2022 12:08:32 +0000
Message-Id: <20220221120833.2618733-5-clabbe@baylibre.com>
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

Fixes: 46c5338db7bd45b2 ("crypto: sl3516 - Add sl3516 crypto engine")
Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/crypto/gemini/sl3516-ce-cipher.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/crypto/gemini/sl3516-ce-cipher.c b/drivers/crypto/gemini/sl3516-ce-cipher.c
index 53e3fefb81de..14d0d83d388d 100644
--- a/drivers/crypto/gemini/sl3516-ce-cipher.c
+++ b/drivers/crypto/gemini/sl3516-ce-cipher.c
@@ -264,7 +264,9 @@ static int sl3516_ce_handle_cipher_request(struct crypto_engine *engine, void *a
 	struct skcipher_request *breq = container_of(areq, struct skcipher_request, base);
 
 	err = sl3516_ce_cipher(breq);
+	local_bh_disable();
 	crypto_finalize_skcipher_request(engine, breq, err);
+	local_bh_enable();
 
 	return 0;
 }
-- 
2.34.1

