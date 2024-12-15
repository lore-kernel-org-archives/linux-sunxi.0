Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CCF29408
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Dec 2024 05:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734241023; cv=none; b=XMyibt1RUJVWkPNPHX4i4obXtHew5AlMGBvsTlY8kW3HmGEqWx+02U/QReZEPc6b8ZeJ8kcImsBw3VoSApG7FnvKOAFdmuyGw70w/JSBA6bIXKygBx9fGR2aona7ReNcMgU7+lgTGR9rCVwRylAj0EKJLRIkZjQDTbRpmVj7ZhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734241023; c=relaxed/simple;
	bh=t+t+IBz4oAfTZnxqTy01/YU6HNzERwZQNk5FgFkvhKg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s6QyppJjKivJdlYcoczf7zhIGUtY1Iv4cghJ1ag688zP+xoAgfuXLdq59feGYuMAafaW+6VkfBynsu32RMsy0rpFvaDERZnHPP4G+XTcQoISqZ9Oa3SFj+HdWOoaTuhYEqwApizC9N2coZTMXkxw1GH6BnYrlxXdcKWjkSQF25I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aDl5OwTq; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aDl5OwTq"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21654fdd5daso24930945ad.1
        for <linux-sunxi@lists.linux.dev>; Sat, 14 Dec 2024 21:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734241021; x=1734845821; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SKFdza2xHFDC8vmuSIt7kUvA8GVJhpwFBfkUic7sJXg=;
        b=aDl5OwTqdjwJdWti0mouGM9TvyVS+bV5Lrlbi3ooUHKsxJWsQjlAuoKXGoDIR57mvr
         dm5lvCPltKgHhd40gnEwkDWW7kwLm0v3v51DQNql64omePClihMgd7644z+CwsiKGiQn
         sGNW3nyWysNTg6ZFCUzt5WOFBRAlPmlYIiljXRZPlYjtfBKbK3nNZwYs5k6YcioER9S6
         OGrEzvpegOgrQEOcf6Cf+66DC+La/uzNWomXE6EBAC5+gpwTDJGlos6TP4TPa+H0/awx
         9N5If0aRzsdnRDjq83gnJX6/HWOfAAn7fQvMnHUJUfKgJLrGIYSxqGNkOV3yrmQkD+at
         1b1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734241021; x=1734845821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SKFdza2xHFDC8vmuSIt7kUvA8GVJhpwFBfkUic7sJXg=;
        b=jsBvWODxvvg/PbcozUKUJviB7NaRmpNOxbcqJ/M5Hsu8w/k3wHgf8E++T4PEBV7cwe
         JykwzE7LW07538ClS/czmR8G8Ab8FfZJxEve3ExDcgzyBpYUkkdIG0uBZgWEAZC4kYXd
         ArMkx27EbptB46zdfXldNrC55xovzo1tVPjDVu8I1Wcnf7wCglyms7+ZUv8FVlGohuQg
         TetLjJpp7+nJ6hJxuzb/Vf/6dTmUB0o5xut/ahRq09nNJ7b6ZxQGiEnttY3noZ46Y5bU
         h1g4ODZbifgSWT2Ie4d4UCPx01d5YSmyWYbIALa56ry52nMGlPGCXk+JU4WxLj7jlDzu
         eesw==
X-Forwarded-Encrypted: i=1; AJvYcCXQ/HQ+QmK8BdZOvtnx7F1Hp+uHtBlBecpUj8Kc9GjZWDg71259Upk1X/P1Tc2Aq4/QYPxzHBSMSBpa5Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwSV3kOLl9/M0S6GxUPybXoqlM1iWbP8x0NIHqs4U73qpV75hqi
	vRQ2eTa2vVIuEKDoc5oW9D8ZyGtWI9VIKw4OTyqvfW2lMzB4uZlLHhF+Xz1p
X-Gm-Gg: ASbGnctafNx0uJVueQRamrU9J3hI5O3wCvzcPovN5S2aTXWt62+ZnQN0Ma9d1Oc7xlp
	xAsY4TOhALmKliJ58sH/b3OmlreCAL1yyMCPGM+o+zlKod0XnoO5pUSbgV6dQMyKbIdwCVTA7eS
	loE0g1zf8kTvN5EgOoflRnXaRf/BSyTnTUpgJw91+jWnthrc7VDRS0wv0ts2v7/2B+OEo0Vjnk0
	7G5Gm+EozjjNWR5j4RdLf9jYKkcaV1fzArb856mjph8lyOdYQ==
X-Google-Smtp-Source: AGHT+IEEzrDO6PorFmWAnRKn8AWTVLTL53SlxdJAzLW6ec4NvsVjzDB2vdV68Sh9tldHOdGI/Sk3FA==
X-Received: by 2002:a17:903:c10:b0:215:7b7b:5cc9 with SMTP id d9443c01a7336-218929f0ea8mr107798965ad.22.1734241021173;
        Sat, 14 Dec 2024 21:37:01 -0800 (PST)
Received: from anarsoul-xps15.lan ([2604:3d08:7780:1ca9::398])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142fa1cf8sm5729803a91.38.2024.12.14.21.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 21:37:00 -0800 (PST)
From: Vasily Khoruzhick <anarsoul@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Roman Beranek <me@crly.cz>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH 3/3] clk: sunxi-ng: a64: stop force-selecting PLL-MIPI as TCON0 parent
Date: Sat, 14 Dec 2024 21:34:59 -0800
Message-ID: <20241215053639.738890-4-anarsoul@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241215053639.738890-1-anarsoul@gmail.com>
References: <20241215053639.738890-1-anarsoul@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Force selecting PLL-MIPI as TCON0 parent breaks video output on Pinebook
that uses RGB to eDP bridge.

TCON0 clock parent will be selected in the device tree instead.

Fixes: ca1170b69968 ("clk: sunxi-ng: a64: force select PLL_MIPI in TCON0 mux")
Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun50i-a64.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
index 3a7d61c81667..cc8de0bfbc67 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
@@ -534,12 +534,6 @@ static SUNXI_CCU_M_WITH_MUX_GATE(de_clk, "de", de_parents,
 				 0x104, 0, 4, 24, 3, BIT(31),
 				 CLK_SET_RATE_PARENT);
 
-/*
- * DSI output seems to work only when PLL_MIPI selected. Set it and prevent
- * the mux from reparenting.
- */
-#define SUN50I_A64_TCON0_CLK_REG	0x118
-
 static const char * const tcon0_parents[] = { "pll-mipi", "pll-video0-2x" };
 static const u8 tcon0_table[] = { 0, 2, };
 static SUNXI_CCU_MUX_TABLE_WITH_GATE_CLOSEST(tcon0_clk, "tcon0", tcon0_parents,
@@ -959,11 +953,6 @@ static int sun50i_a64_ccu_probe(struct platform_device *pdev)
 
 	writel(0x515, reg + SUN50I_A64_PLL_MIPI_REG);
 
-	/* Set PLL MIPI as parent for TCON0 */
-	val = readl(reg + SUN50I_A64_TCON0_CLK_REG);
-	val &= ~GENMASK(26, 24);
-	writel(val | (0 << 24), reg + SUN50I_A64_TCON0_CLK_REG);
-
 	ret = devm_sunxi_ccu_probe(&pdev->dev, reg, &sun50i_a64_ccu_desc);
 	if (ret)
 		return ret;
-- 
2.47.1

