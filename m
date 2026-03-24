Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B883A16B0
	for <linux-sunxi@lists.linux.dev>; Tue, 24 Mar 2026 18:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774376853; cv=none; b=HkEsaLiJAhvtmCFnj93K8s8FEAJESoJvO9V/vtUtxNkNhPM6P7lwVKt3fZx1c4hfzyhVQE9xypZsQej4f29zczGrC/9Yg9X9/XaaknsGHGiaoL7AELOFA6S9aQdGmqHHmUagkBDqLlwsSxotBjmBeYpxqc3xUU9nVBV5aKGFAlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774376853; c=relaxed/simple;
	bh=+c/3pLSCjN8W96sioUUAyB3Q4h2iU9EyKqZsQlwSrmM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uIaRuCDmICXS8P1G5WmkAOmEjdozIeQHVX5tZXe/XUsgzkEO3om1aNrMoCT3yL30sz84gRcCf92pYtFlYSDsPjl0N7aPpUpsMzBGTBjm/beCE8+RyHr5LisVl9XXB5c/XJGUH4d1vArUXi19aZLtQpwj8Nwv6mA6pJtFxouYZoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lural8ap; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lural8ap"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-35b9fb3f57eso781267a91.2
        for <linux-sunxi@lists.linux.dev>; Tue, 24 Mar 2026 11:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774376852; x=1774981652; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Gsg2Xtdfdl+8IY6r0o/RyYDfTlBlRsSZJpA/oULFGs=;
        b=lural8ap04wP5P4y+S8kzlLGpC4m1dae8I02w1/1zIuhfJ9JPFsLVcN8ABTkrzDmhK
         Qp7WMFpoqag6BKI2gR47ZtcE+DQlpzgwppz5wo+WXtYW6Q8MsCv0sym6QfGtsxWFFxzH
         eXnpa+fxjKbJa9bwZO2HRHnskbwuMjSKN0hnBkxZHw6QvVxn9hmddONyebN9y8y3xb8y
         d167QymVHb1uIAB6m/qjYTaZxjLHnEPgCx7VXkYzm0DwvrpLT/1BqM+3DnWSCtqDYo5+
         Sd2TrsaWKq3dX5nyF887YqFjPISy04DrkrrnG827XdOzR6xO+i6bZ06MHUXjrOSjr2ld
         04VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774376852; x=1774981652;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9Gsg2Xtdfdl+8IY6r0o/RyYDfTlBlRsSZJpA/oULFGs=;
        b=apsy+SH5SQ3NjSLhx+wHwOwHaDzfK1eOXJkKNYYfDnhErSAIcLF8k5XC4Iz67I0mye
         JqUcqie07IGeoY4jxnmODPbEsG/kgi3H/WSLzMZo/ss9XEDnMHBmjYzfaXJn1L4Fh34/
         bqCY8GpRo+76VcxYi/WGdVwHoCHwwrX1LcCwolgdPsFYIOrCuJQbxdrxJKtlYYCPrmXz
         bIQTsOM6xRv7MnSWG1T2LSqcqSewIZzmk3qpRyngVLnlPGA4ErJRRcPobU4MbL56FS+D
         6c0wn8akc0lVxB2djHBLHGLWnC5546dccbqMJpRDXNuT2zHWMFYTr39ZNWndEKTsOgyH
         Fo/A==
X-Forwarded-Encrypted: i=1; AJvYcCWKmIfElhdTLjfa3Ojmexn5ARiu3qDZ0o0mruODtsBfEiZhvAMe/W1tN9+rQobfNDC9vPeQHhCf3lzCEA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxr8/t+NUFvgseTRTkGv6aYwfr783leUPM+rQj8B0FfxRN5Y23l
	SClPBYDj5pBTSuJ64WPqAKHdljCCxy9dbZQDMcq9tQLR13kx2k0p+sx5
X-Gm-Gg: ATEYQzxMKs/q+hKlVWn+aI9CLAj5tTWyr9nDYnC2kFqQtT+xPEuUb2lwy6YfsTwDipF
	u7pQJW/KPpfKIt0OcR8F9O97ytGTvI+fjexq2yN3vCmZ95EXtE6mXA/F9OLvs2Z8povabLBMEao
	m7ehIo3HmMv89tOvekWySbIay1rOtUGRY7FbulcP6c3l5w0zCjxJxTNAgLR4eSJRBcT5HBD1awk
	WArxLXfI/ZHKHq5VnCLDlnO6FRYP9jgybQeP+nedMqh1RvO9v282yK07PctJW0LPUGPHl5Ydybh
	sQW24FK/TKvkq6+p0T/KXv/5gxuL8hzQJmDizzsAjqZBRP9UQVi8QXhxXeUwv9QacPP+WbvIgox
	yPc5uNjbCG+XrJcs3JA8V71ybu2NLb1+pAmURcFEZ70Q0xedqe+IcLV7wUvB+H5rUfyllXeAOwD
	6oJTg8jjLr0yd87X77z82bWLtifSnJ51oLuuXr
X-Received: by 2002:a17:90b:17c8:b0:35b:e591:99d1 with SMTP id 98e67ed59e1d1-35c0ddc4118mr351953a91.29.1774376851910;
        Tue, 24 Mar 2026 11:27:31 -0700 (PDT)
Received: from [127.0.1.1] ([103.216.213.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c0d6060b5sm350576a91.17.2026.03.24.11.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 11:27:31 -0700 (PDT)
From: Atharv Dubey <atharvd440@gmail.com>
Date: Tue, 24 Mar 2026 23:56:50 +0530
Subject: [PATCH 02/10] i2c: tegra: Replace dev_err() with dev_err_probe()
 in probe function
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-deverr-v1-2-7e591cce33a3@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774376818; l=1910;
 i=atharvd440@gmail.com; s=20260314; h=from:subject:message-id;
 bh=T//TFybKN0iS3J929ONSQMLq+NVtMUv+4U4PajSEtpE=;
 b=fr2E/ILXide+l6/sGLPzjFEjto2BGT6qqnz9x0FPbuW7SDMBkCcBooGAF0nF3tgg5wQpoDzh0
 nAnDJBBoQYcAomrkw15oBfCFd8unXKN1lYuv+oiXhwJuhidayGEmEVJ
X-Developer-Key: i=atharvd440@gmail.com; a=ed25519;
 pk=T6i1xWOKT/RUSDYATSgyVG/4X7ac8jPjRSG1mMAcqVk=

From: Enrico Zanda <e.zanda1@gmail.com>

This simplifies the code while improving log.

Signed-off-by: Enrico Zanda <e.zanda1@gmail.com>
Signed-off-by: Atharv Dubey <atharvd440@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index bec619b9af4e..51d15fca82fc 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -575,8 +575,8 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 	dma_buf = dma_alloc_coherent(i2c_dev->dma_dev, i2c_dev->dma_buf_size,
 				     &dma_phys, GFP_KERNEL | __GFP_NOWARN);
 	if (!dma_buf) {
-		dev_err(i2c_dev->dev, "failed to allocate DMA buffer\n");
-		err = -ENOMEM;
+		err = dev_err_probe(i2c_dev->dev, -ENOMEM,
+				    "failed to allocate DMA buffer\n");
 		goto err_out;
 	}
 
@@ -588,8 +588,8 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 err_out:
 	tegra_i2c_release_dma(i2c_dev);
 	if (err != -EPROBE_DEFER) {
-		dev_err(i2c_dev->dev, "cannot use DMA: %d\n", err);
-		dev_err(i2c_dev->dev, "falling back to PIO\n");
+		dev_err_probe(i2c_dev->dev, err,
+			      "cannot use DMA, falling back to PIO\n");
 		return 0;
 	}
 
@@ -1953,7 +1953,7 @@ static int tegra_i2c_init_clocks(struct tegra_i2c_dev *i2c_dev)
 
 	err = clk_enable(i2c_dev->div_clk);
 	if (err) {
-		dev_err(i2c_dev->dev, "failed to enable div-clk: %d\n", err);
+		dev_err_probe(i2c_dev->dev, err, "failed to enable div-clk\n");
 		goto unprepare_clocks;
 	}
 
@@ -1979,7 +1979,7 @@ static int tegra_i2c_init_hardware(struct tegra_i2c_dev *i2c_dev)
 
 	ret = pm_runtime_get_sync(i2c_dev->dev);
 	if (ret < 0)
-		dev_err(i2c_dev->dev, "runtime resume failed: %d\n", ret);
+		dev_err_probe(i2c_dev->dev, ret, "runtime resume failed\n");
 	else
 		ret = tegra_i2c_init(i2c_dev);
 

-- 
2.43.0

