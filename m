Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86C8158A19
	for <linux-sunxi@lists.linux.dev>; Sat,  4 Jan 2025 07:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735976448; cv=none; b=J2X6UkoA9Ts6RND3KYX2f96X6DBicgeINFAZABrHDdqvI4UaHSWlKK/K4fOXcvexR11GcwSn4W51XPoR9k3sIxp6/HIPqfIb/NUWZ4NnOQ2CUBBQXnHu00CM0tHTg8j+c3ZmGST439gUETZdBeZEffCE6dmNPD0z4DKiMNw3Z7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735976448; c=relaxed/simple;
	bh=YjINOz4Xv+YahkPpQKBJM0qt92m4mTvbJuNABy6+7Tg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dFVhWEn2U67d1GqWYQBb7h/XSjjXeZB0/lZOgDdVS2dbqjhDDMimKTaGZkfjb23aAS07aedxIzUObGyLS44BhXwJxh1yKDnQr1eKSzQbtT9BcNMWEJDdac/cIljoAk9Ns9C5v+eAZdtuFt0o3mYV+WtpQvx54S7EIQ/WCYN8fro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=exMWdmJw; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="exMWdmJw"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2167141dfa1so177662335ad.1
        for <linux-sunxi@lists.linux.dev>; Fri, 03 Jan 2025 23:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735976446; x=1736581246; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RemTwaYzBS1si26CVDrNGu9vkTiHrmOVmvsRlAFTpyQ=;
        b=exMWdmJwWYhdyfIidyhTb45A8gzCHbmO45ZKe94AIFI6novo0fnkkWWAmG6vy/pwbP
         jEVwqxs6C6b7IRita9krbD9wso7MVKsdLgdNTWVo6Nh0gcDtN6emTiEr/9EnfsnSIPuP
         mSNVwOcUUGy1LYjSZJNfUoRYjvtuuszfs3gGM+9MYd90uLUqEntp4bhJ/l09hVKVFOwm
         N5BqmTslp0TNfpx4eWv2AnT7AIw3dpacOQqHu3og3DXKmIfvyknFmSj3iByk4hWAFlX9
         6y7wPMFt49Fqr41HGqOnXSQgui13kSwCvZgHA/vrVnQZfieK27v7SvuaNZ8Ydp4RRSPY
         3Qjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735976446; x=1736581246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RemTwaYzBS1si26CVDrNGu9vkTiHrmOVmvsRlAFTpyQ=;
        b=OzBJcF0izJOrNiiay8+pxvnKAM06UMLobsc5BtJRr1m4j8O673RVy295aGsoUXkrnJ
         dxUPmWRj1xfBdIZSjzrnY8/XFRMW+Ab9OJoRUUB5paOVX7M1jSjnKMkrzHGY0+3Ajb1L
         Pz1LOAMlRo40iTSnW/NWUiqSsmXiGiTGrL2qJthuIq6AiL118LvOqCJgRAFqvj0N8+do
         tCRYdDlkpssfE5ec5qbxIQdBMNO7KWDf3KOxhmsY4UUvzILVeH0sSosbDTyTNtr6t/BN
         5Ncb2pHIa8QNtkcKV0k4B4RT0SjSW9IQci6WptAwMqDg1fD3CtM11Euz2rlkXB4rWq1i
         IgWg==
X-Forwarded-Encrypted: i=1; AJvYcCUXV+lmVFAjRkmyzIrHetILg2XnsR+sb1+rNXUezNjGTGBNJ00DA2VR/Rqoi33/ZPrsXqKMMoXxnxcJWQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyEQs9sQ63qdVdHvH6KsEx9Jr4FktGuzHljJJNPy9dUYKoEk9FB
	MV+NopLd3hB4Fk05lQOMmE1Aq1qV3Il3bqUIgon0rynOBSPgWAMT
X-Gm-Gg: ASbGncsds8n7YO3om44UXfzM25zm6W/yylNLY3cfOtCVmgEDxaSvsCWmf/wHMi9ydou
	hy3KnLKPYerPz3i8wxMVcsIyfLy1ROvT0VC61wv1AeKOOvrmkBCyH1Rrj1fsSNws6e3Npvt9pgN
	Ul3nSCK+PNaFyQ2eZaPMlbjorlYAUsJgcvDLm4gwNdwwHjS1P5r5ZP/5PqI16nNIvtXVILI5Tk1
	Qu5IyPlxaia9gVHtXBQiXHzDANj+jnxTR0/+zSu9rzkMiSu7A==
X-Google-Smtp-Source: AGHT+IFzAL/sWxagDkVX/+NamzAgakEA8UUO4OYdQZ4vgwAgnJ6fLVP3LLXGLkf1UZM4Gkgyz98S+A==
X-Received: by 2002:a17:902:e746:b0:215:a303:24e9 with SMTP id d9443c01a7336-219e6ca6c2fmr758900565ad.3.1735976446069;
        Fri, 03 Jan 2025 23:40:46 -0800 (PST)
Received: from anarsoul-xps15.lan ([2604:3d08:7780:1ca9::398])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca02b34sm256562565ad.252.2025.01.03.23.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 23:40:45 -0800 (PST)
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
Subject: [PATCH v2 3/4] arm64: dts: allwinner: a64: explicitly assign clock parent for TCON0
Date: Fri,  3 Jan 2025 23:36:59 -0800
Message-ID: <20250104074035.1611136-4-anarsoul@gmail.com>
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

TCON0 seems to need a different clock parent depending on output type.
For RGB it has to be PLL-VIDEO0-2X, while for DSI it has to be PLL-MIPI,
so select it explicitly.

Video output doesn't work if incorrect clock is assigned.

On my Pinebook I manually configured PLL-VIDEO0-2X and PLL-MIPI to the same
rate, and while video output works fine with PLL-VIDEO0-2X, it doesn't
work at all (as in no picture) with PLL-MIPI.

Fixes: ca1170b69968 ("clk: sunxi-ng: a64: force select PLL_MIPI in TCON0 mux")
Reviewed-by: Dragan Simic <dsimic@manjaro.org>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Tested-by: Frank Oltmanns <frank@oltmanns.dev> # on PinePhone
Tested-by: Stuart Gathman <stuart@gathman.org> # on OG Pinebook
Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts | 2 ++
 arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts  | 2 ++
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi         | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
index 379c2c8466f5..86d44349e095 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
@@ -390,6 +390,8 @@ &sound {
 &tcon0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&lcd_rgb666_pins>;
+	assigned-clocks = <&ccu CLK_TCON0>;
+	assigned-clock-parents = <&ccu CLK_PLL_VIDEO0_2X>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
index b407e1dd08a7..ec055510af8b 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
@@ -369,6 +369,8 @@ &sound {
 &tcon0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&lcd_rgb666_pins>;
+	assigned-clocks = <&ccu CLK_TCON0>;
+	assigned-clock-parents = <&ccu CLK_PLL_VIDEO0_2X>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index a5c3920e0f04..0fecf0abb204 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -445,6 +445,8 @@ tcon0: lcd-controller@1c0c000 {
 			clock-names = "ahb", "tcon-ch0";
 			clock-output-names = "tcon-data-clock";
 			#clock-cells = <0>;
+			assigned-clocks = <&ccu CLK_TCON0>;
+			assigned-clock-parents = <&ccu CLK_PLL_MIPI>;
 			resets = <&ccu RST_BUS_TCON0>, <&ccu RST_BUS_LVDS>;
 			reset-names = "lcd", "lvds";
 
-- 
2.47.1

