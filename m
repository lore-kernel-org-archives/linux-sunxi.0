Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827401EEA2C
	for <linux-sunxi@lists.linux.dev>; Fri,  4 Apr 2025 11:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743767828; cv=none; b=VXEYRYgZ0v5lCbclVKAR6zQqvaUzweZQhxrBUFf/EVjCkwCpptt86Gcj0VVZ7Ta1vyWmJxQJ61RKYUFQ/CBAvfn+mVY9x4bOWOrZA7fEmrXYTgyE6rHrXlSB+emrmIPYqhMtkfv2EPNEdYJh361NfCW1uLip//bx47BMGSXrs5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743767828; c=relaxed/simple;
	bh=YI259iMximjELrxM/8u/Qw6/mJUi2mzFrILZsHdPMf0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FPZuhvbbdV16LZOoE8uh3PdVSr1SDymCJw8a8FevDinpbCQ8DussyQMKMMfYOwwud7L4tNSSeRJ4YMSa31ihCdrPk7l+YCnLLBfT7I9cQE7W1DrKcuYIHOM83RIcYofumTiYlO+yPgFz9kmv8JpmTU+iuLUIkN+wzDQyJ8cP+mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LxG20Yw5; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LxG20Yw5"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3912622c9c0so192215f8f.3
        for <linux-sunxi@lists.linux.dev>; Fri, 04 Apr 2025 04:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743767825; x=1744372625; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gxJBcAGGDyzbDLJAvfdPdyWxOOxD5U4tNFwB4IbsSu0=;
        b=LxG20Yw5vU65BrOAhrfpVIo7LWgEp7ValBdh1kBBhYaI5WrzICRzQq+lHLHpVZn3/Q
         Q6eizyikOu16rax/fWlWuTTsD3soR2A6KRVKlHc343O4DDGhCOMaLY0p/jtlCYoAYjCB
         ayjN9vM7JceBZHOllIgcvRGy9RQLIKs3c+uUtRAbs7APYFy5O+Ossyuqv9MwDN6Rn4X/
         syxPEGV0o+XS9lax6180RFs4aajFs8d4uut9r1mb0ZEGR4cj9DK30iA9agfrkGJ4dLxE
         jwH7LsfC0M3w0k1rAX1r8dyalsmKmiBrzP2oyq5pNU3cWynraP+Gxjqaoc3yLIZQLLWI
         gjIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743767825; x=1744372625;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gxJBcAGGDyzbDLJAvfdPdyWxOOxD5U4tNFwB4IbsSu0=;
        b=t6MOXyYuyYBw//R4avrJ/vzkNiqbUUDSlN89+m7ohp30LwADVLPDNsyqMROTPUtO45
         7H5aW1ZkykCeToA54ru8VLr9ps/F87G30tPdeD5RkC3SdrCwwRzosnhb2016wiUEQSLU
         XxfzK7SQVfSMs4FB/krnkdY2Gdfwo++N4pTO49Xy+BTW977eae3drMqMjhRBdxky+qgz
         pxC/kqASeQKaIug69sTmDjtXEyMl9alzSo3fDvIJ5mSDDHv8dUstfMbJ/Cv6ZTpmmiCE
         iwxbd2Ewl64AGxPKaSevBx88sz44QS9cHhu8qsyBtrRUELbH9ocjTejbulGb8S0EXt6i
         p/MQ==
X-Forwarded-Encrypted: i=1; AJvYcCVg2l8GESf6Z0E96bkpu14I74RULNndF1SUGo9fLq23Sne29KJcfN2ToplOtYLb1qwG9HfF84X7ztmppQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyyU15MAiwrpPoPJKsMfr1XC42RUkVHryZzovAjBgjry1ZMLlWy
	qcUfk4q7IwbxMSLtWd/GC4kjNbEkgvDtn0a+QL7V9JTdqZ2eHdb/R3BO4NEhR2E=
X-Gm-Gg: ASbGncsxAXpKHMQC0Ws9n7vTHRmCh2649xKKiOyQbrGwAVGGeXwVD22g51aIMfvtt9t
	s17MMr+sl9SuUySejHyWhrV/d9moOZURCgIjUkz/lOZCXzwhqxUMV2K4VG50PDZzLglULWGRXjd
	Y05QAOUFhSc+SEAeJy51/osSiaL+Jdc/NG6bBS7DOeSVYEioxHhtUmeW2c9WXDnHl/bBgH4N5z3
	whvgwURWFzeWNwtFknZRXYFWhQJVgCIl84mFFjOFbKUsOD3RUfc4ju2UMleTUbvA4FKsjnCXavL
	stPTLq64OhL5ryjT6y+GLmCowBRPlXrGW0nrgOw5z1nvpppsK3rYRbB9UIag8z3JoYR5TN5Ivg=
	=
X-Google-Smtp-Source: AGHT+IEbqWVdAZjF0/qLy/H0JxxfBZjOz1OHqDHaLpBpQad1gKc6l1hGJIvzr71knts2F+y5b2ubng==
X-Received: by 2002:a5d:64c7:0:b0:39c:1258:17d7 with SMTP id ffacd0b85a97d-39cba94bb2bmr852989f8f.16.1743767824815;
        Fri, 04 Apr 2025 04:57:04 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec364cb9asm43842815e9.31.2025.04.04.04.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 04:57:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 04 Apr 2025 13:56:59 +0200
Subject: [PATCH 3/5] clk: stm32: Do not enable by default during compile
 testing
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250404-kconfig-defaults-clk-v1-3-4d2df5603332@linaro.org>
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
drivers.  Restrict the default to ARCH also for individual driver, even
though its choice is not visible without selecting parent Kconfig
symbol, because otherwise selecting parent would select the child during
compile testing.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/stm32/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/stm32/Kconfig b/drivers/clk/stm32/Kconfig
index dca409d52652213cfbd8d5ecf1a339ea53ba5d52..4d2eb993ea0838d408ff5b1e5b6d028cbcaa9301 100644
--- a/drivers/clk/stm32/Kconfig
+++ b/drivers/clk/stm32/Kconfig
@@ -4,7 +4,7 @@
 menuconfig COMMON_CLK_STM32MP
 	bool "Clock support for common STM32MP clocks"
 	depends on ARCH_STM32 || COMPILE_TEST
-	default y
+	default ARCH_STM32
 	select RESET_CONTROLLER
 	help
 	  Support for STM32MP SoC family clocks.
@@ -14,21 +14,21 @@ if COMMON_CLK_STM32MP
 config COMMON_CLK_STM32MP135
 	bool "Clock driver for stm32mp13x clocks"
 	depends on ARM || COMPILE_TEST
-	default y
+	default ARCH_STM32
 	help
 	  Support for stm32mp13x SoC family clocks.
 
 config COMMON_CLK_STM32MP157
 	bool "Clock driver for stm32mp15x clocks"
 	depends on ARM || COMPILE_TEST
-	default y
+	default ARCH_STM32
 	help
 	  Support for stm32mp15x SoC family clocks.
 
 config COMMON_CLK_STM32MP257
 	bool "Clock driver for stm32mp25x clocks"
 	depends on ARM64 || COMPILE_TEST
-	default y
+	default ARCH_STM32
 	help
 	  Support for stm32mp25x SoC family clocks.
 

-- 
2.45.2

