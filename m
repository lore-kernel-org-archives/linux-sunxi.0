Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F963A3825
	for <linux-sunxi@lists.linux.dev>; Tue, 24 Mar 2026 18:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774376907; cv=none; b=XOvqML5BwvJ+T2jKK7ydlkbTbuFixKBFqWykgZSlPP7vXlx+Z08eKnE6hBEMJG/jEogNiiYYeR/X46UD49pHvTu6r4YiX4uFhWAYRbcLQdh+frH2DsEafAy+LBmBTk8Yu2TXcmmhz6SxaeK43DtAl9FV8dUX/nThKSB46qq44Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774376907; c=relaxed/simple;
	bh=cDcTMwkXqvLZxNGPDMHwcK5wJhpj2l1qGF/0VyfBQEI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nqjGKfvfU/2wMN365TbJvU8AEY1Z2s+rQhfaO/+yIpNWoNqY8qewFv4nDNbDNbZ0J2RYvoJh0nzWxKOGLYR7nTCbgxOipUBEDo6M7l3QytxK9+laMObQVGkNNqfFTqFOoyeO5CMWh3M9MqvTilwn34y+y0KshuaZQAaU655/2pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cnmEz0ES; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cnmEz0ES"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-35a1d4a095bso113202a91.0
        for <linux-sunxi@lists.linux.dev>; Tue, 24 Mar 2026 11:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774376904; x=1774981704; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7jbYoDFFKwnOMKQiaSrjwW8IJ/VZkZBU3IOohjNwPSU=;
        b=cnmEz0ESYyRH5TqYJ2O9XTimgjgXweww0n1jqYluFZ9GCtWwoxrAN3Qrqyfw/rmT/5
         F9IbJUrE4zXp5psIAW687E3XI4OLW+tQuU0tVdTBtu8fg4/C8SlSMLu2dXVGqsiHwx67
         1p+0jnbuHdeHI4mE3PKzaQBkYW4CYBkPWgSlDgLheGGtTHNcFU04owqnqo1gQF9N7Lqn
         XhMIxo4P9aZecskaKeZjXMlknsalhDfWQADgj/jSB/gt7fcgL6yMVg+uCVlagUZ7OlVL
         HbkPtdlCMMOdGmzM69ER3CcromnRd99jMYrC28QE5wFy/so13E99gQTWx5UvIohlzY4q
         Qi2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774376904; x=1774981704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7jbYoDFFKwnOMKQiaSrjwW8IJ/VZkZBU3IOohjNwPSU=;
        b=Sn1NrdqXuJxQ35A6nRsKvGLH6hITCJCzDcYF3Y/qu02Tt1acyda2m6xfztY7K6GR6c
         ZftNwO9eCLJo2XBqaQQIKM4c2vVmV6Qa6cZmYo1yRardnNE0MIZMic68fCoWVVyFnCJ+
         9hmRSvMBo2O+2dTP/xkvKXSc3SGPwLISr0140WbbUHTbMiPJ+gJzMCIHJG+fKufyHunG
         1718iYyil7eYYxkqn5sK2dj1Nr+E5yMFQrACf5tAnRjoHykIyeiQndRFWVVChTq2ME0w
         9CyFyhqJlBvpNsW+zOoX3jm5jQbB6rMa1C14G+I7O44YpaCr5p8e4hhDOsn6IiejrcQn
         0juw==
X-Forwarded-Encrypted: i=1; AJvYcCXKJ342iNHGxDcY03CFL+p8h+v1E/29CRWhsFbeeBakm1MmPiG7Cm2UrZ29D4rCYtEU5wGDmxjN4QBBhQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzPFxCZ9Z0SXTZI0R6+GAO6BH1GYe9Pgm/mGrinpSXKFAfCIGre
	3L/+GvHd/+fezzMCf7jNsduVd8WLpI0JvdGtLXF73Ok51nUmt/OjJe4O
X-Gm-Gg: ATEYQzwNDIA02iI2HCCXRW/zkA7ao8UCV3x/cDqCuTV7Um+idvwI9JZHobxfsT/0qSq
	44SrhC6ou51rJ9pZj6zxKPr/wtS58/6KxPuwbpPDo0N1bffRxG4hEdRMLiO9GGfDjdDMf8fL64d
	nKd1NTZGhza/17A6WFNUUpNRujdEDjl/7h5/s+tRn59aOm9OGUDk2iW0K7rChCRIzuuxT19GUns
	HeljRoe+Y5Z855tc4wNXPIa7KI7C17xsVDlJMDBrzDKhpM3CK8o9mTTWtX9A1XPkVugWcrz5uSL
	UHHLYIl1hsGRUJ5vkFHA04urvft5DPjywWBlGP8aBkIrRKS9ENC6hPa1/sliolofilqB6p5igAf
	k+C/U1BBATfDzGoUdbowYFXlIKJ57BRs1lkl5qFllnwqw3EcL5pcyNcxRb9KSJV0NAnkCCU89jl
	dte0CIgMhfziO50Buhgcoc4H8ofw==
X-Received: by 2002:a17:90b:3c07:b0:35b:a0f0:8327 with SMTP id 98e67ed59e1d1-35c0d1001a9mr618620a91.2.1774376904310;
        Tue, 24 Mar 2026 11:28:24 -0700 (PDT)
Received: from [127.0.1.1] ([103.216.213.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c0d6060b5sm350576a91.17.2026.03.24.11.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 11:28:23 -0700 (PDT)
From: Atharv Dubey <atharvd440@gmail.com>
Date: Tue, 24 Mar 2026 23:56:55 +0530
Subject: [PATCH 07/10] i2c: st: Replace dev_err() with dev_err_probe() in
 probe function
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-deverr-v1-7-7e591cce33a3@gmail.com>
References: <20260324-deverr-v1-0-7e591cce33a3@gmail.com>
In-Reply-To: <20260324-deverr-v1-0-7e591cce33a3@gmail.com>
To: Till Harbaum <till@harbaum.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Laxman Dewangan <ldewangan@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Jean Delvare <jdelvare@suse.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
 Enrico Zanda <e.zanda1@gmail.com>, Atharv Dubey <atharvd440@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774376818; l=2664;
 i=atharvd440@gmail.com; s=20260314; h=from:subject:message-id;
 bh=QTq/SsBBXUdzBzLen+lO5rBpYhODcjwD4XTKabWXWjM=;
 b=6uYv7INtZBtXz/5CGPPLnmZfr7dOa2FHZwl9/oOHXGn01WGXqmOPkElSojC2emL6vTKD8y1gU
 mA1lXC4EoXKCgHD1s/6elwyP7MOynX9ePlEaoKUiP69Jyq2pL/sIZCs
X-Developer-Key: i=atharvd440@gmail.com; a=ed25519;
 pk=T6i1xWOKT/RUSDYATSgyVG/4X7ac8jPjRSG1mMAcqVk=

From: Enrico Zanda <e.zanda1@gmail.com>

This simplifies the code while improving log.

Signed-off-by: Enrico Zanda <e.zanda1@gmail.com>
Signed-off-by: Atharv Dubey <atharvd440@gmail.com>
---
 drivers/i2c/busses/i2c-st.c | 34 ++++++++++++++--------------------
 1 file changed, 14 insertions(+), 20 deletions(-)

diff --git a/drivers/i2c/busses/i2c-st.c b/drivers/i2c/busses/i2c-st.c
index 751ea421caaf..3f89c2145741 100644
--- a/drivers/i2c/busses/i2c-st.c
+++ b/drivers/i2c/busses/i2c-st.c
@@ -775,17 +775,15 @@ static int st_i2c_of_get_deglitch(struct device_node *np,
 
 	ret = of_property_read_u32(np, "st,i2c-min-scl-pulse-width-us",
 			&i2c_dev->scl_min_width_us);
-	if ((ret == -ENODATA) || (ret == -EOVERFLOW)) {
-		dev_err(i2c_dev->dev, "st,i2c-min-scl-pulse-width-us invalid\n");
-		return ret;
-	}
+	if ((ret == -ENODATA) || (ret == -EOVERFLOW))
+		return dev_err_probe(i2c_dev->dev, ret,
+				     "st,i2c-min-scl-pulse-width-us invalid\n");
 
 	ret = of_property_read_u32(np, "st,i2c-min-sda-pulse-width-us",
 			&i2c_dev->sda_min_width_us);
-	if ((ret == -ENODATA) || (ret == -EOVERFLOW)) {
-		dev_err(i2c_dev->dev, "st,i2c-min-sda-pulse-width-us invalid\n");
-		return ret;
-	}
+	if ((ret == -ENODATA) || (ret == -EOVERFLOW))
+		return dev_err_probe(i2c_dev->dev, ret,
+				     "st,i2c-min-sda-pulse-width-us invalid\n");
 
 	return 0;
 }
@@ -808,16 +806,13 @@ static int st_i2c_probe(struct platform_device *pdev)
 		return PTR_ERR(i2c_dev->base);
 
 	i2c_dev->irq = irq_of_parse_and_map(np, 0);
-	if (!i2c_dev->irq) {
-		dev_err(&pdev->dev, "IRQ missing or invalid\n");
-		return -EINVAL;
-	}
+	if (!i2c_dev->irq)
+		return dev_err_probe(&pdev->dev, -EINVAL, "IRQ missing or invalid\n");
 
 	i2c_dev->clk = of_clk_get_by_name(np, "ssc");
-	if (IS_ERR(i2c_dev->clk)) {
-		dev_err(&pdev->dev, "Unable to request clock\n");
-		return PTR_ERR(i2c_dev->clk);
-	}
+	if (IS_ERR(i2c_dev->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i2c_dev->clk),
+				     "Unable to request clock\n");
 
 	i2c_dev->mode = I2C_MODE_STANDARD;
 	ret = of_property_read_u32(np, "clock-frequency", &clk_rate);
@@ -829,10 +824,9 @@ static int st_i2c_probe(struct platform_device *pdev)
 	ret = devm_request_threaded_irq(&pdev->dev, i2c_dev->irq,
 			NULL, st_i2c_isr_thread,
 			IRQF_ONESHOT, pdev->name, i2c_dev);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to request irq %i\n", i2c_dev->irq);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to request irq %i\n", i2c_dev->irq);
 
 	pinctrl_pm_select_default_state(i2c_dev->dev);
 	/* In case idle state available, select it */

-- 
2.43.0

