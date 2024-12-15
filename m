Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30FE20322
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Dec 2024 05:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734241022; cv=none; b=jOtPGSD8UzQm7uweLvsMAx49icOrMDfmti4ZNhtqZbLcPW4yKeYolXdPue70B0b7iwd7g/rTK4+okNfNkKwlEyzV4Cw4FuCRDHQo1GsnvCNdQgr6Ql5ZCbZ4lDLhcREVTd+8wHn9dyBAPz8yJ+sGsF5Kn9s4mO3sN4hx0rRev3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734241022; c=relaxed/simple;
	bh=hjq60g0f5rs7IOK+bpQIZlGtwoS5wPwAF2qfnusr93Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PFQYAPBOgJyqUCJ4epGjCNocpAkt+7vCpBDaUflB8KB77005jQ4lQ0Qf85jWeCvVxNbdnmh8I6n7x149vOhmxcFcurv725N6rDJUJG7pI2FJT0HKzU+UU6M2OItQMCkAEvmfVDapf6CuEANouY2gjF9fwZBbf0cIw+lqFKMsyA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M3iBLFsM; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M3iBLFsM"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2f13acbe29bso2443348a91.1
        for <linux-sunxi@lists.linux.dev>; Sat, 14 Dec 2024 21:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734241020; x=1734845820; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OhrQlN2vwbW+HH5J9QciNO8jVjYFc2SW7Nua2x90G3A=;
        b=M3iBLFsMOwxBpXt570iXTp6bMtyZyZJD7mtovrGxs2qfSnAyqvRN2ZscG7MqJDAfds
         1VOq5GFhhRCHAWHA2MVWzbwShCb8Z3xjM6nlmOge0yuEV9DZHOaJ+60WSFUDlbJpHb1u
         /uO9XLSjqFvOox8jG+9klhUs/ror074qkVM8AUd0gXA/ZxVytbPZbs83glD89P84JYpJ
         mMnybm10H2QYcz3jTqDPburrlNrGSBDiVN2FbZ81G1UvMgThmpJJ1YvUqYSuWv61yiH1
         K/7iw5uh6pkH+TDXu6cQCJ263aLYBhKGN2DrC5cb4nnDoIb0wtBx5xGgmqHzn2h0ynBi
         SHDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734241020; x=1734845820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OhrQlN2vwbW+HH5J9QciNO8jVjYFc2SW7Nua2x90G3A=;
        b=pb/8Oy8mN49XvAbqFsgITEcWVJ6wSU5b+Zf6wqTPlvFX7/Yj/g10NMJZSppox5uEoC
         icG13CEraF4A1DFIv7Fdmz+3xnBHfOebxiMZXVmzupo6wJvWXBNVsmMwZZxoVejBg/lE
         tKM/+3UWlCwcFlnbfmBKyxgX+IXkFlIEBxCygJhi9ZA5MRyCEk13Hg1uffzR7iWkGTqa
         buM46JlYequWSObP1dn4CYvhO+758mKiCDAZi4Dl5grIPr3jZqGZ5dUMTQwDp/IWmVSb
         nO/wUis7lghAJ2sJficHS4XHd3s6De7qfGmNTXUN5OrV51V6MJjxN1IX23dm0/q1AZuz
         VJcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcpdKeKb+pqGY0jFjXefo6NPGfpr0y/B5JhPHSqTVr0inYx+X9SJ+HK6gtOV277qY8WdOQPvX3mi9XfQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxROCIpJkWJggoxJb1GGUMhmanYRyDnko12Lg+FwxHhM8ka+6kL
	1taOn1xUBTFicd3+rb2pHfvsO+fJioL5SeMHkZ0UbnLXJOuCMqlQ
X-Gm-Gg: ASbGncv+U3yHRh2oX6DIBdwo19aR5+G9vO9ul9DrSn/yIAq/hAG4B1EaQA+nVPqgAL/
	zlaz5hZped7aAaPnl8PtP8I/UXAGopgnoe+Cr+bZUfx8mYSPAv2ky0AlnkSKfiWhGyTwLKH2Su3
	wZ8ly62MoHwY48eoqyRxo1jarMcyhGLQF8+sQNPF+jsUfm4zBxLWsAGjR9Q6FtR56q+Ek5H0XJb
	SZv51v5VlJJUwCwCJUIT1ooWCEUw9bLtk1ilHa6HAEss8gIMg==
X-Google-Smtp-Source: AGHT+IErUG9RW0X9xHdH5/Ssxiqt3RncarH98/x9Df651+JEpUXRrMwQ+2RKrQ87NQ7RiDs3G7ovLg==
X-Received: by 2002:a17:90b:4cc2:b0:2ee:5c9b:35c0 with SMTP id 98e67ed59e1d1-2f29166acd5mr12192019a91.9.1734241020112;
        Sat, 14 Dec 2024 21:37:00 -0800 (PST)
Received: from anarsoul-xps15.lan ([2604:3d08:7780:1ca9::398])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142fa1cf8sm5729803a91.38.2024.12.14.21.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 21:36:59 -0800 (PST)
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
Subject: [PATCH 2/3] arm64: dts: allwinner: a64: explicitly assign clock parent for TCON0
Date: Sat, 14 Dec 2024 21:34:58 -0800
Message-ID: <20241215053639.738890-3-anarsoul@gmail.com>
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

TCON0 seems to need a different clock parent depending on output type.
For RGB it has to be PLL-VIDEO0-2X, while for DSI it has to be PLL-MIPI

Video output doesn't work if incorrect clock is assigned.

On my Pinebook I manually configured PLL-VIDEO0-2X and PLL-MIPI to the same
rate, and while video output works fine with PLL-VIDEO0-2X, it doesn't
work at all (as in no picture) with PLL-MIPI.

Fixes: ca1170b69968 ("clk: sunxi-ng: a64: force select PLL_MIPI in TCON0 mux")
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

