Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2CD4AA2
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Mar 2022 20:56:13 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id n31-20020a05600c3b9f00b003898fc06f1eso5620239wms.1
        for <linux-sunxi@lists.linux.dev>; Thu, 17 Mar 2022 13:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FDPzallkxZHrwYGOlhVbPbIqdaMTkxdkI7weP88y4Cg=;
        b=F+oR8ZJqpHJsxjl0c3X+43Uxvn4qu91BG1wLTrWZa6BEx6hfV5Bx/jtufjc4fYKiTd
         niZ2DOD0y9nTtR8fpiSZUYWmZK8Lo9L4gznSGEYBYNMW1luvYr8hG4WEjWcA9J3aX8ka
         xGrIauj8hye7PYByLPCzkKEihjbxWMv6ygX10GFjp9BWh+R7d9qEu1i1rqTEu9q2AlG6
         ld3rIaiffB/vSsYldxmLqijnWhwpwc1RYBsaVsBBD2IW71FqrifEycqj2MTUMa9O4iz1
         +1e4YA2nImwikiTMxsrDb06O99jUtwND3MDsXl/ru1HXCmMVl+EFN+C5Dz8tuhG7PJjx
         Ckjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FDPzallkxZHrwYGOlhVbPbIqdaMTkxdkI7weP88y4Cg=;
        b=j01FGd1hUmbYbnSI3bSBwfFWcZFxxReIsEas8tpPO7im0o4nskRx0agQ+toevQy0AU
         dewi5f1EveuWttk7PfJzrOBtGs5u1fgzXbIOkt8TFSah4fxHVuLdB8VLeaOQqc78ORjr
         pZx7VsKLIhlEfDUFyhw8bb6ybZbEzmZqHI/SqXPlxc3XiXZzDoq9K0Ocb1dROQ9lmA2i
         2r1rME6ITb17hbDUL+1WUkkNYl6qQlvel27yZ4B6v2SXN9HAsqAKzF0FrEe3+VFV2o5W
         Tr5AKhGtdItko6E3VSrGPhiQU2FbpFGxOdEeOAOvpTygwdFLBTfAsur1Rd5z4aQCm+TQ
         OjxA==
X-Gm-Message-State: AOAM531XYTjIl5QbS3Soha1NMLHK+ew3MRtNd2VtKlBNf2IE8H9SJlL7
	sXSfuhbOqaP/v8IU77ygxnF+FA==
X-Google-Smtp-Source: ABdhPJyA6v3tzW6pBOq5BDaDhMkbXkD+9ITBlMrutFmQXIA+EA1OcHttTwjC8fP3bmUU6MYWk44YAg==
X-Received: by 2002:a05:600c:1f11:b0:38c:6ce7:69c5 with SMTP id bd17-20020a05600c1f1100b0038c6ce769c5mr5690186wmb.64.1647550572234;
        Thu, 17 Mar 2022 13:56:12 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id r4-20020a05600c35c400b00389f368cf1esm3695424wmq.40.2022.03.17.13.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 13:56:11 -0700 (PDT)
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
Subject: [PATCH 01/19] crypto: sun8i-ce: Fix minor style issue
Date: Thu, 17 Mar 2022 20:55:47 +0000
Message-Id: <20220317205605.3924836-2-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317205605.3924836-1-clabbe@baylibre.com>
References: <20220317205605.3924836-1-clabbe@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch remove a double blank line.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
index 35e3cadccac2..01d032e08825 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
@@ -398,7 +398,6 @@ int sun8i_ce_cipher_init(struct crypto_tfm *tfm)
 	sktfm->reqsize = sizeof(struct sun8i_cipher_req_ctx) +
 			 crypto_skcipher_reqsize(op->fallback_tfm);
 
-
 	dev_info(op->ce->dev, "Fallback for %s is %s\n",
 		 crypto_tfm_alg_driver_name(&sktfm->base),
 		 crypto_tfm_alg_driver_name(crypto_skcipher_tfm(op->fallback_tfm)));
-- 
2.34.1

