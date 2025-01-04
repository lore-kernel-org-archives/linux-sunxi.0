Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D50165F1D
	for <linux-sunxi@lists.linux.dev>; Sat,  4 Jan 2025 07:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735976449; cv=none; b=r4syhNKK5pYmLEq4mygmheAXpuJQeu6+r7R1GG36Ulp6ypnkwtDSbPmrSrbWxzde58/TylW454Lr/xAELDp46wOn1czXyGU94pEhmUXTUsDaEukpcoEUK+ubboUMNNNwBc6VoDy5qV6sDKehkPNfHG1qLN9PLUaCZwpkcxDz9Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735976449; c=relaxed/simple;
	bh=nFF6gWVnSc4ZHH6uufJVq5/QMSkXaG4JWqQjtwpwgzw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VQd8wr4FQoEVQZg2rdO0OPSRyuLgk11YSgsFDU1yuaXyAYsgU1+o2/oAOxXVhJfftAdNE/3s+nD6MSwOlcpspntX92r4L+ZuKfbh3TLo5vFa3aM33hDRWaIw0/coqAobaVt5JnInbW9q7I8kkc19+g1xxZ4ac3gDWfox+5qGugs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HlqppqB9; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HlqppqB9"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21654fdd5daso169424275ad.1
        for <linux-sunxi@lists.linux.dev>; Fri, 03 Jan 2025 23:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735976447; x=1736581247; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qIxbJ2OQHNBv+4wB0JZ4sOT/J/UNSOHviGNvJzFTzY0=;
        b=HlqppqB9zCdpC2HvcMvbnt7t94j2kYAcoWfElofc0PWqdfkF0yt5sHq45yLzKWvOOB
         Nw+k5E/Lx5KeW6yaaQnYc0Ql+WRwhLLXzvV0ZiPcGHUftKhpVrML0I+i1Ew+B99I9qHz
         N4SxdpHCR0FR94hNHZPNZacwju1zbHsQ3mM6alHH/TyDfgt0a0/PHwrT6QPQwwfTkS9G
         FRpSpqeEarX15oywl1qlRLSQ5HCiik0Ugdd1pX1MfBJOq7lRA+ENDHMgR+HvXMv/lrn3
         8J6x3LgFeEhUM5+E5LsLUkifluXieTof1+ftCO+TDlV2/zaR754N5sOglyT09Z3RXEbS
         JhaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735976447; x=1736581247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qIxbJ2OQHNBv+4wB0JZ4sOT/J/UNSOHviGNvJzFTzY0=;
        b=shceAlCRJ85E0cK7cmUkq+7gL4g0AkZqd1lUbDCY8WJnHopsX4F+rxJS8F3h3jECf2
         36YWedH5NAgMDIDwx2Z/OqHM1xpVSYkLNxbls2Q1CXtP+TRMUIXzqzNWTb714An/2cJ0
         KJhB1Io6HdCQidLralVcU1Sz89nBSinj9nyCtzQjkFE/fPaufIDsqFGrTrRmMuTmV/Fg
         MM4eKIzhw1AC78Rh9YMXxLd7IcTK48NlIVbB8JdoxaScFGwyoBurtjh4xcieNRFR7zK4
         2lqiN7vJ3av+s05u868zXs7SziyOxsUauOnEJDLoZFftz0uA2CDrPdVDeavEG9b9wZzG
         fSRg==
X-Forwarded-Encrypted: i=1; AJvYcCVENuWHrdX2LP2aNWOOFAp2T/QQiYQZ0I8b51JQqvG1S0P5+Byte3hbiV35kIYH7QdmyzWyRHavdAvuAg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyDxHTQKQOJcdeaVTOSYl/7q4JVAf3TIuOaN+mtTsCbGY0s/CVH
	Tqaq8QIDkWR61Yg22c3c/P80zImX4UcAvWUvyk6fSaki7zxykrda
X-Gm-Gg: ASbGnctyeE3gNJJbBue4U0M3f0N4bGOFnr6DzAkpzEvhm/WbVOfXnI0IJpvQvSOXGM2
	bzffGkT7EkcQBBJ7tPCWKirjz/NPAQuN6Up5gL55Gux4XhBjRHGdsAq9c62ICbVJ3B3Q5pbJsux
	zKO7fGMovfhy1RKbNLFeXRyDd/LjMb1a/le6j6l2h/fT1xml3QUnsZRWx+CXHL9ZtjwnfZJLYYD
	np2OlkuuV669GGYLI8fYL8/+k27QaGY/Mnec4ekinkuqvOFgg==
X-Google-Smtp-Source: AGHT+IGzouKoKcczOFE/BlEmlBfzMQU1FzvtTcHjF3vHVcWHcn0aI0SCAElSuL8sd9OBoHBrGue/Jg==
X-Received: by 2002:a17:903:2449:b0:218:a43c:571e with SMTP id d9443c01a7336-219e6ebd140mr793188505ad.28.1735976447244;
        Fri, 03 Jan 2025 23:40:47 -0800 (PST)
Received: from anarsoul-xps15.lan ([2604:3d08:7780:1ca9::398])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca02b34sm256562565ad.252.2025.01.03.23.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 23:40:46 -0800 (PST)
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
Cc: Vasily Khoruzhick <anarsoul@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Frank Oltmanns <frank@oltmanns.dev>,
	Stuart Gathman <stuart@gathman.org>
Subject: [PATCH v2 4/4] clk: sunxi-ng: a64: stop force-selecting PLL-MIPI as TCON0 parent
Date: Fri,  3 Jan 2025 23:37:00 -0800
Message-ID: <20250104074035.1611136-5-anarsoul@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250104074035.1611136-1-anarsoul@gmail.com>
References: <20250104074035.1611136-1-anarsoul@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Stop force-selecting PLL-MIPI as TCON0 parent, since it breaks video
output on Pinebook that uses RGB to eDP bridge.

Partially revert commit ca1170b69968 ("clk: sunxi-ng: a64: force
select PLL_MIPI in TCON0 mux"), while still leaving
CLK_SET_RATE_NO_REPARENT flag set, since we do not want the clock to
be reparented.

The issue is that apparently different TCON0 outputs require a different
clock, or the mux might be selecting the output type.

I did an experiment: I manually configured PLL_MIPI and PLL_VIDEO0_2X
to the same clock rate and flipped the switch with devmem. Experiment
clearly showed that whenever PLL_MIPI is selected as TCON0 clock parent,
the video output stops working.

Therefore, TCON0 clock parent corresponding to the output type must be
assigned in the device tree.

Fixes: ca1170b69968 ("clk: sunxi-ng: a64: force select PLL_MIPI in TCON0 mux")
Reviewed-by: Dragan Simic <dsimic@manjaro.org>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Tested-by: Frank Oltmanns <frank@oltmanns.dev> # on PinePhone
Tested-by: Stuart Gathman <stuart@gathman.org> # on OG Pinebook
Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun50i-a64.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
index 3a7d61c81667..ba1ad267f123 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
@@ -535,11 +535,11 @@ static SUNXI_CCU_M_WITH_MUX_GATE(de_clk, "de", de_parents,
 				 CLK_SET_RATE_PARENT);
 
 /*
- * DSI output seems to work only when PLL_MIPI selected. Set it and prevent
- * the mux from reparenting.
+ * Experiments showed that RGB output requires pll-video0-2x, while DSI
+ * requires pll-mipi. It will not work with incorrect clock, the screen will
+ * be blank.
+ * sun50i-a64.dtsi assigns pll-mipi as TCON0 parent by default
  */
-#define SUN50I_A64_TCON0_CLK_REG	0x118
-
 static const char * const tcon0_parents[] = { "pll-mipi", "pll-video0-2x" };
 static const u8 tcon0_table[] = { 0, 2, };
 static SUNXI_CCU_MUX_TABLE_WITH_GATE_CLOSEST(tcon0_clk, "tcon0", tcon0_parents,
@@ -959,11 +959,6 @@ static int sun50i_a64_ccu_probe(struct platform_device *pdev)
 
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

