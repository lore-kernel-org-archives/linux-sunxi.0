Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6791C173
	for <linux-sunxi@lists.linux.dev>; Sat, 15 Jan 2022 10:07:22 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id s6-20020a7bc386000000b0034a89445406so8173258wmj.2
        for <linux-sunxi@lists.linux.dev>; Sat, 15 Jan 2022 02:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xHzaO4ONACqKvhGwj0tPEmx27kwwu6unLDfjaw5odQk=;
        b=QzXz5M+8FThc6YS7BTcBpaSjY2VQwMtyP2aWOFTgY6F3CG/wzIUPGc8S1rddf8lIwy
         0NJaylsB4zEmFToWvVObjj9xVDt78e+wRf5RyYnTktWNqNZ7wpOjFkZJM6PhcDg8hj37
         ZqbRy93uvxc1qxQ2m6dgFTzJFQ8z5tjm8ggH1Dw3eGtX+TiCptySjZ7dao8iEDCiKeZo
         e5ITXODfM/mhjWWfIzzl7bVfpF42p0C82rXjLblhMHEHOhdObgZxRjpxhwxRzLrYVjSp
         T6wCP6BwTvs26YzRPCk4M+b+MMnRJFUEpmNtM2HLfj/kI6QaSpImzW0dn/UPdgp2Dox7
         Xz+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xHzaO4ONACqKvhGwj0tPEmx27kwwu6unLDfjaw5odQk=;
        b=M7LKsDauosUKMb+7vN2oojPFDRr4FY9ro4rD3/C3zhNAKYF0Y1jMv2wGaAcCpmulKm
         bsqoBLilIITWW2hinNbCkK9/yMyLYdhGHUT+sR4WfK/rPPKVyIDEnqfaM7ARUV7KB3sq
         5j2ZCMjE5NzPUhsnH3IAXKqp0yPaPnCD7h+PWU1TroDVGl8sN+Mr6u64PWzO+3tukfcW
         YDsaLas/uSd0kSzROLHt6rXv9ATfvgq2mk5yDPW29QCKm0iv2oD2iDkR3oHkKVcEaiG2
         npFQeJSPrCEm32s0+F+n/e3UPagtIJmaDQ8BEHI4k9z4dRnwfBgy3y0IyfPHzzLjZn/K
         CH2A==
X-Gm-Message-State: AOAM531EjbXmYkDv6Pj+Sm++ypZ6XYQ3draE4uYnF92oxVub8oTlrhb6
	O83YxAUfDrPbT4oalnLjfvmNaw==
X-Google-Smtp-Source: ABdhPJwT9PpLZzfgM3b2ggNB5zCbHPDcVO71Y4bAF4rcgpahWKkHJ1bm1VqNAJA0DccSNUH3AVHGEQ==
X-Received: by 2002:a1c:7c13:: with SMTP id x19mr11934460wmc.78.1642241240658;
        Sat, 15 Jan 2022 02:07:20 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id w17sm9009436wmc.14.2022.01.15.02.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jan 2022 02:07:20 -0800 (PST)
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
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH] crypto: sun8i-ss: really disable hash on A80
Date: Sat, 15 Jan 2022 10:07:14 +0000
Message-Id: <20220115100714.3016838-1-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When adding hashes support to sun8i-ss, I have added them only on A83T.
But I forgot that 0 is a valid algorithm ID, so hashes are enabled on A80 but
with an incorrect ID.
Anyway, even with correct IDs, hashes do not work on A80 and I cannot
find why.
So let's disable all of them on A80.

Fixes: d9b45418a917 ("crypto: sun8i-ss - support hash algorithms")
Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c
index 80e89066dbd1..319fe3279a71 100644
--- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c
+++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c
@@ -30,6 +30,8 @@
 static const struct ss_variant ss_a80_variant = {
 	.alg_cipher = { SS_ALG_AES, SS_ALG_DES, SS_ALG_3DES,
 	},
+	.alg_hash = { SS_ID_NOTSUPP, SS_ID_NOTSUPP, SS_ID_NOTSUPP, SS_ID_NOTSUPP,
+	},
 	.op_mode = { SS_OP_ECB, SS_OP_CBC,
 	},
 	.ss_clks = {
-- 
2.34.1

