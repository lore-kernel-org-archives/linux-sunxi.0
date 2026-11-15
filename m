Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794723085;
	b=2EmS1HmLCqoI9r3qfE7ixTrr2wi7d/RpftTQH/TQ4VPujyWmPILnDaUdYUgZlXRWP5wz
	 otCKg1mf6aSIMrPqVrssfVFAD4tUCDrOSjSNsnqDjFQBDSzQbgHLh7j1jIUm7kbfYfJpo
	 srFgW/5t3rfRSJnT+BcZ1nbr9/jWsKDDxySyZG8VZdMegrDFJ6jtq+c7n+PRQlFpkLiuv
	 6MRiImWGagwL8t7Nu8fcTBEIw/9wKKnXWEbwoP0CnJdk/xX+gOdOkbIB4XAhmVdcd1Q9g
	 iGHeppYwtMnoBYffd+Dm8fV0HlKDt6K+nGMh8Ef52YFn8/cUtfRAFmcbLlXX0qtQCkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794723085;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tAc8EDwX+oraDK+6dFO3Rvp07/tBaltgJEnu0lCCOi8=;
	b=YPV+aWJjRqkuBfMuJGavhMvw7pH+4RgIWdL8RMzUpHQMfEetnKLFyBYkiGIxX4cX72dO
	 Ukva3+HxTP0uEsKamRnBrdUqql7g7uGWr5y3S93n3Vyp3uNPD94f1OKssFEN5bvN011HU
	 RJiuGpIqXPj9tqV57YlwrcG2u8y3smFQzsJlGwY3iiyPp0rbIlcZVIsjCeiGYW4crD7mk
	 8pCn0sc9441KN4KwAAkS6XZjow+6qCI4Dk8B4FGWlqMQeLPZ+wCOgwmjhOGa3KuoF42Vc
	 99XzcztijBQ3if/Q1rLBmfs8bds3q+6yWRwW1KWvwY2elvc8InNwqGlrCjndtXCzHZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RQljcucj;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535C3606A88C
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 06:11:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 535C3606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RQljcucj
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so25620245e9.3
        for <linux-sunxi@lists.linux.dev>; Sat, 14 Nov 2026 22:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794723084; x=1795327884; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tAc8EDwX+oraDK+6dFO3Rvp07/tBaltgJEnu0lCCOi8=;
        b=RQljcucjsEgen0iP+KR5rm8AbSu9kv8tszxk/w6l33FkcYP0nq2mq5ta9//kg6lM2N
         tyaQa+eak/ri/4qdE8wQW3K8QusTEYsP2YH0BJVSUZ1dP5zP/OUe1OkOeGlR/hfSCuAE
         Nft/dvQ9gLVyE7T1eOc9FdZ5QwC3bclYUXCvo44r4LftjG4Hn+rmZ9fi8E07OH81Iu9B
         rRTdHej7KR+2ZeIHmdr9hYMIonjwHPaEz3YXnjc/Gcb8wQA6BV4VN10QxyBEekdd+f9k
         ZjhzNgRdb3tpeed8QxXGmJpWa73AKQTZeo85Xy5QnT93CovLaaFTVheushQFleQJCT4y
         bnAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794723084; x=1795327884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tAc8EDwX+oraDK+6dFO3Rvp07/tBaltgJEnu0lCCOi8=;
        b=den2eoe6LxoQJC4VvbVpPcJJXsqRxT+tYWKFKefeQApmBBanJibg89PIyC8kK/6lNn
         APpzgg4kcwCaFzWK0MyGzF8dmKSkpiy8nGvIyN8pexbttQisBOTGIR8viF+tXZDfS1wD
         MZMFS5leJKd0YQyOkkZMzJRBWcTJF6grtCvuWRhoVyU8Tr4fE1X0EPMofNnsP5ihAG/u
         zgUL8VBZItAoY6kl0jSNovwkF9hWLZJfvJ8WvccE7RleGDJvrNQUToXM/w0cypANSC9R
         v8NngHPZrebMqmlPgXxSsIAPlcxaVfn4p6N3wzgcPd2NRkoSngWBCM6THgJtcjZIEPjM
         VyyA==
X-Forwarded-Encrypted: i=1; AL+hErFbx6NBrKwqNiU9dGY1mJFBjHAYqBIapj3Oyy8NbCYejj/FQ0d+BzqrRSDC0NnIF53rJrHkUJNOfcW8Qg==@lists.linux.dev
X-Gm-Message-State: APuU4Z/xn/xxuFH1lA+rnZQ8EuosDHevUrWNm7DbUfSDy2y1T65IkXBO
	Oqa38mQAVFRx38cHGMUYL74ZkBRW3XNnikaxD90fe4gBiL5/XiAK6BbC
X-Gm-Gg: AYBFou25Y1aKoWbLDCEpAoDEpSv7AJxQzXb4abEUa4c5VDb6NUEhObAfFukMnplE9eB
	H4j2RdecTatK8jkVEqwjvLPe6aX97+oIoqTye3Zx8QfQ/L36KfXxFoWza9+hiGX2JqHo1t4xfu1
	3165RGqT69GE2R2CDpWZrhKh1OOsdALNvAfBrdj/uT8Z76UsstMnecZ4bMhMu27hevMx/2639Lm
	1lxOnlxseC7zALZvVuT87LdbJUHpcZaBqxVwNad1l5SDUL44A6NdNqopsWvURvt7yVQUOBZYnwD
	JvkEZu8S11t0vLDMwjByxrf1bG9opsRUjOpHOB55byDge8Iw0oAsjZmq1fU7hzJ4BIXqvc9urNA
	7GTHg+p0Lh6DwOwnTJr56lhLFTB0dM9ENlt0SEAaZTBGhy/gdia80QBSQMnm+7Qw+SvVsB3N46S
	KBwGsrz+4ZFn3ieI+KFAl2G1WwNyFDll1eswrleiTpm+6hvDYyypSoiBFCszKlDBfQvhI7nD1Pa
	taynwGgYjRmjuMWMJJy8YslsGi0oK6UKTXNhtVZshf4Q5In5+39l15ohA3FaFiu71yedU5F5kIO
	lOUq4Q+sK5fjbHOf8NuufHkq8N6/yYxYkoO9jFICtUPcu95akJ4uQCDF8yqYcFP4GhLSvNwb8Wn
	10wncdhNEtXwV0ZeU9DWCB3zV+3iSMRKPJatyzkBDgSdybT72mvCI7FQGRYNWSAdU/NbZcG6kUr
	TpBAVPjIWn2M6WnP4kA7gQHzaA2INiC6PzhAYtJhiRx/nRHyXAjW5NHakuDGLXHcZll7KTIkQez
	amFahSl5V4eMA==
X-Received: by 2002:a05:600c:4f90:b0:4a2:8c5:5e5 with SMTP id 5b1f17b1804b1-4bb55a47680mr145173255e9.7.1794723083470;
        Sat, 14 Nov 2026 22:11:23 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5ba25b50sm139331075e9.14.2026.11.14.22.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 22:11:23 -0800 (PST)
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
Subject: [PATCH v3 2/8] clk: sunxi-ng: de2: Export register regmap for DE33
Date: Sun, 15 Nov 2026 07:10:56 +0100
Message-ID: <20261115061102.229680-3-jernej.skrabec@gmail.com>
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

The DE33 clock driver presets the plane mapping, which is not something
that a clock driver should do. Remove that and export the mapping
registers through a regmap instead, so the DRM driver can set them
properly.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c | 43 ++++++++++++++++++++++++++--
 1 file changed, 40 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
index 6ec6c0dc4c26..f17570efafaa 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
@@ -9,6 +9,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/reset.h>
 
 #include "ccu_common.h"
@@ -283,6 +284,36 @@ static const struct sunxi_ccu_desc sun50i_h616_de33_clk_desc = {
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
@@ -336,13 +367,19 @@ static int sunxi_de2_clk_probe(struct platform_device *pdev)
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
 	}
 
 	ret = devm_sunxi_ccu_probe(&pdev->dev, reg, ccu_desc);
-- 
2.43.0

