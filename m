Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83AE3A381C
	for <linux-sunxi@lists.linux.dev>; Tue, 24 Mar 2026 18:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774376864; cv=none; b=JV0F1K162QsFUSBjs5952erzupzZjJFL+TCd2ARqzIFaFCg7vWdU9sUHn+csbR00VWPksJeZWLw0OdrfaHnf+9+t0v8eUQJ3eIcS5VQqqW2ikM3TQEZeH1eA22SrgpnRuebIXiriAqNG2gU14iOFxFu7WUHTa9u+JN1ChxhASfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774376864; c=relaxed/simple;
	bh=Gi4d0M5a+5Q4+n74Mmna9wNg+TAzJTOOC5zaGKNgvh0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bx5oLbupNY1OOVz0w6OLh9NO/WQTwsm2hLNkI48hZzH7hDRo+sYyUiRIGZVxvAARcMZzkGWH3O3UREWsoKEozsxdc+bwMXBTrpc7PRDy7jbejcHf6ZjnLn6eNZRhQUNtBaUxYpUWIIPBrNrX4g2sUUkbFYUGEoHa5FzVSElD9IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IJqcb0Gc; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IJqcb0Gc"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-35b95e21ccaso84321a91.0
        for <linux-sunxi@lists.linux.dev>; Tue, 24 Mar 2026 11:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774376861; x=1774981661; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=alJwQhTp7nkw0Ib79edmwantLXplbDvUqq4BVXNADKE=;
        b=IJqcb0Gcp3tHbwFUT52oLR9c1l7kJL076j7j3M4wYgtqF0TlpHA/pwNkUioO/UAhlx
         byRgEe73Zo0evykvMUoCkTF9yBJT3GZc3Ju7xm/+bHZEawRr/w41oXHsGxvqc6o77Ocp
         qS1uWcdmTQ/wiTJTKr+XCRXQdhbOVqRJWUDDJQ9+p+Wp/6+PxUwtHtCLd+CkasHDxcyk
         +q794D8C2AkRMtojT2d2WhSEF16GPkissWjobCN8Gn78/jkrtogq3q2kuJ/iwWsQ3RAU
         U08rj2CBqBjfFXpRqXN6BMBwkO8JTa7jklfAr+Q/lR2xiFrtvcE7tnxqZmM+ds8g3If2
         juTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774376861; x=1774981661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=alJwQhTp7nkw0Ib79edmwantLXplbDvUqq4BVXNADKE=;
        b=gAX/kVIt5BqKnUmweR/8fRiwT1+xUfGG+pI+iEAB/iluaTchLjUcbVYE+vVCb64li7
         IwSR25vtixVY7B1UWR969l+Mmo8p6bQx3lezBQt67evIuTP7V20hiWJBIktAi1MObvf7
         youX3u6T4n8aTaqborV7Ok0VLrVaAaui66p3oPbpy52ymT1MpVQ3q3c/D7vnn2PWQoYo
         HVsyHZ2gbbaZyV169wS7KlsoDdDlOdsZYft/Wd9SfzV8FQ2AT8+orUw+QkCmFFKCfbrX
         s87U+Z4uPZvAKSbB5IGFOeQAdF8UlrDEkAjYjl6QJ8hA17Z5w1/OKaSoxFU4UeitqBk2
         P4DA==
X-Forwarded-Encrypted: i=1; AJvYcCXG3uyN49Juf4cEJCtnpSNqATqv/tJPe4YHZLsR6kEgem7Pb7uM8XC2i+VahtribHmbJONVdFmm/ZA2uQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0uoukMIFKnygnF+rOtJf0FzGQy6ZtxbwI5DBsYjdWReoMmVKF
	oYn2I+snNOkyGx7wWz7JHny43HySXonlluUhcOS3nkPDH6TnxvA/QXIL
X-Gm-Gg: ATEYQzwHI9wqYR5g6P26++mqEJjS54SzNAwpKK5JhvHnJQWeT0hFdfSNcz7bss9b87m
	vbAr/pJ6DCrYjofjvdZ47zOJGqcCtrd25jvjdW3uTnMZ8vqKxwQe1OnUVWWwH51j09x4FR+psfo
	/9nSWc/VLOn7IdoMyCMNZWpNVo+Oi0QSaV/JdZt7Fx7IieKjPrAYythL/w1OpPufsjpoy2ZE2oI
	bO6dHrHMIEPG9dA6VHrZX4Oa01TDFBI4SOaITrGOf21JvisXOMNuhc75LXD6sOp+YuFdJaUP22F
	f8L1hYrIWx5GXNo/axGK424afbggRTJWFucO/4LIqxcSSv0WYgIKUG8mip/vLfsqU3qkzG948JW
	yhHLFSWdfmLLOOUUE37x/pSH3Zs/PXPqbmTroTpmxd/vF9jtmcwCnB2Ue+NFcO72UtbnS5Jqg9F
	QWbZR7GVboIY0FDkkj4FDfcnkQqw==
X-Received: by 2002:a17:90b:57c4:b0:35b:9703:7664 with SMTP id 98e67ed59e1d1-35c008d38f1mr4197956a91.10.1774376860812;
        Tue, 24 Mar 2026 11:27:40 -0700 (PDT)
Received: from [127.0.1.1] ([103.216.213.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c0d6060b5sm350576a91.17.2026.03.24.11.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 11:27:40 -0700 (PDT)
From: Atharv Dubey <atharvd440@gmail.com>
Date: Tue, 24 Mar 2026 23:56:51 +0530
Subject: [PATCH 03/10] i2c: sun6i-p2wi: Replace dev_err() with
 dev_err_probe() in probe function
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-deverr-v1-3-7e591cce33a3@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774376818; l=3450;
 i=atharvd440@gmail.com; s=20260314; h=from:subject:message-id;
 bh=mGoeA4RoMr6oMafJS8Wz9uEiYGmdoZGvaadkVl07Ac4=;
 b=mqDXFTn7P7YKfYZq5yfTqBReywbYSNkXTrDiQ10Gxn0U4N3AcD22e4px2/bKmxQtkFRLFhMV5
 D6Rwa2VObbECiZHEiSRVGIVnkT5nDLR0wDkwvKuXdMmJb12BQQQ/qlI
X-Developer-Key: i=atharvd440@gmail.com; a=ed25519;
 pk=T6i1xWOKT/RUSDYATSgyVG/4X7ac8jPjRSG1mMAcqVk=

From: Enrico Zanda <e.zanda1@gmail.com>

This simplifies the code while improving log.

Signed-off-by: Enrico Zanda <e.zanda1@gmail.com>
Signed-off-by: Atharv Dubey <atharvd440@gmail.com>
---
 drivers/i2c/busses/i2c-sun6i-p2wi.c | 55 ++++++++++++++-----------------------
 1 file changed, 20 insertions(+), 35 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sun6i-p2wi.c b/drivers/i2c/busses/i2c-sun6i-p2wi.c
index fb5280b8cf7f..dffbe776a195 100644
--- a/drivers/i2c/busses/i2c-sun6i-p2wi.c
+++ b/drivers/i2c/busses/i2c-sun6i-p2wi.c
@@ -194,22 +194,16 @@ static int p2wi_probe(struct platform_device *pdev)
 	int ret;
 
 	of_property_read_u32(np, "clock-frequency", &clk_freq);
-	if (clk_freq > P2WI_MAX_FREQ) {
-		dev_err(dev,
-			"required clock-frequency (%u Hz) is too high (max = 6MHz)",
-			clk_freq);
-		return -EINVAL;
-	}
+	if (clk_freq > P2WI_MAX_FREQ)
+		return dev_err_probe(dev, -EINVAL,
+				     "required clock-frequency (%u Hz) is too high (max = 6MHz)",
+				     clk_freq);
 
-	if (clk_freq == 0) {
-		dev_err(dev, "clock-frequency is set to 0 in DT\n");
-		return -EINVAL;
-	}
+	if (clk_freq == 0)
+		return dev_err_probe(dev, -EINVAL, "clock-frequency is set to 0 in DT\n");
 
-	if (of_get_child_count(np) > 1) {
-		dev_err(dev, "P2WI only supports one target device\n");
-		return -EINVAL;
-	}
+	if (of_get_child_count(np) > 1)
+		return dev_err_probe(dev, -EINVAL, "P2WI only supports one target device\n");
 
 	p2wi = devm_kzalloc(dev, sizeof(struct p2wi), GFP_KERNEL);
 	if (!p2wi)
@@ -226,11 +220,9 @@ static int p2wi_probe(struct platform_device *pdev)
 	childnp = of_get_next_available_child(np, NULL);
 	if (childnp) {
 		ret = of_property_read_u32(childnp, "reg", &target_addr);
-		if (ret) {
-			dev_err(dev, "invalid target address on node %pOF\n",
-				childnp);
-			return -EINVAL;
-		}
+		if (ret)
+			return dev_err_probe(dev, -EINVAL,
+					     "invalid target address on node %pOF\n", childnp);
 
 		p2wi->target_addr = target_addr;
 	}
@@ -245,26 +237,20 @@ static int p2wi_probe(struct platform_device *pdev)
 		return irq;
 
 	p2wi->clk = devm_clk_get_enabled(dev, NULL);
-	if (IS_ERR(p2wi->clk)) {
-		ret = PTR_ERR(p2wi->clk);
-		dev_err(dev, "failed to enable clk: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(p2wi->clk))
+		return dev_err_probe(dev, PTR_ERR(p2wi->clk),
+				     "failed to enable clk\n");
 
 	parent_clk_freq = clk_get_rate(p2wi->clk);
 
 	p2wi->rstc = devm_reset_control_get_exclusive(dev, NULL);
-	if (IS_ERR(p2wi->rstc)) {
-		dev_err(dev, "failed to retrieve reset controller: %pe\n",
-			p2wi->rstc);
-		return PTR_ERR(p2wi->rstc);
-	}
+	if (IS_ERR(p2wi->rstc))
+		return dev_err_probe(dev, PTR_ERR(p2wi->rstc),
+				     "failed to retrieve reset controller\n");
 
 	ret = reset_control_deassert(p2wi->rstc);
-	if (ret) {
-		dev_err(dev, "failed to deassert reset line: %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to deassert reset line\n");
 
 	init_completion(&p2wi->complete);
 	p2wi->adapter.dev.parent = dev;
@@ -276,8 +262,7 @@ static int p2wi_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, irq, p2wi_interrupt, 0, pdev->name, p2wi);
 	if (ret) {
-		dev_err(dev, "can't register interrupt handler irq%d: %d\n",
-			irq, ret);
+		dev_err_probe(dev, ret, "can't register interrupt handler irq%d\n", irq);
 		goto err_reset_assert;
 	}
 

-- 
2.43.0

