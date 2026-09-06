Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDDB3AA4F1
	for <linux-sunxi@lists.linux.dev>; Sun,  6 Sep 2026 15:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788710336; cv=none; b=bjdmgeINNKgbuPbi0zEWhMJR9p73EiSmA8mzJonItOj9uM63nGX0qYijSrATbB0/ijYFaP61S+dc3qPNJWWUm7OSlIsj2E+ci4x4+fiulQiVFVojLCSxRZTRcxStxeN4JWtkt1YNb3ktZv9zkA9FpuT2/R8DeiY3Gf4EnKpD+yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788710336; c=relaxed/simple;
	bh=Wt89mC38z1SB+RdqE6/iGje4kTh6KTtVF8QpLkUZBJ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PR37F7G95avZEaSTKeMCpVzpx2QYdwB4kH/dDxLGFGBdshyZq2Yw7VEJg9NUcOZ65S/I8sjpIUh2t9hWYXpzii1dEK+usULmRhhNMDC8scViQmcFh2RXDJCybyW93rcuN/IznoB/CRNj8WA/YuS72Zf7hJ14MPPWk73bMHXCQDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nbSdTGyp; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nbSdTGyp"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cf452def93so31646565ad.1
        for <linux-sunxi@lists.linux.dev>; Sun, 06 Sep 2026 08:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788710330; x=1789315130; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F0nEO3AVU8BdN0/yPVQNPwgB0D96TiBKB6Di1KmEt1I=;
        b=nbSdTGypt2KyNkAhBSf4mjUvM4SaarPBA6cx2bp/TUcRR6nMpwdBTp1qnK1oHZh81B
         r3nZAu4svXbigQ2ywtTJhj2M7OJS81tv0FMtDt2PXhiLSK+aB+hD6oO9rYc98mqpEGMs
         IxkGVgcGTYEQwGTi4J5BBIBJneDbKEIHoYqpa9u+FL584G4LTDKco04hkkMIuSGr2sd7
         TMrw46oIH0wz+7/D+7J9wIO7chycgVLTE4mzbqSwpWum4o0f996YA9EKbQRSFw3EKK8V
         P+3u3+dNRrHs7ePTxdFGR1VfasXvhOTb1KPUgWRYBh2L1MPgxSULd5AmMBY5LhWEz02x
         kN0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788710330; x=1789315130;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F0nEO3AVU8BdN0/yPVQNPwgB0D96TiBKB6Di1KmEt1I=;
        b=oU1gEqNLM8jvhaPFh7psAElLOubGgnPRuC3sNynA/TIca9QIjQuKbhNP430I8a7CmZ
         6fNB+8ZM2rGKc8Ta8/R56iRXGktll8Dff43d1pBYM5FRBsVcDZiT+Co8h0Fn4OGDErxc
         z2RjLbr8wshO7pinkcz0+TNUTeirZEggcqcs8+S6evLcTRA3QwQILpIoIPKbRzJZWnUx
         nk42q5pfCjREfvCBYf1pdXqOxIcBGDm4x1VeyinOA5s8r4QYkkFXWxjqzQFLDuKFpl+/
         UbZY6SqO3UxYXQy8RN4cxELXxnwe35J17x5FeOoH09xRwKjVPfJzeEw8aG669zipXy7u
         yx4w==
X-Forwarded-Encrypted: i=1; AKwUvBwk0u51qoCM9KZ631SEVx1QyndNNhaNjnHlUTuVTYNzJEofwK6A/4XpVVqwqUv8tjw54D4bNyxHVYF2Tw==@lists.linux.dev
X-Gm-Message-State: AFuF++mwRELtKJfugGEh/VLVEaEWsXGQqefgVr2wOTSCcZ6O+qYFxiLX
	UZcbP2roDRJ0FVaoNxHm6bN/XFcHmE/dU8jKipGGIfiDJVAFnQKKEBNN
X-Gm-Gg: AYBFou1mGAGw/Jp1dHDJDRaxyAJxMlPte1s/MwwQ7xu89qfUSCslS8wIOggpjQxOuJv
	jcWRc4A2E1KCfer8caFtQNM3SmDNZRqeBvG8Ih48rRJ7dNmVwUFqtO4qfRDeBmT4HYu0aFZskH3
	tYz4DW+b+5EV2yMMbVhLlaoj4yMeYe/R7Rf6FFETpY0/9gf6+Q36JkUjgqZ2IX39YNLcH9DONKv
	OYzvSjG8SQxo9uOSlWRiCNP6ahJJs/AHIoyRl+hEyrf56s5Fk1oIfd9EWlj2gFOY9BA83tPr0zO
	qImh2CtU9zCjH84lXYsoDsinpgfENgsqzvss20EKWV4y/dgG86yEYqbQCfDbM13MEoYg74AzsjZ
	Wj5bxGg3xuFPkpq8j9rT/glqRdB9rIemX3neHWWgkWlXxmTLZKmgbW/O+Nhms7Mo/5cD6c/vQ+z
	ZrGDahltnseb5FVU4gCjU4dRrcXf2lwowhwChRKwtxIHWaJJBQ0MglZIflWhyWIY2dxc9Dg72Za
	lDCZhVRq32WdGlcvQip0DeORIYpUBkvNOdzRqg9/9XbKjtCnzvd9JAQ
X-Received: by 2002:a17:90b:5484:b0:384:927f:3db9 with SMTP id 98e67ed59e1d1-39b27c0fa43mr13496195a91.1.1788710329826;
        Sun, 06 Sep 2026 08:58:49 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.166.246.74])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260f64ecsm15941401a91.8.2026.09.06.08.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 08:58:49 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sun, 06 Sep 2026 23:58:35 +0800
Subject: [PATCH 2/2] iio: adc: sun4i-gpadc-iio: clean up on thermal zone
 registration failure
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-gpadc-v1-2-92d3dc8ef355@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788710316; l=1124;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=Wt89mC38z1SB+RdqE6/iGje4kTh6KTtVF8QpLkUZBJ8=;
 b=oha1atVR2mqFYHAgjPpNIY23PNkzfXFXSgJrMheeJEnqaNoYl3svWtK+Ma/SC+uR/OUo2QZH3
 3h/DIP34cd5CTKVMzJcWpueUg07gLh1FmVc3T4LYCLOKHZWRSurCtUr
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

If devm_thermal_of_zone_register() fails, probe returns without
unregistering the IIO map array or disabling runtime PM.

Jump to err_map to release them.

Fixes: b0a242894f11 ("iio: adc: sun4i-gpadc-iio: register in the thermal after registering in pm")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/iio/adc/sun4i-gpadc-iio.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/adc/sun4i-gpadc-iio.c b/drivers/iio/adc/sun4i-gpadc-iio.c
index 85382e435f2a..ac5ba76b979e 100644
--- a/drivers/iio/adc/sun4i-gpadc-iio.c
+++ b/drivers/iio/adc/sun4i-gpadc-iio.c
@@ -638,10 +638,10 @@ static int sun4i_gpadc_probe(struct platform_device *pdev)
 		 * thermal because no thermal DT node is found.
 		 */
 		if (IS_ERR(info->tzd) && PTR_ERR(info->tzd) != -ENODEV) {
-			dev_err(&pdev->dev,
-				"could not register thermal sensor: %ld\n",
-				PTR_ERR(info->tzd));
-			return PTR_ERR(info->tzd);
+			ret = dev_err_probe(&pdev->dev,
+					    PTR_ERR(info->tzd),
+					    "could not register thermal sensor\n");
+			goto err_map;
 		}
 	}
 

-- 
2.53.0

