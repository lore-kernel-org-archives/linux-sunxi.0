Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794723083;
	b=q+4jLndANWPBU8pcBRyuiKYZe9PuPTr56+rSxYiU4BHrbY3QYGbRHOeKuFaUeo3es+yf
	 l9AwsWwR1zqxOiT13d61hDry0gga5F8/7oxgDZtgUyfekmZ1QzFVaGZKD5e9ETQoEyZ7J
	 1D9/fKfShWlfpEeqgM7sZuvi6+o51Gz6sbXaeD1etG3pqn1Bm1KMK+Q/bZVKfd6Q/aNVo
	 cM7/lMXKZ/8OsGvsQqjZE6bQXXFX0qEPcSjgeSc7+ecAP/svhH8zMPfiD1V3ECXkohN3F
	 VaFIx7fWBOH8iInfMtJpwbf3vNzwKw/Z5dlQSDhqKiLC0me5I+fptctcyLEcE0XKe4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794723083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ahJXFdL35LJt7+dj7dVWYLqD2Vs+Z841K5O8NV4NEdc=;
	b=3aPu3uhrArO7T4NLwbREj2oNVHj6JL47QZUi2owCu2OjGpZD1/vy1K66aRRbwn47Wzl/
	 edDavjlRZj6Hb31PNZqxEviGUoAC5il3sje5iwXn7beNtgerdqp0ZgMP7VeAJLsIdWBKd
	 fRwSHZNdy8oqytSufZKHG1dH4FuRw1SLIkio0YwZB95AgvPSxmwUqIwVjXybZIsjx3GpS
	 XpuxMZ20VVzT7EpaXlR7dG3u+nve1tbDit+bqx7e9BHIeibNmsPCMssp4ubOeEAWUsI2y
	 o3U76JanL1DvxugAxMKSSEWirFb+EK4H55tjPiq+/CiyhIxqfbMNACKr5GrL/3SpW8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KPHXA3HV;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C94B606A323
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 06:11:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C94B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KPHXA3HV
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so3717525e9.3
        for <linux-sunxi@lists.linux.dev>; Sat, 14 Nov 2026 22:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794723082; x=1795327882; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ahJXFdL35LJt7+dj7dVWYLqD2Vs+Z841K5O8NV4NEdc=;
        b=KPHXA3HVwL6MQNMCSJl5Ga0ZB6VBglH5kV8LxohbJa+kFWRnfJSQASBb9T7x9E/oyu
         lF5LBfn4zIG/E0P3UJ3WdZ/boF4V8lrioXpjm8BUy5/WZejEfEQOhCZl3GeD83NEPNhX
         LngS9rt560pHDXHKFyNIkg0+lA3Dy+U1YTwsRyJYyTpLn46iudkzoQet081rBoCS9bRq
         MD8/1+31Bd7Yr83TI45Xgu4B3ByXrkVOlxuogYMB8oC4Af5guTROWsqtuQBqIVB9p3MQ
         w9S/kF/BDVOPkUgUY10PEgOniX9CxHpHrhUklWEP7cwAgZDxY3qe72YVOlQPxp4+ft7O
         oJcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794723082; x=1795327882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ahJXFdL35LJt7+dj7dVWYLqD2Vs+Z841K5O8NV4NEdc=;
        b=srIC3dS0BTLK6oKPCsFk2hfKUUuICbB0jrKbx/wP87aGU+ln9qMU3xKirgNtfnyPor
         3GYbGQeAO9gZeIIIid9wQxp16tVPIybveFC20QjGvOeCcCXXTobPzI6rFMAwjpf+BRb1
         inFwT8vz9IXcjWtYbffbiS+hRZTLPc6UrcVO1fKjS+x1EZjUP14yfe+dkKAXEEusKAlR
         LTHAE0182GzUqxxNqunmTjaIArmq5LIxntk5WG4HxVMrGbwrlAwvgQ0/BKySfoQKXSpI
         Rlj18gWrMls+OjIhjci79SjtppGg0B0tPH+NFCKqNfyHyJ4fC8Sf/jEXQMjTn751A7mu
         J9mA==
X-Forwarded-Encrypted: i=1; AL+hErEMZpVwo/bnbD2cGPp2jCnr7Ar/U9tOn1bpjRq2AFAOO9SOuFZ0CUEiLNvRzMBbmUyG7oY74cUi3fr5fQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z8ICqoi33y+X1ezSV+yC9UF/3E7T1RH6LxCnT+5go/DfIWruuN1
	le2mQF7xHwEXEICTh1TAjTnb5toHwzR2Em/qfUpYqpUPLA+ULZ0a1hYf
X-Gm-Gg: AYBFou2HKzzBn6MfoGoKl8cD4zqY/iUdZF94CSbXwlE0Zp9cflYT3vfl0VHeks4Dprq
	D1DYK12N6e9PIp9HBjhNz418ItOUMhdQRiWlRPY/hP+60l0GIltWH/9K5q1YStVjrQDGdBY9w+p
	U6rIjksu6c6f5rRwAq0xECrLWvDeTD/eIhdmZxFMNhFoJ5ZVBIzOLYVEOyW4sulxCcAQEjEcUAw
	goQML3J9sRt0Z/VI44zp6eD/qtTUUC73YSxHxXe/cIckd7QYfZe/pToOcctwaEVTDXotV8pze2g
	Q3fWXlURVqtTs/IbaZPz/D1vAKcm/3esHcAXggN6zwIdr5BimxzA95hYcMD0rk9EqhzIXRupwji
	SqPJMz/u1zG4NTpJ4FEdWSIBkBtdZl3NXgdFcpwioKgT4fK9kziP2fGQtP5KgQE1EHksu+Puq26
	ZFPRWmSgxEuIizDRiFkeJ3ei49odycJYmJyJ1xb287oGRM/YGl0fhKaXVCuL2xa3bYK7FX8Y5lL
	wCzpOIsykEgtrtgOgSlZ0GOgPE54ojOsAfF7QMvY61qG6evTrMkNg1h9C1AwTrFygf3QoYpsZGQ
	AuiVUlho9Jjfu3Z4jOSDtjXvy4qoiPsu//HgkgxRkjadLALyRu0ci7O4feQ73Ob2bIIasTF+lOP
	CJvpjdFHyYr4nZTeo/FPyJiiQbTYf74LzK/uvgWqKqi0WZrsGlKF6eOY/J7N89+EQA1PyUNddho
	8UhvHaMjxRI4zZZ0nScvBTmRnPsYPVKMcY57J4z6s2A4abDA43yO+lGjwi1pbBOLuPfGrNTKPnY
	0ghyARt3zQ9saf7GmPq2L1lTqwQBLX2xa8=
X-Received: by 2002:a05:600c:4752:b0:4a3:59c9:a754 with SMTP id 5b1f17b1804b1-4bb55ab2b89mr152010325e9.22.1794723081993;
        Sat, 14 Nov 2026 22:11:21 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5ba25b50sm139331075e9.14.2026.11.14.22.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 22:11:21 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	sboyd@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 1/8] clk: sunxi-ng: de2: Fix Display Engine 3.3 definitions
Date: Sun, 15 Nov 2026 07:10:55 +0100
Message-ID: <20261115061102.229680-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115061102.229680-1-jernej.skrabec@gmail.com>
References: <20261115061102.229680-1-jernej.skrabec@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Positions of clocks and resets changed when version 3.3 was introduced.
However, old positions still work, just by luck.

Note that DE 3.3 actually has only one bus clock, which is shared among
all cores, even though it is named BUS_MIXER0.

Fix Display Engine 3.3 resets and clocks according vendor driver.

Fixes: be0e9a372787 ("clk: sunxi-ng: ccu: add Display Engine 3.3 (DE33) support")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c | 39 +++++++++++++++++++++++++---
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
index a6cd0f988859..6ec6c0dc4c26 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
@@ -36,6 +36,13 @@ static SUNXI_CCU_GATE(wb_clk,		"wb",		"wb-div",
 static SUNXI_CCU_GATE(rot_clk,		"rot",		"rot-div",
 		      0x00, BIT(3), CLK_SET_RATE_PARENT);
 
+static SUNXI_CCU_GATE(mixer0_h616_clk,	"mixer0",	"de",
+		      0x04, BIT(0), CLK_SET_RATE_PARENT);
+static SUNXI_CCU_GATE(mixer1_h616_clk,	"mixer1",	"de",
+		      0x04, BIT(1), CLK_SET_RATE_PARENT);
+static SUNXI_CCU_GATE(wb_h616_clk,	"wb",		"de",
+		      0x04, BIT(4), CLK_SET_RATE_PARENT);
+
 static SUNXI_CCU_M(mixer0_div_clk, "mixer0-div", "de", 0x0c, 0, 4,
 		   CLK_SET_RATE_PARENT);
 static SUNXI_CCU_M(mixer1_div_clk, "mixer1-div", "de", 0x0c, 4, 4,
@@ -54,6 +61,9 @@ static SUNXI_CCU_M(wb_div_a83_clk, "wb-div", "pll-de", 0x0c, 8, 4,
 static SUNXI_CCU_M(rot_div_a83_clk, "rot-div", "pll-de", 0x0c, 0x0c, 4,
 		   CLK_SET_RATE_PARENT);
 
+static SUNXI_CCU_GATE(bus_mixer0_h616_clk, "bus-mixer0", "bus-de",
+		      0x08, BIT(0), 0);
+
 static struct ccu_common *sun8i_de2_ccu_clks[] = {
 	&mixer0_clk.common,
 	&mixer1_clk.common,
@@ -74,6 +84,12 @@ static struct ccu_common *sun8i_de2_ccu_clks[] = {
 	&mixer1_div_a83_clk.common,
 	&wb_div_a83_clk.common,
 	&rot_div_a83_clk.common,
+
+	&mixer0_h616_clk.common,
+	&mixer1_h616_clk.common,
+	&wb_h616_clk.common,
+
+	&bus_mixer0_h616_clk.common
 };
 
 static struct clk_hw_onecell_data sun8i_a83t_de2_hw_clks = {
@@ -147,6 +163,17 @@ static struct clk_hw_onecell_data sun50i_a64_de2_hw_clks = {
 	.num	= CLK_NUMBER_WITH_ROT,
 };
 
+static struct clk_hw_onecell_data sun50i_h616_de33_hw_clks = {
+	.hws	= {
+		[CLK_MIXER0]		= &mixer0_h616_clk.common.hw,
+		[CLK_MIXER1]		= &mixer1_h616_clk.common.hw,
+		[CLK_WB]		= &wb_h616_clk.common.hw,
+
+		[CLK_BUS_MIXER0]	= &bus_mixer0_h616_clk.common.hw,
+	},
+	.num	= CLK_NUMBER_WITHOUT_ROT,
+};
+
 static const struct ccu_reset_map sun8i_a83t_de2_resets[] = {
 	[RST_MIXER0]	= { 0x08, BIT(0) },
 	/*
@@ -180,6 +207,12 @@ static const struct ccu_reset_map sun50i_h5_de2_resets[] = {
 	[RST_WB]	= { 0x08, BIT(2) },
 };
 
+static const struct ccu_reset_map sun50i_h616_de33_resets[] = {
+	[RST_MIXER0]	= { 0x00, BIT(0) },
+	[RST_MIXER1]	= { 0x00, BIT(1) },
+	[RST_WB]	= { 0x00, BIT(4) },
+};
+
 static const struct sunxi_ccu_desc sun8i_a83t_de2_clk_desc = {
 	.ccu_clks	= sun8i_de2_ccu_clks,
 	.num_ccu_clks	= ARRAY_SIZE(sun8i_de2_ccu_clks),
@@ -244,10 +277,10 @@ static const struct sunxi_ccu_desc sun50i_h616_de33_clk_desc = {
 	.ccu_clks	= sun8i_de2_ccu_clks,
 	.num_ccu_clks	= ARRAY_SIZE(sun8i_de2_ccu_clks),
 
-	.hw_clks	= &sun8i_h3_de2_hw_clks,
+	.hw_clks	= &sun50i_h616_de33_hw_clks,
 
-	.resets		= sun50i_h5_de2_resets,
-	.num_resets	= ARRAY_SIZE(sun50i_h5_de2_resets),
+	.resets		= sun50i_h616_de33_resets,
+	.num_resets	= ARRAY_SIZE(sun50i_h616_de33_resets),
 };
 
 static int sunxi_de2_clk_probe(struct platform_device *pdev)
-- 
2.43.0

