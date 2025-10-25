Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1776C267F57
	for <linux-sunxi@lists.linux.dev>; Sat, 25 Oct 2025 04:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761366764; cv=none; b=kKeo7C+jgMUesykXKV/kYk7S++UG/vOrCDCroi82rdUYvVfSk5IpNZn+TbuB52zNJ0mEQD0EmSZc+emuhzUCgYSwfIrwbhLLsX1GQJUshM4G61baC7CHQ46uOwUFSzQbMRyYC0goJ3YQ5HnpTyQ+aJ8uoUib1AM/ncHycmPLrUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761366764; c=relaxed/simple;
	bh=JFlSRxXwWBQ3XACpCIXATa+zwXHpyzhtFajoU+nnbIg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dUabEoWY86NRzQ1lORKaDjHcJBehz6VbSvQD/Tn1HU26gvipX2D8EOamOIOTw5fU3NmB2EyqPO9EbCHbLDnzqpNVzSiVeAViWDJ01S2zTShTH4Zd2PcIrWgRcsOPO79JBE9sUgs31zo4FATEJs4NhZDGP0YLAYGPDa8hv3lEWMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gN3a5aQK; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gN3a5aQK"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3761e5287c9so32387371fa.2
        for <linux-sunxi@lists.linux.dev>; Fri, 24 Oct 2025 21:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761366761; x=1761971561; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i3+BmyLOtp7xUTMRQtQMY1TWwM+wvGI7ScMcGnjI6fc=;
        b=gN3a5aQKjEFuJrIXb3yS5v/I0iavFqdgz5tWkhTaT3ief6t0tEnmJY2Iy9DQG078V0
         6zWXUSYepZYAyoH8PFVcUQ4ivwy7aAgeE2/SK7PEra4FATljAfuQS1xJGBrvZ+wNSUll
         1VrVZKwy10lMq8Y/vW3ibD8tCoxRn4qz3Thm36ugJrCrXNIPg2AeJp2wH+cDIhWVzjTL
         4dhctp3WPvv4Kycc19yN9eePyKnZsrBQy+PzC/B3WcoEe1bDR5vbN1D8JWJpMPTgSBrV
         I5vTbD/9aJ3HKjeLx935k0tziz2Ca0CLMnvfUJ2iqma8al0mNGkIisFrY5Utco10IMzB
         S2tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761366761; x=1761971561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i3+BmyLOtp7xUTMRQtQMY1TWwM+wvGI7ScMcGnjI6fc=;
        b=xRvBV6NicvyQARn9KpIqXGpAF+TxV6JCkfNPBt49t9c27uCRwCe/v6YM5Uz0accf/q
         4TEykPD7TtU+j8k9Ai3aoiohCakGEXSjTHZwACguqRWMKTzoToEmS/A3bcM20TxShYkL
         jqaZcoiCuRGA6EGR1AvJNOjVnw6Mo2eDOlH4CZVcTRBEe9eLYBVG0uxJx1USCDrlXCoe
         0OrNqhqxzWeirvTigr5eMe0gw9PhuC+B/1ekMc+BNHnGGrd13gu/n51stzsEPngF1/NX
         MR5hv41/TYVFP/SEaeU2kVjBDeYHt/4y21VwcYbwjhCsHcivtx60krSOMt9fxubvxDnv
         36QQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDlMUrIGC3PHU3vq8JqQSBskgSt9oGTCHkGj2O0Fs0bfA4I2AHlb8MbeMCKCZh+talC6r8ZG5WtRBemQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyqpHOupo82I7QlDNftGVEFY1suZucrIH4nPxE7VjLLNc4dVQKl
	pZSZg/y+jay3itU+F+w0ELaZO84r+KlHjCmud1ZCXd+FigFMLKIdFkzV
X-Gm-Gg: ASbGncskwPEKJiJwSHEUmTN5CkvXBjaOhvMLxUFN9PuRxgTa7ZxyqB4WlpkUWfVzgIE
	Cy9zj+SjM2wv0VQHLFPBsnwoLY44iS/kfD2zto/JSogyEJiC8xTaH8tgRSfgZ0rI/UYkqmj/FNe
	zod3igy00+BetoRi2/RF6kxdgs5VcyLom/uPEcM3WkVHdACWFmVEPLDn2v7Cy38BRW2Gz4qIESu
	kfcHm+p0GHZWp/9aQ/HLUOacMXZz0Zg9mNtiINlY6z1rhCNcUCl8/t/8ektnTFt5OdaBHKBBg/Y
	kCKBp5qsgf/9QNae77VZWbOTewakhUgWUVxqAwqXa1gmGTAAlmg1EDGH1hs5tPnolWQSifygZUy
	DxPaQw4E2kZNYohQ4jC7+r4LFRzzjJcDkIylMKQggZR1X5KR/6Wo+jRcJZXoqj+OsnQ==
X-Google-Smtp-Source: AGHT+IEKvrwo7BMcvdLr8sMnPaVHb2OI/tgnv1kSKzQDgd1sc7jso2BrG2SWkbje2QobtPqCs0yKQw==
X-Received: by 2002:a2e:bd17:0:b0:36c:2367:b3c1 with SMTP id 38308e7fff4ca-37797a58f18mr88205231fa.35.1761366760931;
        Fri, 24 Oct 2025 21:32:40 -0700 (PDT)
Received: from junAIR ([176.106.241.81])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378ee0ca7a0sm3409241fa.33.2025.10.24.21.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 21:32:40 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andre Przywara <andre.przywara@arm.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/6] thermal/drivers/sun8i: replace devm_reset_control_get  to devm_reset_control_get_shared_deasserted
Date: Sat, 25 Oct 2025 12:31:26 +0800
Message-ID: <20251025043129.160454-4-iuncuim@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025043129.160454-1-iuncuim@gmail.com>
References: <20251025043129.160454-1-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mikhail Kalashnikov <iuncuim@gmail.com>

The A523 processor has two temperature controllers, but they share a
common reset line. Make it shared with the shared variant of
devm_reset_control_get(), and also simplify the driver by switching to
devm_reset_control_get_shared_deasserted().

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/thermal/sun8i_thermal.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
index c02c398b0..aa496e1ba 100644
--- a/drivers/thermal/sun8i_thermal.c
+++ b/drivers/thermal/sun8i_thermal.c
@@ -344,11 +344,6 @@ static int sun8i_ths_calibrate(struct ths_device *tmdev)
 	return ret;
 }
 
-static void sun8i_ths_reset_control_assert(void *data)
-{
-	reset_control_assert(data);
-}
-
 static struct regmap *sun8i_ths_get_sram_regmap(struct device_node *node)
 {
 	struct platform_device *sram_pdev;
@@ -391,19 +386,10 @@ static int sun8i_ths_resource_init(struct ths_device *tmdev)
 		return PTR_ERR(tmdev->regmap);
 
 	if (tmdev->chip->has_bus_clk_reset) {
-		tmdev->reset = devm_reset_control_get(dev, NULL);
+		tmdev->reset = devm_reset_control_get_shared_deasserted(dev, NULL);
 		if (IS_ERR(tmdev->reset))
 			return PTR_ERR(tmdev->reset);
 
-		ret = reset_control_deassert(tmdev->reset);
-		if (ret)
-			return ret;
-
-		ret = devm_add_action_or_reset(dev, sun8i_ths_reset_control_assert,
-					       tmdev->reset);
-		if (ret)
-			return ret;
-
 		tmdev->bus_clk = devm_clk_get_enabled(&pdev->dev, "bus");
 		if (IS_ERR(tmdev->bus_clk))
 			return PTR_ERR(tmdev->bus_clk);
-- 
2.51.0

