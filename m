Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DBF3446C7
	for <linux-sunxi@lists.linux.dev>; Sat,  9 May 2026 19:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778353224; cv=none; b=HQQTAt5YT2ALdptmAsMBJp/7t5lJk5x9LFAcNyvjVK2hGPLXoPnfUgQ0vsehDcrlUx/FbtaKaiZfjm/XMi6coBX/YPFn/IC/JS/WMJUbdDQx0lIfWXQQKSZXNtv5nI9u4u01AhDHeSD7KWXsoblLraOfyG3hYF0dUesrx5hJ5Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778353224; c=relaxed/simple;
	bh=+SgYs8Hj6grWe0pXXV62TelA6SnR62JorpH+u34niZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uj1zJQ9r5IKJLv1gTkw7+W9QpE0DFCptpUe1CfrZvaCY6g/3iyNZq0eLUVfaHwYHef7wmqS7AVwM4oq6bHOmmhkJG1ibXQUDy6VA5abhBvE8P4Ut7lRaduVn9I7+BswqAPnzX47nV2gTcWOYdz1dCjbzckiO8VGBdZwjQ4mBMaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aQ5c4Jdj; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aQ5c4Jdj"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4893940bb5eso18194525e9.3
        for <linux-sunxi@lists.linux.dev>; Sat, 09 May 2026 12:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778353222; x=1778958022; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F3EJ0517xJNtY9t4icYdcJ6JRwvMjYIpIptqEEIrShg=;
        b=aQ5c4JdjTX0Gv7idEJmI4jZ2C9IYHRxBTDc7KtVl0aJoiSi7VDQYdKdxQrzP3ECr/G
         ge0FxJTLQ0kEvM9V5FXZRQmh19XRW/npuHWbysS3RR+QW35OZBz+LGy5qpN/V3Z4ZDnf
         0TkukKeCruD92VQHYHZJeYL7m4XzN1Ks3TEBzU4BFIvsHFUBVfRbNIySe04NGYyia9in
         Y1clqOraLELujY178EzSBXPIJzLpEWnCMnxGr/0J/fvp4znMMG2AvuzBgkngR7nfzH85
         bBf+Di45CDMLOXj5Zy78OGMauxQ4aNbro6UF36Ag4ubB5SApIa/7A7Yfgoz6wP7w5pKZ
         jZ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778353222; x=1778958022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F3EJ0517xJNtY9t4icYdcJ6JRwvMjYIpIptqEEIrShg=;
        b=fdegF7otHMHjR84NsgbeqLtbaBYxuUkdHhSIinzIoMhdqp8vmtJCqE5DFsnWEGP9CV
         qdw+axIH1wr2d+8TMel7lcbGI45vXcDCdp7PpDgfP11HzTRnruYgyPEIsfITZtXslJiy
         qesYSl1ZcxN12v7qNMLkUEk/oUwRI8muqK0AaHTmvJG2wDg4Y2XTIwZiFutd2l/YcJwH
         r+8/ATjPZ7DhBdQSQ7DSSuXlCm5k7wjvzPOBOLg6p7tHXBEpi1+na6j38/DB0g5h/YVJ
         kEBPJFsgTf2F5oA/Qs5aVAVnLfCATynkgH8gswnAi5tD0mU5ySdXcvh34+3FEaI1mgFo
         SK1Q==
X-Forwarded-Encrypted: i=1; AFNElJ9h5i5A3K1q6om9vTqB4dlUUK+nFDmQ+u+Yw3ERwrg7qkWOvhUfDauTQYLJDQCJZJgx7lL6KKHTZzNNhA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxneoWRYeupr5tI4+jn/N98jrcLwSr0F5cy8l/lo5PMFpAD18tJ
	eEXyN9pvoUe8qZmH5Q645AI4ajKgA/PcJ50JewQIXzEpvRBcKli4pkx/avNRBQ==
X-Gm-Gg: Acq92OH9WuajGOykBEIkC92Nir/mzZo7Bu9EJEH7pKZmgG2+LwRn6GdBPGNaGJSPAh7
	DK89rEIizG+tkkM5kYwGf60P89pUh/Om2fjHWVwTLeb7uiGJl5T+bAa6lAkTFfhgZy2wjPiD9LE
	QjSUzpifgYc3cGJ4j6gzo+YGHBt+fI8hWof2h95EHG9MHJFASnpxZ1ZMKRoODJYUvV7FMuMU4bn
	2IAhl924nDPqLZkC6Y0neyE1wYINmsEcx4YIiSRzd69sF7ykiNBK5c2ZdMoLz0i1gTxkkPAK5Mg
	cIFnHHAXWS0YGTJY3K7YhM4C/c5x33Hevc4ciDcZkBGyxvailBIZCFFMajuvXkWK4oVpsevNEID
	3AeNgcAEjSXyI0Oc+J/LYS0tLIYWsXaP2RhCP+u8AotFNPOTkFvcYv53FfP4e/3DOIEnH5wSJs+
	9DrsKz/ydhD6jgprpj77A7wBV2bZHM4ua3tztSDvVIPm4ItB5Xy4dS8Ea0eJRsXL0emLo=
X-Received: by 2002:a05:600c:1e0f:b0:48e:51f5:2764 with SMTP id 5b1f17b1804b1-48e676c0353mr137860975e9.27.1778353221568;
        Sat, 09 May 2026 12:00:21 -0700 (PDT)
Received: from jernej-laptop (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-454913049ecsm13254407f8f.19.2026.05.09.12.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 12:00:21 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
X-Google-Original-From: Jernej Skrabec <jernej.skrabec@siol.net>
To: wens@csie.org,
	samuel@sholland.org
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	jernej.skrabec@gmail.com
Subject: [PATCH v2 1/8] clk: sunxi-ng: de2: Fix Display Engine 3.3 definitions
Date: Sat,  9 May 2026 21:00:08 +0200
Message-ID: <20260509190015.79086-2-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260509190015.79086-1-jernej.skrabec@siol.net>
References: <20260509190015.79086-1-jernej.skrabec@siol.net>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jernej Skrabec <jernej.skrabec@gmail.com>

Positions of clocks and resets changed when version 3.3 was introduced.
However, old positions still work, just by luck.

Fix Display Engine 3.3 resets and clocks according vendor driver.

Fixes: be0e9a372787 ("clk: sunxi-ng: ccu: add Display Engine 3.3 (DE33) support")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
Changes from v1:
- new patch

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
2.54.0

