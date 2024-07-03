Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8D4142648
	for <linux-sunxi@lists.linux.dev>; Wed,  3 Jul 2024 09:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720000237; cv=none; b=ajjm4Z8YPhrTw3jGTQGiKIqNPmKqVKH7Li2/v5SwX+IAB+J7OCKF0UqiuuDH3EHSaRSX2oNtl6l2G0SFP1ex5gwlTUR6s17377ATR3ku7pNXSeU1SZ3ncb1wkiiWcFsifrrtvaOQQPHgh+WZep+YGrUeYwyM/IduE2og+L4Jel0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720000237; c=relaxed/simple;
	bh=N0gJOHgxfgNpyO7ny+dBVGTv1J0OImnbpHVOZH5V8Z8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hEMSLf3bXq3mRseJzoKacKFHzYCQYPvkIaxf4VHB0U1F8lpBBv+GRUGPpXCDXyeVvK/BgQi4NMGlf5ZDSXrSP8tmRwquqDR8nujATcDb5kkw+OQODCr6nfX0nc9K5P1pY9Igi243FUH9kade013W08nLtlplFnWh3Lc6u+VJ5OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T3Xmfavm; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T3Xmfavm"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-58b3fee65d8so2455289a12.3
        for <linux-sunxi@lists.linux.dev>; Wed, 03 Jul 2024 02:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720000234; x=1720605034; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VakF1oeyZohqJOzCR2EB+e9QseEPpQNRdPS7foA4iOs=;
        b=T3Xmfavmsxpz0XS2w4P8KFirO+Smc/9iPRLvGbMOxQGLjKjfRbPywEUdKxOEKbtbmn
         onWpdxwxHpM3mQx/ZXWksZIXNS+DLX51LEU7dlr8pvLm9hERIJSZNuPHfUW+lMAvDauY
         RDuM4JzW/LqIl1v2kb4owu4X6jHLhctNA++2+SOX6bj5WOs7oBNY80KdC5PmnlwvirSo
         7SvWmf4RDen5KU22yJCixwTyYKIeFfRbnv5zS6FptDwNj4sCNY0d+wmgXKyt/dwoy0G1
         9lSpEMz4R2Zr1wr18CgDOMa62tqKrTgDYs9xHJ6/5woPjSTf0Eq+8FcVNOqTvFJugIfz
         HeZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720000234; x=1720605034;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VakF1oeyZohqJOzCR2EB+e9QseEPpQNRdPS7foA4iOs=;
        b=erbBheot/nXL6fIl2+3z4RlfLsAn3QxwSJMRfJnQ3eZr68me4XliJlEzMiJoMsqFJB
         MOROe2vZUa/jaXRR0sh9C4TiBFHSyom2DLtQacvAMzBqAHXIDvWTK4fREoR+rTgZZWCm
         GfhaElkmS5SJl2sxYmdwnzpZzfQeMMqRhw0CF8miLfckSBXulu+4fCRZbXYDXn4wJ1hi
         hp6zrHdtVvOCyqFyVoDmUWC+GducxBwmLEAO9DYWTs1m8PG9BCOx1WZr4P120q77GhGM
         Q9W9ZmoQ8UxYsySZOH9JBVGZL+VHrM3djEHlZYkyeSPmjAACwsEuL8muzsX67YA29X5B
         kG8g==
X-Forwarded-Encrypted: i=1; AJvYcCUYd7DoJfj9NkKqBwp1/qjyanRS2jRYM4gcpGpl2crDZjNO6EG/Nf5ahNOh7oLHmnYu7ayoCqkiOqbfhkPmF8QF8TLjBrdvJudhl+Y=
X-Gm-Message-State: AOJu0YyIAtFOoe0ZagOKNqu63vm/anyIHPhgIGyZjnmLcmO6KBI+WG9w
	1Vfu1WumJtWioHxXr/NZnuPNOH/Yu42Occevm5sUhXQAjU4gT7uM
X-Google-Smtp-Source: AGHT+IEGIMF6jrdxS/In8NlkeaCvlqbPYXuxDzo7b2vkqDV6QtioedyCtz1EmFD+tAGLOVsHKUj0Ng==
X-Received: by 2002:a05:6402:1e94:b0:586:e6e3:ea18 with SMTP id 4fb4d7f45d1cf-5879f5a1b6bmr7392371a12.23.1720000233803;
        Wed, 03 Jul 2024 02:50:33 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58b4a97b1f3sm2082130a12.18.2024.07.03.02.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 02:50:33 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 03 Jul 2024 11:50:18 +0200
Subject: [PATCH 05/10] clk: meson: s4: peripherals: Constify struct
 regmap_config
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-clk-const-regmap-v1-5-7d15a0671d6f@gmail.com>
References: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
In-Reply-To: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Bjorn Andersson <andersson@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Michal Simek <michal.simek@amd.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720000225; l=807;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=N0gJOHgxfgNpyO7ny+dBVGTv1J0OImnbpHVOZH5V8Z8=;
 b=brXdgrZt/FFF/7aOoRwCjMcSneXj5ric9H9NFCiK+WzN1kYqNVkq0K4Ee43Qa1H6bBN27toOv
 2nHJ1WXyPk1DAD3OnpS5N4nhsoLAwIQpSJeEY+xoiRb9y0EMDFuiH3s
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`clkc_regmap_config` is not modified and can be declared as const to
 move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/clk/meson/s4-peripherals.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
index 130c50554290..ba1d531fce4f 100644
--- a/drivers/clk/meson/s4-peripherals.c
+++ b/drivers/clk/meson/s4-peripherals.c
@@ -3747,7 +3747,7 @@ static struct clk_regmap *const s4_periphs_clk_regmaps[] = {
 	&s4_adc_extclk_in_gate,
 };
 
-static struct regmap_config clkc_regmap_config = {
+static const struct regmap_config clkc_regmap_config = {
 	.reg_bits       = 32,
 	.val_bits       = 32,
 	.reg_stride     = 4,

-- 
2.40.1

