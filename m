Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FC63212
	for <linux-sunxi@lists.linux.dev>; Mon,  2 May 2022 20:19:48 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id r1-20020a1c2b01000000b00394398c5d51so202943wmr.2
        for <linux-sunxi@lists.linux.dev>; Mon, 02 May 2022 13:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DxgERR4MmEJr2YW3s3P/BTJupqeCTylb9pEXfQax4lw=;
        b=y9aRNEd7zfN2JS9mk38MoQlzNlf7DQYJ5H03RA2P1GjLrY+bMQrVDZkhNC383mN+zT
         80rh7dcGxxGIUB++LJRqL0jb+jY4nZff7/fY02nRyfO5oB8OSMr+o4ykZXRjekjyAF8+
         T1U2FjDRoLxZ1z+75wjzDI5T3KAzMRBmB2x/m4Us6cjx0Tvf5eCZ4IqtXxWVF9b5RSqD
         rCM9CRC9eqasS4CpdR66cpm9oLNQImV7bauGRudAuN/wcs+jN9cFVqf7yIakgx3eH5V6
         YoEGFx6iDE5OvN+zdNhTIYLS9ByTLIMlg9ntHejUhIEuZOkK1Z1qT8oQ8N/BzQ1lzR+6
         Aj+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DxgERR4MmEJr2YW3s3P/BTJupqeCTylb9pEXfQax4lw=;
        b=bVuPgtM/xwmyMf8kO47iPp+Rch0ooWQrPLUMyL6njzaown5BDIYCzbi57PNuHMGDQX
         ALqfbDPn2QQxj+BSiHReydpx/UfkHsEbiAbkFf65R8i6YfW2n4L6zY7GlpEo6BgUhJaa
         rDuUGcGMaCYxDWPuUEF7ndKoIbv9pjFguktOGbL97hSPAoYCIcr0GBve6Z2aT+9CRchr
         MD/eKmv2XJhWi00J+/69XHDCMQdKLmrrmjooJnMmwR50eNIigG5wZjlYsILQfTewxP2w
         J0M062Ar2cqT/6ya2tvHRYxbcjrwLv8QQ7kkpXmRszqoLnql6IPZiHwznhK1E+L3dWsr
         RfdA==
X-Gm-Message-State: AOAM532hil2kcmaKT6YKLh5MUqpyXIZCxMDNJnN3ilcgoU+5wGXAqDAB
	tA1upZwcAFKVx9IPsoR5JErMZg==
X-Google-Smtp-Source: ABdhPJwMx9QV+PjMyJ+evDOGZaUh+NusKzcSVINsVKDEeNYscfPWigPgNhrv8jmZYMZdbX1V2lUw2Q==
X-Received: by 2002:a05:600c:1e1d:b0:394:2183:e75c with SMTP id ay29-20020a05600c1e1d00b003942183e75cmr554373wmb.203.1651522787180;
        Mon, 02 May 2022 13:19:47 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id l2-20020adfb102000000b0020c547f75easm7238183wra.101.2022.05.02.13.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 13:19:46 -0700 (PDT)
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
Subject: [PATCH v2 07/19] crypto: sun8i-ss: test error before assigning
Date: Mon,  2 May 2022 20:19:17 +0000
Message-Id: <20220502201929.843194-8-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220502201929.843194-1-clabbe@baylibre.com>
References: <20220502201929.843194-1-clabbe@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The first thing we should do after dma_map_single() is to test the
result.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
index eaa0bbaf5581..49e2e947b36b 100644
--- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
@@ -420,15 +420,15 @@ int sun8i_ss_hash_run(struct crypto_engine *engine, void *breq)
 	}
 
 	addr_pad = dma_map_single(ss->dev, pad, j * 4, DMA_TO_DEVICE);
-	rctx->t_src[i].addr = addr_pad;
-	rctx->t_src[i].len = j;
-	rctx->t_dst[i].addr = addr_res;
-	rctx->t_dst[i].len = digestsize / 4;
 	if (dma_mapping_error(ss->dev, addr_pad)) {
 		dev_err(ss->dev, "DMA error on padding SG\n");
 		err = -EINVAL;
 		goto theend;
 	}
+	rctx->t_src[i].addr = addr_pad;
+	rctx->t_src[i].len = j;
+	rctx->t_dst[i].addr = addr_res;
+	rctx->t_dst[i].len = digestsize / 4;
 
 	err = sun8i_ss_run_hash_task(ss, rctx, crypto_tfm_alg_name(areq->base.tfm));
 
-- 
2.35.1

