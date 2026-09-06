Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC95A3AA1BD
	for <linux-sunxi@lists.linux.dev>; Sun,  6 Sep 2026 15:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788710332; cv=none; b=ZdsVCHRlQErGUV6Tn45yfb5junrQ3oSObj8zDGs/+thQYw25XM3zkBF2L3Ne5OeRLBGKMJFcmL+nI8O81IQG8+f62AZQWh0Q7nppbdDa5dy/iqaaVej3xRTT7yyWQz6f7++mlFl5sdxl4CKC0JGxUj1PXkZCxRo3m+QuilytXn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788710332; c=relaxed/simple;
	bh=c57ka5j8TQHkpX5FZRHB8vFerQ2Ws0Z0sbVGbrtSoUw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KbQY9/loxYAnBU3GkohNSEt5TGDP2ndisUq8bfAPo4Hkwyd2goaCu8RAxs4qh000Sz7NssrIUaw/DFybCkdJJrKX7s6cBdfcHSWJWO3rKOWVmXJ7YhI6yqbfcYil0KOjHL9GCZzjuxWkI0MHkVlbXIh6Y7bHLejHEkC9fB5+5Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DJEuCEsM; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DJEuCEsM"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-398a5aad413so1941606a91.3
        for <linux-sunxi@lists.linux.dev>; Sun, 06 Sep 2026 08:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788710326; x=1789315126; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ViofCTK8v1s13H6Q1s8S3TeyG55pxUNWw4j4G5OCidI=;
        b=DJEuCEsMg+dzojJEhpJYocWlYouBifcRpNqIcyxW8U82DhvIMsQWg3w3W5LczJ0Y0a
         QU3yBcEEJn5opu4Co3Da+vQsinzikgScwoq2EHYMy0qSqzdvR973kn0YK0Fk7+OWrWiN
         qPXMW9oREFCMfKAvALT/3RR4Hsu0VP/xTwbR3PTVAcmw1upYjP2ZFC1M8VaSynCkp9Ui
         JlPezKm6INTEECt1Y07F8h3lrBVGMDo+YTu64n941DIjoOuSWLOHzBxIfzJWC1Q3VPBQ
         Ri0h8fbFB8Pccagm+15k8MzJPnLYKeahAm5GdRV4AgcU2BMs6XrzPOvOOJuTa9wf0fmj
         HGxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788710326; x=1789315126;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ViofCTK8v1s13H6Q1s8S3TeyG55pxUNWw4j4G5OCidI=;
        b=d5uoZiC9SbavqwNl8PJO0pVO7HGuI6XDTN7Pquqsz0zQEjQ72qsq3+ufRg2GVSR0Z4
         M7vdjwYkCGaQvqLyaBl6LSaki6Eauji7Ol73J7s2w6PLZDFk+MrhZ45x9IZ5ctPT1KN1
         ci/zh9CClDlYUQh97uR2rdzeU4f6pbEOwO18nNxVmeF8PUw31n8nbYwZuBczi3B+i6rC
         SDT/Hj/KYkAimS76b+o5oMdbP3J+UAlU2eLNCWRmJE2S69EqSk8v/W9UA2N/Gpu9QQfO
         v4L06o0rf0nSkKet/s+Gsi4We3aOzAL9KyULEcYOGS6HqgcRrqfSLO+6EX/zMwC4KYrc
         8pvA==
X-Forwarded-Encrypted: i=1; AKwUvBw6EaAjf4g4AUsMVm0k/9mAfsn8rk4rnH6cM9As1Ez3aSXzsnWINkJltacyvtedM7x3GZP7mVlKdqHj+w==@lists.linux.dev
X-Gm-Message-State: AFuF++ldWI5M6IfsHmsz56eP7M04zpSfLHuNbzgqBgziwbInQ1EzJYK4
	DKc2aq3y+rya7RjLsjaZTDZgZw2qEV8yklGKTULaCTGkGnip25RsQsD5
X-Gm-Gg: AYBFou3WpYjC4dr9+LiuOzIg5H2NeNe50drG3aQSAb2g6rEo3lbwWE+ZbfRKN/xcwOn
	fw6ojlyOeHESyindl6VrfYrtx2Wy86jrv5+sfdrVFoIU+SsRY0va5Tk2lZNqina0BK7lnjrqSLT
	xEviG4go/Rk9L8YLDHoCypPgiboPl79qYMPlpJV3nMBmHq3U7o8skGplUO44rYxrTHn//LPEYaL
	rbzBSV0bmYIITdeeUQvNRWwHmWOu3hLe00SI2fATsw5FQGsn+Uu1Xk4Cx6oEZ2JAzcBwwhEJUKp
	mtN4L9/jUr3TdfVmNMfVHvfwY8fpS1HGlonx8J256BufcjbnKTcnY6IvR6Z1TkEkKc9/GqWvZWq
	2BX4uPHHX0dnQ5XlF90n/k3XDeVPcrM2K17Wg4Dw82kIqQvZiGUmhgxr2uKBCOtnbQXJmJDUmtg
	RBUo7TA9mUHDUvwuzCosN+D+nTUCOETsFLJ0hNWeCRLXn0OLmKQt8dNaFY+5RbsO9nTpnVlEJ3w
	VKiYBGm7oAFiFYBVc97X9dp7yo0MPdK/FkMmE1LP51UN7vVw0i9DTjIrztggClHCoc=
X-Received: by 2002:a17:90b:3852:b0:38e:9ef9:eb97 with SMTP id 98e67ed59e1d1-39b26272d69mr27665796a91.16.1788710325448;
        Sun, 06 Sep 2026 08:58:45 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.166.246.74])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260f64ecsm15941401a91.8.2026.09.06.08.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 08:58:45 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sun, 06 Sep 2026 23:58:34 +0800
Subject: [PATCH 1/2] iio: adc: sun4i-gpadc-iio: drop underflowing
 pm_runtime_put() calls
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-gpadc-v1-1-92d3dc8ef355@gmail.com>
References: <20260906-gpadc-v1-0-92d3dc8ef355@gmail.com>
In-Reply-To: <20260906-gpadc-v1-0-92d3dc8ef355@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Quentin Schulz <quentin.schulz@free-electrons.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>, Jonathan Cameron <jic23@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788710316; l=1267;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=c57ka5j8TQHkpX5FZRHB8vFerQ2Ws0Z0sbVGbrtSoUw=;
 b=RK5suJBjW/7xSEGUZXgfUBlPW2TReDkIU+aOrloVKr3mhcpiAxpWmhUE7ZU8jgfIYEVZ2MO7Z
 ioAF8OyoqLhARn7gFPEsWticTsfzL14FepGKSvjltcW7wOLyhMyhCXH
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

Neither the error path in sun4i_gpadc_probe() nor sun4i_gpadc_remove()
ever holds a runtime PM usage count. So the pm_runtime_put() in both
places always triggers the "Runtime PM usage count underflow!" warning
on every failed probe and every unbind.

Drop both calls.

Fixes: d1caa9905538 ("iio: adc: add support for Allwinner SoCs ADC")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/iio/adc/sun4i-gpadc-iio.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/iio/adc/sun4i-gpadc-iio.c b/drivers/iio/adc/sun4i-gpadc-iio.c
index 203459ca9907..85382e435f2a 100644
--- a/drivers/iio/adc/sun4i-gpadc-iio.c
+++ b/drivers/iio/adc/sun4i-gpadc-iio.c
@@ -657,7 +657,6 @@ static int sun4i_gpadc_probe(struct platform_device *pdev)
 	if (!info->no_irq && IS_ENABLED(CONFIG_THERMAL_OF))
 		iio_map_array_unregister(indio_dev);
 
-	pm_runtime_put(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 
 	return ret;
@@ -668,7 +667,6 @@ static void sun4i_gpadc_remove(struct platform_device *pdev)
 	struct iio_dev *indio_dev = platform_get_drvdata(pdev);
 	struct sun4i_gpadc_iio *info = iio_priv(indio_dev);
 
-	pm_runtime_put(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 
 	if (!IS_ENABLED(CONFIG_THERMAL_OF))

-- 
2.53.0

