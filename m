Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE73C1F4723
	for <linux-sunxi@lists.linux.dev>; Fri,  4 Apr 2025 11:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743767832; cv=none; b=HUMB8FqWRtAAHO30S5Ns4PKkWJDOEDR3kIEc5+0vw0X7NIM8vJ4RqtS2BIulQpmt03wKiOcMY7zoUJ9C5J3HHBhbpZnEA5ug64uryNMYYcjVszTY8Cqgh5rSKsiDXYeEtTeIe0tm4OjSHzHxQZpU3PmM8NnwetMK7EpJB9KA+Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743767832; c=relaxed/simple;
	bh=bQj/x/W9Ry/V3hdmp39LWSNOcVVmkCtarcvTt5OTXVM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LLdZFV7LWhL+9IsFBk4uiM7zlHiStutYOT7Pbi1fcowqhAI4rr9RCBSV57IgnaL2HLJc3LnGbJZEp6THnoz4no1ooRYDOOvJsvAGcRmibHrLuHijqeXTcNJ8BzMCIe3cRlaqXxwLDhYfEcztgPCQMs1OJOlp9hMdogogLaVATQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EM15KxlH; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EM15KxlH"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cee550af2so1880925e9.1
        for <linux-sunxi@lists.linux.dev>; Fri, 04 Apr 2025 04:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743767829; x=1744372629; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d106TqNSzkY12ISczNEwfjZ5zhpWhqK85bfmJ3moKtE=;
        b=EM15KxlHOut5Ddl63TPgXC6cA5xrGTyWBkjHC/3fuZAkT6cU1hh1ATG8AqkUUJ7b0P
         OcYrIVuDKTwxPdw3bJYrnDchunIW87PjX8Rb7JRvj+aXGsooDe213Oq5kbfWDLVrbu4u
         4gOlb8OQX9py8750a2EurXLUwkdLqataTqoMvybmSQtChpGngk9s/0W0TPSiV0Q6Bh7M
         3/oSp4qk7ifs7SaCoCyI5wHN7G6l+4ghOdOkHzRpSXyK7K5iHGOQyKVzC6C0bYTM1KK7
         qs2/PsCB1vXAyE2RANbv1R2n/KRf+G6i1qWXsgPD0+HAIGJck+8I40ojhHg+FpAR1+PH
         j2Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743767829; x=1744372629;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d106TqNSzkY12ISczNEwfjZ5zhpWhqK85bfmJ3moKtE=;
        b=qaK1UDL6EaEB4fXn7pYtn9RAIhIyae5MrF5tlTDBoLzM8UTZUW1VetUiyJQhqxEkPg
         x3PTImG50Y/r3ec+S6/58NVxRGLJ52CqYa8BMvPmGgvPRZB5rfaH37mkLOwBLL0Vg0js
         wUVV6KDp/NYJ+YOrxNyKzZjDEQTYAxDhcmITIjfVX2FRWrcWdz7SvmmMq3l3ZxAs8yvn
         snbqIFgeCYLZQGKR1TUBY4J5I31iraWozf4/QwPOQWZcLIHkQMFxQU3gIbKa8MUpF/mW
         Jk78GtWcxHrZAoF1peCZE6oIF+QRGYkj//kKb5u4KLKNsRG6OXHR4JzdpEywERDNgs8g
         IRtQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1fITA43b3lCxn3jZnnqeFNzIqYFYOIs1eOJCxIjNTkkMr/pX0ekd/5so9MLe5ZXebgzotRRwsDf4R1A==@lists.linux.dev
X-Gm-Message-State: AOJu0YysDpIXFYRwox31rOnKaUMojME1prSr9p8Yexj6lng6QJnU7yGZ
	owlrqFp7UE77O589V1gOBRzLyBIUcIp+88XipZD2mzvVRnSPUs2YgCqqPLEPr5U=
X-Gm-Gg: ASbGncvPvPaWkdtiKMiD63nOJpB6PoO2BILOzrObCP3CBaSd6fnLjgZIDM5ipoS1gRe
	aai8LlTUXYp3uJyz/3+XpFhpRK3I3NGcYc4pvClnS+3KhWRcTGOqfzjJC0QxOfjfx69gL0/Wjpd
	B+KZSspDdtgfJa0u5YDg/nqao9tcpfWeB8kYIcouvOAgq0KYMiGhnbRjmoD3vPdoK1lB4kdwdis
	WuA+clskyRaaHUjFgOnk4t831H0fnUxczYlkzdMlOOggB5P0hShrdOZMYw97I3vjdAjw0Xycqz2
	XxQZ/AdNZ/Jp/ckMwk4gPrBmHdkS3lsO7l9AVGxs/LeO6AInrC3saTpRH1uP8rk=
X-Google-Smtp-Source: AGHT+IFUn3Ncq3UJFAd17WQ9Pi1CnRMlttoznJGCzpSMvyRtLW9B9mLaVZY4lCtohUQhqeiWfvicpw==
X-Received: by 2002:a05:600c:3592:b0:439:9ec5:dfa with SMTP id 5b1f17b1804b1-43ecfa18f83mr8121025e9.7.1743767829072;
        Fri, 04 Apr 2025 04:57:09 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec364cb9asm43842815e9.31.2025.04.04.04.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 04:57:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 04 Apr 2025 13:57:01 +0200
Subject: [PATCH 5/5] clk: sunxi: Do not enable by default during compile
 testing
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250404-kconfig-defaults-clk-v1-5-4d2df5603332@linaro.org>
References: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
In-Reply-To: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 =?utf-8?q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

Enabling the compile test should not cause automatic enabling of all
drivers.  Restrict the default to ARCH also for individual drivers, even
though their choice is not visible without selecting parent Kconfig
symbol, because otherwise selecting parent would select the child during
compile testing.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/sunxi/Kconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/sunxi/Kconfig b/drivers/clk/sunxi/Kconfig
index 1c4e543366ddb76c1669b577c1ac337dc1be616f..5e2f92bfe4120981ab68b175dce798ac8b3268b0 100644
--- a/drivers/clk/sunxi/Kconfig
+++ b/drivers/clk/sunxi/Kconfig
@@ -2,13 +2,13 @@
 menuconfig CLK_SUNXI
 	bool "Legacy clock support for Allwinner SoCs"
 	depends on (ARM && ARCH_SUNXI) || COMPILE_TEST
-	default y
+	default (ARM && ARCH_SUNXI)
 
 if CLK_SUNXI
 
 config CLK_SUNXI_CLOCKS
 	bool "Legacy clock drivers"
-	default y
+	default ARCH_SUNXI
 	help
 	  Legacy clock drivers being used on older (A10, A13, A20,
 	  A23, A31, A80) SoCs. These drivers are kept around for
@@ -19,14 +19,14 @@ config CLK_SUNXI_CLOCKS
 
 config CLK_SUNXI_PRCM_SUN6I
 	bool "Legacy A31 PRCM driver"
-	default y
+	default ARCH_SUNXI
 	help
 	  Legacy clock driver for the A31 PRCM clocks. Those are
 	  usually needed for the PMIC communication, mostly.
 
 config CLK_SUNXI_PRCM_SUN8I
 	bool "Legacy sun8i PRCM driver"
-	default y
+	default ARCH_SUNXI
 	help
 	  Legacy clock driver for the sun8i family PRCM clocks.
 	  Those are usually needed for the PMIC communication,
@@ -34,7 +34,7 @@ config CLK_SUNXI_PRCM_SUN8I
 
 config CLK_SUNXI_PRCM_SUN9I
 	bool "Legacy A80 PRCM driver"
-	default y
+	default ARCH_SUNXI
 	help
 	  Legacy clock driver for the A80 PRCM clocks. Those are
 	  usually needed for the PMIC communication, mostly.

-- 
2.45.2

