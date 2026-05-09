Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1F83C73C1
	for <linux-sunxi@lists.linux.dev>; Sat,  9 May 2026 19:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778353226; cv=none; b=W6RO6g10v9b1E3H9ZWY7jY0s8uiZHpezaKThE3c2AOobnlfZjp1F4N+vmJlwn8W9mMW6aiDqOt0zFqGtujDeQJL2a1xW5l2IAP6Sgbqwo/mxgESj/UU6OlWmghTeQMq11tjUDN054tqd2YioqH3i0eRN4u5nNWTYiqdZNnGxqo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778353226; c=relaxed/simple;
	bh=KhgjTTp6dPZIBaG0XSoEXqjWGKM14mBydZeI9l5lCjQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aRXul4tCSEnmejRN++tNUCw5Qi7/5fqUo2ArZlSdPdYH2vZQSjWLbF6o9/RyWYoGVY6NXYOjHsh7tX+6rZpwzdB8c7nByyU1SUG/4C6ogDznshZDjfCzQRz5X/bVTztLGlBDz7LRNy646Oie69yzPtThIXdExzWrPFcYMwoRI+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BnTAtk7D; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BnTAtk7D"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48e6db3ff7eso5449295e9.0
        for <linux-sunxi@lists.linux.dev>; Sat, 09 May 2026 12:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778353223; x=1778958023; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AdLAbqgwB3cbfBit4ZVDmF5fOX+Cth+Nq8mrAQRYaDE=;
        b=BnTAtk7DQVqFLhAdmKwApRfeeEfEYR4VIcxIY5ylugn5C+4yokowK13YqzlL2my75r
         YAd6SxVtu2fRsPzWq4iPkCdItWa7/laBHi+WsGkJGexs7fp+oBc3z2I4+pb6dahKfmj2
         zPv9ylZTd6xTxEjfU01YaeEWhsmiSf5Smtm9754siENz5zgvXS5cYvNkTSp0Vigc9j6h
         VrgsN3yoW/OGixeMdbDpdxlIvg6GK8u1pdHmIHFqpkbTmaOA+1qI1Vw8LIzAoUuwSlWP
         ewuE9fnxOIgM1kgHnNE3GFkXDe1M1uIyfjSlJp0liNpk7l9aybtCf7BsLH9Pd0Ucq+lT
         AUcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778353223; x=1778958023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AdLAbqgwB3cbfBit4ZVDmF5fOX+Cth+Nq8mrAQRYaDE=;
        b=nVOvZE+pg+f7qXzV/XMKWNlsz2oiqEnET6pBSmpAtRXqZpAr8UJZf1A9rfCn44c/0G
         SjK3f+AaPhMA07k/Za1vk0kl21Up3uenPYra+Ce8oJZIJfr+E3h8hIWNszEI7gcq4KoA
         /aZ7XdESKgOeWQSxOOA3xS2slGTHKyyR0soV3TgCEU7LQGpdTn8q8Hhvi1n9CyqUyV9e
         wZdmO9TyWSCt+/SqFwOUycQ6CFR6UzFOXlC3fiteoEmZ7qxYLfbA1o8WlicNKEjD3/PM
         +Ha+Tn0w0gXnVSvCawsx2zq0oQInq8jlmA9Rd/Ik46fTx+tBqJGz4zTkUnEEZIezEwbE
         8ywA==
X-Forwarded-Encrypted: i=1; AFNElJ9SEVy9gyFwgmhEWv2ps4+EbgYAA3jMfqWxBYKuytwH1dpU224iDtImx6AwlnXipByLYlKxDygCpxTHXQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwX8cyODhnet6ev4UdJap8vU3qSU1eUxhGFcp0S6vUHpPAcHukg
	15iL8E0V0i1z4W4Ljj799lpxhW9FOd+uMrhRJmpn/JI10rBzgyx9+k2K
X-Gm-Gg: Acq92OH9WUg7NuwvUm08eNjLnyQBJJ/Pt56TjeAMFyV2FQ/G6JTPk+ohu2Zk/buo+Ru
	Py/sIbL/M8IAEPBW5xr5897T5fRgMbBDlXY70Ds+advaKUoLqGgEMeSdiv9xhvR0xoA9h5hOmyJ
	du7jQne+VlaYf0gpWKdq7rScYHktpiE4ZGcAMsPy45YZgvlYI7YP05/L0jzEHDpY6kkUYStQttO
	NB2gfUi2FVTnGQ1rlSclMZUZrzBbCC2VZ959PmGaLdhPR+V6fjUHlNmFWCi96MWo/6d0zUAmqwm
	G55LwY3IxrymauRrM2yKgxSM9VTruAPGMMt2mH9i200MH8xxXx1WY4Y5f0feekoX6YAlX9XUWTf
	192Zg5SbGuwPMXXc2ylKtPFbi9um0ByINexXFVOmLfd1q9WBI+uk+xbW3+QMt7fR5xrOfoFDEr+
	hgoy1mLxnhL4fvlIP8eJOHuYPbTe4tMU+y4UvoTtHav21hP/6olZFkg8wbE4hka6k9KQo=
X-Received: by 2002:a5d:5f90:0:b0:451:ccc:a6e5 with SMTP id ffacd0b85a97d-4515d5c68d1mr27318999f8f.30.1778353222950;
        Sat, 09 May 2026 12:00:22 -0700 (PDT)
Received: from jernej-laptop (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-454913049ecsm13254407f8f.19.2026.05.09.12.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 12:00:22 -0700 (PDT)
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
Subject: [PATCH v2 2/8] clk: sunxi-ng: de2: Export register regmap for DE33
Date: Sat,  9 May 2026 21:00:09 +0200
Message-ID: <20260509190015.79086-3-jernej.skrabec@siol.net>
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

DE33 clock pre-set plane mapping, which is not something that we want
from clock driver. Export registers instead, so DRM driver can set them
properly.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
Changes from v1:
- used access tables instead of functions
- used macro for max register
- used dev_of_node() instead of open coding

 drivers/clk/sunxi-ng/ccu-sun8i-de2.c | 48 ++++++++++++++++++++++++++--
 1 file changed, 45 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
index 6ec6c0dc4c26..26d8abd5fac6 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
@@ -6,9 +6,11 @@
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/reset.h>
 
 #include "ccu_common.h"
@@ -283,6 +285,36 @@ static const struct sunxi_ccu_desc sun50i_h616_de33_clk_desc = {
 	.num_resets	= ARRAY_SIZE(sun50i_h616_de33_resets),
 };
 
+/*
+ * Add a regmap for the DE33 plane driver to access plane
+ * mapping registers.
+ * Only these registers are allowed to be written, to prevent
+ * overriding clock and reset configuration.
+ */
+
+#define SUN50I_DE33_CHN2CORE_REG 0x24
+#define SUN50I_DE33_PORT12CHN_REG 0x2c
+
+static const struct regmap_range sun8i_de2_ccu_regmap_accessible_ranges[] = {
+	regmap_reg_range(SUN50I_DE33_CHN2CORE_REG, SUN50I_DE33_PORT12CHN_REG),
+};
+
+static const struct regmap_access_table sun8i_de2_ccu_regmap_accessible_table = {
+	.yes_ranges = sun8i_de2_ccu_regmap_accessible_ranges,
+	.n_yes_ranges = ARRAY_SIZE(sun8i_de2_ccu_regmap_accessible_ranges),
+};
+
+static const struct regmap_config sun8i_de2_ccu_regmap_config = {
+	.reg_bits	= 32,
+	.val_bits	= 32,
+	.reg_stride	= 4,
+	.max_register	= SUN50I_DE33_PORT12CHN_REG,
+
+	/* other devices have no business accessing other registers */
+	.wr_table	= &sun8i_de2_ccu_regmap_accessible_table,
+	.rd_table	= &sun8i_de2_ccu_regmap_accessible_table,
+};
+
 static int sunxi_de2_clk_probe(struct platform_device *pdev)
 {
 	struct clk *bus_clk, *mod_clk;
@@ -336,13 +368,23 @@ static int sunxi_de2_clk_probe(struct platform_device *pdev)
 	}
 
 	/*
-	 * The DE33 requires these additional (unknown) registers set
+	 * The DE33 requires these additional plane mapping registers set
 	 * during initialisation.
 	 */
 	if (of_device_is_compatible(pdev->dev.of_node,
 				    "allwinner,sun50i-h616-de33-clk")) {
-		writel(0, reg + 0x24);
-		writel(0x0000a980, reg + 0x28);
+		struct regmap *regmap;
+
+		regmap = devm_regmap_init_mmio(&pdev->dev, reg,
+					       &sun8i_de2_ccu_regmap_config);
+		if (IS_ERR(regmap)) {
+			ret = PTR_ERR(regmap);
+			goto err_assert_reset;
+		}
+
+		ret = of_syscon_register_regmap(dev_of_node(&pdev->dev), regmap);
+		if (ret)
+			goto err_assert_reset;
 	}
 
 	ret = devm_sunxi_ccu_probe(&pdev->dev, reg, ccu_desc);
-- 
2.54.0

