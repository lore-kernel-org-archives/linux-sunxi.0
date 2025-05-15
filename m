Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8463C2253B2
	for <linux-sunxi@lists.linux.dev>; Thu, 15 May 2025 12:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747313959; cv=none; b=fZFOiWLmsEKaUVrzeVLqJtPcztwhXpwhyCL5czhp38/qYIGekciMDm4Hb0cNUFuAVdHakIhnry7XaVgSlxy8Ns0PGdfTx8f36jMmBQdsGJiI6QEdqIlhx5usAV20ek75MY2AwL2qK/OA/tEVqgK1mv29NSBlR6dS/SqOsIEkB8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747313959; c=relaxed/simple;
	bh=OibAgO1lF+UrLS/2SrpwgUDc/nYn6zF9seSKQty2XPk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Dkkn6c6tDokplIx8VYSN7+QLa1QN7jmocSVFwBzTeK5YAseSBJmhhwXty+8eKM4/1xoc5P2APpCajzmsCXghjnVxiOkyIe6fIhHj65TIeXu+xuSLBxNtQ9M4xSnJs7dLW8wTo5uXPkhadV/ZfUvF9GWlOGC2JKiXhoOmT9x81IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=SeCTuCMC; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="SeCTuCMC"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so9925275e9.3
        for <linux-sunxi@lists.linux.dev>; Thu, 15 May 2025 05:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747313954; x=1747918754; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Qawhlvmv36yrM5PLXHrynEKEEyc5YE0PdfccMvrE2Y=;
        b=SeCTuCMCLPDcWHiAgZLdQlMuWQVWZg7k8sI8h+e3AAspC+8fOdXG/xx5gAWqocvOMR
         SOZR3Ecmfe1Djfvx/4nxYHa6Y2i1bKGqFRb3ydTavOk9Q+TP5+9LQBEB/Lb1VN6e/Ix5
         hYJGPPBhV1JF7uZt2WDJV7KSfO2KLcErbaUSPE68NuxkrHYWF3KHbTWDglw4JeAFlMLC
         tcEYyJXIgY07+TUWny8yZ3ld2xysdKiLQaGUJ2X8q5xooVTFAr94X2JNvBBxwrRs6pOh
         KFzoXh0LfAA3qpSlp9QwsWvhKpeBz95ud4HTN5jCGp1yd3PHaKSSO/7ffqLcgmmT/1r2
         EdCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747313954; x=1747918754;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Qawhlvmv36yrM5PLXHrynEKEEyc5YE0PdfccMvrE2Y=;
        b=b0HtUmFVLsG/N6sW4QxhvG3evsWQbcej9AVt4HSCLoz19aKu7WhiFZZijAQjEfYzKx
         6pdxM9jOnjh8HDk0/FOJgcg3wvubCSZ/S15PWUfoosYKgvLC/T30Q28aWT+Zqm1ctBSy
         K7LaOsQfeCi3+tDgHZheye//UhHehLu0FfPhIeOYxJxxL2x4tWJljrVIwO2EfYQ/8CYB
         pHJvwUwH2OVP6upa7S8BJ6eAaWlxnoykhiXU+cIrdCdYKlWOvjfsIk+Z7vXB2qMaw+PS
         nnXxBO1Dy9zrqX5Q/RQzS84sIH/UDCVEhJ/IAekuWoCGEhixprC0nxLRZCsACFGcW3nV
         050A==
X-Forwarded-Encrypted: i=1; AJvYcCXTp9cH3PYs45+w7+G8rXrxiEWK65ytZaMtsgqMbhMS6kiL4sjNtMGKK0mykyvXrnFvEp+U6IgRuOc5HQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8jOthfRlNeCUBbbS0eeipdP7tcPURsxBQ762H25/fvEn+Byqo
	uhHqxUTBaNZDqL9fj+KrJesUeTtgh59yCCm91m8k4UUD0Hq2J0lUfUQJUjuEATc=
X-Gm-Gg: ASbGncs51ZcXb5lvCgnftiHWDrYlEn0iHHtdqK+Y9ONo0UY+LPLBC1BPmCY8bZ32FxM
	onrF2oM0vbsoLFfp94+j8PuNOVDOBeCNysn+7OxM7/z2vy3e74nJB07t5zlimyhKXJ1BouZlMx7
	zJbLoSjvbgvmdo8jE6+bsb0KE80iymM9jW0+MyL/aiQCCk7rmzSKnjNSJ8QcWk68nJ7G9A13P1k
	AQBAXwJEg7ahJfpIUOVpK7wpJh7fTCQGB7/KYam+w8M+mgeduNXwxP7Ipyup1Td78nJJreVkzJ6
	CA5BOSNyFvaEY1KQo+r2qTJhPQ2lOsomJLMvKv0vmzxCNQiakCZZkRZyx40HeeDdlg==
X-Google-Smtp-Source: AGHT+IFyeqD0A0IScg3QZihC1XrEVTucJipRcuMxEvf1pQxV8DR8pNFyFAx+gn85sF514EVzZ/V3/Q==
X-Received: by 2002:a05:600c:3554:b0:442:e109:3032 with SMTP id 5b1f17b1804b1-442f970a9bfmr25956895e9.24.1747313953125;
        Thu, 15 May 2025 05:59:13 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:82b8:c32f:4d8c:199e])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442f39e8578sm71180475e9.29.2025.05.15.05.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 05:59:12 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 =?utf-8?q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
In-Reply-To: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
References: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
Subject: Re: (subset) [PATCH 0/5] clk: Do not enable by default during
 compile testing
Message-Id: <174731395227.3761659.8617180462546520115.b4-ty@baylibre.com>
Date: Thu, 15 May 2025 14:59:12 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

Applied to clk-meson (clk-meson-next), thanks!

[1/5] clk: meson: Do not enable by default during compile testing
      https://github.com/BayLibre/clk-meson/commit/0afce85ed26c

Best regards,
--
Jerome

