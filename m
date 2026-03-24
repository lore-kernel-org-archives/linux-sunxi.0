Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429F72459EA
	for <linux-sunxi@lists.linux.dev>; Tue, 24 Mar 2026 18:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774376918; cv=none; b=hfCIN0Ridq6NYls4ywU1/bBzCL8Qry4sfATzUYY0SWIPZK+Oj2xDr+acmfyLYCCXS88L5zRO7ixGoqWzfnssXiWNPX/8DkavPSrivN8dH4gOMYvExa2+kaWvWlbGuDgZdod5M0/1r39J/XNMdGMuugsTC1eIgz6itMrBKUdsEoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774376918; c=relaxed/simple;
	bh=InYIOZ74uRoVGHRDFdN9ukawBsa/EDFlsLY4lGClCxs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IVGFmzJCvuraX+ILvY1RILu+2b/xJBWjWfwc1uB/zLmdUVNy1tqROTDnJaMDwncDb1F3KKOGdENm6peBvtdg9OWeujq2fi38CDge8IpXGHpxkh31aPfYboTv6LvKWvt4valeVj4Id+46rC7qLnYz01hPwiWxrlNoAnXT2w4UsdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XzEKxz/d; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XzEKxz/d"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-358e3cc5e7eso3159534a91.0
        for <linux-sunxi@lists.linux.dev>; Tue, 24 Mar 2026 11:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774376916; x=1774981716; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pWQFrxeJ9xbwYy1VhHH7N7bPolG8RRVJqSZfUbUVPdk=;
        b=XzEKxz/dSQSJVvDJEje5vMbbFhX6vtHeHokUkwNdbP65OwRG7iuo//4Zg3Fl5dB3Jc
         9TzPMf5fxB7pjMgc2kCnxmfh6aiymbjudelSl81qLWLEck9LVdjYa/nujWjq+Tl6TA4t
         5btMTI8pqdd/IWo14snakqSHIFT55hQwpFu02Np1ksghrrnxdsK+V+k8WzKDm5szVNdz
         xQUUzdDt+8IhToVZCV6QgB9MCxrJurjpBITj7i10N3MDatJ2VxVDkaYfuVxngXKa34V0
         +6py40zxIHH1f1UhpihvANV0zDAs/moJePyMLid4O9isNA26hqAlRMNtnL53+DeD3Pfc
         oebg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774376916; x=1774981716;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pWQFrxeJ9xbwYy1VhHH7N7bPolG8RRVJqSZfUbUVPdk=;
        b=Pf0gedTAgDTm4XmnCr/ZxwB9giyxlonXePl5mPd9Bf4enno1MfY2WvgwxeVegZ3s00
         aNcQjOlMC30aV+H7X9Dj5U3dWjrDsBtUxJ2F3fzoFrcTgWQK7K+ROwhotWOi4PgWFDAl
         isXawDeEtZH0gW12NtAPNMtgOROo8iDESU/j27YX/vAkEFP5m1nuoZfMpVR6gCyZ5zsN
         bkDmFatPZbmxUDwWRhVM6vSnquGNAwQw8B3y1OAN5JtTJR/r4QNjMH6M2xyeJzgDcd7M
         WWilwEcS5hpJYJPK9Yvpj/e9qQRqOJv61AHfn+Pc+i8aIdMN2ZIcIhYgCPIgZz7eU2/6
         7ygQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjPUDA3VCQN9+R4uvrDDNzeJEFRESPPqbFYnAm22SGwkCa2rHPPvVnTBqzSAZVKADirgxiKB097H3Skg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzN7O5lK4Xk8/imHF7M+ZW0SEdHSKHYRrSWLBS9xJG23Rm6f9JQ
	BsGQNJQIemmQA1SLnFn42xTWtStTKNz0twdh+l0ENa3J8qLpy2YOUrqX
X-Gm-Gg: ATEYQzw+StBmJKnGcdxb70nIjwHJZx/njL/uMHvq2S9wZUpuRM9q8U2O15htGHqtvGF
	Go0Rw5BGFMq9X8skwhoAFKVkA7UW7SDc1xiNwG2VScyHarj0ms1y+8Lb54CmHF42XTjwQ8rpHTd
	3zmuFQPZvh78/rnjFDO+j546SPqlFXJJzTFrqShRXpkFDIPjV/fZnVn0G+wuOWG1+lqyQd+/Ay/
	w9SuMZAQFe8mvozEpdMdHEJpRO92LM4ARPWqORF7X1aEruYHIG+ZMnP7rwJzoSiOQ8Qkbk8QQXh
	TGzSS+edUi0vvBp9EUT9uvSinNu31ni9z2MVhiVgW5fXZxfQk6C5AK1Tzkr4Zpl8ZZNVqJfQpWB
	Q5UmE+M2Kag2dCvcqmQ267oG5Sp7goUmJ1ORDrS1dueC+c9OewN+BVNxkCp7Uyr4gb+DDNQLLqu
	NNufAPoWcR/XC/0885VsHpTH53Mw==
X-Received: by 2002:a17:90b:17c8:b0:35b:e555:f19 with SMTP id 98e67ed59e1d1-35c0ddc5abamr302415a91.25.1774376915602;
        Tue, 24 Mar 2026 11:28:35 -0700 (PDT)
Received: from [127.0.1.1] ([103.216.213.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c0d6060b5sm350576a91.17.2026.03.24.11.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 11:28:35 -0700 (PDT)
From: Atharv Dubey <atharvd440@gmail.com>
Date: Tue, 24 Mar 2026 23:56:56 +0530
Subject: [PATCH 08/10] i2c: sprd: Replace dev_err() with dev_err_probe() in
 probe function
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-deverr-v1-8-7e591cce33a3@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774376818; l=1529;
 i=atharvd440@gmail.com; s=20260314; h=from:subject:message-id;
 bh=ASHKLgyhVdhgUS0PF+wcYp1muqF4w//oNCLBXZkcUHY=;
 b=hXROFYzb3OmT3cxRxEoFIuEeGuiZJd8xLM4x0yhyQx4WWK4SUYX6zSFRnwpUkd47L0bbPAvtp
 mE3F0pCOHTsA7C6xaX1n86n4DvW3PrzzB2RQAlr/W45yvtlvUvwnwXb
X-Developer-Key: i=atharvd440@gmail.com; a=ed25519;
 pk=T6i1xWOKT/RUSDYATSgyVG/4X7ac8jPjRSG1mMAcqVk=

From: Enrico Zanda <e.zanda1@gmail.com>

This simplifies the code while improving log.

Signed-off-by: Enrico Zanda <e.zanda1@gmail.com>
Signed-off-by: Atharv Dubey <atharvd440@gmail.com>
---
 drivers/i2c/busses/i2c-sprd.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sprd.c b/drivers/i2c/busses/i2c-sprd.c
index 1b490525d8dd..7b321a956fca 100644
--- a/drivers/i2c/busses/i2c-sprd.c
+++ b/drivers/i2c/busses/i2c-sprd.c
@@ -469,11 +469,10 @@ static int sprd_i2c_clk_init(struct sprd_i2c *i2c_dev)
 		i2c_dev->adap.nr, i2c_dev->src_clk);
 
 	i2c_dev->clk = devm_clk_get(i2c_dev->dev, "enable");
-	if (IS_ERR(i2c_dev->clk)) {
-		dev_err(i2c_dev->dev, "i2c%d can't get the enable clock\n",
-			i2c_dev->adap.nr);
-		return PTR_ERR(i2c_dev->clk);
-	}
+	if (IS_ERR(i2c_dev->clk))
+		return dev_err_probe(i2c_dev->dev, PTR_ERR(i2c_dev->clk),
+				     "i2c%d can't get the enable clock\n",
+				     i2c_dev->adap.nr);
 
 	return 0;
 }
@@ -548,13 +547,13 @@ static int sprd_i2c_probe(struct platform_device *pdev)
 		IRQF_NO_SUSPEND | IRQF_ONESHOT,
 		pdev->name, i2c_dev);
 	if (ret) {
-		dev_err(&pdev->dev, "failed to request irq %d\n", i2c_dev->irq);
+		dev_err_probe(&pdev->dev, ret, "failed to request irq %d\n", i2c_dev->irq);
 		goto err_rpm_put;
 	}
 
 	ret = i2c_add_numbered_adapter(&i2c_dev->adap);
 	if (ret) {
-		dev_err(&pdev->dev, "add adapter failed\n");
+		dev_err_probe(&pdev->dev, ret, "add adapter failed\n");
 		goto err_rpm_put;
 	}
 

-- 
2.43.0

