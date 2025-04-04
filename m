Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8620E1E8352
	for <linux-sunxi@lists.linux.dev>; Fri,  4 Apr 2025 11:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743767823; cv=none; b=cQjSg4kHGrAEyvVgtqoTvdNdPJWl1IwGOP47dCqt2vfeuiVMlfeQGUYmu3/J7nBRewl5bLh+A3lgSCPWW9SRNnVJ2D8lrQ/lZ7cj8b96ZuRf1E+rt3B0OCM0RBFyu7XLCmeEb3vWJaQBNdFDK1lEigAlw2OptAgRyxw5kDiGNc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743767823; c=relaxed/simple;
	bh=zsqexfN3olOy8cznO5MQ/mSDVYhWtEHBp8RW8IswWus=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XM8QA1py9P7XgjlhJ6QQSDvBE8mvYDnQhU18U/9cTSOUzGQIlWqIbBl7PdjYd/okDKna9R3iA5QJd4R2bMyDhR285sGmPrXPkj5/dvYuBUMTJW5/B3o0lhiWM6XkVM1LzdLHuRKrgqdjuVXBSz7PDF3R9ZNIRzQTuRu7OLUVHFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Emvyb+I8; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Emvyb+I8"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43e9ccaa1ebso2222155e9.1
        for <linux-sunxi@lists.linux.dev>; Fri, 04 Apr 2025 04:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743767820; x=1744372620; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9y9jtm3UdXwtwABizUC1WU+17uEhYP0YGv4IThPOMns=;
        b=Emvyb+I8TII7aNKTDd7XK2hq+tiViOPIF7wnq5u98gzuVyYytfTkBWN99EIEI74+2O
         0b5XrucSkI+Z9Yn/zDOYr4WLSGMvCeqtQJ2m2IPyWWPVgJs+Wn117GNPwLW5NVvFWHeb
         paN+fzVyjX/4ww+gcLxDxnTZEqyaMHUEOrgG+733MYW+92bJCGD6WrISolbWO9qngnEU
         8kjpuz16O9nEM4BtrM/mZ/ijU4vb6Jm6XQYVjCQeB8MJWY8BWMPj9iYAjMXwqKLapAgI
         36ikovncplAo25hT92PZ7WYYVVuTdqjgcb94vcOD0VO9/3UCkWQxQzCAtg+UfMeb3Rd0
         729w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743767820; x=1744372620;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9y9jtm3UdXwtwABizUC1WU+17uEhYP0YGv4IThPOMns=;
        b=FkJSCA+bXg3PliNXMWmYrwpvuNbAjiPd/0Dd8fe/FGJ3/acGPHO7yiqBcrwyJSzqRN
         xJA18gR5S8BXN6bQMNITw8qTKDi157UT0tBW/UfuMcYc7+H8w/xqf+kCkUaPg5WiRvLl
         RzliOWGb9EOZ9U3HGRf0sFlzjSmfrk2zvG33QEgQwrS7FlP39SSd6Yp8b9Gnxf0qglOJ
         1KKoBt2KKPHRG07Rprlu+rIKxJfBUy8+0mhdusWmf0Df8xiB6nFty6NBp1vSxjapsegE
         87Ag73sOODLE/GLPvxHIZBJvQfdZ4aOmuHKUZNGv9fUvJiKvQ2Lti/wty9roifY4TXUr
         6xQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUm2IjKtoLhhCSh9CaCF1ZfTNosQy5SRNWcUf27pLv61kigUyjuKALjCiaeF310y4D8TPEr2RcKanalTA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzcAfYJgrRqU438zDFOJDYptaskTpI5VXYTtVvF7+aBRQqC0f+Q
	9eZ5+n120ZXnj8b4VXAhIVOOGHTg4VkfslM4QTxKPvQvFmLWYPftjDS/vjOa2F8=
X-Gm-Gg: ASbGnctfqOJFzMPTvqZ11s42TTzf/Hr5/8hLaFcP6JTt6asm3iH2FO3/7qBnOfupyEp
	joRLwD1LIMzHF9+zX3io/K1fSSxqmUTszAOzhKQ3TJXKan59MOVDWjnWldjsNpFhNvV2bHnRGi2
	SEr6t6HQXrcc9cBChMdzNDEzLNl00okBKeJ4720xHxrUkuLy0OaUyPRbRqIQHkq++dZxOnjyPAv
	UIenFa7+xb5MUq9WfQiAIGTQEzHpsHuzBpci5+Q0D+hRxUpcGkJejftFmpjecY+CcyKMQ3mQ0Dh
	ivbc36LxexuZLIur+dtmi0Oj7JdzAY//MVkkjqq/PG56RYb+orB1Yq2ZPGZSsK0=
X-Google-Smtp-Source: AGHT+IE3YMdROfy4Pz/lL2bVAErbCHUi9OQZGeJfx60uexq6ErgRMWHK+iTZDQBEUem01jamr5n43g==
X-Received: by 2002:a05:600c:3ba2:b0:43b:cab3:1fd1 with SMTP id 5b1f17b1804b1-43ecf81ce08mr9264575e9.1.1743767819747;
        Fri, 04 Apr 2025 04:56:59 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec364cb9asm43842815e9.31.2025.04.04.04.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 04:56:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/5] clk: Do not enable by default during compile testing
Date: Fri, 04 Apr 2025 13:56:56 +0200
Message-Id: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAjJ72cC/x3MQQqAIBBA0avErBsws4iuEi1EZ2ooLLQiiO6et
 HyL/x9IFIUS9MUDkS5JsoWMqizAzTZMhOKzQSvdKKMMLm4LLBN6YnuuR0K3LshWG+68aytTQ07
 3SCz3vx3G9/0AHeSjdWYAAAA=
X-Change-ID: 20250404-kconfig-defaults-clk-fa24f8dc6143
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
drivers.

No dependencies, can be picked by individual maintainers.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      clk: meson: Do not enable by default during compile testing
      clk: nuvoton: Do not enable by default during compile testing
      clk: stm32: Do not enable by default during compile testing
      clk: sunxi-ng: Do not enable by default during compile testing
      clk: sunxi: Do not enable by default during compile testing

 drivers/clk/meson/Kconfig    | 16 +++++++--------
 drivers/clk/nuvoton/Kconfig  |  4 ++--
 drivers/clk/stm32/Kconfig    |  8 ++++----
 drivers/clk/sunxi-ng/Kconfig | 48 ++++++++++++++++++++++----------------------
 drivers/clk/sunxi/Kconfig    | 10 ++++-----
 5 files changed, 43 insertions(+), 43 deletions(-)
---
base-commit: 07951d09335e96138e0595208fcc66c35ce0447e
change-id: 20250404-kconfig-defaults-clk-fa24f8dc6143

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

