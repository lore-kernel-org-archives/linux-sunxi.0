Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554361922CE
	for <linux-sunxi@lists.linux.dev>; Wed, 10 Jul 2024 12:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720615266; cv=none; b=QWxTLvEJjupg9jLbSCE++9tQoB4CaAvKtsWsvltbbH6mZaFjKnANu2MxRYfE9uVazIASBSJ7OrVadW+MdUkhppafxQSiQbA+rHLRLbRsZgqJH0xHBSZ/Aa8CizEljyEJsWjkeU0cCt8mVFuO80N+27XBMjfWD/9ulcipVL6yPVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720615266; c=relaxed/simple;
	bh=Ool8JEcomupLYFCAVUceeyirLvgRl1G6dqSHkrYH0y8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Vpm8aaQARCWo7eDKT+nGlc6dnEgoPwp5/y1z5fp1mi+2gRbwu7Vgqhd4Cht/XgzE8r1dFGSgiF83k2X8LKf9+1lTi7DbEyn5ui7AIvA6VLRAkl6lCr54ElXoc459TS+U30LYSju/ae+O2YsOa00uR5BYa20n/121p75nukkgtd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=pyfNhhVk; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="pyfNhhVk"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-426526d30aaso35442585e9.0
        for <linux-sunxi@lists.linux.dev>; Wed, 10 Jul 2024 05:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720615263; x=1721220063; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MQLVDFNoFuKRZg7eJdxMfqN4N8nKsyXTgSDfnf3uLGM=;
        b=pyfNhhVkh6xyORA0yVdF4eaOAADeSM8VAjFt7H+Ob5ZQpqc/PsFqTLw0Uc3C6E9wHu
         1fN6wzW0v5Dvwh0xcALCTd0onylB5UZIda1BNNZ1+VWYzmcmXDi4Q/EHi3Fm6gW/Z9p3
         MzMSl2douGE6VK8yRqIgdiNQaOOAvfOipMWgOl93BAuiv1TVkIpJIRV01UwcRcI3AL0G
         YuCFoUpc4Kej9SGv2P5HtrfYQpcXVn68WBrY+k4Oy+q1P+0YCJcVycdwly3dGnffw7Kq
         1hReS/IrfhIzualekSxOMDaAioMMRyb2wEjiREfDH2y9uB0W9X1raZyEYbY43YIgK2f4
         rnbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720615263; x=1721220063;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MQLVDFNoFuKRZg7eJdxMfqN4N8nKsyXTgSDfnf3uLGM=;
        b=WBvn+XPgJwVV7v2dkRGJ3HkRn4mezC1ou1JaT6z162lw468c9e9oW52oIiYvDKycj9
         NR6VyeccvHshJorTO8mNk361bYX3KYjNIJWHEIDULJ+sD7cLYBNuUlG2vsSrZ8EJtd76
         0w9SV1tNy/alLCvjd2NXNUTLERt8BvF7B/ot9PfNmlTIJ79Ap6fVFnFodGiTPF3aIqEF
         OE3TdZ5j/48J4sIIRDRWbleWvMStauyTzB7K1S4i4OOLn8HpyH0NCdPbf6Z8RFfltJSB
         eJx7ursr5xGVMEMqVKSPc4mT9faMyn8reEUPOPc1gwnwJmnDCoGPIqfkdSmgmWYPvEZR
         WXpA==
X-Forwarded-Encrypted: i=1; AJvYcCXsFRCZgS7J1ZN9w8+V9b74pVAnuGeesGNk2hTxDjzBjvbWvmob8mNUqIq1FLZpTJE/7+ICThl99AlUS6Z73Wn4N+dxN1yq/LNJ6vU=
X-Gm-Message-State: AOJu0YwKZnBPtWxXCw1zFCFOQki1UfadqDgBXGYzqa7Z1KosC6/z89IU
	WCPAUSxdPPoaYG+6IjRbvbd+NAth/8Hc0bmTebJ6Nms4aTJEyGdOh+uKHOZwZ/k=
X-Google-Smtp-Source: AGHT+IGT5ilXJSn/KNzsrB9+RCqhsbkJiqU3dqpEBIzoFB+Fcmer/Kih8Fhroy2GBRX27ac1gAp6gw==
X-Received: by 2002:a05:600c:6c51:b0:426:51e8:5192 with SMTP id 5b1f17b1804b1-426709fac0bmr30666695e9.41.1720615262749;
        Wed, 10 Jul 2024 05:41:02 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:f3cc:df72:f495:3b49])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-367cde890f6sm5214025f8f.53.2024.07.10.05.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 05:41:02 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Bjorn Andersson <andersson@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Michal Simek <michal.simek@amd.com>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
References: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
Subject: Re: (subset) [PATCH 00/10] clk: constify struct regmap_config
Message-Id: <172061526145.2117005.2499091095196670705.b4-ty@baylibre.com>
Date: Wed, 10 Jul 2024 14:41:01 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0

Applied to clk-meson (clk-meson-next), thanks!

[01/10] clk: meson: a1: peripherals: Constify struct regmap_config
        https://github.com/BayLibre/clk-meson/commit/4a7665b885b6
[02/10] clk: meson: a1: pll: Constify struct regmap_config
        https://github.com/BayLibre/clk-meson/commit/5c6ffe3537d5
[03/10] clk: meson: c3: peripherals: Constify struct regmap_config
        https://github.com/BayLibre/clk-meson/commit/af3e4505e6bc
[04/10] clk: meson: c3: pll: Constify struct regmap_config
        https://github.com/BayLibre/clk-meson/commit/11c7c1b94059
[05/10] clk: meson: s4: peripherals: Constify struct regmap_config
        https://github.com/BayLibre/clk-meson/commit/02cc1df92d75
[06/10] clk: meson: s4: pll: Constify struct regmap_config
        https://github.com/BayLibre/clk-meson/commit/3d0e8b6edd6b

Best regards,
--
Jerome

