Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CA31F461C
	for <linux-sunxi@lists.linux.dev>; Fri,  4 Apr 2025 11:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743767831; cv=none; b=AhoYyHb4CeqL/9kyIe34TUc7QUn1MWgVK4EVERmMJtgL6l0YhUL/O33aPUrjb9EVBQFRWkwyNGMNude+CK/nnGDwIlT4Z8J5LdH/LnIqIYZJtfFP9A2rqYO9+Zt10Xu3MpJRoPyJkj432cVPJ5hm9r1s79xx50EPHLizSlPzDKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743767831; c=relaxed/simple;
	bh=uxxC2+rJC3Z2VSNCxxoKI1uj53Ey55YFQVhXgUJlMmI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bw3JHn3bDUPs1emL0OYpxHU1GmJWEPbnRRS+48krJ8/FwoUlZiw923hEpFOB3oS3vYxGLWhiBoyblGaRVMntm7U6NpQNO/219YDNzIP/1Rq6juqQWY0QSE8/K2drnzQrZenHj8Gy9R9gSsZ2DLYj90itQEC/o3U0BBngEPjisVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bah9svhQ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bah9svhQ"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43d16a01deaso1615685e9.2
        for <linux-sunxi@lists.linux.dev>; Fri, 04 Apr 2025 04:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743767827; x=1744372627; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dWTh0iUxbFDZj1OSxB2YpSs0Atj06C+ykZmPKxNCsxA=;
        b=bah9svhQP+NWIL3FsfzE5nAI9bT2kjJ5LHQOjfaGmtw1yTfM1Pj8hBGUg5BQwmaTxi
         wEt5tVnLvRIweAxJJmePQtyQim+0KzFgGHWJjpazagF7JtzgGfwjkFRMQfFU3Or0rxW2
         Rvc+FI8i9CGs0686PeDlMn1oROUk081O30Wf5/jWJ/nH3rr7sD1PIhIjt1l0wfgsecUM
         q5BkcAN35nKrg91Jk5Wj6/NMMD6Le+oPpPMrIdhdWn219ToqlVwf96y73W8TKcVNP9Ff
         4A6KnygK5N6S3G1toMtM0MRERgAyH/xT/VS9Ir5Vg6HZkcqBndJMhiFMPs+UWZEra2KQ
         OabQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743767827; x=1744372627;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dWTh0iUxbFDZj1OSxB2YpSs0Atj06C+ykZmPKxNCsxA=;
        b=m6cRfOvG2kQs1kL6Yd1ibU3sRC9kC/Kdl59wLryOmAdF01WO8kCtbkE+DaFh/t6x2P
         E+shI8f8DXk6CerxT2HDfAEVCCYr+oSTGdqK3hLEa/NnwcdkIMijd54KhyVcHd/Fx4nu
         WnNTIBaj2+P9oGewdt+yXeUtbmnBSsWOkkUaGR8bKpDPOnOCv+81AwUfW4aoo22Ja1Nb
         lan8l8weA7Z7AbJMP0SxXLiNlkmo+kmOe9Y2XBTQ6qth1k+ufqOB+a/wC2Hx8nl+Du7S
         LE7pJsj8gSjt4uq+dp/HiQQa45LeVJi+Jz2+/Xjsw90WO9z/uhJ7Xqd/xbbSMZg2r0TD
         ZmEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlQnQhgpwPsbVzHzPspe4tXnJjw/Y2VDb1ormArZq23No6smADuXTJ7PDLmyUk2PdYfbxdMVUDNIR4Aw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxCXRXshHtBS0wEWFolvZo/cV3RhsgPi0TffZzUIi2TwMjrZcK7
	ZmMYKBVCIXa8N1e7g8II0j7KUOJaG7MV4tIwSrjdNtqtw0Zq6ngg/q7wbZHG028=
X-Gm-Gg: ASbGnctBNE1uVU1DysYTSaQGaxVAABnHFZ3MwdC7/veh6tjj5tNysT2EsP+aowH2g7Z
	7Xp1FCqjQyfX02daJbQnATpXrlKc7DeDPuMx0XXyKoAQgz9rXsHTNBkCex9O4c6pyX9Js5SrnWr
	m4NbJnwcPhypExjYIRz9r3AwD0mAjwdNwuflHBZ5rEUlSvCuq4ervynPh8i+d55vJBLG7KJhWyo
	uDTFZC1ZrNGNx2zl+XfcfgeAKpGrs6sEvg29duH2DaLyenaYbxDmzvPF7TFTLBh8W1N9rx+3Ceo
	l1MdONtR0iNr3dB7wMrlhWWDN+Z8kC/XGx54LYtlt3HmfOZJ3EAgUDxfTkSo+D8=
X-Google-Smtp-Source: AGHT+IHHD7HuendpPytpQj7rstsIi+Mc3ng61xMnf8Qu66Hus393p51dcdiyAL39bcJzERvr8KKSjw==
X-Received: by 2002:a05:600c:848d:b0:439:a3df:66f3 with SMTP id 5b1f17b1804b1-43ecfa18ba7mr9352835e9.6.1743767827420;
        Fri, 04 Apr 2025 04:57:07 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec364cb9asm43842815e9.31.2025.04.04.04.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 04:57:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 04 Apr 2025 13:57:00 +0200
Subject: [PATCH 4/5] clk: sunxi-ng: Do not enable by default during compile
 testing
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250404-kconfig-defaults-clk-v1-4-4d2df5603332@linaro.org>
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
 drivers/clk/sunxi-ng/Kconfig | 48 ++++++++++++++++++++++----------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/clk/sunxi-ng/Kconfig b/drivers/clk/sunxi-ng/Kconfig
index 5830a9d87bf25d536ac787fe83669c64c8214952..8896fd052ef1784d60d488ab1498737c1405deb2 100644
--- a/drivers/clk/sunxi-ng/Kconfig
+++ b/drivers/clk/sunxi-ng/Kconfig
@@ -9,123 +9,123 @@ if SUNXI_CCU
 
 config SUNIV_F1C100S_CCU
 	tristate "Support for the Allwinner newer F1C100s CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUNIV || COMPILE_TEST
 
 config SUN20I_D1_CCU
 	tristate "Support for the Allwinner D1/R528/T113 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN8I || RISCV || COMPILE_TEST
 
 config SUN20I_D1_R_CCU
 	tristate "Support for the Allwinner D1/R528/T113 PRCM CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN8I || RISCV || COMPILE_TEST
 
 config SUN50I_A64_CCU
 	tristate "Support for the Allwinner A64 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on ARM64 || COMPILE_TEST
 
 config SUN50I_A100_CCU
 	tristate "Support for the Allwinner A100 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on ARM64 || COMPILE_TEST
 
 config SUN50I_A100_R_CCU
 	tristate "Support for the Allwinner A100 PRCM CCU"
-	default y
+	default ARCH_SUNXI
 	depends on ARM64 || COMPILE_TEST
 
 config SUN50I_H6_CCU
 	tristate "Support for the Allwinner H6 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on ARM64 || COMPILE_TEST
 
 config SUN50I_H616_CCU
 	tristate "Support for the Allwinner H616 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on ARM64 || COMPILE_TEST
 
 config SUN50I_H6_R_CCU
 	tristate "Support for the Allwinner H6 and H616 PRCM CCU"
-	default y
+	default ARCH_SUNXI
 	depends on ARM64 || COMPILE_TEST
 
 config SUN55I_A523_CCU
 	tristate "Support for the Allwinner A523/T527 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on ARM64 || COMPILE_TEST
 
 config SUN55I_A523_R_CCU
 	tristate "Support for the Allwinner A523/T527 PRCM CCU"
-	default y
+	default ARCH_SUNXI
 	depends on ARM64 || COMPILE_TEST
 
 config SUN4I_A10_CCU
 	tristate "Support for the Allwinner A10/A20 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN4I || MACH_SUN7I || COMPILE_TEST
 
 config SUN5I_CCU
 	bool "Support for the Allwinner sun5i family CCM"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN5I || COMPILE_TEST
 	depends on SUNXI_CCU=y
 
 config SUN6I_A31_CCU
 	tristate "Support for the Allwinner A31/A31s CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN6I || COMPILE_TEST
 
 config SUN6I_RTC_CCU
 	tristate "Support for the Allwinner H616/R329 RTC CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN8I || ARM64 || RISCV || COMPILE_TEST
 
 config SUN8I_A23_CCU
 	tristate "Support for the Allwinner A23 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN8I || COMPILE_TEST
 
 config SUN8I_A33_CCU
 	tristate "Support for the Allwinner A33 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN8I || COMPILE_TEST
 
 config SUN8I_A83T_CCU
 	tristate "Support for the Allwinner A83T CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN8I || COMPILE_TEST
 
 config SUN8I_H3_CCU
 	tristate "Support for the Allwinner H3 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN8I || ARM64 || COMPILE_TEST
 
 config SUN8I_V3S_CCU
 	tristate "Support for the Allwinner V3s CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN8I || COMPILE_TEST
 
 config SUN8I_DE2_CCU
 	tristate "Support for the Allwinner SoCs DE2 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN8I || ARM64 || RISCV || COMPILE_TEST
 
 config SUN8I_R40_CCU
 	tristate "Support for the Allwinner R40 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN8I || COMPILE_TEST
 
 config SUN9I_A80_CCU
 	tristate "Support for the Allwinner A80 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN9I || COMPILE_TEST
 
 config SUN8I_R_CCU
 	tristate "Support for Allwinner SoCs' PRCM CCUs"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN8I || ARM64 || COMPILE_TEST
 
 endif

-- 
2.45.2

