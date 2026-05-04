Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB2123C8C7
	for <linux-sunxi@lists.linux.dev>; Mon,  4 May 2026 05:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777871021; cv=none; b=DD1cWc9FJun0HPkijmi3bysuydQwl19WJf8Ppv9aco9XlpNujxEt0d39OjI4yKHFhnDHOVUq2PpR3pqgl7pAvChFv64RaQjchGA88Dmg9oyw9CUmHs2bon7UktSlJKD2TGBgNLeYzXmePqrDZRfvnM69GjlYL/aTeQOVqYqx75o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777871021; c=relaxed/simple;
	bh=2TFX3CXq6/rmxkKsrdpy4I6/+x+PNEWuxGgifaViL0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cfb/+V5TNp4MlXJizs5Pa5JCb7wblIFQFRmx07lEn2HuktLPgi0OZ0nydbyrNdwSfeqtWitJnosjSu9Oe3azmVL4rYJzqrK+hZrDNP8dFQQpjpTP7jfwOCWAT1jJ/kMxkKBEsLvejb1iCJYKfKH/7Nz8DVzCS39Xo46qZkhdhPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JRKQhBIO; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JRKQhBIO"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-364ff382b0bso2335725a91.2
        for <linux-sunxi@lists.linux.dev>; Sun, 03 May 2026 22:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777871020; x=1778475820; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tCX5Iqac13O3XfLY0RNkBX2Gq9jD0l1ObowJKbWU4OM=;
        b=JRKQhBIOW6ZubrdsTGO5tn04tAtbnBqAeOC20VBDvb62lpMp1OFk/esO47JXDgg6Av
         s/MfId6GXN8auwxVA2AAnurlRE258dXVgfOKOH4NGRPkr1biscM3mwIfYan2Cl4ZAL96
         f4BZbG6JAe6lB7bF2/OxyyjQ8muN9rSsq8uGcZvEGrexA/W9GlUZ6RuOIzxr1GufdwlB
         GeR34ccn8IcXFjNiOrjhRg4v2SntDWCuGtP+RZHAXiGNAdtLdyMOoEOB0CkdLJYvL5Uk
         kxN70HRsLvkL7g8h0QewEfvYZnWvltfILrASjoXbGRE45z6NzWcrSii22jIuLAvA9pB3
         IdlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777871020; x=1778475820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tCX5Iqac13O3XfLY0RNkBX2Gq9jD0l1ObowJKbWU4OM=;
        b=YCXQ6U0jLqh/6yLLqBS6cUMZGlnWlR/pLN2ton77bQ1IgsddjmKgTwLik35jFSNsqK
         DEiP2gZ96JcE8u2s9eu8zXsaAJKt+XkVT9GAnqDSj85DC3PsJ3tAFwy6pfXRVR9Gz1k1
         PZAASCybxtm3acWzdJYk/qSO9Ylx4t52h0Jzwg0D1uKqDDxxx81hCPC4TKBqlh0Xjmd9
         p47E2n4w2YMYmkoohUQYVp+jpaP5qRZ4B5DSu32G3DA9fhSp48n/23yHm8eAhzVB9/xo
         mJ67HeeNniz2r0d3x9idShcjqtNbjcDllWmSWEBpZT9I5jTiTe86sTUTHRBz3OK60vYX
         /dvA==
X-Forwarded-Encrypted: i=1; AFNElJ+yhvMjS4gahTZpQN3ikLTkU7RTIvry3yjvKBCDL7k7vrySJ7KIs85zepbevqn3VGa5FW7cdQVIajK9CA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwBcVI0gCHV+hYmt9TooCc3ot72Kfd2sMxHWPdUczBeD5S1YtEo
	7lDMRa5+lgL/qGTWGtoGy3Bif8PXIj4nqIi9QN3WBf2r9aEcrjM6Kavz
X-Gm-Gg: AeBDieunCyRJYSgA6DPxbURzNhtShIAFDRcGd2k9TnISBhnwxud4UCSTiMMFsuH9nKY
	oMPlwabPJ90TwiaUz1UOGY5Uijg4VLBe1u8/e0/CWktxXJ/K1HCtkoyMe8/ONm8USxl76Dma+Bd
	/0VDOb8Zh/iDj5kXh0mfYtnK6rSNE4GGQkjcZo5OpiXHPYvmTrvLLWNHxqhnM5ZELfkOkk7tzr9
	fyxKaLF/z2vz9PazbPkwXY91a+FTjZtgb7to0Le0qhWJW8r4S1E8Cbj2C3w7lBNOerYat1bhCAP
	tTndKEvyWzeloHZuoFmhqUlADT98SDBGylo2zyIOs1DskPT0nl6u69PLfAVvWghTmHoZUS7B4cs
	+wHSOZW6+7bHC7iuNmC2lDQsgq88BHxZYBlQK5jQ21crRhAbetr2xj1Aw0tdedjCx+QSmZqahrp
	usGFyp3qEepZ5s
X-Received: by 2002:a17:90b:3b4f:b0:35e:3e86:e2d1 with SMTP id 98e67ed59e1d1-3650cdbaa39mr8265243a91.7.1777871019885;
        Sun, 03 May 2026 22:03:39 -0700 (PDT)
Received: from archlinux ([2605:e440:15::152])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365437b50b0sm2662908a91.0.2026.05.03.22.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 22:03:39 -0700 (PDT)
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
Subject: [PATCH v4 2/5] thermal/drivers/sun8i: replace devm_reset_control_get  to devm_reset_control_get_shared_deasserted
Date: Mon,  4 May 2026 13:02:42 +0800
Message-ID: <20260504050245.646078-3-iuncuim@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260504050245.646078-1-iuncuim@gmail.com>
References: <20260504050245.646078-1-iuncuim@gmail.com>
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
Reviewed-by: Chen-Yu Tsai <wens@csie.org>
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
2.54.0

