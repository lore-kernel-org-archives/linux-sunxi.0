Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6840D3911DC
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 05:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785734131; cv=none; b=l2WRHc9R3uW77MuRrdIBCgD337ErmgUMwsQq4kiJHGztef1C+bxPHKRo0PM2XQpXyMX5rVFblC10zogO/yd7ObUMrX17CUDSutjagoA073vjUEiLZJB32qt83FkMNvxH9vwHnBd884xWpSfg51lWx/NE4ZbqSH1kgPpSABKTmnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785734131; c=relaxed/simple;
	bh=zKmrq4Io78YBlcSoFkA6zgzyWtU0hC2kx2tv6Vt1nvQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jjs4/lOhf3tydn5i2y5TTQmyoPDt26VtEC3eYfI03uleQuEsC672TtnLzWzr7gzrZJ55Rh2ajT1UtDuM11d0D9h6lmbEDH90/zre17OxB0tWy8gk1A8MyvicGWbxU2qg75tBosJpcdZAGgrJeUZd6wAJzl4nSrAJ4+Tq0IWUfYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RA2ajKuw; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RA2ajKuw"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7eb63dbd229so2049680a34.1
        for <linux-sunxi@lists.linux.dev>; Sun, 02 Aug 2026 22:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785734127; x=1786338927; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gb4LPnphqc1DtduXOsyl640sXOpfiOxS2LbjD6EtoY4=;
        b=RA2ajKuwCcH90pFFfHEK7pivdJi65/A6Rxxpq/616sgmB7+keK/X0top/ZzcWl9ng5
         uCKXAZFH7RPrHdtod3JSpqmX0ZwdBXDkbAoPLN2nArOPXkwB/K/4zcvcZvaFbV6Vi8Io
         1Qc4hXNCc76j7bDEKIur1minFAV9eH1mPP4bQ6BMZsnwYqFSVDlFs3wEEQsBxQKBiHAh
         0nN5WodKcmn4xINFPekYysmHq2uZtnLZa98zZqC3m9ZG9Nvf1Pxs//Ss/A4nycX+oNIN
         nLHdDkxm6haC4QGR1XFjDMUUd+NOtJ6ZiDVbWD0uHtnXbqFCIP+Tspz8ir6yAWFhOHcI
         x9Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785734127; x=1786338927;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gb4LPnphqc1DtduXOsyl640sXOpfiOxS2LbjD6EtoY4=;
        b=DQUSYvVhoVF4RNQpz+hG0I6BWTHP7SdxvrWc/9DCPMmcZ9b3Qs5UIO16GbDn5T7L7R
         nqyQGbI8XzP5oM/PKjoT3ut9q2Q3XdR0tpp3jrGecO0WPR4ZbsXYXUBdg2PtVS4Zhvcq
         D8njhbUzdh/y0oY8Ktgd/rnUa49fPBqkxsNSXQrrXncwgx1rxwerjivWID3sQRoCPlAs
         NHVrKJKQNyFb62NJ8sn3kDPj5UW2VTl7mFfrHT6LjIQJR5hGcV4fVC4VFAmhtfbMZBQZ
         zHPHafyX5TzVAzcmZ8kISQOomgLkqCFgPz2Xudt/+DA+aNWAtSabyIPbfUIIpZjlvRzS
         EMzw==
X-Forwarded-Encrypted: i=1; AHgh+RpnGgTL297eiklQHiR3MIUjDWCk+DD7ygWv9vnNeBqiLQPxmYc3tRh0kNAu3rK2fnAg7zyqvE3qqtNTuA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzzEUO+nOwZxnfTDXFy51F+HK/ORP3WMXSC7ZHr5GJnI/YmNo+4
	jHJLnJTTtVzRKHr4RMXvhaGBea79zvSeF+A5GpH84vAKdKoQRVPkrgwR
X-Gm-Gg: AR+sD10C69FPtG5Jf+rwGsnvE0GJFMoUsF9b2iSfKkYXm27Z86mbc62U5VrlsDLkKFK
	zlQ3BNumFmir2Mu1GYxizB9ZcXTuLmIUxR2AtjGA/jOBX6iRt/K5SX9yzi4WTqwioLGXyo8LJc8
	0hsmr9MpngpHOxL8ls3fG84NV5yCqmyTKH1VDWiqDTc19AW1akyL4TntlzFvuD3+/OUcaTuArIv
	oGrB4U2QGE8fawa1En5Q7BNTTisY34RgzHHZgQapJNQTVlRFY4sxMeYr1rY2pmLJP7tHyXZu/+c
	rungOxEhJibHwdAa2vcJiYMtdiXPalIgjjD5r/VamzeUo791g4FuhliLO0BJ4SOr62ASgymf9uh
	oSbqI9i+Li6At9sHoGXrIbCAyZNkf3UUdjWzuaKLHqFyU5FWOt8CyVjxNZASomneAWHgC7DPHGo
	l/klUIj9qeW0jAYhBrks+LVHY/uDfGIuByZNyOqNZA0SfOM8QzaZfp3Ap4T2xwT4nBTYZDZrz+j
	NzFng+/RBxh+YifbREtZ85M1kTr6L+Hc2idwyZs4y6aP34tiepH9+V6CPu0O32pB8aTcp2fgdD9
	oGG3q3wKMxhzaRqtLPOYYat6uzuE8+ECx+w9YmvPeKo6mu33bJ+CwAvqcJrouKT6IlRht4KJVMe
	QYuH+www5VG5D5bOdETO1C/epIQ==
X-Received: by 2002:a05:6830:7086:10b0:7db:a297:9e62 with SMTP id 46e09a7af769-7f1892c8017mr4283606a34.8.1785734124209;
        Sun, 02 Aug 2026 22:15:24 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18f07a5e3sm6787108a34.15.2026.08.02.22.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 22:15:23 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 02 Aug 2026 23:14:13 -0600
Subject: [PATCH 03/21] arm64: dts: allwinner: h616: add EMAC1 controller
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-submit-acx00-of-dynamic-v1-v1-3-0a53cd9e21cc@gmail.com>
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
In-Reply-To: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 mfd@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

From: Richard Genoud <richard.genoud@bootlin.com>

The H616 has a secondary EMAC controller that supports only RMII at
10/100 Mbps. It connects through PA0-PA9 to an EPHY in a companion
AC200 or AC300 package.

Add the EMAC1 controller and RMII pin group. Leave the controller
disabled for boards to enable when the companion Ethernet hardware
is present.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 30 ++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index 90fe56a1d3cd..6879f27c2b2b 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -432,6 +432,14 @@ pwm5_pin: pwm5-pin {
 				function = "pwm5";
 			};
 
+			/omit-if-no-ref/
+			rmii_emac1_pins: rmii-emac1-pins {
+				pins = "PA0", "PA1", "PA2", "PA3", "PA4",
+					"PA5", "PA6", "PA7", "PA8", "PA9";
+				function = "emac1";
+				drive-strength = <40>;
+			};
+
 			/omit-if-no-ref/
 			spi0_pins: spi0-pins {
 				pins = "PC0", "PC2", "PC4";
@@ -789,6 +797,28 @@ mdio0: mdio {
 			};
 		};
 
+		emac1: ethernet@5030000 {
+			compatible = "allwinner,sun50i-h616-emac1";
+			reg = <0x05030000 0x10000>;
+			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			clocks = <&ccu CLK_BUS_EMAC1>;
+			clock-names = "stmmaceth";
+			resets = <&ccu RST_BUS_EMAC1>;
+			reset-names = "stmmaceth";
+			syscon = <&syscon>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&rmii_emac1_pins>;
+			phy-mode = "rmii";
+			status = "disabled";
+
+			mdio1: mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		gpadc: adc@5070000 {
 			compatible = "allwinner,sun50i-h616-gpadc",
 				     "allwinner,sun20i-d1-gpadc";

-- 
2.53.0

