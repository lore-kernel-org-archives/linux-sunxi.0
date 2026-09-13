Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0033C334C3D
	for <linux-sunxi@lists.linux.dev>; Sun, 13 Sep 2026 14:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789311386; cv=none; b=ZV9zp7eLRBVMkGEhynh8TfRvBvKD4i02N0Ah5dgnb5M4sFs7suEIsMpWvSr/9UreuuIIzORONpspGLor8F0wocZRTm7kVEQ0PA5h5eIUNMNMPj/5uvTQIh5PnknP/zUN+e6yprXB7/ebXcVzBgM+zcdkODLIlEwlIZLwhlIrc+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789311386; c=relaxed/simple;
	bh=0TPiKoG4GPPZx3Popa85L5Rb7uSjVhIAcmRo7lxz1XQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t3xu5u7ps+3b2cHEfiQj7R/5l4ewt4PXhGfU5mxifi6UFYz4TpLdsKP65wIGdIuSXEMI5s/ClaQhoNFBa+1H7MZm/WzQ+8r5ZZnYnr/CCd/e4U2Q2rT8xafB3bghubWD3ajHf9Rxctq+cd+bTWIrPDIbOTXdYE/7hQAsCFUpQmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WGJ6c/eY; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WGJ6c/eY"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2caced6038eso23562775ad.0
        for <linux-sunxi@lists.linux.dev>; Sun, 13 Sep 2026 07:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789311382; x=1789916182; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VAFG6OrHDCLtY8RoJ0lJqtavylNBVWsmbDH0jNrFE9U=;
        b=WGJ6c/eYseNlMkpj7MRCAhRn+bWyB+NZerUUbq5Wq3tUnZFe/pGfLkNGzZ9qqSRO9v
         kA75DZAKxUm/2USw05F9jFtdC7ICPlNLJ5LleuBYZRgGUgeGCxC5fdbeUowqqoW/WrJE
         3pRr/qu7qj5CoFFKpry6NZy0sy+NrelfHD87P6bPF4ehL393SLerUmveDj2zstoxBBRH
         qXsf5BeCYb2eu4N906VEIYOfY3KMV7QUQ7q+BT7O0qowEmk9jfMSD9WIXdjUpgopdWl0
         E/XUmZsOeu/jfA5w7h2eY3ST1DeDvz4VYPzeNJIcH4YO+BRqxc0yHJCwBhEZkmMhgzy1
         EoOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789311382; x=1789916182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VAFG6OrHDCLtY8RoJ0lJqtavylNBVWsmbDH0jNrFE9U=;
        b=FkNIYduyRpyZBXSzaHPYrgKjy5XZPDdiO3ERRpmq233MOv3QbG0ODLW3CsPZu4b30G
         hFSOsz87BKKRUXgnRIK/MiY+QgKyRNDBaoIIFeA36DX5rn9E3EzmNV22PrVKBH3cJ3XP
         z6eq5Xwy+Yk7dhRFabGhpSXjQt0e2P6dU4Urdl5NsCQit5YP/G0ppGQktg17znJCY9qT
         dmXmwPYE8XmKDpXSKWz+y8BVKOysd+oDKgFkXpEWyz+jUynlFfHeaQhgj1+q/0epEYuJ
         5UbG4NGD4P4eHQG4TE5nrmyJOXs1cePYo3/v7dqsCnxtEAlM+EIKjV5HKV3+91rsmPxZ
         FE4g==
X-Forwarded-Encrypted: i=1; AKwUvBzuNCylMqORaIAIhMxTWlkhDs6Qy6gxdWZlk5YwNXMYuzTZUjJMWaAy+TWZYcIwQ47WEqVPfwjibeHEeA==@lists.linux.dev
X-Gm-Message-State: AFuF++lsqWBMm1rT1XCrKk4CQMupC1GImnPCcSRuqdAqWQEoOeC5XQWi
	lE7R2Gs9KLAmbRIFaRTYbtam+6O9vgfZmxfz00h4wk5dQZE4ZBDiNUAs
X-Gm-Gg: AYBFou1WEQxR+wngl+XR/NXmiiXqwnIB06UBt5RQNO9Ux76gFIice0MMUfn2uzw+ZS/
	1ZWxjvwvl95dh1B0aboo/57FUxR6ypC06kK2FrGDhCc+OAaUPf1lqrtxlLRXUvnOZzdb9LpqP/B
	ps9fx7VUHUkukHlSf3igxOejnudBVTN1M63N8RWf2H7Ts2IR1fRlDyWLh/NWieo9jMkgZOF58a+
	fVPlr5gR+1/yky5865je10A8IOCRyWyK/A0fTsAr2rxgARh3kHT8DDoMiemiOykFYgrfC3CTbg9
	MOfMGRjW18cI7SFiR4LVTTZPVuDudZt+bc0NmvHYKDftz8iUhRYedV2CkR5ra8JO4lOldhiHVB4
	SFJlrSPRVKk++RExYFsOgWI6icoE+c8hAwsivB5c8w/3oOtZHstqDRbLkepHyPVuD6iEdaVHyDq
	SGrbTPN13AYWQ7gQrMjnsfna2TmHCZUYAD1I9qSbsD2hzmCfZLvkKshJtaylyNacxu
X-Received: by 2002:a17:902:f786:b0:2d8:d4d2:d138 with SMTP id d9443c01a7336-2dd5f1bc196mr31924865ad.20.1789311382058;
        Sun, 13 Sep 2026 07:56:22 -0700 (PDT)
Received: from archlinux ([207.90.239.231])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba7a9bb56sm21467366eec.31.2026.09.13.07.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 07:56:21 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	=?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v6 2/5] thermal/drivers/sun8i: replace devm_reset_control_get to devm_reset_control_get_shared_deasserted
Date: Sun, 13 Sep 2026 22:55:24 +0800
Message-ID: <20260913145527.18148-3-iuncuim@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913145527.18148-1-iuncuim@gmail.com>
References: <20260913145527.18148-1-iuncuim@gmail.com>
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
Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/thermal/sun8i_thermal.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
index 284684137..1412bce63 100644
--- a/drivers/thermal/sun8i_thermal.c
+++ b/drivers/thermal/sun8i_thermal.c
@@ -341,11 +341,6 @@ static int sun8i_ths_calibrate(struct ths_device *tmdev)
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
@@ -388,19 +383,10 @@ static int sun8i_ths_resource_init(struct ths_device *tmdev)
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

