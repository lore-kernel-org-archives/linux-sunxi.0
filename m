Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CDF3A381B
	for <linux-sunxi@lists.linux.dev>; Tue, 24 Mar 2026 18:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774376894; cv=none; b=EwR3O5mV+3vB4T9fQmNh3HT00uMtzApvhqaB0VOBdtgwlNbOwL1qo6RdM+HtuaWOOsF2mGEYv8yK66kTKbD8+jCZEt9Zf+d2Vmyqa0OeUz+FQbGEFDMGFKOAoOrjS4mnX2BWXhbtJW7iFCQGx1XxrfE+BrZDDbrPuRJ2moivYjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774376894; c=relaxed/simple;
	bh=iap5qBBPM9+z7GkIgQPTPNBQ4CZotIn48Ss9ISZDGxI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jwwqv+OlDbildmBgZwJlBbQ2cc2vABgXCA343uN2nItoO7KhndO2ki/eeH4qeh1EkHAN/z5NP+/P6Iq/sNWkEuUnSWXdJDpqqua/6tFAIjmINEGzS43qoKDMpVsqg88d/8vQ8esN3mC5JNYlHuaPq9phkS1jGv7EGEAgUnpGOZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lWB8/k8g; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lWB8/k8g"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c70c112cb61so990299a12.0
        for <linux-sunxi@lists.linux.dev>; Tue, 24 Mar 2026 11:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774376892; x=1774981692; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LOh7L59SGXDe0n/0/CxydhLmu3Ccl2K/OUt14k5rUoM=;
        b=lWB8/k8gAUAY5JNPMgew8WaCkNATMVUuDaiXItR/+u/Jzw56PK4U5qiz8kOjpTGA6c
         TiGUyHtWFfZRFfLvWB3G+e4Mfj2adYaXw6vg8gncL2JcWOGyAY/5/aaNuLKizDUB/B4M
         FWVgIXiCzNIohyJPVaFgm3NDju6exhXswS94QfuOF8wxRCWrwpSGu3iAwGVRNX5yZo3a
         sdokWx6l0672fCxnIkrvHlZw+Cd69j12iDiH/1BGaCcnaz00XI/TC2lQmpk4jju/sqRj
         ff8L7q2J7zErJy4jzxAjdhCFt+opZdNTZzDSygEGEMWFLSLht4g/YwPO/Rf60nM3Snc/
         lEFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774376892; x=1774981692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LOh7L59SGXDe0n/0/CxydhLmu3Ccl2K/OUt14k5rUoM=;
        b=lRVrPOjql5gDJZ8SZOS1YThR0YzbY06zbt+K+HaFFXYosqZeLZG/JKqyemCXB04dyq
         8ovET9VP4Gku03l9cWQBUEovWPuDmxL2UEYV8txNgp6TD+pwIJIQzu0iOSuBfV+ZaWwi
         K+wCvgRf6AsgvWHKfexEfZATYdLMeJmhtmmR1LR39W846ZN9kHJiSRsjFcCpr1V9gY5+
         H5cEPl9UB2v6dCZMfn79ykuuzLFsRdoL7y7mSUG+HJZxtBCgr94UICu9EZbD9hEOmIHl
         OXY9T4U6+LzNj4t8LUIUv1g0VEAFUMW9pAYNnzYPZzd9cYAkzEAe9r7Kcx7dQohQtv1+
         LJrw==
X-Forwarded-Encrypted: i=1; AJvYcCVHFJVgYfQeRAqZMrTK2TcadGCwjnH+7dWbBA+YWtWzqn6EfRlXOZKKjVziiHw9g2zNDgLP9eCMc7lctA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwNKNyrfAi82sM3STOztxrFrYET+jiyAXO8tKxG791OPCz6Qhtz
	wvr7KCbIWjMbVWmTEMD8nFIxzfMQUEQi1iuXXJahitH2TtoNqJ3BjlRn
X-Gm-Gg: ATEYQzyT/YbiADVLJnMLq6YL3yksEM9mGZM0IjkOeNTXcIJ2Qnr5y6+0U0kSg7xvuy2
	4060KuTliIhrqBzIT6A0wv8Pkl+hpEk91k30iG87CietUD2WqslwXYCHjHe20Sk9jJU4JRdqr4P
	5sBW+u6Au7GSD7rMv692yvrfG+aw9aBk+e2mxvA1od1AWlN3jilwzYZcin8vXu4aGBzT+OXH3CG
	KafPdiF4HveOh6lzmEA3pxFcMmRfDNh/dEGyZlcSEPIAC/39pT9L3iOx27kF0JGdEFJxmFiCuTA
	IybQKpw7Sv6LmKXxCj/rCgbfioTAHHLV6s/GekBIIbeQiD/G1Y+FeEbimEoV0nC/h0UBkxxnxwR
	jwORYklSmevyZLNsLbsaO6ezLrigUSTksxrNk4chjHCu+2V+zCz5Jh7b8XJbiAsqWKLmXqg7S5o
	k4lj2yinbq6kJF020jrR2TQmISyQ==
X-Received: by 2002:a17:90b:4a4f:b0:359:f22:8879 with SMTP id 98e67ed59e1d1-35c0ddb253amr350462a91.22.1774376892133;
        Tue, 24 Mar 2026 11:28:12 -0700 (PDT)
Received: from [127.0.1.1] ([103.216.213.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c0d6060b5sm350576a91.17.2026.03.24.11.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 11:28:11 -0700 (PDT)
From: Atharv Dubey <atharvd440@gmail.com>
Date: Tue, 24 Mar 2026 23:56:54 +0530
Subject: [PATCH 06/10] i2c: stm32: Replace dev_err() with dev_err_probe()
 in probe function
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-deverr-v1-6-7e591cce33a3@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774376818; l=1144;
 i=atharvd440@gmail.com; s=20260314; h=from:subject:message-id;
 bh=fGh6XbxSkvU5zsFALrHQqBdXVjE2X7LO7LjtYihQc1Q=;
 b=bSr5WSYN2sBbQ56eV/RU7Nsc30A+f8iif2b8KvF+i2QPU4oV/n2gxZwRlmFwYUL0Sn4WgwU3t
 BHbt5Op51GJBjc0aJ76ljbLTb0hDHykJdiMU+4SpjB/VkJQQUf6r5CT
X-Developer-Key: i=atharvd440@gmail.com; a=ed25519;
 pk=T6i1xWOKT/RUSDYATSgyVG/4X7ac8jPjRSG1mMAcqVk=

From: Enrico Zanda <e.zanda1@gmail.com>

This simplifies the code while improving log.

Signed-off-by: Enrico Zanda <e.zanda1@gmail.com>
Signed-off-by: Atharv Dubey <atharvd440@gmail.com>
---
 drivers/i2c/busses/i2c-stm32.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32.c b/drivers/i2c/busses/i2c-stm32.c
index becf8977979f..064e47d6c96f 100644
--- a/drivers/i2c/busses/i2c-stm32.c
+++ b/drivers/i2c/busses/i2c-stm32.c
@@ -39,7 +39,7 @@ struct stm32_i2c_dma *stm32_i2c_dma_request(struct device *dev,
 	dma_sconfig.direction = DMA_MEM_TO_DEV;
 	ret = dmaengine_slave_config(dma->chan_tx, &dma_sconfig);
 	if (ret < 0) {
-		dev_err(dev, "can't configure tx channel\n");
+		dev_err_probe(dev, ret, "can't configure tx channel\n");
 		goto fail_tx;
 	}
 
@@ -60,7 +60,7 @@ struct stm32_i2c_dma *stm32_i2c_dma_request(struct device *dev,
 	dma_sconfig.direction = DMA_DEV_TO_MEM;
 	ret = dmaengine_slave_config(dma->chan_rx, &dma_sconfig);
 	if (ret < 0) {
-		dev_err(dev, "can't configure rx channel\n");
+		dev_err_probe(dev, ret, "can't configure rx channel\n");
 		goto fail_rx;
 	}
 

-- 
2.43.0

