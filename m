Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3FE1EB1A9
	for <linux-sunxi@lists.linux.dev>; Fri,  4 Apr 2025 11:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743767826; cv=none; b=kxgVFaUgWqVnhI1TwDwW1TgG9zn81XV2JzP1ld87PszuoK1RdjGQINCCoTwdyYE3oivZmvjgIxgmwlVKthbjNC9FCzsgw/aHsIGKnuPPSCqTDnd47Et8a8SnVb+jeQQsKw6Zg6O35EI0kCqNuN+5rKOQUrkBqYbqmvFd7KqqQxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743767826; c=relaxed/simple;
	bh=d1fAb3fHPiIYP5vnZt7mimC59KcGXB/kjjU+riDZhLM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RIa27vhAibVs76Ar1VFSCAbQB4ELOq3evG7QB4cdyCi+pZ5vS1YoNdDdeJe5NnEc0QPvdtY+XgUCVFvwxVMEsH780TOTXifk39BGHV7mF8DGPQT9XKOXbEFAWRZNzCts9hi95T7qAGda5kUGIkD9QS43sC1enjsWRpmIrWHcjXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=emPvZE5Q; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="emPvZE5Q"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3913290f754so218058f8f.1
        for <linux-sunxi@lists.linux.dev>; Fri, 04 Apr 2025 04:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743767823; x=1744372623; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rP6n61SWekMknO/zRlSYN14fVYP5G3VDX27XosLbmfk=;
        b=emPvZE5QN+c3aXZURf+8ONwhJq5oNY9FnhYLqKmfmfK9KqKtv2BNOmytY+TRWUpqgL
         9mJ0i7PzqHxxSxuv2DHpWM+kUOjM0W+qd0b82Faau80LS7K6WpfMJzKNLEOm5Wb+Dw1R
         F8q3DcnT0txDsvLV4+JErYWH3XaLSgBdXqDhPKqpCniNmDdAfJlve5mEsJw+zJLe+R5v
         FEUl/UAPc7XNfZ6i+xaKQOMBXZi78DB0J+LvVTZflvNGWafo4qkQV0XWVgxszde7LTTV
         +kPMwFwd9mZdbeZOeBqL1dr5A62WrJxl4ZVeR06oheTdkc1Pg8RwJzDQPpsfMKqcw1xA
         ro+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743767823; x=1744372623;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rP6n61SWekMknO/zRlSYN14fVYP5G3VDX27XosLbmfk=;
        b=UKSkEjClY58AdsOlFvlc9KHnij44VTU6kl9o2h55HYbv2kZwf9Vd8RGnmosv1ozHCO
         bZh4OQu6/SZcA8m2ZcF0GZUF0ZGSdxsUiUcQ4Q3MT6KoP+1oIyemexZtTd2GULHOExD8
         RQjyFsLnjygxxO0QykVEJ3Cy0E+8s/W38/5r3M9FgVDnrabIKS+/sT7+2PvcsMcNw4oC
         iLwSFPkbDPGwkLMEh0mDHfiVWUXTILuQ83VyoMNLRB5+D4R+6KTi0b0hvfoNsMxJ8ZUD
         aN9yYDvtqAxyrUiRr41dUU89xf9SgU9u0rFngR7Y/H+cJ+5i8zhA1WcX5QrJyhp4imqN
         gTMg==
X-Forwarded-Encrypted: i=1; AJvYcCXJhEpHk5NVz4T6TpUpwK9KVorUdPWRfgwLSwmAHoy37lmYJW6vfaOGNj2zPc9cTwlGoipxrgQgE8Pd2w==@lists.linux.dev
X-Gm-Message-State: AOJu0YyEC4hCyYjz9hUzhT1bg346eAt1T6k0UVkts7hbqoIb1Q6wq4ru
	RDE+k9bdBbpM9DubeLecDgejCLM5GhRuH0lUPu/HZqnV9LSBPOtAuuT76K/ZS7g=
X-Gm-Gg: ASbGncsbWgo3Qk9HH1la4peP5b2hISjdXjHu3spXqClKEvqgsUO+NlWuy1uC7qVhZCC
	6vmEl5OiAkHsjLSq3hoSeO8WMNN4iBbfCxrYhtRFMiph+UW1GDUBuQjA6+Hb663czGdiZQEDGaq
	eDZ6MaGwzpagDMxXBFtIHmPTKr1rQIVdpIK9qB+p/bgjuhQes7mzRXutU0gk+cKaAzqgZ1if2e4
	3frNkMGQ6M7T3PduV6tH17/1YyTrSW3nkgEXnHwMr0QrdSrVGrDyXo/WD2N5lO8XaUT6eMoZc7G
	+WT2Advd8P2czEky2h6V+czQC6HIZAnqFSkakDFvEj8AfMfWvs3OKD4lWFlU3Fs=
X-Google-Smtp-Source: AGHT+IGREdRnQ2gEflgpMySypGT2xrFpTeuT80iZBzxVkRizH3MB1Iv/GdfxP0Mu67TBThpOTa6MIw==
X-Received: by 2002:a05:6000:188e:b0:39c:266c:dae with SMTP id ffacd0b85a97d-39cba936215mr862740f8f.11.1743767823172;
        Fri, 04 Apr 2025 04:57:03 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec364cb9asm43842815e9.31.2025.04.04.04.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 04:57:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 04 Apr 2025 13:56:58 +0200
Subject: [PATCH 2/5] clk: nuvoton: Do not enable by default during compile
 testing
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250404-kconfig-defaults-clk-v1-2-4d2df5603332@linaro.org>
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
 drivers/clk/nuvoton/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/nuvoton/Kconfig b/drivers/clk/nuvoton/Kconfig
index fe4b7f62f467048b7c86890972d55faebd066947..e7019b69ea74824de6943108f30ec259aa52e5f4 100644
--- a/drivers/clk/nuvoton/Kconfig
+++ b/drivers/clk/nuvoton/Kconfig
@@ -4,7 +4,7 @@
 config COMMON_CLK_NUVOTON
 	bool "Nuvoton clock controller common support"
 	depends on ARCH_MA35 || COMPILE_TEST
-	default y
+	default ARCH_MA35
 	help
 	  Say y here to enable common clock controller for Nuvoton platforms.
 
@@ -12,7 +12,7 @@ if COMMON_CLK_NUVOTON
 
 config CLK_MA35D1
 	bool "Nuvoton MA35D1 clock controller support"
-	default y
+	default ARCH_MA35
 	help
 	  Build the clock controller driver for MA35D1 SoC.
 

-- 
2.45.2

