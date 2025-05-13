Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FDD1F4608
	for <linux-sunxi@lists.linux.dev>; Tue, 13 May 2025 20:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747168769; cv=none; b=dmdPyqJQpfHRl7tmhn+JSRYniIhAvNm1xHKb0PMPdKoPJqRRYYCOHQ8ufvG5VznSA+Qo22j64fgZMZyvXZdk5DNbWSc2jF7NJO0HaucZ/QLc5ztPOhRkSj/SRK9fjPTn3tft6qV/XMg6rYpeepst9H8BMFsD1lmsl6M5rjpr21E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747168769; c=relaxed/simple;
	bh=TJafEwdeqjrP6AcWhb1FzDP3OG9jHCSl2xxI4+oU+mY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lDt96QPbglFC3MzF1WBevDBEr8WopsyozT5dpTPNeS5nvPmQmJCGOIx0XEzBdpPjcX9EPEqztaeni6SCM8aM2llzXgqMF7Lsp3s+rSYUjP/Ksxib5qmoz8ciW/gq0hMR6+ukZwNjXXBlOxy5iYcCOISfMhmoLE3WRk/rHYRc7OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ZCjW3StS; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ZCjW3StS"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ad2452e877aso557271166b.3
        for <linux-sunxi@lists.linux.dev>; Tue, 13 May 2025 13:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747168763; x=1747773563; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=juaG+AmbI9q0dBfqd6nXXGHR850jBoYkaw6Nn2riiLQ=;
        b=ZCjW3StSWtdbKCKDqbzniM1ZusF0WN0/1yElejma5oCWkz+WBoTLWjUiKgoB/W7tc3
         6CXN+4i0iw3Ai4bc6yTtidctRfPhhdhFaQZfcusAXuiORxkpV847rWC2+D2sK4ma5+PQ
         c9TXNFT5taAOJpcsWuLqn4jMny1vaVylmdljZdx2mB8G2hagWI5YVYUntll5LNGMcL9u
         xjHJ3YB1OuuSy3cFIbkh8gqQukkzcteZem0WbIbKCkZxyRrl7fnfh4T1Uy4S2UyXK94e
         uKMZJZQbnwuh4T0DuwjeUH9AhZ2quKMgD2cU08Qn0C9GrcCZNjI1Z8fy0Qe49WZGWBn2
         AZVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747168763; x=1747773563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=juaG+AmbI9q0dBfqd6nXXGHR850jBoYkaw6Nn2riiLQ=;
        b=eufhH5QQxQvYcBsL7b5AowcCL0sqkBjZpOoLQNptR/M2tePPme6ublmO1FiXIiEDjF
         TMDjcipntA8bkPuvHTvjGYI4v2VVD2SYjl71XPJp4sWXg6lPCFHls0mMAbZRxR4IlAC2
         unX7xl8BrGmr8Y5VbZ4rYm5vYx/AbJfm4BiSDlZiuyFG1kLkcTsP4RlIaGc+yAbOx4WZ
         JfFwylTzZSRAmzorJiqfosqf7ikhfLiGAxP5ATiTuTveKQNZOwHiDkwIjgYfkrar4CXk
         7Zd4s8CdZiwNgrBnxqmLuzrjq+Ufy+H8zA+M7YANWaQpoAFeed+czr0SsuDqapDnVdd0
         J8eA==
X-Forwarded-Encrypted: i=1; AJvYcCWpUu4wW0qpfy8OjBbWwZx1mwUzczUyNPCVBOgCBTkWZb0j/vevlQJWJj97mBphoM7CxikrbAIbkMoESA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyWk56ekiT7cuCRKttCmRqHUvfQbmz+O/0CAUAZtpEoVOgTloQf
	U4QOqTv6BEDr0dvyOdtx/qMLp0qvvENlJAiRjiar2Bthm8leyN08nhFKNNoy6dc=
X-Gm-Gg: ASbGnctLGm30whAkdOpFa0Ax/oRINb9ePVWcTLt/33pwMnm5vAK6Jz/H9Hn04Vj1pDJ
	fJQgizyXl3HlrIcBZJ0/xgUVKel3LUHZO6MxtiGv1Pngb8hugbapgvpBrKlCqTFoKB7oMSa8gH6
	k6RamUrarzVB6h5le+CuTEsmSTBBkq0/ki/Z18fOg/dFnUInLgaC0NV9xhhubwrVLOpuXYKtimv
	UmRqfpeCokXlApKtA79P6Z8pSJCw8wmPS+qdMSHj8sKFcWYK7+jjDzBh3SrtRoXohyGOCer0pP+
	qjxXzf6HRIFgelxDRzBdFu1S9Wj/+cxND+Z23335m1WZeTtoANqlVfhx
X-Google-Smtp-Source: AGHT+IEWi0WXmXZATUkUPYXouuDIbFY4Wie5OHgl0qQme2z1Ey//pJl2AcKhRMhJ30qxF29lDPOGiA==
X-Received: by 2002:a17:907:7f93:b0:aca:d5a1:c324 with SMTP id a640c23a62f3a-ad4f6f2d088mr92332366b.0.1747168763600;
        Tue, 13 May 2025 13:39:23 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ad2417f2341sm558309166b.19.2025.05.13.13.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 13:39:22 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Chanwoo Choi <chanwoo@kernel.org>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v2] PM / devfreq: sun8i-a33-mbus: Simplify by using more devm functions
Date: Tue, 13 May 2025 22:39:02 +0200
Message-ID: <20250513203908.205060-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4304; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=TJafEwdeqjrP6AcWhb1FzDP3OG9jHCSl2xxI4+oU+mY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoI63sY58Twokv5DGNH6EVESTwuHi9qJrQuljDW 0TZ/o6436uJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaCOt7AAKCRCPgPtYfRL+ ThdmCACTnKilk91CPrcwCCc8E6w6Qkeu1s7JX1d7nbxmop8SKujh1EkNmq3VZsh6Jmr/lrNMsq0 TFJEt8AsI9PDKE8pgk/O0HnavuU+wFSXMqkXvfho7F/bZ3AH0YqB6FzcVQTq2SdjR/fdfYedDAN xq5za9VcjV9tJsNETgJBu4lk1F34qD5+EMsTcWU3zInCUMoiJjsvox/8DV/olg3mWnNDgbiZPbr 6FfbQaBKYIais3/ScGfPoThGaKJgqhNGJur1JjCHlG4tuO44gtIcd4lMg5gDiiuj+ox/6MqCxUy Q6n84JggAIId8OQOhKXPjNL9k8hlNKcF5kcVyRqNgrwaAkO/
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use devm allocators for enabling the bus clock and
clk_rate_exclusive_get(). This simplifies error handling and the remove
callback.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

On Wed, May 14, 2025 at 01:25:51AM +0900, Chanwoo Choi wrote in the
thread at
https://lore.kernel.org/linux-pm/CAGTfZH2uk-6-R5QNZwsssQ1UtnqexKeo=e=SsXB26NMwqf8c9g@mail.gmail.com:
> Instead of fix-up patch, I'd like you to send the v2 of patch[1].
> [1] https://patchwork.kernel.org/project/linux-pm/patch/20241111112237.336310-2-u.kleine-koenig@baylibre.com/

Ah, then I misunderstood. Here comes the requested v2. The changes since
(implicit) v1 are:

 - Fix the build failure that I introduced by forgetting to add the dev
   parameter to devm_clk_rate_exclusive_get(dev, priv->clk_mbus);

 - Added the Reviewed-by tag for Chen-Yu.

 - Actually compile tested. I would have sworn I did that for v1
   already, but that is proven to be a perjury now. Don't know how that
   slipped through.

Best regards and again sorry for the mess
Uwe

 drivers/devfreq/sun8i-a33-mbus.c | 38 ++++++++------------------------
 1 file changed, 9 insertions(+), 29 deletions(-)

diff --git a/drivers/devfreq/sun8i-a33-mbus.c b/drivers/devfreq/sun8i-a33-mbus.c
index 7c6ae91ede1f..4bd5657558d6 100644
--- a/drivers/devfreq/sun8i-a33-mbus.c
+++ b/drivers/devfreq/sun8i-a33-mbus.c
@@ -360,7 +360,7 @@ static int sun8i_a33_mbus_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->reg_mbus))
 		return PTR_ERR(priv->reg_mbus);
 
-	priv->clk_bus = devm_clk_get(dev, "bus");
+	priv->clk_bus = devm_clk_get_enabled(dev, "bus");
 	if (IS_ERR(priv->clk_bus))
 		return dev_err_probe(dev, PTR_ERR(priv->clk_bus),
 				     "failed to get bus clock\n");
@@ -375,24 +375,15 @@ static int sun8i_a33_mbus_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(priv->clk_mbus),
 				     "failed to get mbus clock\n");
 
-	ret = clk_prepare_enable(priv->clk_bus);
-	if (ret)
-		return dev_err_probe(dev, ret,
-				     "failed to enable bus clock\n");
-
 	/* Lock the DRAM clock rate to keep priv->nominal_bw in sync. */
-	ret = clk_rate_exclusive_get(priv->clk_dram);
-	if (ret) {
-		err = "failed to lock dram clock rate\n";
-		goto err_disable_bus;
-	}
+	ret = devm_clk_rate_exclusive_get(dev, priv->clk_dram);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to lock dram clock rate\n");
 
 	/* Lock the MBUS clock rate to keep MBUS_TMR_PERIOD in sync. */
-	ret = clk_rate_exclusive_get(priv->clk_mbus);
-	if (ret) {
-		err = "failed to lock mbus clock rate\n";
-		goto err_unlock_dram;
-	}
+	ret = devm_clk_rate_exclusive_get(dev, priv->clk_mbus);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to lock mbus clock rate\n");
 
 	priv->gov_data.upthreshold	= 10;
 	priv->gov_data.downdifferential	=  5;
@@ -405,10 +396,8 @@ static int sun8i_a33_mbus_probe(struct platform_device *pdev)
 	priv->profile.max_state		= max_state;
 
 	ret = devm_pm_opp_set_clkname(dev, "dram");
-	if (ret) {
-		err = "failed to add OPP table\n";
-		goto err_unlock_mbus;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to add OPP table\n");
 
 	base_freq = clk_get_rate(clk_get_parent(priv->clk_dram));
 	for (i = 0; i < max_state; ++i) {
@@ -448,12 +437,6 @@ static int sun8i_a33_mbus_probe(struct platform_device *pdev)
 
 err_remove_opps:
 	dev_pm_opp_remove_all_dynamic(dev);
-err_unlock_mbus:
-	clk_rate_exclusive_put(priv->clk_mbus);
-err_unlock_dram:
-	clk_rate_exclusive_put(priv->clk_dram);
-err_disable_bus:
-	clk_disable_unprepare(priv->clk_bus);
 
 	return dev_err_probe(dev, ret, err);
 }
@@ -472,9 +455,6 @@ static void sun8i_a33_mbus_remove(struct platform_device *pdev)
 		dev_warn(dev, "failed to restore DRAM frequency: %d\n", ret);
 
 	dev_pm_opp_remove_all_dynamic(dev);
-	clk_rate_exclusive_put(priv->clk_mbus);
-	clk_rate_exclusive_put(priv->clk_dram);
-	clk_disable_unprepare(priv->clk_bus);
 }
 
 static const struct sun8i_a33_mbus_variant sun50i_a64_mbus = {

base-commit: 92a09c47464d040866cf2b4cd052bc60555185fb
-- 
2.47.2

