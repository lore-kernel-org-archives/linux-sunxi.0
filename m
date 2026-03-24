Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2D2224AF2
	for <linux-sunxi@lists.linux.dev>; Tue, 24 Mar 2026 18:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774376882; cv=none; b=LVbF3mG45/8g0QaOP0cg080uhRDOVK6ZxtQwmAFv9i63eVg5YfA53CeH+AE9rPfwTmMMRSRgJ0cBigckKpjs/JMx0UrBhxmk6jAH/WTDeRq9U6u9SGJlvnoCKHGuhXZ58A7/3sD+2tJTuYHsJpahyRaqe17Gx7XwKJZFYrdb3xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774376882; c=relaxed/simple;
	bh=Og+ag9IkwKlXlRqp73B5hnPk+W9xiNL+UaCwuonyITY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dLXkgCCLAicXxuz16FkNMsO6UguvM7n8k/myIs2H2e57VpUSYibj8B+bL/3Yvel/mpUDUagFG/tXIWEJOET2xlJWxk7ymhIrHF/KShjTR1pHr4NiIukTbyX9/wYYA0T0tBbH5+51oy8/ipHp1kQMAS/0DjeqgeAyG9gFeyr1wE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V8j8hZEY; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V8j8hZEY"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-35b905a05a8so3382925a91.1
        for <linux-sunxi@lists.linux.dev>; Tue, 24 Mar 2026 11:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774376880; x=1774981680; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HHa+g9Yvknw/nsgWzBDeK9srp0wKwbZMTd0+ms6kC4c=;
        b=V8j8hZEYNlC4R+hsYqc6FeQjiDkinxOQ8TD4XGqaeYEYYdigKvhSIHu4DoMRQe3EIv
         eHxnhp4vF3Cji7QL1JNV2hlcwhshZfbo+HRgAuFM5g3Tk94kKbKaQlLf3X/3nlO7KQHR
         ywOu/DbTXeYKcvcRl9D3Wx0Fnk+l/DqCfKmGzOoVUukx7wo0HyMcwM/IpI4kZYfxz81s
         Q/GOTeaSaEkoN8m8tCK9zRQhzOUFDqSbevZzbYm2icreCv9LEDs1e41rXI50DV6pscFK
         9KGL92ZW2HYfxzCB42eJ4KbIAsMf69Yl/nVeoOK93WCXmhOpZM4R2GfsLOUHenAaKN8n
         7GNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774376880; x=1774981680;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HHa+g9Yvknw/nsgWzBDeK9srp0wKwbZMTd0+ms6kC4c=;
        b=GoCuotWBbMYa289xWPJLWugOGmZFexWIZ3SXqD2XoHmRgOwyNjHYWaSSubu+YUXJKA
         +CV0eZQ3y1c8JDcWVKvwGW+jbcoSUIjUnyzheNX8CUBKa4pgGsaLJCsuWysYpB63dHmo
         fIAJ2JbI5WzBFRsen6K27G1UVlcyi7moDvHmu/WlVuWBSBAVIej+lgqOk7oXbdvPPgyp
         2ueD/lzIMHTRR338b9WKmLATRQP/3uTTwS+R593oObsUBTWU1p5j/2/d/Auxmy6PD87u
         wo0Zy6LDrEEk8xG24HK8KVSqNx6WnfnHVUUgF4TaZbqCIOXBmBMY6IhV2CIO72hveaNC
         gkVg==
X-Forwarded-Encrypted: i=1; AJvYcCUAPxgpTtRb9GNm8+fKVps7E2GDtuV8+gJsTCSdvFfkuJ/UYEZlS9Nx0i5Iz/T/LfJBLDJ22WiFq5bjjg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxNHTT40ABoHEYSx3tjs6tzoe0bIBHsAOg8/d9pkHYrA+aCIsKt
	7GJ7SjStR6hFdAkS5QCMea/fTiYIWY7mo7u5jVuWg8+zZOs0Hl3+UKNp
X-Gm-Gg: ATEYQzzSx7OjYP48O58eyi8WC5p7T+zvWES3va3f4uqs7LdFBIpYz6gQ2CsF5v+cedV
	kpdcmVaSpZfolB9gLsqITAoO38BJI+OZ3hSQcN8Pq2R7pmEDiqO71q9cWhWPAY3UR/cBfmPKo8K
	++eYt5vURUlFIXpSUFxJp4/nm83lRgDMhip9eXfR24wqGGP7IYfJStWm5WBExc9ruugd5UEwVGb
	cf4XefT5QqcdIMX/as/BYppsT0M1Fi9g/TC5cjoJJSe6HCiyW9gMVmA4qumP7+IslQhu0VcgrcC
	UQd/5dqZbLCnfhlFh/Nd4f9TE6hAp3ABiRXNd7p1QawWFCeZYtxmbAtNY6VHUXEYOVcaR/ysu6N
	FMoKBDRVUa4PdRnnoh23wIodA2fALgObIBGN3jVAAL9mqxjr+WiIE9t/qypToDwPf307C9KQQon
	NxOTz8QbcvdTklCX4yO0dL4KSDCA==
X-Received: by 2002:a17:90b:4ec6:b0:35b:e551:90d2 with SMTP id 98e67ed59e1d1-35c0dd95828mr337562a91.28.1774376879990;
        Tue, 24 Mar 2026 11:27:59 -0700 (PDT)
Received: from [127.0.1.1] ([103.216.213.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c0d6060b5sm350576a91.17.2026.03.24.11.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 11:27:59 -0700 (PDT)
From: Atharv Dubey <atharvd440@gmail.com>
Date: Tue, 24 Mar 2026 23:56:53 +0530
Subject: [PATCH 05/10] i2c: stm32f4: Replace dev_err() with dev_err_probe()
 in probe function
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-deverr-v1-5-7e591cce33a3@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774376818; l=3441;
 i=atharvd440@gmail.com; s=20260314; h=from:subject:message-id;
 bh=fUyekU3vIj3XVF9IEZZuF8p06qRSr8GpHENT4b6dCL0=;
 b=Lv6diY6U8yOO+wFg03BiFqyP3QS+BUZjUWZZhiQKaL58Ge1g8J4dtHf+S+KQwwxbmw5DUKteO
 KpFdph3BhEcCYkTzwZIrFSEDvv+nlC32lTjIg5IZhXq8rp8u8lOOdaA
X-Developer-Key: i=atharvd440@gmail.com; a=ed25519;
 pk=T6i1xWOKT/RUSDYATSgyVG/4X7ac8jPjRSG1mMAcqVk=

From: Enrico Zanda <e.zanda1@gmail.com>

This simplifies the code while improving log.

Signed-off-by: Enrico Zanda <e.zanda1@gmail.com>
Signed-off-by: Atharv Dubey <atharvd440@gmail.com>
---
 drivers/i2c/busses/i2c-stm32f4.c | 53 ++++++++++++++++------------------------
 1 file changed, 21 insertions(+), 32 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f4.c b/drivers/i2c/busses/i2c-stm32f4.c
index b3d56d0aa9d0..44e8b04962bb 100644
--- a/drivers/i2c/busses/i2c-stm32f4.c
+++ b/drivers/i2c/busses/i2c-stm32f4.c
@@ -163,11 +163,9 @@ static int stm32f4_i2c_set_periph_clk_freq(struct stm32f4_i2c_dev *i2c_dev)
 		 * to hardware limitation
 		 */
 		if (freq < STM32F4_I2C_MIN_STANDARD_FREQ ||
-		    freq > STM32F4_I2C_MAX_FREQ) {
-			dev_err(i2c_dev->dev,
-				"bad parent clk freq for standard mode\n");
-			return -EINVAL;
-		}
+		    freq > STM32F4_I2C_MAX_FREQ)
+			return dev_err_probe(i2c_dev->dev, -EINVAL,
+					     "bad parent clk freq for standard mode\n");
 	} else {
 		/*
 		 * To be as close as possible to 400 kHz, the parent clk
@@ -175,11 +173,9 @@ static int stm32f4_i2c_set_periph_clk_freq(struct stm32f4_i2c_dev *i2c_dev)
 		 * maximum value of 46 MHz due to hardware limitation
 		 */
 		if (freq < STM32F4_I2C_MIN_FAST_FREQ ||
-		    freq > STM32F4_I2C_MAX_FREQ) {
-			dev_err(i2c_dev->dev,
-				"bad parent clk freq for fast mode\n");
-			return -EINVAL;
-		}
+		    freq > STM32F4_I2C_MAX_FREQ)
+			return dev_err_probe(i2c_dev->dev, -EINVAL,
+					     "bad parent clk freq for fast mode\n");
 	}
 
 	cr2 |= STM32F4_I2C_CR2_FREQ(freq);
@@ -772,22 +768,19 @@ static int stm32f4_i2c_probe(struct platform_device *pdev)
 		return PTR_ERR(i2c_dev->base);
 
 	irq_event = irq_of_parse_and_map(np, 0);
-	if (!irq_event) {
-		dev_err(&pdev->dev, "IRQ event missing or invalid\n");
-		return -EINVAL;
-	}
+	if (!irq_event)
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "IRQ event missing or invalid\n");
 
 	irq_error = irq_of_parse_and_map(np, 1);
-	if (!irq_error) {
-		dev_err(&pdev->dev, "IRQ error missing or invalid\n");
-		return -EINVAL;
-	}
+	if (!irq_error)
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "IRQ error missing or invalid\n");
 
 	i2c_dev->clk = devm_clk_get_enabled(&pdev->dev, NULL);
-	if (IS_ERR(i2c_dev->clk)) {
-		dev_err(&pdev->dev, "Failed to enable clock\n");
-		return PTR_ERR(i2c_dev->clk);
-	}
+	if (IS_ERR(i2c_dev->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i2c_dev->clk),
+				     "Failed to enable clock\n");
 
 	rst = devm_reset_control_get_exclusive(&pdev->dev, NULL);
 	if (IS_ERR(rst))
@@ -807,19 +800,15 @@ static int stm32f4_i2c_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(&pdev->dev, irq_event, stm32f4_i2c_isr_event, 0,
 			       pdev->name, i2c_dev);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to request irq event %i\n",
-			irq_event);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to request irq event %i\n", irq_event);
 
 	ret = devm_request_irq(&pdev->dev, irq_error, stm32f4_i2c_isr_error, 0,
 			       pdev->name, i2c_dev);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to request irq error %i\n",
-			irq_error);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to request irq error %i\n", irq_error);
 
 	ret = stm32f4_i2c_hw_config(i2c_dev);
 	if (ret)

-- 
2.43.0

