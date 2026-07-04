Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F243B374A1A
	for <linux-sunxi@lists.linux.dev>; Sat,  4 Jul 2026 17:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783185317; cv=none; b=KkJW2M0VFrSItU6MHUCR7bz1o1DhADI0ueOK3MIIhdim0kcNllq+ZwUtjvItga3GJHK9riHHqhH64OAKah0JiJK5dcePpJTqGAZzxjwZjuK/mF2gd0ArcaLUy9P4k2XKsWUAkLW7LDyNBgTh5Ay/iciaJoNfYz463sVdDwz1750=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783185317; c=relaxed/simple;
	bh=hiDqfxEwo2m08vVR+XmTBBNvFPcoR44JVTQtfXJLBKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LHxqCF6FXQFyK/L+rol0ivuG1eBwPYR/n8bU9QZMc26EUeeQKuV8JoJZ9TtlcCNT53SDZsVD3ZxMZJcpHvS189MPQ0eq37aPgrxmtMAy6y48HAkHXbGvaDs4pcpxQxxjn5g5GphYgFhXp+XCcPqJ0Rc1SYz/YeokSa8m+OCy9hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qVP2Uzwz; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qVP2Uzwz"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-847e6f03df8so1972292b3a.0
        for <linux-sunxi@lists.linux.dev>; Sat, 04 Jul 2026 10:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783185315; x=1783790115; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=baNPOtnreWkoR3AhhTVFf+uOWjoLtova69oE/tcCCJk=;
        b=qVP2Uzwzl9aNoJiGHL3yy4ksDn++4Zf0wSrop1v0kDy+Gn0K3vffgX1SC7GSlcmLlc
         fwVOQSrObUZ3Kn3D5O+AIrDsu6aIrAe7cW379Db7gKM5p5S1PpI6CaoyobWkV8DuNGzb
         br7YY38HoNsXXd5+KTbG1Mb2EN1bl1MPP2v+NvfgztJ8ns3/B0bNj1fynaAvVG+d2kXF
         SMCdai65G5vL7Ath5L8l5yyfZWgs2KDM1uPOCX4qiBw3WaYfWXfsNwzTOHhJoSbFnp9I
         FV2dMbruexd4KIHmiwN5emBdw+7pyS/euV6pjdaTnPUBmYSthl1HVc6hv/X+/UUmvd9e
         27mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783185315; x=1783790115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=baNPOtnreWkoR3AhhTVFf+uOWjoLtova69oE/tcCCJk=;
        b=YkZkkbPu23yx/yEqzDWGvJ3cjJKnICElx/ipLy8mk5ndYBEU2dLNrxwKi9axhVOzVp
         3AJGlUoM8BOwJxjvax3ORyVWXaNZJNeDKLKjhyfxQRRfUZr6FEv9ZstpNg6QrO2XSztj
         fHhuU4YjNsLNsnwyGeDPHWZ1z8k6rBC1cRObsIDj/HMkkzujm10XEufdbUP8xI368XqP
         ig0KwrxGthVRbt/uYW0bQbEk0M3Y0aFWinpiVO2SSCgD9OmpcUDr9isFHcYQ4TQB+CHV
         pwGkGTuQq4PPrLXNF9VV0uNGAfhOs03OG4nkBq0iscOw+JP38D8jRfxbOrhkTyup9K/U
         zyGA==
X-Forwarded-Encrypted: i=1; AHgh+RoPbUDtAJdkoOK10b5KCCCYq8ykInrWpvZluRzGHcQ2i1JPRw/ZAFZueggd1qelioEpZXC5cRq7tOIFiA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxi1r6gULVgRTzrxsWKydFLg+VPEl7QfdJ+ynEKYN8ngi3mJOLn
	lT2rq4IywJzayNYYOmDJFl+iFoQUNlISTR7Q3o+G7SEY16SuwZS8Gdgv
X-Gm-Gg: AfdE7clFrGyKTniXG/Rz8IR2z2XSoiILft2JYr4XUwT2xK9ORmkwblw3PLQ/Xy07gRq
	jzxBZqMDXweuwkXNMUNhJZ4ohcXpCnrx9pj0nD+0BHj6WuwPHZUdUTLJXO6quNpr19UYHJqM3HU
	UtS/kKsMKztlKe8bKl4ks+UIk0GVrIxDQHvNxuSHbxZv5q1DA4EINnHhtcg7Vi0BF12l0zqZR5b
	nB3zJintCo8XSBXgd4sE0E8rUggNvXnASmFroTp3MDbqt76JYuFjIFM9tM+MbydI0RRZcdwm+00
	zLHhOZhEmWmsiHlUYVvibPEhC3l1kbVXMOtFizpIujfkq9O1+RxE8OFmfsVv7Gc6rRN8FP2re5K
	j5hlW6anaocuWTlbHwF77pcvCI7DLMLMz3VaJecuD/XOaoPU4/55KbVsofKcmhbUzXA4Z1BccmR
	+yu2Hs
X-Received: by 2002:a05:6a00:1c86:b0:82f:9407:d167 with SMTP id d2e1a72fcca58-847f6ee42c4mr3927100b3a.38.1783185315280;
        Sat, 04 Jul 2026 10:15:15 -0700 (PDT)
Received: from archlinux ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d498adsm1379101b3a.32.2026.07.04.10.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 10:15:14 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/5] thermal/drivers/sun8i: replace devm_reset_control_get to devm_reset_control_get_shared_deasserted
Date: Sun,  5 Jul 2026 01:14:08 +0800
Message-ID: <20260704171411.1413349-3-iuncuim@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260704171411.1413349-1-iuncuim@gmail.com>
References: <20260704171411.1413349-1-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The A523 processor has two temperature controllers, but they share a
common reset line. Make it shared with the shared variant of
devm_reset_control_get(), and also simplify the driver by switching to
devm_reset_control_get_shared_deasserted().

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
---
 drivers/thermal/sun8i_thermal.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
index 226747906..df0c26970 100644
--- a/drivers/thermal/sun8i_thermal.c
+++ b/drivers/thermal/sun8i_thermal.c
@@ -342,11 +342,6 @@ static int sun8i_ths_calibrate(struct ths_device *tmdev)
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
@@ -389,19 +384,10 @@ static int sun8i_ths_resource_init(struct ths_device *tmdev)
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
2.55.0

