Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB6545013
	for <linux-sunxi@lists.linux.dev>; Sat, 30 Mar 2024 21:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711833000; cv=none; b=GXqr+AGPvZMbg3vaycQx/9tEt/2NU3MgMj3qIJjDe5WwsvB+iWpdppCbERVhmj7LgNMjajNJNf1uOumS786wl6zw6rw0VVN4piTi4UvlewNxARf1iAT+zT39C0zc2B4KHPMDRs3wobqusi1a0suboxAsKUabWRHwzmcFgBem9/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711833000; c=relaxed/simple;
	bh=jpeN1Yqiy86IASrMw5IJ3mejJAeGCwK9WF/sWpjQR4Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=M9m6TGFNR5aOHZVKzB2COxCrCd1MzK7Oz1A1MLHmTM0SHcDb69Lyn06uecCOr6cpjQY5+ZPC4m26vWrKUuyTSH0lCrzOkQi+ipObkV4CZ5lJ64RqB8lqtoO2S7Zqz1ff4b2gg6olVhlPBoPHtfiLJ7kH4BCM4uiFB2rJsCbZct8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xyofQGr2; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xyofQGr2"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-41551500a7eso9261065e9.2
        for <linux-sunxi@lists.linux.dev>; Sat, 30 Mar 2024 14:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711832997; x=1712437797; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lFZ6AvemSHHbcptkzhx+Eo5vulQUyGFEmtEeYrKTAdw=;
        b=xyofQGr22ZQ1Y2QTUnX7KCKEJNpn2pvmnVH3Wyj7PoTSg9glfPc8fHRfXupIUGBPWQ
         w23v1Mn1v/JXGROeHserwB/ofsv/732q71AJQHUmMHz0PP02kL19dtQaIZxSiJEQ6fsP
         FTBr1TJJEnNNvQX6l1FGWuyhQlZIyPd9+9gehmXSuNyMIzw1FlkF2bGHpHUY0acy51f4
         Tul6panr/lclbw6ly47z4F4t6Enmo3imI0f1esgbAUUb17HLpEcp1XWDoIV+GKf4v0ED
         VJTcRYocmGlZXqpmCiiMyiozcbQti8ukav8BiT9vehFycLB83XG/2KkNJDAlu+/zupEm
         kLsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711832997; x=1712437797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lFZ6AvemSHHbcptkzhx+Eo5vulQUyGFEmtEeYrKTAdw=;
        b=aUv8my0jkr9QfpiTdKSctDRXqEE9JUtIrNaBwoL31QY+rgHy4V2E8yTRflM66JPJin
         79rQC/PpvvTlVjJkqvknBEyy3QEZyu+kl5oGvoFdCTh96EisoPw8FtVUVG0UYV0MjbYr
         5lepaliNwgVdI3d31AYAMgUeQF3bfcqhgAYATLGSl0j1486UP9lgfwjOqHVpEYZUuSCl
         WxxBqiCw2MbI+L/ZxRUwinusROgBmpyTDJ6TgZWeMio8xnKAjdJkIa5R2XGDt43VC3c0
         9cQmx7CCBUz7+GknlKh7quM2qh41IAi9Ltr/4xZPHHf4qw36WidDAWYvrcEJdPyn7VE+
         EGng==
X-Forwarded-Encrypted: i=1; AJvYcCXWj9QH0QxwRDJfHih/ghsegzLeojqNf6fTYIlPQ2Zimvz1924Hn+w+an8ZuWmOLpPrnzze3Rur4h6X6Xkhfn7JiDWSFDare+LL2cw=
X-Gm-Message-State: AOJu0Yyzlvx/K+2N0okVzGFPwmwwu12rtJ0zapIUptl8fi+5wKBXa5LI
	MFIuJsguxr1M998UwLG/vQffgKXdCI/Azbn5Bh6OX2IrLdJZ1qrMW6HvpoMOI0M=
X-Google-Smtp-Source: AGHT+IGdfuyJzSIxSkkcrfLi5TlHT2+g+ykSm6cJanYYnEITTKeGYlCFJjitdO5Wziu0DGC7W0P2jw==
X-Received: by 2002:a05:600c:5114:b0:414:1eb:301a with SMTP id o20-20020a05600c511400b0041401eb301amr3461429wms.28.1711832997494;
        Sat, 30 Mar 2024 14:09:57 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id je4-20020a05600c1f8400b0041496734318sm11500465wmb.24.2024.03.30.14.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Mar 2024 14:09:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] pinctrl: sunxi: sun9i-a80-r: drop driver owner assignment
Date: Sat, 30 Mar 2024 22:09:54 +0100
Message-Id: <20240330210954.100842-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Core in platform_driver_register() already sets the .owner, so driver
does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/sunxi/pinctrl-sun9i-a80-r.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun9i-a80-r.c b/drivers/pinctrl/sunxi/pinctrl-sun9i-a80-r.c
index 919b6a20af83..5b4822f77d2a 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun9i-a80-r.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun9i-a80-r.c
@@ -169,7 +169,6 @@ static struct platform_driver sun9i_a80_r_pinctrl_driver = {
 	.probe	= sun9i_a80_r_pinctrl_probe,
 	.driver	= {
 		.name		= "sun9i-a80-r-pinctrl",
-		.owner		= THIS_MODULE,
 		.of_match_table	= sun9i_a80_r_pinctrl_match,
 	},
 };
-- 
2.34.1

