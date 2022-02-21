Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6862596
	for <linux-sunxi@lists.linux.dev>; Mon, 21 Feb 2022 12:08:46 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id w13so8906823wmi.2
        for <linux-sunxi@lists.linux.dev>; Mon, 21 Feb 2022 04:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1WbusBDevTL0id1+rC6qLSGi8eX9Tec+0gEdUp6beE0=;
        b=D/T2RPldzgpWaePTaWvFPRInmTGPvf5JQV2GkaAY4ibltSxUGvo267U3iNBvxTTNVf
         oXgkIEryAs8WFCi8dNoB0wHLcM4GAuZ02L1fSj+7wu84dKzey4l7F/ctcAAC+8Tncay7
         2DXF7IOzXCF7JtZvr4rWoTOGYLmmotDBg/0Ij/PUQeZy86dO/RFVogFYAwxMuOQrAOjb
         FnDjxhbedsPEUBohewERqQvuUbkUKCqoQjT5JTMxy4ZbonuZwrfYj9TLXXW8yPeacSZd
         sOOx9U/UEXhXCV1h1mX+Mqz2OFFhsMbokU3w8p2zTaJOAngv0/lpFrKLeZ+Dg7U7rU3o
         LrDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1WbusBDevTL0id1+rC6qLSGi8eX9Tec+0gEdUp6beE0=;
        b=HXYmchRn8XGwey9+wYmIrfcywOWmHRG/YPPvvpcZPww4aTcn0pUVGUu/VS4G6pHC9o
         QqxCUqEUDvYsCEQ5HZMHUmN5LWEBgCUwvA9++n0SrcUz5VWvSQLgRdUYdux0n6Rjs/Rp
         nOdji0BqvtbtqbuRNHgtvyq7xzL5LmeMGP4U75GTiKVEEoBN8Q0VH8QiGqZUnhgCl6g9
         kd84ip3jV9Bke0e21p/67GOk/6jJ7IkSz8WJuyqZviuL8yYiZfXYBC64hBm3WbWBeWnt
         gD9GwRwkxpX8EP0L9lyLqxxFhUCOmU3E4icGlKLhFCQg52B5KGGDRZyRYslPIwvz8tkA
         rGjg==
X-Gm-Message-State: AOAM533Tv2dpMJoJc9ZODF99rgXJQG1FHUl0wru+8vvoBX4pf4C4P2Pz
	GGChvmWPZ0jG3dFpfdIE90WOBQ==
X-Google-Smtp-Source: ABdhPJyA8PlOfDHHxH/OqNVLLFns7QOhkyM6XRROGBV6oQogaZvQ9JL5vuO0S3f6KL+yexhcV87zBQ==
X-Received: by 2002:a1c:7c0d:0:b0:37d:1e29:5cc6 with SMTP id x13-20020a1c7c0d000000b0037d1e295cc6mr20767654wmc.31.1645445324664;
        Mon, 21 Feb 2022 04:08:44 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id a8sm11821546wra.0.2022.02.21.04.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 04:08:44 -0800 (PST)
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
Subject: [PATCH 5/5] crypto: engine: check if BH is disabled during completion
Date: Mon, 21 Feb 2022 12:08:33 +0000
Message-Id: <20220221120833.2618733-6-clabbe@baylibre.com>
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

When doing iperf over ipsec with crypto hardware sun8i-ce, I hit some
spinlock recursion bug.

This is due to completion function called with enabled BH.

Add check a to detect this.

Fixes: 735d37b5424b ("crypto: engine - Introduce the block request crypto engine framework")
Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 crypto/crypto_engine.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/crypto/crypto_engine.c b/crypto/crypto_engine.c
index fb07da9920ee..6056a990c9f2 100644
--- a/crypto/crypto_engine.c
+++ b/crypto/crypto_engine.c
@@ -53,6 +53,7 @@ static void crypto_finalize_request(struct crypto_engine *engine,
 				dev_err(engine->dev, "failed to unprepare request\n");
 		}
 	}
+	lockdep_assert_in_softirq();
 	req->complete(req, err);
 
 	kthread_queue_work(engine->kworker, &engine->pump_requests);
-- 
2.34.1

