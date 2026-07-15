Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5773CEBA6
	for <linux-sunxi@lists.linux.dev>; Wed, 15 Jul 2026 09:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784109373; cv=none; b=bkz5T1biAW/qwKzU9KuIgYMXCxaqakL/0DfZe0rwb9MF64inSkCqzhkK4p7KGVtGxCp/QhPTd2cRLUaKJGwDJttiJ3u6B4Z++CQOLudsua2SnajxTgeBOPG17HTU0lb7CdQmqvjBdrufQ43cntUp70E2uvztZxXtn9b2WxHexyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784109373; c=relaxed/simple;
	bh=jXeHXz0sgTqbPCpgE0Ek4FYcDSoYTpRTfMU644+qSc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=liyyBVnoJpMjFv2U9LMQkAgKZOj5ZAyCU1L6Za/MbL6wJhJp4Yj7LThWmXrzjdz60s1iZG3WLqtWGKbGnFOs3qWQi6/WPj3Rdbm6Ut6ohHoG8TKmdQnNgT464SyK5hUI9lrasFtkTMoxjE73oVOOj1RwFeyj0lftW0/NdEvF0GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fd+AkR8k; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fd+AkR8k"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84a4d8fd6ecso1873047b3a.1
        for <linux-sunxi@lists.linux.dev>; Wed, 15 Jul 2026 02:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784109372; x=1784714172; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IG9ROgmPkgpOSWt5kVvQ2eBpCUOMrMqYLeguMnD/GAI=;
        b=Fd+AkR8kDFOYqv2LRsO5/ln7NYO4XhZIrx1EW3lu5nsKoAZJyc/R5MpFbWM+GvBwkw
         GEhrCd0jAJ79g9pKKQPPnO02OeVWXEk1roIWD8fkWWqU/TT43/2aznaEmt6+HgIuvjVK
         fmaNikhiR6rS/AiUu7J166nz2LuSGnbJH5YXy84e0gIsEH/GWRmrHuQo/ezxRfmxUGDK
         iUwwtR+Ok8eLUrB39fXHa1Hp2sX55gPT0UC2BKRoLaT57/rd5UdZUIAH/I6CiXfGv+lu
         9thz6dm02UwEVU4BBUyfvjtirqVHcRX3pCOTkXreYMJAdxR2DVup5Su8GeGqm+vnojyY
         6Lig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784109372; x=1784714172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IG9ROgmPkgpOSWt5kVvQ2eBpCUOMrMqYLeguMnD/GAI=;
        b=Slbw4hrxeVfcXBaw9P2A3n5mj1UFqlWw++/rh13QIcXF8RlOxVgvDmE6iHXrQK+D5J
         mKCbhM0ZR/ObG74z4qNK7VRj36PyFUKO7FEd6sbcWWTVr5We/H9TTLPzKt4fAynYO2vK
         7S1WRqRfTDWXuRSN+4ARg8LwDTm4ivMbsZgwmFGraBBtZZ3O+z7FJkXjQHUZb7JwwC+w
         aKKstS7luO1cqtLxx08/nlDM/shaY9vdJNuoNgtJs9Z4Utgglpa13/NGxC4ZX+iH1/1U
         0H0siTvmvFo0Hih92MuZ0A+0YIwissxqfLpqP7uylJTM2HJwMno57BRaOYMJUQU/X2z8
         TnYA==
X-Forwarded-Encrypted: i=1; AHgh+RqA4gSPfR5W8fMzKGTD/i7nG31dGV3XNRVlz7chOykV7i4c+HsnHOFoztcOSeJm/btRG+tWfd7nPj326Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4bsKy/s0vd1kIiWjlXuv6uhC+gACQalEgI5tUOVgJxWPApo7X
	shvRWVIyCK8fk7OemfNhKMvUTvQNubaqa17YQWWnHmdNcz8Lby+yWg7q
X-Gm-Gg: AfdE7cnzSMOfM+xxjB2R4zkaXJBwjpE+cckI/GAJJv8SX7p34JHKGVTrJAGFSEjybmc
	xNNC0yfwBlCWCVmfvP1CgzPZHx2PYmeBXGtcbyoZc9HnKJgHSSPvQ5lZdDKHkRmSPW83oe+CQaN
	Z2swv9X1kbruV7ElgXSIdWS69D5UxZM5c37EkuHc4kP4w3yk1GPqpPQAQOMjV+f57JQ3D+MMyRZ
	o9gIQpUXzdvxUG4fc/EgmiWOTtCqluKa2Y4j8Lgb6AyeQO0nDqMrTaOL/30gNcDoeS3ZUBQLyyv
	bzVzNVrfvCuzrSD46hY2zLKBndH92UMjGkgWu6Z8Y0coZ1Rda0WOszOTzeNAONwTVKhCFUBY6ox
	CJ7gLEaMRZE7a28/ZB3rSiduHyBZG3vq5UR9bXEBKyUM7t2LRMQehsARdPO7Zr7eHoHR6lpSm2y
	7Cv1OM5yFZFm1tvmc7Elp5WnhyoELGGoXxMWsJJ1VQWWmwkg8=
X-Received: by 2002:a05:6a00:10c9:b0:847:86b0:888c with SMTP id d2e1a72fcca58-84a6733bf25mr1897232b3a.48.1784109372039;
        Wed, 15 Jul 2026 02:56:12 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3643399sm11628908a12.22.2026.07.15.02.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 02:56:11 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Chen Ni <nichen@iscas.ac.cn>,
	Marcus Cooper <codekipper@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	u.kleine-koenig@baylibre.com,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 4/6] ASoC: sunxi: sun4i-spdif: Use dev_err_probe() for probe error handling
Date: Wed, 15 Jul 2026 16:55:23 +0700
Message-ID: <20260715095525.40668-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715095525.40668-1-phucduc.bui@gmail.com>
References: <20260715095525.40668-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Use dev_err_probe() for probe error handling to simplify the error paths
and handle -EPROBE_DEFER correctly.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/sunxi/sun4i-spdif.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
index c2ec19437cd7..d979bb00312f 100644
--- a/sound/soc/sunxi/sun4i-spdif.c
+++ b/sound/soc/sunxi/sun4i-spdif.c
@@ -684,26 +684,23 @@ static int sun4i_spdif_probe(struct platform_device *pdev)
 
 	host->regmap = devm_regmap_init_mmio(&pdev->dev, base,
 						&sun4i_spdif_regmap_config);
-	if (IS_ERR(host->regmap)) {
-		dev_err(&pdev->dev, "failed to initialise regmap.\n");
-		return PTR_ERR(host->regmap);
-	}
+	if (IS_ERR(host->regmap))
+		return dev_err_probe(&pdev->dev, PTR_ERR(host->regmap),
+				     "failed to initialise regmap.\n");
 
 	/* Clocks */
 	host->apb_clk = devm_clk_get(&pdev->dev, "apb");
-	if (IS_ERR(host->apb_clk)) {
-		dev_err(&pdev->dev, "failed to get a apb clock.\n");
-		return PTR_ERR(host->apb_clk);
-	}
+	if (IS_ERR(host->apb_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(host->apb_clk),
+				     "failed to get a apb clock.\n");
 
 	if (quirks->tx_clk_name)
 		tx_clk_name = quirks->tx_clk_name;
 	host->spdif_clk = devm_clk_get(&pdev->dev, tx_clk_name);
-	if (IS_ERR(host->spdif_clk)) {
-		dev_err(&pdev->dev, "failed to get the \"%s\" clock.\n",
-			tx_clk_name);
-		return PTR_ERR(host->spdif_clk);
-	}
+	if (IS_ERR(host->spdif_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(host->spdif_clk),
+				     "failed to get the \"%s\" clock.\n",
+				     tx_clk_name);
 
 	host->dma_params_tx.addr = res->start + quirks->reg_dac_txdata;
 	host->dma_params_tx.maxburst = 8;
-- 
2.43.0

